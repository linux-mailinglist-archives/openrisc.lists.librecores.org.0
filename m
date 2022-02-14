Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8BB4B5697
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 17:37:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 470D524807;
	Mon, 14 Feb 2022 17:37:27 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 5FB0E24807
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 17:37:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B15A614E2;
 Mon, 14 Feb 2022 16:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3700C340EF;
 Mon, 14 Feb 2022 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856643;
 bh=JepNdDlcl+vjLJWkKWFbQ8vIdC8P4ZqTHDtlQLygTvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yg/pItSQEzs71U/F185pU77Adjq+Wuerpy4kR6BgmvnTJ6TSm1zrt/F8Hi0vGnBb+
 /8Qj5B7b7QxWzSyj+YeaQuhTnchKrNXCzC5slLNGTccGG7g8bl+2UbzUrHWSpXGIt7
 xOg1fig8QiFMO5I3dgU5J+VFGv9rj3JE/Q8LpSpGVH3h3UIE6QskDu0wdEwCOfzQ3s
 aEs8d4j4C6ZkWevO+OIcqOgq9ygDqYeks1ido77hfRKhPW+Q6EC6HRyawN1COLV7LZ
 IgymdocysjOODUy7N4XtW+MjvAWPMlGA3mGuN1K+i4O4Oyp887hWbHPbK6Uy2BO2A4
 4Bp3sWpanrwTw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Feb 2022 17:34:47 +0100
Message-Id: <20220214163452.1568807-10-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 09/14] m68k: drop custom __access_ok()
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCldoaWxlIG1vc3QgbTY4ayBwbGF0
Zm9ybXMgdXNlIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2VzIGZvciB1c2VyCmFuZCBrZXJuZWwgc3Bh
Y2UsIGF0IGxlYXN0IGNvbGRmaXJlIGRvZXMgbm90LCBhbmQgdGhlIG90aGVyCm9uZXMgaGF2ZSBh
IFRBU0tfU0laRSB0aGF0IGlzIGxlc3MgdGhhbiB0aGUgZW50aXJlIDRHQiBhZGRyZXNzCnJhbmdl
LgoKVXNpbmcgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2YgX19hY2Nlc3Nfb2soKSBzdG9w
cyBjb2xkZmlyZQp1c2VyIHNwYWNlIGZyb20gdHJpdmlhbGx5IGFjY2Vzc2luZyBrZXJuZWwgbWVt
b3J5LCBhbmQgaXMgcHJvYmFibHkKdGhlIHJpZ2h0IHRoaW5nIGVsc2V3aGVyZSBmb3IgY29uc2lz
dGVuY3kgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Ci0tLQogYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDEzIC0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL202
OGsvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aAppbmRleCBkNmJiNTcyMDM2NWEuLjY0OTE0ODcyYTVjOSAxMDA2NDQKLS0tIGEvYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL202OGsvaW5jbHVkZS9hc20vdWFjY2Vz
cy5oCkBAIC0xMCwxOSArMTAsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+CiAjaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxhc20vZXh0YWJsZS5oPgotCi0vKiBXZSBs
ZXQgdGhlIE1NVSBkbyBhbGwgY2hlY2tpbmcgKi8KLXN0YXRpYyBpbmxpbmUgaW50IF9fYWNjZXNz
X29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLAotCQkJICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSkK
LXsKLQkvKgotCSAqIFhYWDogZm9yICFDT05GSUdfQ1BVX0hBU19BRERSRVNTX1NQQUNFUyB0aGlz
IHJlYWxseSBuZWVkcyB0byBjaGVjawotCSAqIGZvciBUQVNLX1NJWkUhCi0JICogUmVtb3Zpbmcg
dGhpcyBoZWxwZXIgaXMgcHJvYmFibHkgc3VmZmljaWVudC4KLQkgKi8KLQlyZXR1cm4gMTsKLX0K
LSNkZWZpbmUgX19hY2Nlc3Nfb2sgX19hY2Nlc3Nfb2sKICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9h
Y2Nlc3Nfb2suaD4KIAogLyoKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
