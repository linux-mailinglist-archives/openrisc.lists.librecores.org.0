Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A74C2460C2
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B791320C8D;
	Mon, 17 Aug 2020 10:46:27 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 3733820B6B
 for <openrisc@lists.librecores.org>; Sat,  1 Aug 2020 12:19:13 +0200 (CEST)
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ED692087C;
 Sat,  1 Aug 2020 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596277150;
 bh=jQD0i2dEJRPR8dDJK6vZOAFdpUe2Ho5YLvcSFtENhXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BOX5CM31age4ZqR8WpA9Tu6Sib3TWB8q0axiVZJ9476Af21jQMyZgnRXNsbolGSGn
 pWpwQlO3I1Ym/ZhVqWnuEZ70zJ8p8UgBgfsl0uitfuYMEFBB9GFeRHX0dU8VC7876G
 1GC7zC28lCBEAGXT18VZfRnXSGNcrY6WFAZx7Yv0=
Date: Sat, 1 Aug 2020 13:18:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org>
 <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d04d5hda.fsf@mpe.ellerman.id.au>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMTA6MTU6MTNQTSArMTAwMCwgTWljaGFlbCBFbGxlcm1h
biB3cm90ZToKPiBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+IEZy
b206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+Cj4gPiBmYWR1bXBfcmVz
ZXJ2ZV9jcmFzaF9hcmVhKCkgcmVzZXJ2ZXMgbWVtb3J5IGZyb20gYSBzcGVjaWZpZWQgYmFzZSBh
ZGRyZXNzCj4gPiB0aWxsIHRoZSBlbmQgb2YgdGhlIFJBTS4KPiA+Cj4gPiBSZXBsYWNlIGl0ZXJh
dGlvbiB0aHJvdWdoIHRoZSBtZW1ibG9jay5tZW1vcnkgd2l0aCBhIHNpbmdsZSBjYWxsIHRvCj4g
PiBtZW1ibG9ja19yZXNlcnZlKCkgd2l0aCBhcHByb3ByaWF0ZSAgdGhhdCB3aWxsIHRha2UgY2Fy
ZSBvZiBwcm9wZXIgbWVtb3J5Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW1ldGVycz8KPiA+
IHJlc2VydmF0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvZmFkdW1wLmMg
fCAyMCArLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMTkgZGVsZXRpb25zKC0pCj4gCj4gSSB0aGluayB0aGlzIGxvb2tzIE9LIHRvIG1lLCBi
dXQgSSBkb24ndCBoYXZlIGEgc2V0dXAgdG8gdGVzdCBpdCBlYXNpbHkuCj4gSSd2ZSBhZGRlZCBI
YXJpIHRvIENjIHdobyBtaWdodCBiZSBhYmxlIHRvLgo+IAo+IEJ1dCBJJ2xsIGdpdmUgeW91IGFu
IGFjayBpbiB0aGUgaG9wZSB0aGF0IGl0IHdvcmtzIDopCgpBY3R1YWxseSwgSSBkaWQgc29tZSBk
aWdnaW5nIGluIHRoZSBnaXQgbG9nIGFuZCB0aGUgdHJhdmVyc2FsIHdhcyBhZGRlZAp0aGVyZSBv
biBwdXJwb3NlIGJ5IHRoZSBjb21taXQgYjcxYTY5M2QzZGIzICgicG93ZXJwYy9mYWR1bXA6IGV4
Y2x1ZGUKbWVtb3J5IGhvbGVzIHdoaWxlIHJlc2VydmluZyBtZW1vcnkgaW4gc2Vjb25kIGtlcm5l
bCIpClByZXN1bWluZyB0aGlzIGlzIHN0aWxsIHJlcXJ1aXJlZCBJJ20gZ29pbmcgdG8gZHJvcCB0
aGlzIHBhdGNoIGFuZCB3aWxsCnNpbXBseSByZXBsYWNlIGZvcl9lYWNoX21lbWJsb2NrKCkgd2l0
aCBmb3JfZWFjaF9tZW1fcmFuZ2UoKSBpbiB2Mi4KIAo+IEFja2VkLWJ5OiBNaWNoYWVsIEVsbGVy
bWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gCj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9mYWR1bXAuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZmFkdW1wLmMKPiA+IGlu
ZGV4IDc4YWI5YTZlZTZhYy4uMjQ0NmE2MWUzYzI1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9mYWR1bXAuYwo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAu
Ywo+ID4gQEAgLTE2NTgsMjUgKzE2NTgsNyBAQCBpbnQgX19pbml0IGZhZHVtcF9yZXNlcnZlX21l
bSh2b2lkKQo+ID4gIC8qIFByZXNlcnZlIGV2ZXJ5dGhpbmcgYWJvdmUgdGhlIGJhc2UgYWRkcmVz
cyAqLwo+ID4gIHN0YXRpYyB2b2lkIF9faW5pdCBmYWR1bXBfcmVzZXJ2ZV9jcmFzaF9hcmVhKHU2
NCBiYXNlKQo+ID4gIHsKPiA+IC0Jc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOwo+ID4gLQl1
NjQgbXN0YXJ0LCBtc2l6ZTsKPiA+IC0KPiA+IC0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCBy
ZWcpIHsKPiA+IC0JCW1zdGFydCA9IHJlZy0+YmFzZTsKPiA+IC0JCW1zaXplICA9IHJlZy0+c2l6
ZTsKPiA+IC0KPiA+IC0JCWlmICgobXN0YXJ0ICsgbXNpemUpIDwgYmFzZSkKPiA+IC0JCQljb250
aW51ZTsKPiA+IC0KPiA+IC0JCWlmIChtc3RhcnQgPCBiYXNlKSB7Cj4gPiAtCQkJbXNpemUgLT0g
KGJhc2UgLSBtc3RhcnQpOwo+ID4gLQkJCW1zdGFydCA9IGJhc2U7Cj4gPiAtCQl9Cj4gPiAtCj4g
PiAtCQlwcl9pbmZvKCJSZXNlcnZpbmcgJWxsdU1CIG9mIG1lbW9yeSBhdCAlIzAxNmxseCBmb3Ig
cHJlc2VydmluZyBjcmFzaCBkYXRhIiwKPiA+IC0JCQkobXNpemUgPj4gMjApLCBtc3RhcnQpOwo+
ID4gLQkJbWVtYmxvY2tfcmVzZXJ2ZShtc3RhcnQsIG1zaXplKTsKPiA+IC0JfQo+ID4gKwltZW1i
bG9ja19yZXNlcnZlKGJhc2UsIG1lbWJsb2NrX2VuZF9vZl9EUkFNKCkgLSBiYXNlKTsKPiA+ICB9
Cj4gPiAgCj4gPiAgdW5zaWduZWQgbG9uZyBfX2luaXQgYXJjaF9yZXNlcnZlZF9rZXJuZWxfcGFn
ZXModm9pZCkKPiA+IC0tIAo+ID4gMi4yNi4yCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
