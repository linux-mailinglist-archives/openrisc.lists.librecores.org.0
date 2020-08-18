Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E70572499C3
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 80B4220D8D;
	Wed, 19 Aug 2020 11:55:57 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1558D20CD9
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:19:57 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD7D0207DE;
 Tue, 18 Aug 2020 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763995;
 bh=ozDs+ikcDN9A8o1w1ZdwHNmljXS0aLZyo/vOcdPYmPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q2YllB9nxUs1S8Yq+B7V9TZ9cWz5F/+xOingwwq7uoFzA7Y3VtgRDQ88+C68JDaKk
 9Cp0/R0cjM1AjjyNT45D7/sgkudmCC50TRmJL2WZildNh9PimFmugzn8K80+/wDka2
 Rhm31KncO57PPdeDTZwxahtVjAg9quHFjMnG2guE=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:34 +0300
Message-Id: <20200818151634.14343-18-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 17/17] memblock: use separate iterators for
 memory and reserved regions
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
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKZm9yX2VhY2hfbWVtYmxv
Y2soKSBpcyB1c2VkIHRvIGl0ZXJhdGUgb3ZlciBtZW1ibG9jay5tZW1vcnkgaW4KYSBmZXcgcGxh
Y2VzIHRoYXQgdXNlIGRhdGEgZnJvbSBtZW1ibG9ja19yZWdpb24gcmF0aGVyIHRoYW4gdGhlIG1l
bW9yeQpyYW5nZXMuCgpJbnRyb2R1Y2Ugc2VwYXJhdGUgZm9yX2VhY2hfbWVtX3JlZ2lvbigpIGFu
ZCBmb3JfZWFjaF9yZXNlcnZlZF9tZW1fcmVnaW9uKCkKdG8gaW1wcm92ZSBlbmNhcHN1bGF0aW9u
IG9mIG1lbWJsb2NrIGludGVybmFscyBmcm9tIGl0cyB1c2Vycy4KClNpZ25lZC1vZmYtYnk6IE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KUmV2aWV3ZWQtYnk6IEJhb3F1YW4gSGUg
PGJoZUByZWRoYXQuY29tPgpBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+
CQkgICAjIHg4NgpBY2tlZC1ieTogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEu
ZnJhbmtlbi5kZT4gICMgTUlQUwpBY2tlZC1ieTogTWlndWVsIE9qZWRhIDxtaWd1ZWwub2plZGEu
c2FuZG9uaXNAZ21haWwuY29tPiAgICMgLmNsYW5nLWZvcm1hdAotLS0KIC5jbGFuZy1mb3JtYXQg
ICAgICAgICAgICAgICAgICB8ICAzICsrLQogYXJjaC9hcm02NC9rZXJuZWwvc2V0dXAuYyAgICAg
IHwgIDIgKy0KIGFyY2gvYXJtNjQvbW0vbnVtYS5jICAgICAgICAgICB8ICAyICstCiBhcmNoL21p
cHMvbmV0bG9naWMveGxwL3NldHVwLmMgfCAgMiArLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgICAg
ICAgICAgIHwgIDIgKy0KIGFyY2gveDg2L21tL251bWEuYyAgICAgICAgICAgICB8ICAyICstCiBp
bmNsdWRlL2xpbnV4L21lbWJsb2NrLmggICAgICAgfCAxOSArKysrKysrKysrKysrKysrLS0tCiBt
bS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBtbS9wYWdlX2FsbG9jLmMg
ICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQogOSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS8uY2xhbmctZm9ybWF0IGIvLmNs
YW5nLWZvcm1hdAppbmRleCAyYjc3Y2M0MTliOTcuLmExMThmZGRlMjVjMSAxMDA2NDQKLS0tIGEv
LmNsYW5nLWZvcm1hdAorKysgYi8uY2xhbmctZm9ybWF0CkBAIC0yMDEsNyArMjAxLDcgQEAgRm9y
RWFjaE1hY3JvczoKICAgLSAnZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZScKICAgLSAnZm9yX2VhY2hf
bWF0Y2hpbmdfbm9kZV9hbmRfbWF0Y2gnCiAgIC0gJ2Zvcl9lYWNoX21lbWJlcicKLSAgLSAnZm9y
X2VhY2hfbWVtYmxvY2snCisgIC0gJ2Zvcl9lYWNoX21lbV9yZWdpb24nCiAgIC0gJ2Zvcl9lYWNo
X21lbWJsb2NrX3R5cGUnCiAgIC0gJ2Zvcl9lYWNoX21lbWNnX2NhY2hlX2luZGV4JwogICAtICdm
b3JfZWFjaF9tZW1fcGZuX3JhbmdlJwpAQCAtMjY4LDYgKzI2OCw3IEBAIEZvckVhY2hNYWNyb3M6
CiAgIC0gJ2Zvcl9lYWNoX3Byb3BlcnR5X29mX25vZGUnCiAgIC0gJ2Zvcl9lYWNoX3JlZ2lzdGVy
ZWRfZmInCiAgIC0gJ2Zvcl9lYWNoX3Jlc2VydmVkX21lbV9yYW5nZScKKyAgLSAnZm9yX2VhY2hf
cmVzZXJ2ZWRfbWVtX3JlZ2lvbicKICAgLSAnZm9yX2VhY2hfcnRkX2NvZGVjX2RhaXMnCiAgIC0g
J2Zvcl9lYWNoX3J0ZF9jb2RlY19kYWlzX3JvbGxiYWNrJwogICAtICdmb3JfZWFjaF9ydGRfY29t
cG9uZW50cycKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3NldHVwLmMgYi9hcmNoL2Fy
bTY0L2tlcm5lbC9zZXR1cC5jCmluZGV4IGE5ODZjNmY4YWI0Mi4uZGNjZTcyYWMwNzJiIDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9zZXR1cC5jCisrKyBiL2FyY2gvYXJtNjQva2VybmVs
L3NldHVwLmMKQEAgLTIxNyw3ICsyMTcsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmVxdWVzdF9z
dGFuZGFyZF9yZXNvdXJjZXModm9pZCkKIAlpZiAoIXN0YW5kYXJkX3Jlc291cmNlcykKIAkJcGFu
aWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJXp1IGJ5dGVzXG4iLCBfX2Z1bmNfXywgcmVzX3Np
emUpOwogCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWdpb24pIHsKKwlmb3JfZWFjaF9t
ZW1fcmVnaW9uKHJlZ2lvbikgewogCQlyZXMgPSAmc3RhbmRhcmRfcmVzb3VyY2VzW2krK107CiAJ
CWlmIChtZW1ibG9ja19pc19ub21hcChyZWdpb24pKSB7CiAJCQlyZXMtPm5hbWUgID0gInJlc2Vy
dmVkIjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vbnVtYS5jIGIvYXJjaC9hcm02NC9tbS9u
dW1hLmMKaW5kZXggOGE5N2NkM2QyZGZlLi41ZWZkYmQwMWE1OWMgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtNjQvbW0vbnVtYS5jCisrKyBiL2FyY2gvYXJtNjQvbW0vbnVtYS5jCkBAIC0zNTAsNyArMzUw
LDcgQEAgc3RhdGljIGludCBfX2luaXQgbnVtYV9yZWdpc3Rlcl9ub2Rlcyh2b2lkKQogCXN0cnVj
dCBtZW1ibG9ja19yZWdpb24gKm1ibGs7CiAKIAkvKiBDaGVjayB0aGF0IHZhbGlkIG5pZCBpcyBz
ZXQgdG8gbWVtYmxrcyAqLwotCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgbWJsaykgeworCWZv
cl9lYWNoX21lbV9yZWdpb24obWJsaykgewogCQlpbnQgbWJsa19uaWQgPSBtZW1ibG9ja19nZXRf
cmVnaW9uX25vZGUobWJsayk7CiAKIAkJaWYgKG1ibGtfbmlkID09IE5VTUFfTk9fTk9ERSB8fCBt
YmxrX25pZCA+PSBNQVhfTlVNTk9ERVMpIHsKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9uZXRsb2dp
Yy94bHAvc2V0dXAuYyBiL2FyY2gvbWlwcy9uZXRsb2dpYy94bHAvc2V0dXAuYwppbmRleCAxYTBm
YzViNjJiYTQuLjZlMzEwMmJjZDJmMSAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL25ldGxvZ2ljL3hs
cC9zZXR1cC5jCisrKyBiL2FyY2gvbWlwcy9uZXRsb2dpYy94bHAvc2V0dXAuYwpAQCAtNzAsNyAr
NzAsNyBAQCBzdGF0aWMgdm9pZCBubG1fZml4dXBfbWVtKHZvaWQpCiAJY29uc3QgaW50IHByZWZf
YmFja3VwID0gNTEyOwogCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKm1lbTsKIAotCWZvcl9lYWNo
X21lbWJsb2NrKG1lbW9yeSwgbWVtKSB7CisJZm9yX2VhY2hfbWVtX3JlZ2lvbihtZW0pIHsKIAkJ
bWVtYmxvY2tfcmVtb3ZlKG1lbS0+YmFzZSArIG1lbS0+c2l6ZSAtIHByZWZfYmFja3VwLAogCQkJ
cHJlZl9iYWNrdXApOwogCX0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKaW5kZXggMDYzNTU3MTZkMTlhLi4xZmI2YTgyNmMyZmQgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCkBA
IC01MzEsNyArNTMxLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHJlc291cmNlX2luaXQodm9pZCkK
IHsKIAlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWdpb247CiAKLQlmb3JfZWFjaF9tZW1ibG9j
ayhtZW1vcnksIHJlZ2lvbikgeworCWZvcl9lYWNoX21lbV9yZWdpb24ocmVnaW9uKSB7CiAJCXN0
cnVjdCByZXNvdXJjZSAqcmVzOwogCiAJCXJlcyA9IG1lbWJsb2NrX2FsbG9jKHNpemVvZihzdHJ1
Y3QgcmVzb3VyY2UpLCBTTVBfQ0FDSEVfQllURVMpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0v
bnVtYS5jIGIvYXJjaC94ODYvbW0vbnVtYS5jCmluZGV4IGFhNzZlYzJkMzU5Yi4uYjYyNDY3Njg0
NzlkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9udW1hLmMKKysrIGIvYXJjaC94ODYvbW0vbnVt
YS5jCkBAIC01MTYsNyArNTE2LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IG51bWFfY2xlYXJfa2Vy
bmVsX25vZGVfaG90cGx1Zyh2b2lkKQogCSAqICAgbWVtb3J5IHJhbmdlcywgYmVjYXVzZSBxdWly
a3Mgc3VjaCBhcyB0cmltX3NuYl9tZW1vcnkoKQogCSAqICAgcmVzZXJ2ZSBzcGVjaWZpYyBwYWdl
cyBmb3IgU2FuZHkgQnJpZGdlIGdyYXBoaWNzLiBdCiAJICovCi0JZm9yX2VhY2hfbWVtYmxvY2so
cmVzZXJ2ZWQsIG1iX3JlZ2lvbikgeworCWZvcl9lYWNoX3Jlc2VydmVkX21lbV9yZWdpb24obWJf
cmVnaW9uKSB7CiAJCWludCBuaWQgPSBtZW1ibG9ja19nZXRfcmVnaW9uX25vZGUobWJfcmVnaW9u
KTsKIAogCQlpZiAobmlkICE9IE1BWF9OVU1OT0RFUykKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbWVtYmxvY2suaCBiL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaAppbmRleCAzNTQwNzg3MTNj
ZDEuLmVmMTMxMjU1Y2VkYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCisr
KyBiL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaApAQCAtNTUzLDkgKzU1MywyMiBAQCBzdGF0aWMg
aW5saW5lIHVuc2lnbmVkIGxvbmcgbWVtYmxvY2tfcmVnaW9uX3Jlc2VydmVkX2VuZF9wZm4oY29u
c3Qgc3RydWN0IG1lbWJsbwogCXJldHVybiBQRk5fVVAocmVnLT5iYXNlICsgcmVnLT5zaXplKTsK
IH0KIAotI2RlZmluZSBmb3JfZWFjaF9tZW1ibG9jayhtZW1ibG9ja190eXBlLCByZWdpb24pCQkJ
CQlcCi0JZm9yIChyZWdpb24gPSBtZW1ibG9jay5tZW1ibG9ja190eXBlLnJlZ2lvbnM7CQkJCQlc
Ci0JICAgICByZWdpb24gPCAobWVtYmxvY2subWVtYmxvY2tfdHlwZS5yZWdpb25zICsgbWVtYmxv
Y2subWVtYmxvY2tfdHlwZS5jbnQpOwlcCisvKioKKyAqIGZvcl9lYWNoX21lbV9yZWdpb24gLSBp
dGVyZWF0ZSBvdmVyIG1lbW9yeSByZWdpb25zCisgKiBAcmVnaW9uOiBsb29wIHZhcmlhYmxlCisg
Ki8KKyNkZWZpbmUgZm9yX2VhY2hfbWVtX3JlZ2lvbihyZWdpb24pCQkJCQlcCisJZm9yIChyZWdp
b24gPSBtZW1ibG9jay5tZW1vcnkucmVnaW9uczsJCQkJXAorCSAgICAgcmVnaW9uIDwgKG1lbWJs
b2NrLm1lbW9yeS5yZWdpb25zICsgbWVtYmxvY2subWVtb3J5LmNudCk7CVwKKwkgICAgIHJlZ2lv
bisrKQorCisvKioKKyAqIGZvcl9lYWNoX3Jlc2VydmVkX21lbV9yZWdpb24gLSBpdGVyZWF0ZSBv
dmVyIHJlc2VydmVkIG1lbW9yeSByZWdpb25zCisgKiBAcmVnaW9uOiBsb29wIHZhcmlhYmxlCisg
Ki8KKyNkZWZpbmUgZm9yX2VhY2hfcmVzZXJ2ZWRfbWVtX3JlZ2lvbihyZWdpb24pCQkJCVwKKwlm
b3IgKHJlZ2lvbiA9IG1lbWJsb2NrLnJlc2VydmVkLnJlZ2lvbnM7CQkJXAorCSAgICAgcmVnaW9u
IDwgKG1lbWJsb2NrLnJlc2VydmVkLnJlZ2lvbnMgKyBtZW1ibG9jay5yZXNlcnZlZC5jbnQpOyBc
CiAJICAgICByZWdpb24rKykKIAogZXh0ZXJuIHZvaWQgKmFsbG9jX2xhcmdlX3N5c3RlbV9oYXNo
KGNvbnN0IGNoYXIgKnRhYmxlbmFtZSwKZGlmZiAtLWdpdCBhL21tL21lbWJsb2NrLmMgYi9tbS9t
ZW1ibG9jay5jCmluZGV4IGQwYmU1N2FjY2NmMi4uNGVhY2ZlZDg3MmM0IDEwMDY0NAotLS0gYS9t
bS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTE2NjQsNyArMTY2NCw3IEBAIHN0
YXRpYyBwaHlzX2FkZHJfdCBfX2luaXRfbWVtYmxvY2sgX19maW5kX21heF9hZGRyKHBoeXNfYWRk
cl90IGxpbWl0KQogCSAqIHRoZSBtZW1vcnkgbWVtYmxvY2sgcmVnaW9ucywgaWYgdGhlIEBsaW1p
dCBleGNlZWRzIHRoZSB0b3RhbCBzaXplCiAJICogb2YgdGhvc2UgcmVnaW9ucywgbWF4X2FkZHIg
d2lsbCBrZWVwIG9yaWdpbmFsIHZhbHVlIFBIWVNfQUREUl9NQVgKIAkgKi8KLQlmb3JfZWFjaF9t
ZW1ibG9jayhtZW1vcnksIHIpIHsKKwlmb3JfZWFjaF9tZW1fcmVnaW9uKHIpIHsKIAkJaWYgKGxp
bWl0IDw9IHItPnNpemUpIHsKIAkJCW1heF9hZGRyID0gci0+YmFzZSArIGxpbWl0OwogCQkJYnJl
YWs7CkBAIC0xODM0LDcgKzE4MzQsNyBAQCB2b2lkIF9faW5pdF9tZW1ibG9jayBtZW1ibG9ja190
cmltX21lbW9yeShwaHlzX2FkZHJfdCBhbGlnbikKIAlwaHlzX2FkZHJfdCBzdGFydCwgZW5kLCBv
cmlnX3N0YXJ0LCBvcmlnX2VuZDsKIAlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyOwogCi0JZm9y
X2VhY2hfbWVtYmxvY2sobWVtb3J5LCByKSB7CisJZm9yX2VhY2hfbWVtX3JlZ2lvbihyKSB7CiAJ
CW9yaWdfc3RhcnQgPSByLT5iYXNlOwogCQlvcmlnX2VuZCA9IHItPmJhc2UgKyByLT5zaXplOwog
CQlzdGFydCA9IHJvdW5kX3VwKG9yaWdfc3RhcnQsIGFsaWduKTsKZGlmZiAtLWdpdCBhL21tL3Bh
Z2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCAxMmRhNTZiMWNmMzkuLjM2Njk4MmQx
YTFjMiAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5jCisrKyBiL21tL3BhZ2VfYWxsb2MuYwpA
QCAtNTk1MCw3ICs1OTUwLDcgQEAgb3ZlcmxhcF9tZW1tYXBfaW5pdCh1bnNpZ25lZCBsb25nIHpv
bmUsIHVuc2lnbmVkIGxvbmcgKnBmbikKIAogCWlmIChtaXJyb3JlZF9rZXJuZWxjb3JlICYmIHpv
bmUgPT0gWk9ORV9NT1ZBQkxFKSB7CiAJCWlmICghciB8fCAqcGZuID49IG1lbWJsb2NrX3JlZ2lv
bl9tZW1vcnlfZW5kX3BmbihyKSkgewotCQkJZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByKSB7
CisJCQlmb3JfZWFjaF9tZW1fcmVnaW9uKHIpIHsKIAkJCQlpZiAoKnBmbiA8IG1lbWJsb2NrX3Jl
Z2lvbl9tZW1vcnlfZW5kX3BmbihyKSkKIAkJCQkJYnJlYWs7CiAJCQl9CkBAIC02NTM1LDcgKzY1
MzUsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQgem9uZV9hYnNlbnRfcGFnZXNfaW5f
bm9kZShpbnQgbmlkLAogCQl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKIAkJc3Ry
dWN0IG1lbWJsb2NrX3JlZ2lvbiAqcjsKIAotCQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHIp
IHsKKwkJZm9yX2VhY2hfbWVtX3JlZ2lvbihyKSB7CiAJCQlzdGFydF9wZm4gPSBjbGFtcChtZW1i
bG9ja19yZWdpb25fbWVtb3J5X2Jhc2VfcGZuKHIpLAogCQkJCQkgIHpvbmVfc3RhcnRfcGZuLCB6
b25lX2VuZF9wZm4pOwogCQkJZW5kX3BmbiA9IGNsYW1wKG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlf
ZW5kX3BmbihyKSwKQEAgLTcxMjksNyArNzEyOSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBmaW5k
X3pvbmVfbW92YWJsZV9wZm5zX2Zvcl9ub2Rlcyh2b2lkKQogCSAqIG9wdGlvbnMuCiAJICovCiAJ
aWYgKG1vdmFibGVfbm9kZV9pc19lbmFibGVkKCkpIHsKLQkJZm9yX2VhY2hfbWVtYmxvY2sobWVt
b3J5LCByKSB7CisJCWZvcl9lYWNoX21lbV9yZWdpb24ocikgewogCQkJaWYgKCFtZW1ibG9ja19p
c19ob3RwbHVnZ2FibGUocikpCiAJCQkJY29udGludWU7CiAKQEAgLTcxNTAsNyArNzE1MCw3IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBmaW5kX3pvbmVfbW92YWJsZV9wZm5zX2Zvcl9ub2Rlcyh2b2lk
KQogCWlmIChtaXJyb3JlZF9rZXJuZWxjb3JlKSB7CiAJCWJvb2wgbWVtX2JlbG93XzRnYl9ub3Rf
bWlycm9yZWQgPSBmYWxzZTsKIAotCQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHIpIHsKKwkJ
Zm9yX2VhY2hfbWVtX3JlZ2lvbihyKSB7CiAJCQlpZiAobWVtYmxvY2tfaXNfbWlycm9yKHIpKQog
CQkJCWNvbnRpbnVlOwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
