Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 91F1A4B8934
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:18:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 76AD92483B;
	Wed, 16 Feb 2022 14:18:40 +0100 (CET)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mail.librecores.org (Postfix) with ESMTPS id 5105324822
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:18:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5905FCE26F3;
 Wed, 16 Feb 2022 13:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9E1C340F0;
 Wed, 16 Feb 2022 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017514;
 bh=HK+tVapaV31snBn8v5Q1USmrkGxBnfuKp+8RGzmZzjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bsuYzbxkAoiYAmxDbgE0FResaoqYp9lL2WRBFz6fdmL0V8tZZV8xaWKFJSo/3mJYx
 WdQCiIu/zsrVqbxz09YsCZ9c64A7VZw0Vdg9LFehAVDOqZCFj+XOgd0VRFqvGKGYoO
 +KodvujkWwd2KS2nWL6OlgsdBaGtV5H4BiRuPDazGZlooWEAIcbJSmY1TqXF9NJZbj
 mRzzQ8X9nW3OGRlGtXQqj1EE+it/xVoinYPLds9k81saknC5jOmycuYH/4EUfXiqIz
 PW0jEYAhflNTNWI39oCemJzad46eq07obLNFXbCilj6TnxpIOrAQV7vcvZgB/r5sRC
 yEaD2i/JrlYBA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:31 +0100
Message-Id: <20220216131332.1489939-18-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 17/18] ia64: remove CONFIG_SET_FS support
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmlhNjQgb25seSB1c2VzIHNldF9m
cygpIGluIG9uZSBmaWxlIHRvIGhhbmRsZSB1bmFsaWduZWQgYWNjZXNzIGZvcgpib3RoIHVzZXIg
c3BhY2UgYW5kIGtlcm5lbCBpbnN0cnVjdGlvbnMuIFJld3JpdGUgdGhpcyB0byBleHBsaWNpdGx5
CnBhc3MgYXJvdW5kIGEgZmxhZyBhYm91dCB3aGljaCBvbmUgaXQgaXMgYW5kIGRyb3AgdGhlIGZl
YXR1cmUgZnJvbQp0aGUgYXJjaGl0ZWN0dXJlLgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4KLS0tCiBhcmNoL2lhNjQvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICB8ICAxIC0KIGFyY2gvaWE2NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgIHwgIDQgLS0KIGFy
Y2gvaWE2NC9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgIDIgLQogYXJjaC9pYTY0L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaCAgICAgfCAyMSArKystLS0tLS0tCiBhcmNoL2lhNjQva2VybmVsL3Vu
YWxpZ25lZC5jICAgICAgICB8IDYwICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiA1IGZp
bGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvaWE2NC9LY29uZmlnIGIvYXJjaC9pYTY0L0tjb25maWcKaW5kZXggYTdlMDE1NzNh
YmQ4Li42YjZhMzViM2Q5NTkgMTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9LY29uZmlnCisrKyBiL2Fy
Y2gvaWE2NC9LY29uZmlnCkBAIC02MSw3ICs2MSw2IEBAIGNvbmZpZyBJQTY0CiAJc2VsZWN0IE5F
RURfU0dfRE1BX0xFTkdUSAogCXNlbGVjdCBOVU1BIGlmICFGTEFUTUVNCiAJc2VsZWN0IFBDSV9N
U0lfQVJDSF9GQUxMQkFDS1MgaWYgUENJX01TSQotCXNlbGVjdCBTRVRfRlMKIAlzZWxlY3QgWk9O
RV9ETUEzMgogCWRlZmF1bHQgeQogCWhlbHAKZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRl
eCA0NTM2NWMyZWY1OTguLjdjYmNlMjkwZjRlNSAxMDA2NDQKLS0tIGEvYXJjaC9pYTY0L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oCisrKyBiL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aApAQCAtMjQzLDEwICsyNDMsNiBAQCBERUNMQVJFX1BFUl9DUFUoc3RydWN0IGNwdWluZm9faWE2
NCwgaWE2NF9jcHVfaW5mbyk7CiAKIGV4dGVybiB2b2lkIHByaW50X2NwdV9pbmZvIChzdHJ1Y3Qg
Y3B1aW5mb19pYTY0ICopOwogCi10eXBlZGVmIHN0cnVjdCB7Ci0JdW5zaWduZWQgbG9uZyBzZWc7
Ci19IG1tX3NlZ21lbnRfdDsKLQogI2RlZmluZSBTRVRfVU5BTElHTl9DVEwodGFzayx2YWx1ZSkJ
CQkJCQkJCVwKICh7CQkJCQkJCQkJCQkJXAogCSh0YXNrKS0+dGhyZWFkLmZsYWdzID0gKCgodGFz
ayktPnRocmVhZC5mbGFncyAmIH5JQTY0X1RIUkVBRF9VQUNfTUFTSykJCQlcCmRpZmYgLS1naXQg
YS9hcmNoL2lhNjQvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCBiL2FyY2gvaWE2NC9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oCmluZGV4IDUxZDIwY2IzNzcwNi4uZWY4MzQ5M2U2Nzc4IDEwMDY0
NAotLS0gYS9hcmNoL2lhNjQvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysgYi9hcmNoL2lh
NjQvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaApAQCAtMjcsNyArMjcsNiBAQCBzdHJ1Y3QgdGhy
ZWFkX2luZm8gewogCV9fdTMyIGNwdTsJCQkvKiBjdXJyZW50IENQVSAqLwogCV9fdTMyIGxhc3Rf
Y3B1OwkJCS8qIExhc3QgQ1BVIHRocmVhZCByYW4gb24gKi8KIAlfX3UzMiBzdGF0dXM7CQkJLyog
VGhyZWFkIHN5bmNocm9ub3VzIGZsYWdzICovCi0JbW1fc2VnbWVudF90IGFkZHJfbGltaXQ7CS8q
IHVzZXItbGV2ZWwgYWRkcmVzcyBzcGFjZSBsaW1pdCAqLwogCWludCBwcmVlbXB0X2NvdW50OwkJ
LyogMD1wcmVtcHRhYmxlLCA8MD1CVUc7IHdpbGwgYWxzbyBzZXJ2ZSBhcyBiaC1jb3VudGVyICov
CiAjaWZkZWYgQ09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfTkFUSVZFCiAJX191NjQgdXRpbWU7
CkBAIC00OCw3ICs0Nyw2IEBAIHN0cnVjdCB0aHJlYWRfaW5mbyB7CiAJLnRhc2sJCT0gJnRzaywJ
CQlcCiAJLmZsYWdzCQk9IDAsCQkJXAogCS5jcHUJCT0gMCwJCQlcCi0JLmFkZHJfbGltaXQJPSBL
RVJORUxfRFMsCQlcCiAJLnByZWVtcHRfY291bnQJPSBJTklUX1BSRUVNUFRfQ09VTlQsCVwKIH0K
IApkaWZmIC0tZ2l0IGEvYXJjaC9pYTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvaWE2
NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXggZTI0MmEzY2MxMzMwLi42MGFkYWRlYjNlOWUg
MTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJjaC9p
YTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtNDIsMjYgKzQyLDE3IEBACiAjaW5jbHVkZSA8
YXNtL2V4dGFibGUuaD4KIAogLyoKLSAqIEZvciBoaXN0b3JpY2FsIHJlYXNvbnMsIHRoZSBmb2xs
b3dpbmcgbWFjcm9zIGFyZSBncm9zc2x5IG1pc25hbWVkOgotICovCi0jZGVmaW5lIEtFUk5FTF9E
UwkoKG1tX3NlZ21lbnRfdCkgeyB+MFVMIH0pCQkvKiBjZi4gYWNjZXNzX29rKCkgKi8KLSNkZWZp
bmUgVVNFUl9EUwkJKChtbV9zZWdtZW50X3QpIHsgVEFTS19TSVpFLTEgfSkJLyogY2YuIGFjY2Vz
c19vaygpICovCi0KLSNkZWZpbmUgZ2V0X2ZzKCkgIChjdXJyZW50X3RocmVhZF9pbmZvKCktPmFk
ZHJfbGltaXQpCi0jZGVmaW5lIHNldF9mcyh4KSAoY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRy
X2xpbWl0ID0gKHgpKQotCi0vKgotICogV2hlbiBhY2Nlc3NpbmcgdXNlciBtZW1vcnksIHdlIG5l
ZWQgdG8gbWFrZSBzdXJlIHRoZSBlbnRpcmUgYXJlYSByZWFsbHkgaXMgaW4KLSAqIHVzZXItbGV2
ZWwgc3BhY2UuICBJbiBvcmRlciB0byBkbyB0aGlzIGVmZmljaWVudGx5LCB3ZSBtYWtlIHN1cmUg
dGhhdCB0aGUgcGFnZSBhdAotICogYWRkcmVzcyBUQVNLX1NJWkUgaXMgbmV2ZXIgdmFsaWQuICBX
ZSBhbHNvIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGFkZHJlc3MgZG9lc24ndAorICogV2hl
biBhY2Nlc3NpbmcgdXNlciBtZW1vcnksIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoZSBlbnRpcmUg
YXJlYSByZWFsbHkgaXMKKyAqIGluIHVzZXItbGV2ZWwgc3BhY2UuICBXZSBhbHNvIG5lZWQgdG8g
bWFrZSBzdXJlIHRoYXQgdGhlIGFkZHJlc3MgZG9lc24ndAogICogcG9pbnQgaW5zaWRlIHRoZSB2
aXJ0dWFsbHkgbWFwcGVkIGxpbmVhciBwYWdlIHRhYmxlLgogICovCiBzdGF0aWMgaW5saW5lIGlu
dCBfX2FjY2Vzc19vayhjb25zdCB2b2lkIF9fdXNlciAqcCwgdW5zaWduZWQgbG9uZyBzaXplKQog
eworCXVuc2lnbmVkIGxvbmcgbGltaXQgPSBUQVNLX1NJWkU7CiAJdW5zaWduZWQgbG9uZyBhZGRy
ID0gKHVuc2lnbmVkIGxvbmcpcDsKLQl1bnNpZ25lZCBsb25nIHNlZyA9IGdldF9mcygpLnNlZzsK
LQlyZXR1cm4gbGlrZWx5KGFkZHIgPD0gc2VnKSAmJgotCSAoc2VnID09IEtFUk5FTF9EUy5zZWcg
fHwgbGlrZWx5KFJFR0lPTl9PRkZTRVQoYWRkcikgPCBSR05fTUFQX0xJTUlUKSk7CisKKwlyZXR1
cm4gbGlrZWx5KChzaXplIDw9IGxpbWl0KSAmJiAoYWRkciA8PSAobGltaXQgLSBzaXplKSkgJiYK
KwkJIGxpa2VseShSRUdJT05fT0ZGU0VUKGFkZHIpIDwgUkdOX01BUF9MSU1JVCkpOwogfQogI2Rl
ZmluZSBfX2FjY2Vzc19vayBfX2FjY2Vzc19vawogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2FjY2Vz
c19vay5oPgpkaWZmIC0tZ2l0IGEvYXJjaC9pYTY0L2tlcm5lbC91bmFsaWduZWQuYyBiL2FyY2gv
aWE2NC9rZXJuZWwvdW5hbGlnbmVkLmMKaW5kZXggNmMxYTg5NTFkZmJiLi4wYWNiNWEwY2Q3YWIg
MTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9rZXJuZWwvdW5hbGlnbmVkLmMKKysrIGIvYXJjaC9pYTY0
L2tlcm5lbC91bmFsaWduZWQuYwpAQCAtNzQ5LDkgKzc0OSwyNSBAQCBlbXVsYXRlX2xvYWRfdXBk
YXRlcyAodXBkYXRlX3QgdHlwZSwgbG9hZF9zdG9yZV90IGxkLCBzdHJ1Y3QgcHRfcmVncyAqcmVn
cywgdW5zaQogCX0KIH0KIAorc3RhdGljIGludCBlbXVsYXRlX3N0b3JlKHVuc2lnbmVkIGxvbmcg
aWZhLCB2b2lkICp2YWwsIGludCBsZW4sIGJvb2wga2VybmVsX21vZGUpCit7CisJaWYgKGtlcm5l
bF9tb2RlKQorCQlyZXR1cm4gY29weV90b19rZXJuZWxfbm9mYXVsdCgodm9pZCAqKWlmYSwgdmFs
LCBsZW4pOworCisJcmV0dXJuIGNvcHlfdG9fdXNlcigodm9pZCBfX3VzZXIgKilpZmEsIHZhbCwg
bGVuKTsKK30KKworc3RhdGljIGludCBlbXVsYXRlX2xvYWQodm9pZCAqdmFsLCB1bnNpZ25lZCBs
b25nIGlmYSwgaW50IGxlbiwgYm9vbCBrZXJuZWxfbW9kZSkKK3sKKwlpZiAoa2VybmVsX21vZGUp
CisJICAgICAgIHJldHVybiBjb3B5X2Zyb21fa2VybmVsX25vZmF1bHQodmFsLCAodm9pZCAqKWlm
YSwgbGVuKTsKKworCXJldHVybiBjb3B5X2Zyb21fdXNlcih2YWwsICh2b2lkIF9fdXNlciAqKWlm
YSwgbGVuKTsKK30KIAogc3RhdGljIGludAotZW11bGF0ZV9sb2FkX2ludCAodW5zaWduZWQgbG9u
ZyBpZmEsIGxvYWRfc3RvcmVfdCBsZCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCitlbXVsYXRlX2xv
YWRfaW50ICh1bnNpZ25lZCBsb25nIGlmYSwgbG9hZF9zdG9yZV90IGxkLCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncywKKwkJICBib29sIGtlcm5lbF9tb2RlKQogewogCXVuc2lnbmVkIGludCBsZW4gPSAx
IDw8IGxkLng2X3N6OwogCXVuc2lnbmVkIGxvbmcgdmFsID0gMDsKQEAgLTc3NCw3ICs3OTAsNyBA
QCBlbXVsYXRlX2xvYWRfaW50ICh1bnNpZ25lZCBsb25nIGlmYSwgbG9hZF9zdG9yZV90IGxkLCBz
dHJ1Y3QgcHRfcmVncyAqcmVncykKIAkJcmV0dXJuIC0xOwogCX0KIAkvKiB0aGlzIGFzc3VtZXMg
bGl0dGxlLWVuZGlhbiBieXRlLW9yZGVyOiAqLwotCWlmIChjb3B5X2Zyb21fdXNlcigmdmFsLCAo
dm9pZCBfX3VzZXIgKikgaWZhLCBsZW4pKQorCWlmIChlbXVsYXRlX2xvYWQoJnZhbCwgaWZhLCBs
ZW4sIGtlcm5lbF9tb2RlKSkKIAkJcmV0dXJuIC0xOwogCXNldHJlZyhsZC5yMSwgdmFsLCAwLCBy
ZWdzKTsKIApAQCAtODcyLDcgKzg4OCw4IEBAIGVtdWxhdGVfbG9hZF9pbnQgKHVuc2lnbmVkIGxv
bmcgaWZhLCBsb2FkX3N0b3JlX3QgbGQsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQogfQogCiBzdGF0
aWMgaW50Ci1lbXVsYXRlX3N0b3JlX2ludCAodW5zaWduZWQgbG9uZyBpZmEsIGxvYWRfc3RvcmVf
dCBsZCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCitlbXVsYXRlX3N0b3JlX2ludCAodW5zaWduZWQg
bG9uZyBpZmEsIGxvYWRfc3RvcmVfdCBsZCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCisJCSAgIGJv
b2wga2VybmVsX21vZGUpCiB7CiAJdW5zaWduZWQgbG9uZyByMjsKIAl1bnNpZ25lZCBpbnQgbGVu
ID0gMSA8PCBsZC54Nl9zejsKQEAgLTkwMSw3ICs5MTgsNyBAQCBlbXVsYXRlX3N0b3JlX2ludCAo
dW5zaWduZWQgbG9uZyBpZmEsIGxvYWRfc3RvcmVfdCBsZCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
CiAJfQogCiAJLyogdGhpcyBhc3N1bWVzIGxpdHRsZS1lbmRpYW4gYnl0ZS1vcmRlcjogKi8KLQlp
ZiAoY29weV90b191c2VyKCh2b2lkIF9fdXNlciAqKSBpZmEsICZyMiwgbGVuKSkKKwlpZiAoZW11
bGF0ZV9zdG9yZShpZmEsICZyMiwgbGVuLCBrZXJuZWxfbW9kZSkpCiAJCXJldHVybiAtMTsKIAog
CS8qCkBAIC0xMDIxLDcgKzEwMzgsNyBAQCBmbG9hdDJtZW1fZG91YmxlIChzdHJ1Y3QgaWE2NF9m
cHJlZyAqaW5pdCwgc3RydWN0IGlhNjRfZnByZWcgKmZpbmFsKQogfQogCiBzdGF0aWMgaW50Ci1l
bXVsYXRlX2xvYWRfZmxvYXRwYWlyICh1bnNpZ25lZCBsb25nIGlmYSwgbG9hZF9zdG9yZV90IGxk
LCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK2VtdWxhdGVfbG9hZF9mbG9hdHBhaXIgKHVuc2lnbmVk
IGxvbmcgaWZhLCBsb2FkX3N0b3JlX3QgbGQsIHN0cnVjdCBwdF9yZWdzICpyZWdzLCBib29sIGtl
cm5lbF9tb2RlKQogewogCXN0cnVjdCBpYTY0X2ZwcmVnIGZwcl9pbml0WzJdOwogCXN0cnVjdCBp
YTY0X2ZwcmVnIGZwcl9maW5hbFsyXTsKQEAgLTEwNTAsOCArMTA2Nyw4IEBAIGVtdWxhdGVfbG9h
ZF9mbG9hdHBhaXIgKHVuc2lnbmVkIGxvbmcgaWZhLCBsb2FkX3N0b3JlX3QgbGQsIHN0cnVjdCBw
dF9yZWdzICpyZWdzCiAJCSAqIFRoaXMgYXNzdW1lcyBsaXR0bGUtZW5kaWFuIGJ5dGUtb3JkZXIu
ICBOb3RlIHRoYXQgdGhlcmUgaXMgbm8gImxkZnBlIgogCQkgKiBpbnN0cnVjdGlvbjoKIAkJICov
Ci0JCWlmIChjb3B5X2Zyb21fdXNlcigmZnByX2luaXRbMF0sICh2b2lkIF9fdXNlciAqKSBpZmEs
IGxlbikKLQkJICAgIHx8IGNvcHlfZnJvbV91c2VyKCZmcHJfaW5pdFsxXSwgKHZvaWQgX191c2Vy
ICopIChpZmEgKyBsZW4pLCBsZW4pKQorCQlpZiAoZW11bGF0ZV9sb2FkKCZmcHJfaW5pdFswXSwg
aWZhLCBsZW4sIGtlcm5lbF9tb2RlKQorCQkgICAgfHwgZW11bGF0ZV9sb2FkKCZmcHJfaW5pdFsx
XSwgKGlmYSArIGxlbiksIGxlbiwga2VybmVsX21vZGUpKQogCQkJcmV0dXJuIC0xOwogCiAJCURQ
UklOVCgibGQucjE9JWQgbGQuaW1tPSVkIHg2X3N6PSVkXG4iLCBsZC5yMSwgbGQuaW1tLCBsZC54
Nl9zeik7CkBAIC0xMTI2LDcgKzExNDMsOCBAQCBlbXVsYXRlX2xvYWRfZmxvYXRwYWlyICh1bnNp
Z25lZCBsb25nIGlmYSwgbG9hZF9zdG9yZV90IGxkLCBzdHJ1Y3QgcHRfcmVncyAqcmVncwogCiAK
IHN0YXRpYyBpbnQKLWVtdWxhdGVfbG9hZF9mbG9hdCAodW5zaWduZWQgbG9uZyBpZmEsIGxvYWRf
c3RvcmVfdCBsZCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCitlbXVsYXRlX2xvYWRfZmxvYXQgKHVu
c2lnbmVkIGxvbmcgaWZhLCBsb2FkX3N0b3JlX3QgbGQsIHN0cnVjdCBwdF9yZWdzICpyZWdzLAor
CSAgICAgICAgICAgIGJvb2wga2VybmVsX21vZGUpCiB7CiAJc3RydWN0IGlhNjRfZnByZWcgZnBy
X2luaXQ7CiAJc3RydWN0IGlhNjRfZnByZWcgZnByX2ZpbmFsOwpAQCAtMTE1Miw3ICsxMTcwLDcg
QEAgZW11bGF0ZV9sb2FkX2Zsb2F0ICh1bnNpZ25lZCBsb25nIGlmYSwgbG9hZF9zdG9yZV90IGxk
LCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAkgKiBTZWUgY29tbWVudHMgaW4gbGRYIGZvciBkZXNj
cmlwdGlvbnMgb24gaG93IHRoZSB2YXJpb3VzIGxvYWRzIGFyZSBoYW5kbGVkLgogCSAqLwogCWlm
IChsZC54Nl9vcCAhPSAweDIpIHsKLQkJaWYgKGNvcHlfZnJvbV91c2VyKCZmcHJfaW5pdCwgKHZv
aWQgX191c2VyICopIGlmYSwgbGVuKSkKKwkJaWYgKGVtdWxhdGVfbG9hZCgmZnByX2luaXQsIGlm
YSwgbGVuLCBrZXJuZWxfbW9kZSkpCiAJCQlyZXR1cm4gLTE7CiAKIAkJRFBSSU5UKCJsZC5yMT0l
ZCB4Nl9zej0lZFxuIiwgbGQucjEsIGxkLng2X3N6KTsKQEAgLTEyMDIsNyArMTIyMCw4IEBAIGVt
dWxhdGVfbG9hZF9mbG9hdCAodW5zaWduZWQgbG9uZyBpZmEsIGxvYWRfc3RvcmVfdCBsZCwgc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAogc3RhdGljIGludAotZW11bGF0ZV9zdG9yZV9mbG9hdCAo
dW5zaWduZWQgbG9uZyBpZmEsIGxvYWRfc3RvcmVfdCBsZCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
CitlbXVsYXRlX3N0b3JlX2Zsb2F0ICh1bnNpZ25lZCBsb25nIGlmYSwgbG9hZF9zdG9yZV90IGxk
LCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKKwkJICAgICBib29sIGtlcm5lbF9tb2RlKQogewogCXN0
cnVjdCBpYTY0X2ZwcmVnIGZwcl9pbml0OwogCXN0cnVjdCBpYTY0X2ZwcmVnIGZwcl9maW5hbDsK
QEAgLTEyNDQsNyArMTI2Myw3IEBAIGVtdWxhdGVfc3RvcmVfZmxvYXQgKHVuc2lnbmVkIGxvbmcg
aWZhLCBsb2FkX3N0b3JlX3QgbGQsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCUREVU1QKCJmcHJf
aW5pdCA9IiwgJmZwcl9pbml0LCBsZW4pOwogCUREVU1QKCJmcHJfZmluYWwgPSIsICZmcHJfZmlu
YWwsIGxlbik7CiAKLQlpZiAoY29weV90b191c2VyKCh2b2lkIF9fdXNlciAqKSBpZmEsICZmcHJf
ZmluYWwsIGxlbikpCisJaWYgKGVtdWxhdGVfc3RvcmUoaWZhLCAmZnByX2ZpbmFsLCBsZW4sIGtl
cm5lbF9tb2RlKSkKIAkJcmV0dXJuIC0xOwogCiAJLyoKQEAgLTEyOTUsNyArMTMxNCw2IEBAIHZv
aWQKIGlhNjRfaGFuZGxlX3VuYWxpZ25lZCAodW5zaWduZWQgbG9uZyBpZmEsIHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogewogCXN0cnVjdCBpYTY0X3BzciAqaXBzciA9IGlhNjRfcHNyKHJlZ3MpOwot
CW1tX3NlZ21lbnRfdCBvbGRfZnMgPSBnZXRfZnMoKTsKIAl1bnNpZ25lZCBsb25nIGJ1bmRsZVsy
XTsKIAl1bnNpZ25lZCBsb25nIG9wY29kZTsKIAljb25zdCBzdHJ1Y3QgZXhjZXB0aW9uX3RhYmxl
X2VudHJ5ICplaCA9IE5VTEw7CkBAIC0xMzA0LDYgKzEzMjIsNyBAQCBpYTY0X2hhbmRsZV91bmFs
aWduZWQgKHVuc2lnbmVkIGxvbmcgaWZhLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAkJbG9hZF9z
dG9yZV90IGluc247CiAJfSB1OwogCWludCByZXQgPSAtMTsKKwlib29sIGtlcm5lbF9tb2RlID0g
ZmFsc2U7CiAKIAlpZiAoaWE2NF9wc3IocmVncyktPmJlKSB7CiAJCS8qIHdlIGRvbid0IHN1cHBv
cnQgYmlnLWVuZGlhbiBhY2Nlc3NlcyAqLwpAQCAtMTM2NywxMyArMTM4NiwxMyBAQCBpYTY0X2hh
bmRsZV91bmFsaWduZWQgKHVuc2lnbmVkIGxvbmcgaWZhLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykK
IAkJCWlmICh1bmFsaWduZWRfZHVtcF9zdGFjaykKIAkJCQlkdW1wX3N0YWNrKCk7CiAJCX0KLQkJ
c2V0X2ZzKEtFUk5FTF9EUyk7CisJCWtlcm5lbF9tb2RlID0gdHJ1ZTsKIAl9CiAKIAlEUFJJTlQo
ImlpcD0lbHggaWZhPSVseCBpc3I9JWx4IChlaT0lZCwgc3A9JWQpXG4iLAogCSAgICAgICByZWdz
LT5jcl9paXAsIGlmYSwgcmVncy0+Y3JfaXBzciwgaXBzci0+cmksIGlwc3ItPml0KTsKIAotCWlm
IChfX2NvcHlfZnJvbV91c2VyKGJ1bmRsZSwgKHZvaWQgX191c2VyICopIHJlZ3MtPmNyX2lpcCwg
MTYpKQorCWlmIChlbXVsYXRlX2xvYWQoYnVuZGxlLCByZWdzLT5jcl9paXAsIDE2LCBrZXJuZWxf
bW9kZSkpCiAJCWdvdG8gZmFpbHVyZTsKIAogCS8qCkBAIC0xNDY3LDcgKzE0ODYsNyBAQCBpYTY0
X2hhbmRsZV91bmFsaWduZWQgKHVuc2lnbmVkIGxvbmcgaWZhLCBzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKIAkgICAgICBjYXNlIExEQ0NMUl9JTU1fT1A6CiAJICAgICAgY2FzZSBMRENOQ19JTU1fT1A6
CiAJICAgICAgY2FzZSBMRENDTFJBQ1FfSU1NX09QOgotCQlyZXQgPSBlbXVsYXRlX2xvYWRfaW50
KGlmYSwgdS5pbnNuLCByZWdzKTsKKwkJcmV0ID0gZW11bGF0ZV9sb2FkX2ludChpZmEsIHUuaW5z
biwgcmVncywga2VybmVsX21vZGUpOwogCQlicmVhazsKIAogCSAgICAgIGNhc2UgU1RfT1A6CkBA
IC0xNDc4LDcgKzE0OTcsNyBAQCBpYTY0X2hhbmRsZV91bmFsaWduZWQgKHVuc2lnbmVkIGxvbmcg
aWZhLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAkJZmFsbHRocm91Z2g7CiAJICAgICAgY2FzZSBT
VF9JTU1fT1A6CiAJICAgICAgY2FzZSBTVFJFTF9JTU1fT1A6Ci0JCXJldCA9IGVtdWxhdGVfc3Rv
cmVfaW50KGlmYSwgdS5pbnNuLCByZWdzKTsKKwkJcmV0ID0gZW11bGF0ZV9zdG9yZV9pbnQoaWZh
LCB1Lmluc24sIHJlZ3MsIGtlcm5lbF9tb2RlKTsKIAkJYnJlYWs7CiAKIAkgICAgICBjYXNlIExE
Rl9PUDoKQEAgLTE0ODYsMjEgKzE1MDUsMjEgQEAgaWE2NF9oYW5kbGVfdW5hbGlnbmVkICh1bnNp
Z25lZCBsb25nIGlmYSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJICAgICAgY2FzZSBMREZDQ0xS
X09QOgogCSAgICAgIGNhc2UgTERGQ05DX09QOgogCQlpZiAodS5pbnNuLngpCi0JCQlyZXQgPSBl
bXVsYXRlX2xvYWRfZmxvYXRwYWlyKGlmYSwgdS5pbnNuLCByZWdzKTsKKwkJCXJldCA9IGVtdWxh
dGVfbG9hZF9mbG9hdHBhaXIoaWZhLCB1Lmluc24sIHJlZ3MsIGtlcm5lbF9tb2RlKTsKIAkJZWxz
ZQotCQkJcmV0ID0gZW11bGF0ZV9sb2FkX2Zsb2F0KGlmYSwgdS5pbnNuLCByZWdzKTsKKwkJCXJl
dCA9IGVtdWxhdGVfbG9hZF9mbG9hdChpZmEsIHUuaW5zbiwgcmVncywga2VybmVsX21vZGUpOwog
CQlicmVhazsKIAogCSAgICAgIGNhc2UgTERGX0lNTV9PUDoKIAkgICAgICBjYXNlIExERkFfSU1N
X09QOgogCSAgICAgIGNhc2UgTERGQ0NMUl9JTU1fT1A6CiAJICAgICAgY2FzZSBMREZDTkNfSU1N
X09QOgotCQlyZXQgPSBlbXVsYXRlX2xvYWRfZmxvYXQoaWZhLCB1Lmluc24sIHJlZ3MpOworCQly
ZXQgPSBlbXVsYXRlX2xvYWRfZmxvYXQoaWZhLCB1Lmluc24sIHJlZ3MsIGtlcm5lbF9tb2RlKTsK
IAkJYnJlYWs7CiAKIAkgICAgICBjYXNlIFNURl9PUDoKIAkgICAgICBjYXNlIFNURl9JTU1fT1A6
Ci0JCXJldCA9IGVtdWxhdGVfc3RvcmVfZmxvYXQoaWZhLCB1Lmluc24sIHJlZ3MpOworCQlyZXQg
PSBlbXVsYXRlX3N0b3JlX2Zsb2F0KGlmYSwgdS5pbnNuLCByZWdzLCBrZXJuZWxfbW9kZSk7CiAJ
CWJyZWFrOwogCiAJICAgICAgZGVmYXVsdDoKQEAgLTE1MjEsNyArMTU0MCw2IEBAIGlhNjRfaGFu
ZGxlX3VuYWxpZ25lZCAodW5zaWduZWQgbG9uZyBpZmEsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQog
CiAJRFBSSU5UKCJpcHNyLT5yaT0lZCBpaXA9JWx4XG4iLCBpcHNyLT5yaSwgcmVncy0+Y3JfaWlw
KTsKICAgZG9uZToKLQlzZXRfZnMob2xkX2ZzKTsJCS8qIHJlc3RvcmUgb3JpZ2luYWwgYWRkcmVz
cyBsaW1pdCAqLwogCXJldHVybjsKIAogICBmYWlsdXJlOgotLSAKMi4yOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
