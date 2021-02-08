Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B1198313525
	for <lists+openrisc@lfdr.de>; Mon,  8 Feb 2021 15:29:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7EA8821124;
	Mon,  8 Feb 2021 15:29:01 +0100 (CET)
Received: from mail-out-3.itc.rwth-aachen.de (mail-out-3.itc.rwth-aachen.de
 [134.130.5.48])
 by mail.librecores.org (Postfix) with ESMTPS id 68535205A7
 for <openrisc@lists.librecores.org>; Mon,  8 Feb 2021 15:29:00 +0100 (CET)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CqBwBZSiFg/5oagoZiHAEBAQEBAQcBA?=
 =?us-ascii?q?RIBAQQEAQGCD4FTgiZplW8InG4LAQEBAQEBAQEBCAEtAgQBAYRLggQCJTgTAhA?=
 =?us-ascii?q?BAQYBAQEBAQYEhl+GH1IbgSMBDQWDJoMHAa9yM4kdgUQJAYEuiF6FC4FcP4E4D?=
 =?us-ascii?q?AOCNS4+ijcEgkctYZM4qHkHgWuBEpt3BSmTL49zlDKdMYRFAgICAgkCFoFtgXp?=
 =?us-ascii?q?NJFwJglNQFwINji0XjWsBPEEyNwIGCgEBAwlPLYscAQE?=
X-IPAS-Result: =?us-ascii?q?A2CqBwBZSiFg/5oagoZiHAEBAQEBAQcBARIBAQQEAQGCD4F?=
 =?us-ascii?q?TgiZplW8InG4LAQEBAQEBAQEBCAEtAgQBAYRLggQCJTgTAhABAQYBAQEBAQYEh?=
 =?us-ascii?q?l+GH1IbgSMBDQWDJoMHAa9yM4kdgUQJAYEuiF6FC4FcP4E4DAOCNS4+ijcEgkc?=
 =?us-ascii?q?tYZM4qHkHgWuBEpt3BSmTL49zlDKdMYRFAgICAgkCFoFtgXpNJFwJglNQFwINj?=
 =?us-ascii?q?i0XjWsBPEEyNwIGCgEBAwlPLYscAQE?=
X-IronPort-AV: E=Sophos;i="5.81,162,1610406000"; d="scan'208";a="113311174"
Received: from rwthex-s2-a.rwth-ad.de ([134.130.26.154])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 08 Feb 2021 15:28:50 +0100
Received: from io.fritz.box (2a02:908:1089:e060:794d:ff8:62d5:f86c) by
 rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2044.4; Mon, 8 Feb 2021 15:28:46 +0100
From: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
To: <geert@linux-m68k.org>, <jonas@southpole.se>,
 <stefan.kristiansson@saunalahti.fi>, <shorne@gmail.com>,
 <openrisc@lists.librecores.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 8 Feb 2021 15:28:32 +0100
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1089:e060:794d:ff8:62d5:f86c]
X-ClientProxiedBy: rwthex-w3-b.rwth-ad.de (2a00:8a60:1:e500::26:163) To
 rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154)
Message-ID: <9dc6c716-c5da-4214-96d8-e088db29d403@rwthex-s2-a.rwth-ad.de>
Subject: Re: [OpenRISC] [PATCH v2] Use devicetree to determine present cpus
 (v2)
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
YWNoZW4uZGU+Ci0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMgfCAzMSArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMg
Yi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYwppbmRleCA3NWJlN2UzNGYuLjgzY2JmNDNkNCAx
MDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKKysrIGIvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc21wLmMKQEAgLTYxLDMyICs2MSwzMSBAQCB2b2lkIF9faW5pdCBzbXBfcHJlcGFy
ZV9ib290X2NwdSh2b2lkKQogCiB2b2lkIF9faW5pdCBzbXBfaW5pdF9jcHVzKHZvaWQpCiB7Ci0J
aW50IGk7CisJc3RydWN0IGRldmljZV9ub2RlKiBjcHU7CisJdTMyIGNwdV9pZDsKKworCWZvcl9l
YWNoX29mX2NwdV9ub2RlKGNwdSkgeworCQlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIoY3B1LCAi
cmVnIiwgJmNwdV9pZCkpIHsKKwkJCXByX3dhcm4oIiVzIG1pc3NpbmcgcmVnIHByb3BlcnR5Iiwg
Y3B1LT5mdWxsX25hbWUpOworCQkJY29udGludWU7CisJCX0KIAotCWZvciAoaSA9IDA7IGkgPCBO
Ul9DUFVTOyBpKyspCi0JCXNldF9jcHVfcG9zc2libGUoaSwgdHJ1ZSk7CisJCWlmIChjcHVfaWQg
PCBOUl9DUFVTKQorCQkJc2V0X2NwdV9wb3NzaWJsZShjcHVfaWQsIHRydWUpOworCX0KIH0KIAog
dm9pZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCiB7Ci0J
dTMyIGNwdV9pZDsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNwdSwgKmNwdXM7CisJdW5zaWduZWQg
aW50IGNwdTsKIAogCS8qCiAJICogSW5pdGlhbGlzZSB0aGUgcHJlc2VudCBtYXAsIHdoaWNoIGRl
c2NyaWJlcyB0aGUgc2V0IG9mIENQVXMKIAkgKiBhY3R1YWxseSBwb3B1bGF0ZWQgYXQgdGhlIHBy
ZXNlbnQgdGltZS4KIAkgKi8KLQljcHVzID0gb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi9jcHVzIik7
Ci0JZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShjcHVzLCBjcHUpIHsKLQkJaWYgKG9mX3Byb3BlcnR5
X3JlYWRfdTMyKGNwdSwgInJlZyIsICZjcHVfaWQpKSB7Ci0JCQlwcl93YXJuKCIlcyBtaXNzaW5n
IHJlZyBwcm9wZXJ0eSIsIGNwdS0+ZnVsbF9uYW1lKTsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KLQkJ
aWYgKGNwdV9pZCA+PSBtYXhfY3B1cykKLQkJCWNvbnRpbnVlOwotCi0JCXNldF9jcHVfcHJlc2Vu
dChjcHVfaWQsIHRydWUpOworCWZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKKwkJaWYgKGNw
dSA8IG1heF9jcHVzKQorCQkJc2V0X2NwdV9wcmVzZW50KGNwdSwgdHJ1ZSk7CiAJfQogfQogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
