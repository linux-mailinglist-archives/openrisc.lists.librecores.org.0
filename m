Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 77D7B480F51
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 04:41:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 257C3242BB;
	Wed, 29 Dec 2021 04:41:43 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 4CB15213A6
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 04:41:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1851B817AB
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 03:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC260C36AEE
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 03:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749299;
 bh=sMe3q8ad98okMs4HLXxIEZG5eWgoWBzrycggRgzNn0g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rMRnM0sy47mX6uuR7D+TwrJ7y7ozZF3yZLCEMGxXEAotZDKwmzaKKtYWX6ysJceh8
 TEgR6eIsrI8xWFWg/lZVP/llG47/437lCwf9YPuoPffvBVzcDoGP/h9e3txqXfKtm2
 bBedJQfjQDI5eZt6y4NhwsbcUGne/0qnzJYb4R+94+vUQcwataYvetF5FZYNa7PQlX
 2SoGPzrWz6M4JhB1Inz0mehc6DK5WFlSrG9Tjc3aHSv6kq08qajpcv/QyixqT9BYGC
 HZVAGqx1AU7WJYM9/X+k/w/xfA5rIX+vu4VnlvLe8n7xgxofu9qDw3fT1Vrp/ZIQTf
 2SrG3XIDAsb1A==
Received: by mail-wm1-f49.google.com with SMTP id c66so12762064wma.5
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 19:41:39 -0800 (PST)
X-Gm-Message-State: AOAM531oBlqiNZTeOA9JbV4Rppf6jy/ozpfj+UEm9Tnpbl4RV/p+adou
 YoxVpxCA8sRvkKgWb36VL3D7wQev2oOfECRHMB4=
X-Google-Smtp-Source: ABdhPJwExVf1S5yWbdFaQXvSS7m+9fv3xxH0eSVAhqrz/dUiLqmyF5p5xrdPthuPvZdKvgQOvhEXVEuNpJp0LGzgDhQ=
X-Received: by 2002:a1c:7418:: with SMTP id p24mr20244545wmc.82.1640749287841; 
 Tue, 28 Dec 2021 19:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
In-Reply-To: <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Dec 2021 22:41:18 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
Message-ID: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMjgsIDIwMjEgYXQgODoyMCBQTSBNaWNoYWVsIFNjaG1pdHogPHNjaG1pdHpt
aWNAZ21haWwuY29tPiB3cm90ZToKPiBBbSAyOC4xMi4yMDIxIHVtIDIzOjA4IHNjaHJpZWIgR2Vl
cnQgVXl0dGVyaG9ldmVuOgo+ID4gT24gTW9uLCBEZWMgMjcsIDIwMjEgYXQgNTo0NCBQTSBOaWts
YXMgU2NobmVsbGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4+IFdlIGludHJv
ZHVjZSBhIG5ldyBIQVNfSU9QT1JUIEtjb25maWcgb3B0aW9uIHRvIGdhdGUgc3VwcG9ydCBmb3IK
PiA+PiBJL08gcG9ydCBhY2Nlc3MuIEluIGEgZnV0dXJlIHBhdGNoIEhBU19JT1BPUlQ9biB3aWxs
IGRpc2FibGUgY29tcGlsYXRpb24KPiA+PiBvZiB0aGUgSS9PIGFjY2Vzc29yIGZ1bmN0aW9ucyBp
bmIoKS9vdXRiKCkgYW5kIGZyaWVuZHMgb24gYXJjaGl0ZWN0dXJlcwo+ID4+IHdoaWNoIGNhbiBu
b3QgbWVhbmluZ2Z1bGx5IHN1cHBvcnQgbGVnYWN5IEkvTyBzcGFjZXMuIE9uIHRoZXNlIHBsYXRm
b3Jtcwo+ID4+IGluYigpL291dGIoKSBldGMgYXJlIGN1cnJlbnRseSBqdXN0IHN0dWJzIGluIGFz
bS1nZW5lcmljL2lvLmggd2hpY2ggd2hlbgo+ID4+IGNhbGxlZCB3aWxsIGNhdXNlIGEgTlVMTCBw
b2ludGVyIGFjY2VzcyB3aGljaCBzb21lIGNvbXBpbGVycyBhY3R1YWxseQo+ID4+IGRldGVjdCBh
bmQgd2FybiBhYm91dC4KPiA+Pgo+ID4+IFRoZSBkZXBlbmRlbmNpZXMgb24gSEFTX0lPUE9SVCBp
biBkcml2ZXJzIGFzIHdlbGwgYXMgaWZkZWZzIGZvcgo+ID4+IEhBU19JT1BPUlQgc3BlY2lmaWMg
c2VjdGlvbnMgd2lsbCBiZSBhZGRlZCBpbiBzdWJzZXF1ZW50IHBhdGNoZXMgb24KPiA+PiBhIHBl
ciBzdWJzeXN0ZW0gYmFzaXMuIFRoZW4gYSBmaW5hbCBwYXRjaCB3aWxsIGlmZGVmIHRoZSBJL08g
YWNjZXNzCj4gPj4gZnVuY3Rpb25zIG9uIEhBU19JT1BPUlQgdGh1cyB0dXJuaW5nIGFueSB1c2Ug
bm90IGdhdGVkIGJ5IEhBU19JT1BPUlQKPiA+PiBpbnRvIGEgY29tcGlsZS10aW1lIHdhcm5pbmcu
Cj4gPj4KPiA+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSGstPXdnODBq
ZT1LN21hZEY0ZTdXclJOcDM3ZTNxaDZ5MTBTdmhkYzdPOFNaXy04Z0BtYWlsLmdtYWlsLmNvbS8K
PiA+PiBDby1kZXZlbG9wZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogTmlrbGFzIFNjaG5lbGxlIDxzY2huZWxsZUBsaW51eC5pYm0uY29tPgo+ID4K
PiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+Cj4gPj4gLS0tIGEvYXJjaC9tNjhrL0tjb25m
aWcKPiA+PiArKysgYi9hcmNoL202OGsvS2NvbmZpZwo+ID4+IEBAIC0xNiw2ICsxNiw3IEBAIGNv
bmZpZyBNNjhLCj4gPj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19DUFVfREVWSUNFUwo+ID4+ICAg
ICAgICAgc2VsZWN0IEdFTkVSSUNfSU9NQVAKPiA+PiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0lS
UV9TSE9XCj4gPj4gKyAgICAgICBzZWxlY3QgSEFTX0lPUE9SVAo+ID4+ICAgICAgICAgc2VsZWN0
IEhBVkVfQU9VVCBpZiBNTVUKPiA+PiAgICAgICAgIHNlbGVjdCBIQVZFX0FTTV9NT0RWRVJTSU9O
Uwo+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfREVCVUdfQlVHVkVSQk9TRQo+ID4KPiA+IFRoaXMg
bG9va3Mgd2F5IHRvbyBicm9hZCB0byBtZTogbW9zdCBtNjhrIHBsYXRmb3JtIGRvIG5vdCBoYXZl
IEkvTwo+ID4gcG9ydCBhY2Nlc3Mgc3VwcG9ydC4KPiA+Cj4gPiBNeSBndXQgZmVlbGluZyBzYXlz
Ogo+ID4KPiA+ICAgICBzZWxlY3QgSEFTX0lPUE9SVCBpZiBQQ0kgfHwgSVNBCj4gPgo+ID4gYnV0
IHRoYXQgbWlnaHQgbWlzcyBzb21lIGludHJpY2F0ZSBkZXRhaWxzLi4uCj4KPiBJbiBwYXJ0aWN1
bGFyLCB0aGlzIG1pc3NlcyB0aGUgQXRhcmkgUk9NIHBvcnQgSVNBIGFkYXB0ZXIgY2FzZSAtCj4K
PiAgICAgICAgIHNlbGVjdCBIQVNfSU9QT1JUIGlmIFBDSSB8fCBJU0EgfHwgQVRBUklfUk9NX0lT
QQo+Cj4gbWlnaHQgZG8gaW5zdGVhZC4KClJpZ2h0LCBtYWtlcyBzZW5zZS4gSSBoYWQgc3VnZ2Vz
dGVkIHRvIGdvIHRoZSBlYXN5IHdheSBhbmQgYXNzdW1lIHRoYXQKZWFjaCBhcmNoaXRlY3R1cmUg
d291bGQgc2VsZWN0IEhBU19JT1BPUlQgaWYgYW55IGNvbmZpZ3VyYXRpb24gc3VwcG9ydHMKaXQs
IGJ1dCBpdCBsb29rcyBsaWtlIGZvciBtNjhrIHRoZXJlIGlzIGEgY2xlYXJseSBkZWZpbmVkIHNl
dCBvZiBwbGF0Zm9ybXMgdGhhdApkby4KCk5vdGUgdGhhdCBmb3IgdGhlIHBsYXRmb3JtcyB0aGF0
IGRvbid0IHNldCBhbnkgb2YgdGhlIHRocmVlIHN5bWJvbHMsIHRoZQpmYWxsYmFjayBtYWtlcyBp
bmIoKSBhbiBhbGlhcyBmb3IgcmVhZGIoKSB3aXRoIGEgZGlmZmVyZW50IGFyZ3VtZW50IHR5cGUs
CnNvIHRoZXJlIG1heSBiZSBtNjhrIHNwZWNpZmljIGRyaXZlcnMgdGhhdCByZWx5IG9uIHRoaXMs
IGJ1dCB0aG9zZSB3b3VsZAphbHJlYWR5IGJlIGJyb2tlbiBpZiBBVEFSSV9ST01fSVNBIGlzIHNl
dC4KCiAgICAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
