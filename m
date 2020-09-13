Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A67A826AD88
	for <lists+openrisc@lfdr.de>; Tue, 15 Sep 2020 21:26:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C04D320C9D;
	Tue, 15 Sep 2020 21:26:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 523812045C
 for <openrisc@lists.librecores.org>; Sun, 13 Sep 2020 17:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600012398;
 bh=8reDQSoJ4DMyPgL2xfX7v/jWvSDuIVJ21JeA0lsQIps=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=B/zwhU7i88E6gFeCSPm8BJLgc9JacBOUQnEbRqmAZYTSVHN387Mupat+KFSBdJL8U
 7d0M6sr4KQXqLcf4fbn08Bks1LE1gEwnc44DDBuCOkDW6vXKuZw0qMKeSPX3Wn0RC5
 Zu8zUQ+uFRz60Se+ed9V2yJQiLBfC6brR9nz6nk0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200912084255.GR3562056@lianli.shorne-pla.net>
References: <20200912084255.GR3562056@lianli.shorne-pla.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200912084255.GR3562056@lianli.shorne-pla.net>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: d877322bc1adcab9850732275670409e8bcca4c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b952e974300be3184049a125e7cba112fe659017
Message-Id: <160001239813.19188.5642085973020190842.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2020 15:53:18 +0000
To: Stafford Horne <shorne@gmail.com>
X-Mailman-Approved-At: Tue, 15 Sep 2020 21:26:35 +0200
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC fixes for v5.9-rc4
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDEyIFNlcCAyMDIwIDE3OjQyOjU1ICsw
OTAwOgoKPiBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xpbnV4LmdpdCB0YWdzL2Zvci1saW51
cwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3RvcnZhbGRzL2MvYjk1MmU5NzQzMDBiZTMxODQwNDlhMTI1ZTdjYmExMTJmZTY1
OTAxNwoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8v
a29yZy5kb2NzLmtlcm5lbC5vcmcvcHJ0cmFja2VyLmh0bWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
