Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3399634B0D2
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8529D20A71;
	Fri, 26 Mar 2021 21:52:01 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id C99BE212A3
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:53 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWR6RK3z9v03F;
 Fri, 26 Mar 2021 14:44:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e4Ftj0Jvyaj1; Fri, 26 Mar 2021 14:44:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWR4zwtz9v03B;
 Fri, 26 Mar 2021 14:44:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D8748B8CD;
 Fri, 26 Mar 2021 14:44:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NpujWXqfQku1; Fri, 26 Mar 2021 14:44:52 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E574D8B8C9;
 Fri, 26 Mar 2021 14:44:51 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 71E7E67611; Fri, 26 Mar 2021 13:44:52 +0000 (UTC)
Message-Id: <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:52 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 05/17] arm: Convert to GENERIC_CMDLINE
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

VGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4K
LS0tCiBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICB8IDM4ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYyB8IDE1ICsr
KysrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vS2NvbmZpZyBiL2FyY2gvYXJtL0tjb25maWcK
aW5kZXggNWRhOTZmNWRmNDhmLi42N2JjNzVmMmRhODEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL0tj
b25maWcKKysrIGIvYXJjaC9hcm0vS2NvbmZpZwpAQCAtNTAsNiArNTAsNyBAQCBjb25maWcgQVJN
CiAJc2VsZWN0IEdFTkVSSUNfQVJDSF9UT1BPTE9HWSBpZiBBUk1fQ1BVX1RPUE9MT0dZCiAJc2Vs
ZWN0IEdFTkVSSUNfQVRPTUlDNjQgaWYgQ1BVX1Y3TSB8fCBDUFVfVjYgfHwgIUNQVV8zMnY2SyB8
fCAhQUVBQkkKIAlzZWxlY3QgR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCisJ
c2VsZWN0IEdFTkVSSUNfQ01ETElORSBpZiBBVEFHUwogCXNlbGVjdCBHRU5FUklDX0lSUV9JUEkg
aWYgU01QCiAJc2VsZWN0IEdFTkVSSUNfQ1BVX0FVVE9QUk9CRQogCXNlbGVjdCBHRU5FUklDX0VB
UkxZX0lPUkVNQVAKQEAgLTE3NDAsNDMgKzE3NDEsNiBAQCBjb25maWcgQVJNX0FUQUdfRFRCX0NP
TVBBVF9DTURMSU5FX0VYVEVORAogCiBlbmRjaG9pY2UKIAotY29uZmlnIENNRExJTkUKLQlzdHJp
bmcgIkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgotCWRlZmF1bHQgIiIKLQloZWxwCi0J
ICBPbiBzb21lIGFyY2hpdGVjdHVyZXMgKGUuZy4gQ0FUUyksIHRoZXJlIGlzIGN1cnJlbnRseSBu
byB3YXkKLQkgIGZvciB0aGUgYm9vdCBsb2FkZXIgdG8gcGFzcyBhcmd1bWVudHMgdG8gdGhlIGtl
cm5lbC4gRm9yIHRoZXNlCi0JICBhcmNoaXRlY3R1cmVzLCB5b3Ugc2hvdWxkIHN1cHBseSBzb21l
IGNvbW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxkCi0JICB0aW1lIGJ5IGVudGVyaW5nIHRoZW0g
aGVyZS4gQXMgYSBtaW5pbXVtLCB5b3Ugc2hvdWxkIHNwZWNpZnkgdGhlCi0JICBtZW1vcnkgc2l6
ZSBhbmQgdGhlIHJvb3QgZGV2aWNlIChlLmcuLCBtZW09NjRNIHJvb3Q9L2Rldi9uZnMpLgotCi1j
aG9pY2UKLQlwcm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAi
IgotCWRlZmF1bHQgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKLQlkZXBlbmRzIG9uIEFUQUdTCi0K
LWNvbmZpZyBDTURMSU5FX0ZST01fQk9PVExPQURFUgotCWJvb2wgIlVzZSBib290bG9hZGVyIGtl
cm5lbCBhcmd1bWVudHMgaWYgYXZhaWxhYmxlIgotCWhlbHAKLQkgIFVzZXMgdGhlIGNvbW1hbmQt
bGluZSBvcHRpb25zIHBhc3NlZCBieSB0aGUgYm9vdCBsb2FkZXIuIElmCi0JICB0aGUgYm9vdCBs
b2FkZXIgZG9lc24ndCBwcm92aWRlIGFueSwgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQKLQkg
IHN0cmluZyBwcm92aWRlZCBpbiBDTURMSU5FIHdpbGwgYmUgdXNlZC4KLQotY29uZmlnIENNRExJ
TkVfRVhURU5ECi0JYm9vbCAiRXh0ZW5kIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKLQlo
ZWxwCi0JICBUaGUgY29tbWFuZC1saW5lIGFyZ3VtZW50cyBwcm92aWRlZCBieSB0aGUgYm9vdCBs
b2FkZXIgd2lsbCBiZQotCSAgYXBwZW5kZWQgdG8gdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQg
c3RyaW5nLgotCi1jb25maWcgQ01ETElORV9GT1JDRQotCWJvb2wgIkFsd2F5cyB1c2UgdGhlIGRl
ZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgotCWhlbHAKLQkgIEFsd2F5cyB1c2UgdGhlIGRl
ZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nLCBldmVuIGlmIHRoZSBib290Ci0JICBsb2FkZXIg
cGFzc2VzIG90aGVyIGFyZ3VtZW50cyB0byB0aGUga2VybmVsLgotCSAgVGhpcyBpcyB1c2VmdWwg
aWYgeW91IGNhbm5vdCBvciBkb24ndCB3YW50IHRvIGNoYW5nZSB0aGUKLQkgIGNvbW1hbmQtbGlu
ZSBvcHRpb25zIHlvdXIgYm9vdCBsb2FkZXIgcGFzc2VzIHRvIHRoZSBrZXJuZWwuCi1lbmRjaG9p
Y2UKLQogY29uZmlnIFhJUF9LRVJORUwKIAlib29sICJLZXJuZWwgRXhlY3V0ZS1Jbi1QbGFjZSBm
cm9tIFJPTSIKIAlkZXBlbmRzIG9uICFBUk1fTFBBRSAmJiAhQVJDSF9NVUxUSVBMQVRGT1JNCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYyBiL2FyY2gvYXJtL2tlcm5l
bC9hdGFnc19wYXJzZS5jCmluZGV4IDM3M2I2MWY5YTRmMC4uM2Q1YmQ1MmVlNDU4IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYworKysgYi9hcmNoL2FybS9rZXJuZWwv
YXRhZ3NfcGFyc2UuYwpAQCAtMTQsNiArMTQsNyBAQAogICogaXMgbm90IHBhcnNlZCBpbiBhbnkg
d2F5KS4KICAqLwogCisjaW5jbHVkZSA8bGludXgvY21kbGluZS5oPgogI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4KICNpbmNsdWRlIDxsaW51eC9pbml0cmQuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4KQEAgLTEyMCwxNiArMTIxLDEwIEBAIF9fdGFndGFibGUoQVRBR19SRVZJU0lPTiwgcGFy
c2VfdGFnX3JldmlzaW9uKTsKIAogc3RhdGljIGludCBfX2luaXQgcGFyc2VfdGFnX2NtZGxpbmUo
Y29uc3Qgc3RydWN0IHRhZyAqdGFnKQogewotI2lmIGRlZmluZWQoQ09ORklHX0NNRExJTkVfRVhU
RU5EKQotCXN0cmxjYXQoZGVmYXVsdF9jb21tYW5kX2xpbmUsICIgIiwgQ09NTUFORF9MSU5FX1NJ
WkUpOwotCXN0cmxjYXQoZGVmYXVsdF9jb21tYW5kX2xpbmUsIHRhZy0+dS5jbWRsaW5lLmNtZGxp
bmUsCi0JCUNPTU1BTkRfTElORV9TSVpFKTsKLSNlbGlmIGRlZmluZWQoQ09ORklHX0NNRExJTkVf
Rk9SQ0UpCi0JcHJfd2FybigiSWdub3JpbmcgdGFnIGNtZGxpbmUgKHVzaW5nIHRoZSBkZWZhdWx0
IGtlcm5lbCBjb21tYW5kIGxpbmUpXG4iKTsKLSNlbHNlCi0Jc3RybGNweShkZWZhdWx0X2NvbW1h
bmRfbGluZSwgdGFnLT51LmNtZGxpbmUuY21kbGluZSwKLQkJQ09NTUFORF9MSU5FX1NJWkUpOwot
I2VuZGlmCisJY21kbGluZV9idWlsZChkZWZhdWx0X2NvbW1hbmRfbGluZSwgdGFnLT51LmNtZGxp
bmUuY21kbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOworCisJaWYgSVNfRU5BQkxFRChDT05GSUdf
Q01ETElORV9GT1JDRSkKKwkJcHJfd2FybigiSWdub3JpbmcgdGFnIGNtZGxpbmUgKHVzaW5nIHRo
ZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIGxpbmUpXG4iKTsKIAlyZXR1cm4gMDsKIH0KIAotLSAK
Mi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
