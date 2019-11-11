Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6D7F741F
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 70503207F8;
	Mon, 11 Nov 2019 13:37:47 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id AB2B520797
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:15:33 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8B1EE68BE1; Mon, 11 Nov 2019 11:15:31 +0100 (CET)
Date: Mon, 11 Nov 2019 11:15:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191111101531.GA12294@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-11-hch@lst.de>
 <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 10/21] asm-generic: ioremap_uc should behave
 the same with and without MMU
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTE6MDk6MDVBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBNYXliZSB3ZSBjb3VsZCBtb3ZlIHRoZSBkZWZpbml0aW9uIGludG8gdGhlIGF0eWZi
IGRyaXZlciBpdHNlbGY/Cj4gCj4gQXMgSSB1bmRlcnN0YW5kIGl0LCB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIGlvcmVtYXAoKS9pb3JlbWFwX25vY2FjaGUoKQo+IGFuZCBpb3JlbWFwX3VjKCkgb25s
eSBleGlzdHMgb24gcHJlLVBBVCB4ODYtMzIgc3lzdGVtcyAoaS5lLiA0ODYsIFA1LAo+IFBwcm8s
IFBJSSwgSzYsIFZJQSBDMyksIHdoaWxlIG9uIG1vcmUgbW9kZXJuIHN5c3RlbXMgKGFsbCBub24t
eDg2LAo+IFBlbnRpdW1JSUksIEF0aGxvbiwgVklBIEM3KSAgdGhvc2UgdGhyZWUgYXJlIG1lYW50
IHRvIGJlIHN5bm9ueW1zCj4gYW55d2F5LgoKVGhhdCdzIG5vdCBob3cgSSB1bmRlcnN0b29kIGl0
LiAgQmFzZWQgb24gdGhlIGNvZGUgYW5kIHRoZSBVQy0KZXhwbGFuYXRpb24gaW9yZW1hcF91YyBh
bHdheXMgb3ZlcnJpZGVzIHRoZSBNVFJSLCB3aGljaCBjYW4gc3RpbGwKYmUgcHJlc2VudCBvbiBt
b3JlIG1vZGVybiB4ODYgc3lzdGVtcy4gIEluIGZhY3QgSSByZW1lbWJlciBhIHBhdGNoCmZsb2F0
aW5nIGFyb3VuZCB2ZXJ5IHJlY2VudGx5IGFkZGluZyBhbm90aGVyIGlvcmVtYXBfdWMgY2FsbGVy
IGluCnNvbWUgQXRvbSBwbGF0Zm9ybSBkZXZpY2UgZHJpdmVyIHRoYXQgd29ya3MgYXJvdW5kIGJ1
Z2d5IE1UUlIKdGFibGVzLiAgQWxzbyB0aGlzIHNlcmllcyBhY3R1YWxseSBhZGRzIGEgbmV3IG92
ZXJyaWRlIGFuZCBhIGZldwpjYWxsZXJzIGZvciBpYTY0IHBsYXRmb3JtIGNvZGUsIHdoaWNoIHdv
cmtzIHZlcnkgc2ltaWxhciB0byB4ODYKYmFzZWQgb24gdGhlIGNvbW1lbnRzIGluIHRoZSBjb2Rl
LiAgVGhhdCBiZWluZyBzYWlkIEknbSBub3Qgc3VyZQp0aGUgY2FsbGVycyBpbiBpYTY0IGFyZSBy
ZWFsbHkgcmVxdWlyZWQsIGJ1dCBpdCB3YXMgdGhlIHNhZmVzdCB0aGluZwp0byBkbyBhcyBwYXJ0
IG9mIHRoaXMgY2xlYW51cC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
