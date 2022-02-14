Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE8E4B5677
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 17:36:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E87F824804;
	Mon, 14 Feb 2022 17:36:35 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id BE5C9211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 17:36:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85254614F3;
 Mon, 14 Feb 2022 16:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF5AC340EE;
 Mon, 14 Feb 2022 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856592;
 bh=/86KMr0jNBuJ/zqhHefOXTiqAWO1yELIA3z6g/367IQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ju2iGesCRW+FUxlTNWTSRCgy2RFCuZmRYFpVLrljojp/Ih1OBpPciIhZmM3Mzx76Y
 pq5UVjX55O0F8EXS8TaAkyYpSzYdo5XnN3HUDTfqVZjd5Sxm+EgqhUJfUY0qFQsOiM
 WPe43LcxQCw3FNNhUfT3JoeBojFKSdpgkUg8J9I/dv80iMXlTOJQyVuvr1Ic44t/BW
 sshZLtCicnOONQZDNhIZJ2ShtALDJCGKaAWUcBcXH8Jbk1posHGnpQW7HLIfAPf8T5
 5TP+rCS3n73O88MVkDoM2JLsZFfmsE0haaOo3bUAhntO+4hI+BH5xYhaxIiM5tV/MT
 +qH72eefIpddw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Feb 2022 17:34:42 +0100
Message-Id: <20220214163452.1568807-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 04/14] x86: use more conventional access_ok()
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
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
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
IDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDM4
ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXgg
YWM5NmY5YjJkNjRiLi42OTU2YTYzMjkxYjYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTE2
LDMwICsxNiwxMyBAQAogICogVGVzdCB3aGV0aGVyIGEgYmxvY2sgb2YgbWVtb3J5IGlzIGEgdmFs
aWQgdXNlciBzcGFjZSBhZGRyZXNzLgogICogUmV0dXJucyAwIGlmIHRoZSByYW5nZSBpcyB2YWxp
ZCwgbm9uemVybyBvdGhlcndpc2UuCiAgKi8KLXN0YXRpYyBpbmxpbmUgYm9vbCBfX2Noa19yYW5n
ZV9ub3Rfb2sodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVk
IGxvbmcgbGltaXQpCitzdGF0aWMgaW5saW5lIGJvb2wgX19hY2Nlc3Nfb2sodm9pZCBfX3VzZXIg
KnB0ciwgdW5zaWduZWQgbG9uZyBzaXplKQogewotCS8qCi0JICogSWYgd2UgaGF2ZSB1c2VkICJz
aXplb2YoKSIgZm9yIHRoZSBzaXplLAotCSAqIHdlIGtub3cgaXQgd29uJ3Qgb3ZlcmZsb3cgdGhl
IGxpbWl0IChidXQKLQkgKiBpdCBtaWdodCBvdmVyZmxvdyB0aGUgJ2FkZHInLCBzbyBpdCdzCi0J
ICogaW1wb3J0YW50IHRvIHN1YnRyYWN0IHRoZSBzaXplIGZyb20gdGhlCi0JICogbGltaXQsIG5v
dCBhZGQgaXQgdG8gdGhlIGFkZHJlc3MpLgotCSAqLwotCWlmIChfX2J1aWx0aW5fY29uc3RhbnRf
cChzaXplKSkKLQkJcmV0dXJuIHVubGlrZWx5KGFkZHIgPiBsaW1pdCAtIHNpemUpOwotCi0JLyog
QXJiaXRyYXJ5IHNpemVzPyBCZSBjYXJlZnVsIGFib3V0IG92ZXJmbG93ICovCi0JYWRkciArPSBz
aXplOwotCWlmICh1bmxpa2VseShhZGRyIDwgc2l6ZSkpCi0JCXJldHVybiB0cnVlOwotCXJldHVy
biB1bmxpa2VseShhZGRyID4gbGltaXQpOwotfQorCXVuc2lnbmVkIGxvbmcgbGltaXQgPSBUQVNL
X1NJWkVfTUFYOworCXVuc2lnbmVkIGxvbmcgYWRkciA9IHB0cjsKIAotI2RlZmluZSBfX3Jhbmdl
X25vdF9vayhhZGRyLCBzaXplLCBsaW1pdCkJCQkJXAotKHsJCQkJCQkJCQlcCi0JX19jaGtfdXNl
cl9wdHIoYWRkcik7CQkJCQkJXAotCV9fY2hrX3JhbmdlX25vdF9vaygodW5zaWduZWQgbG9uZyBf
X2ZvcmNlKShhZGRyKSwgc2l6ZSwgbGltaXQpOyBcCi19KQorCXJldHVybiAoc2l6ZSA8PSBsaW1p
dCkgJiYgKGFkZHIgPD0gKGxpbWl0IC0gc2l6ZSkpOworfQogCiAjaWZkZWYgQ09ORklHX0RFQlVH
X0FUT01JQ19TTEVFUAogc3RhdGljIGlubGluZSBib29sIHBhZ2VmYXVsdF9kaXNhYmxlZCh2b2lk
KTsKQEAgLTY2LDEyICs0OSwxNSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcGFnZWZhdWx0X2Rpc2Fi
bGVkKHZvaWQpOwogICogUmV0dXJuOiB0cnVlIChub256ZXJvKSBpZiB0aGUgbWVtb3J5IGJsb2Nr
IG1heSBiZSB2YWxpZCwgZmFsc2UgKHplcm8pCiAgKiBpZiBpdCBpcyBkZWZpbml0ZWx5IGludmFs
aWQuCiAgKi8KLSNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNpemUpCQkJCQlcCi0oewkJCQkJCQkJ
CVwKLQlXQVJOX09OX0lOX0lSUSgpOwkJCQkJCVwKLQlsaWtlbHkoIV9fcmFuZ2Vfbm90X29rKGFk
ZHIsIHNpemUsIFRBU0tfU0laRV9NQVgpKTsJCVwKKyNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNp
emUpCQlcCisoewkJCQkJXAorCVdBUk5fT05fSU5fSVJRKCk7CQlcCisJbGlrZWx5KF9fYWNjZXNz
X29rKGFkZHIsIHNpemUpKTtcCiB9KQogCisjZGVmaW5lIF9fcmFuZ2Vfbm90X29rKGFkZHIsIHNp
emUsIGxpbWl0KQkoIV9fYWNjZXNzX29rKGFkZHIsIHNpemUpKQorI2RlZmluZSBfX2Noa19yYW5n
ZV9ub3Rfb2soYWRkciwgc2l6ZSwgbGltaXQpCSghX19hY2Nlc3Nfb2soKHZvaWQgX191c2VyICop
YWRkciwgc2l6ZSkpCisKIGV4dGVybiBpbnQgX19nZXRfdXNlcl8xKHZvaWQpOwogZXh0ZXJuIGlu
dCBfX2dldF91c2VyXzIodm9pZCk7CiBleHRlcm4gaW50IF9fZ2V0X3VzZXJfNCh2b2lkKTsKLS0g
CjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
