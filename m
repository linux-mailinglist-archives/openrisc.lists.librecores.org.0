Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 904EE356852
	for <lists+openrisc@lfdr.de>; Wed,  7 Apr 2021 11:48:25 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1A0472012B;
	Wed,  7 Apr 2021 11:48:25 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 9786220D49
 for <openrisc@lists.librecores.org>; Wed,  7 Apr 2021 11:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+qSokmLjMhdEnOSkSopblq5MKalEi8UUYD3QbqGxqos=; b=eC2rQ34nM7cRrzDAhzzhEN3wPe
 kTzKVXiPYsQriyTitj8XaOZiOMYSs2CmPna+vSZrzx2X+AyYzDfGkh6XwDeUaP/R2Sdhw0fUQHZoE
 xcIkVZ9BgwAGrHrQdPx1JVxc28uo8a4iZ5LllVP7TnFFfJ9CG+a4lOMAZ0xT4W5AUDITT4PKOzipn
 iYX5eNIGnsNYC8ByBciAnWPp9g9vDQf8R7DSJ/g+l6EF+CP1ntsJaOLY4qb8I0kMJDUqs+viQJKqd
 up6N4jP4nowpqWEIhSTtf6tIwQksMPnvi+P/KtQNQPk3PhCqoIF2gV1qmvrv5jzGvLRrNMJHVDhzZ
 FeCH/O7Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4ms-00EGP6-RS; Wed, 07 Apr 2021 09:47:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 44BCF300119;
 Wed,  7 Apr 2021 11:47:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 27BB724403DB8; Wed,  7 Apr 2021 11:47:49 +0200 (CEST)
Date: Wed, 7 Apr 2021 11:47:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
 <20210406235208.GG3288043@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406235208.GG3288043@lianli.shorne-pla.net>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org, guoren@kernel.org,
 sparclinux@vger.kernel.org, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMDg6NTI6MDhBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gV2h5IGRvZXNuJ3QgUklTQy1WIGFkZCB0aGUgeGNoZzE2IGVtdWxhdGlvbiBjb2Rl
IHNpbWlsYXIgdG8gT3BlblJJU0M/ICBGb3IKPiBPcGVuUklTQyB3ZSBhZGRlZCB4Y2hnMTYgYW5k
IHhjaGc4IGVtdWxhdGlvbiBjb2RlIHRvIGVuYWJsZSBxc3BpbmxvY2tzLiAgU28KPiBvbmUgdGhv
dWdodCBpcyB3aXRoIENPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMj15LCBj
YW4gd2UgcmVtb3ZlIG91cgo+IHhjaGcxNi94Y2hnOCBlbXVsYXRpb24gY29kZT8KCkNPTkZJR19B
UkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMiBpcyBndWFyYW50ZWVkIGNyYXAuCgpBbGwg
dGhlIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlIHdhbnRlZCBpdCBhcmUgUklTQyBzdHlsZSBMTC9T
QyBhcmNocywKYW5kIGZvciB0aGVtIGEgY21weGNoZyBsb29wIGlzIGEgZGFmdCB0aGluZyB0byBk
bywgc2luY2UgaXQgcmVkdWNlcyB0aGUKY2hhbmNlIG9mIGl0IGJlaGF2aW5nIHNhbmVseS4KCldo
eSB3b3VsZCB3ZSBwcm92aWRlIHNvbWV0aGluZyB0aGF0J3Mga25vd24gdG8gYmUgc3Vib3B0aW1h
bD8gSWYgYW4KYXJjaGl0ZWN0dXJlIGNob29zZXMgdG8gbm90IGNhcmUgYWJvdXQgZGV0ZXJtaW5p
c20gYW5kIG9yIGZ3ZCBwcm9ncmVzcywKdGhlbiB0aGF0J3MgdGhlaXIgY2hvaWNlLiBCdXQgbm90
IG9uZSwgSSBmZWVsLCB3ZSBzaG91bGQgZW5jb3VyYWdlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
