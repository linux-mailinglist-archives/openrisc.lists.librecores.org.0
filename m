Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 62F3C20DCEE
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 42A5F20D3C;
	Mon, 29 Jun 2020 22:45:13 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id EA2C020AB2
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 17:59:34 +0200 (CEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E93025581;
 Mon, 29 Jun 2020 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593446372;
 bh=O/nZ0BxK4nESVxMtlEZ3aR9HUzEjAJ3vpNzo90oK+Gw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ve2Rt8tVmffLLnlIRt4m0+FLkplbTh12wsmkxiiXh2shMIztHBj9/nk/f9S/ai5jU
 3BFQpw5Dz/XZFCZs/y8ymsBDt+3vvNo/l/kVYqcYBemM5Bac+QbcUhusbQGI9QlPev
 vYsxGXmlFAgYBNiTAVuThytC5RkEIP2ptiiEd7Jg=
Date: Mon, 29 Jun 2020 18:59:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200629155920.GD1492837@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-5-rppt@kernel.org>
 <20200627190304.GG25039@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627190304.GG25039@casper.infradead.org>
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

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgMDg6MDM6MDRQTSArMDEwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgMDU6MzQ6NDlQTSArMDMwMCwgTWlrZSBS
YXBvcG9ydCB3cm90ZToKPiA+IE1vcmUgZWxhYm9yYXRlIHZlcnNpb25zIG9uIGFybTY0IGFuZCB4
ODYgYWNjb3VudCBtZW1vcnkgZm9yIHRoZSB1c2VyIHBhZ2UKPiA+IHRhYmxlcyBhbmQgY2FsbCB0
byBwZ3RhYmxlX3BtZF9wYWdlX2N0b3IoKSBhcyB0aGUgcGFydCBvZiBQTUQgcGFnZQo+ID4gaW5p
dGlhbGl6YXRpb24uCj4gPiAKPiA+IE1vdmUgdGhlIGFybTY0IHZlcnNpb24gdG8gaW5jbHVkZS9h
c20tZ2VuZXJpYy9wZ2FsbG9jLmggYW5kIHVzZSB0aGUgZ2VuZXJpYwo+ID4gdmVyc2lvbiBvbiBz
ZXZlcmFsIGFyY2hpdGVjdHVyZXMuCj4gPiAKPiA+IFRoZSBwZ3RhYmxlX3BtZF9wYWdlX2N0b3Io
KSBpcyBhIE5PUCB3aGVuIEFSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0sgaXMKPiA+IG5vdCBl
bmFibGVkLCBzbyB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBmb3IgbW9zdCBhcmNoaXRl
Y3R1cmVzIGV4Y2VwdAo+ID4gb2YgdGhlIGFkZGl0aW9uIG9mIF9fR0ZQX0FDQ09VTlQgZm9yIGFs
bG9jYXRpb24gb2YgdXNlciBwYWdlIHRhYmxlcy4KPiAKPiBUaGFua3MgZm9yIGluY2x1ZGluZyB0
aGlzIGxpbmU7IGl0IHJlbWluZGVkIG1lIHRoYXQgd2UncmUgbm90IHNldHRpbmcKPiB0aGUgUGFn
ZVRhYmxlIGZsYWcgb24gdGhlIHBhZ2UsIG5vciBhY2NvdW50aW5nIGl0IHRvIHRoZSB6b25lIHBh
Z2Ugc3RhdHMuCj4gSG9wZSB5b3UgZG9uJ3QgbWluZCBtZSB0YWdnaW5nIGEgcGF0Y2ggdG8gZG8g
dGhhdCBvbiBhcyA5LzguCgpXZSBhbHNvIG5ldmVyIHNldCBQYWdlVGFibGUgZmxhZyBmb3IgZWFy
bHkgcGFnZSB0YWJsZXMgYW5kIGZvciB0aGUgcGFnZQp0YWJsZXMgYWxsb2NhdGVkIGRpcmVjdGx5
IHdpdGggZ2V0X2ZyZWVfcGFnZSgpLCBlLmcgUFRJLCBLQVNBTi4KCj4gV2UgY291bGQgYWxzbyBk
byB3aXRoIGEgcHVkX3BhZ2VfW2NkXXRvciBhbmQgbWF5YmUgZXZlbiBwNGQvcGdkIHZlcnNpb25z
Lgo+IEJ1dCB0aGF0IGJyaW5ncyBtZSB0byB0aGUgbmV4dCBxdWVzdGlvbiAtLSBjb3VsZC9zaG91
bGQgc29tZSBvZiB0aGlzCj4gYmUgbW92ZWQgb3ZlciB0byBhc20tZ2VuZXJpYy9wZ2FsbG9jLmg/
ICBUaGUgY3Rvci9kdG9yIGFyZW4ndCBjYWxsZWQKPiBmcm9tIGFueXdoZXJlIGVsc2UsIGFuZCB0
aGVyZSdzIHZhbHVlIHRvIHJlZHVjaW5nIHRoZSB0b3RhbCBhbW91bnQgb2YKPiBjb2RlIGluIG1t
LmgsIGJ1dCB0aGVuIHRoZXJlJ3MgYWxzbyB2YWx1ZSB0byBrZWVwaW5nIGFsbCB0aGUgaWZkZWYK
PiBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGNvZGUgdG9nZXRoZXIgdG9vLiAgU28gSSdt
IGEgYml0IHRvcm4uCj4gV2hhdCBkbyB5b3UgdGhpbms/CgotLSAKU2luY2VyZWx5IHlvdXJzLApN
aWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
