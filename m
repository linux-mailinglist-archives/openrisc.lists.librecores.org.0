Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0C53B20DCE6
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AA9AE20B08;
	Mon, 29 Jun 2020 22:45:08 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id C686620CC3
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 20:47:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1N0BByy8wh3U5L6kSyD094uOjKmOfferUMmn5EME8io=; b=rt8TkjxM6E+8nmcpYCJvT3+hGr
 H4ecs3CPjquKl0PwNGx/0fLvLzSeMiWcVi9g0WCIz3JnPQUXbHNqxCwsT2ayVaFw3c97wVSQmiW1a
 rRm52Ir+aRTZP4azHkd5YkWRXRczyXy3h3kPFA95NHffmRnSpt92NCElCKtgs9bWeGRSTPeQhCTju
 iPtJAvPHoRFkmTEM1tJ00siPzLuSHbI8lKSLvU4vW88vtaVf2379Kp5XmE9uUb/m7xTPxYufnEdnI
 IEHPwIDOHEDO9KXQeLwESz53maPxEJf9fE+lLaTHw5uxLUAf5caLMZIB5tLXnAC15PHD057E6o2BK
 h9N6MSEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jpFqc-00058E-Db; Sat, 27 Jun 2020 18:46:42 +0000
Date: Sat, 27 Jun 2020 19:46:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200627184642.GF25039@casper.infradead.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: [OpenRISC] [PATCH 9/8] mm: Account PMD tables like PTE tables
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

V2UgYWNjb3VudCB0aGUgUFRFIGxldmVsIG9mIHRoZSBwYWdlIHRhYmxlcyB0byB0aGUgcHJvY2Vz
cyBpbiBvcmRlciB0bwptYWtlIHNtYXJ0ZXIgT09NIGRlY2lzaW9ucyBhbmQgaGVscCBkaWFnbm9z
ZSB3aHkgbWVtb3J5IGlzIGZyYWdtZW50ZWQuCkZvciB0aGVzZSBzYW1lIHJlYXNvbnMsIHdlIHNo
b3VsZCBhY2NvdW50IHBhZ2VzIGFsbG9jYXRlZCBmb3IgUE1Ecy4KV2l0aCBsYXJnZXIgcHJvY2Vz
cyBhZGRyZXNzIHNwYWNlcyBhbmQgQVNMUiwgdGhlIG51bWJlciBvZiBQTURzIGluIHVzZQppcyBo
aWdoZXIgdGhhbiBpdCB1c2VkIHRvIGJlIHNvIHRoZSBpbmFjY3VyYWN5IGlzIHN0YXJ0aW5nIHRv
IG1hdHRlci4KClNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxseUBp
bmZyYWRlYWQub3JnPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDI0ICsrKysrKysrKysrKysr
KysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5o
CmluZGV4IGRjN2I4NzMxMGMxMC4uYjI4M2UyNWZjZmZhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCkBAIC0yMjcxLDcgKzIyNzEsNyBAQCBz
dGF0aWMgaW5saW5lIHNwaW5sb2NrX3QgKnBtZF9sb2NrcHRyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LCBwbWRfdCAqcG1kKQogCXJldHVybiBwdGxvY2tfcHRyKHBtZF90b19wYWdlKHBtZCkpOwogfQog
Ci1zdGF0aWMgaW5saW5lIGJvb2wgcGd0YWJsZV9wbWRfcGFnZV9jdG9yKHN0cnVjdCBwYWdlICpw
YWdlKQorc3RhdGljIGlubGluZSBib29sIHBtZF9wdGxvY2tfaW5pdChzdHJ1Y3QgcGFnZSAqcGFn
ZSkKIHsKICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKIAlwYWdlLT5wbWRfaHVn
ZV9wdGUgPSBOVUxMOwpAQCAtMjI3OSw3ICsyMjc5LDcgQEAgc3RhdGljIGlubGluZSBib29sIHBn
dGFibGVfcG1kX3BhZ2VfY3RvcihzdHJ1Y3QgcGFnZSAqcGFnZSkKIAlyZXR1cm4gcHRsb2NrX2lu
aXQocGFnZSk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBwZ3RhYmxlX3BtZF9wYWdlX2R0b3Io
c3RydWN0IHBhZ2UgKnBhZ2UpCitzdGF0aWMgaW5saW5lIHZvaWQgcG1kX3B0bG9ja19mcmVlKHN0
cnVjdCBwYWdlICpwYWdlKQogewogI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQog
CVZNX0JVR19PTl9QQUdFKHBhZ2UtPnBtZF9odWdlX3B0ZSwgcGFnZSk7CkBAIC0yMjk2LDggKzIy
OTYsOCBAQCBzdGF0aWMgaW5saW5lIHNwaW5sb2NrX3QgKnBtZF9sb2NrcHRyKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCBwbWRfdCAqcG1kKQogCXJldHVybiAmbW0tPnBhZ2VfdGFibGVfbG9jazsKIH0K
IAotc3RhdGljIGlubGluZSBib29sIHBndGFibGVfcG1kX3BhZ2VfY3RvcihzdHJ1Y3QgcGFnZSAq
cGFnZSkgeyByZXR1cm4gdHJ1ZTsgfQotc3RhdGljIGlubGluZSB2b2lkIHBndGFibGVfcG1kX3Bh
Z2VfZHRvcihzdHJ1Y3QgcGFnZSAqcGFnZSkge30KK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfcHRs
b2NrX2luaXQoc3RydWN0IHBhZ2UgKnBhZ2UpIHsgcmV0dXJuIHRydWU7IH0KK3N0YXRpYyBpbmxp
bmUgdm9pZCBwbWRfcHRsb2NrX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpIHt9CiAKICNkZWZpbmUg
cG1kX2h1Z2VfcHRlKG1tLCBwbWQpICgobW0pLT5wbWRfaHVnZV9wdGUpCiAKQEAgLTIzMTAsNiAr
MjMxMCwyMiBAQCBzdGF0aWMgaW5saW5lIHNwaW5sb2NrX3QgKnBtZF9sb2NrKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCBwbWRfdCAqcG1kKQogCXJldHVybiBwdGw7CiB9CiAKK3N0YXRpYyBpbmxpbmUg
Ym9vbCBwZ3RhYmxlX3BtZF9wYWdlX2N0b3Ioc3RydWN0IHBhZ2UgKnBhZ2UpCit7CisJaWYgKCFw
bWRfcHRsb2NrX2luaXQocGFnZSkpCisJCXJldHVybiBmYWxzZTsKKwlfX1NldFBhZ2VUYWJsZShw
YWdlKTsKKwlpbmNfem9uZV9wYWdlX3N0YXRlKHBhZ2UsIE5SX1BBR0VUQUJMRSk7CisJcmV0dXJu
IHRydWU7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBwZ3RhYmxlX3BtZF9wYWdlX2R0b3Ioc3Ry
dWN0IHBhZ2UgKnBhZ2UpCit7CisJcG1kX3B0bG9ja19mcmVlKHBhZ2UpOworCV9fQ2xlYXJQYWdl
VGFibGUocGFnZSk7CisJZGVjX3pvbmVfcGFnZV9zdGF0ZShwYWdlLCBOUl9QQUdFVEFCTEUpOwor
fQorCiAvKgogICogTm8gc2NhbGFiaWxpdHkgcmVhc29uIHRvIHNwbGl0IFBVRCBsb2NrcyB5ZXQs
IGJ1dCBmb2xsb3cgdGhlIHNhbWUgcGF0dGVybgogICogYXMgdGhlIFBNRCBsb2NrcyB0byBtYWtl
IGl0IGVhc2llciBpZiB3ZSBkZWNpZGUgdG8uICBUaGUgVk0gc2hvdWxkIG5vdCBiZQotLSAKMi4y
Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
