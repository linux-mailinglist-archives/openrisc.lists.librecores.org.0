Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 927A710D42D
	for <lists+openrisc@lfdr.de>; Fri, 29 Nov 2019 11:33:10 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DAB1B206E4;
	Fri, 29 Nov 2019 11:33:09 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 18FB520014
 for <openrisc@lists.librecores.org>; Wed, 20 Nov 2019 14:37:18 +0100 (CET)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C14FC22529;
 Wed, 20 Nov 2019 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574257036;
 bh=AxbKwjFQI/6s3clvhOzB6xU8y6OAygNZ4nXJUqw7RRo=;
 h=From:To:Cc:Subject:Date:From;
 b=Js3JvDf7ylCsJgpXt/BSwr6AY2Cb666FOKlqzvXYJ5mEX1kuPtKY9ymdK04WMw/i8
 PI+c40zB2U+KsbiJhCoYEht7jx8Ga8j51MKiNxe8Sz2NphwiCNRwJuCWkXYX9S4Qwb
 xFrvUtER9blvO8LQsqBFdYLN0M3nIDrDy2z65ACk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 20 Nov 2019 21:37:12 +0800
Message-Id: <20191120133712.12066-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 29 Nov 2019 11:33:08 +0100
Subject: [OpenRISC] [PATCH] openrisc: Fix Kconfig indentation
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyB8IDI2ICsr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9LY29uZmlnIGIv
YXJjaC9vcGVucmlzYy9LY29uZmlnCmluZGV4IGJmMzI2ZjBlZGQyZi4uMTkyOGUwNjFmZjk2IDEw
MDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL0tjb25maWcKKysrIGIvYXJjaC9vcGVucmlzYy9LY29u
ZmlnCkBAIC0xMyw3ICsxMyw3IEBAIGNvbmZpZyBPUEVOUklTQwogCXNlbGVjdCBJUlFfRE9NQUlO
CiAJc2VsZWN0IEhBTkRMRV9ET01BSU5fSVJRCiAJc2VsZWN0IEdQSU9MSUIKLSAgICAgICAgc2Vs
ZWN0IEhBVkVfQVJDSF9UUkFDRUhPT0sKKwlzZWxlY3QgSEFWRV9BUkNIX1RSQUNFSE9PSwogCXNl
bGVjdCBTUEFSU0VfSVJRCiAJc2VsZWN0IEdFTkVSSUNfSVJRX0NISVAKIAlzZWxlY3QgR0VORVJJ
Q19JUlFfUFJPQkUKQEAgLTUxLDEyICs1MSwxMiBAQCBjb25maWcgTk9fSU9QT1JUX01BUAogCWRl
Zl9ib29sIHkKIAogY29uZmlnIFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKLSAgICAgICAgZGVmX2Jv
b2wgeQorCWRlZl9ib29sIHkKIAogIyBGb3Igbm93LCB1c2UgZ2VuZXJpYyBjaGVja3N1bSBmdW5j
dGlvbnMKICNUaGVzZSBjYW4gYmUgcmVpbXBsZW1lbnRlZCBpbiBhc3NlbWJseSBsYXRlciBpZiBz
byBpbmNsaW5lZAogY29uZmlnIEdFTkVSSUNfQ1NVTQotICAgICAgICBkZWZfYm9vbCB5CisJZGVm
X2Jvb2wgeQogCiBjb25maWcgU1RBQ0tUUkFDRV9TVVBQT1JUCiAJZGVmX2Jvb2wgeQpAQCAtODks
OCArODksOCBAQCBjb25maWcgRENBQ0hFX1dSSVRFVEhST1VHSAogCSAgSWYgdW5zdXJlIHNheSBO
IGhlcmUKIAogY29uZmlnIE9QRU5SSVNDX0JVSUxUSU5fRFRCCi0gICAgICAgIHN0cmluZyAiQnVp
bHRpbiBEVEIiCi0gICAgICAgIGRlZmF1bHQgIiIKKwlzdHJpbmcgIkJ1aWx0aW4gRFRCIgorCWRl
ZmF1bHQgIiIKIAogbWVudSAiQ2xhc3MgSUkgSW5zdHJ1Y3Rpb25zIgogCkBAIC0xNjEsMTMgKzE2
MSwxMyBAQCBjb25maWcgT1BFTlJJU0NfSEFWRV9TSEFET1dfR1BSUwogCSAgT24gYSB1bmljb3Jl
IHN5c3RlbSBpdCdzIHNhZmUgdG8gc2F5IE4gaGVyZSBpZiB5b3UgYXJlIHVuc3VyZS4KIAogY29u
ZmlnIENNRExJTkUKLSAgICAgICAgc3RyaW5nICJEZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmlu
ZyIKLSAgICAgICAgZGVmYXVsdCAiIgotICAgICAgICBoZWxwCi0gICAgICAgICAgT24gc29tZSBh
cmNoaXRlY3R1cmVzIHRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgZm9yIHRoZSBib290IGxvYWRl
cgotICAgICAgICAgIHRvIHBhc3MgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwuIEZvciB0aGVzZSBh
cmNoaXRlY3R1cmVzLCB5b3Ugc2hvdWxkCi0gICAgICAgICAgc3VwcGx5IHNvbWUgY29tbWFuZC1s
aW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBlbnRlcmluZyB0aGVtCi0gICAgICAgICAgaGVy
ZS4KKwlzdHJpbmcgIkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgorCWRlZmF1bHQgIiIK
KwloZWxwCisJICBPbiBzb21lIGFyY2hpdGVjdHVyZXMgdGhlcmUgaXMgY3VycmVudGx5IG5vIHdh
eSBmb3IgdGhlIGJvb3QgbG9hZGVyCisJICB0byBwYXNzIGFyZ3VtZW50cyB0byB0aGUga2VybmVs
LiBGb3IgdGhlc2UgYXJjaGl0ZWN0dXJlcywgeW91IHNob3VsZAorCSAgc3VwcGx5IHNvbWUgY29t
bWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBlbnRlcmluZyB0aGVtCisJICBoZXJl
LgogCiBtZW51ICJEZWJ1Z2dpbmcgb3B0aW9ucyIKIApAQCAtMTg1LDcgKzE4NSw3IEBAIGNvbmZp
ZyBPUEVOUklTQ19FU1JfRVhDRVBUSU9OX0JVR19DSEVDSwogCWRlZmF1bHQgbgogCWhlbHAKIAkg
IFRoaXMgb3B0aW9uIGVuYWJsZXMgc29tZSBjaGVja3MgdGhhdCBtaWdodCBleHBvc2Ugc29tZSBw
cm9ibGVtcwotICAgICAgICAgIGluIGtlcm5lbC4KKwkgIGluIGtlcm5lbC4KIAogCSAgU2F5IE4g
aWYgeW91IGFyZSB1bnN1cmUuCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
