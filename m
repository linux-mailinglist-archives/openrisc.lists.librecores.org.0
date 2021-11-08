Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 483E7449AE7
	for <lists+openrisc@lfdr.de>; Mon,  8 Nov 2021 18:39:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BABA724259;
	Mon,  8 Nov 2021 18:39:26 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A522224215
 for <openrisc@lists.librecores.org>; Mon,  8 Nov 2021 18:39:25 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPS id C87AF619E8;
 Mon,  8 Nov 2021 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636393163;
 bh=S+wgw2Ktpwg/dAHS/Ee/D1mNBL5A2YwFak3nrXSV91U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lkbdp5A7jeT/w+z+qfpQBZiItuc3aDkrFw1AN98x8y+qg839RT/XKWuz01iXEl68L
 j/JitheXABdvN+uuGpCKz5hiuVKykMzZ1UVkwVvlWc+3U4tKIL+0he44UaipoujLax
 wfI+YqC+GgrhVjCPNGRs9BkIz3meferkJ0+jCYQFcPuRXJ2ChK9H/4FXVtwlZX6leq
 Hx52TQj61xvojaeF/A1EfC4CWQiuOaEAlJ67zGwos4JnzPYEEeklxyjGY+E0rMd5wU
 oCS8/JzmRBWUccyTGTj9Sq1ceUv8W2FXNAoFbT/a4M4hqob7r3wNJTxTJsLLGmO4hM
 E/BReHkhawAMA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C320B60985;
 Mon,  8 Nov 2021 17:39:23 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YYg/JpmfY9/Z8qO1@antec>
References: <YYg/JpmfY9/Z8qO1@antec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YYg/JpmfY9/Z8qO1@antec>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 27dff9a9c247d4e38d82c2e7234914cfe8499294
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2b03e48e961be442560796105211fc71bed02ae
Message-Id: <163639316379.31155.7303820771805964253.pr-tracker-bot@kernel.org>
Date: Mon, 08 Nov 2021 17:39:23 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for 5.16
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBNb24sIDggTm92IDIwMjEgMDY6MDM6MzQgKzA5
MDA6Cgo+IGdpdDovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVz
CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvdG9ydmFsZHMvYy9hMmIwM2U0OGU5NjFiZTQ0MjU2MDc5NjEwNTIxMWZjNzFiZWQw
MmFlCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9r
b3JnLmRvY3Mua2VybmVsLm9yZy9wcnRyYWNrZXIuaHRtbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
