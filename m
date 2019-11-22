Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 37D4F10D430
	for <lists+openrisc@lfdr.de>; Fri, 29 Nov 2019 11:33:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0B64420132;
	Fri, 29 Nov 2019 11:33:11 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 45B3D205F6
 for <openrisc@lists.librecores.org>; Fri, 22 Nov 2019 07:02:15 +0100 (CET)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1222A20714;
 Fri, 22 Nov 2019 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574402533;
 bh=KfUUKl4OJ/iRiB6WP0nLVctzTrRXlSgHQu7Wc1fD4IY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JiICAdxUsXaFIVrmBFiMXWCEgbF0X7vF5JeM4KL2d/Hq8BKCbjWkpwRDmUThmndm1
 5WckBTFdc2QkhNLC26WqKWR3Y7bhoLrteDefuGqqp6lpjb5thBUVdVuXOUSP8t2Cnp
 3UQocA48IlvqBUeyiUtGNyHEvKMzHLSx6Kggp0pI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 22 Nov 2019 01:00:39 -0500
Message-Id: <20191122060129.4239-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122060129.4239-1-sashal@kernel.org>
References: <20191122060129.4239-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Fri, 29 Nov 2019 11:33:08 +0100
Subject: [OpenRISC] [PATCH AUTOSEL 4.9 41/91] openrisc: Fix broken paths to
 arch/or32
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

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KClsgVXBzdHJl
YW0gY29tbWl0IDU3Y2U4YmEwZmQzYTk1YmYyOWVkNzQxZGYxYzUyYmQ1OTFiZjQzZmYgXQoKT3Bl
blJJU0Mgd2FzIG1haW5saW5lZCBhcyAib3BlbnJpc2MiLCBub3QgIm9yMzIiLgp2bWxpbnV4Lmxk
cyBpcyBnZW5lcmF0ZWQgZnJvbSB2bWxpbnV4Lmxkcy5TLgoKU2lnbmVkLW9mZi1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KU2lnbmVkLW9mZi1ieTogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TIHwgMiAr
LQogYXJjaC9vcGVucmlzYy9rZXJuZWwvaGVhZC5TICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2Mva2VybmVsL2VudHJ5LlMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TCmluZGV4IGZl
YzhiZjk3ZDgwNjQuLmMxN2U4NDUxZDk5NzggMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2Vy
bmVsL2VudHJ5LlMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUwpAQCAtMTc5LDcg
KzE3OSw3IEBAIGhhbmRsZXI6CQkJCQkJCTtcCiAgKgkgb2NjdXJlZC4gaW4gZmFjdCB0aGV5IG5l
dmVyIGRvLiBpZiB5b3UgbmVlZCB0aGVtIHVzZQogICoJIHZhbHVlcyBzYXZlZCBvbiBzdGFjayAo
Zm9yIFNQUl9FUEMsIFNQUl9FU1IpIG9yIGNvbnRlbnQKICAqICAgICAgIG9mIHI0IChmb3IgU1BS
X0VFQVIpLiBmb3IgZGV0YWlscyBsb29rIGF0IEVYQ0VQVElPTl9IQU5ETEUoKQotICogICAgICAg
aW4gJ2FyY2gvb3IzMi9rZXJuZWwvaGVhZC5TJworICogICAgICAgaW4gJ2FyY2gvb3BlbnJpc2Mv
a2VybmVsL2hlYWQuUycKICAqLwogCiAvKiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PVsgZXhjZXB0aW9uc10gPT09ICovCmRpZmYgLS1naXQgYS9h
cmNoL29wZW5yaXNjL2tlcm5lbC9oZWFkLlMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9oZWFkLlMK
aW5kZXggZjE0NzkzMzA2YjAzZi4uOThkZDY4NjBiYzBiOSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvaGVhZC5TCisrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL2hlYWQuUwpAQCAt
MTU5Niw3ICsxNTk2LDcgQEAgX3N0cmluZ19lc3JfaXJxX2J1ZzoKIAogLyoKICAqIC5kYXRhIHNl
Y3Rpb24gc2hvdWxkIGJlIHBhZ2UgYWxpZ25lZAotICoJKGxvb2sgaW50byBhcmNoL29yMzIva2Vy
bmVsL3ZtbGludXgubGRzKQorICoJKGxvb2sgaW50byBhcmNoL29wZW5yaXNjL2tlcm5lbC92bWxp
bnV4Lmxkcy5TKQogICovCiAJLnNlY3Rpb24gLmRhdGEsImF3IgogCS5hbGlnbgk4MTkyCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
