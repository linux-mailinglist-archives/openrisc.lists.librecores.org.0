Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0574F496F9F
	for <lists+openrisc@lfdr.de>; Sun, 23 Jan 2022 03:28:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8050220CF1;
	Sun, 23 Jan 2022 03:28:08 +0100 (CET)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by mail.librecores.org (Postfix) with ESMTPS id 6790223F8D
 for <openrisc@lists.librecores.org>; Sun, 23 Jan 2022 03:01:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
 s=amazon201209; t=1642903274; x=1674439274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RD7Kb5HGRmxu1H1Kfab4Hp6cNBfxp5ZMBIq2r6UZWr8=;
 b=gWRvdhh8387USA6J/m9Uu/pW4s92iXiJI/3qGnPtlRfnSOJMFYO2J//S
 vG6GN48wciWQHR/Ly6M5EwTDRNSyauk18SDCGgNhhCYeqMvVPkeO7MeL4
 byCkK91qabAcLUMOnB3Cc8bCJEgaWj9szDYWNBfkB0RFq2bgwNSEYGkem g=;
X-IronPort-AV: E=Sophos;i="5.88,309,1635206400"; d="scan'208";a="189275472"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-72dc3927.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 23 Jan 2022 02:01:11 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-72dc3927.us-west-2.amazon.com (Postfix) with
 ESMTPS id 196E0419A5; Sun, 23 Jan 2022 02:01:11 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Sun, 23 Jan 2022 02:01:09 +0000
Received: from 88665a182662.ant.amazon.com (10.43.160.114) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Sun, 23 Jan 2022 02:01:05 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
To: Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>
Date: Sun, 23 Jan 2022 11:01:00 +0900
Message-ID: <20220123020100.45201-1-kuniyu@amazon.co.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.43.160.114]
X-ClientProxiedBy: EX13D45UWA004.ant.amazon.com (10.43.160.151) To
 EX13D04ANC001.ant.amazon.com (10.43.157.89)
X-Mailman-Approved-At: Sun, 23 Jan 2022 03:28:08 +0100
Subject: [OpenRISC] [PATCH] openrisc/boot: Remove unnecessary initialisation
 in memcpy().
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
 Benjamin Herrenschmidt <benh@amazon.com>, openrisc@lists.librecores.org,
 Kuniyuki Iwashima <kuni1840@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

J2QnIGFuZCAncycgYXJlIGluaXRpYWxpc2VkIGxhdGVyIHdpdGggJ2Rlc3RfdycgYW5kICdzcmNf
dycsIHNvIHdlIG5lZWQgbm90CmluaXRpYWxpc2UgdGhlbSBiZWZvcmUgdGhhdC4KClNpZ25lZC1v
ZmYtYnk6IEt1bml5dWtpIEl3YXNoaW1hIDxrdW5peXVAYW1hem9uLmNvLmpwPgotLS0KIGFyY2gv
b3BlbnJpc2MvbGliL21lbWNweS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9saWIvbWVtY3B5
LmMgYi9hcmNoL29wZW5yaXNjL2xpYi9tZW1jcHkuYwppbmRleCBmZTIxNzc2MjguLmUyYWY5YjUx
MCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9saWIvbWVtY3B5LmMKKysrIGIvYXJjaC9vcGVu
cmlzYy9saWIvbWVtY3B5LmMKQEAgLTEwMSw3ICsxMDEsNyBAQCB2b2lkICptZW1jcHkodm9pZCAq
ZGVzdCwgX19jb25zdCB2b2lkICpzcmMsIF9fa2VybmVsX3NpemVfdCBuKQogICovCiB2b2lkICpt
ZW1jcHkodm9pZCAqZGVzdCwgX19jb25zdCB2b2lkICpzcmMsIF9fa2VybmVsX3NpemVfdCBuKQog
ewotCXVuc2lnbmVkIGNoYXIgKmQgPSAodW5zaWduZWQgY2hhciAqKWRlc3QsICpzID0gKHVuc2ln
bmVkIGNoYXIgKilzcmM7CisJdW5zaWduZWQgY2hhciAqZCwgKnM7CiAJdWludDMyX3QgKmRlc3Rf
dyA9ICh1aW50MzJfdCAqKWRlc3QsICpzcmNfdyA9ICh1aW50MzJfdCAqKXNyYzsKIAogCS8qIElm
IGJvdGggc291cmNlIGFuZCBkZXN0IGFyZSB3b3JkIGFsaWduZWQgY29weSB3b3JkcyAqLwotLSAK
Mi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
