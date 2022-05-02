Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 10865517ACA
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 01:28:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C064B248EE;
	Tue,  3 May 2022 01:28:07 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 2B245248E3
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 01:28:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5AD9B81AE8;
 Mon,  2 May 2022 23:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295BEC385AC;
 Mon,  2 May 2022 23:28:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZadJ6MOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651534082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TY3V9cWsgB3DfKT2TM6FJDKc21DnhZRW8iveuh3Ne84=;
 b=ZadJ6MOl3S0vjgkJyKOoxySxIlO5mQrjtUA0VbCXWrR03yIWR4LVhq00M5xf3muKAfPvZh
 lj0OxaZwgB457z9xy3taD8EsyUOoyYlZnkKb9E5tnLl2AEIem9JTQnGNHUVFKXUTkHwMsB
 uwXuqnoNUaEJ3NVUI8ZYDwRSrj97bAc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 354b7bef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 2 May 2022 23:28:02 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	openrisc@lists.librecores.org,
	shorne@gmail.com
Date: Tue,  3 May 2022 01:28:00 +0200
Message-Id: <20220502232800.259036-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] hw/openrisc: use right OMPIC size variable
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBhcHBlYXJzIHRvIGJlIGEgY29weSBhbmQgcGFzdGUgZXJyb3IuIFRoZSBVQVJUIHNpemUg
d2FzIHVzZWQKaW5zdGVhZCBvZiB0aGUgbXVjaCBzbWFsbGVyIE9NUElDIHNpemUuCgpTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KLS0tCiBody9vcGVu
cmlzYy9vcGVucmlzY19zaW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3L29wZW5yaXNjL29wZW5yaXNjX3NpbS5j
IGIvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKaW5kZXggOTliMTQ5NDBmNC4uYmY0MzRlOTcz
NyAxMDA2NDQKLS0tIGEvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKKysrIGIvaHcvb3BlbnJp
c2Mvb3BlbnJpc2Nfc2ltLmMKQEAgLTQxMCw3ICs0MTAsNyBAQCBzdGF0aWMgdm9pZCBvcGVucmlz
Y19zaW1faW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAKICAgICBpZiAoc21wX2NwdXMgPiAx
KSB7CiAgICAgICAgIG9wZW5yaXNjX3NpbV9vbXBpY19pbml0KHN0YXRlLCBvcjFrc2ltX21lbW1h
cFtPUjFLU0lNX09NUElDXS5iYXNlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBv
cjFrc2ltX21lbW1hcFtPUjFLU0lNX1VBUlRdLnNpemUsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG9yMWtzaW1fbWVtbWFwW09SMUtTSU1fT01QSUNdLnNpemUsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNtcF9jcHVzLCBjcHVzLCBPUjFLU0lNX09NUElDX0lSUSk7
CiAgICAgfQogCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
