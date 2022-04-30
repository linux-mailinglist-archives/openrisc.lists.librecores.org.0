Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7953F5160BE
	for <lists+openrisc@lfdr.de>; Sun,  1 May 2022 00:31:23 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3319023E0C;
	Sun,  1 May 2022 00:31:23 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by mail.librecores.org (Postfix) with ESMTPS id 0314624130
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 21:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KKRMEhm6E9OULXQj/2ozKvf9pBOL41UsvUOuoruylJM=;
 b=EZF+64GmXuX6iNrbjP0cHFLgu9o40cU0g+bimCQFN/pfd8v8YilNzgJH
 mH0OKWXPPpa9fX72KpVHGhBIi6Z7e9C6KhXgIJFuvI4xOZQPn/dQu6EE/
 VRgfbE2CxgvSt5o2q//H5MtFozwhqtmIfBZRji3RgWMsr+K945aWsAnED k=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,188,1647298800"; d="scan'208";a="34084621"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 21:11:33 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jonas Bonn <jonas@southpole.se>
Date: Sat, 30 Apr 2022 21:11:22 +0200
Message-Id: <20220430191122.8667-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 May 2022 00:31:21 +0200
Subject: [OpenRISC] [PATCH] openrisc: fix typos in comments
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
Cc: openrisc@lists.librecores.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VmFyaW91cyBzcGVsbGluZyBtaXN0YWtlcyBpbiBjb21tZW50cy4KRGV0ZWN0ZWQgd2l0aCB0aGUg
aGVscCBvZiBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogSnVsaWEgTGF3YWxsIDxKdWxpYS5M
YXdhbGxAaW5yaWEuZnI+CgotLS0KIGFyY2gvb3BlbnJpc2MvbW0vdGxiLmMgfCAgICAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9hcmNoL29wZW5yaXNjL21tL3RsYi5jIGIvYXJjaC9vcGVucmlzYy9tbS90bGIuYwppbmRleCAy
YjZmZWFiZjYzODEuLmUyZjJhM2MzYmIyMiAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9tbS90
bGIuYworKysgYi9hcmNoL29wZW5yaXNjL21tL3RsYi5jCkBAIC0xMjgsNyArMTI4LDcgQEAgdm9p
ZCBsb2NhbF9mbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAKIAkvKiBXYXMgc2Vl
aW5nIGJ1Z3Mgd2l0aCB0aGUgbW0gc3RydWN0IHBhc3NlZCB0byB1cy4gU2NyYXBwZWQgbW9zdCBv
ZgogCSAgIHRoaXMgZnVuY3Rpb24uICovCi0JLyogU2V2ZXJhbCBhcmNoaXRjdHVyZXMgZG8gdGhp
cyAqLworCS8qIFNldmVyYWwgYXJjaGl0ZWN0dXJlcyBkbyB0aGlzICovCiAJbG9jYWxfZmx1c2hf
dGxiX2FsbCgpOwogfQogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
