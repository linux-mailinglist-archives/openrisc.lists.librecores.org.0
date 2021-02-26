Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCC83269F1
	for <lists+openrisc@lfdr.de>; Fri, 26 Feb 2021 23:24:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C6EBC211CB;
	Fri, 26 Feb 2021 23:24:20 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 37FFC211CB
 for <openrisc@lists.librecores.org>; Fri, 26 Feb 2021 23:24:18 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2C4F764F17;
 Fri, 26 Feb 2021 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614378256;
 bh=JgTnQbtD4JFxeMKljzCUrIEaZf7ZvFJBNU5GLQawZAE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Jtw3KeghhjHNPjmKiEE59/aWLC2AzL9LfF4yZAmzk+/BJ/SirxHHIQvMThkjckA9R
 nMsl+iZWwu3wHlcGYy7ybcto4Onf5gHkyNFKZHx9PjWbqFklpjWIsEjkLbELAXglgq
 +uf9+yXN4e50x/8ke9a+uUo7I+VE1kzbbBTvriPHnLkwIXJDtqOr7fS6OIqhEESbjM
 09SyS9c8E+DBfqpK1uqtZeBOyLvbvwmYd80YYEDVztpqyfS87Jjuqb1hzrWhYbSqTR
 Y2DcaZwbwCHafVtN0mP4H+ozt5NgTrWgUAXXNsDpnA9kNQ+fzSG/X7Me1mrM9XBApr
 HLFumcetL4Bjg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 25DD560A0E;
 Fri, 26 Feb 2021 22:24:16 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210226215619.GC365039@lianli.shorne-pla.net>
References: <20210226215619.GC365039@lianli.shorne-pla.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210226215619.GC365039@lianli.shorne-pla.net>
X-PR-Tracked-Remote: git@github.com:openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 8f722f67452f4b28cd8d7acf1658daa5796437c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3905af5be36b9aa9f17657a02eeb2a08e939c13
Message-Id: <161437825614.23821.17989905886733438519.pr-tracker-bot@kernel.org>
Date: Fri, 26 Feb 2021 22:24:16 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for 5.12
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDI3IEZlYiAyMDIxIDA2OjU2OjE5ICsw
OTAwOgoKPiBnaXRAZ2l0aHViLmNvbTpvcGVucmlzYy9saW51eC5naXQgdGFncy9mb3ItbGludXMK
CmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoKaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy90b3J2YWxkcy9jL2EzOTA1YWY1YmUzNmI5YWE5ZjE3NjU3YTAyZWViMmEwOGU5Mzlj
MTMKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tv
cmcuZG9jcy5rZXJuZWwub3JnL3BydHJhY2tlci5odG1sCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
