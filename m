Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8017B26AD89
	for <lists+openrisc@lfdr.de>; Tue, 15 Sep 2020 21:26:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 005AE20CAE;
	Tue, 15 Sep 2020 21:26:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 2BCD320C9D
 for <openrisc@lists.librecores.org>; Mon, 14 Sep 2020 15:04:22 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65233221F0;
 Mon, 14 Sep 2020 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600088660;
 bh=R7mR3aLIf2CGGcWqGZaqKCMfrWa7L3YNwpWo4rPGCRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R1iFdRwyik/jKqybdpIuJep7fjWp/47AovwR7LMIRZf9huSkQCWa3X5tAnhHlMR8I
 CnGNbM833tIs3zR7VQ4hGnKbB77gHPDABr+TmOf8a3qqgTgslwWFsCRktkBFkKwV15
 AU2cOvQjvl3I8+uZYd24ZC4+i+6zZtZkhybi79wQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 14 Sep 2020 09:03:47 -0400
Message-Id: <20200914130358.1804194-18-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914130358.1804194-1-sashal@kernel.org>
References: <20200914130358.1804194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Tue, 15 Sep 2020 21:26:35 +0200
Subject: [OpenRISC] [PATCH AUTOSEL 5.8 18/29] openrisc: Fix cache API
 compile issue when not inlining
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
dCAzYWU5MGQ3NjQwOTNkZmNkNmFiOGFiNjg3NTM3NzMwMjg5MmM4N2Q0IF0KCkkgZm91bmQgdGhp
cyB3aGVuIGNvbXBpbGluZyBhIGtidWlsZCByYW5kb20gY29uZmlnIHdpdGggR0NDIDExLiAgVGhl
CmNvbmZpZyBlbmFibGVzIENPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENILCB3aGljaCBzZXRz
IENGTEFHUwotZm5vLWlubGluZS1mdW5jdGlvbnMtY2FsbGVkLW9uY2UuIFRoaXMgY2F1c2VzIHRo
ZSBjYWxsIHRvIGNhY2hlX2xvb3AgaW4KY2FjaGUuYyB0byBub3QgYmUgaW5saW5lZCBjYXVzaW5n
IHRoZSBiZWxvdyBjb21waWxlIGVycm9yLgoKICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBhcmNo
L29wZW5yaXNjL21tL2NhY2hlLmM6MTM6CiAgICBhcmNoL29wZW5yaXNjL21tL2NhY2hlLmM6IElu
IGZ1bmN0aW9uICdjYWNoZV9sb29wJzoKICAgIC4vYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9z
cHIuaDoxNjoyNzogd2FybmluZzogJ2FzbScgb3BlcmFuZCAwIHByb2JhYmx5IGRvZXMgbm90IG1h
dGNoIGNvbnN0cmFpbnRzCiAgICAgICAxNiB8ICNkZWZpbmUgbXRzcHIoX3NwciwgX3ZhbCkgX19h
c21fXyBfX3ZvbGF0aWxlX18gKCAgXAoJICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fgogICAgYXJjaC9vcGVucmlzYy9tbS9jYWNoZS5jOjI1OjM6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyAnbXRzcHInCiAgICAgICAyNSB8ICAgbXRzcHIocmVnLCBsaW5lKTsKCSAgfCAg
IF5+fn5+CiAgICAuL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3ByLmg6MTY6Mjc6IGVycm9y
OiBpbXBvc3NpYmxlIGNvbnN0cmFpbnQgaW4gJ2FzbScKICAgICAgIDE2IHwgI2RlZmluZSBtdHNw
cihfc3ByLCBfdmFsKSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICBcCgkgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+CiAgICBhcmNoL29wZW5yaXNjL21tL2NhY2hlLmM6MjU6Mzog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdtdHNwcicKICAgICAgIDI1IHwgICBtdHNwcihy
ZWcsIGxpbmUpOwoJICB8ICAgXn5+fn4KICAgIG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDoyODM6IGFyY2gvb3BlbnJpc2MvbW0vY2FjaGUub10gRXJyb3IgMQoKVGhlIGFzbSBj
b25zdHJhaW50ICJLIiByZXF1aXJlcyBhIGltbWVkaWF0ZSBjb25zdGFudCBhcmd1bWVudCB0byBt
dHNwciwKaG93ZXZlciBiZWNhdXNlIG9mIG5vIGlubGluaW5nIGEgcmVnaXN0ZXIgYXJndW1lbnQg
aXMgcGFzc2VkIGNhdXNpbmcgYQpmYWlsdXJlLiAgRml4IHRoaXMgYnkgdXNpbmcgX19hbHdheXNf
aW5saW5lLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDgyMDA0NTMu
b2huaHFralElMjVsa3BAaW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8
c2hvcm5lQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIGFyY2gvb3BlbnJpc2MvbW0vY2FjaGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3Bl
bnJpc2MvbW0vY2FjaGUuYyBiL2FyY2gvb3BlbnJpc2MvbW0vY2FjaGUuYwppbmRleCAwOGY1NmFm
Mzg3YWM0Li41MzRhNTJlYzVlNjY3IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL21tL2NhY2hl
LmMKKysrIGIvYXJjaC9vcGVucmlzYy9tbS9jYWNoZS5jCkBAIC0xNiw3ICsxNiw3IEBACiAjaW5j
bHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxhc20vdGxiZmx1c2guaD4KIAotc3Rh
dGljIHZvaWQgY2FjaGVfbG9vcChzdHJ1Y3QgcGFnZSAqcGFnZSwgY29uc3QgdW5zaWduZWQgaW50
IHJlZykKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBjYWNoZV9sb29wKHN0cnVjdCBwYWdl
ICpwYWdlLCBjb25zdCB1bnNpZ25lZCBpbnQgcmVnKQogewogCXVuc2lnbmVkIGxvbmcgcGFkZHIg
PSBwYWdlX3RvX3BmbihwYWdlKSA8PCBQQUdFX1NISUZUOwogCXVuc2lnbmVkIGxvbmcgbGluZSA9
IHBhZGRyICYgfihMMV9DQUNIRV9CWVRFUyAtIDEpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
