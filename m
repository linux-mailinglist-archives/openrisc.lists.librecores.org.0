Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 97D9C4824B3
	for <lists+openrisc@lfdr.de>; Fri, 31 Dec 2021 17:04:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1BCAC24313;
	Fri, 31 Dec 2021 17:04:46 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 0F035235E9
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 17:04:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6AF9B81DAB
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 16:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E77BC36AEF
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640966682;
 bh=pu3EOtLhubDoxaVwiYbh4e/NfH+lhjOkYe7VbmME5Z0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Euh2o2Kkz1tmQ8C8kKXTGxu9k+XiPQd+GTU54XC5K+WvaDvKNBp4YA1NTwxkHcNrP
 dN47x3ffGu9ycdEJVDOlkzGkBJEPoC5cg21t4SdMPAJxw5N1HvjiQJQphKfJiyGs6d
 uf5CS42EjMWWThugXEOPo5BtQq8sv7Lw4mktm6zLDmn8PHcqz1yH+wJt3hrDuHKTam
 9RS/G+HSoRiRErAy4zigA/AJavxFLKXIg+nWKjqsR7HmcihUHbUG+6azkLMjsxNimi
 ZfE4/FQxcZ6oBAiopKW4TjkRqnEpYlwvKoYfJ5kycPYcGxuez6Btxz414c9sAZtT8l
 2tJgQu9p9VY/g==
Received: by mail-lf1-f53.google.com with SMTP id bp20so60957920lfb.6
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 08:04:42 -0800 (PST)
X-Gm-Message-State: AOAM531YoQKAX/WYgsZMI9FJ2SUd5WSCqDYTrS7VcNxw9HRTzmvfNLWH
 PVb3jFHLK6VS3XbwrxGNjnLARVLJUJkaaKjpAgg=
X-Google-Smtp-Source: ABdhPJzApDVGjcuVEHw18tz1R9gDPlbk/Ui+m3pYQWhrQTDSy0tEhDoMzOEccUFjcDO7rPU48bSeyrks7IEcpaugXLU=
X-Received: by 2002:adf:f051:: with SMTP id t17mr29442418wro.192.1640966669503; 
 Fri, 31 Dec 2021 08:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
 <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
In-Reply-To: <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 31 Dec 2021 11:04:12 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
Message-ID: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [OpenRISC] [RFC 02/32] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
X-BeenThere: openrisc@lists.librecores.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Discussion around the OpenRISC processor
 <openrisc.lists.librecores.org>
List-Unsubscribe: <https://lists.librecores.org/options/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=unsubscribe>
List-Archive: <http://lists.librecores.org/pipermail/openrisc/>
List-Post: <mailto:openrisc@lists.librecores.org>
List-Help: <mailto:openrisc-request@lists.librecores.org?subject=help>
List-Subscribe: <https://lists.librecores.org/listinfo/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux <sparclinux@vger.kernel.org>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 alpha <linux-alpha@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBEZWMgMjksIDIwMjEgYXQgMTA6NDQgUE0gTWljaGFlbCBTY2htaXR6IDxzY2htaXR6
bWljQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQW0gMzAuMTIuMjAyMSB1bSAxNDo0OCBzY2hyaWViIEFy
bmQgQmVyZ21hbm46Cj4gPiBPbiBUdWUsIERlYyAyOCwgMjAyMSBhdCAxMToxNSBQTSBNaWNoYWVs
IFNjaG1pdHogPHNjaG1pdHptaWNAZ21haWwuY29tPiB3cm90ZToKPiA+IFdoYXQgc29tZSBvdGhl
ciBhcmNoaXRlY3R1cmVzIGRvIGlzIHRvIHJlbHkgb24gaW5iKCkvb3V0YigpIHRvIGhhdmUgYQo+
ID4gemVyby1iYXNlZCBvZmZzZXQsIGFuZCB1c2UgYW4gaW9fb2Zmc2V0IGluIFBDSSBidXNlcyB0
byBlbnN1cmUgdGhhdCBhCj4gPiBsb3cgcG9ydCBudW1iZXIgb24gdGhlIGJ1cyBnZXRzIHRyYW5z
bGF0ZWQgaW50byBhIHBvaW50ZXIgdmFsdWUgZm9yIHRoZQo+ID4gdmlydHVhbCBtYXBwaW5nIGlu
IHRoZSBrZXJuZWwsIHdoaWNoIGlzIHRoZW4gcmVwcmVzZW50ZWQgYXMgYW4gdW5zaWduZWQKPiA+
IGludC4KPgo+IE01NHh4IGRvZXMganVzdCB0aGF0IGZvciBDb2xkZmlyZToKPgo+IGFyY2gvbTY4
ay9pbmNsdWRlL2FzbS9pb19uby5oOgo+ICNkZWZpbmUgUENJX0lPX1BBICAgICAgIDB4ZjgwMDAw
MDAgICAgICAgICAgICAgIC8qIEhvc3QgcGh5c2ljYWwgYWRkcmVzcyAqLwo+Cj4gKHVzZWQgdG8g
c2V0IFBDSSBCQVIgbWFwcGluZ3MsIHNvIG1hdGNoZXMgeW91ciBkZWZpbml0aW9uIGFib3ZlKS4K
CkkgdGhpbmsgY29sZGZpcmUgZ2V0cyBpdCByaWdodCBoZXJlLCB1c2luZyBQQ0lfSU9CQVNFIHRv
IGZpbmQgdGhlIHN0YXJ0IG9mCnRoZSB3aW5kb3cgYW5kIGEgemVybyBpb19vZmZzZXQ6CgojZGVm
aW5lIFBDSV9JT0JBU0UgKCh2b2lkIF9faW9tZW0gKikgUENJX0lPX1BBKQoKPiBBbGwgb3RoZXIg
KE1NVSkgbTY4ayB1c2VycyBvZiBpbmIoKS9vdXRiKCkgYXBwbHkgYW4gaW9fb2Zmc2V0IGluIHRo
ZQo+IHBsYXRmb3JtIHNwZWNpZmljIGFkZHJlc3MgdHJhbnNsYXRpb246Cj4KPiBhcmNoL202OGsv
aW5jbHVkZS9hc20vaW9fbW0uaDoKPgo+ICNkZWZpbmUgcTQwX2lzYV9pb19iYXNlICAweGZmNDAw
MDAwCj4gI2RlZmluZSBlbmVjX2lzYV9yZWFkX2Jhc2UgIDB4ZmZmYTAwMDAKPiAjZGVmaW5lIGVu
ZWNfaXNhX3dyaXRlX2Jhc2UgMHhmZmZiMDAwMAo+Cj4gYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2Ft
aWdheWxlLmg6Cj4KPiAjZGVmaW5lIEdBWUxFX0lPICAgICAgICAgICAgICAgICgweGEyMDAwMCt6
VHdvQmFzZSkgICAgIC8qIDE2Yml0IGFuZAo+IGV2ZW4gOGJpdCByZWdpc3RlcnMgKi8KPiAjZGVm
aW5lIEdBWUxFX0lPXzhCSVRPREQgICAgICAgICgweGEzMDAwMCt6VHdvQmFzZSkgICAgIC8qIG9k
ZCA4Yml0Cj4gcmVnaXN0ZXJzICovCj4KPiAoYWxsIGNvbnN0YW50cyB1c2VkIGluIGFkZHJlc3Mg
dHJhbnNsYXRpb24gaW5saW5lcyB0aGF0IGFyZSB1c2VkIGJ5IHRoZQo+IG02OGsgaW5iKCkvb3V0
YigpIG1hY3JvcyAtIHlvdSBjYW4gY2FsbCB0aGF0IHRoZSBwb29yIG1hbidzIHZlcnNpb24gb2YK
PiBQQ0kgQkFSIG1hcHBpbmdzIC4uLikuCgpUaGlzIHN0aWxsIGxvb2tzIGxpa2UgdGhlIHNhbWUg
dGhpbmcgdG8gbWUsIHdoZXJlIHlvdSBoYXZlIGluYigpIHRha2UgYQp6ZXJvLWJhc2VkIHBvcnQg
bnVtYmVyLCBub3QgYSBwb2ludGVyLiBUaGUgZWZmZWN0IGlzIHRoZSBzYW1lIGFzIHRoZQpjb2xk
ZmlyZSB2ZXJzaW9uLCBpdCBqdXN0IHVzZXMgYSBjdXN0b20gaW5saW5lIGZ1bmN0aW9uIGluc3Rl
YWQgb2YgdGhlCnZlcnNpb24gZnJvbSBhc20tZ2VuZXJpYy9pby5oLgoKPiBTbyBhcyBsb25nIGFz
IHN1cHBvcnQgZm9yIGFueSBvZiB0aGUgbTY4ayBQQ0kgb3IgSVNBIGJyaWRnZXMgaXMgc2VsZWN0
ZWQKPiBpbiB0aGUga2VybmVsIGNvbmZpZywgdGhlIGFwcHJvcHJpYXRlIElPIHNwYWNlIG1hcHBp
bmcgaXMgYXBwbGllZC4gSWYgbm8KPiBzdXBwb3J0IGZvciBQQ0kgb3IgSVNBIGJyaWRnZXMgaXMg
c2VsZWN0ZWQsIHdlIGFscmVhZHkgZmFsbCBiYWNrIHRvIHplcm8KPiBvZmZzZXQgbWFwcGluZyAo
YnV0IGFzIGZhciBhcyBJIGNhbiB0ZWxsLCBpdCBzaG91bGRuJ3QgYmUgcG9zc2libGUgdG8KPiBi
dWlsZCBhIGtlcm5lbCB3aXRob3V0IGJyaWRnZSBzdXBwb3J0IGJ1dCBkcml2ZXJzIHRoYXQgcmVx
dWlyZSBpdCkuCgpSaWdodC4KCj4gPiBBcyB0aGlzIGlzIGluZGlzdGluZ3Vpc2hhYmxlIGZyb20g
YXJjaGl0ZWN0dXJlcyB0aGF0IGp1c3QgZG9uJ3QgaGF2ZQo+ID4gYSBiYXNlIGFkZHJlc3MgZm9y
IEkvTyBwb3J0cyAod2UgdW5mb3J0dW5hdGVseSBwaWNrZWQgMCBhcyB0aGUgZGVmYXVsdAo+ID4g
UENJX0lPQkFTRSB2YWx1ZSksIG15IHN1Z2dlc3Rpb24gd2FzIHRvIHN0YXJ0IG1hcmtpbmcgYXJj
aGl0ZWN0dXJlcwo+ID4gdGhhdCBtYXkgaGF2ZSB0aGlzIHByb2JsZW0gYXMgdXNpbmcgSEFTX0lP
UE9SVCBpbiBvcmRlciB0byBrZWVwCj4gPiB0aGUgZXhpc3RpbmcgYmVoYXZpb3IgdW5jaGFuZ2Vk
LiBJZiBtNjhrIGRvZXMgbm90IHN1ZmZlciBmcm9tIHRoaXMsCj4gPiBtYWtpbmcgSEFTX0lPUE9S
VCBjb25kaXRpb25hbCBvbiB0aG9zZSBjb25maWcgb3B0aW9ucyB0aGF0IGFjdHVhbGx5Cj4gPiBu
ZWVkIGl0IHdvdWxkIG9mIGNvdXJzZSBiZSBiZXN0Lgo+Cj4gRm9sbG93aW5nIHlvdXIgZGVzY3Jp
cHRpb24sIEhBU19JT1BPUlQgd291bGQgYmUgcmVxdWlyZWQgZm9yIG5laXRoZXIgb2YKPiBQQ0ks
IElTQSBvciBBVEFSSV9ST01fSVNBID8/CgpGb3IgdGhlc2UgdGhyZWUgb3B0aW9ucywgd2UgZGVm
aW5pdGVseSBuZWVkIEhBU19JT1BPUlQsIHdoaWNoIHdvdWxkCmltcGx5IHRoYXQgc29tZSB2ZXJz
aW9uIG9mIGluYigpL291dGIoKSBpcyBwcm92aWRlZC4gVGhlIGRpZmZlcmVuY2UgYmV0d2Vlbgp1
c2luZyBhIGN1c3RvbSBQQ0lfSU9CQVNFIChvciBhbiBvcGVuLWNvZGVkIGVxdWl2YWxlbnQpIGFu
ZCB1c2luZwphIHplcm8gUENJX0lPQkFTRSBpbiBjb21iaW5hdGlvbiB3aXRoIHJlZ2lzdGVyaW5n
IFBDSSB1c2luZyBhIGN1c3RvbQppb19vZmZzZXQgaXMgd2hldGhlciB3ZSBjYW4gdXNlIGRyaXZl
cnMgd2l0aCBoYXJkY29kZWQgcG9ydCBudW1iZXJzLgpUaGVzZSBzaG91bGQgZGVwZW5kIG9uIGEg
ZGlmZmVyZW50IEtjb25maWcgc3ltYm9sIHRvIGJlIGludHJvZHVjZWQKKENPTkZJR19IQVJEQ09E
RURfSU9QT1JUIG9yIHNpbWlsYXIpIG9uY2Ugd2UgaW50cm9kdWNlIHRoZW0sCmFuZCB5b3UgY291
bGQgZGVjaWRlIGZvciBtNjhrIHdoZXRoZXIgdG8gYWxsb3cgdGhvc2Ugb3Igbm90LCBJIHdvdWxk
CmFzc3VtZSB5b3UgZG8gd2FudCB0aGVtIGluIG9yZGVyIHRvIHVzZSBjZXJ0YWluIGxlZ2FjeSBJ
U0EgZHJpdmVycy4KCiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
