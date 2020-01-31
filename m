Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F091B163125
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ED78D20978;
	Tue, 18 Feb 2020 21:00:20 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id E63EF203A7
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 09:28:43 +0100 (CET)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3D13206F0;
 Fri, 31 Jan 2020 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580459322;
 bh=FxoY6cZlXPjXsWVnIRhDIqdynt4r+rtbZulaa2ymBiA=;
 h=From:To:Cc:Subject:Date:From;
 b=UgEiJpBxDVZN3XmGLXFX0cx8hR7aE8nGxdHprEqMN2cBfhuyaOVkrD4HW5Fc0jeNq
 VwoDUHXUYGi4vnI/CLQrEh7GKCLjJ7GXJzM4Lv98OcmMSReHEOoKcznuvJp2MQuLym
 o1xVlAP21HhTSsZF1hpVTtCTIXyLiEVEn3w5BBBs=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stafford Horne <shorne@gmail.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 openrisc@lists.librecores.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 31 Jan 2020 09:28:33 +0100
Message-Id: <1580459313-16926-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:14 +0100
Subject: [OpenRISC] [PATCH v2] openrisc: configs: Cleanup
 CONFIG_CROSS_COMPILE
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
Cc: Masahiro Yamada <masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q09ORklHX0NST1NTX0NPTVBJTEUgaXMgZ29uZSBzaW5jZSBjb21taXQgZjEwODljOTJkYTc5ICgi
a2J1aWxkOiByZW1vdmUKQ09ORklHX0NST1NTX0NPTVBJTEUgc3VwcG9ydCIpLgoKU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKLS0tCgpDaGFuZ2Vz
IHNpbmNlIHYxOgoxLiBVcGRhdGUgYWxzbyBkb2NzLgotLS0KIERvY3VtZW50YXRpb24vb3BlbnJp
c2Mvb3BlbnJpc2NfcG9ydC5yc3QgICB8IDQgKystLQogYXJjaC9vcGVucmlzYy9jb25maWdzL29y
MWtzaW1fZGVmY29uZmlnICAgIHwgMSAtCiBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3Nt
cF9kZWZjb25maWcgfCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2Nf
cG9ydC5yc3QgYi9Eb2N1bWVudGF0aW9uL29wZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0CmluZGV4
IGExODc0N2E4ZDE5MS4uNGIyYzQzNzk0MmEwIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL29w
ZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0CisrKyBiL0RvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3Bl
bnJpc2NfcG9ydC5yc3QKQEAgLTM3LDggKzM3LDggQEAgb3IgU3RhZmZvcmQncyB0b29sY2hhaW4g
YnVpbGQgYW5kIHJlbGVhc2Ugc2NyaXB0cy4KIAogQnVpbGQgdGhlIExpbnV4IGtlcm5lbCBhcyB1
c3VhbDo6CiAKLQltYWtlIEFSQ0g9b3BlbnJpc2MgZGVmY29uZmlnCi0JbWFrZSBBUkNIPW9wZW5y
aXNjCisJbWFrZSBBUkNIPW9wZW5yaXNjIENST1NTX0NPTVBJTEU9Im9yMWstbGludXgtIiBkZWZj
b25maWcKKwltYWtlIEFSQ0g9b3BlbnJpc2MgQ1JPU1NfQ09NUElMRT0ib3Ixay1saW51eC0iCiAK
IDMpIFJ1bm5pbmcgb24gRlBHQSAob3B0aW9uYWwpCiAKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2MvY29uZmlncy9vcjFrc2ltX2RlZmNvbmZpZyBiL2FyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFr
c2ltX2RlZmNvbmZpZwppbmRleCBkOGZmNGY4ZmZiODguLjc1ZjJkYTMyNGQwZSAxMDA2NDQKLS0t
IGEvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVmY29uZmlnCisrKyBiL2FyY2gvb3Bl
bnJpc2MvY29uZmlncy9vcjFrc2ltX2RlZmNvbmZpZwpAQCAtMSw0ICsxLDMgQEAKLUNPTkZJR19D
Uk9TU19DT01QSUxFPSJvcjFrLWxpbnV4LSIKIENPTkZJR19OT19IWj15CiBDT05GSUdfTE9HX0JV
Rl9TSElGVD0xNAogQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKZGlmZiAtLWdpdCBhL2FyY2gvb3Bl
bnJpc2MvY29uZmlncy9zaW1wbGVfc21wX2RlZmNvbmZpZyBiL2FyY2gvb3BlbnJpc2MvY29uZmln
cy9zaW1wbGVfc21wX2RlZmNvbmZpZwppbmRleCA2NDI3ODk5MmRmOWMuLmZmNDlkODY4ZTA0MCAx
MDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9jb25maWdzL3NpbXBsZV9zbXBfZGVmY29uZmlnCisr
KyBiL2FyY2gvb3BlbnJpc2MvY29uZmlncy9zaW1wbGVfc21wX2RlZmNvbmZpZwpAQCAtMSw0ICsx
LDMgQEAKLUNPTkZJR19DUk9TU19DT01QSUxFPSJvcjFrLWxpbnV4LSIKIENPTkZJR19MT0NBTFZF
UlNJT049Ii1zaW1wbGUtc21wIgogQ09ORklHX05PX0haPXkKIENPTkZJR19MT0dfQlVGX1NISUZU
PTE0Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
