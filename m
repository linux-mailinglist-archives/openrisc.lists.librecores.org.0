Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 125CB20DCE9
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B412C20D2D;
	Mon, 29 Jun 2020 22:45:10 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id B8D6D20AF7
 for <openrisc@lists.librecores.org>; Sun, 28 Jun 2020 09:00:06 +0200 (CEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D042720702;
 Sun, 28 Jun 2020 06:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593327604;
 bh=hu/tW2f/lIs0zzXJSvCrgwdLd0PRG2JIRHvUCcaAjqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qm3qqF3d78J/gFOwv6YVJb71itb3mymeRhGcaLrkXQY5dETAmGwNnfv+uXEMscIi2
 mPZsATFBdJNygr2fnTWo/ejLleXfIjFaiD5KXp/1ygh8w33HlLwG0oN/C/qRCb8sbq
 bU6JOX1KtJfeNxxfnsJIYZnBX1A1gh84k+HeVxCY=
Date: Sun, 28 Jun 2020 09:59:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200628065951.GB576120@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627184642.GF25039@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627184642.GF25039@casper.infradead.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 9/8] mm: Account PMD tables like PTE tables
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgMDc6NDY6NDJQTSArMDEwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gV2UgYWNjb3VudCB0aGUgUFRFIGxldmVsIG9mIHRoZSBwYWdlIHRhYmxlcyB0byB0
aGUgcHJvY2VzcyBpbiBvcmRlciB0bwo+IG1ha2Ugc21hcnRlciBPT00gZGVjaXNpb25zIGFuZCBo
ZWxwIGRpYWdub3NlIHdoeSBtZW1vcnkgaXMgZnJhZ21lbnRlZC4KPiBGb3IgdGhlc2Ugc2FtZSBy
ZWFzb25zLCB3ZSBzaG91bGQgYWNjb3VudCBwYWdlcyBhbGxvY2F0ZWQgZm9yIFBNRHMuCj4gV2l0
aCBsYXJnZXIgcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBhbmQgQVNMUiwgdGhlIG51bWJlciBvZiBQ
TURzIGluIHVzZQo+IGlzIGhpZ2hlciB0aGFuIGl0IHVzZWQgdG8gYmUgc28gdGhlIGluYWNjdXJh
Y3kgaXMgc3RhcnRpbmcgdG8gbWF0dGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2ls
Y294IChPcmFjbGUpIDx3aWxseUBpbmZyYWRlYWQub3JnPgoKUmV2aWV3ZWQtYnk6IE1pa2UgUmFw
b3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvbW0uaCB8
IDI0ICsrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
bS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gaW5kZXggZGM3Yjg3MzEwYzEwLi5iMjgzZTI1ZmNm
ZmEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gKysrIGIvaW5jbHVkZS9saW51
eC9tbS5oCj4gQEAgLTIyNzEsNyArMjI3MSw3IEBAIHN0YXRpYyBpbmxpbmUgc3BpbmxvY2tfdCAq
cG1kX2xvY2twdHIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBtZF90ICpwbWQpCj4gIAlyZXR1cm4g
cHRsb2NrX3B0cihwbWRfdG9fcGFnZShwbWQpKTsKPiAgfQo+ICAKPiAtc3RhdGljIGlubGluZSBi
b29sIHBndGFibGVfcG1kX3BhZ2VfY3RvcihzdHJ1Y3QgcGFnZSAqcGFnZSkKPiArc3RhdGljIGlu
bGluZSBib29sIHBtZF9wdGxvY2tfaW5pdChzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgewo+ICAjaWZk
ZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4gIAlwYWdlLT5wbWRfaHVnZV9wdGUgPSBO
VUxMOwo+IEBAIC0yMjc5LDcgKzIyNzksNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcGd0YWJsZV9w
bWRfcGFnZV9jdG9yKHN0cnVjdCBwYWdlICpwYWdlKQo+ICAJcmV0dXJuIHB0bG9ja19pbml0KHBh
Z2UpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW5saW5lIHZvaWQgcGd0YWJsZV9wbWRfcGFnZV9kdG9y
KHN0cnVjdCBwYWdlICpwYWdlKQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcG1kX3B0bG9ja19mcmVl
KHN0cnVjdCBwYWdlICpwYWdlKQo+ICB7Cj4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVH
RVBBR0UKPiAgCVZNX0JVR19PTl9QQUdFKHBhZ2UtPnBtZF9odWdlX3B0ZSwgcGFnZSk7Cj4gQEAg
LTIyOTYsOCArMjI5Niw4IEBAIHN0YXRpYyBpbmxpbmUgc3BpbmxvY2tfdCAqcG1kX2xvY2twdHIo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHBtZF90ICpwbWQpCj4gIAlyZXR1cm4gJm1tLT5wYWdlX3Rh
YmxlX2xvY2s7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwZ3RhYmxlX3BtZF9wYWdl
X2N0b3Ioc3RydWN0IHBhZ2UgKnBhZ2UpIHsgcmV0dXJuIHRydWU7IH0KPiAtc3RhdGljIGlubGlu
ZSB2b2lkIHBndGFibGVfcG1kX3BhZ2VfZHRvcihzdHJ1Y3QgcGFnZSAqcGFnZSkge30KPiArc3Rh
dGljIGlubGluZSBib29sIHBtZF9wdGxvY2tfaW5pdChzdHJ1Y3QgcGFnZSAqcGFnZSkgeyByZXR1
cm4gdHJ1ZTsgfQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcG1kX3B0bG9ja19mcmVlKHN0cnVjdCBw
YWdlICpwYWdlKSB7fQo+ICAKPiAgI2RlZmluZSBwbWRfaHVnZV9wdGUobW0sIHBtZCkgKChtbSkt
PnBtZF9odWdlX3B0ZSkKPiAgCj4gQEAgLTIzMTAsNiArMjMxMCwyMiBAQCBzdGF0aWMgaW5saW5l
IHNwaW5sb2NrX3QgKnBtZF9sb2NrKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwbWRfdCAqcG1kKQo+
ICAJcmV0dXJuIHB0bDsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSBib29sIHBndGFibGVfcG1k
X3BhZ2VfY3RvcihzdHJ1Y3QgcGFnZSAqcGFnZSkKPiArewo+ICsJaWYgKCFwbWRfcHRsb2NrX2lu
aXQocGFnZSkpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsJX19TZXRQYWdlVGFibGUocGFnZSk7Cj4g
KwlpbmNfem9uZV9wYWdlX3N0YXRlKHBhZ2UsIE5SX1BBR0VUQUJMRSk7Cj4gKwlyZXR1cm4gdHJ1
ZTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHBndGFibGVfcG1kX3BhZ2VfZHRvcihz
dHJ1Y3QgcGFnZSAqcGFnZSkKPiArewo+ICsJcG1kX3B0bG9ja19mcmVlKHBhZ2UpOwo+ICsJX19D
bGVhclBhZ2VUYWJsZShwYWdlKTsKPiArCWRlY196b25lX3BhZ2Vfc3RhdGUocGFnZSwgTlJfUEFH
RVRBQkxFKTsKPiArfQo+ICsKPiAgLyoKPiAgICogTm8gc2NhbGFiaWxpdHkgcmVhc29uIHRvIHNw
bGl0IFBVRCBsb2NrcyB5ZXQsIGJ1dCBmb2xsb3cgdGhlIHNhbWUgcGF0dGVybgo+ICAgKiBhcyB0
aGUgUE1EIGxvY2tzIHRvIG1ha2UgaXQgZWFzaWVyIGlmIHdlIGRlY2lkZSB0by4gIFRoZSBWTSBz
aG91bGQgbm90IGJlCj4gLS0gCj4gMi4yNy4wCj4gCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtl
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
