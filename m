Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CEB0E24FC08
	for <lists+openrisc@lfdr.de>; Mon, 24 Aug 2020 12:55:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AD83E20CB0;
	Mon, 24 Aug 2020 12:55:18 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id D645720CB0
 for <openrisc@lists.librecores.org>; Wed, 19 Aug 2020 22:49:04 +0200 (CEST)
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4559022B43;
 Wed, 19 Aug 2020 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597870143;
 bh=qGoMJNQU47bi4Lr27Xvnh0/Sq60m3eAX4xqpvHpl7z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDED5GsJw4zUuBdGb05pEvujvo8C6rUQNmDr6tFajHgKyq8u0aC1JhmrGGKixlNzr
 iJK0JwajiHl4HBTkAxVXhkjy+fJ4SSitgCYA/knE1HAPx9DykSi5zvv7ufmh3aqaBj
 /RQUWYvoEHKL6x5oDDNaW/gHGb6Yyk2UI/DMzVR8=
Date: Wed, 19 Aug 2020 23:48:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200819204848.GX752365@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-10-rppt@kernel.org>
 <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
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

T24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMTI6MjQ6MDVQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBUdWUsIDE4IEF1ZyAyMDIwIDE4OjE2OjI2ICswMzAwIE1pa2UgUmFwb3BvcnQg
PHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0
QGxpbnV4LmlibS5jb20+Cj4gPiAKPiA+IFRoZSBvbmx5IHVzZXIgb2YgbWVtYmxvY2tfZGJnKCkg
b3V0c2lkZSBtZW1ibG9jayB3YXMgczM5MCBzZXR1cCBjb2RlIGFuZCBpdAo+ID4gaXMgY29udmVy
dGVkIHRvIHVzZSBwcl9kZWJ1ZygpIGluc3RlYWQuCj4gPiBUaGlzIGFsbG93cyB0byBzdG9wIGV4
cG9zaW5nIG1lbWJsb2NrX2RlYnVnIGFuZCBtZW1ibG9ja19kYmcoKSB0byB0aGUgcmVzdAo+ID4g
b2YgdGhlIGtlcm5lbC4KPiA+IAo+ID4gLS0tIGEvbW0vbWVtYmxvY2suYwo+ID4gKysrIGIvbW0v
bWVtYmxvY2suYwo+ID4gQEAgLTEzNyw3ICsxMzcsMTAgQEAgc3RydWN0IG1lbWJsb2NrX3R5cGUg
cGh5c21lbSA9IHsKPiA+ICAJICAgICBpIDwgbWVtYmxvY2tfdHlwZS0+Y250OwkJCQkJXAo+ID4g
IAkgICAgIGkrKywgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbaV0pCj4gPiAgCj4gPiAt
aW50IG1lbWJsb2NrX2RlYnVnIF9faW5pdGRhdGFfbWVtYmxvY2s7Cj4gPiArI2RlZmluZSBtZW1i
bG9ja19kYmcoZm10LCAuLi4pIFwKPiA+ICsJaWYgKG1lbWJsb2NrX2RlYnVnKSBwcmludGsoS0VS
Tl9JTkZPIHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQo+ID4gKwo+IAo+IGNoZWNrcGF0Y2gg
ZG9lc24ndCBsaWtlIHRoaXMgbXVjaC4KPiAKPiBFUlJPUjogTWFjcm9zIHN0YXJ0aW5nIHdpdGgg
aWYgc2hvdWxkIGJlIGVuY2xvc2VkIGJ5IGEgZG8gLSB3aGlsZSBsb29wIHRvIGF2b2lkIHBvc3Np
YmxlIGlmL2Vsc2UgbG9naWMgZGVmZWN0cwo+ICMxMDE6IEZJTEU6IG1tL21lbWJsb2NrLmM6MTQw
Ogo+ICsjZGVmaW5lIG1lbWJsb2NrX2RiZyhmbXQsIC4uLikgXAo+ICsJaWYgKG1lbWJsb2NrX2Rl
YnVnKSBwcmludGsoS0VSTl9JTkZPIHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQo+IAo+IFdB
Uk5JTkc6IFByZWZlciBbc3Vic3lzdGVtIGVnOiBuZXRkZXZdX2luZm8oW3N1YnN5c3RlbV1kZXYs
IC4uLiB0aGVuIGRldl9pbmZvKGRldiwgLi4uIHRoZW4gcHJfaW5mbyguLi4gIHRvIHByaW50ayhL
RVJOX0lORk8gLi4uCj4gIzEwMjogRklMRTogbW0vbWVtYmxvY2suYzoxNDE6Cj4gKwlpZiAobWVt
YmxvY2tfZGVidWcpIHByaW50ayhLRVJOX0lORk8gcHJfZm10KGZtdCksICMjX19WQV9BUkdTX18p
Cj4gCj4gRVJST1I6IHRyYWlsaW5nIHN0YXRlbWVudHMgc2hvdWxkIGJlIG9uIG5leHQgbGluZQo+
ICMxMDI6IEZJTEU6IG1tL21lbWJsb2NrLmM6MTQxOgo+ICsJaWYgKG1lbWJsb2NrX2RlYnVnKSBw
cmludGsoS0VSTl9JTkZPIHByX2ZtdChmbXQpLCAjI19fVkFfQVJHU19fKQo+IAo+IAo+IFRoZSBm
aXJzdCBvbmUgaXMgc2lnbmlmaWNhbnQ6Cj4gCj4gCWlmIChmb28pCj4gCQltZW1ibG9ja19kYmco
Li4uKTsKPiAJZWxzZQo+IAkJc2F2ZV90aGVfd29ybGQoKTsKPiAKPiBjb3VsZCBlbmQgdXAgaW5h
ZHZlcnRlbnRseSBkZXN0cm95aW5nIHRoZSBwbGFuZXQuCgpXZWxsLCBpdCBkaWRuJ3QgdGlsbCBu
b3cgOy0pCgo+IFRoaXM/Cj4gCj4gLS0tIGEvbW0vbWVtYmxvY2suY35tZW1ibG9jay1tYWtlLW1l
bWJsb2NrX2RlYnVnLWFuZC1yZWxhdGVkLWZ1bmN0aW9uYWxpdHktcHJpdmF0ZS1maXgKPiArKysg
YS9tbS9tZW1ibG9jay5jCj4gQEAgLTEzNyw4ICsxMzcsMTEgQEAgc3RydWN0IG1lbWJsb2NrX3R5
cGUgcGh5c21lbSA9IHsKPiAgCSAgICAgaSA8IG1lbWJsb2NrX3R5cGUtPmNudDsJCQkJCVwKPiAg
CSAgICAgaSsrLCByZ24gPSAmbWVtYmxvY2tfdHlwZS0+cmVnaW9uc1tpXSkKPiAgCj4gLSNkZWZp
bmUgbWVtYmxvY2tfZGJnKGZtdCwgLi4uKSBcCj4gLQlpZiAobWVtYmxvY2tfZGVidWcpIHByaW50
ayhLRVJOX0lORk8gcHJfZm10KGZtdCksICMjX19WQV9BUkdTX18pCj4gKyNkZWZpbmUgbWVtYmxv
Y2tfZGJnKGZtdCwgLi4uKQkJCQkJCVwKPiArCWRvIHsJCQkJCQkJCVwKPiArCQlpZiAobWVtYmxv
Y2tfZGVidWcpCQkJCQlcCj4gKwkJCXByX2luZm8oZm10LCAjI19fVkFfQVJHU19fKTsJCQlcCj4g
Kwl9IHdoaWxlICgwKQoKU3VyZSwgdGhhbmtzIQoKPiAgc3RhdGljIGludCBtZW1ibG9ja19kZWJ1
ZyBfX2luaXRkYXRhX21lbWJsb2NrOwo+ICBzdGF0aWMgYm9vbCBzeXN0ZW1faGFzX3NvbWVfbWly
cm9yIF9faW5pdGRhdGFfbWVtYmxvY2sgPSBmYWxzZTsKPiBfCj4gCgotLSAKU2luY2VyZWx5IHlv
dXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
