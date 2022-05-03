Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A64F5518189
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 11:45:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5B122248D5;
	Tue,  3 May 2022 11:45:41 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 0FE4C20D0C
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 11:45:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C51FC6146C;
 Tue,  3 May 2022 09:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB99C385A9;
 Tue,  3 May 2022 09:45:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FeSLEXto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651571136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cDqyYBTb2VLcJLG8q4FQnCZ2mbz3xpLWhjf3FPvWSIM=;
 b=FeSLEXtoldoeZ6kYqLDcXK3dWsb+kaT17e4IhwSJlfOPQIlkw9QB7+gt0JwGIu1DudrZ2J
 QnKpG3OBTBwnBResPOYgMVeAnuF16p0lldKLaz3pAyQdbbiRJHhgcyRKscctdl8hfE/q12
 wsItlpu40Pkljb02AEjH/mZ+/Rgm4so=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61cb67cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 May 2022 09:45:35 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org, openrisc@lists.librecores.org, shorne@gmail.com,
 richard.henderson@linaro.org
Date: Tue,  3 May 2022 11:45:33 +0200
Message-Id: <20220503094533.402157-1-Jason@zx2c4.com>
In-Reply-To: <20220502232800.259036-1-Jason@zx2c4.com>
References: <20220502232800.259036-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2] hw/openrisc: use right OMPIC size variable
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
d2FzIHVzZWQKaW5zdGVhZCBvZiB0aGUgbXVjaCBzbWFsbGVyIE9NUElDIHNpemUuIEJ1dCBhY3R1
YWxseSB0aGF0IHNtYWxsZXIgT01QSUMKc2l6ZSBpcyB3cm9uZyB0b28gYW5kIGRvZXNuJ3QgYWxs
b3cgdGhlIElQSSB0byB3b3JrIGluIExpbnV4LiBTbyBzZXQgaXQKdG8gdGhlIG9sZCB2YWx1ZS4K
ClNpZ25lZC1vZmYtYnk6IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPgotLS0K
IGh3L29wZW5yaXNjL29wZW5yaXNjX3NpbS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L29wZW5yaXNjL29w
ZW5yaXNjX3NpbS5jIGIvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKaW5kZXggOTliMTQ5NDBm
NC4uMzIxOGRiNjY1NiAxMDA2NDQKLS0tIGEvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKKysr
IGIvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKQEAgLTc4LDcgKzc4LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBNZW1tYXBFbnRyeSB7CiAgICAgW09SMUtTSU1fRFJBTV0gPSAgICAgIHsgMHgw
MDAwMDAwMCwgICAgICAgICAgMCB9LAogICAgIFtPUjFLU0lNX1VBUlRdID0gICAgICB7IDB4OTAw
MDAwMDAsICAgICAgMHgxMDAgfSwKICAgICBbT1IxS1NJTV9FVEhPQ10gPSAgICAgeyAweDkyMDAw
MDAwLCAgICAgIDB4ODAwIH0sCi0gICAgW09SMUtTSU1fT01QSUNdID0gICAgIHsgMHg5ODAwMDAw
MCwgICAgICAgICAxNiB9LAorICAgIFtPUjFLU0lNX09NUElDXSA9ICAgICB7IDB4OTgwMDAwMDAs
ICAgICAgMHgxMDAgfSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3Qgb3BlbnJpc2NfYm9vdF9pbmZvIHsK
QEAgLTQxMCw3ICs0MTAsNyBAQCBzdGF0aWMgdm9pZCBvcGVucmlzY19zaW1faW5pdChNYWNoaW5l
U3RhdGUgKm1hY2hpbmUpCiAKICAgICBpZiAoc21wX2NwdXMgPiAxKSB7CiAgICAgICAgIG9wZW5y
aXNjX3NpbV9vbXBpY19pbml0KHN0YXRlLCBvcjFrc2ltX21lbW1hcFtPUjFLU0lNX09NUElDXS5i
YXNlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcjFrc2ltX21lbW1hcFtPUjFL
U0lNX1VBUlRdLnNpemUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9yMWtzaW1f
bWVtbWFwW09SMUtTSU1fT01QSUNdLnNpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNtcF9jcHVzLCBjcHVzLCBPUjFLU0lNX09NUElDX0lSUSk7CiAgICAgfQogCi0tIAoyLjM1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
