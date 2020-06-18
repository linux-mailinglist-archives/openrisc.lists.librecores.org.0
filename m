Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1EA1FECC8
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0622820BDD;
	Thu, 18 Jun 2020 09:47:26 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id D7CB520B6B
 for <openrisc@lists.librecores.org>; Thu, 18 Jun 2020 03:21:09 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B7CE20776;
 Thu, 18 Jun 2020 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443268;
 bh=gcYIdJSBndXo8ib41qkOp7IDNKCp6T94n1aw+8dxIIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BoN2KpAvGSJw8WGp4UGyp/FvDPvv+Mz30sqwWUlzK+SD0IxpKy4USlWZB0ot6GAy/
 l1Cs5ciagwGxP9+pPXQgp83Eo88LYHKgAr5EqKd0cshdiN9ll9ZARvbISRGiaC1V+5
 Ra1/JDmeKvf6XgJQU2xbPnu53wQUJPleHu09CzgQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:15:39 -0400
Message-Id: <20200618011631.604574-214-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: [OpenRISC] [PATCH AUTOSEL 5.4 214/266] openrisc: Fix issue with
 argument clobbering for clone/fork
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
Cc: Sasha Levin <sashal@kernel.org>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA2YmQxNDBlMTRkOWFhYTczNGVjMzc5ODViOGIyMGE5NmMwZWNlOTQ4IF0KCldvcmtpbmcgb24g
dGhlIE9wZW5SSVNDIGdsaWJjIHBvcnQgSSBmb3VuZCB0aGF0IHNvbWV0aW1lcyBjbG9uZSB3YXMK
d29ya2luZyBzdHJhbmdlLiAgVGhhdCB0aGUgdGxzIGRhdGEgYXJndW1lbnQgc2VudCBpbiByNyB3
YXMgYWx3YXlzCndyb25nLiAgRnVydGhlciBpbnZlc3RpZ2F0aW9uIHJldmVhbGVkIHRoYXQgdGhl
IGFyZ3VtZW50cyB3ZXJlIGdldHRpbmcKY2xvYmJlcmVkIGluIHRoZSBlbnRyeSBjb2RlLiAgVGhp
cyBwYXRjaCByZW1vdmVzIHRoZSBjb2RlIHRoYXQgd3JpdGVzIHRvCnRoZSBhcmd1bWVudCByZWdp
c3RlcnMuICBUaGlzIHdhcyBsaWtlbHkgZHVlIHRvIHNvbWUgb2xkIGNvZGUgaGFuZ2luZwphcm91
bmQuCgpUaGlzIHBhdGNoIGZpeGVzIHRoaXMgdXAgZm9yIGNsb25lIGFuZCBmb3JrLiAgVGhpcyBm
b3JrIGNsb2JiZXIgaXMKaGFybWxlc3MgYnV0IGFsc28gdXNlbGVzcyBzbyByZW1vdmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1i
eTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGFyY2gvb3BlbnJpc2Mva2Vy
bmVsL2VudHJ5LlMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUyBi
L2FyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMKaW5kZXggZTRhNzg1NzFmODgzLi5jNjQ4MWNm
YzUyMjAgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMKKysrIGIvYXJj
aC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUwpAQCAtMTE2NiwxMyArMTE2NiwxMyBAQCBFTlRSWShf
X3N5c19jbG9uZSkKIAlsLm1vdmhpCXIyOSxoaShzeXNfY2xvbmUpCiAJbC5vcmkJcjI5LHIyOSxs
byhzeXNfY2xvbmUpCiAJbC5qCV9mb3JrX3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbAotCSBsLmFk
ZGkJcjcscjEsMAorCSBsLm5vcAogCiBFTlRSWShfX3N5c19mb3JrKQogCWwubW92aGkJcjI5LGhp
KHN5c19mb3JrKQogCWwub3JpCXIyOSxyMjksbG8oc3lzX2ZvcmspCiAJbC5qCV9mb3JrX3NhdmVf
ZXh0cmFfcmVnc19hbmRfY2FsbAotCSBsLmFkZGkJcjMscjEsMAorCSBsLm5vcAogCiBFTlRSWShz
eXNfcnRfc2lncmV0dXJuKQogCWwuamFsCV9zeXNfcnRfc2lncmV0dXJuCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
