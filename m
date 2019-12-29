Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 292B3130A0A
	for <lists+openrisc@lfdr.de>; Sun,  5 Jan 2020 22:53:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0CB9F20755;
	Sun,  5 Jan 2020 22:53:37 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by mail.librecores.org (Postfix) with ESMTPS id 3A8F224AB9
 for <openrisc@lists.librecores.org>; Sun, 29 Dec 2019 17:19:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,372,1571695200"; d="scan'208";a="334379015"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 29 Dec 2019 17:19:29 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: kvm@vger.kernel.org
Date: Sun, 29 Dec 2019 16:42:54 +0100
Message-Id: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Sun, 05 Jan 2020 22:53:35 +0100
Subject: [OpenRISC] [PATCH 0/4] use mmgrab
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
Cc: linuxppc-dev@lists.ozlabs.org, Cornelia Huck <cohuck@redhat.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TW1ncmFiIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCBmMWYxMDA3NjQ0ZmYgKCJtbTogYWRkIG5l
dyBtbWdyYWIoKQpoZWxwZXIiKSBhbmQgbW9zdCBvZiB0aGUga2VybmVsIHdhcyB1cGRhdGVkIHRv
IHVzZSBpdC4gVXBkYXRlIGEgZmV3CnJlbWFpbmluZyBmaWxlcy4KCi0tLQoKIGFyY2gvb3BlbnJp
c2Mva2VybmVsL3NtcC5jICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9taXNjL2N4bC9jb250
ZXh0LmMgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX252bGlu
azIuYyB8ICAgIDIgKy0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3NwYXByX3RjZS5jIHwgICAg
MiArLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
