Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 132C02499C0
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8B8FE20D80;
	Wed, 19 Aug 2020 11:55:55 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CED7D20CD6
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:19:23 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA0A22076E;
 Tue, 18 Aug 2020 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763962;
 bh=yru9/NdH9RLPoFs58u4GN0nY+Sogzjweg/tWDL+BinU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W7/1L7PMB6ny+R6Ja3ZTgt7DiZrj2MhEUn1Baeko2Ljpt+IgAAd0BIY0K5+ddrHdy
 0Cgsg9BHQIzldcepANhUopKY4V4j0vt9l3455AzJkS/6oRvNjT5K9fhzbiyGqh3U1M
 mGXqQ6IOdYEbV7nbtMhzb+zOAQWJlqo2RxTvK8bI=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:31 +0300
Message-Id: <20200818151634.14343-15-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 14/17] x86/setup: simplify
 reserve_crashkernel()
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKKiBSZXBsYWNlIG1hZ2lj
IG51bWJlcnMgd2l0aCBkZWZpbmVzCiogUmVwbGFjZSBtZW1ibG9ja19maW5kX2luX3JhbmdlKCkg
KyBtZW1ibG9ja19yZXNlcnZlKCkgd2l0aAogIG1lbWJsb2NrX3BoeXNfYWxsb2NfcmFuZ2UoKQoq
IFN0b3AgY2hlY2tpbmcgZm9yIGxvdyBtZW1vcnkgc2l6ZSBpbiByZXNlcnZlX2NyYXNoa2VybmVs
X2xvdygpLiBUaGUKICBhbGxvY2F0aW9uIGZyb20gbGltaXRlZCByYW5nZSB3aWxsIGFueXdheSBm
YWlsIGlmIHRoZXJlIGlzIG5vIGVub3VnaAogIG1lbW9yeSwgc28gdGhlcmUgaXMgbm8gbmVlZCBm
b3IgZXh0cmEgdHJhdmVyc2FsIG9mIG1lbWJsb2NrLm1lbW9yeQoKU2lnbmVkLW9mZi1ieTogTWlr
ZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1p
bmdvQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4K
LS0tCiBhcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyB8IDQwICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyBiL2FyY2gv
eDg2L2tlcm5lbC9zZXR1cC5jCmluZGV4IDJjYWMzOWFkZTJlMy4uNTJlODNiYTYwN2IzIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvc2V0
dXAuYwpAQCAtNDIwLDEzICs0MjAsMTMgQEAgc3RhdGljIGludCBfX2luaXQgcmVzZXJ2ZV9jcmFz
aGtlcm5lbF9sb3codm9pZCkKIHsKICNpZmRlZiBDT05GSUdfWDg2XzY0CiAJdW5zaWduZWQgbG9u
ZyBsb25nIGJhc2UsIGxvd19iYXNlID0gMCwgbG93X3NpemUgPSAwOwotCXVuc2lnbmVkIGxvbmcg
dG90YWxfbG93X21lbTsKKwl1bnNpZ25lZCBsb25nIGxvd19tZW1fbGltaXQ7CiAJaW50IHJldDsK
IAotCXRvdGFsX2xvd19tZW0gPSBtZW1ibG9ja19tZW1fc2l6ZSgxVUwgPDwgKDMyIC0gUEFHRV9T
SElGVCkpOworCWxvd19tZW1fbGltaXQgPSBtaW4obWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLCBD
UkFTSF9BRERSX0xPV19NQVgpOwogCiAJLyogY3Jhc2hrZXJuZWw9WSxsb3cgKi8KLQlyZXQgPSBw
YXJzZV9jcmFzaGtlcm5lbF9sb3coYm9vdF9jb21tYW5kX2xpbmUsIHRvdGFsX2xvd19tZW0sICZs
b3dfc2l6ZSwgJmJhc2UpOworCXJldCA9IHBhcnNlX2NyYXNoa2VybmVsX2xvdyhib290X2NvbW1h
bmRfbGluZSwgbG93X21lbV9saW1pdCwgJmxvd19zaXplLCAmYmFzZSk7CiAJaWYgKHJldCkgewog
CQkvKgogCQkgKiB0d28gcGFydHMgZnJvbSBrZXJuZWwvZG1hL3N3aW90bGIuYzoKQEAgLTQ0NCwy
MyArNDQ0LDE3IEBAIHN0YXRpYyBpbnQgX19pbml0IHJlc2VydmVfY3Jhc2hrZXJuZWxfbG93KHZv
aWQpCiAJCQlyZXR1cm4gMDsKIAl9CiAKLQlsb3dfYmFzZSA9IG1lbWJsb2NrX2ZpbmRfaW5fcmFu
Z2UoMCwgMVVMTCA8PCAzMiwgbG93X3NpemUsIENSQVNIX0FMSUdOKTsKKwlsb3dfYmFzZSA9IG1l
bWJsb2NrX3BoeXNfYWxsb2NfcmFuZ2UobG93X3NpemUsIENSQVNIX0FMSUdOLCAwLCBDUkFTSF9B
RERSX0xPV19NQVgpOwogCWlmICghbG93X2Jhc2UpIHsKIAkJcHJfZXJyKCJDYW5ub3QgcmVzZXJ2
ZSAlbGRNQiBjcmFzaGtlcm5lbCBsb3cgbWVtb3J5LCBwbGVhc2UgdHJ5IHNtYWxsZXIgc2l6ZS5c
biIsCiAJCSAgICAgICAodW5zaWduZWQgbG9uZykobG93X3NpemUgPj4gMjApKTsKIAkJcmV0dXJu
IC1FTk9NRU07CiAJfQogCi0JcmV0ID0gbWVtYmxvY2tfcmVzZXJ2ZShsb3dfYmFzZSwgbG93X3Np
emUpOwotCWlmIChyZXQpIHsKLQkJcHJfZXJyKCIlczogRXJyb3IgcmVzZXJ2aW5nIGNyYXNoa2Vy
bmVsIGxvdyBtZW1ibG9jay5cbiIsIF9fZnVuY19fKTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0KLQlw
cl9pbmZvKCJSZXNlcnZpbmcgJWxkTUIgb2YgbG93IG1lbW9yeSBhdCAlbGRNQiBmb3IgY3Jhc2hr
ZXJuZWwgKFN5c3RlbSBsb3cgUkFNOiAlbGRNQilcbiIsCisJcHJfaW5mbygiUmVzZXJ2aW5nICVs
ZE1CIG9mIGxvdyBtZW1vcnkgYXQgJWxkTUIgZm9yIGNyYXNoa2VybmVsIChsb3cgUkFNIGxpbWl0
OiAlbGRNQilcbiIsCiAJCSh1bnNpZ25lZCBsb25nKShsb3dfc2l6ZSA+PiAyMCksCiAJCSh1bnNp
Z25lZCBsb25nKShsb3dfYmFzZSA+PiAyMCksCi0JCSh1bnNpZ25lZCBsb25nKSh0b3RhbF9sb3df
bWVtID4+IDIwKSk7CisJCSh1bnNpZ25lZCBsb25nKShsb3dfbWVtX2xpbWl0ID4+IDIwKSk7CiAK
IAljcmFzaGtfbG93X3Jlcy5zdGFydCA9IGxvd19iYXNlOwogCWNyYXNoa19sb3dfcmVzLmVuZCAg
ID0gbG93X2Jhc2UgKyBsb3dfc2l6ZSAtIDE7CkBAIC01MDQsMTMgKzQ5OCwxMyBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQogCQkgKiB1bmxlc3MgImNyYXNo
a2VybmVsPXNpemVbS01HXSxoaWdoIiBpcyBzcGVjaWZpZWQuCiAJCSAqLwogCQlpZiAoIWhpZ2gp
Ci0JCQljcmFzaF9iYXNlID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZShDUkFTSF9BTElHTiwKLQkJ
CQkJCUNSQVNIX0FERFJfTE9XX01BWCwKLQkJCQkJCWNyYXNoX3NpemUsIENSQVNIX0FMSUdOKTsK
KwkJCWNyYXNoX2Jhc2UgPSBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKGNyYXNoX3NpemUsCisJ
CQkJCQlDUkFTSF9BTElHTiwgQ1JBU0hfQUxJR04sCisJCQkJCQlDUkFTSF9BRERSX0xPV19NQVgp
OwogCQlpZiAoIWNyYXNoX2Jhc2UpCi0JCQljcmFzaF9iYXNlID0gbWVtYmxvY2tfZmluZF9pbl9y
YW5nZShDUkFTSF9BTElHTiwKLQkJCQkJCUNSQVNIX0FERFJfSElHSF9NQVgsCi0JCQkJCQljcmFz
aF9zaXplLCBDUkFTSF9BTElHTik7CisJCQljcmFzaF9iYXNlID0gbWVtYmxvY2tfcGh5c19hbGxv
Y19yYW5nZShjcmFzaF9zaXplLAorCQkJCQkJQ1JBU0hfQUxJR04sIENSQVNIX0FMSUdOLAorCQkJ
CQkJQ1JBU0hfQUREUl9ISUdIX01BWCk7CiAJCWlmICghY3Jhc2hfYmFzZSkgewogCQkJcHJfaW5m
bygiY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24gZmFpbGVkIC0gTm8gc3VpdGFibGUgYXJlYSBmb3Vu
ZC5cbiIpOwogCQkJcmV0dXJuOwpAQCAtNTE4LDE5ICs1MTIsMTMgQEAgc3RhdGljIHZvaWQgX19p
bml0IHJlc2VydmVfY3Jhc2hrZXJuZWwodm9pZCkKIAl9IGVsc2UgewogCQl1bnNpZ25lZCBsb25n
IGxvbmcgc3RhcnQ7CiAKLQkJc3RhcnQgPSBtZW1ibG9ja19maW5kX2luX3JhbmdlKGNyYXNoX2Jh
c2UsCi0JCQkJCSAgICAgICBjcmFzaF9iYXNlICsgY3Jhc2hfc2l6ZSwKLQkJCQkJICAgICAgIGNy
YXNoX3NpemUsIDEgPDwgMjApOworCQlzdGFydCA9IG1lbWJsb2NrX3BoeXNfYWxsb2NfcmFuZ2Uo
Y3Jhc2hfc2l6ZSwgU1pfMU0sIGNyYXNoX2Jhc2UsCisJCQkJCQkgIGNyYXNoX2Jhc2UgKyBjcmFz
aF9zaXplKTsKIAkJaWYgKHN0YXJ0ICE9IGNyYXNoX2Jhc2UpIHsKIAkJCXByX2luZm8oImNyYXNo
a2VybmVsIHJlc2VydmF0aW9uIGZhaWxlZCAtIG1lbW9yeSBpcyBpbiB1c2UuXG4iKTsKIAkJCXJl
dHVybjsKIAkJfQogCX0KLQlyZXQgPSBtZW1ibG9ja19yZXNlcnZlKGNyYXNoX2Jhc2UsIGNyYXNo
X3NpemUpOwotCWlmIChyZXQpIHsKLQkJcHJfZXJyKCIlczogRXJyb3IgcmVzZXJ2aW5nIGNyYXNo
a2VybmVsIG1lbWJsb2NrLlxuIiwgX19mdW5jX18pOwotCQlyZXR1cm47Ci0JfQogCiAJaWYgKGNy
YXNoX2Jhc2UgPj0gKDFVTEwgPDwgMzIpICYmIHJlc2VydmVfY3Jhc2hrZXJuZWxfbG93KCkpIHsK
IAkJbWVtYmxvY2tfZnJlZShjcmFzaF9iYXNlLCBjcmFzaF9zaXplKTsKLS0gCjIuMjYuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
