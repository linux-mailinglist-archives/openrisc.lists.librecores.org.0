Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B3BBB2460D0
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7316620E90;
	Mon, 17 Aug 2020 10:46:38 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6EAF620D74
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 18:37:55 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E71AE20759;
 Sun,  2 Aug 2020 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386274;
 bh=L1caX07ckQGbzwF1m6ekOavkI/uce3ChMM6KCZWVqJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=URJX7ELsnYv/2NuraNiR9JcMOtbglvmpQtJnR1JLp562aL3CeG3HcKr4Uu8HjNpDa
 EabSWon9aSOZiz+cvqMyQPTjJTabx13lkJduvu3/0x2IUtwE7dfrhdCAXii27Q2tYl
 EPWQyU3RO3FI+MgBY7pYoAlUPboF1NDiW3qh0tsE=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  2 Aug 2020 19:35:53 +0300
Message-Id: <20200802163601.8189-10-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: [OpenRISC] [PATCH v2 09/17] memblock: make memblock_debug and
 related functionality private
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIG9ubHkgdXNlciBv
ZiBtZW1ibG9ja19kYmcoKSBvdXRzaWRlIG1lbWJsb2NrIHdhcyBzMzkwIHNldHVwIGNvZGUgYW5k
IGl0CmlzIGNvbnZlcnRlZCB0byB1c2UgcHJfZGVidWcoKSBpbnN0ZWFkLgpUaGlzIGFsbG93cyB0
byBzdG9wIGV4cG9zaW5nIG1lbWJsb2NrX2RlYnVnIGFuZCBtZW1ibG9ja19kYmcoKSB0byB0aGUg
cmVzdApvZiB0aGUga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBs
aW51eC5pYm0uY29tPgpSZXZpZXdlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Ci0t
LQogYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jIHwgIDQgKystLQogaW5jbHVkZS9saW51eC9tZW1i
bG9jay5oIHwgMTIgKy0tLS0tLS0tLS0tCiBtbS9tZW1ibG9jay5jICAgICAgICAgICAgfCAxMyAr
KysrKysrKysrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvczM5
MC9rZXJuZWwvc2V0dXAuYwppbmRleCAwN2FhMTViYTQzYjMuLjhiMjg0Y2Y2ZTE5OSAxMDA2NDQK
LS0tIGEvYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jCisrKyBiL2FyY2gvczM5MC9rZXJuZWwvc2V0
dXAuYwpAQCAtNzc2LDggKzc3Niw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtZW1ibG9ja19hZGRf
bWVtX2RldGVjdF9pbmZvKHZvaWQpCiAJdW5zaWduZWQgbG9uZyBzdGFydCwgZW5kOwogCWludCBp
OwogCi0JbWVtYmxvY2tfZGJnKCJwaHlzbWVtIGluZm8gc291cmNlOiAlcyAoJWhoZClcbiIsCi0J
CSAgICAgZ2V0X21lbV9pbmZvX3NvdXJjZSgpLCBtZW1fZGV0ZWN0LmluZm9fc291cmNlKTsKKwlw
cl9kZWJ1ZygicGh5c21lbSBpbmZvIHNvdXJjZTogJXMgKCVoaGQpXG4iLAorCQkgZ2V0X21lbV9p
bmZvX3NvdXJjZSgpLCBtZW1fZGV0ZWN0LmluZm9fc291cmNlKTsKIAkvKiBrZWVwIG1lbWJsb2Nr
IGxpc3RzIGNsb3NlIHRvIHRoZSBrZXJuZWwgKi8KIAltZW1ibG9ja19zZXRfYm90dG9tX3VwKHRy
dWUpOwogCWZvcl9lYWNoX21lbV9kZXRlY3RfYmxvY2soaSwgJnN0YXJ0LCAmZW5kKSB7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggYi9pbmNsdWRlL2xpbnV4L21lbWJsb2Nr
LmgKaW5kZXggMjIwYjVmMGRhZDQyLi5lNmEyM2IzZGI2OTYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvbWVtYmxvY2suaAorKysgYi9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKQEAgLTkwLDcg
KzkwLDYgQEAgc3RydWN0IG1lbWJsb2NrIHsKIH07CiAKIGV4dGVybiBzdHJ1Y3QgbWVtYmxvY2sg
bWVtYmxvY2s7Ci1leHRlcm4gaW50IG1lbWJsb2NrX2RlYnVnOwogCiAjaWZuZGVmIENPTkZJR19B
UkNIX0tFRVBfTUVNQkxPQ0sKICNkZWZpbmUgX19pbml0X21lbWJsb2NrIF9fbWVtaW5pdApAQCAt
MTAyLDkgKzEwMSw2IEBAIHZvaWQgbWVtYmxvY2tfZGlzY2FyZCh2b2lkKTsKIHN0YXRpYyBpbmxp
bmUgdm9pZCBtZW1ibG9ja19kaXNjYXJkKHZvaWQpIHt9CiAjZW5kaWYKIAotI2RlZmluZSBtZW1i
bG9ja19kYmcoZm10LCAuLi4pIFwKLQlpZiAobWVtYmxvY2tfZGVidWcpIHByaW50ayhLRVJOX0lO
Rk8gcHJfZm10KGZtdCksICMjX19WQV9BUkdTX18pCi0KIHBoeXNfYWRkcl90IG1lbWJsb2NrX2Zp
bmRfaW5fcmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90IGVuZCwKIAkJCQkgICBw
aHlzX2FkZHJfdCBzaXplLCBwaHlzX2FkZHJfdCBhbGlnbik7CiB2b2lkIG1lbWJsb2NrX2FsbG93
X3Jlc2l6ZSh2b2lkKTsKQEAgLTQ1NiwxMyArNDUyLDcgQEAgYm9vbCBtZW1ibG9ja19pc19yZWdp
b25fbWVtb3J5KHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90IHNpemUpOwogYm9vbCBtZW1i
bG9ja19pc19yZXNlcnZlZChwaHlzX2FkZHJfdCBhZGRyKTsKIGJvb2wgbWVtYmxvY2tfaXNfcmVn
aW9uX3Jlc2VydmVkKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90IHNpemUpOwogCi1leHRl
cm4gdm9pZCBfX21lbWJsb2NrX2R1bXBfYWxsKHZvaWQpOwotCi1zdGF0aWMgaW5saW5lIHZvaWQg
bWVtYmxvY2tfZHVtcF9hbGwodm9pZCkKLXsKLQlpZiAobWVtYmxvY2tfZGVidWcpCi0JCV9fbWVt
YmxvY2tfZHVtcF9hbGwoKTsKLX0KK3ZvaWQgbWVtYmxvY2tfZHVtcF9hbGwodm9pZCk7CiAKIC8q
KgogICogbWVtYmxvY2tfc2V0X2N1cnJlbnRfbGltaXQgLSBTZXQgdGhlIGN1cnJlbnQgYWxsb2Nh
dGlvbiBsaW1pdCB0byBhbGxvdwpkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21lbWJs
b2NrLmMKaW5kZXggYTViOWIzZGY4MWZjLi44MjQ5Mzg4NDlmNmQgMTAwNjQ0Ci0tLSBhL21tL21l
bWJsb2NrLmMKKysrIGIvbW0vbWVtYmxvY2suYwpAQCAtMTM0LDcgKzEzNCwxMCBAQCBzdHJ1Y3Qg
bWVtYmxvY2sgbWVtYmxvY2sgX19pbml0ZGF0YV9tZW1ibG9jayA9IHsKIAkgICAgIGkgPCBtZW1i
bG9ja190eXBlLT5jbnQ7CQkJCQlcCiAJICAgICBpKyssIHJnbiA9ICZtZW1ibG9ja190eXBlLT5y
ZWdpb25zW2ldKQogCi1pbnQgbWVtYmxvY2tfZGVidWcgX19pbml0ZGF0YV9tZW1ibG9jazsKKyNk
ZWZpbmUgbWVtYmxvY2tfZGJnKGZtdCwgLi4uKSBcCisJaWYgKG1lbWJsb2NrX2RlYnVnKSBwcmlu
dGsoS0VSTl9JTkZPIHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQorCitzdGF0aWMgaW50IG1l
bWJsb2NrX2RlYnVnIF9faW5pdGRhdGFfbWVtYmxvY2s7CiBzdGF0aWMgYm9vbCBzeXN0ZW1faGFz
X3NvbWVfbWlycm9yIF9faW5pdGRhdGFfbWVtYmxvY2sgPSBmYWxzZTsKIHN0YXRpYyBpbnQgbWVt
YmxvY2tfY2FuX3Jlc2l6ZSBfX2luaXRkYXRhX21lbWJsb2NrOwogc3RhdGljIGludCBtZW1ibG9j
a19tZW1vcnlfaW5fc2xhYiBfX2luaXRkYXRhX21lbWJsb2NrID0gMDsKQEAgLTE5MTksNyArMTky
Miw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdF9tZW1ibG9jayBtZW1ibG9ja19kdW1wKHN0cnVjdCBt
ZW1ibG9ja190eXBlICp0eXBlKQogCX0KIH0KIAotdm9pZCBfX2luaXRfbWVtYmxvY2sgX19tZW1i
bG9ja19kdW1wX2FsbCh2b2lkKQorc3RhdGljIHZvaWQgX19pbml0X21lbWJsb2NrIF9fbWVtYmxv
Y2tfZHVtcF9hbGwodm9pZCkKIHsKIAlwcl9pbmZvKCJNRU1CTE9DSyBjb25maWd1cmF0aW9uOlxu
Iik7CiAJcHJfaW5mbygiIG1lbW9yeSBzaXplID0gJXBhIHJlc2VydmVkIHNpemUgPSAlcGFcbiIs
CkBAIC0xOTMzLDYgKzE5MzYsMTIgQEAgdm9pZCBfX2luaXRfbWVtYmxvY2sgX19tZW1ibG9ja19k
dW1wX2FsbCh2b2lkKQogI2VuZGlmCiB9CiAKK3ZvaWQgX19pbml0X21lbWJsb2NrIG1lbWJsb2Nr
X2R1bXBfYWxsKHZvaWQpCit7CisJaWYgKG1lbWJsb2NrX2RlYnVnKQorCQlfX21lbWJsb2NrX2R1
bXBfYWxsKCk7Cit9CisKIHZvaWQgX19pbml0IG1lbWJsb2NrX2FsbG93X3Jlc2l6ZSh2b2lkKQog
ewogCW1lbWJsb2NrX2Nhbl9yZXNpemUgPSAxOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
