Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F02E334B0D1
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:03 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2FD3C212AF;
	Fri, 26 Mar 2021 21:52:00 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id E57BE21098
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:52 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWR0RJyz9v039;
 Fri, 26 Mar 2021 14:44:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9W4f4_9sN-cN; Fri, 26 Mar 2021 14:44:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWQ6dmTz9tyyV;
 Fri, 26 Mar 2021 14:44:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 578328B8C7;
 Fri, 26 Mar 2021 14:44:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5xMrUPFYBqHf; Fri, 26 Mar 2021 14:44:51 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC4E08B8C9;
 Fri, 26 Mar 2021 14:44:50 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 681D967611; Fri, 26 Mar 2021 13:44:51 +0000 (UTC)
Message-Id: <3d5d4281f264ec634f17252b6fef558ca4334243.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:51 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 04/17] powerpc: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 microblaze <monstr@monstr.eu>, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyB1cGRhdGVzIHRoZSBwb3dlcnBjIGNvZGUgdG8gdXNlIHRoZSBuZXcgY21kbGluZSBidWls
ZGluZyBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4KLS0tCiBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAg
IHwgMzcgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Bvd2VycGMva2Vy
bmVsL3Byb21faW5pdC5jIHwgMTcgKysrKysrKy0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwppbmRleCAzODZhZTEyZDg1MjMuLjUxODFl
ZmQ3NzU3ZSAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKKysrIGIvYXJjaC9wb3dl
cnBjL0tjb25maWcKQEAgLTE2Nyw2ICsxNjcsNyBAQCBjb25maWcgUFBDCiAJc2VsZWN0IEVEQUNf
U1VQUE9SVAogCXNlbGVjdCBHRU5FUklDX0FUT01JQzY0CQkJaWYgUFBDMzIKIAlzZWxlY3QgR0VO
RVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QJaWYgU01QCisJc2VsZWN0IEdFTkVSSUNfQ01ETElO
RQogCXNlbGVjdCBHRU5FUklDX0NNT1NfVVBEQVRFCiAJc2VsZWN0IEdFTkVSSUNfQ1BVX0FVVE9Q
Uk9CRQogCXNlbGVjdCBHRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVMJaWYgUFBDX0JBUlJJRVJf
Tk9TUEVDCkBAIC04ODYsNDIgKzg4Nyw2IEBAIGNvbmZpZyBQUENfREVOT1JNQUxJU0FUSU9OCiAJ
ICBBZGQgc3VwcG9ydCBmb3IgaGFuZGxpbmcgZGVub3JtYWxpc2F0aW9uIG9mIHNpbmdsZSBwcmVj
aXNpb24KIAkgIHZhbHVlcy4gIFVzZWZ1bCBmb3IgYmFyZSBtZXRhbCBvbmx5LiAgSWYgdW5zdXJl
IHNheSBZIGhlcmUuCiAKLWNvbmZpZyBDTURMSU5FCi0Jc3RyaW5nICJJbml0aWFsIGtlcm5lbCBj
b21tYW5kIHN0cmluZyIKLQlkZWZhdWx0ICIiCi0JaGVscAotCSAgT24gc29tZSBwbGF0Zm9ybXMs
IHRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgZm9yIHRoZSBib290IGxvYWRlciB0bwotCSAgcGFz
cyBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4gRm9yIHRoZXNlIHBsYXRmb3JtcywgeW91IGNhbiBz
dXBwbHkKLQkgIHNvbWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBlbnRl
cmluZyB0aGVtIGhlcmUuICBJbgotCSAgbW9zdCBjYXNlcyB5b3Ugd2lsbCBuZWVkIHRvIHNwZWNp
ZnkgdGhlIHJvb3QgZGV2aWNlIGhlcmUuCi0KLWNob2ljZQotCXByb21wdCAiS2VybmVsIGNvbW1h
bmQgbGluZSB0eXBlIiBpZiBDTURMSU5FICE9ICIiCi0JZGVmYXVsdCBDTURMSU5FX0ZST01fQk9P
VExPQURFUgotCi1jb25maWcgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKLQlib29sICJVc2UgYm9v
dGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSIKLQloZWxwCi0JICBVc2VzIHRo
ZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBwYXNzZWQgYnkgdGhlIGJvb3QgbG9hZGVyLiBJZgotCSAg
dGhlIGJvb3QgbG9hZGVyIGRvZXNuJ3QgcHJvdmlkZSBhbnksIHRoZSBkZWZhdWx0IGtlcm5lbCBj
b21tYW5kCi0JICBzdHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJlIHVzZWQuCi0KLWNv
bmZpZyBDTURMSU5FX0VYVEVORAotCWJvb2wgIkV4dGVuZCBib290bG9hZGVyIGtlcm5lbCBhcmd1
bWVudHMiCi0JaGVscAotCSAgVGhlIGNvbW1hbmQtbGluZSBhcmd1bWVudHMgcHJvdmlkZWQgYnkg
dGhlIGJvb3QgbG9hZGVyIHdpbGwgYmUKLQkgIGFwcGVuZGVkIHRvIHRoZSBkZWZhdWx0IGtlcm5l
bCBjb21tYW5kIHN0cmluZy4KLQotY29uZmlnIENNRExJTkVfRk9SQ0UKLQlib29sICJBbHdheXMg
dXNlIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKLQloZWxwCi0JICBBbHdheXMg
dXNlIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZywgZXZlbiBpZiB0aGUgYm9vdAot
CSAgbG9hZGVyIHBhc3NlcyBvdGhlciBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4KLQkgIFRoaXMg
aXMgdXNlZnVsIGlmIHlvdSBjYW5ub3Qgb3IgZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhlCi0JICBj
b21tYW5kLWxpbmUgb3B0aW9ucyB5b3VyIGJvb3QgbG9hZGVyIHBhc3NlcyB0byB0aGUga2VybmVs
LgotCi1lbmRjaG9pY2UKLQogY29uZmlnIEVYVFJBX1RBUkdFVFMKIAlzdHJpbmcgIkFkZGl0aW9u
YWwgZGVmYXVsdCBpbWFnZSB0eXBlcyIKIAloZWxwCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
a2VybmVsL3Byb21faW5pdC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYwppbmRl
eCBjY2Y3N2I5ODVjOGYuLjE1N2Q1MDhlOWZlOSAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2tl
cm5lbC9wcm9tX2luaXQuYworKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdC5jCkBA
IC0xNTIsNyArMTUyLDcgQEAgc3RhdGljIHN0cnVjdCBwcm9tX3QgX19wcm9tYnNzIHByb207CiBz
dGF0aWMgdW5zaWduZWQgbG9uZyBfX3Byb21ic3MgcHJvbV9lbnRyeTsKIAogc3RhdGljIGNoYXIg
X19wcm9tYnNzIG9mX3N0ZG91dF9kZXZpY2VbMjU2XTsKLXN0YXRpYyBjaGFyIF9fcHJvbWJzcyBw
cm9tX3NjcmF0Y2hbMjU2XTsKK3N0YXRpYyBjaGFyIF9fcHJvbWJzcyBwcm9tX3NjcmF0Y2hbQ09N
TUFORF9MSU5FX1NJWkVdOwogCiBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX3Byb21ic3MgZHRfaGVh
ZGVyX3N0YXJ0Owogc3RhdGljIHVuc2lnbmVkIGxvbmcgX19wcm9tYnNzIGR0X3N0cnVjdF9zdGFy
dCwgZHRfc3RydWN0X2VuZDsKQEAgLTc2NSwyMiArNzY1LDE5IEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIHByb21fbWVtcGFyc2UoY29uc3QgY2hhciAqcHRyLCBjb25zdCBjaGFyICoqcmV0cHRyKQog
ICogRWFybHkgcGFyc2luZyBvZiB0aGUgY29tbWFuZCBsaW5lIHBhc3NlZCB0byB0aGUga2VybmVs
LCB1c2VkIGZvcgogICogIm1lbT14IiBhbmQgdGhlIG9wdGlvbnMgdGhhdCBhZmZlY3QgdGhlIGlv
bW11CiAgKi8KKyNkZWZpbmUgY21kbGluZV9zdHJsY2F0IHByb21fc3RybGNhdAorI2luY2x1ZGUg
PGxpbnV4L2NtZGxpbmUuaD4KKwogc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X2NtZGxpbmVfcGFy
c2Uodm9pZCkKIHsKIAljb25zdCBjaGFyICpvcHQ7Ci0KLQljaGFyICpwOwogCWludCBsID0gMDsK
IAotCXByb21fY21kX2xpbmVbMF0gPSAwOwotCXAgPSBwcm9tX2NtZF9saW5lOwotCiAJaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19DTURMSU5FX0ZPUkNFKSAmJiAobG9uZylwcm9tLmNob3NlbiA+IDAp
Ci0JCWwgPSBwcm9tX2dldHByb3AocHJvbS5jaG9zZW4sICJib290YXJncyIsIHAsIENPTU1BTkRf
TElORV9TSVpFLTEpOworCQlsID0gcHJvbV9nZXRwcm9wKHByb20uY2hvc2VuLCAiYm9vdGFyZ3Mi
LCBwcm9tX3NjcmF0Y2gsCisJCQkJIENPTU1BTkRfTElORV9TSVpFIC0gMSk7CiAKLQlpZiAoSVNf
RU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpIHx8IGwgPD0gMCB8fCBwWzBdID09ICdcMCcp
Ci0JCXByb21fc3RybGNhdChwcm9tX2NtZF9saW5lLCAiICIgQ09ORklHX0NNRExJTkUsCi0JCQkg
ICAgIHNpemVvZihwcm9tX2NtZF9saW5lKSk7CisJX19jbWRsaW5lX2J1aWxkKHByb21fY21kX2xp
bmUsIGwgPiAwID8gcHJvbV9zY3JhdGNoIDogTlVMTCwgc2l6ZW9mKHByb21fc2NyYXRjaCkpOwog
CiAJcHJvbV9wcmludGYoImNvbW1hbmQgbGluZTogJXNcbiIsIHByb21fY21kX2xpbmUpOwogCi0t
IAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
