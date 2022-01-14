Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D09A848EBC6
	for <lists+openrisc@lfdr.de>; Fri, 14 Jan 2022 15:39:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5A4F82422C;
	Fri, 14 Jan 2022 15:39:23 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 181A724039
 for <openrisc@lists.librecores.org>; Fri, 14 Jan 2022 15:39:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DEF461E84;
 Fri, 14 Jan 2022 14:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 121C7C36AF2;
 Fri, 14 Jan 2022 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642171160;
 bh=t2npav5wk7hg/sxLnzYSMI9iUeReb0eptV1nx89Q7wI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=u1nmll/DOVrvIEHWTBozM4PHRUNR0+NC8YyxZ0zJ30mZ0kiczpz5f4dEAE5OPF/Ro
 yjhfPQTy/HrXx5T6Q5wxH6WcIAvUlnBkMLYhanh3FLs9Rdl/XcXg0OiCy1UCP+pGU6
 o0gwwpDJDMkqQas0rtJ96g1FGUrWxnU00AZUzKlqEKM9Sj3f6WirxUrPbAYjMa+N49
 09gT89VjCGeMCRpYZ8vNBz6CjBrmuia2QaDtyuaagO4TzomaIgThyBHtxt+pv92AcE
 wkqTUTeRNPJCgMvQIn/xbF5izvz/1M9YfiaJtHPQtH+zUuSRWQHha+x0k+spZealy+
 b1ZRkhXXc+5EQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F17D8F60797; Fri, 14 Jan 2022 14:39:19 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YeF1hpMbYo5PMmkD@antec>
References: <YeF1hpMbYo5PMmkD@antec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YeF1hpMbYo5PMmkD@antec>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 7f435e42fd6b65fd8759963156e1ef0fb7d213f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 871bfa02d08d9c0ed981c50082b7afd367d3700b
Message-Id: <164217115998.3976.2695828823334798438.pr-tracker-bot@kernel.org>
Date: Fri, 14 Jan 2022 14:39:19 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for 5.17
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDE0IEphbiAyMDIyIDIyOjA3OjE4ICsw
OTAwOgoKPiBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xpbnV4LmdpdCB0YWdzL2Zvci1saW51
cwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3RvcnZhbGRzL2MvODcxYmZhMDJkMDhkOWMwZWQ5ODFjNTAwODJiN2FmZDM2N2Qz
NzAwYgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8v
a29yZy5kb2NzLmtlcm5lbC5vcmcvcHJ0cmFja2VyLmh0bWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
