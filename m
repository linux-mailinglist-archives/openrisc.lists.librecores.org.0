Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 10D8C163122
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5EBD5207D6;
	Tue, 18 Feb 2020 21:00:17 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9368C206A4
 for <openrisc@lists.librecores.org>; Thu, 30 Jan 2020 20:19:55 +0100 (CET)
Received: from localhost.localdomain (unknown [194.230.155.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B8C5206D3;
 Thu, 30 Jan 2020 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580411994;
 bh=U/nSPCPNY5aQm78EL2stSwt65JQCEiKVRGoFmok1WQA=;
 h=From:To:Cc:Subject:Date:From;
 b=whZMIlV0IT+weEuj+TdmaWizef4yp0jlCBEBa7NxnxD/Cs+Bm4Hueh69RB9JQvZMr
 MPWLl89v1/iJPAtcaRjgEX4TNxf6/11C0HFeSQXvc2kKTW1LOT+N90mYsO3ZyZjjjv
 Ojxtw8lrGeZnnFL32LjNNrvlwIbKw3aFbwGkW6Hw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Date: Thu, 30 Jan 2020 20:19:38 +0100
Message-Id: <20200130191938.2444-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:14 +0100
Subject: [OpenRISC] [PATCH] openrisc: configs: Cleanup CONFIG_CROSS_COMPILE
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q09ORklHX0NST1NTX0NPTVBJTEUgaXMgZ29uZSBzaW5jZSBjb21taXQgZjEwODljOTJkYTc5ICgi
a2J1aWxkOiByZW1vdmUKQ09ORklHX0NST1NTX0NPTVBJTEUgc3VwcG9ydCIpLgoKU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGFyY2gvb3Bl
bnJpc2MvY29uZmlncy9vcjFrc2ltX2RlZmNvbmZpZyAgICB8IDEgLQogYXJjaC9vcGVucmlzYy9j
b25maWdzL3NpbXBsZV9zbXBfZGVmY29uZmlnIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVm
Y29uZmlnIGIvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVmY29uZmlnCmluZGV4IGQ4
ZmY0ZjhmZmI4OC4uNzVmMmRhMzI0ZDBlIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2NvbmZp
Z3Mvb3Ixa3NpbV9kZWZjb25maWcKKysrIGIvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1f
ZGVmY29uZmlnCkBAIC0xLDQgKzEsMyBAQAotQ09ORklHX0NST1NTX0NPTVBJTEU9Im9yMWstbGlu
dXgtIgogQ09ORklHX05PX0haPXkKIENPTkZJR19MT0dfQlVGX1NISUZUPTE0CiBDT05GSUdfQkxL
X0RFVl9JTklUUkQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9jb25maWdzL3NpbXBsZV9z
bXBfZGVmY29uZmlnIGIvYXJjaC9vcGVucmlzYy9jb25maWdzL3NpbXBsZV9zbXBfZGVmY29uZmln
CmluZGV4IDY0Mjc4OTkyZGY5Yy4uZmY0OWQ4NjhlMDQwIDEwMDY0NAotLS0gYS9hcmNoL29wZW5y
aXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZjb25maWcKKysrIGIvYXJjaC9vcGVucmlzYy9jb25m
aWdzL3NpbXBsZV9zbXBfZGVmY29uZmlnCkBAIC0xLDQgKzEsMyBAQAotQ09ORklHX0NST1NTX0NP
TVBJTEU9Im9yMWstbGludXgtIgogQ09ORklHX0xPQ0FMVkVSU0lPTj0iLXNpbXBsZS1zbXAiCiBD
T05GSUdfTk9fSFo9eQogQ09ORklHX0xPR19CVUZfU0hJRlQ9MTQKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
