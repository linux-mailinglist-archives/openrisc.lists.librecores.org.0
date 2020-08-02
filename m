Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C8DF22460A2
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 91C6C20A40;
	Mon, 17 Aug 2020 10:45:50 +0200 (CEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by mail.librecores.org (Postfix) with ESMTPS id 4B44420D60
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 15:14:26 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKM0z2dLrz9sSG;
 Sun,  2 Aug 2020 23:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596374059;
 bh=l8Vv313rJGqlK2PcaNCVrGcU8SJlDczW2rNrY770DTs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZE71Wyclmt4MQrTZPs6iY6nA2eek+wB/iYUyHxx7nWlyJbBID58C0vJfORjrDD43E
 wNND8mtfpDbimWptgmYv4VddxYAmX0rHolg1XVT+G8s2w1bA+8uHwFHNUayBhafmGn
 U3RDd9O7hEfPsfEFxg1WUJgbZZ35QUi0zip6yzBRdj0KvzX0aIma+XejtIevU686ru
 HM91WecXmsJTqK1azOcV4OJmJvhTYVRaSfqOgAvj1ip20Yb1FPEAys0j9IKpP3z8BI
 XGg3VJKFsWHrW1MkBYjbjQi72gF9zJZpWvDX1DLzzpzZpzoVYn1bqH1kWqIhbU7xhV
 gtswbHEE4eTGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>
In-Reply-To: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org> <87d04d5hda.fsf@mpe.ellerman.id.au>
 <20200801101854.GD534153@kernel.org>
Date: Sun, 02 Aug 2020 23:14:10 +1000
Message-ID: <87o8nt197h.fsf@mpe.ellerman.id.au>
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
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gT24gVGh1LCBKdWwgMzAs
IDIwMjAgYXQgMTA6MTU6MTNQTSArMTAwMCwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToKPj4gTWlr
ZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+ID4gRnJvbTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+PiA+Cj4+ID4gZmFkdW1wX3Jlc2VydmVfY3Jhc2hf
YXJlYSgpIHJlc2VydmVzIG1lbW9yeSBmcm9tIGEgc3BlY2lmaWVkIGJhc2UgYWRkcmVzcwo+PiA+
IHRpbGwgdGhlIGVuZCBvZiB0aGUgUkFNLgo+PiA+Cj4+ID4gUmVwbGFjZSBpdGVyYXRpb24gdGhy
b3VnaCB0aGUgbWVtYmxvY2subWVtb3J5IHdpdGggYSBzaW5nbGUgY2FsbCB0bwo+PiA+IG1lbWJs
b2NrX3Jlc2VydmUoKSB3aXRoIGFwcHJvcHJpYXRlICB0aGF0IHdpbGwgdGFrZSBjYXJlIG9mIHBy
b3BlciBtZW1vcnkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcmFtZXRlcnM/Cj4+ID4gcmVz
ZXJ2YXRpb24uCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+Cj4+ID4gLS0tCj4+ID4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvZmFkdW1wLmMg
fCAyMCArLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDE5IGRlbGV0aW9ucygtKQo+PiAKPj4gSSB0aGluayB0aGlzIGxvb2tzIE9LIHRvIG1l
LCBidXQgSSBkb24ndCBoYXZlIGEgc2V0dXAgdG8gdGVzdCBpdCBlYXNpbHkuCj4+IEkndmUgYWRk
ZWQgSGFyaSB0byBDYyB3aG8gbWlnaHQgYmUgYWJsZSB0by4KPj4gCj4+IEJ1dCBJJ2xsIGdpdmUg
eW91IGFuIGFjayBpbiB0aGUgaG9wZSB0aGF0IGl0IHdvcmtzIDopCj4KPiBBY3R1YWxseSwgSSBk
aWQgc29tZSBkaWdnaW5nIGluIHRoZSBnaXQgbG9nIGFuZCB0aGUgdHJhdmVyc2FsIHdhcyBhZGRl
ZAo+IHRoZXJlIG9uIHB1cnBvc2UgYnkgdGhlIGNvbW1pdCBiNzFhNjkzZDNkYjMgKCJwb3dlcnBj
L2ZhZHVtcDogZXhjbHVkZQo+IG1lbW9yeSBob2xlcyB3aGlsZSByZXNlcnZpbmcgbWVtb3J5IGlu
IHNlY29uZCBrZXJuZWwiKQo+IFByZXN1bWluZyB0aGlzIGlzIHN0aWxsIHJlcXJ1aXJlZCBJJ20g
Z29pbmcgdG8gZHJvcCB0aGlzIHBhdGNoIGFuZCB3aWxsCj4gc2ltcGx5IHJlcGxhY2UgZm9yX2Vh
Y2hfbWVtYmxvY2soKSB3aXRoIGZvcl9lYWNoX21lbV9yYW5nZSgpIGluIHYyLgoKVGhhbmtzLgoK
Y2hlZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
