Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DE2564B88DD
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:16:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C27F124825;
	Wed, 16 Feb 2022 14:16:56 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 7D21A24806
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:16:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C7486164A;
 Wed, 16 Feb 2022 13:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47582C340F1;
 Wed, 16 Feb 2022 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017413;
 bh=+iR2qnnFcrsCPQoMglxV/90U3LFjDlY0u/606L67UPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FvFA19KgOFHw//5AD53hF0IwW2eLEb8iC830WFN6MdVoW4fyh5i/2kJHpxFd7pdlD
 7UX6fEewGCq+cZvaT2PObS6XOZnZypDPzvRcYa/W0nzWewDgb+0xXamh2omZfLYFmr
 8N4H7mpvMOTDqe2QPH8s/NhnVxUv6/h988kxIKpvMvfqvjGNNvINW6t4henTJIKwJt
 jzLnL5Fc+Su69zkh5g1Nf3EInYTi+sp1khBbBbK8Lt97/7IVApa2FzdwQAvU7AyEeL
 nEYQi1fYgk8k2uZixKdw/j3+QwXzCx+3pjcEKGsjL9tNOzijYs/MTwOK3SPeQjakHj
 3w2JGHUIm9rGg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:21 +0100
Message-Id: <20220216131332.1489939-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 07/18] nios2: drop access_ok() check from
 __put_user()
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
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClVubGlrZSBvdGhlciBhcmNoaXRl
Y3R1cmVzLCB0aGUgbmlvczIgdmVyc2lvbiBvZiBfX3B1dF91c2VyKCkgaGFzIGFuCmV4dHJhIGNo
ZWNrIGZvciBhY2Nlc3Nfb2soKSwgcHJldmVudGluZyBpdCBmcm9tIGJlaW5nIHVzZWQgdG8gaW1w
bGVtZW50Cl9fcHV0X2tlcm5lbF9ub2ZhdWx0KCkuCgpTcGxpdCB1cCBwdXRfdXNlcigpIGFsb25n
IHRoZSBzYW1lIGxpbmVzIGFzIF9fZ2V0X3VzZXIoKS9nZXRfdXNlcigpCgpTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gvbmlvczIvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oIHwgNTYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL25pb3MyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvbmlvczIvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oCmluZGV4IGNhOTI4NWE5MTVlZi4uYTVjYmUwN2NmMGRhIDEwMDY0NAotLS0g
YS9hcmNoL25pb3MyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL25pb3MyL2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaApAQCAtMTY3LDM0ICsxNjcsNDQgQEAgZG8gewkJCQkJCQkJCVwKIAk6
ICJyIiAodmFsKSwgInIiIChwdHIpLCAiaSIgKC1FRkFVTFQpKTsJCQkJXAogfQogCi0jZGVmaW5l
IHB1dF91c2VyKHgsIHB0cikJCQkJCQlcCisjZGVmaW5lIF9fcHV0X3VzZXJfY29tbW9uKF9fcHVf
dmFsLCBfX3B1X3B0cikJCQkJXAogKHsJCQkJCQkJCQlcCiAJbG9uZyBfX3B1X2VyciA9IC1FRkFV
TFQ7CQkJCQlcCi0JX190eXBlb2ZfXygqKHB0cikpIF9fdXNlciAqX19wdV9wdHIgPSAocHRyKTsJ
CQlcCi0JX190eXBlb2ZfXygqKHB0cikpIF9fcHVfdmFsID0gKF9fdHlwZW9mKCpwdHIpKSh4KTsJ
CVwKLQlpZiAoYWNjZXNzX29rKF9fcHVfcHRyLCBzaXplb2YoKl9fcHVfcHRyKSkpIHsJXAotCQlz
d2l0Y2ggKHNpemVvZigqX19wdV9wdHIpKSB7CQkJCVwKLQkJY2FzZSAxOgkJCQkJCQlcCi0JCQlf
X3B1dF91c2VyX2FzbShfX3B1X3ZhbCwgInN0YiIsIF9fcHVfcHRyLCBfX3B1X2Vycik7IFwKLQkJ
CWJyZWFrOwkJCQkJCVwKLQkJY2FzZSAyOgkJCQkJCQlcCi0JCQlfX3B1dF91c2VyX2FzbShfX3B1
X3ZhbCwgInN0aCIsIF9fcHVfcHRyLCBfX3B1X2Vycik7IFwKLQkJCWJyZWFrOwkJCQkJCVwKLQkJ
Y2FzZSA0OgkJCQkJCQlcCi0JCQlfX3B1dF91c2VyX2FzbShfX3B1X3ZhbCwgInN0dyIsIF9fcHVf
cHRyLCBfX3B1X2Vycik7IFwKLQkJCWJyZWFrOwkJCQkJCVwKLQkJZGVmYXVsdDoJCQkJCQlcCi0J
CQkvKiBYWFg6IFRoaXMgbG9va3Mgd3JvbmcuLi4gKi8JCQlcCi0JCQlfX3B1X2VyciA9IDA7CQkJ
CQlcCi0JCQlpZiAoY29weV90b191c2VyKF9fcHVfcHRyLCAmKF9fcHVfdmFsKSwJCVwKLQkJCQlz
aXplb2YoKl9fcHVfcHRyKSkpCQkJXAotCQkJCV9fcHVfZXJyID0gLUVGQVVMVDsJCQlcCi0JCQli
cmVhazsJCQkJCQlcCi0JCX0JCQkJCQkJXAorCXN3aXRjaCAoc2l6ZW9mKCpfX3B1X3B0cikpIHsJ
CQkJCVwKKwljYXNlIDE6CQkJCQkJCQlcCisJCV9fcHV0X3VzZXJfYXNtKF9fcHVfdmFsLCAic3Ri
IiwgX19wdV9wdHIsIF9fcHVfZXJyKTsJXAorCQlicmVhazsJCQkJCQkJXAorCWNhc2UgMjoJCQkJ
CQkJCVwKKwkJX19wdXRfdXNlcl9hc20oX19wdV92YWwsICJzdGgiLCBfX3B1X3B0ciwgX19wdV9l
cnIpOwlcCisJCWJyZWFrOwkJCQkJCQlcCisJY2FzZSA0OgkJCQkJCQkJXAorCQlfX3B1dF91c2Vy
X2FzbShfX3B1X3ZhbCwgInN0dyIsIF9fcHVfcHRyLCBfX3B1X2Vycik7CVwKKwkJYnJlYWs7CQkJ
CQkJCVwKKwlkZWZhdWx0OgkJCQkJCQlcCisJCS8qIFhYWDogVGhpcyBsb29rcyB3cm9uZy4uLiAq
LwkJCQlcCisJCV9fcHVfZXJyID0gMDsJCQkJCQlcCisJCWlmIChfX2NvcHlfdG9fdXNlcihfX3B1
X3B0ciwgJihfX3B1X3ZhbCksCQlcCisJCQlzaXplb2YoKl9fcHVfcHRyKSkpCQkJCVwKKwkJCV9f
cHVfZXJyID0gLUVGQVVMVDsJCQkJXAorCQlicmVhazsJCQkJCQkJXAogCX0JCQkJCQkJCVwKIAlf
X3B1X2VycjsJCQkJCQkJXAogfSkKIAotI2RlZmluZSBfX3B1dF91c2VyKHgsIHB0cikgcHV0X3Vz
ZXIoeCwgcHRyKQorI2RlZmluZSBfX3B1dF91c2VyKHgsIHB0cikJCQkJCQlcCisoewkJCQkJCQkJ
CVwKKwlfX2F1dG9fdHlwZSBfX3B1X3B0ciA9IChwdHIpOwkJCQkJXAorCXR5cGVvZigqX19wdV9w
dHIpIF9fcHVfdmFsID0gKHR5cGVvZigqX19wdV9wdHIpKSh4KTsJCVwKKwlfX3B1dF91c2VyX2Nv
bW1vbihfX3B1X3ZhbCwgX19wdV9wdHIpOwkJCQlcCit9KQorCisjZGVmaW5lIHB1dF91c2VyKHgs
IHB0cikJCQkJCQlcCisoewkJCQkJCQkJCVwKKwlfX2F1dG9fdHlwZSBfX3B1X3B0ciA9IChwdHIp
OwkJCQkJXAorCXR5cGVvZigqX19wdV9wdHIpIF9fcHVfdmFsID0gKHR5cGVvZigqX19wdV9wdHIp
KSh4KTsJCVwKKwlhY2Nlc3Nfb2soX19wdV9wdHIsIHNpemVvZigqX19wdV9wdHIpKSA/CQkJXAor
CQlfX3B1dF91c2VyX2NvbW1vbihfX3B1X3ZhbCwgX19wdV9wdHIpIDoJCQlcCisJCS1FRkFVTFQ7
CQkJCQkJXAorfSkKIAogI2VuZGlmIC8qIF9BU01fTklPUzJfVUFDQ0VTU19IICovCi0tIAoyLjI5
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
