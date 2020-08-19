Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 07A5524FC07
	for <lists+openrisc@lfdr.de>; Mon, 24 Aug 2020 12:55:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6868920BA3;
	Mon, 24 Aug 2020 12:55:18 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 7B71820944
 for <openrisc@lists.librecores.org>; Wed, 19 Aug 2020 21:24:09 +0200 (CEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9402E2078D;
 Wed, 19 Aug 2020 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597865047;
 bh=6hhM8PiKqrI8OznN19QgLRQ0zl2av/Rwj0VbHVeg6TI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GeI8lPtKHV2olB+n1d/AHlFuCQdtbzjHW+ZeY/rUdgLakHkOt9wUYAnS0FY5DAaBS
 I2RN/QPVX1NYA77mL4Gju2LBembz/syr0lV3QTr54MfcpA1iUpBgt41tqO0dgw0etA
 mFQuuqulIWY5wbe9fNPxiTsAazhpzTtzhltFAhpw=
Date: Wed, 19 Aug 2020 12:24:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Message-Id: <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
In-Reply-To: <20200818151634.14343-10-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-10-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Aug 2020 12:55:17 +0200
Subject: Re: [OpenRISC] [PATCH v3 09/17] memblock: make memblock_debug and
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
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCAxOCBBdWcgMjAyMCAxODoxNjoyNiArMDMwMCBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5j
b20+Cj4gCj4gVGhlIG9ubHkgdXNlciBvZiBtZW1ibG9ja19kYmcoKSBvdXRzaWRlIG1lbWJsb2Nr
IHdhcyBzMzkwIHNldHVwIGNvZGUgYW5kIGl0Cj4gaXMgY29udmVydGVkIHRvIHVzZSBwcl9kZWJ1
ZygpIGluc3RlYWQuCj4gVGhpcyBhbGxvd3MgdG8gc3RvcCBleHBvc2luZyBtZW1ibG9ja19kZWJ1
ZyBhbmQgbWVtYmxvY2tfZGJnKCkgdG8gdGhlIHJlc3QKPiBvZiB0aGUga2VybmVsLgo+IAo+IC0t
LSBhL21tL21lbWJsb2NrLmMKPiArKysgYi9tbS9tZW1ibG9jay5jCj4gQEAgLTEzNyw3ICsxMzcs
MTAgQEAgc3RydWN0IG1lbWJsb2NrX3R5cGUgcGh5c21lbSA9IHsKPiAgCSAgICAgaSA8IG1lbWJs
b2NrX3R5cGUtPmNudDsJCQkJCVwKPiAgCSAgICAgaSsrLCByZ24gPSAmbWVtYmxvY2tfdHlwZS0+
cmVnaW9uc1tpXSkKPiAgCj4gLWludCBtZW1ibG9ja19kZWJ1ZyBfX2luaXRkYXRhX21lbWJsb2Nr
Owo+ICsjZGVmaW5lIG1lbWJsb2NrX2RiZyhmbXQsIC4uLikgXAo+ICsJaWYgKG1lbWJsb2NrX2Rl
YnVnKSBwcmludGsoS0VSTl9JTkZPIHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQo+ICsKCmNo
ZWNrcGF0Y2ggZG9lc24ndCBsaWtlIHRoaXMgbXVjaC4KCkVSUk9SOiBNYWNyb3Mgc3RhcnRpbmcg
d2l0aCBpZiBzaG91bGQgYmUgZW5jbG9zZWQgYnkgYSBkbyAtIHdoaWxlIGxvb3AgdG8gYXZvaWQg
cG9zc2libGUgaWYvZWxzZSBsb2dpYyBkZWZlY3RzCiMxMDE6IEZJTEU6IG1tL21lbWJsb2NrLmM6
MTQwOgorI2RlZmluZSBtZW1ibG9ja19kYmcoZm10LCAuLi4pIFwKKwlpZiAobWVtYmxvY2tfZGVi
dWcpIHByaW50ayhLRVJOX0lORk8gcHJfZm10KGZtdCksICMjX19WQV9BUkdTX18pCgpXQVJOSU5H
OiBQcmVmZXIgW3N1YnN5c3RlbSBlZzogbmV0ZGV2XV9pbmZvKFtzdWJzeXN0ZW1dZGV2LCAuLi4g
dGhlbiBkZXZfaW5mbyhkZXYsIC4uLiB0aGVuIHByX2luZm8oLi4uICB0byBwcmludGsoS0VSTl9J
TkZPIC4uLgojMTAyOiBGSUxFOiBtbS9tZW1ibG9jay5jOjE0MToKKwlpZiAobWVtYmxvY2tfZGVi
dWcpIHByaW50ayhLRVJOX0lORk8gcHJfZm10KGZtdCksICMjX19WQV9BUkdTX18pCgpFUlJPUjog
dHJhaWxpbmcgc3RhdGVtZW50cyBzaG91bGQgYmUgb24gbmV4dCBsaW5lCiMxMDI6IEZJTEU6IG1t
L21lbWJsb2NrLmM6MTQxOgorCWlmIChtZW1ibG9ja19kZWJ1ZykgcHJpbnRrKEtFUk5fSU5GTyBw
cl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXykKCgpUaGUgZmlyc3Qgb25lIGlzIHNpZ25pZmljYW50
OgoKCWlmIChmb28pCgkJbWVtYmxvY2tfZGJnKC4uLik7CgllbHNlCgkJc2F2ZV90aGVfd29ybGQo
KTsKCmNvdWxkIGVuZCB1cCBpbmFkdmVydGVudGx5IGRlc3Ryb3lpbmcgdGhlIHBsYW5ldC4KClRo
aXM/CgotLS0gYS9tbS9tZW1ibG9jay5jfm1lbWJsb2NrLW1ha2UtbWVtYmxvY2tfZGVidWctYW5k
LXJlbGF0ZWQtZnVuY3Rpb25hbGl0eS1wcml2YXRlLWZpeAorKysgYS9tbS9tZW1ibG9jay5jCkBA
IC0xMzcsOCArMTM3LDExIEBAIHN0cnVjdCBtZW1ibG9ja190eXBlIHBoeXNtZW0gPSB7CiAJICAg
ICBpIDwgbWVtYmxvY2tfdHlwZS0+Y250OwkJCQkJXAogCSAgICAgaSsrLCByZ24gPSAmbWVtYmxv
Y2tfdHlwZS0+cmVnaW9uc1tpXSkKIAotI2RlZmluZSBtZW1ibG9ja19kYmcoZm10LCAuLi4pIFwK
LQlpZiAobWVtYmxvY2tfZGVidWcpIHByaW50ayhLRVJOX0lORk8gcHJfZm10KGZtdCksICMjX19W
QV9BUkdTX18pCisjZGVmaW5lIG1lbWJsb2NrX2RiZyhmbXQsIC4uLikJCQkJCQlcCisJZG8gewkJ
CQkJCQkJXAorCQlpZiAobWVtYmxvY2tfZGVidWcpCQkJCQlcCisJCQlwcl9pbmZvKGZtdCwgIyNf
X1ZBX0FSR1NfXyk7CQkJXAorCX0gd2hpbGUgKDApCiAKIHN0YXRpYyBpbnQgbWVtYmxvY2tfZGVi
dWcgX19pbml0ZGF0YV9tZW1ibG9jazsKIHN0YXRpYyBib29sIHN5c3RlbV9oYXNfc29tZV9taXJy
b3IgX19pbml0ZGF0YV9tZW1ibG9jayA9IGZhbHNlOwpfCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
