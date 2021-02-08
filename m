Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 49FFF313524
	for <lists+openrisc@lfdr.de>; Mon,  8 Feb 2021 15:27:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 07439205A7;
	Mon,  8 Feb 2021 15:27:48 +0100 (CET)
Received: from mail-out-4.itc.rwth-aachen.de (mail-out-4.itc.rwth-aachen.de
 [134.130.5.49])
 by mail.librecores.org (Postfix) with ESMTPS id B2E01205A7
 for <openrisc@lists.librecores.org>; Mon,  8 Feb 2021 15:27:45 +0100 (CET)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CqBwBDSSFg/5oagoZiHAEBAQEBAQcBA?=
 =?us-ascii?q?RIBAQQEAQGCD4FTgiZplXAInG4LAQEBAQEBAQEBCAEtAgQBAYRLggQCJTgTAhA?=
 =?us-ascii?q?BAQYBAQEBAQYEhl+GH1IbgSMBDQWDJoMHAa98M4kcgUQJAYEuiF6FC4FcP4E4D?=
 =?us-ascii?q?AOCNS4+ijcEgkctYYJduVQHgWuBEpt3BQkgky+Pc5QynTGERQICAgIJAhaBbYF?=
 =?us-ascii?q?6TSRcCYJTUBcCDY4tF41rATxBMjcCBgoBAQMJTy2LHAEB?=
X-IPAS-Result: =?us-ascii?q?A2CqBwBDSSFg/5oagoZiHAEBAQEBAQcBARIBAQQEAQGCD4F?=
 =?us-ascii?q?TgiZplXAInG4LAQEBAQEBAQEBCAEtAgQBAYRLggQCJTgTAhABAQYBAQEBAQYEh?=
 =?us-ascii?q?l+GH1IbgSMBDQWDJoMHAa98M4kcgUQJAYEuiF6FC4FcP4E4DAOCNS4+ijcEgkc?=
 =?us-ascii?q?tYYJduVQHgWuBEpt3BQkgky+Pc5QynTGERQICAgIJAhaBbYF6TSRcCYJTUBcCD?=
 =?us-ascii?q?Y4tF41rATxBMjcCBgoBAQMJTy2LHAEB?=
X-IronPort-AV: E=Sophos;i="5.81,162,1610406000"; d="scan'208";a="98043057"
Received: from rwthex-s2-a.rwth-ad.de ([134.130.26.154])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 08 Feb 2021 15:27:44 +0100
Received: from io.fritz.box (2a02:908:1089:e060:794d:ff8:62d5:f86c) by
 rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2044.4; Mon, 8 Feb 2021 15:27:41 +0100
From: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
To: <geert@linux-m68k.org>, <jonas@southpole.se>,
 <stefan.kristiansson@saunalahti.fi>, <shorne@gmail.com>,
 <openrisc@lists.librecores.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 8 Feb 2021 15:27:16 +0100
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1089:e060:794d:ff8:62d5:f86c]
X-ClientProxiedBy: rwthex-s3-a.rwth-ad.de (2a00:8a60:1:e500::26:160) To
 rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154)
Message-ID: <84102952-2468-4616-b28c-cb5941de7e12@rwthex-s2-a.rwth-ad.de>
Subject: Re: [OpenRISC] [PATCH] Use devicetree to determine present cpus
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
Cc: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U2lnbmVkLW9mZi1ieTogSmFuIEhlbnJpayBXZWluc3RvY2sgPGphbi53ZWluc3RvY2tAcnd0aC1h
YWNoZW4uZGU+Ci0tLQoKUmUtc2VuZCBwYXRjaCB3aXRoIGdpdCBzZW5kbWFpbAoKIGFyY2gvb3Bl
bnJpc2Mva2VybmVsL3NtcC5jIHwgMTggKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL2tlcm5lbC9zbXAuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCmluZGV4IDI5
YzgyZWYyZS4uNzViZTdlMzRmIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAu
YworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYwpAQCAtMTYsNiArMTYsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KICNpbmNs
dWRlIDxsaW51eC9pcnEuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGFzbS9j
cHVpbmZvLmg+CiAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+CiAjaW5jbHVkZSA8YXNtL3Rs
YmZsdXNoLmg+CkBAIC02OCwxNCArNjksMjUgQEAgdm9pZCBfX2luaXQgc21wX2luaXRfY3B1cyh2
b2lkKQogCiB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9jcHVzKHVuc2lnbmVkIGludCBtYXhfY3B1
cykKIHsKLQlpbnQgaTsKKwl1MzIgY3B1X2lkOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY3B1LCAq
Y3B1czsKIAogCS8qCiAJICogSW5pdGlhbGlzZSB0aGUgcHJlc2VudCBtYXAsIHdoaWNoIGRlc2Ny
aWJlcyB0aGUgc2V0IG9mIENQVXMKIAkgKiBhY3R1YWxseSBwb3B1bGF0ZWQgYXQgdGhlIHByZXNl
bnQgdGltZS4KIAkgKi8KLQlmb3IgKGkgPSAwOyBpIDwgbWF4X2NwdXM7IGkrKykKLQkJc2V0X2Nw
dV9wcmVzZW50KGksIHRydWUpOworCWNwdXMgPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiL2NwdXMi
KTsKKwlmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKGNwdXMsIGNwdSkgeworCQlpZiAob2ZfcHJvcGVy
dHlfcmVhZF91MzIoY3B1LCAicmVnIiwgJmNwdV9pZCkpIHsKKwkJCXByX3dhcm4oIiVzIG1pc3Np
bmcgcmVnIHByb3BlcnR5IiwgY3B1LT5mdWxsX25hbWUpOworCQkJY29udGludWU7CisJCX0KKwor
CQlpZiAoY3B1X2lkID49IG1heF9jcHVzKQorCQkJY29udGludWU7CisKKwkJc2V0X2NwdV9wcmVz
ZW50KGNwdV9pZCwgdHJ1ZSk7CisJfQogfQogCiB2b2lkIF9faW5pdCBzbXBfY3B1c19kb25lKHVu
c2lnbmVkIGludCBtYXhfY3B1cykKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
