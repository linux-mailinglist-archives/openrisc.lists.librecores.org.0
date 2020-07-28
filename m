Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 35B2B2460B8
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E81E920AC5;
	Mon, 17 Aug 2020 10:46:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 8698920CD8
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:13:53 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CFBB22B47;
 Tue, 28 Jul 2020 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913232;
 bh=s4TGTb+OM6aK8pYTyThZeMLhanWPb/uc+gXtOdjiGYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yyfhBe3Z1JOta7OKxVWMIjsqyELV3KSSG1sXhvTcAKiT2I+Tz0B/4ePu+iHQ0G/YT
 +Gk2OSGadKLdM9EQX8uTc6+YvhZVTdsuYDsaZckXNsXzKQPx24T8YMJ6VUpwVCnnqn
 6ux6E67Q5PAxPVGr1U4/qfs1AON/1+OS5GECpvHk=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:48 +0300
Message-Id: <20200728051153.1590-11-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 10/15] memblock: make memblock_debug and related
 functionality private
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIG9ubHkgdXNlciBv
ZiBtZW1ibG9ja19kYmcoKSBvdXRzaWRlIG1lbWJsb2NrIHdhcyBzMzkwIHNldHVwIGNvZGUgYW5k
IGl0CmlzIGNvbnZlcnRlZCB0byB1c2UgcHJfZGVidWcoKSBpbnN0ZWFkLgpUaGlzIGFsbG93cyB0
byBzdG9wIGV4cG9zaW5nIG1lbWJsb2NrX2RlYnVnIGFuZCBtZW1ibG9ja19kYmcoKSB0byB0aGUg
cmVzdApvZiB0aGUga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBs
aW51eC5pYm0uY29tPgotLS0KIGFyY2gvczM5MC9rZXJuZWwvc2V0dXAuYyB8ICA0ICsrLS0KIGlu
Y2x1ZGUvbGludXgvbWVtYmxvY2suaCB8IDEyICstLS0tLS0tLS0tLQogbW0vbWVtYmxvY2suYyAg
ICAgICAgICAgIHwgMTMgKysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAva2VybmVsL3Nl
dHVwLmMgYi9hcmNoL3MzOTAva2VybmVsL3NldHVwLmMKaW5kZXggMDdhYTE1YmE0M2IzLi44YjI4
NGNmNmUxOTkgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNo
L3MzOTAva2VybmVsL3NldHVwLmMKQEAgLTc3Niw4ICs3NzYsOCBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgbWVtYmxvY2tfYWRkX21lbV9kZXRlY3RfaW5mbyh2b2lkKQogCXVuc2lnbmVkIGxvbmcgc3Rh
cnQsIGVuZDsKIAlpbnQgaTsKIAotCW1lbWJsb2NrX2RiZygicGh5c21lbSBpbmZvIHNvdXJjZTog
JXMgKCVoaGQpXG4iLAotCQkgICAgIGdldF9tZW1faW5mb19zb3VyY2UoKSwgbWVtX2RldGVjdC5p
bmZvX3NvdXJjZSk7CisJcHJfZGVidWcoInBoeXNtZW0gaW5mbyBzb3VyY2U6ICVzICglaGhkKVxu
IiwKKwkJIGdldF9tZW1faW5mb19zb3VyY2UoKSwgbWVtX2RldGVjdC5pbmZvX3NvdXJjZSk7CiAJ
Lyoga2VlcCBtZW1ibG9jayBsaXN0cyBjbG9zZSB0byB0aGUga2VybmVsICovCiAJbWVtYmxvY2tf
c2V0X2JvdHRvbV91cCh0cnVlKTsKIAlmb3JfZWFjaF9tZW1fZGV0ZWN0X2Jsb2NrKGksICZzdGFy
dCwgJmVuZCkgewpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oIGIvaW5jbHVk
ZS9saW51eC9tZW1ibG9jay5oCmluZGV4IDIyMGI1ZjBkYWQ0Mi4uZTZhMjNiM2RiNjk2IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZW1i
bG9jay5oCkBAIC05MCw3ICs5MCw2IEBAIHN0cnVjdCBtZW1ibG9jayB7CiB9OwogCiBleHRlcm4g
c3RydWN0IG1lbWJsb2NrIG1lbWJsb2NrOwotZXh0ZXJuIGludCBtZW1ibG9ja19kZWJ1ZzsKIAog
I2lmbmRlZiBDT05GSUdfQVJDSF9LRUVQX01FTUJMT0NLCiAjZGVmaW5lIF9faW5pdF9tZW1ibG9j
ayBfX21lbWluaXQKQEAgLTEwMiw5ICsxMDEsNiBAQCB2b2lkIG1lbWJsb2NrX2Rpc2NhcmQodm9p
ZCk7CiBzdGF0aWMgaW5saW5lIHZvaWQgbWVtYmxvY2tfZGlzY2FyZCh2b2lkKSB7fQogI2VuZGlm
CiAKLSNkZWZpbmUgbWVtYmxvY2tfZGJnKGZtdCwgLi4uKSBcCi0JaWYgKG1lbWJsb2NrX2RlYnVn
KSBwcmludGsoS0VSTl9JTkZPIHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQotCiBwaHlzX2Fk
ZHJfdCBtZW1ibG9ja19maW5kX2luX3JhbmdlKHBoeXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJf
dCBlbmQsCiAJCQkJICAgcGh5c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpZ24pOwogdm9p
ZCBtZW1ibG9ja19hbGxvd19yZXNpemUodm9pZCk7CkBAIC00NTYsMTMgKzQ1Miw3IEBAIGJvb2wg
bWVtYmxvY2tfaXNfcmVnaW9uX21lbW9yeShwaHlzX2FkZHJfdCBiYXNlLCBwaHlzX2FkZHJfdCBz
aXplKTsKIGJvb2wgbWVtYmxvY2tfaXNfcmVzZXJ2ZWQocGh5c19hZGRyX3QgYWRkcik7CiBib29s
IG1lbWJsb2NrX2lzX3JlZ2lvbl9yZXNlcnZlZChwaHlzX2FkZHJfdCBiYXNlLCBwaHlzX2FkZHJf
dCBzaXplKTsKIAotZXh0ZXJuIHZvaWQgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lkKTsKLQotc3Rh
dGljIGlubGluZSB2b2lkIG1lbWJsb2NrX2R1bXBfYWxsKHZvaWQpCi17Ci0JaWYgKG1lbWJsb2Nr
X2RlYnVnKQotCQlfX21lbWJsb2NrX2R1bXBfYWxsKCk7Ci19Cit2b2lkIG1lbWJsb2NrX2R1bXBf
YWxsKHZvaWQpOwogCiAvKioKICAqIG1lbWJsb2NrX3NldF9jdXJyZW50X2xpbWl0IC0gU2V0IHRo
ZSBjdXJyZW50IGFsbG9jYXRpb24gbGltaXQgdG8gYWxsb3cKZGlmZiAtLWdpdCBhL21tL21lbWJs
b2NrLmMgYi9tbS9tZW1ibG9jay5jCmluZGV4IGE1YjliM2RmODFmYy4uODI0OTM4ODQ5ZjZkIDEw
MDY0NAotLS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEzNCw3ICsx
MzQsMTAgQEAgc3RydWN0IG1lbWJsb2NrIG1lbWJsb2NrIF9faW5pdGRhdGFfbWVtYmxvY2sgPSB7
CiAJICAgICBpIDwgbWVtYmxvY2tfdHlwZS0+Y250OwkJCQkJXAogCSAgICAgaSsrLCByZ24gPSAm
bWVtYmxvY2tfdHlwZS0+cmVnaW9uc1tpXSkKIAotaW50IG1lbWJsb2NrX2RlYnVnIF9faW5pdGRh
dGFfbWVtYmxvY2s7CisjZGVmaW5lIG1lbWJsb2NrX2RiZyhmbXQsIC4uLikgXAorCWlmIChtZW1i
bG9ja19kZWJ1ZykgcHJpbnRrKEtFUk5fSU5GTyBwcl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXykK
Kworc3RhdGljIGludCBtZW1ibG9ja19kZWJ1ZyBfX2luaXRkYXRhX21lbWJsb2NrOwogc3RhdGlj
IGJvb2wgc3lzdGVtX2hhc19zb21lX21pcnJvciBfX2luaXRkYXRhX21lbWJsb2NrID0gZmFsc2U7
CiBzdGF0aWMgaW50IG1lbWJsb2NrX2Nhbl9yZXNpemUgX19pbml0ZGF0YV9tZW1ibG9jazsKIHN0
YXRpYyBpbnQgbWVtYmxvY2tfbWVtb3J5X2luX3NsYWIgX19pbml0ZGF0YV9tZW1ibG9jayA9IDA7
CkBAIC0xOTE5LDcgKzE5MjIsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXRfbWVtYmxvY2sgbWVtYmxv
Y2tfZHVtcChzdHJ1Y3QgbWVtYmxvY2tfdHlwZSAqdHlwZSkKIAl9CiB9CiAKLXZvaWQgX19pbml0
X21lbWJsb2NrIF9fbWVtYmxvY2tfZHVtcF9hbGwodm9pZCkKK3N0YXRpYyB2b2lkIF9faW5pdF9t
ZW1ibG9jayBfX21lbWJsb2NrX2R1bXBfYWxsKHZvaWQpCiB7CiAJcHJfaW5mbygiTUVNQkxPQ0sg
Y29uZmlndXJhdGlvbjpcbiIpOwogCXByX2luZm8oIiBtZW1vcnkgc2l6ZSA9ICVwYSByZXNlcnZl
ZCBzaXplID0gJXBhXG4iLApAQCAtMTkzMyw2ICsxOTM2LDEyIEBAIHZvaWQgX19pbml0X21lbWJs
b2NrIF9fbWVtYmxvY2tfZHVtcF9hbGwodm9pZCkKICNlbmRpZgogfQogCit2b2lkIF9faW5pdF9t
ZW1ibG9jayBtZW1ibG9ja19kdW1wX2FsbCh2b2lkKQoreworCWlmIChtZW1ibG9ja19kZWJ1ZykK
KwkJX19tZW1ibG9ja19kdW1wX2FsbCgpOworfQorCiB2b2lkIF9faW5pdCBtZW1ibG9ja19hbGxv
d19yZXNpemUodm9pZCkKIHsKIAltZW1ibG9ja19jYW5fcmVzaXplID0gMTsKLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
