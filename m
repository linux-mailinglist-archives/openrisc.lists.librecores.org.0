Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C6EDF3BDDFF
	for <lists+openrisc@lfdr.de>; Tue,  6 Jul 2021 21:24:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 77FFD23BBE;
	Tue,  6 Jul 2021 21:24:08 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A221F21245
 for <openrisc@lists.librecores.org>; Tue,  6 Jul 2021 21:24:06 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id C7F4D61CA3;
 Tue,  6 Jul 2021 19:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625599444;
 bh=hbqGc4nB834TtbSX0HdfhLh1wNo0K/OsNN3HUI2wCNw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Fw4ouExBbDuUWxspiBWx5u7+Nc1jSta4v2nJGLi7i3HEDKHzF3B4UVLZgM8ucnQ8z
 1byAGvG1vIe/wtT/E3VBzJ87nQnC+om1RdXihAtYTTctgjGx0Y/dqKOqLR8gdR2UvW
 pBfAymDKUYpeWBxo/iYRBCgHUB3zRNJ9M+6jbsqMsrcGeEdvo9/2ybZeVYSs3PrZQb
 wlIV9j6RLezHuZPZcT9tY4pBxf1FA+kKLPAHbR/v6ndnIEhRxa75892lgTumdRLjAP
 W/qp86zng5nqNrs9k1TeKJYLcx4L+vNbfQ305oqvZs9uUStfpwy53l1ch7p2/5+WZX
 f+SNBLA/I2O+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BF49B60A27;
 Tue,  6 Jul 2021 19:24:04 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YOP6x0Mz8aBv9x18@antec>
References: <YOP6x0Mz8aBv9x18@antec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YOP6x0Mz8aBv9x18@antec>
X-PR-Tracked-Remote: git://github.com/openrisc/linux.git tags/for-linus
X-PR-Tracked-Commit-Id: ad4e600cbf897f47525b342cd4b02e88ed300a83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c55e2aeb8082cb118cd63596bfe0dc5247b78e1
Message-Id: <162559944477.10101.2678805799665823956.pr-tracker-bot@kernel.org>
Date: Tue, 06 Jul 2021 19:24:04 +0000
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for 5.14
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
Cc: Gabriel Somlo <gsomlo@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Mateusz Holenko <mholenko@antmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUdWUsIDYgSnVsIDIwMjEgMTU6NDA6MDcgKzA5
MDA6Cgo+IGdpdDovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVz
CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvdG9ydmFsZHMvYy80YzU1ZTJhZWI4MDgyY2IxMThjZDYzNTk2YmZlMGRjNTI0N2I3
OGUxCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9r
b3JnLmRvY3Mua2VybmVsLm9yZy9wcnRyYWNrZXIuaHRtbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
