Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8F87C2460A9
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4D3B220E41;
	Mon, 17 Aug 2020 10:45:56 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 1DF4120B14
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 08:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596607236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GMI2VHEJj5qxJst+Mnz2rfpYmYwR7lvZPX1P81/rYkI=;
 b=RlPgVbbfJFkjd9mLFwtjX1+jKyRyR+H7e5hr63wzCLToULy0Yrap6DtL8HB5j0Qhcr4S5c
 r502R3H1j4d5VHQT+hQSTK/jaZEnH+ytMnfHl9yYoLR9jBXbHiCGzctiYMLLoCoE1ewYfD
 L4GUlv0zS3u5IhAM8yB4J6q11NUeSR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-i88hwEKrNImuiQFvk1P0-w-1; Wed, 05 Aug 2020 02:00:30 -0400
X-MC-Unique: i88hwEKrNImuiQFvk1P0-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D7338064AC;
 Wed,  5 Aug 2020 06:00:13 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5810726A3;
 Wed,  5 Aug 2020 06:00:08 +0000 (UTC)
Date: Wed, 5 Aug 2020 14:00:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805060006.GU10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-15-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 14/17] x86/setup: simplify
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDgvMDIvMjAgYXQgMDc6MzVwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gKiBSZXBsYWNlIG1hZ2ljIG51bWJl
cnMgd2l0aCBkZWZpbmVzCj4gKiBSZXBsYWNlIG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2UoKSArIG1l
bWJsb2NrX3Jlc2VydmUoKSB3aXRoCj4gICBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKCkKPiAq
IFN0b3AgY2hlY2tpbmcgZm9yIGxvdyBtZW1vcnkgc2l6ZSBpbiByZXNlcnZlX2NyYXNoa2VybmVs
X2xvdygpLiBUaGUKPiAgIGFsbG9jYXRpb24gZnJvbSBsaW1pdGVkIHJhbmdlIHdpbGwgYW55d2F5
IGZhaWwgaWYgdGhlcmUgaXMgbm8gZW5vdWdoCj4gICBtZW1vcnksIHNvIHRoZXJlIGlzIG5vIG5l
ZWQgZm9yIGV4dHJhIHRyYXZlcnNhbCBvZiBtZW1ibG9jay5tZW1vcnkKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gveDg2
L2tlcm5lbC9zZXR1cC5jIHwgNDAgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0p
CgpBcHBsaWVkIHRoaXMgcGF0Y2ggb24gdG9wIG9mIDUuOCwgY3Jhc2hrZXJuZWwgcmVzZXJ2YXRp
b24gd29ya3Mgd2VsbC4KQW5kIHRoZSBjb2RlIGNoYW5nZSBsb29rcyBnb29kLgoKUmV2aWV3ZWQt
Ynk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgoKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva2VybmVsL3NldHVwLmMgYi9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYwo+IGluZGV4IGQ4ZGU0
MDUzYzVlOC4uZDdjZWQ2OTgyNTI0IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9zZXR1
cC5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMKPiBAQCAtNDE5LDEzICs0MTksMTMg
QEAgc3RhdGljIGludCBfX2luaXQgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9sb3codm9pZCkKPiAgewo+
ICAjaWZkZWYgQ09ORklHX1g4Nl82NAo+ICAJdW5zaWduZWQgbG9uZyBsb25nIGJhc2UsIGxvd19i
YXNlID0gMCwgbG93X3NpemUgPSAwOwo+IC0JdW5zaWduZWQgbG9uZyB0b3RhbF9sb3dfbWVtOwo+
ICsJdW5zaWduZWQgbG9uZyBsb3dfbWVtX2xpbWl0Owo+ICAJaW50IHJldDsKPiAgCj4gLQl0b3Rh
bF9sb3dfbWVtID0gbWVtYmxvY2tfbWVtX3NpemUoMVVMIDw8ICgzMiAtIFBBR0VfU0hJRlQpKTsK
PiArCWxvd19tZW1fbGltaXQgPSBtaW4obWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLCBDUkFTSF9B
RERSX0xPV19NQVgpOwo+ICAKPiAgCS8qIGNyYXNoa2VybmVsPVksbG93ICovCj4gLQlyZXQgPSBw
YXJzZV9jcmFzaGtlcm5lbF9sb3coYm9vdF9jb21tYW5kX2xpbmUsIHRvdGFsX2xvd19tZW0sICZs
b3dfc2l6ZSwgJmJhc2UpOwo+ICsJcmV0ID0gcGFyc2VfY3Jhc2hrZXJuZWxfbG93KGJvb3RfY29t
bWFuZF9saW5lLCBsb3dfbWVtX2xpbWl0LCAmbG93X3NpemUsICZiYXNlKTsKPiAgCWlmIChyZXQp
IHsKPiAgCQkvKgo+ICAJCSAqIHR3byBwYXJ0cyBmcm9tIGtlcm5lbC9kbWEvc3dpb3RsYi5jOgo+
IEBAIC00NDMsMjMgKzQ0MywxNyBAQCBzdGF0aWMgaW50IF9faW5pdCByZXNlcnZlX2NyYXNoa2Vy
bmVsX2xvdyh2b2lkKQo+ICAJCQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4gLQlsb3dfYmFzZSA9IG1l
bWJsb2NrX2ZpbmRfaW5fcmFuZ2UoMCwgMVVMTCA8PCAzMiwgbG93X3NpemUsIENSQVNIX0FMSUdO
KTsKPiArCWxvd19iYXNlID0gbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZShsb3dfc2l6ZSwgQ1JB
U0hfQUxJR04sIDAsIENSQVNIX0FERFJfTE9XX01BWCk7Cj4gIAlpZiAoIWxvd19iYXNlKSB7Cj4g
IAkJcHJfZXJyKCJDYW5ub3QgcmVzZXJ2ZSAlbGRNQiBjcmFzaGtlcm5lbCBsb3cgbWVtb3J5LCBw
bGVhc2UgdHJ5IHNtYWxsZXIgc2l6ZS5cbiIsCj4gIAkJICAgICAgICh1bnNpZ25lZCBsb25nKShs
b3dfc2l6ZSA+PiAyMCkpOwo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAJfQo+ICAKPiAtCXJldCA9
IG1lbWJsb2NrX3Jlc2VydmUobG93X2Jhc2UsIGxvd19zaXplKTsKPiAtCWlmIChyZXQpIHsKPiAt
CQlwcl9lcnIoIiVzOiBFcnJvciByZXNlcnZpbmcgY3Jhc2hrZXJuZWwgbG93IG1lbWJsb2NrLlxu
IiwgX19mdW5jX18pOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+IC0JcHJfaW5mbygiUmVz
ZXJ2aW5nICVsZE1CIG9mIGxvdyBtZW1vcnkgYXQgJWxkTUIgZm9yIGNyYXNoa2VybmVsIChTeXN0
ZW0gbG93IFJBTTogJWxkTUIpXG4iLAo+ICsJcHJfaW5mbygiUmVzZXJ2aW5nICVsZE1CIG9mIGxv
dyBtZW1vcnkgYXQgJWxkTUIgZm9yIGNyYXNoa2VybmVsIChsb3cgUkFNIGxpbWl0OiAlbGRNQilc
biIsCj4gIAkJKHVuc2lnbmVkIGxvbmcpKGxvd19zaXplID4+IDIwKSwKPiAgCQkodW5zaWduZWQg
bG9uZykobG93X2Jhc2UgPj4gMjApLAo+IC0JCSh1bnNpZ25lZCBsb25nKSh0b3RhbF9sb3dfbWVt
ID4+IDIwKSk7Cj4gKwkJKHVuc2lnbmVkIGxvbmcpKGxvd19tZW1fbGltaXQgPj4gMjApKTsKPiAg
Cj4gIAljcmFzaGtfbG93X3Jlcy5zdGFydCA9IGxvd19iYXNlOwo+ICAJY3Jhc2hrX2xvd19yZXMu
ZW5kICAgPSBsb3dfYmFzZSArIGxvd19zaXplIC0gMTsKPiBAQCAtNTAzLDEzICs0OTcsMTMgQEAg
c3RhdGljIHZvaWQgX19pbml0IHJlc2VydmVfY3Jhc2hrZXJuZWwodm9pZCkKPiAgCQkgKiB1bmxl
c3MgImNyYXNoa2VybmVsPXNpemVbS01HXSxoaWdoIiBpcyBzcGVjaWZpZWQuCj4gIAkJICovCj4g
IAkJaWYgKCFoaWdoKQo+IC0JCQljcmFzaF9iYXNlID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZShD
UkFTSF9BTElHTiwKPiAtCQkJCQkJQ1JBU0hfQUREUl9MT1dfTUFYLAo+IC0JCQkJCQljcmFzaF9z
aXplLCBDUkFTSF9BTElHTik7Cj4gKwkJCWNyYXNoX2Jhc2UgPSBtZW1ibG9ja19waHlzX2FsbG9j
X3JhbmdlKGNyYXNoX3NpemUsCj4gKwkJCQkJCUNSQVNIX0FMSUdOLCBDUkFTSF9BTElHTiwKPiAr
CQkJCQkJQ1JBU0hfQUREUl9MT1dfTUFYKTsKPiAgCQlpZiAoIWNyYXNoX2Jhc2UpCj4gLQkJCWNy
YXNoX2Jhc2UgPSBtZW1ibG9ja19maW5kX2luX3JhbmdlKENSQVNIX0FMSUdOLAo+IC0JCQkJCQlD
UkFTSF9BRERSX0hJR0hfTUFYLAo+IC0JCQkJCQljcmFzaF9zaXplLCBDUkFTSF9BTElHTik7Cj4g
KwkJCWNyYXNoX2Jhc2UgPSBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKGNyYXNoX3NpemUsCj4g
KwkJCQkJCUNSQVNIX0FMSUdOLCBDUkFTSF9BTElHTiwKPiArCQkJCQkJQ1JBU0hfQUREUl9ISUdI
X01BWCk7Cj4gIAkJaWYgKCFjcmFzaF9iYXNlKSB7Cj4gIAkJCXByX2luZm8oImNyYXNoa2VybmVs
IHJlc2VydmF0aW9uIGZhaWxlZCAtIE5vIHN1aXRhYmxlIGFyZWEgZm91bmQuXG4iKTsKPiAgCQkJ
cmV0dXJuOwo+IEBAIC01MTcsMTkgKzUxMSwxMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmVzZXJ2
ZV9jcmFzaGtlcm5lbCh2b2lkKQo+ICAJfSBlbHNlIHsKPiAgCQl1bnNpZ25lZCBsb25nIGxvbmcg
c3RhcnQ7Cj4gIAo+IC0JCXN0YXJ0ID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZShjcmFzaF9iYXNl
LAo+IC0JCQkJCSAgICAgICBjcmFzaF9iYXNlICsgY3Jhc2hfc2l6ZSwKPiAtCQkJCQkgICAgICAg
Y3Jhc2hfc2l6ZSwgMSA8PCAyMCk7Cj4gKwkJc3RhcnQgPSBtZW1ibG9ja19waHlzX2FsbG9jX3Jh
bmdlKGNyYXNoX3NpemUsIFNaXzFNLCBjcmFzaF9iYXNlLAo+ICsJCQkJCQkgIGNyYXNoX2Jhc2Ug
KyBjcmFzaF9zaXplKTsKPiAgCQlpZiAoc3RhcnQgIT0gY3Jhc2hfYmFzZSkgewo+ICAJCQlwcl9p
bmZvKCJjcmFzaGtlcm5lbCByZXNlcnZhdGlvbiBmYWlsZWQgLSBtZW1vcnkgaXMgaW4gdXNlLlxu
Iik7Cj4gIAkJCXJldHVybjsKPiAgCQl9Cj4gIAl9Cj4gLQlyZXQgPSBtZW1ibG9ja19yZXNlcnZl
KGNyYXNoX2Jhc2UsIGNyYXNoX3NpemUpOwo+IC0JaWYgKHJldCkgewo+IC0JCXByX2VycigiJXM6
IEVycm9yIHJlc2VydmluZyBjcmFzaGtlcm5lbCBtZW1ibG9jay5cbiIsIF9fZnVuY19fKTsKPiAt
CQlyZXR1cm47Cj4gLQl9Cj4gIAo+ICAJaWYgKGNyYXNoX2Jhc2UgPj0gKDFVTEwgPDwgMzIpICYm
IHJlc2VydmVfY3Jhc2hrZXJuZWxfbG93KCkpIHsKPiAgCQltZW1ibG9ja19mcmVlKGNyYXNoX2Jh
c2UsIGNyYXNoX3NpemUpOwo+IC0tIAo+IDIuMjYuMgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
