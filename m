Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8DE20DCEA
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 43B3320D12;
	Mon, 29 Jun 2020 22:45:11 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 43F4E20CC4
 for <openrisc@lists.librecores.org>; Sun, 28 Jun 2020 09:10:57 +0200 (CEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D65920775;
 Sun, 28 Jun 2020 07:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593328255;
 bh=yK/mmEcayAp4K1SoJVYgv0KctiM5CGqsdRXbo6D8DTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyijhxBtiPImkMHKkSGIyXWOBHqIqoPqHi03HWzaGBbmBhYKOSRUunGTmaRWc4Gjn
 2TMA+ldpEEnMFu0kFYBgT1B2G/Iqyrdp18UacvMYdOXnb2Y4yh/FSazt4w3nUe/3UB
 VKf4vf+8Dah0/sxlNf+Z75XPskzsJ/8NsyHkTS2A=
Date: Sun, 28 Jun 2020 10:10:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200628071044.GC576120@kernel.org>
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
dGhhdCBvbiBhcyA5LzguCj4gCj4gV2UgY291bGQgYWxzbyBkbyB3aXRoIGEgcHVkX3BhZ2VfW2Nk
XXRvciBhbmQgbWF5YmUgZXZlbiBwNGQvcGdkIHZlcnNpb25zLgo+IEJ1dCB0aGF0IGJyaW5ncyBt
ZSB0byB0aGUgbmV4dCBxdWVzdGlvbiAtLSBjb3VsZC9zaG91bGQgc29tZSBvZiB0aGlzCj4gYmUg
bW92ZWQgb3ZlciB0byBhc20tZ2VuZXJpYy9wZ2FsbG9jLmg/ICBUaGUgY3Rvci9kdG9yIGFyZW4n
dCBjYWxsZWQKPiBmcm9tIGFueXdoZXJlIGVsc2UsIGFuZCB0aGVyZSdzIHZhbHVlIHRvIHJlZHVj
aW5nIHRoZSB0b3RhbCBhbW91bnQgb2YKPiBjb2RlIGluIG1tLmgsIGJ1dCB0aGVuIHRoZXJlJ3Mg
YWxzbyB2YWx1ZSB0byBrZWVwaW5nIGFsbCB0aGUgaWZkZWYKPiBBUkNIX0VOQUJMRV9TUExJVF9Q
TURfUFRMT0NLIGNvZGUgdG9nZXRoZXIgdG9vLiAgU28gSSdtIGEgYml0IHRvcm4uCj4gV2hhdCBk
byB5b3UgdGhpbms/CgpUaGVyZSBhcmUgYXJoY2l0ZWN0dXJlcyB0aGF0IGRvbid0IHVzZSBhc20t
Z2VuZXJpYy9wZ2FsbG9jLmggYnV0IHJhdGhlcgpoYXZlIHRoZWlyIG93biwgc29tZXRpbWVzIGNv
bXBsZXRlbHkgZGlmZmVyZW50LCB2ZXJzb2lucyBvZiB0aGVzZQpmdW5jaXRvbnMuCgpJJ3ZlIHRy
aWVkIGFkZGluZyBsaW51eC9wZ2FsbG9jLmgsIGJ1dCBJJ3ZlIGVuZGVkIHVwIHdpdGggY29udHJh
ZGljdGluZwpuZWVkIHRvIGluY2x1ZGUgYXNtL3BnYWxsb2MuaCBiZWZvcmUgdGhlIGdlbmVyaWMg
Y29kZSBmb3Igc29tZQphcmNoaXRlY3VyZXMgb3IgYWZ0ZXIgdGhlIGdlbmVyaWMgY29kZSBmb3Ig
b3RoZXJzIDopCgpJIHRoaW5rIGxldCdzIGxlYXZlIGl0IGluIG1tLmggZm9yIG5vdywgbWF5YmUg
YWZ0ZXIgc2V2ZXJhbCBtb3JlIGNsZWF1cHMKd2UgY291bGQgZG8gYmV0dGVyLgoKLS0gClNpbmNl
cmVseSB5b3VycywKTWlrZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
