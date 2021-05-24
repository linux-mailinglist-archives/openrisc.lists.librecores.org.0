Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DF2ED38EA11
	for <lists+openrisc@lfdr.de>; Mon, 24 May 2021 16:51:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8B1C023600;
	Mon, 24 May 2021 16:51:29 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id ADDD3235F5
 for <openrisc@lists.librecores.org>; Mon, 24 May 2021 16:51:27 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF27661628;
 Mon, 24 May 2021 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867886;
 bh=eThF42QgHM2ceyuUbfHXSeQsf1W1pocY7rix57lF/sE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qtj1CByc43ubqeuKDaJlgueh+RA5zj/8/UHMhvZCPy7JEDO53aFM1yusOc56sYx2c
 vULOUecwExcc/Vqc4BFnj2VgST/sEPIu0fiTMKe5NHfb4GwqNyNnHtBME+s5hXHodY
 XvSVUJDnz4oF/coVwl0tun7yVziIfvFEqc/vG5VfEaF05tT4TmaACvCYyaoUZcWLVE
 AaxSlF2hOOZN1YlQdaYDc4BXR889kJy1laBmZMO78JvoBIjL2xFZ/EUQ9UPftmiyx2
 PVsKJABBHHStaNJxHl5Qi5HLMui4f1CmLQjXHYptDcKsRU8k36US+oi3Xmg4mMubC+
 wc1XI6JUXN+vA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 24 May 2021 10:51:03 -0400
Message-Id: <20210524145106.2499571-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524145106.2499571-1-sashal@kernel.org>
References: <20210524145106.2499571-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [OpenRISC] [PATCH AUTOSEL 4.9 16/19] openrisc: Define memory
 barrier mb
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
Cc: Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sashal@kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKWyBVcHN0cmVhbSBj
b21taXQgOGI1NDljMThhZTgxZGJjMzZmYjExZTRhYTA4YjgzNzhjNTk5Y2E5NSBdCgpUaGlzIGNh
bWUgdXAgaW4gdGhlIGRpc2N1c3Npb24gb2YgdGhlIHJlcXVpcmVtZW50cyBvZiBxc3BpbmxvY2sg
b24gYW4KYXJjaGl0ZWN0dXJlLiAgT3BlblJJU0MgdXNlcyBxc3BpbmxvY2ssIGJ1dCBpdCB3YXMg
bm90aWNlZCB0aGF0IHRoZQptZW1tb3J5IGJhcnJpZXIgd2FzIG5vdCBkZWZpbmVkLgoKUGV0ZXIg
ZGVmaW5lZCBpdCBpbiB0aGUgbWFpbCB0aHJlYWQgd3JpdGluZzoKCiAgICBBcyBuZWFyIGFzIEkg
Y2FuIHRlbGwgdGhpcyBzaG91bGQgZG8uIFRoZSBhcmNoIHNwZWMgb25seSBsaXN0cwogICAgdGhp
cyBvbmUgaW5zdHJ1Y3Rpb24gYW5kIHRoZSB0ZXh0IG1ha2VzIGl0IHNvdW5kIGxpa2UgYSBjb21w
bGV0aW9uCiAgICBiYXJyaWVyLgoKVGhpcyBpcyBjb3JyZWN0IHNvIGFwcGx5aW5nIHRoaXMgcGF0
Y2guCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
CltzaG9ybmVAZ21haWwuY29tOlR1cm5lZCB0aGUgbWFpbCBpbnRvIGEgcGF0Y2hdClNpZ25lZC1v
ZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9iYXJyaWVyLmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vYmFycmll
ci5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9iYXJyaWVyLmggYi9h
cmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLjc1MzgyOTQ3MjFiZQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gv
b3BlbnJpc2MvaW5jbHVkZS9hc20vYmFycmllci5oCkBAIC0wLDAgKzEsOSBAQAorLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX19BU01fQkFSUklFUl9ICisj
ZGVmaW5lIF9fQVNNX0JBUlJJRVJfSAorCisjZGVmaW5lIG1iKCkgYXNtIHZvbGF0aWxlICgibC5t
c3luYyIgOjo6ICJtZW1vcnkiKQorCisjaW5jbHVkZSA8YXNtLWdlbmVyaWMvYmFycmllci5oPgor
CisjZW5kaWYgLyogX19BU01fQkFSUklFUl9IICovCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
