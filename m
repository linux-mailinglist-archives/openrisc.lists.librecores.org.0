Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A58204B88DC
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:16:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8460A24824;
	Wed, 16 Feb 2022 14:16:48 +0100 (CET)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mail.librecores.org (Postfix) with ESMTPS id 190B724818
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:16:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63D25CE26EE;
 Wed, 16 Feb 2022 13:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5098AC340F3;
 Wed, 16 Feb 2022 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017403;
 bh=FL3MwLnWcBo8JSN1gcn5jt3T6ZS9T2mg8wS4azHPBik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2Mjm03t4E3XFheH9yqQ6BGU3tXKnLCiOO/OwTUtf1lgBYcrWial86jpIz7PtRFIw
 avWAsmqN07Ju1N9aZWFEK6djiU4xxVsrWrIldgYbLMAINPBCIE+Gm9knAbw2ZJ5YQU
 0At6HGqJSzJ5Apl70hqpM+UJUgnBEg8NWGL9S7AWW9MhT9XDK6p1AAJUM3JogLfwD2
 1lrWss7flCDtYrrnfWGqToUCjUhfOxjIFu9y4/66Sjvu+ZaCBq+vjebdXEQiJu+If4
 gZzt/RXBM8sHm8w1g75IDg7GXTr01G1sdmyHMVFaBZouzSWgTlBFAfWq558NJn3p1E
 Mzr/8UqWDZOoA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:20 +0100
Message-Id: <20220216131332.1489939-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 06/18] x86: use more conventional access_ok()
 definition
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClRoZSB3YXkgdGhhdCBhY2Nlc3Nf
b2soKSBpcyBkZWZpbmVkIG9uIHg4NiBpcyBzbGlnaHRseSBkaWZmZXJlbnQgZnJvbQptb3N0IG90
aGVyIGFyY2hpdGVjdHVyZXMsIGFuZCBhIGJpdCBtb3JlIGNvbXBsZXguCgpUaGUgZ2VuZXJpYyB2
ZXJzaW9uIHRlbmRzIHRvIHJlc3VsdCBpbiB0aGUgYmVzdCBvdXRwdXQgb24gYWxsCmFyY2hpdGVj
dHVyZXMsIGFzIGl0IHJlc3VsdHMgaW4gc2luZ2xlIGNvbXBhcmlzb24gYWdhaW5zdCBhIGNvbnN0
YW50CmxpbWl0IGZvciBjYWxscyB3aXRoIGEga25vd24gc2l6ZS4KClRoZXJlIGFyZSBhIGZldyBj
YWxsZXJzIG9mIF9fcmFuZ2Vfbm90X29rKCksIGFsbCBvZiB3aGljaCB1c2UgVEFTS19TSVpFCmFz
IHRoZSBsaW1pdCByYXRoZXIgdGhhbiBUQVNLX1NJWkVfTUFYLCBidXQgSSBjb3VsZCBub3Qgc2Vl
IGFueSByZWFzb24KZm9yIHBpY2tpbmcgdGhpcy4gQ2hhbmdpbmcgdGhlc2UgdG8gY2FsbCBfX2Fj
Y2Vzc19vaygpIGluc3RlYWQgdXNlcyB0aGUKZGVmYXVsdCBsaW1pdCwgYnV0IGtlZXBzIHRoZSBi
ZWhhdmlvciBvdGhlcndpc2UuCgp4ODYgaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHdpdGggYSBX
QVJOX09OX0lOX0lSUSgpIGNoZWNraW5nCmFjY2Vzc19vaygpLCBidXQgaXQncyBwcm9iYWJseSBi
ZXN0IHRvIGxlYXZlIHRoYXQgaW4gcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDI1
ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Vh
Y2Nlc3MuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCA3OWM0ODY5Y2Nk
ZDYuLmE1OWJhMjU3OGU2NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vz
cy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtMTYsMzMgKzE2LDE0
IEBACiAgKiBUZXN0IHdoZXRoZXIgYSBibG9jayBvZiBtZW1vcnkgaXMgYSB2YWxpZCB1c2VyIHNw
YWNlIGFkZHJlc3MuCiAgKiBSZXR1cm5zIDAgaWYgdGhlIHJhbmdlIGlzIHZhbGlkLCBub256ZXJv
IG90aGVyd2lzZS4KICAqLwotc3RhdGljIGlubGluZSBib29sIF9fY2hrX3JhbmdlX25vdF9vayh1
bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKK3N0YXRpYyBpbmxpbmUgYm9v
bCBfX2FjY2Vzc19vayh2b2lkIF9fdXNlciAqcHRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiB7CiAJ
dW5zaWduZWQgbG9uZyBsaW1pdCA9IFRBU0tfU0laRV9NQVg7CisJdW5zaWduZWQgbG9uZyBhZGRy
ID0gcHRyOwogCi0JLyoKLQkgKiBJZiB3ZSBoYXZlIHVzZWQgInNpemVvZigpIiBmb3IgdGhlIHNp
emUsCi0JICogd2Uga25vdyBpdCB3b24ndCBvdmVyZmxvdyB0aGUgbGltaXQgKGJ1dAotCSAqIGl0
IG1pZ2h0IG92ZXJmbG93IHRoZSAnYWRkcicsIHNvIGl0J3MKLQkgKiBpbXBvcnRhbnQgdG8gc3Vi
dHJhY3QgdGhlIHNpemUgZnJvbSB0aGUKLQkgKiBsaW1pdCwgbm90IGFkZCBpdCB0byB0aGUgYWRk
cmVzcykuCi0JICovCi0JaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKHNpemUpKQotCQlyZXR1cm4g
dW5saWtlbHkoYWRkciA+IGxpbWl0IC0gc2l6ZSk7Ci0KLQkvKiBBcmJpdHJhcnkgc2l6ZXM/IEJl
IGNhcmVmdWwgYWJvdXQgb3ZlcmZsb3cgKi8KLQlhZGRyICs9IHNpemU7Ci0JaWYgKHVubGlrZWx5
KGFkZHIgPCBzaXplKSkKLQkJcmV0dXJuIHRydWU7Ci0JcmV0dXJuIHVubGlrZWx5KGFkZHIgPiBs
aW1pdCk7CisJcmV0dXJuIChzaXplIDw9IGxpbWl0KSAmJiAoYWRkciA8PSAobGltaXQgLSBzaXpl
KSk7CiB9CiAKLSNkZWZpbmUgX19hY2Nlc3Nfb2soYWRkciwgc2l6ZSkJCQkJCQlcCi0oewkJCQkJ
CQkJCVwKLQlfX2Noa191c2VyX3B0cihhZGRyKTsJCQkJCQlcCi0JIV9fY2hrX3JhbmdlX25vdF9v
aygodW5zaWduZWQgbG9uZyBfX2ZvcmNlKShhZGRyKSwgc2l6ZSk7CVwKLX0pCi0KICNpZmRlZiBD
T05GSUdfREVCVUdfQVRPTUlDX1NMRUVQCiBzdGF0aWMgaW5saW5lIGJvb2wgcGFnZWZhdWx0X2Rp
c2FibGVkKHZvaWQpOwogIyBkZWZpbmUgV0FSTl9PTl9JTl9JUlEoKQlcCi0tIAoyLjI5LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
