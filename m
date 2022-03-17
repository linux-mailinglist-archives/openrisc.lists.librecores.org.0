Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D71994DC333
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 10:46:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 93428247C4;
	Thu, 17 Mar 2022 10:46:25 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 883B7247C4
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 10:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gyGtFzNeoxStsezjUkQICZnTPdUarjxnpiDNsa6B0WE=; b=WA4v03glmgat2hllQ9wlSLQexd
 tnKPktAgWSrAZOTMlckmuAD/E3aa4B2WOa+YYl5fc+bHKwSd2e+Qfqb419maoCdNulfCQ0IXvtZE1
 jiobU3dnwFBu6n1zW1VVjADF06+GPkeXMiBWNq2bMat8sXBY9lrHk/BHQCk7cRf+FOnfKo88hzQl0
 j5TWYEK/f/kkRo95RFldthbnBVNxSBb36DaJeMcqrddCc8ixjU1fSF2myO3YIcJAQi0fEOuhas+cB
 /rtoztwPtRcPjGJrNs7eP7WW7B0beYa9foYEBf8NiW17OZ/JHQYT8LavxfMpYviCdlH8X86ZgTZrH
 LzCoQjYA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmho-006qam-K5; Thu, 17 Mar 2022 09:46:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B0813001EA;
 Thu, 17 Mar 2022 10:46:01 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1E1B8201CD1C3; Thu, 17 Mar 2022 10:46:01 +0100 (CET)
Date: Thu, 17 Mar 2022 10:46:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <YjMDWQ3T5oYU7sYG@hirez.programming.kicks-ass.net>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-3-palmer@rivosinc.com>
Subject: Re: [OpenRISC] [PATCH 2/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMTYsIDIwMjIgYXQgMDQ6MjU6NTdQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IAo+
IFRoaXMgaXMgYSBzaW1wbGUsIGZhaXIgc3BpbmxvY2suICBTcGVjaWZpY2FsbHkgaXQgZG9lc24n
dCBoYXZlIGFsbCB0aGUKPiBzdWJ0bGUgbWVtb3J5IG1vZGVsIGRlcGVuZGVuY2llcyB0aGF0IHFz
cGlubG9jayBoYXMsIHdoaWNoIG1ha2VzIGl0IG1vcmUKPiBzdWl0YWJsZSBmb3Igc2ltcGxlIHN5
c3RlbXMgYXMgaXQgaXMgbW9yZSBsaWtlbHkgdG8gYmUgY29ycmVjdC4KPiAKPiBbUGFsbWVyOiBj
b21taXQgdGV4dF0KPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9z
aW5jLmNvbT4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBp
bmZyYWRlYWQub3JnPgoKPiAKPiAtLQo+IAo+IEkgaGF2ZSBzcGVjaWZpY2FsbHkgbm90IGluY2x1
ZGVkIFBldGVyJ3MgU09CIG9uIHRoaXMsIGFzIGhlIHNlbnQgaGlzCj4gb3JpZ2luYWwgcGF0Y2gK
PiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramozQGhpcmV6LnBy
b2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvPgo+IHdpdGhvdXQgb25lLgoKRml4ZWQgOy0pCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
