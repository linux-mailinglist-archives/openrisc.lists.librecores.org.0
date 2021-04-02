Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 98C54353254
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 601C321354;
	Sat,  3 Apr 2021 06:19:05 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 9E97521300
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG32LP9z9v2mF;
 Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id l6-zcpN14Qua; Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG31Gsmz9v2ls;
 Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C3F28BB7D;
 Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yvlVdRkNlJmU; Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DEC28BB82;
 Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 45A3267989; Fri,  2 Apr 2021 15:18:20 +0000 (UTC)
Message-Id: <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:20 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 18/20] x86: Convert to GENERIC_CMDLINE
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

VGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4K
LS0tCiBhcmNoL3g4Ni9LY29uZmlnICAgICAgICB8IDQ1ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyB8IDE3ICsrLS0tLS0t
LS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwppbmRl
eCBhMjA2ODRkNTZiNGIuLjY2YjM4NDIyOGNhMyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvS2NvbmZp
ZworKysgYi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0xMDQsNiArMTA0LDcgQEAgY29uZmlnIFg4Ngog
CXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCiAJc2VsZWN0IEFSQ0hfVVNFX1NZTV9B
Tk5PVEFUSU9OUwogCXNlbGVjdCBBUkNIX1dBTlRfQkFUQ0hFRF9VTk1BUF9UTEJfRkxVU0gKKwlz
ZWxlY3QgQVJDSF9XQU5UX0NNRExJTkVfUFJFUEVORF9CWV9ERUZBVUxUCiAJc2VsZWN0IEFSQ0hf
V0FOVF9ERUZBVUxUX0JQRl9KSVQJaWYgWDg2XzY0CiAJc2VsZWN0IEFSQ0hfV0FOVFNfRFlOQU1J
Q19UQVNLX1NUUlVDVAogCXNlbGVjdCBBUkNIX1dBTlRfSFVHRV9QTURfU0hBUkUKQEAgLTExOCw2
ICsxMTksNyBAQCBjb25maWcgWDg2CiAJc2VsZWN0IEVEQUNfU1VQUE9SVAogCXNlbGVjdCBHRU5F
UklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVAlpZiBYODZfNjQgfHwgKFg4Nl8zMiAmJiBYODZfTE9D
QUxfQVBJQykKIAlzZWxlY3QgR0VORVJJQ19DTE9DS0VWRU5UU19NSU5fQURKVVNUCisJc2VsZWN0
IEdFTkVSSUNfQ01ETElORQogCXNlbGVjdCBHRU5FUklDX0NNT1NfVVBEQVRFCiAJc2VsZWN0IEdF
TkVSSUNfQ1BVX0FVVE9QUk9CRQogCXNlbGVjdCBHRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVMK
QEAgLTIzNTgsNDkgKzIzNjAsNiBAQCBjaG9pY2UKIAogZW5kY2hvaWNlCiAKLWNvbmZpZyBDTURM
SU5FX0JPT0wKLQlib29sICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBsaW5lIgotCWhlbHAKLQkg
IEFsbG93IGZvciBzcGVjaWZ5aW5nIGJvb3QgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwgYXQKLQkg
IGJ1aWxkIHRpbWUuICBPbiBzb21lIHN5c3RlbXMgKGUuZy4gZW1iZWRkZWQgb25lcyksIGl0IGlz
Ci0JICBuZWNlc3Nhcnkgb3IgY29udmVuaWVudCB0byBwcm92aWRlIHNvbWUgb3IgYWxsIG9mIHRo
ZQotCSAga2VybmVsIGJvb3QgYXJndW1lbnRzIHdpdGggdGhlIGtlcm5lbCBpdHNlbGYgKHRoYXQg
aXMsCi0JICB0byBub3QgcmVseSBvbiB0aGUgYm9vdCBsb2FkZXIgdG8gcHJvdmlkZSB0aGVtLikK
LQotCSAgVG8gY29tcGlsZSBjb21tYW5kIGxpbmUgYXJndW1lbnRzIGludG8gdGhlIGtlcm5lbCwK
LQkgIHNldCB0aGlzIG9wdGlvbiB0byAnWScsIHRoZW4gZmlsbCBpbiB0aGUKLQkgIGJvb3QgYXJn
dW1lbnRzIGluIENPTkZJR19DTURMSU5FLgotCi0JICBTeXN0ZW1zIHdpdGggZnVsbHkgZnVuY3Rp
b25hbCBib290IGxvYWRlcnMgKGkuZS4gbm9uLWVtYmVkZGVkKQotCSAgc2hvdWxkIGxlYXZlIHRo
aXMgb3B0aW9uIHNldCB0byAnTicuCi0KLWNvbmZpZyBDTURMSU5FCi0Jc3RyaW5nICJCdWlsdC1p
biBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKLQlkZWZh
dWx0ICIiCi0JaGVscAotCSAgRW50ZXIgYXJndW1lbnRzIGhlcmUgdGhhdCBzaG91bGQgYmUgY29t
cGlsZWQgaW50byB0aGUga2VybmVsCi0JICBpbWFnZSBhbmQgdXNlZCBhdCBib290IHRpbWUuICBJ
ZiB0aGUgYm9vdCBsb2FkZXIgcHJvdmlkZXMgYQotCSAgY29tbWFuZCBsaW5lIGF0IGJvb3QgdGlt
ZSwgaXQgaXMgYXBwZW5kZWQgdG8gdGhpcyBzdHJpbmcgdG8KLQkgIGZvcm0gdGhlIGZ1bGwga2Vy
bmVsIGNvbW1hbmQgbGluZSwgd2hlbiB0aGUgc3lzdGVtIGJvb3RzLgotCi0JICBIb3dldmVyLCB5
b3UgY2FuIHVzZSB0aGUgQ09ORklHX0NNRExJTkVfRk9SQ0Ugb3B0aW9uIHRvCi0JICBjaGFuZ2Ug
dGhpcyBiZWhhdmlvci4KLQotCSAgSW4gbW9zdCBjYXNlcywgdGhlIGNvbW1hbmQgbGluZSAod2hl
dGhlciBidWlsdC1pbiBvciBwcm92aWRlZAotCSAgYnkgdGhlIGJvb3QgbG9hZGVyKSBzaG91bGQg
c3BlY2lmeSB0aGUgZGV2aWNlIGZvciB0aGUgcm9vdAotCSAgZmlsZSBzeXN0ZW0uCi0KLWNvbmZp
ZyBDTURMSU5FX0ZPUkNFCi0JYm9vbCAiQnVpbHQtaW4gY29tbWFuZCBsaW5lIG92ZXJyaWRlcyBi
b290IGxvYWRlciBhcmd1bWVudHMiCi0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wgJiYgQ01ETElO
RSAhPSAiIgotCWhlbHAKLQkgIFNldCB0aGlzIG9wdGlvbiB0byAnWScgdG8gaGF2ZSB0aGUga2Vy
bmVsIGlnbm9yZSB0aGUgYm9vdCBsb2FkZXIKLQkgIGNvbW1hbmQgbGluZSwgYW5kIHVzZSBPTkxZ
IHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUuCi0KLQkgIFRoaXMgaXMgdXNlZCB0byB3b3JrIGFy
b3VuZCBicm9rZW4gYm9vdCBsb2FkZXJzLiAgVGhpcyBzaG91bGQKLQkgIGJlIHNldCB0byAnTicg
dW5kZXIgbm9ybWFsIGNvbmRpdGlvbnMuCi0KIGNvbmZpZyBNT0RJRllfTERUX1NZU0NBTEwKIAli
b29sICJFbmFibGUgdGhlIExEVCAobG9jYWwgZGVzY3JpcHRvciB0YWJsZSkiIGlmIEVYUEVSVAog
CWRlZmF1bHQgeQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL3NldHVwLmMgYi9hcmNoL3g4
Ni9rZXJuZWwvc2V0dXAuYwppbmRleCA2ZjJkZTU4ZWViNTQuLjNmMjc0YjAyZTUxYyAxMDA2NDQK
LS0tIGEvYXJjaC94ODYva2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC94ODYva2VybmVsL3NldHVw
LmMKQEAgLTUsNiArNSw3IEBACiAgKiBUaGlzIGZpbGUgY29udGFpbnMgdGhlIHNldHVwX2FyY2go
KSBjb2RlLCB3aGljaCBoYW5kbGVzIHRoZSBhcmNoaXRlY3R1cmUtZGVwZW5kZW50CiAgKiBwYXJ0
cyBvZiBlYXJseSBrZXJuZWwgaW5pdGlhbGl6YXRpb24uCiAgKi8KKyNpbmNsdWRlIDxsaW51eC9j
bWRsaW5lLmg+CiAjaW5jbHVkZSA8bGludXgvY29uc29sZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Ny
YXNoX2R1bXAuaD4KICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwLW9wcy5oPgpAQCAtMTYxLDkgKzE2
Miw2IEBAIHVuc2lnbmVkIGxvbmcgc2F2ZWRfdmlkZW9fbW9kZTsKICNkZWZpbmUgUkFNRElTS19M
T0FEX0ZMQUcJCTB4NDAwMAogCiBzdGF0aWMgY2hhciBfX2luaXRkYXRhIGNvbW1hbmRfbGluZVtD
T01NQU5EX0xJTkVfU0laRV07Ci0jaWZkZWYgQ09ORklHX0NNRExJTkVfQk9PTAotc3RhdGljIGNo
YXIgX19pbml0ZGF0YSBidWlsdGluX2NtZGxpbmVbQ09NTUFORF9MSU5FX1NJWkVdID0gQ09ORklH
X0NNRExJTkU7Ci0jZW5kaWYKIAogI2lmIGRlZmluZWQoQ09ORklHX0VERCkgfHwgZGVmaW5lZChD
T05GSUdfRUREX01PRFVMRSkKIHN0cnVjdCBlZGQgZWRkOwpAQCAtODgzLDE4ICs4ODEsNyBAQCB2
b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCiAJYnNzX3Jlc291cmNlLnN0
YXJ0ID0gX19wYV9zeW1ib2woX19ic3Nfc3RhcnQpOwogCWJzc19yZXNvdXJjZS5lbmQgPSBfX3Bh
X3N5bWJvbChfX2Jzc19zdG9wKS0xOwogCi0jaWZkZWYgQ09ORklHX0NNRExJTkVfQk9PTAotI2lm
ZGVmIENPTkZJR19DTURMSU5FX0ZPUkNFCi0Jc3RybGNweShib290X2NvbW1hbmRfbGluZSwgYnVp
bHRpbl9jbWRsaW5lLCBDT01NQU5EX0xJTkVfU0laRSk7Ci0jZWxzZQotCWlmIChidWlsdGluX2Nt
ZGxpbmVbMF0pIHsKLQkJLyogYXBwZW5kIGJvb3QgbG9hZGVyIGNtZGxpbmUgdG8gYnVpbHRpbiAq
LwotCQlzdHJsY2F0KGJ1aWx0aW5fY21kbGluZSwgIiAiLCBDT01NQU5EX0xJTkVfU0laRSk7Ci0J
CXN0cmxjYXQoYnVpbHRpbl9jbWRsaW5lLCBib290X2NvbW1hbmRfbGluZSwgQ09NTUFORF9MSU5F
X1NJWkUpOwotCQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBidWlsdGluX2NtZGxpbmUsIENP
TU1BTkRfTElORV9TSVpFKTsKLQl9Ci0jZW5kaWYKLSNlbmRpZgorCWNtZGxpbmVfYnVpbGQoYm9v
dF9jb21tYW5kX2xpbmUsIGJvb3RfY29tbWFuZF9saW5lKTsKIAogCXN0cmxjcHkoY29tbWFuZF9s
aW5lLCBib290X2NvbW1hbmRfbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOwogCSpjbWRsaW5lX3Ag
PSBjb21tYW5kX2xpbmU7Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
