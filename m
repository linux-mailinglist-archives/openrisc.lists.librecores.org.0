Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 816122460D7
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2ABB120EA2;
	Mon, 17 Aug 2020 10:46:43 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id D1FE920D79
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 18:38:50 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B572220829;
 Sun,  2 Aug 2020 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386329;
 bh=owq9p+k/C9/dpSukqR8EwL4hnjKsMj+76UiJMdPJ/fA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rad8TiDptD9dxrBr88aLuHRAT2BqJnMfW2NRDjy71NJ6blsuHzH1615u85QXsH4wj
 E16+uJggojjz9XGF2WAQ9EoCro0yddSG/vgRc632ePGXFN2VBqVIRyZVPfPYidDOrb
 SMLSTJg8sBnzC+58NQK2lydD29xR2vaGVr/X5nGA=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  2 Aug 2020 19:35:58 +0300
Message-Id: <20200802163601.8189-15-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: [OpenRISC] [PATCH v2 14/17] x86/setup: simplify
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
 Hari Bathini <hbathini@linux.ibm.com>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
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
ZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC9zZXR1
cC5jIHwgNDAgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMKaW5kZXgg
ZDhkZTQwNTNjNWU4Li5kN2NlZDY5ODI1MjQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9z
ZXR1cC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jCkBAIC00MTksMTMgKzQxOSwxMyBA
QCBzdGF0aWMgaW50IF9faW5pdCByZXNlcnZlX2NyYXNoa2VybmVsX2xvdyh2b2lkKQogewogI2lm
ZGVmIENPTkZJR19YODZfNjQKIAl1bnNpZ25lZCBsb25nIGxvbmcgYmFzZSwgbG93X2Jhc2UgPSAw
LCBsb3dfc2l6ZSA9IDA7Ci0JdW5zaWduZWQgbG9uZyB0b3RhbF9sb3dfbWVtOworCXVuc2lnbmVk
IGxvbmcgbG93X21lbV9saW1pdDsKIAlpbnQgcmV0OwogCi0JdG90YWxfbG93X21lbSA9IG1lbWJs
b2NrX21lbV9zaXplKDFVTCA8PCAoMzIgLSBQQUdFX1NISUZUKSk7CisJbG93X21lbV9saW1pdCA9
IG1pbihtZW1ibG9ja19waHlzX21lbV9zaXplKCksIENSQVNIX0FERFJfTE9XX01BWCk7CiAKIAkv
KiBjcmFzaGtlcm5lbD1ZLGxvdyAqLwotCXJldCA9IHBhcnNlX2NyYXNoa2VybmVsX2xvdyhib290
X2NvbW1hbmRfbGluZSwgdG90YWxfbG93X21lbSwgJmxvd19zaXplLCAmYmFzZSk7CisJcmV0ID0g
cGFyc2VfY3Jhc2hrZXJuZWxfbG93KGJvb3RfY29tbWFuZF9saW5lLCBsb3dfbWVtX2xpbWl0LCAm
bG93X3NpemUsICZiYXNlKTsKIAlpZiAocmV0KSB7CiAJCS8qCiAJCSAqIHR3byBwYXJ0cyBmcm9t
IGtlcm5lbC9kbWEvc3dpb3RsYi5jOgpAQCAtNDQzLDIzICs0NDMsMTcgQEAgc3RhdGljIGludCBf
X2luaXQgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9sb3codm9pZCkKIAkJCXJldHVybiAwOwogCX0KIAot
CWxvd19iYXNlID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZSgwLCAxVUxMIDw8IDMyLCBsb3dfc2l6
ZSwgQ1JBU0hfQUxJR04pOworCWxvd19iYXNlID0gbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZShs
b3dfc2l6ZSwgQ1JBU0hfQUxJR04sIDAsIENSQVNIX0FERFJfTE9XX01BWCk7CiAJaWYgKCFsb3df
YmFzZSkgewogCQlwcl9lcnIoIkNhbm5vdCByZXNlcnZlICVsZE1CIGNyYXNoa2VybmVsIGxvdyBt
ZW1vcnksIHBsZWFzZSB0cnkgc21hbGxlciBzaXplLlxuIiwKIAkJICAgICAgICh1bnNpZ25lZCBs
b25nKShsb3dfc2l6ZSA+PiAyMCkpOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAKLQlyZXQgPSBt
ZW1ibG9ja19yZXNlcnZlKGxvd19iYXNlLCBsb3dfc2l6ZSk7Ci0JaWYgKHJldCkgewotCQlwcl9l
cnIoIiVzOiBFcnJvciByZXNlcnZpbmcgY3Jhc2hrZXJuZWwgbG93IG1lbWJsb2NrLlxuIiwgX19m
dW5jX18pOwotCQlyZXR1cm4gcmV0OwotCX0KLQotCXByX2luZm8oIlJlc2VydmluZyAlbGRNQiBv
ZiBsb3cgbWVtb3J5IGF0ICVsZE1CIGZvciBjcmFzaGtlcm5lbCAoU3lzdGVtIGxvdyBSQU06ICVs
ZE1CKVxuIiwKKwlwcl9pbmZvKCJSZXNlcnZpbmcgJWxkTUIgb2YgbG93IG1lbW9yeSBhdCAlbGRN
QiBmb3IgY3Jhc2hrZXJuZWwgKGxvdyBSQU0gbGltaXQ6ICVsZE1CKVxuIiwKIAkJKHVuc2lnbmVk
IGxvbmcpKGxvd19zaXplID4+IDIwKSwKIAkJKHVuc2lnbmVkIGxvbmcpKGxvd19iYXNlID4+IDIw
KSwKLQkJKHVuc2lnbmVkIGxvbmcpKHRvdGFsX2xvd19tZW0gPj4gMjApKTsKKwkJKHVuc2lnbmVk
IGxvbmcpKGxvd19tZW1fbGltaXQgPj4gMjApKTsKIAogCWNyYXNoa19sb3dfcmVzLnN0YXJ0ID0g
bG93X2Jhc2U7CiAJY3Jhc2hrX2xvd19yZXMuZW5kICAgPSBsb3dfYmFzZSArIGxvd19zaXplIC0g
MTsKQEAgLTUwMywxMyArNDk3LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZXNlcnZlX2NyYXNo
a2VybmVsKHZvaWQpCiAJCSAqIHVubGVzcyAiY3Jhc2hrZXJuZWw9c2l6ZVtLTUddLGhpZ2giIGlz
IHNwZWNpZmllZC4KIAkJICovCiAJCWlmICghaGlnaCkKLQkJCWNyYXNoX2Jhc2UgPSBtZW1ibG9j
a19maW5kX2luX3JhbmdlKENSQVNIX0FMSUdOLAotCQkJCQkJQ1JBU0hfQUREUl9MT1dfTUFYLAot
CQkJCQkJY3Jhc2hfc2l6ZSwgQ1JBU0hfQUxJR04pOworCQkJY3Jhc2hfYmFzZSA9IG1lbWJsb2Nr
X3BoeXNfYWxsb2NfcmFuZ2UoY3Jhc2hfc2l6ZSwKKwkJCQkJCUNSQVNIX0FMSUdOLCBDUkFTSF9B
TElHTiwKKwkJCQkJCUNSQVNIX0FERFJfTE9XX01BWCk7CiAJCWlmICghY3Jhc2hfYmFzZSkKLQkJ
CWNyYXNoX2Jhc2UgPSBtZW1ibG9ja19maW5kX2luX3JhbmdlKENSQVNIX0FMSUdOLAotCQkJCQkJ
Q1JBU0hfQUREUl9ISUdIX01BWCwKLQkJCQkJCWNyYXNoX3NpemUsIENSQVNIX0FMSUdOKTsKKwkJ
CWNyYXNoX2Jhc2UgPSBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKGNyYXNoX3NpemUsCisJCQkJ
CQlDUkFTSF9BTElHTiwgQ1JBU0hfQUxJR04sCisJCQkJCQlDUkFTSF9BRERSX0hJR0hfTUFYKTsK
IAkJaWYgKCFjcmFzaF9iYXNlKSB7CiAJCQlwcl9pbmZvKCJjcmFzaGtlcm5lbCByZXNlcnZhdGlv
biBmYWlsZWQgLSBObyBzdWl0YWJsZSBhcmVhIGZvdW5kLlxuIik7CiAJCQlyZXR1cm47CkBAIC01
MTcsMTkgKzUxMSwxMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2
b2lkKQogCX0gZWxzZSB7CiAJCXVuc2lnbmVkIGxvbmcgbG9uZyBzdGFydDsKIAotCQlzdGFydCA9
IG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2UoY3Jhc2hfYmFzZSwKLQkJCQkJICAgICAgIGNyYXNoX2Jh
c2UgKyBjcmFzaF9zaXplLAotCQkJCQkgICAgICAgY3Jhc2hfc2l6ZSwgMSA8PCAyMCk7CisJCXN0
YXJ0ID0gbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZShjcmFzaF9zaXplLCBTWl8xTSwgY3Jhc2hf
YmFzZSwKKwkJCQkJCSAgY3Jhc2hfYmFzZSArIGNyYXNoX3NpemUpOwogCQlpZiAoc3RhcnQgIT0g
Y3Jhc2hfYmFzZSkgewogCQkJcHJfaW5mbygiY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24gZmFpbGVk
IC0gbWVtb3J5IGlzIGluIHVzZS5cbiIpOwogCQkJcmV0dXJuOwogCQl9CiAJfQotCXJldCA9IG1l
bWJsb2NrX3Jlc2VydmUoY3Jhc2hfYmFzZSwgY3Jhc2hfc2l6ZSk7Ci0JaWYgKHJldCkgewotCQlw
cl9lcnIoIiVzOiBFcnJvciByZXNlcnZpbmcgY3Jhc2hrZXJuZWwgbWVtYmxvY2suXG4iLCBfX2Z1
bmNfXyk7Ci0JCXJldHVybjsKLQl9CiAKIAlpZiAoY3Jhc2hfYmFzZSA+PSAoMVVMTCA8PCAzMikg
JiYgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9sb3coKSkgewogCQltZW1ibG9ja19mcmVlKGNyYXNoX2Jh
c2UsIGNyYXNoX3NpemUpOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
