Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1073775F7
	for <lists+openrisc@lfdr.de>; Sun,  9 May 2021 11:11:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5860920708;
	Sun,  9 May 2021 11:11:14 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id F2645202FD
 for <openrisc@lists.librecores.org>; Sun,  9 May 2021 11:11:11 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3210D613D9;
 Sun,  9 May 2021 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620551470;
 bh=WzG2lAYSFUb1qOykunoY65bLJ+09ULrrsSxpy9StCGI=;
 h=From:To:Cc:Subject:Date:From;
 b=tKf/JefM9p7PyZRzddthC9m72Khd0qTm2laCNQQFNGeO7h4bdiXSJ+MOJxbCULW3Z
 Gudn1UedLnYAKooaCKePhLVTYU8UXgJ6gUASyVTKonWAynFo9Q74uRFevq9KSXvgbx
 4CknSQg/fp0r7LfK1IrStnfaJv3wAES0SZHywIwPu+rfabC3vMv+GHUgpRoyFQnk8T
 EbMQOBlC+5pkW9DBA5vxRktI9Jk918/bwRJuEfywFC3UcKWaNldRumznDe6C2lInTd
 Bqn+CRMLVEre0MldhH7OPPcrQtvv37kMn0izaFG232OBldcN7JBJFv2vk2BAoOKwC3
 uo4Bkqfh/jROQ==
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Date: Sun,  9 May 2021 12:11:01 +0300
Message-Id: <20210509091103.7985-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/2] openrisc: mm/init.c: fix compilation warnings
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, openrisc@lists.librecores.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKSGksCgpLYnVsZCB0ZXN0
IGJvdCByZXBvcnRlZCBhbiB1bnVzZWQgaW4gbWFwX3JhbSgpIGFuZCB3aGlsZSBvbiBpdCBJJ3Zl
IGZvdW5kCmFub3RoZXIgY29tcGlsYXRpb24gd2FybmluZyBhYm91dCB1bnVzZWQgdmFyaWFibGUg
aW4gcGFnaW5nX2luaXQoKS4KCkhlcmUgYXJlIHRoZSBmaXhlcyBmb3IgYm90aC4KVGhlIHBhdGNo
ZXMgYXJlIHZzIDUuMTIuCgpNaWtlIFJhcG9wb3J0ICgyKToKICBvcGVucmlzYzogbW0vaW5pdC5j
OiByZW1vdmUgdW51c2VkIG1lbWJsb2NrX3JlZ2lvbiB2YXJpYWJsZSBpbiBtYXBfcmFtKCkKICBv
cGVucmlzYzogbW0vaW5pdC5jOiByZW1vdmUgdW51c2VkIHZhcmlhYmxlICdlbmQnIGluIHBhZ2lu
Z19pbml0KCkKCiBhcmNoL29wZW5yaXNjL21tL2luaXQuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDlmNGFk
OWU0MjVhMWQzYjZhMzQ2MTdiOGVhMjI2ZDU2YTExOWE3MTcKLS0gCjIuMjguMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
