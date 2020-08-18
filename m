Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A074D2499BB
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2ADEF20D58;
	Wed, 19 Aug 2020 11:55:48 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 4982420CC4
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:18:28 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B66A72054F;
 Tue, 18 Aug 2020 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763907;
 bh=dUKKYp+Ft8lgOMm6cKxwXBFbtVJGm+PCemtBor/aqGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SWqHv/VvLWmdItemMFsJypQPsY1OSdFDGnONmHQO1oj21YEVwu+qnXbfl3f3a0DfV
 OBkfSBjlwY0rORPvgmvPfZ30NETD+FxClsfze0w0baJoX/wopG8hjHGzSAgEWrpKUx
 JX4k0TBTQmvHB6mwuwR5THhekoylPF8XUoQcrqCU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:26 +0300
Message-Id: <20200818151634.14343-10-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 09/17] memblock: make memblock_debug and
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
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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
MC9rZXJuZWwvc2V0dXAuYwppbmRleCBlNjAwZjY5NTNkN2MuLjY4MDg5ZWFiYWUyNyAxMDA2NDQK
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
LmgKaW5kZXggNTUwZmFmNjlmYzFjLi40N2E3NmUyMzdmY2EgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvbWVtYmxvY2suaAorKysgYi9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKQEAgLTg2LDcg
Kzg2LDYgQEAgc3RydWN0IG1lbWJsb2NrIHsKIH07CiAKIGV4dGVybiBzdHJ1Y3QgbWVtYmxvY2sg
bWVtYmxvY2s7Ci1leHRlcm4gaW50IG1lbWJsb2NrX2RlYnVnOwogCiAjaWZuZGVmIENPTkZJR19B
UkNIX0tFRVBfTUVNQkxPQ0sKICNkZWZpbmUgX19pbml0X21lbWJsb2NrIF9fbWVtaW5pdApAQCAt
OTgsOSArOTcsNiBAQCB2b2lkIG1lbWJsb2NrX2Rpc2NhcmQodm9pZCk7CiBzdGF0aWMgaW5saW5l
IHZvaWQgbWVtYmxvY2tfZGlzY2FyZCh2b2lkKSB7fQogI2VuZGlmCiAKLSNkZWZpbmUgbWVtYmxv
Y2tfZGJnKGZtdCwgLi4uKSBcCi0JaWYgKG1lbWJsb2NrX2RlYnVnKSBwcmludGsoS0VSTl9JTkZP
IHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQotCiBwaHlzX2FkZHJfdCBtZW1ibG9ja19maW5k
X2luX3JhbmdlKHBoeXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQsCiAJCQkJICAgcGh5
c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpZ24pOwogdm9pZCBtZW1ibG9ja19hbGxvd19y
ZXNpemUodm9pZCk7CkBAIC00NzYsMTMgKzQ3Miw3IEBAIGJvb2wgbWVtYmxvY2tfaXNfcmVnaW9u
X21lbW9yeShwaHlzX2FkZHJfdCBiYXNlLCBwaHlzX2FkZHJfdCBzaXplKTsKIGJvb2wgbWVtYmxv
Y2tfaXNfcmVzZXJ2ZWQocGh5c19hZGRyX3QgYWRkcik7CiBib29sIG1lbWJsb2NrX2lzX3JlZ2lv
bl9yZXNlcnZlZChwaHlzX2FkZHJfdCBiYXNlLCBwaHlzX2FkZHJfdCBzaXplKTsKIAotZXh0ZXJu
IHZvaWQgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lkKTsKLQotc3RhdGljIGlubGluZSB2b2lkIG1l
bWJsb2NrX2R1bXBfYWxsKHZvaWQpCi17Ci0JaWYgKG1lbWJsb2NrX2RlYnVnKQotCQlfX21lbWJs
b2NrX2R1bXBfYWxsKCk7Ci19Cit2b2lkIG1lbWJsb2NrX2R1bXBfYWxsKHZvaWQpOwogCiAvKioK
ICAqIG1lbWJsb2NrX3NldF9jdXJyZW50X2xpbWl0IC0gU2V0IHRoZSBjdXJyZW50IGFsbG9jYXRp
b24gbGltaXQgdG8gYWxsb3cKZGlmZiAtLWdpdCBhL21tL21lbWJsb2NrLmMgYi9tbS9tZW1ibG9j
ay5jCmluZGV4IDU5ZjM5OThhZTVkYi4uNzk5NTEzZjNkNmE5IDEwMDY0NAotLS0gYS9tbS9tZW1i
bG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEzNyw3ICsxMzcsMTAgQEAgc3RydWN0IG1l
bWJsb2NrX3R5cGUgcGh5c21lbSA9IHsKIAkgICAgIGkgPCBtZW1ibG9ja190eXBlLT5jbnQ7CQkJ
CQlcCiAJICAgICBpKyssIHJnbiA9ICZtZW1ibG9ja190eXBlLT5yZWdpb25zW2ldKQogCi1pbnQg
bWVtYmxvY2tfZGVidWcgX19pbml0ZGF0YV9tZW1ibG9jazsKKyNkZWZpbmUgbWVtYmxvY2tfZGJn
KGZtdCwgLi4uKSBcCisJaWYgKG1lbWJsb2NrX2RlYnVnKSBwcmludGsoS0VSTl9JTkZPIHByX2Zt
dChmbXQpLCAjI19fVkFfQVJHU19fKQorCitzdGF0aWMgaW50IG1lbWJsb2NrX2RlYnVnIF9faW5p
dGRhdGFfbWVtYmxvY2s7CiBzdGF0aWMgYm9vbCBzeXN0ZW1faGFzX3NvbWVfbWlycm9yIF9faW5p
dGRhdGFfbWVtYmxvY2sgPSBmYWxzZTsKIHN0YXRpYyBpbnQgbWVtYmxvY2tfY2FuX3Jlc2l6ZSBf
X2luaXRkYXRhX21lbWJsb2NrOwogc3RhdGljIGludCBtZW1ibG9ja19tZW1vcnlfaW5fc2xhYiBf
X2luaXRkYXRhX21lbWJsb2NrID0gMDsKQEAgLTE5MjAsNyArMTkyMyw3IEBAIHN0YXRpYyB2b2lk
IF9faW5pdF9tZW1ibG9jayBtZW1ibG9ja19kdW1wKHN0cnVjdCBtZW1ibG9ja190eXBlICp0eXBl
KQogCX0KIH0KIAotdm9pZCBfX2luaXRfbWVtYmxvY2sgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lk
KQorc3RhdGljIHZvaWQgX19pbml0X21lbWJsb2NrIF9fbWVtYmxvY2tfZHVtcF9hbGwodm9pZCkK
IHsKIAlwcl9pbmZvKCJNRU1CTE9DSyBjb25maWd1cmF0aW9uOlxuIik7CiAJcHJfaW5mbygiIG1l
bW9yeSBzaXplID0gJXBhIHJlc2VydmVkIHNpemUgPSAlcGFcbiIsCkBAIC0xOTM0LDYgKzE5Mzcs
MTIgQEAgdm9pZCBfX2luaXRfbWVtYmxvY2sgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lkKQogI2Vu
ZGlmCiB9CiAKK3ZvaWQgX19pbml0X21lbWJsb2NrIG1lbWJsb2NrX2R1bXBfYWxsKHZvaWQpCit7
CisJaWYgKG1lbWJsb2NrX2RlYnVnKQorCQlfX21lbWJsb2NrX2R1bXBfYWxsKCk7Cit9CisKIHZv
aWQgX19pbml0IG1lbWJsb2NrX2FsbG93X3Jlc2l6ZSh2b2lkKQogewogCW1lbWJsb2NrX2Nhbl9y
ZXNpemUgPSAxOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
