Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D46F51FECCB
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9E3CF20C4F;
	Thu, 18 Jun 2020 09:47:27 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 2D82620BE0
 for <openrisc@lists.librecores.org>; Thu, 18 Jun 2020 03:29:51 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCE8922229;
 Thu, 18 Jun 2020 01:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443789;
 bh=L7krQWvQ/BaFmjdN656B/vQz1kmE70ALqk8CeDzjA+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CIAFLCWM2DdlphUvSjW26HQHkvKC/98E8nrgPgy8Y05aSFqd2JR9Wh1cFsY8tcwsN
 j3m5xWALFlqxL1Ks6w5ktMXoJg6xAKXUi+BIgnH3gYxU0a+ic8G1jWvS+gHyhFPdIY
 nKiGJ4DiATH6EoY1ePw4xTUQ52Bb3o4p5pxp/tV8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:28:09 -0400
Message-Id: <20200618012819.609778-70-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012819.609778-1-sashal@kernel.org>
References: <20200618012819.609778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: [OpenRISC] [PATCH AUTOSEL 4.9 70/80] openrisc: Fix issue with
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
L2FyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMKaW5kZXggYzE3ZTg0NTFkOTk3Li4zZmJlNDIw
ZjQ5YzQgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMKKysrIGIvYXJj
aC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUwpAQCAtMTA5MiwxMyArMTA5MiwxMyBAQCBFTlRSWShf
X3N5c19jbG9uZSkKIAlsLm1vdmhpCXIyOSxoaShzeXNfY2xvbmUpCiAJbC5vcmkJcjI5LHIyOSxs
byhzeXNfY2xvbmUpCiAJbC5qCV9mb3JrX3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbAotCSBsLmFk
ZGkJcjcscjEsMAorCSBsLm5vcAogCiBFTlRSWShfX3N5c19mb3JrKQogCWwubW92aGkJcjI5LGhp
KHN5c19mb3JrKQogCWwub3JpCXIyOSxyMjksbG8oc3lzX2ZvcmspCiAJbC5qCV9mb3JrX3NhdmVf
ZXh0cmFfcmVnc19hbmRfY2FsbAotCSBsLmFkZGkJcjMscjEsMAorCSBsLm5vcAogCiBFTlRSWShz
eXNfcnRfc2lncmV0dXJuKQogCWwuaglfc3lzX3J0X3NpZ3JldHVybgotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
