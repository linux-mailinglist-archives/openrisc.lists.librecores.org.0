Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0235E2F5545
	for <lists+openrisc@lfdr.de>; Thu, 14 Jan 2021 00:50:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 701312109F;
	Thu, 14 Jan 2021 00:50:43 +0100 (CET)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mail.librecores.org (Postfix) with ESMTPS id 8498720E32
 for <openrisc@lists.librecores.org>; Thu, 14 Jan 2021 00:50:42 +0100 (CET)
Received: by mail-pg1-f180.google.com with SMTP id 15so2532448pgx.7
 for <openrisc@lists.librecores.org>; Wed, 13 Jan 2021 15:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqMcjh8kI4XBDADfpUMZZ82C9W9hxgsQbYZwchOPDJs=;
 b=ZvSw9URaP68cybt3MrickHKEsgyCvZOCxMkDSI0NIlichesVD7Ui9i2L0pH5uMArEB
 jF/tLBktCBPO3noZ3x0MpoGNL9uJvJpNnuYTDHa1GUWhQ9nXmAxPw3/ISlMHJbdf9O0m
 9gS0Ai6dHKdgXU6TRlyLSfmiY9du3LNq7kBn3Hab4Ays14L9c+SEuzba7RZ7Y5+21hUA
 3CouWrxtjoIkKKY5Qht+flL7/y5T2cnYsBY62BEgC9X2+AJgamK5Ejt5p7GcAQxb75uU
 5uAn7QJ+KuUqFfHsSBIiO37IhpIVDQB2IakFijxAgzfcL15uPxvD6we6a7/S8SF4GhMq
 zdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqMcjh8kI4XBDADfpUMZZ82C9W9hxgsQbYZwchOPDJs=;
 b=i8oYsGrBVpCEghHPUcNuijEgavr6VXnR/kCcg4/RDNn+kGAQ5AvTMl48tv+ynOq+Ig
 6Uxpqa+FBgeNgF0fBCocX1fttTJ9D6fq8lMIoBU1PIs0CGao3MHZHjOL8hoKu/w7uS2P
 G38qsaD8m3b1ThsVU7QkplHoW/8Af0+MhU4dfQfmxmKXHm2LxzFbezp9mRnQ5UYFsHdi
 uL/0HZiqOKThzQMZT85/hcA8Kf+kgXAYkKfDJ/y+NuoPAD44tttA/J3qypIS1PRBDmae
 OXpLhZs4nAbcHGK+OFmnoivOSChdlGeqBTXrqn+ae4JtCZLo36Zym7gxlZTIwiOJMYm+
 uptg==
X-Gm-Message-State: AOAM532t3Mz26KRLsQc2MdlvrdUqAl+kNSZDrITfl/vGe4rAPsgYtj8d
 qxs99cK0BezPdiS+6FKNhjw=
X-Google-Smtp-Source: ABdhPJzP1wZRQRkl315/+DakNwEDMQydotHxopzLTY+XlcOm4m5a30TZ2Z4FEGB4Qn8vk4CHBOQlcg==
X-Received: by 2002:a63:4d59:: with SMTP id n25mr4367395pgl.122.1610581840697; 
 Wed, 13 Jan 2021 15:50:40 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 j3sm3794119pjs.50.2021.01.13.15.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 15:50:39 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 14 Jan 2021 08:50:27 +0900
Message-Id: <20210113235032.2821155-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [RESEND PATCH 0/5] OpenRISC GCC Fixes for Glibc Support
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBSZWJhc2UKClRoaXMganVzdCBhIHJlc2VuZCBv
ZiB2MSB3aXRoIG5vIGNoYW5nZXMgZnJvbSB3aGVuIEkgc2VudCBpdCBsYXN0IHllYXIuICBJCmhh
ZG4ndCBjb21taXR0ZWQgaXQgYmVjYXVzZSBJIGhhZCBub3QgY29tcGxldGVkIGFsbCB0ZXN0aW5n
IGluIGdsaWJjLiAgTm93IHRoYXQKSSBoYXZlIGRvbmUgdGhhdCBhbmQgaXQgYWxsIHNlZW1zIHRv
IHdvcmsgSSB3aWxsIGNvbW1pdCBpdC4KCkkgYW0gY3VycmVudGx5IHdvcmtpbmcgb24gdGhlIGds
aWJjIHBvcnQgZm9yIE9wZW5SSVNDLiAgVGhpcyBpcyBhIHNlcmllcyBvZgpwYXRjaGVzIHRoYXQg
Zml4IGlzc3VlcyBhbmQgYWRkIGZlYXR1cmVzIHRoYXQgd2VyZSBtaXNzaW5nIGluIEdDQyBjYXVz
aW5nIGdsaWJjCnRlc3RzdWl0ZSBmYWlsdXJlcy4KClByZXR0eSBtdWNoIGFsbCBvZiB0aGVzZSBj
aGFuZ2VzIGFyZSBqdXN0IGFkZGluZyBtYWNyb3MuCgpUaGVzZSBjaGFuZ2VzIGhhdmUgYmVlbiB0
ZXN0ZWQgdmlhIHRoZSBnbGliYyB0ZXN0IHN1aXRlLgoKLVN0YWZmb3JkCgpTdGFmZm9yZCBIb3Ju
ZSAoNSk6CiAgb3IxazogSW1wbGVtZW50IHByb2ZpbGUgaG9vayBjYWxsaW5nIF9tY291bnQKICBv
cjFrOiBBZGQgYnVpbHRpbiBkZWZpbmUgdG8gZGV0ZWN0IGhhcmQgZmxvYXQKICBvcjFrOiBTdXBw
b3J0IGZvciBzb2Z0ZmxvYXQgdG8gZW11bGF0ZSBodyBleGNlcHRpb25zCiAgb3IxazogQWRkIG5v
dGUgdG8gaW5kaWNhdGUgZXhlY3N0YWNrCiAgb3IxazogRml4dXAgZXhjZXB0aW9uIGhlYWRlciBk
YXRhIGVuY29kaW5ncwoKIGdjYy9jb25maWcvb3Ixay9saW51eC5oICAgICAgICAgIHwgIDIgKysK
IGdjYy9jb25maWcvb3Ixay9vcjFrLmggICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKystLQog
bGliZ2NjL2NvbmZpZy9vcjFrL3NmcC1tYWNoaW5lLmggfCA0MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
