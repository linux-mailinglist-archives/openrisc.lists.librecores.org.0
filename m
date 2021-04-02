Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B4EE7353249
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 26CFA2133B;
	Sat,  3 Apr 2021 06:18:53 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 05B03212F9
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFq3PhZz9v2lx;
 Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0PaqD_YmZwDc; Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFq2Xz3z9v2ls;
 Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C7DE8BB79;
 Fri,  2 Apr 2021 17:18:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id raQsvRwETSOo; Fri,  2 Apr 2021 17:18:09 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C09DE8BB7E;
 Fri,  2 Apr 2021 17:18:08 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9D16267989; Fri,  2 Apr 2021 15:18:08 +0000 (UTC)
Message-Id: <bcc28f6552708885aecb14a7106b65afbffcc294.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:08 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 07/20] powerpc: Convert to GENERIC_CMDLINE
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
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyB1cGRhdGVzIHRoZSBwb3dlcnBjIGNvZGUgdG8gdXNlIHRoZSBuZXcgY21kbGluZSBidWls
ZGluZyBmdW5jdGlvbi4KClRoZSBjbWRsaW5lX2J1aWxkKCkgZGVmaW5lcyBhIHRlbXBvcmFyeSBz
dHJpbmcgaW4gX19pbml0ZGF0YS4KcG93ZXJwYyB1c2VzIF9fcHJvbWJzcyBpbnN0ZWFkIGF0IHRo
ZSBtb21lbnQsIHNvIHdlIG11c3QKY2FsbCBjbWRsaW5lX2J1aWxkKCkgd2l0aCBkZXN0aW5hdGlv
biBkaWZmZXJlbnQgZnJvbSB0aGUgc291cmNlCnRvIGFsbG93IEdDQyB0byBvcHRpbWlzZSB0aGUg
dGVtcG9yYXJ5IHN0cmluZyBvdXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Ci0tLQp2NDoKLSBVc2UgY21kbGluZV9idWlsZCgp
IGluc3RlYWQgb2YgX19jbWRsaW5lX2J1aWxkKCkKLSBBZGQgY21kbGluZV9zdHJsY3B5KCkgZGVm
aW5lCi0tLQogYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICB8IDM3ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYyB8
IDIxICsrKysrKysrKy0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9h
cmNoL3Bvd2VycGMvS2NvbmZpZwppbmRleCBjMTM0NGMwNTIyNmMuLjY3MjNmMTBhYzI0NiAxMDA2
NDQKLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcK
QEAgLTE2OCw2ICsxNjgsNyBAQCBjb25maWcgUFBDCiAJc2VsZWN0IEVEQUNfU1VQUE9SVAogCXNl
bGVjdCBHRU5FUklDX0FUT01JQzY0CQkJaWYgUFBDMzIKIAlzZWxlY3QgR0VORVJJQ19DTE9DS0VW
RU5UU19CUk9BRENBU1QJaWYgU01QCisJc2VsZWN0IEdFTkVSSUNfQ01ETElORQogCXNlbGVjdCBH
RU5FUklDX0NNT1NfVVBEQVRFCiAJc2VsZWN0IEdFTkVSSUNfQ1BVX0FVVE9QUk9CRQogCXNlbGVj
dCBHRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVMJaWYgUFBDX0JBUlJJRVJfTk9TUEVDCkBAIC04
ODgsNDIgKzg4OSw2IEBAIGNvbmZpZyBQUENfREVOT1JNQUxJU0FUSU9OCiAJICBBZGQgc3VwcG9y
dCBmb3IgaGFuZGxpbmcgZGVub3JtYWxpc2F0aW9uIG9mIHNpbmdsZSBwcmVjaXNpb24KIAkgIHZh
bHVlcy4gIFVzZWZ1bCBmb3IgYmFyZSBtZXRhbCBvbmx5LiAgSWYgdW5zdXJlIHNheSBZIGhlcmUu
CiAKLWNvbmZpZyBDTURMSU5FCi0Jc3RyaW5nICJJbml0aWFsIGtlcm5lbCBjb21tYW5kIHN0cmlu
ZyIKLQlkZWZhdWx0ICIiCi0JaGVscAotCSAgT24gc29tZSBwbGF0Zm9ybXMsIHRoZXJlIGlzIGN1
cnJlbnRseSBubyB3YXkgZm9yIHRoZSBib290IGxvYWRlciB0bwotCSAgcGFzcyBhcmd1bWVudHMg
dG8gdGhlIGtlcm5lbC4gRm9yIHRoZXNlIHBsYXRmb3JtcywgeW91IGNhbiBzdXBwbHkKLQkgIHNv
bWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBlbnRlcmluZyB0aGVtIGhl
cmUuICBJbgotCSAgbW9zdCBjYXNlcyB5b3Ugd2lsbCBuZWVkIHRvIHNwZWNpZnkgdGhlIHJvb3Qg
ZGV2aWNlIGhlcmUuCi0KLWNob2ljZQotCXByb21wdCAiS2VybmVsIGNvbW1hbmQgbGluZSB0eXBl
IiBpZiBDTURMSU5FICE9ICIiCi0JZGVmYXVsdCBDTURMSU5FX0ZST01fQk9PVExPQURFUgotCi1j
b25maWcgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKLQlib29sICJVc2UgYm9vdGxvYWRlciBrZXJu
ZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSIKLQloZWxwCi0JICBVc2VzIHRoZSBjb21tYW5kLWxp
bmUgb3B0aW9ucyBwYXNzZWQgYnkgdGhlIGJvb3QgbG9hZGVyLiBJZgotCSAgdGhlIGJvb3QgbG9h
ZGVyIGRvZXNuJ3QgcHJvdmlkZSBhbnksIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kCi0JICBz
dHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJlIHVzZWQuCi0KLWNvbmZpZyBDTURMSU5F
X0VYVEVORAotCWJvb2wgIkV4dGVuZCBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMiCi0JaGVs
cAotCSAgVGhlIGNvbW1hbmQtbGluZSBhcmd1bWVudHMgcHJvdmlkZWQgYnkgdGhlIGJvb3QgbG9h
ZGVyIHdpbGwgYmUKLQkgIGFwcGVuZGVkIHRvIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0
cmluZy4KLQotY29uZmlnIENNRExJTkVfRk9SQ0UKLQlib29sICJBbHdheXMgdXNlIHRoZSBkZWZh
dWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKLQloZWxwCi0JICBBbHdheXMgdXNlIHRoZSBkZWZh
dWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZywgZXZlbiBpZiB0aGUgYm9vdAotCSAgbG9hZGVyIHBh
c3NlcyBvdGhlciBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4KLQkgIFRoaXMgaXMgdXNlZnVsIGlm
IHlvdSBjYW5ub3Qgb3IgZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhlCi0JICBjb21tYW5kLWxpbmUg
b3B0aW9ucyB5b3VyIGJvb3QgbG9hZGVyIHBhc3NlcyB0byB0aGUga2VybmVsLgotCi1lbmRjaG9p
Y2UKLQogY29uZmlnIEVYVFJBX1RBUkdFVFMKIAlzdHJpbmcgIkFkZGl0aW9uYWwgZGVmYXVsdCBp
bWFnZSB0eXBlcyIKIAloZWxwCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21f
aW5pdC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYwppbmRleCAzMzMxNmVlNTUy
NjUuLjcwNGFmZDAyODIxMyAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2lu
aXQuYworKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdC5jCkBAIC0xNTIsNyArMTUy
LDcgQEAgc3RhdGljIHN0cnVjdCBwcm9tX3QgX19wcm9tYnNzIHByb207CiBzdGF0aWMgdW5zaWdu
ZWQgbG9uZyBfX3Byb21ic3MgcHJvbV9lbnRyeTsKIAogc3RhdGljIGNoYXIgX19wcm9tYnNzIG9m
X3N0ZG91dF9kZXZpY2VbMjU2XTsKLXN0YXRpYyBjaGFyIF9fcHJvbWJzcyBwcm9tX3NjcmF0Y2hb
MjU2XTsKK3N0YXRpYyBjaGFyIF9fcHJvbWJzcyBwcm9tX3NjcmF0Y2hbQ09NTUFORF9MSU5FX1NJ
WkVdOwogCiBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX3Byb21ic3MgZHRfaGVhZGVyX3N0YXJ0Owog
c3RhdGljIHVuc2lnbmVkIGxvbmcgX19wcm9tYnNzIGR0X3N0cnVjdF9zdGFydCwgZHRfc3RydWN0
X2VuZDsKQEAgLTc3MCwyNCArNzcwLDIzIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHByb21fbWVt
cGFyc2UoY29uc3QgY2hhciAqcHRyLCBjb25zdCBjaGFyICoqcmV0cHRyKQogICogRWFybHkgcGFy
c2luZyBvZiB0aGUgY29tbWFuZCBsaW5lIHBhc3NlZCB0byB0aGUga2VybmVsLCB1c2VkIGZvcgog
ICogIm1lbT14IiBhbmQgdGhlIG9wdGlvbnMgdGhhdCBhZmZlY3QgdGhlIGlvbW11CiAgKi8KKyNk
ZWZpbmUgY21kbGluZV9zdHJsY2F0IHByb21fc3RybGNhdAorI2RlZmluZSBjbWRsaW5lX3N0cmxj
cHkgcHJvbV9zdHJsY3B5CisjaW5jbHVkZSA8bGludXgvY21kbGluZS5oPgorCiBzdGF0aWMgdm9p
ZCBfX2luaXQgZWFybHlfY21kbGluZV9wYXJzZSh2b2lkKQogewogCWNvbnN0IGNoYXIgKm9wdDsK
LQotCWNoYXIgKnA7CiAJaW50IGwgPSAwOwotCi0JcHJvbV9jbWRfbGluZVswXSA9IDA7Ci0JcCA9
IHByb21fY21kX2xpbmU7CisJYm9vbCB0cnVuY2F0ZWQ7CiAKIAlpZiAoIUlTX0VOQUJMRUQoQ09O
RklHX0NNRExJTkVfRk9SQ0UpICYmIChsb25nKXByb20uY2hvc2VuID4gMCkKLQkJbCA9IHByb21f
Z2V0cHJvcChwcm9tLmNob3NlbiwgImJvb3RhcmdzIiwgcCwgQ09NTUFORF9MSU5FX1NJWkUtMSk7
CisJCWwgPSBwcm9tX2dldHByb3AocHJvbS5jaG9zZW4sICJib290YXJncyIsIHByb21fc2NyYXRj
aCwKKwkJCQkgQ09NTUFORF9MSU5FX1NJWkUgLSAxKTsKIAotCWlmIChJU19FTkFCTEVEKENPTkZJ
R19DTURMSU5FX0VYVEVORCkgfHwgbCA8PSAwIHx8IHBbMF0gPT0gJ1wwJykKLQkJcHJvbV9zdHJs
Y2F0KHByb21fY21kX2xpbmUsICIgIiBDT05GSUdfQ01ETElORSwKLQkJCSAgICAgc2l6ZW9mKHBy
b21fY21kX2xpbmUpKTsKKwl0cnVuY2F0ZWQgPSAhX19jbWRsaW5lX2J1aWxkKHByb21fY21kX2xp
bmUsIGwgPiAwID8gcHJvbV9zY3JhdGNoIDogTlVMTCk7CiAKLQlwcm9tX3ByaW50ZigiY29tbWFu
ZCBsaW5lOiAlc1xuIiwgcHJvbV9jbWRfbGluZSk7CisJcHJvbV9wcmludGYoImNvbW1hbmQgbGlu
ZTogJXMgJXNcbiIsIHByb21fY21kX2xpbmUsIHRydW5jYXRlZCA/ICJbdHJ1bmNhdGVkXSIgOiAi
Iik7CiAKICNpZmRlZiBDT05GSUdfUFBDNjQKIAlvcHQgPSBwcm9tX3N0cnN0cihwcm9tX2NtZF9s
aW5lLCAiaW9tbXU9Iik7Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
