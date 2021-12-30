Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E86BC481906
	for <lists+openrisc@lfdr.de>; Thu, 30 Dec 2021 04:45:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 920912431B;
	Thu, 30 Dec 2021 04:45:17 +0100 (CET)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mail.librecores.org (Postfix) with ESMTPS id 0C978240ED
 for <openrisc@lists.librecores.org>; Thu, 30 Dec 2021 04:45:15 +0100 (CET)
Received: by mail-pf1-f181.google.com with SMTP id u20so20279602pfi.12
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 19:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=5E1c4uav1w29ypwAHwbdxz4O+xfES0SpMBM/hIdsoE0=;
 b=WbuJzdZv6QdxI4sm1uAN5RK2dB/vxRRAL3AviYD6SfM29AlUSb5I5hMDIqugVgl6q5
 V/7xuA/EOm2Dv0zChCOeqZsFvsMIm7UeuFMBWZAvuAVpy5VWIbHsXe0LO+k7wbZT9XA+
 bKo1QUX3kp7MeKzCaqX8Qy0FWsFH26Y65uXLR/vaqgIBvGoVcBkMmv2ha7gL/lhC+wsc
 9IDoT4MY3JFxvbdNQp9rzst5K+jmfgdTuMjjeHVOo5kymPqz9E6EMIfWlGg4R2VCRufH
 r5zUkrJO0E2MYAcArK0leS4VFV7M5hYte5KRuaiLgKGVmb4cT/v9GFrgNcGmE2q7OUEY
 IqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=5E1c4uav1w29ypwAHwbdxz4O+xfES0SpMBM/hIdsoE0=;
 b=n+EKWSJBVQsqJUQgFyJ1WxBAXYecydnjjl3eFNhhghIdom9BxeOMPv32RTA1j1dgL1
 ukyM9BuyCnLJZUKIPfJ+bICBrEVH72nu6lzaNSNOMZMf9m5ZbQfYBbgAFf3x9miWBG0V
 tWIUq6I1pP8rzNZ+skTnBAisSL61DfZCybB585hL2TQfq1Ai4QYY2/iwFCFBPP8bmhbu
 265+bU5PUHKToVUr1bz3FcbDJxrKx6bPgmSiv89caSKtydGCQUjqh43DFpHU9hjTNOHe
 d8OQJt4ARv8oDkThhANlIdnB4sy3o9bTdIYIZPobIWMHiGmWGi2iFTrrA74PMlfxrdtH
 Oo/Q==
X-Gm-Message-State: AOAM533uJCXH4ZI2AGqQ0NT82dSMMXYP5ET8gfMpt9YKuLrExxEwyCJ6
 N2P767FtKZziSe4BiVY06/o=
X-Google-Smtp-Source: ABdhPJzhu0vR0ubHbZDDMdnE240kX84aNyi3i3N9D1mBlwe522lCZMc1R9id41niT15FZfmjs4s+bA==
X-Received: by 2002:a63:10a:: with SMTP id 10mr26111733pgb.170.1640835913587; 
 Wed, 29 Dec 2021 19:45:13 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 pg12sm29480602pjb.4.2021.12.29.19.44.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Dec 2021 19:45:12 -0800 (PST)
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
Date: Thu, 30 Dec 2021 16:44:45 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCkFtIDMwLjEyLjIwMjEgdW0gMTQ6NDggc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+
IE9uIFR1ZSwgRGVjIDI4LCAyMDIxIGF0IDExOjE1IFBNIE1pY2hhZWwgU2NobWl0eiA8c2NobWl0
em1pY0BnbWFpbC5jb20+IHdyb3RlOgo+PiBBbSAyOS4xMi4yMDIxIHVtIDE2OjQxIHNjaHJpZWIg
QXJuZCBCZXJnbWFubjoKPj4+IE9uIFR1ZSwgRGVjIDI4LCAyMDIxIGF0IDg6MjAgUE0gTWljaGFl
bCBTY2htaXR6IDxzY2htaXR6bWljQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEknZCBob3BlIG5vdCAt
IHdlIHNwZW50IHNvbWUgZWZmb3J0IHRvIG1ha2Ugc3VyZSBzZXR0aW5nIEFUQVJJX1JPTV9JU0EK
Pj4gZG9lcyBub3QgYWZmZWN0IG90aGVyIG02OGsgcGxhdGZvcm1zIHdoZW4gZS5nLiBidWlsZGlu
ZyBtdWx0aXBsYXRmb3JtCj4+IGtlcm5lbHMuCj4KPiBPawo+Cj4+IFJlcGxhY2luZyBpbmIoKSBi
eSByZWFkYigpIHdpdGhvdXQgYW55IGFkZHJlc3MgdHJhbnNsYXRpb24gd29uJ3QgZG8gbXVjaAo+
PiBnb29kIGZvciBtNjhrIHRob3VnaCAtIGFkZHJlc3NlcyBpbiB0aGUgdHJhZGl0aW9uYWwgSVNB
IEkvTyBwb3J0IHJhbmdlCj4+IHdvdWxkIGhpdCB0aGUgKHVubWFwcGVkKSB6ZXJvIHBhZ2UuCj4K
PiBDb3JyZWN0LCB0aGlzIGlzIGV4YWN0bHkgdGhlIHByb2JsZW0gdGhhdCBOaWtsYXMgaXMgdHJ5
aW5nIHRvIHNvbHZlIGhlcmU6Cj4gd2UgZG8gaGF2ZSBkcml2ZXJzIHRoYXQgaGl0IHRoaXMgYnVn
LCBhbmQgb24gczM5MCBjbGFuZyBhY3R1YWxseSBwcm9kdWNlcwo+IGEgY29tcGlsZS10aW1lIGVy
cm9yIGZvciBkcml2ZXJzIHRoYXQgY2F1c2UgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UKPiB0
aGlzIHdheS4KClRoYW5rcyBmb3IgY2xhcmlmeWluZyAtIEkgb25seSBzYXcgR2VlcnQncyBDQyBh
bmQgZmFpbGVkIHRvIGdvIGJhY2sgdG8gCnRoZSBzdGFydCBvZiB0aGUgdGhyZWFkLgoKPiBXaGF0
IHNvbWUgb3RoZXIgYXJjaGl0ZWN0dXJlcyBkbyBpcyB0byByZWx5IG9uIGluYigpL291dGIoKSB0
byBoYXZlIGEKPiB6ZXJvLWJhc2VkIG9mZnNldCwgYW5kIHVzZSBhbiBpb19vZmZzZXQgaW4gUENJ
IGJ1c2VzIHRvIGVuc3VyZSB0aGF0IGEKPiBsb3cgcG9ydCBudW1iZXIgb24gdGhlIGJ1cyBnZXRz
IHRyYW5zbGF0ZWQgaW50byBhIHBvaW50ZXIgdmFsdWUgZm9yIHRoZQo+IHZpcnR1YWwgbWFwcGlu
ZyBpbiB0aGUga2VybmVsLCB3aGljaCBpcyB0aGVuIHJlcHJlc2VudGVkIGFzIGFuIHVuc2lnbmVk
Cj4gaW50LgoKTTU0eHggZG9lcyBqdXN0IHRoYXQgZm9yIENvbGRmaXJlOgoKYXJjaC9tNjhrL2lu
Y2x1ZGUvYXNtL2lvX25vLmg6CiNkZWZpbmUgUENJX0lPX1BBCTB4ZjgwMDAwMDAJCS8qIEhvc3Qg
cGh5c2ljYWwgYWRkcmVzcyAqLwoKKHVzZWQgdG8gc2V0IFBDSSBCQVIgbWFwcGluZ3MsIHNvIG1h
dGNoZXMgeW91ciBkZWZpbml0aW9uIGFib3ZlKS4KCkFsbCBvdGhlciAoTU1VKSBtNjhrIHVzZXJz
IG9mIGluYigpL291dGIoKSBhcHBseSBhbiBpb19vZmZzZXQgaW4gdGhlIApwbGF0Zm9ybSBzcGVj
aWZpYyBhZGRyZXNzIHRyYW5zbGF0aW9uOgoKYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2lvX21tLmg6
CgojZGVmaW5lIHE0MF9pc2FfaW9fYmFzZSAgMHhmZjQwMDAwMAojZGVmaW5lIGVuZWNfaXNhX3Jl
YWRfYmFzZSAgMHhmZmZhMDAwMAojZGVmaW5lIGVuZWNfaXNhX3dyaXRlX2Jhc2UgMHhmZmZiMDAw
MAoKYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2FtaWdheWxlLmg6CgojZGVmaW5lIEdBWUxFX0lPICAg
ICAgICAgICAgICAgICgweGEyMDAwMCt6VHdvQmFzZSkgICAgIC8qIDE2Yml0IGFuZCAKZXZlbiA4
Yml0IHJlZ2lzdGVycyAqLwojZGVmaW5lIEdBWUxFX0lPXzhCSVRPREQgICAgICAgICgweGEzMDAw
MCt6VHdvQmFzZSkgICAgIC8qIG9kZCA4Yml0IApyZWdpc3RlcnMgKi8KCihhbGwgY29uc3RhbnRz
IHVzZWQgaW4gYWRkcmVzcyB0cmFuc2xhdGlvbiBpbmxpbmVzIHRoYXQgYXJlIHVzZWQgYnkgdGhl
IAptNjhrIGluYigpL291dGIoKSBtYWNyb3MgLSB5b3UgY2FuIGNhbGwgdGhhdCB0aGUgcG9vciBt
YW4ncyB2ZXJzaW9uIG9mIApQQ0kgQkFSIG1hcHBpbmdzIC4uLikuCgpTbyBhcyBsb25nIGFzIHN1
cHBvcnQgZm9yIGFueSBvZiB0aGUgbTY4ayBQQ0kgb3IgSVNBIGJyaWRnZXMgaXMgc2VsZWN0ZWQg
CmluIHRoZSBrZXJuZWwgY29uZmlnLCB0aGUgYXBwcm9wcmlhdGUgSU8gc3BhY2UgbWFwcGluZyBp
cyBhcHBsaWVkLiBJZiBubyAKc3VwcG9ydCBmb3IgUENJIG9yIElTQSBicmlkZ2VzIGlzIHNlbGVj
dGVkLCB3ZSBhbHJlYWR5IGZhbGwgYmFjayB0byB6ZXJvIApvZmZzZXQgbWFwcGluZyAoYnV0IGFz
IGZhciBhcyBJIGNhbiB0ZWxsLCBpdCBzaG91bGRuJ3QgYmUgcG9zc2libGUgdG8gCmJ1aWxkIGEg
a2VybmVsIHdpdGhvdXQgYnJpZGdlIHN1cHBvcnQgYnV0IGRyaXZlcnMgdGhhdCByZXF1aXJlIGl0
KS4KCj4KPiBBcyB0aGlzIGlzIGluZGlzdGluZ3Vpc2hhYmxlIGZyb20gYXJjaGl0ZWN0dXJlcyB0
aGF0IGp1c3QgZG9uJ3QgaGF2ZQo+IGEgYmFzZSBhZGRyZXNzIGZvciBJL08gcG9ydHMgKHdlIHVu
Zm9ydHVuYXRlbHkgcGlja2VkIDAgYXMgdGhlIGRlZmF1bHQKPiBQQ0lfSU9CQVNFIHZhbHVlKSwg
bXkgc3VnZ2VzdGlvbiB3YXMgdG8gc3RhcnQgbWFya2luZyBhcmNoaXRlY3R1cmVzCj4gdGhhdCBt
YXkgaGF2ZSB0aGlzIHByb2JsZW0gYXMgdXNpbmcgSEFTX0lPUE9SVCBpbiBvcmRlciB0byBrZWVw
Cj4gdGhlIGV4aXN0aW5nIGJlaGF2aW9yIHVuY2hhbmdlZC4gSWYgbTY4ayBkb2VzIG5vdCBzdWZm
ZXIgZnJvbSB0aGlzLAo+IG1ha2luZyBIQVNfSU9QT1JUIGNvbmRpdGlvbmFsIG9uIHRob3NlIGNv
bmZpZyBvcHRpb25zIHRoYXQgYWN0dWFsbHkKPiBuZWVkIGl0IHdvdWxkIG9mIGNvdXJzZSBiZSBi
ZXN0LgoKRm9sbG93aW5nIHlvdXIgZGVzY3JpcHRpb24sIEhBU19JT1BPUlQgd291bGQgYmUgcmVx
dWlyZWQgZm9yIG5laXRoZXIgb2YgClBDSSwgSVNBIG9yIEFUQVJJX1JPTV9JU0EgPz8KCkNoZWVy
cywKCglNaWNoYWVsCgoKPgo+ICAgICAgICAgIEFybmQKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
