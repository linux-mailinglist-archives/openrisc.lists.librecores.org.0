Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 67639351493
	for <lists+openrisc@lfdr.de>; Thu,  1 Apr 2021 13:44:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5FD66212E6;
	Thu,  1 Apr 2021 13:44:34 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1A3C5212C3
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 16:32:58 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 012EC60FF1;
 Wed, 31 Mar 2021 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201176;
 bh=Ot/5PmXwS11uulWq3qWA2topEHV4IQyVTJcB7EIJEto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4mj3Ucq0o81O2XyVG3hmXxx3WMjl1D+IiWQy6y3glymXCyXz7HvUH0Y/fnYr9f1h
 1wUUw0fx8O0SKe53NjW/bj/Ou5QXwaPc1g1UvmKUHfz4nwx525LvJmbfcYf5RgZhWk
 XZR9y8fM+4DYoaAJXNL2jgLdlXBwoOnIc/jSJ3r/9sKttJ2VVol/puJBKAjtvOtqgj
 YTwPsq2+RWCppmBEqhKeWazUtN2PGYkR30QcO8bTOPCiOzxjHuAOCNJtEBr/pnFukQ
 2743V9mO+HynrrCRbhsuAOsY5f1+RMF3zawK3FR7K+l/QgZF57ChVKoxlykrytyZNk
 r7q5BWtdFi1iw==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Wed, 31 Mar 2021 14:30:40 +0000
Message-Id: <1617201040-83905-10-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Thu, 01 Apr 2021 13:44:26 +0200
Subject: [OpenRISC] [PATCH v6 9/9] powerpc/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKV2UgZG9uJ3QgaGF2ZSBu
YXRpdmUgaHcgeGNoZzE2IGluc3RydWN0aW9uLCBzbyBsZXQgcXNwaW5sb2NrCmdlbmVyaWMgY29k
ZSB0byBkZWFsIHdpdGggaXQuCgpVc2luZyB0aGUgZnVsbC13b3JkIGF0b21pYyB4Y2hnIGluc3Ry
dWN0aW9ucyBpbXBsZW1lbnQgeGNoZzE2IGhhcwp0aGUgc2VtYW50aWMgcmlzayBmb3IgYXRvbWlj
IG9wZXJhdGlvbnMuCgpUaGlzIHBhdGNoIGNhbmNlbHMgdGhlIGRlcGVuZGVuY3kgb2Ygb24gcXNw
aW5sb2NrIGdlbmVyaWMgY29kZSBvbgphcmNoaXRlY3R1cmUncyB4Y2hnMTYuCgpBbHNvIG5vIG5l
ZWQgd2hlbiBQUENfTEJBUlhfTFdBUlggaXMgZW5hYmxlZCwgc2VlIHRoZSBsaW5rIGJlbG93LgoK
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpMaW5rOiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIw
MjAxMTA3MDMyMzI4LjI0NTQ1ODItMS1ucGlnZ2luQGdtYWlsLmNvbS8KQ2M6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KQ2M6IE1pY2hhZWwgRWxsZXJtYW4g
PG1wZUBlbGxlcm1hbi5pZC5hdT4KQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2Vy
bmVsLmNyYXNoaW5nLm9yZz4KQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVsdXNAc2FtYmEub3JnPgot
LS0KIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9L
Y29uZmlnCmluZGV4IDM4NmFlMTJkODUyMy4uNjEzM2FkNTE2OTBlIDEwMDY0NAotLS0gYS9hcmNo
L3Bvd2VycGMvS2NvbmZpZworKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwpAQCAtMTUxLDYgKzE1
MSw3IEBAIGNvbmZpZyBQUEMKIAlzZWxlY3QgQVJDSF9VU0VfQ01QWENIR19MT0NLUkVGCQlpZiBQ
UEM2NAogCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NLUwkJaWYgUFBDX1FVRVVFRF9TUElO
TE9DS1MKIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLUwlpZiBQUENfUVVFVUVEX1NQ
SU5MT0NLUworCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMglpZiBQUENf
UVVFVUVEX1NQSU5MT0NLUyAmJiAhUFBDX0xCQVJYX0xXQVJYCiAJc2VsZWN0IEFSQ0hfV0FOVF9J
UENfUEFSU0VfVkVSU0lPTgogCXNlbGVjdCBBUkNIX1dBTlRfSVJRU19PRkZfQUNUSVZBVEVfTU0K
IAlzZWxlY3QgQVJDSF9XQU5UX0xEX09SUEhBTl9XQVJOCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
