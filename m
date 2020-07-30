Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 41ED72460A0
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C3FCF20DFF;
	Mon, 17 Aug 2020 10:45:48 +0200 (CEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by mail.librecores.org (Postfix) with ESMTPS id 00FCE20CE4
 for <openrisc@lists.librecores.org>; Thu, 30 Jul 2020 14:15:30 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHTrL6Fgfz9sRN;
 Thu, 30 Jul 2020 22:15:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596111321;
 bh=YNSVJAmG6iTLprr4AXeykiRRbuPWau8/ePuc4CoRMGM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dDG2HeGveH8jvsO0a3nV+Tp8BcGIZDu65BOPDvIIBo9wVTyiHzeoVy9VEea0rigvp
 Y31hCYMQ/HUQJyt9f4Ns+ZWd4J0yauoOrKc1q24QkaP65G5RtKXvj8BnxizCtGPCIs
 4Qc5Gy9BbRkYcfHS9FaL2IesmCw9kHwdS0i+jJ5INj6RLnsR8z4hMy+N03Q+rveLd0
 2v5hfX/mFHnRdxjBR0pUmOS4LXqz54J4KK7TRfoGZVmsUzhhMnBhUvMn3FR8lvfRl/
 Ax9t5/4az9jOznaLXvwqANu/Zl8pK6CgRrdLYmMHTgYkBan25IQFsKLy25EXJBUiYn
 TCPH/khAUMFFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20200728051153.1590-7-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org>
Date: Thu, 30 Jul 2020 22:15:13 +1000
Message-ID: <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gRnJvbTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Cj4gZmFkdW1wX3Jlc2VydmVfY3Jhc2hfYXJlYSgp
IHJlc2VydmVzIG1lbW9yeSBmcm9tIGEgc3BlY2lmaWVkIGJhc2UgYWRkcmVzcwo+IHRpbGwgdGhl
IGVuZCBvZiB0aGUgUkFNLgo+Cj4gUmVwbGFjZSBpdGVyYXRpb24gdGhyb3VnaCB0aGUgbWVtYmxv
Y2subWVtb3J5IHdpdGggYSBzaW5nbGUgY2FsbCB0bwo+IG1lbWJsb2NrX3Jlc2VydmUoKSB3aXRo
IGFwcHJvcHJpYXRlICB0aGF0IHdpbGwgdGFrZSBjYXJlIG9mIHByb3BlciBtZW1vcnkKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhcmFtZXRlcnM/Cj4gcmVzZXJ2YXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvZmFkdW1wLmMgfCAyMCArLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDE5IGRlbGV0aW9ucygtKQoKSSB0aGluayB0aGlzIGxvb2tz
IE9LIHRvIG1lLCBidXQgSSBkb24ndCBoYXZlIGEgc2V0dXAgdG8gdGVzdCBpdCBlYXNpbHkuCkkn
dmUgYWRkZWQgSGFyaSB0byBDYyB3aG8gbWlnaHQgYmUgYWJsZSB0by4KCkJ1dCBJJ2xsIGdpdmUg
eW91IGFuIGFjayBpbiB0aGUgaG9wZSB0aGF0IGl0IHdvcmtzIDopCgpBY2tlZC1ieTogTWljaGFl
bCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PgoKCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvZmFkdW1wLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2ZhZHVtcC5jCj4gaW5k
ZXggNzhhYjlhNmVlNmFjLi4yNDQ2YTYxZTNjMjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2tlcm5lbC9mYWR1bXAuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZmFkdW1wLmMKPiBA
QCAtMTY1OCwyNSArMTY1OCw3IEBAIGludCBfX2luaXQgZmFkdW1wX3Jlc2VydmVfbWVtKHZvaWQp
Cj4gIC8qIFByZXNlcnZlIGV2ZXJ5dGhpbmcgYWJvdmUgdGhlIGJhc2UgYWRkcmVzcyAqLwo+ICBz
dGF0aWMgdm9pZCBfX2luaXQgZmFkdW1wX3Jlc2VydmVfY3Jhc2hfYXJlYSh1NjQgYmFzZSkKPiAg
ewo+IC0Jc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOwo+IC0JdTY0IG1zdGFydCwgbXNpemU7
Cj4gLQo+IC0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsKPiAtCQltc3RhcnQgPSBy
ZWctPmJhc2U7Cj4gLQkJbXNpemUgID0gcmVnLT5zaXplOwo+IC0KPiAtCQlpZiAoKG1zdGFydCAr
IG1zaXplKSA8IGJhc2UpCj4gLQkJCWNvbnRpbnVlOwo+IC0KPiAtCQlpZiAobXN0YXJ0IDwgYmFz
ZSkgewo+IC0JCQltc2l6ZSAtPSAoYmFzZSAtIG1zdGFydCk7Cj4gLQkJCW1zdGFydCA9IGJhc2U7
Cj4gLQkJfQo+IC0KPiAtCQlwcl9pbmZvKCJSZXNlcnZpbmcgJWxsdU1CIG9mIG1lbW9yeSBhdCAl
IzAxNmxseCBmb3IgcHJlc2VydmluZyBjcmFzaCBkYXRhIiwKPiAtCQkJKG1zaXplID4+IDIwKSwg
bXN0YXJ0KTsKPiAtCQltZW1ibG9ja19yZXNlcnZlKG1zdGFydCwgbXNpemUpOwo+IC0JfQo+ICsJ
bWVtYmxvY2tfcmVzZXJ2ZShiYXNlLCBtZW1ibG9ja19lbmRfb2ZfRFJBTSgpIC0gYmFzZSk7Cj4g
IH0KPiAgCj4gIHVuc2lnbmVkIGxvbmcgX19pbml0IGFyY2hfcmVzZXJ2ZWRfa2VybmVsX3BhZ2Vz
KHZvaWQpCj4gLS0gCj4gMi4yNi4yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
