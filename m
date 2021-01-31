Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 967933099F5
	for <lists+openrisc@lfdr.de>; Sun, 31 Jan 2021 03:17:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 11F9A20014;
	Sun, 31 Jan 2021 03:17:22 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 3F2D220EEC
 for <openrisc@lists.librecores.org>; Sun, 31 Jan 2021 03:17:20 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPS id 39CFB64E0E;
 Sun, 31 Jan 2021 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612059438;
 bh=pkAM2tVzKl0Pjc1PqziVkOFxEQHhxhysdUVS24QK1+8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BF/ntyLwMOfNl1NVi02gq1eFEei8JTYeEy17Y1xz789TfCP282qA0iV3S886zLXTo
 LeMOrPakc8vYQMYBTnyHGHXkdODNNI4uNfz0dNeWwY4ineHDP5PcdNSc0qlnc1hyU1
 k3NnqjMLcJy+/w0XQvJc3pp+n5DCsLFxAEF63YcFxMLuQFH2AXx8lwn4Mg9jI6/7Rj
 O0f/0aoWiYzoGOlD0ZvsXUvK5AGIb7ltmdVWlKpB2DnAjBJt43hjE0fx2kfvPiVxAi
 mCCSjfpbloMeTJ9sLVKoZNBDesI0kbD39UV+fLlk3QbVMYMTZBbZzK5WKM9wooylLW
 JGUiIhMS5e1Dg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2FB0E60989;
 Sun, 31 Jan 2021 02:17:18 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210130224442.GB2002709@lianli.shorne-pla.net>
References: <20210130224442.GB2002709@lianli.shorne-pla.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210130224442.GB2002709@lianli.shorne-pla.net>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 1bea2a937dadd188de70198b0cf3915e05a506e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03e319e5465a2da6fb188c77043775f2888df529
Message-Id: <161205943819.4129.13346730597249255168.pr-tracker-bot@kernel.org>
Date: Sun, 31 Jan 2021 02:17:18 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC fixes for 5.11-rc6
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTdW4sIDMxIEphbiAyMDIxIDA3OjQ0OjQyICsw
OTAwOgoKPiBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xpbnV4LmdpdCB0YWdzL2Zvci1saW51
cwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3RvcnZhbGRzL2MvMDNlMzE5ZTU0NjVhMmRhNmZiMTg4Yzc3MDQzNzc1ZjI4ODhk
ZjUyOQoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8v
a29yZy5kb2NzLmtlcm5lbC5vcmcvcHJ0cmFja2VyLmh0bWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
