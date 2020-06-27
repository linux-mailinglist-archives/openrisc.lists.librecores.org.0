Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B127920DCE7
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5336720C93;
	Mon, 29 Jun 2020 22:45:09 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 7E5A720CCB
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 21:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OR7OBaJyU20QVLaZTPXddMLTo5rxOsqU6iEIJEupuWE=; b=rq00ouSxMdTmSFa28hDOUKTHBg
 3dXyfPXkTUDZyQHTetqsyMna5fwntHa6QKcic/h71IwcUCnGNbErGyqkiwiLcgU2nYHZh16/QaPeb
 b5zkBVG9gFL5QSc/VNDuNclsIuluvuMI/LYza+5r2JW/cLhLN6jZ5ik5eKIuodERFMabxSNfOI2Bi
 +dL26IWnzvmxsRx2Z0NmVql7PiiPOtRewW4aUiQeNyCevs8ZZkzP0faCH2uqSnyC23QLvVtj1Wi9z
 Fo+73sfYzK5rnUfqtXfFwYUwyfilRDtoIcUUPTCSGsmVmOCF5BvgZD7yS/O5QwZNMhirY3o8KlkeY
 6JIFEkYQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jpG6S-0005fe-2n; Sat, 27 Jun 2020 19:03:04 +0000
Date: Sat, 27 Jun 2020 20:03:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200627190304.GG25039@casper.infradead.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-5-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 4/8] asm-generic: pgalloc: provide generic
 pmd_alloc_one() and pmd_free_one()
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

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgMDU6MzQ6NDlQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBNb3JlIGVsYWJvcmF0ZSB2ZXJzaW9ucyBvbiBhcm02NCBhbmQgeDg2IGFjY291bnQg
bWVtb3J5IGZvciB0aGUgdXNlciBwYWdlCj4gdGFibGVzIGFuZCBjYWxsIHRvIHBndGFibGVfcG1k
X3BhZ2VfY3RvcigpIGFzIHRoZSBwYXJ0IG9mIFBNRCBwYWdlCj4gaW5pdGlhbGl6YXRpb24uCj4g
Cj4gTW92ZSB0aGUgYXJtNjQgdmVyc2lvbiB0byBpbmNsdWRlL2FzbS1nZW5lcmljL3BnYWxsb2Mu
aCBhbmQgdXNlIHRoZSBnZW5lcmljCj4gdmVyc2lvbiBvbiBzZXZlcmFsIGFyY2hpdGVjdHVyZXMu
Cj4gCj4gVGhlIHBndGFibGVfcG1kX3BhZ2VfY3RvcigpIGlzIGEgTk9QIHdoZW4gQVJDSF9FTkFC
TEVfU1BMSVRfUE1EX1BUTE9DSyBpcwo+IG5vdCBlbmFibGVkLCBzbyB0aGVyZSBpcyBubyBmdW5j
dGlvbmFsIGNoYW5nZSBmb3IgbW9zdCBhcmNoaXRlY3R1cmVzIGV4Y2VwdAo+IG9mIHRoZSBhZGRp
dGlvbiBvZiBfX0dGUF9BQ0NPVU5UIGZvciBhbGxvY2F0aW9uIG9mIHVzZXIgcGFnZSB0YWJsZXMu
CgpUaGFua3MgZm9yIGluY2x1ZGluZyB0aGlzIGxpbmU7IGl0IHJlbWluZGVkIG1lIHRoYXQgd2Un
cmUgbm90IHNldHRpbmcKdGhlIFBhZ2VUYWJsZSBmbGFnIG9uIHRoZSBwYWdlLCBub3IgYWNjb3Vu
dGluZyBpdCB0byB0aGUgem9uZSBwYWdlIHN0YXRzLgpIb3BlIHlvdSBkb24ndCBtaW5kIG1lIHRh
Z2dpbmcgYSBwYXRjaCB0byBkbyB0aGF0IG9uIGFzIDkvOC4KCldlIGNvdWxkIGFsc28gZG8gd2l0
aCBhIHB1ZF9wYWdlX1tjZF10b3IgYW5kIG1heWJlIGV2ZW4gcDRkL3BnZCB2ZXJzaW9ucy4KQnV0
IHRoYXQgYnJpbmdzIG1lIHRvIHRoZSBuZXh0IHF1ZXN0aW9uIC0tIGNvdWxkL3Nob3VsZCBzb21l
IG9mIHRoaXMKYmUgbW92ZWQgb3ZlciB0byBhc20tZ2VuZXJpYy9wZ2FsbG9jLmg/ICBUaGUgY3Rv
ci9kdG9yIGFyZW4ndCBjYWxsZWQKZnJvbSBhbnl3aGVyZSBlbHNlLCBhbmQgdGhlcmUncyB2YWx1
ZSB0byByZWR1Y2luZyB0aGUgdG90YWwgYW1vdW50IG9mCmNvZGUgaW4gbW0uaCwgYnV0IHRoZW4g
dGhlcmUncyBhbHNvIHZhbHVlIHRvIGtlZXBpbmcgYWxsIHRoZSBpZmRlZgpBUkNIX0VOQUJMRV9T
UExJVF9QTURfUFRMT0NLIGNvZGUgdG9nZXRoZXIgdG9vLiAgU28gSSdtIGEgYml0IHRvcm4uCldo
YXQgZG8geW91IHRoaW5rPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
