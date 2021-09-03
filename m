Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5D988400538
	for <lists+openrisc@lfdr.de>; Fri,  3 Sep 2021 20:45:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0522924127;
	Fri,  3 Sep 2021 20:45:51 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 731D9240C6
 for <openrisc@lists.librecores.org>; Fri,  3 Sep 2021 20:45:49 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 072A861056;
 Fri,  3 Sep 2021 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630694746;
 bh=J0hDsFk/nosrEodgaWYY9c5oA06I4DmXCIO2lHaFIEM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jczS3+W94wYE8ycVCQneT3uXV3N0lD4X5txPK39l+MCbCLZl4GsNtMq5gYmEUFQL+
 gCJHVFd7KgRAFY5tAvO8ptgLugkDcPXFHjBXBx7wNLrx6v66FCTHz5W9k6vBSiZoST
 Jw1g/yIDxVjyH+APgJF3oAnWYGFKXjI9eVcPVZsdL/Gcdr4qD5rlL8/f5ym9K5o8X2
 NMLa0u9BFtu0JpGtay1pRuyWIx4PA36v+BsJi0ybo1sm08QPhIVgcjbvfyNbHLDya/
 vU9IfwyYN+Yrrjr8uG2z92MzaLj3vqrNSVechwPICK0FItXZO4EMLz/GqrVdHusbRo
 og/iNYzSUuXWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0251760A2F;
 Fri,  3 Sep 2021 18:45:46 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YTE+IdUiJ+k+bpDR@antec>
References: <YTE+IdUiJ+k+bpDR@antec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YTE+IdUiJ+k+bpDR@antec>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 1955d843efc3b5cf3ab4878986a87ad4972ff4e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 603eefda5fcf8f9dab3ae253e677abb285f6f3bc
Message-Id: <163069474600.21432.7975798099897254205.pr-tracker-bot@kernel.org>
Date: Fri, 03 Sep 2021 18:45:46 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for 5.15
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDMgU2VwIDIwMjEgMDY6MTI6MDEgKzA5
MDA6Cgo+IGdpdDovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVz
CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvdG9ydmFsZHMvYy82MDNlZWZkYTVmY2Y4ZjlkYWIzYWUyNTNlNjc3YWJiMjg1ZjZm
M2JjCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9r
b3JnLmRvY3Mua2VybmVsLm9yZy9wcnRyYWNrZXIuaHRtbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
