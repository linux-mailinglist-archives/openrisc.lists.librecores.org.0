Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0BE4B567C
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 17:36:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4A70B24809;
	Mon, 14 Feb 2022 17:36:56 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 2993124809
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 17:36:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1365761500;
 Mon, 14 Feb 2022 16:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67DEC340F1;
 Mon, 14 Feb 2022 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856612;
 bh=XYviTV8III28kBrCQmsfuK51xOc09ZOif7iEHrUTuIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JVfOMM7vTqw4XdpMNlrmm2jS83mfS0hYdjkQzrKj6vrH9+Dvn0L42AdShO8RRf9Zt
 dCgJRVDvimHn/Uhy8K6/LoOqKmFRoenKTwmfXsum/yC+2647Q4iFanRlWF3K/xS92S
 gCEmlRiZlTgkTyjEKX3J6/tBJHCW3fBRdNZcGJninmBDlMLvinDaCzw9S7lbmfV8Yj
 asCqU2GVX1KEmy6ol6Y4c8F7ub3PAxvrL7Bv3Yonu/G0OWA7/HKZkm9UtkPubPBkfM
 dXhuOWxE8SbyX8yNCneVJdVo8zXW4C1x2+08uIEcESmpPYEb+YIs98IFRoa3DME4D0
 G0ya2TSp8tVbQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Feb 2022 17:34:44 +0100
Message-Id: <20220214163452.1568807-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 06/14] mips: use simpler access_ok()
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkJlZm9yZSB1bmlmeWluZyB0aGUg
bWlwcyB2ZXJzaW9uIG9mIF9fYWNjZXNzX29rKCkgd2l0aCB0aGUgZ2VuZXJpYwpjb2RlLCB0aGlz
IGNvbnZlcnRzIGl0IHRvIHRoZSBzYW1lIGFsZ29yaXRobS4gVGhpcyBpcyBhIGNoYW5nZSBpbgpi
ZWhhdmlvciBvbiBtaXBzNjQsIGFzIG5vdyBhZGRyZXNzIGluIHRoZSB1c2VyIHNlZ21lbnQsIHRo
ZSBsb3dlcgoyXjYyIGJ5dGVzLCBpcyB0YWtlbiB0byBiZSB2YWxpZCwgcmVseWluZyBvbiBhIHBh
Z2UgZmF1bHQgZm9yCmFkZHJlc3NlcyB0aGF0IGFyZSB3aXRoaW4gdGhhdCBzZWdtZW50IGJ1dCBu
b3QgdmFsaWQgb24gdGhhdCBDUFUuCgpUaGUgbmV3IHZlcnNpb24gc2hvdWxkIGJlIHRoZSBtb3N0
IGVmZmVjaWVudCB3YXkgdG8gZG8gdGhpcywgYnV0Cml0IGdldHMgcmlkIG9mIHRoZSBzcGVjaWFs
IGhhbmRsaW5nIGZvciBzaXplPTAgdGhhdCBtb3N0IG90aGVyCmFyY2hpdGVjdHVyZXMgaWdub3Jl
IGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgot
LS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAyMiArKysrLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9taXBz
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBkYjlhOGUwMDJiNjIuLmQ3Yzg5ZGMzNDI2YyAx
MDA2NDQKLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL21p
cHMvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCkBAIC0xOSw2ICsxOSw3IEBACiAjaWZkZWYgQ09ORklH
XzMyQklUCiAKICNkZWZpbmUgX19VQV9MSU1JVCAweDgwMDAwMDAwVUwKKyNkZWZpbmUgVEFTS19T
SVpFX01BWAlfX1VBX0xJTUlUCiAKICNkZWZpbmUgX19VQV9BRERSCSIud29yZCIKICNkZWZpbmUg
X19VQV9MQQkJImxhIgpAQCAtMzMsNiArMzQsNyBAQAogZXh0ZXJuIHU2NCBfX3VhX2xpbWl0Owog
CiAjZGVmaW5lIF9fVUFfTElNSVQJX191YV9saW1pdAorI2RlZmluZSBUQVNLX1NJWkVfTUFYCVhL
U1NFRwogCiAjZGVmaW5lIF9fVUFfQUREUgkiLmR3b3JkIgogI2RlZmluZSBfX1VBX0xBCQkiZGxh
IgpAQCAtNDIsMjIgKzQ0LDYgQEAgZXh0ZXJuIHU2NCBfX3VhX2xpbWl0OwogCiAjZW5kaWYgLyog
Q09ORklHXzY0QklUICovCiAKLS8qCi0gKiBJcyBhIGFkZHJlc3MgdmFsaWQ/IFRoaXMgZG9lcyBh
IHN0cmFpZ2h0Zm9yd2FyZCBjYWxjdWxhdGlvbiByYXRoZXIKLSAqIHRoYW4gdGVzdHMuCi0gKgot
ICogQWRkcmVzcyB2YWxpZCBpZjoKLSAqICAtICJhZGRyIiBkb2Vzbid0IGhhdmUgYW55IGhpZ2gt
Yml0cyBzZXQKLSAqICAtIEFORCAic2l6ZSIgZG9lc24ndCBoYXZlIGFueSBoaWdoLWJpdHMgc2V0
Ci0gKiAgLSBBTkQgImFkZHIrc2l6ZSIgZG9lc24ndCBoYXZlIGFueSBoaWdoLWJpdHMgc2V0Ci0g
KiAgLSBPUiB3ZSBhcmUgaW4ga2VybmVsIG1vZGUuCi0gKgotICogX191YV9zaXplKCkgaXMgYSB0
cmljayB0byBhdm9pZCBydW50aW1lIGNoZWNraW5nIG9mIHBvc2l0aXZlIGNvbnN0YW50Ci0gKiBz
aXplczsgZm9yIHRob3NlIHdlIGFscmVhZHkga25vdyBhdCBjb21waWxlIHRpbWUgdGhhdCB0aGUg
c2l6ZSBpcyBvay4KLSAqLwotI2RlZmluZSBfX3VhX3NpemUoc2l6ZSkJCQkJCQkJXAotCSgoX19i
dWlsdGluX2NvbnN0YW50X3Aoc2l6ZSkgJiYgKHNpZ25lZCBsb25nKSAoc2l6ZSkgPiAwKSA/IDAg
OiAoc2l6ZSkpCi0KIC8qCiAgKiBhY2Nlc3Nfb2s6IC0gQ2hlY2tzIGlmIGEgdXNlciBzcGFjZSBw
b2ludGVyIGlzIHZhbGlkCiAgKiBAYWRkcjogVXNlciBzcGFjZSBwb2ludGVyIHRvIHN0YXJ0IG9m
IGJsb2NrIHRvIGNoZWNrCkBAIC03OSw5ICs2NSw5IEBAIGV4dGVybiB1NjQgX191YV9saW1pdDsK
IHN0YXRpYyBpbmxpbmUgaW50IF9fYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICpwLCB1bnNp
Z25lZCBsb25nIHNpemUpCiB7CiAJdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcp
cDsKLQl1bnNpZ25lZCBsb25nIGVuZCA9IGFkZHIgKyBzaXplIC0gISFzaXplOworCXVuc2lnbmVk
IGxvbmcgbGltaXQgPSBUQVNLX1NJWkVfTUFYOwogCi0JcmV0dXJuIChfX1VBX0xJTUlUICYgKGFk
ZHIgfCBlbmQgfCBfX3VhX3NpemUoc2l6ZSkpKSA9PSAwOworCXJldHVybiAoc2l6ZSA8PSBsaW1p
dCkgJiYgKGFkZHIgPD0gKGxpbWl0IC0gc2l6ZSkpOwogfQogCiAjZGVmaW5lIGFjY2Vzc19vayhh
ZGRyLCBzaXplKQkJCQkJXAotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
