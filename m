Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5287F480E3B
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 01:26:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 00D73202A8;
	Wed, 29 Dec 2021 01:26:08 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 636B320A95
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 17:32:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10330612B1;
 Tue, 28 Dec 2021 16:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C686CC36AE8;
 Tue, 28 Dec 2021 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640709137;
 bh=wYaH3iu50Xg/A/DNjyHFOWIgZ4rByTFlvgaE/FMZWqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BTzyk4t+6+nRs9+zo0NSJy02+zZ1BbNUT8+XJkgAXThbIqJ8Tu8Bp03GHCGKlrzYX
 f6mxa+4pitBIl4IybQMSKiUDklqv+EWiC5aYtEZ6X8W5ej/Y8IazWuQESnlWIxcuv8
 qpU3CbEDSyN9MmSRXbz0D4xklNr1SXs2T+TD8ORlrOWK73AvxU+cJQKO+CcdLaW79G
 ATgeIIpXvKMfQoRIkEcfC8ZFCuCdHf6v7cpx9bOyNNQeNgeuyk4t75tVGNPued/kzl
 l93VJjvTGGYCbrQFgpNex301S0U5MY1BOFyW0fzdInsg4whSwmaK2ya34ydGPe6YZY
 2nZg+WlyMxMSA==
Date: Tue, 28 Dec 2021 17:32:02 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <20211228173202.678baa44@coco.lan>
In-Reply-To: <20211227164317.4146918-3-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Dec 2021 01:26:06 +0100
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chris Zankel <chris@zankel.net>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
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

RW0gTW9uLCAyNyBEZWMgMjAyMSAxNzo0Mjo0NyArMDEwMApOaWtsYXMgU2NobmVsbGUgPHNjaG5l
bGxlQGxpbnV4LmlibS5jb20+IGVzY3JldmV1OgoKPiBXZSBpbnRyb2R1Y2UgYSBuZXcgSEFTX0lP
UE9SVCBLY29uZmlnIG9wdGlvbiB0byBnYXRlIHN1cHBvcnQgZm9yCj4gSS9PIHBvcnQgYWNjZXNz
LiBJbiBhIGZ1dHVyZSBwYXRjaCBIQVNfSU9QT1JUPW4gd2lsbCBkaXNhYmxlIGNvbXBpbGF0aW9u
Cj4gb2YgdGhlIEkvTyBhY2Nlc3NvciBmdW5jdGlvbnMgaW5iKCkvb3V0YigpIGFuZCBmcmllbmRz
IG9uIGFyY2hpdGVjdHVyZXMKPiB3aGljaCBjYW4gbm90IG1lYW5pbmdmdWxseSBzdXBwb3J0IGxl
Z2FjeSBJL08gc3BhY2VzLiBPbiB0aGVzZSBwbGF0Zm9ybXMKPiBpbmIoKS9vdXRiKCkgZXRjIGFy
ZSBjdXJyZW50bHkganVzdCBzdHVicyBpbiBhc20tZ2VuZXJpYy9pby5oIHdoaWNoIHdoZW4KPiBj
YWxsZWQgd2lsbCBjYXVzZSBhIE5VTEwgcG9pbnRlciBhY2Nlc3Mgd2hpY2ggc29tZSBjb21waWxl
cnMgYWN0dWFsbHkKPiBkZXRlY3QgYW5kIHdhcm4gYWJvdXQuCj4gCj4gVGhlIGRlcGVuZGVuY2ll
cyBvbiBIQVNfSU9QT1JUIGluIGRyaXZlcnMgYXMgd2VsbCBhcyBpZmRlZnMgZm9yCj4gSEFTX0lP
UE9SVCBzcGVjaWZpYyBzZWN0aW9ucyB3aWxsIGJlIGFkZGVkIGluIHN1YnNlcXVlbnQgcGF0Y2hl
cyBvbgo+IGEgcGVyIHN1YnN5c3RlbSBiYXNpcy4gVGhlbiBhIGZpbmFsIHBhdGNoIHdpbGwgaWZk
ZWYgdGhlIEkvTyBhY2Nlc3MKPiBmdW5jdGlvbnMgb24gSEFTX0lPUE9SVCB0aHVzIHR1cm5pbmcg
YW55IHVzZSBub3QgZ2F0ZWQgYnkgSEFTX0lPUE9SVAo+IGludG8gYSBjb21waWxlLXRpbWUgd2Fy
bmluZy4KPiAKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSGstPXdnODBq
ZT1LN21hZEY0ZTdXclJOcDM3ZTNxaDZ5MTBTdmhkYzdPOFNaXy04Z0BtYWlsLmdtYWlsLmNvbS8K
PiBDby1kZXZlbG9wZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogTmlrbGFzIFNjaG5lbGxlIDxzY2huZWxsZUBsaW51eC5pYm0uY29tPgoKLi4uCgo+IEBAIC00
ODYsNiArNDg3LDkgQEAgY29uZmlnIEhBU19JT01FTQo+ICAJZGVwZW5kcyBvbiAhTk9fSU9NRU0K
PiAgCWRlZmF1bHQgeQo+ICAKPiArY29uZmlnIEhBU19JT1BPUlQKPiArCWRlZl9ib29sIElTQSB8
fCBMRUdBQ1lfUENJCj4gKwoKVGhhdCBkb2Vzbid0IHNvdW5kIHJpZ2h0LiAKClRoZSBvbmx5IGRl
cGVuZGVuY3kgZm9yIExFR0FDWV9QQ0kgaXMgUENJLiBJZiBvbmUgc2VsZWN0cyBMRUdBQ1lfUENJ
Cm9uIGFuIGFyY2hpdGVjdHVyZSB0aGF0IGRvZXNuJ3Qgc3VwcG9ydCBpdCwgdGhpcyB3aWxsIGNh
dXNlIHByb2JsZW1zLgoKSW5zdGVhZCwgSEFTX0lPUE9SVCBzaG91bGQgYmUgc2VsZWN0ZWQgYXQg
YXJjaGl0ZWN0dXJlIGxldmVsLCBhbmQKdGhlIGRlcGVuZGVuY3kgaGVyZSBzaG91bGQgYmUganVz
dCB0aGUgb3Bwb3NpdGU6IExFR0FDWV9BUEkgc2hvdWxkCmRlcGVuZHMgb24gSEFTX0lPUE9SVC4K
ClRoYW5rcywKTWF1cm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
