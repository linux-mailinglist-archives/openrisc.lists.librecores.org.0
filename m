Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7820A2FFA9F
	for <lists+openrisc@lfdr.de>; Fri, 22 Jan 2021 03:47:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2793820FC8;
	Fri, 22 Jan 2021 03:47:20 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 0C60420FC8
 for <openrisc@lists.librecores.org>; Fri, 22 Jan 2021 03:41:42 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPS id D940723136;
 Fri, 22 Jan 2021 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611283299;
 bh=9Zi26Umn4bfBl+qlAcYkpuei7dW6gvAbqBK7e0VzGY4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=XpA6id9nBiOlHVISxyGgtDGRx5eQsZj/ypIA9pAzz9Q2pkdxzaY6OgWcrYZE7PQrN
 L1l9pSV3uDxhnY6USU9BEmSn4HU+wrJMCn28VvY2p++Q5aVeVHFwfsjDA38YTjXK0B
 sUCRA0Bk4zAPMhVlEJLk9D8Whfei6c1eJ/FhJhQg5e/tf841tQvu/XoAKHfDxVtBHH
 JWGq8k8/VOhE7k7NQEe1r0ZksKpE9Kzsxlkxnhnu26XkknWucgpueF0NBIWJ61olcQ
 ueWPXw5JkCpEcJgFC+El0nUd7goBejdxgwQPlswzhzW+QkbyvG+3jyT0s81+BUHRrz
 OkPJgWEcLc4+w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C6DD760591;
 Fri, 22 Jan 2021 02:41:39 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210122002902.GP2002709@lianli.shorne-pla.net>
References: <20210122002902.GP2002709@lianli.shorne-pla.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210122002902.GP2002709@lianli.shorne-pla.net>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 031c7a8cd6fc565e90320bf08f22ee6e70f9d969
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83d09ad4b950651a95d37697f1493c00d888d0db
Message-Id: <161128329974.9480.4436451757364424272.pr-tracker-bot@kernel.org>
Date: Fri, 22 Jan 2021 02:41:39 +0000
To: Stafford Horne <shorne@gmail.com>
X-Mailman-Approved-At: Fri, 22 Jan 2021 03:47:18 +0100
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC fixes for 5.11
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDIyIEphbiAyMDIxIDA5OjI5OjAyICsw
OTAwOgoKPiBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xpbnV4LmdpdCB0YWdzL2Zvci1saW51
cwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3RvcnZhbGRzL2MvODNkMDlhZDRiOTUwNjUxYTk1ZDM3Njk3ZjE0OTNjMDBkODg4
ZDBkYgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8v
a29yZy5kb2NzLmtlcm5lbC5vcmcvcHJ0cmFja2VyLmh0bWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
