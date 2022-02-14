Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C2CFB4B5675
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 17:36:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9DC6624806;
	Mon, 14 Feb 2022 17:36:19 +0100 (CET)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mail.librecores.org (Postfix) with ESMTPS id 068D2242D7
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 17:36:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 36920CE19D6;
 Mon, 14 Feb 2022 16:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BC2C340F5;
 Mon, 14 Feb 2022 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856574;
 bh=FUHsy4SbKAUYNozm8BPMqbHwV1/3+i881CYSdrE+f4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z7Q4rLaCN6ssWfRJjiohyNPNSH4AWIFoR2vjhNDxUgjfNfHH7pkAYd6WVfV+n+x9c
 +WV0/jrjDwMQSxFLAlps2jjuMnVZIOeBqY8sTLGXG3NSNoRgN4aMaQF70dC5VmKlbz
 wKgblcbV/RMf4tUWFrLCMmX3JZOR+vd5uu7VMT3O6QlAqKtfqQJRS1nxlvPcGInv/v
 XBstA4u0hl/ULtrxPbm1mmk/7pEjT2RtDdVk6Bgh4FfwDqInSeWgdh0NWTCvDXoa+m
 P2UB2k6eY0IDMT8bDgJE5JjS2hgCmG4/tcDBMzfcaf/rf+9dHCufsKlU4v2Hooyfng
 DxQ3KwkytwjMA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Feb 2022 17:34:41 +0100
Message-Id: <20220214163452.1568807-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 03/14] nds32: fix access_ok() checks in
 get/put_user
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
 linux-mips@vger.kernel.org, stable@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClRoZSBnZXRfdXNlcigpL3B1dF91
c2VyKCkgZnVuY3Rpb25zIGFyZSBtZWFudCB0byBjaGVjayBmb3IKYWNjZXNzX29rKCksIHdoaWxl
IHRoZSBfX2dldF91c2VyKCkvX19wdXRfdXNlcigpIGZ1bmN0aW9ucwpkb24ndC4KClRoaXMgYnJv
a2UgaW4gNC4xOSBmb3IgbmRzMzIsIHdoZW4gaXQgZ2FpbmVkIGFuIGV4dHJhbmVvdXMKY2hlY2sg
aW4gX19nZXRfdXNlcigpLCBidXQgbG9zdCB0aGUgY2hlY2sgaXQgbmVlZHMgaW4KX19wdXRfdXNl
cigpLgoKRml4ZXM6IDQ4NzkxM2FiMThjMiAoIm5kczMyOiBFeHRyYWN0IHRoZSBjaGVja2luZyBh
bmQgZ2V0dGluZyBwb2ludGVyIHRvIGEgbWFjcm8iKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyBAIHY0LjE5KwpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgot
LS0KIGFyY2gvbmRzMzIvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjIgKysrKysrKysrKysrKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL25k
czMyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBkNGNiZjA2OWRjMjIuLjM3YTQwOTgxZGVi
MyAxMDA2NDQKLS0tIGEvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJj
aC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTcwLDkgKzcwLDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHNldF9mcyhtbV9zZWdtZW50X3QgZnMpCiAgKiB2ZXJzaW9ucyBhcmUgdm9pZCAo
aWUsIGRvbid0IHJldHVybiBhIHZhbHVlIGFzIHN1Y2gpLgogICovCiAKLSNkZWZpbmUgZ2V0X3Vz
ZXIJX19nZXRfdXNlcgkJCQkJXAotCi0jZGVmaW5lIF9fZ2V0X3VzZXIoeCwgcHRyKQkJCQkJCVwK
KyNkZWZpbmUgZ2V0X3VzZXIoeCwgcHRyKQkJCQkJCVwKICh7CQkJCQkJCQkJXAogCWxvbmcgX19n
dV9lcnIgPSAwOwkJCQkJCVwKIAlfX2dldF91c2VyX2NoZWNrKCh4KSwgKHB0ciksIF9fZ3VfZXJy
KTsJCQkJXApAQCAtODUsNiArODMsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9mcyhtbV9z
ZWdtZW50X3QgZnMpCiAJKHZvaWQpMDsJCQkJCQkJXAogfSkKIAorI2RlZmluZSBfX2dldF91c2Vy
KHgsIHB0cikJCQkJCQlcCisoewkJCQkJCQkJCVwKKwlsb25nIF9fZ3VfZXJyID0gMDsJCQkJCQlc
CisJY29uc3QgX190eXBlb2ZfXygqKHB0cikpIF9fdXNlciAqX19wID0gKHB0cik7CQkJXAorCV9f
Z2V0X3VzZXJfZXJyKCh4KSwgX19wLCAoX19ndV9lcnIpKTsJCQkJXAorCV9fZ3VfZXJyOwkJCQkJ
CQlcCit9KQorCiAjZGVmaW5lIF9fZ2V0X3VzZXJfY2hlY2soeCwgcHRyLCBlcnIpCQkJCQlcCiAo
ewkJCQkJCQkJCVwKIAljb25zdCBfX3R5cGVvZl9fKCoocHRyKSkgX191c2VyICpfX3AgPSAocHRy
KTsJCQlcCkBAIC0xNjUsMTIgKzE3MSwxOCBAQCBkbyB7CQkJCQkJCQkJXAogCQk6ICJyIihhZGRy
KSwgImkiKC1FRkFVTFQpCQkJCVwKIAkJOiAiY2MiKQogCi0jZGVmaW5lIHB1dF91c2VyCV9fcHV0
X3VzZXIJCQkJCVwKKyNkZWZpbmUgcHV0X3VzZXIoeCwgcHRyKQkJCQkJCVwKKyh7CQkJCQkJCQkJ
XAorCWxvbmcgX19wdV9lcnIgPSAwOwkJCQkJCVwKKwlfX3B1dF91c2VyX2NoZWNrKCh4KSwgKHB0
ciksIF9fcHVfZXJyKTsJCQkJXAorCV9fcHVfZXJyOwkJCQkJCQlcCit9KQogCiAjZGVmaW5lIF9f
cHV0X3VzZXIoeCwgcHRyKQkJCQkJCVwKICh7CQkJCQkJCQkJXAogCWxvbmcgX19wdV9lcnIgPSAw
OwkJCQkJCVwKLQlfX3B1dF91c2VyX2VycigoeCksIChwdHIpLCBfX3B1X2Vycik7CQkJCVwKKwlf
X3R5cGVvZl9fKCoocHRyKSkgX191c2VyICpfX3AgPSAocHRyKTsJCQkJXAorCV9fcHV0X3VzZXJf
ZXJyKCh4KSwgX19wLCBfX3B1X2Vycik7CQkJCVwKIAlfX3B1X2VycjsJCQkJCQkJXAogfSkKIAot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
