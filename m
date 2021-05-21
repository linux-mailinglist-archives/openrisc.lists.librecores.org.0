Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 21E1B38CB1C
	for <lists+openrisc@lfdr.de>; Fri, 21 May 2021 18:34:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0A7123362;
	Fri, 21 May 2021 18:34:52 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id D02C72159C
 for <openrisc@lists.librecores.org>; Fri, 21 May 2021 18:34:49 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id D06A6613E3;
 Fri, 21 May 2021 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621614887;
 bh=pqJ6ku83Nmm15hq6mf++nEza/8GnxayfLX4erWJq3Yk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=dN5352E/TWXXZtk/JPlfem/wM53I0K1888CITpDiZUjT3AsJGzProeGSOOHpO0ZEJ
 mKgSp1a0waRqM9x3r0HJiBEJ2Z3R4RC5MqntIqvXvHTw8DDk4E+n8e0Wew0lYA+AoU
 Fww/Us30PMiggPgT03/D77gw2t0SUhHa9Rw8QB4/UkgfBk3qy75CzMSh3FoNMVurbA
 3uSL5k3Hi9cnWSjSb+sLrnBg4gG5IvX+7SjqMjoplum3AlAwAM3atdWV23/zM2Jkbh
 uUgxOcvnNVk04SHc7rq4b/7MmFn57zlzD294vNWRQSOBy1/QwT/qfxuQIGw7YjOEcz
 JjTvzNgABRMdg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C98E3609E9;
 Fri, 21 May 2021 16:34:47 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YKdeZFKthTY31705@antec>
References: <YKdeZFKthTY31705@antec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YKdeZFKthTY31705@antec>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 8b549c18ae81dbc36fb11e4aa08b8378c599ca95
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93bb533a340bde2065ecdd8694c8d1852537edd2
Message-Id: <162161488781.28405.4246977685057973940.pr-tracker-bot@kernel.org>
Date: Fri, 21 May 2021 16:34:47 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC fixes for 5.13
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDIxIE1heSAyMDIxIDE2OjE2OjUyICsw
OTAwOgoKPiBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xpbnV4LmdpdCB0YWdzL2Zvci1saW51
cwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3RvcnZhbGRzL2MvOTNiYjUzM2EzNDBiZGUyMDY1ZWNkZDg2OTRjOGQxODUyNTM3
ZWRkMgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8v
a29yZy5kb2NzLmtlcm5lbC5vcmcvcHJ0cmFja2VyLmh0bWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
