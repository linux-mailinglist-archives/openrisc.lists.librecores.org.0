Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 95CE62499B6
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 92AD520D82;
	Wed, 19 Aug 2020 11:55:44 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9B6E120CB4
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:17:33 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E54462054F;
 Tue, 18 Aug 2020 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763852;
 bh=DFgjPvI/vXV91uvzN+sme20WtWl/kJKoZupsBOJXfBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sb4tO818fhfIY1L0sTQE8nDj+8mGi9uHOcqZnjg0uj3tpj6i4/rzppzDqqqompdjZ
 iFUaYJr4fueUpI5iPhsaxdXJPjYQyvH1ESfKCPejy1fi1XGVCto65QLI3+mssBbcEL
 8tsVYJMK/jhJgOVkQ7iYEV+fVy8vBFUiHXB5XJsI=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:21 +0300
Message-Id: <20200818151634.14343-5-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 04/17] arm64: numa: simplify dummy_numa_init()
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKZHVtbXlfbnVtYV9pbml0
KCkgbG9vcHMgb3ZlciBtZW1ibG9jay5tZW1vcnkgYW5kIHBhc3NlcyBuaWQ9MCB0bwpudW1hX2Fk
ZF9tZW1ibGsoKSB3aGljaCBlc3NlbnRpYWxseSB3cmFwcyBtZW1ibG9ja19zZXRfbm9kZSgpLiBI
b3dldmVyLAptZW1ibG9ja19zZXRfbm9kZSgpIGNhbiBjb3BlIHdpdGggZW50aXJlIG1lbW9yeSBz
cGFuIGl0c2VsZiwgc28gdGhlIGxvb3AKb3ZlciBtZW1ibG9jay5tZW1vcnkgcmVnaW9ucyBpcyBy
ZWR1bmRhbnQuCgpVc2luZyBhIHNpbmdsZSBjYWxsIHRvIG1lbWJsb2NrX3NldF9ub2RlKCkgcmF0
aGVyIHRoYW4gYSBsb29wIGFsc28gZml4ZXMgYW4KaXNzdWUgd2l0aCBhIGJ1Z2d5IEFDUEkgZmly
bXdhcmUgaW4gd2hpY2ggdGhlIFNSQVQgdGFibGUgY292ZXJzIHNvbWUgYnV0Cm5vdCBhbGwgb2Yg
dGhlIG1lbW9yeSBpbiB0aGUgRUZJIG1lbW9yeSBtYXAuCgpKb25hdGhhbiBDYW1lcm9uIHNheXM6
CgogIFRoaXMgaXNzdWUgY2FuIGJlIGVhc2lseSB0cmlnZ2VyZWQgYnkgaGF2aW5nIGFuIFNSQVQg
dGFibGUgd2hpY2ggZmFpbHMKICB0byBjb3ZlciBhbGwgZWxlbWVudHMgb2YgdGhlIEVGSSBtZW1v
cnkgbWFwLgoKICBUaGlzIGZpcm13YXJlIGVycm9yIGlzIGRldGVjdGVkIGFuZCBhIHdhcm5pbmcg
cHJpbnRlZC4gZS5nLgogICJOVU1BOiBXYXJuaW5nOiBpbnZhbGlkIG1lbWJsayBub2RlIDY0IFtt
ZW0gMHgyNDAwMDAwMDAtMHgyN2ZmZmZmZmZdIgogIEF0IHRoYXQgcG9pbnQgd2UgZmFsbCBiYWNr
IHRvIGR1bW15X251bWFfaW5pdCgpLgoKICBIb3dldmVyLCB0aGUgZmFpbGVkIEFDUEkgaW5pdCBo
YXMgbGVmdCB1cyB3aXRoIG91ciBtZW1ibG9ja3MgYWxsIGJyb2tlbgogIHVwIGFzIHdlIHNwbGl0
IHRoZW0gd2hlbiB0cnlpbmcgdG8gYXNzaWduIHRoZW0gdG8gTlVNQSBub2Rlcy4KCiAgV2UgdGhl
biBpdGVyYXRlIG92ZXIgdGhlIG1lbWJsb2NrcyBhbmQgYWRkIHRoZW0gdG8gbm9kZSAwLgoKICBu
dW1hX2FkZF9tZW1ibGsoKSBjYWxscyBtZW1ibG9ja19zZXRfbm9kZSgpIHdoaWNoIG1lcmdlcyBy
ZWdpb25zIHRoYXQKICB3ZXJlIHByZXZpb3VzbHkgc3BsaXQgdXAgZHVyaW5nIHRoZSBlYXJsaWVy
IGF0dGVtcHQgdG8gYWRkIHRoZW0gdG8gZGlmZmVyZW50CiAgbm9kZXMgZHVyaW5nIHBhcnNpbmcg
b2YgU1JBVC4KCiAgVGhpcyBtZWFucyBlbGVtZW50cyBhcmUgbW92ZWQgaW4gdGhlIG1lbWJsb2Nr
IGFycmF5IGFuZCB3ZSBjYW4gZW5kIHVwCiAgaW4gYSBkaWZmZXJlbnQgbWVtYmxvY2sgYWZ0ZXIg
dGhlIGNhbGwgdG8gbnVtYV9hZGRfbWVtYmxrKCkuCiAgUmVzdWx0IGlzOgoKICBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAw
MDAwM2E0MAogIE1lbSBhYm9ydCBpbmZvOgogICAgRVNSID0gMHg5NjAwMDAwNAogICAgRUMgPSAw
eDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzCiAgICBTRVQgPSAwLCBGblYgPSAw
CiAgICBFQSA9IDAsIFMxUFRXID0gMAogIERhdGEgYWJvcnQgaW5mbzoKICAgIElTViA9IDAsIElT
UyA9IDB4MDAwMDAwMDQKICAgIENNID0gMCwgV25SID0gMAogIFswMDAwMDAwMDAwMDAzYTQwXSB1
c2VyIGFkZHJlc3MgYnV0IGFjdGl2ZV9tbSBpcyBzd2FwcGVyCiAgSW50ZXJuYWwgZXJyb3I6IE9v
cHM6IDk2MDAwMDA0IFsjMV0gUFJFRU1QVCBTTVAKCiAgLi4uCgogIENhbGwgdHJhY2U6CiAgICBz
cGFyc2VfaW5pdF9uaWQrMHg1Yy8weDJiMAogICAgc3BhcnNlX2luaXQrMHgxMzgvMHgxNzAKICAg
IGJvb3RtZW1faW5pdCsweDgwLzB4ZTAKICAgIHNldHVwX2FyY2grMHgyYTAvMHg1ZmMKICAgIHN0
YXJ0X2tlcm5lbCsweDhjLzB4NjQ4CgpSZXBsYWNlIHRoZSBsb29wIHdpdGggYSBzaW5nbGUgY2Fs
bCB0byBtZW1ibG9ja19zZXRfbm9kZSgpIHRvIHRoZSBlbnRpcmUKbWVtb3J5LgoKU2lnbmVkLW9m
Zi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpBY2tlZC1ieTogSm9uYXRo
YW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgpBY2tlZC1ieTogQ2F0YWxp
biBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KLS0tCiBhcmNoL2FybTY0L21tL251
bWEuYyB8IDEzICsrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1hLmMgYi9hcmNo
L2FybTY0L21tL251bWEuYwppbmRleCA3M2Y4YjQ5ZDQ4NWMuLjhhOTdjZDNkMmRmZSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9tbS9udW1hLmMKKysrIGIvYXJjaC9hcm02NC9tbS9udW1hLmMKQEAg
LTQyMywxOSArNDIzLDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IG51bWFfaW5pdChpbnQgKCppbml0
X2Z1bmMpKHZvaWQpKQogICovCiBzdGF0aWMgaW50IF9faW5pdCBkdW1teV9udW1hX2luaXQodm9p
ZCkKIHsKKwlwaHlzX2FkZHJfdCBzdGFydCA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKTsKKwlw
aHlzX2FkZHJfdCBlbmQgPSBtZW1ibG9ja19lbmRfb2ZfRFJBTSgpOwogCWludCByZXQ7Ci0Jc3Ry
dWN0IG1lbWJsb2NrX3JlZ2lvbiAqbWJsazsKIAogCWlmIChudW1hX29mZikKIAkJcHJfaW5mbygi
TlVNQSBkaXNhYmxlZFxuIik7IC8qIEZvcmNlZCBvZmYgb24gY29tbWFuZCBsaW5lLiAqLwotCXBy
X2luZm8oIkZha2luZyBhIG5vZGUgYXQgW21lbSAlIzAxOEx4LSUjMDE4THhdXG4iLAotCQltZW1i
bG9ja19zdGFydF9vZl9EUkFNKCksIG1lbWJsb2NrX2VuZF9vZl9EUkFNKCkgLSAxKTsKLQotCWZv
cl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgbWJsaykgewotCQlyZXQgPSBudW1hX2FkZF9tZW1ibGso
MCwgbWJsay0+YmFzZSwgbWJsay0+YmFzZSArIG1ibGstPnNpemUpOwotCQlpZiAoIXJldCkKLQkJ
CWNvbnRpbnVlOworCXByX2luZm8oIkZha2luZyBhIG5vZGUgYXQgW21lbSAlIzAxOEx4LSUjMDE4
THhdXG4iLCBzdGFydCwgZW5kIC0gMSk7CiAKKwlyZXQgPSBudW1hX2FkZF9tZW1ibGsoMCwgc3Rh
cnQsIGVuZCk7CisJaWYgKHJldCkgewogCQlwcl9lcnIoIk5VTUEgaW5pdCBmYWlsZWRcbiIpOwog
CQlyZXR1cm4gcmV0OwogCX0KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
