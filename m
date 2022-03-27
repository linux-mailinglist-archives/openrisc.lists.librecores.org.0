Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 85B324E89BF
	for <lists+openrisc@lfdr.de>; Sun, 27 Mar 2022 21:33:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E9E8724868;
	Sun, 27 Mar 2022 21:33:46 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id A2F3123F8E
 for <openrisc@lists.librecores.org>; Sun, 27 Mar 2022 21:33:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73EAB60A54;
 Sun, 27 Mar 2022 19:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC8C1C340EC;
 Sun, 27 Mar 2022 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648409622;
 bh=uRLYQZUXcSMkQFV3XFE75HhH7pvdu7sNPWs4xlpxV5M=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ltCJ3gaTiQ6dcbAlvjFigHMAHbiGuXJtfEE6sHYWcCvRONwDbrP3tr2cAlcGAJ0Yq
 IYwWKioHFNB/NbPTFV4k8OwTBMq2/LGIn/RHDMdmoZLNEC0sYYkLa9xpor6OIGMDxN
 BUn46qu51npitNMxQoxc0izGGcgsTIYvdBRJRVA/1jTaMCIaQFN5L3v4NHAiqQ31wp
 Pdv/JaFL6AjnUTioIbWdSw1w2MxdPMoXMt3PGmOauAa9Li78phiyMc4NslDELeaH5o
 gFSovKPr6XvDUgsYTIVnBGVsbOJKIKC2a8l39+8Xe2/JOs0Ck6wjXK3gPMOe2EevxZ
 URFKR5CJaMyYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C7419E6BBCA; Sun, 27 Mar 2022 19:33:42 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YkASeMlP+k/OJm3+@antec>
References: <YkASeMlP+k/OJm3+@antec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YkASeMlP+k/OJm3+@antec>
X-PR-Tracked-Remote: git@github.com:openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 862cf8d5fd98ed8ea8989726ed5da53761a9ed76
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88b3be5c6391a5b4be1dcdc4bb8dca8438105438
Message-Id: <164840962280.6575.12850786353069820369.pr-tracker-bot@kernel.org>
Date: Sun, 27 Mar 2022 19:33:42 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for 5.18
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTdW4sIDI3IE1hciAyMDIyIDE2OjMwOjAwICsw
OTAwOgoKPiBnaXRAZ2l0aHViLmNvbTpvcGVucmlzYy9saW51eC5naXQgdGFncy9mb3ItbGludXMK
CmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoKaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy90b3J2YWxkcy9jLzg4YjNiZTVjNjM5MWE1YjRiZTFkY2RjNGJiOGRjYTg0MzgxMDU0
MzgKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tv
cmcuZG9jcy5rZXJuZWwub3JnL3BydHJhY2tlci5odG1sCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
