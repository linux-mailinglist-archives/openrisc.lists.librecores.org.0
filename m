Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D244B4DC337
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 10:46:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C07EA247C4;
	Thu, 17 Mar 2022 10:46:42 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 70C37247C4
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 10:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+qA6MENEtbOnKxLxQVOH0ud0BbLlTVGZKx9qSfsjh7M=; b=gkygt28PPeixJWqoCdDEjatxVm
 EB4DflH8ok/qCvuqnejlHsxty4rwOyj9OSE49mLDz2vhgxO62t4tGyg6YrefluQiwtrsuO/bnKLFv
 ir1Z5YuDFUXMn1l2bA9ibju+jHG2AiJHVAN9/mbiZEwN0+61eOkcI9Hbm50HVuRT+aTvY+K4sWbWo
 gHi9ySkYyAvzIp+7diY5expc5fDs+ThTsnMlyRx7+PzgvAvSyXBCXQjOmKs2bVQ1/xmJr4LofnL1F
 HbT5ALLebqxJ3wUy2TgdgTt+o562eCoPFfB/1XEnk3ZSJfnG8BvhUQC2aaC/boNo18l2PUX4axprz
 cshy4y1A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmiG-006qcM-TH; Thu, 17 Mar 2022 09:46:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 525613001EA;
 Thu, 17 Mar 2022 10:46:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 42268201CD1C3; Thu, 17 Mar 2022 10:46:32 +0100 (CET)
Date: Thu, 17 Mar 2022 10:46:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <YjMDeKw/3qxclCJf@hirez.programming.kicks-ass.net>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-4-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-4-palmer@rivosinc.com>
Subject: Re: [OpenRISC] [PATCH 3/5] openrisc: Move to ticket-spinlock
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

T24gV2VkLCBNYXIgMTYsIDIwMjIgYXQgMDQ6MjU6NThQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IAo+
IFdlIGhhdmUgbm8gaW5kaWNhdGlvbnMgdGhhdCBvcGVucmlzYyBtZWV0cyB0aGUgcXNwaW5sb2Nr
IHJlcXVpcmVtZW50cywKPiBzbyBtb3ZlIHRvIHRpY2tldC1zcGlubG9jayBhcyB0aGF0IGlzIG1v
cmUgbGlrZXkgdG8gYmUgY29ycmVjdC4KPiAKClNpZ25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJh
IChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
