Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 10EA01B2097
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0B59820564;
	Tue, 21 Apr 2020 10:01:37 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id BE47720691
 for <openrisc@lists.librecores.org>; Tue,  7 Apr 2020 21:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586289325;
 bh=X8SARuotaC6mxy/ctY3ZlwjUF2pQ/3bmecn8BGIhhAE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=c/XBGjzE5XMyfx+zpkZdxkxk2QleADHbPwLivvocpZhjRLEXbSQnabVH6VB63HslF
 6GbMWvauRkva/MHK0CfCRIsgpsNrd2gk5QLJeK7pJT1F76VQ0QaFz0M/HUS0q3qKD6
 8m7Mv5z6QXQ+PSwdCebOhpeadntXhn7pSocbaYhA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200407121628.GP7926@lianli.shorne-pla.net>
References: <20200407121628.GP7926@lianli.shorne-pla.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200407121628.GP7926@lianli.shorne-pla.net>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: 9737e2c5f0bc768b58416ec070bd96c91c52a153
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5d247661e869b71e4db5ca69b08b9607895d496
Message-Id: <158628932584.3792.16656826106512591465.pr-tracker-bot@kernel.org>
Date: Tue, 07 Apr 2020 19:55:25 +0000
To: Stafford Horne <shorne@gmail.com>
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for v5.6
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUdWUsIDcgQXByIDIwMjAgMjE6MTY6MjggKzA5
MDA6Cgo+IGdpdDovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVz
CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvdG9ydmFsZHMvYy9kNWQyNDc2NjFlODY5YjcxZTRkYjVjYTY5YjA4Yjk2MDc4OTVk
NDk2CgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9r
b3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
