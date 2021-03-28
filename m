Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 229BA34BF32
	for <lists+openrisc@lfdr.de>; Sun, 28 Mar 2021 23:14:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A5EA212CC;
	Sun, 28 Mar 2021 23:14:54 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9559B212B6
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 08:31:33 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BAC76191A;
 Sun, 28 Mar 2021 06:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913092;
 bh=QzKnPWoBnPHqdJHKCVpbj1BpTP2hO0zRu8JrhjYU+j0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oCRMri96fe/VV+ky4tT+TYgNgYdWWJzEgeXfW1Tvd/axc2XqcW9wem1Jg6EWGepv2
 QjpcK6XDPVTYzlAGc9cBpGJNs76gqhECTTGkJoQEDk+3zXn3vooA/aHijGpPJOqIjA
 KaNg4iVmEpWEVc+v+reBWXGLdp/9vX3UPt6ESFnyGi8C3C85wjhdaSIOc2rHkvEjGU
 q/dKoB5wnBsLvoh7s8j/ZofobGS9h+hH0KO9HHec613wxtdvFuKWgCppj0bO1HPk6w
 BYMnDjrYcXcZ5Cd+KQpevDg06rlgh2/Yp6Q3kReMZDAa8puVTZfEmFJKn+m05xwAZ0
 BuEJgjqjL8urw==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Sun, 28 Mar 2021 06:30:25 +0000
Message-Id: <1616913028-83376-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Sun, 28 Mar 2021 23:14:51 +0200
Subject: [OpenRISC] [PATCH v5 4/7] powerpc/qspinlock: Add
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
aW5sb2NrIGdlbmVyaWMgY29kZSBvbgphcmNoaXRlY3R1cmUncyB4Y2hnMTYuCgpTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+CkNjOiBNaWNoYWVsIEVsbGVy
bWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+CkNjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5o
QGtlcm5lbC5jcmFzaGluZy5vcmc+CkNjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9y
Zz4KLS0tCiBhcmNoL3Bvd2VycGMvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZwppbmRleCAzODZhZTEyZDg1MjMuLjY5ZWM0YWRlNjUyMSAxMDA2NDQKLS0tIGEv
YXJjaC9wb3dlcnBjL0tjb25maWcKKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKQEAgLTE1MSw2
ICsxNTEsNyBAQCBjb25maWcgUFBDCiAJc2VsZWN0IEFSQ0hfVVNFX0NNUFhDSEdfTE9DS1JFRgkJ
aWYgUFBDNjQKIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MJCWlmIFBQQ19RVUVVRURf
U1BJTkxPQ0tTCiAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1MJaWYgUFBDX1FVRVVF
RF9TUElOTE9DS1MKKwlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLU19YQ0hHMzIJaWYg
UFBDX1FVRVVFRF9TUElOTE9DS1MKIAlzZWxlY3QgQVJDSF9XQU5UX0lQQ19QQVJTRV9WRVJTSU9O
CiAJc2VsZWN0IEFSQ0hfV0FOVF9JUlFTX09GRl9BQ1RJVkFURV9NTQogCXNlbGVjdCBBUkNIX1dB
TlRfTERfT1JQSEFOX1dBUk4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
