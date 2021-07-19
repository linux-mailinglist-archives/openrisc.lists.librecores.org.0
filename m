Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 39B1A3CCC49
	for <lists+openrisc@lfdr.de>; Mon, 19 Jul 2021 04:33:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DD2B520162;
	Mon, 19 Jul 2021 04:33:21 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id E7A6F23E0D
 for <openrisc@lists.librecores.org>; Mon, 19 Jul 2021 04:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/UZVBmXnYvP61myU7O8bG2pwsIQUzRdPvRFJy2H3QRY=; b=C4SxYaZ5TGPB3vNYI4QCR4R1uD
 J1UkLV1EZZjUpTBOr49GL2n+lOtNgCGw8nrHQ2eaKXDHkBZbH84LfpWuVH+NFKbmnhhJoCTv9vr7c
 1h1MeTgorsIjjQLqmTFAC+ZPsmp39HAB2ttDrC0cmvNQrpbjmYF6qnamu9W5QMxRmJRMz4fj2jUi8
 TsoCv9YmP73/q2MZQo5JeQLcouHLTZL9uUwkN09KDhVzvRWEaiSa5fAq9M7fP3/JIyvMaP5RHPZky
 OUisuQCruee7m/7viSFd5vKUzclXMscG5oe9SV09yuLy/puTn1hoo1cB4KCcI5N6vi3RXAvtBCz4T
 pzt74b7g==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5J5i-008HZp-IX; Mon, 19 Jul 2021 02:33:10 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 18 Jul 2021 19:33:09 -0700
Message-Id: <20210719023309.15808-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: don't printk() unconditionally
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
Cc: Jonas Bonn <jonas@southpole.se>, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RG9uJ3QgY2FsbCBwcmludGsoKSB3aGVuIENPTkZJR19QUklOVEsgaXMgbm90IHNldC4KRml4ZXMg
dGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcnM6CgpvcjFrLWxpbnV4LWxkOiBhcmNoL29wZW5yaXNj
L2tlcm5lbC9lbnRyeS5vOiBpbiBmdW5jdGlvbiBgX2V4dGVybmFsX2lycV9oYW5kbGVyJzoKKC50
ZXh0KzB4ODA0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcHJpbnRrJwooLnRleHQrMHg4MDQp
OiByZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfT1IxS19JTlNOX1JFTF8yNiBhZ2FpbnN0
IHVuZGVmaW5lZCBzeW1ib2wgYHByaW50aycKCkZpeGVzOiA5ZDAyYTQyODNlOWMgKCJPcGVuUklT
QzogQm9vdCBjb2RlIikKU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
Q2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KQ2M6IFN0ZWZhbiBLcmlzdGlhbnNz
b24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KQ2M6IFN0YWZmb3JkIEhvcm5l
IDxzaG9ybmVAZ21haWwuY29tPgpDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKLS0t
CiBhcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TIHwgICAgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKLS0tIGxpbnV4LW5leHQtMjAyMTA3MTYub3JpZy9hcmNoL29wZW5y
aXNjL2tlcm5lbC9lbnRyeS5TCisrKyBsaW51eC1uZXh0LTIwMjEwNzE2L2FyY2gvb3BlbnJpc2Mv
a2VybmVsL2VudHJ5LlMKQEAgLTU0Nyw2ICs1NDcsNyBAQCBFWENFUFRJT05fRU5UUlkoX2V4dGVy
bmFsX2lycV9oYW5kbGVyKQogCWwuYm5mCTFmCQkJLy8gZXh0IGlycSBlbmFibGVkLCBhbGwgb2su
CiAJbC5ub3AKIAorI2lmZGVmIENPTkZJR19QUklOVEsKIAlsLmFkZGkgIHIxLHIxLC0weDgKIAls
Lm1vdmhpIHIzLGhpKDQyZikKIAlsLm9yaQlyMyxyMyxsbyg0MmYpCkBAIC01NjAsNiArNTYxLDcg
QEAgRVhDRVBUSU9OX0VOVFJZKF9leHRlcm5hbF9pcnFfaGFuZGxlcikKIAkJLnN0cmluZyAiXG5c
ckVTUiBpbnRlcnJ1cHQgYnVnOiBpbiBfZXh0ZXJuYWxfaXJxX2hhbmRsZXIgKEVTUiAleClcblxy
IgogCQkuYWxpZ24gNAogCS5wcmV2aW91cworI2VuZGlmCiAKIAlsLm9yaQlyNCxyNCxTUFJfU1Jf
SUVFCS8vIGZpeCB0aGUgYnVnCiAvLwlsLnN3CVBUX1NSKHIxKSxyNApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
