Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 349D9353255
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E5AE721358;
	Sat,  3 Apr 2021 06:19:05 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 0A81C212FA
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:23 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG44gBbz9v2m7;
 Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sBnAWcx1Go7E; Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG43Nc3z9v2ls;
 Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12BCB8BB7C;
 Fri,  2 Apr 2021 17:18:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mdOU6-fT9Uo6; Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71E4F8BB7F;
 Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4E3F867989; Fri,  2 Apr 2021 15:18:21 +0000 (UTC)
Message-Id: <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:21 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL21pcHMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFy
Y2gvbWlwcy9LY29uZmlnLmRlYnVnICAgICAgICAgICAgICAgICAgIHwgNDQgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIGFyY2gvbWlwcy9jb25maWdzL2FyN19kZWZjb25maWcgICAgICAgICAgIHwg
IDEgLQogYXJjaC9taXBzL2NvbmZpZ3MvYmNtNDd4eF9kZWZjb25maWcgICAgICAgfCAgMSAtCiBh
cmNoL21pcHMvY29uZmlncy9iY202M3h4X2RlZmNvbmZpZyAgICAgICB8ICAxIC0KIGFyY2gvbWlw
cy9jb25maWdzL2JtaXBzX2JlX2RlZmNvbmZpZyAgICAgIHwgIDEgLQogYXJjaC9taXBzL2NvbmZp
Z3MvYm1pcHNfc3RiX2RlZmNvbmZpZyAgICAgfCAgMSAtCiBhcmNoL21pcHMvY29uZmlncy9jYXBj
ZWxsYV9kZWZjb25maWcgICAgICB8ICAxIC0KIGFyY2gvbWlwcy9jb25maWdzL2NpMjBfZGVmY29u
ZmlnICAgICAgICAgIHwgIDEgLQogYXJjaC9taXBzL2NvbmZpZ3MvY3UxMDAwLW5lb19kZWZjb25m
aWcgICAgfCAgMSAtCiBhcmNoL21pcHMvY29uZmlncy9jdTE4MzAtbmVvX2RlZmNvbmZpZyAgICB8
ICAxIC0KIGFyY2gvbWlwcy9jb25maWdzL2U1NV9kZWZjb25maWcgICAgICAgICAgIHwgIDEgLQog
YXJjaC9taXBzL2NvbmZpZ3MvZ2VuZXJpY19kZWZjb25maWcgICAgICAgfCAgMSAtCiBhcmNoL21p
cHMvY29uZmlncy9ncHJfZGVmY29uZmlnICAgICAgICAgICB8ICAxIC0KIGFyY2gvbWlwcy9jb25m
aWdzL2xvb25nc29uM19kZWZjb25maWcgICAgIHwgIDEgLQogYXJjaC9taXBzL2NvbmZpZ3MvbXBj
MzB4X2RlZmNvbmZpZyAgICAgICAgfCAgMSAtCiBhcmNoL21pcHMvY29uZmlncy9ydDMwNXhfZGVm
Y29uZmlnICAgICAgICB8ICAxIC0KIGFyY2gvbWlwcy9jb25maWdzL3RiMDIxOV9kZWZjb25maWcg
ICAgICAgIHwgIDEgLQogYXJjaC9taXBzL2NvbmZpZ3MvdGIwMjI2X2RlZmNvbmZpZyAgICAgICAg
fCAgMSAtCiBhcmNoL21pcHMvY29uZmlncy90YjAyODdfZGVmY29uZmlnICAgICAgICB8ICAxIC0K
IGFyY2gvbWlwcy9jb25maWdzL3dvcmtwYWRfZGVmY29uZmlnICAgICAgIHwgIDEgLQogYXJjaC9t
aXBzL2NvbmZpZ3MveHdheV9kZWZjb25maWcgICAgICAgICAgfCAgMSAtCiBhcmNoL21pcHMva2Vy
bmVsL3JlbG9jYXRlLmMgICAgICAgICAgICAgICB8ICA0ICstLQogYXJjaC9taXBzL2tlcm5lbC9z
ZXR1cC5jICAgICAgICAgICAgICAgICAgfCA0MCArKy0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gv
bWlwcy9waWMzMi9waWMzMm16ZGEvZWFybHlfY29uc29sZS5jIHwgIDIgKy0KIGFyY2gvbWlwcy9w
aWMzMi9waWMzMm16ZGEvaW5pdC5jICAgICAgICAgIHwgIDIgLS0KIDI2IGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMTA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlw
cy9LY29uZmlnIGIvYXJjaC9taXBzL0tjb25maWcKaW5kZXggZDg5ZWZiYTNkOGE0Li5hNjVjZTlk
ZGJmY2UgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9LY29uZmlnCisrKyBiL2FyY2gvbWlwcy9LY29u
ZmlnCkBAIC0yNCw2ICsyNCw3IEBAIGNvbmZpZyBNSVBTCiAJc2VsZWN0IENQVV9OT19FRkZJQ0lF
TlRfRkZTIGlmIChUQVJHRVRfSVNBX1JFViA8IDEpCiAJc2VsZWN0IENQVV9QTSBpZiBDUFVfSURM
RQogCXNlbGVjdCBHRU5FUklDX0FUT01JQzY0IGlmICE2NEJJVAorCXNlbGVjdCBHRU5FUklDX0NN
RExJTkUKIAlzZWxlY3QgR0VORVJJQ19DTU9TX1VQREFURQogCXNlbGVjdCBHRU5FUklDX0NQVV9B
VVRPUFJPQkUKIAlzZWxlY3QgR0VORVJJQ19HRVRUSU1FT0ZEQVkKZGlmZiAtLWdpdCBhL2FyY2gv
bWlwcy9LY29uZmlnLmRlYnVnIGIvYXJjaC9taXBzL0tjb25maWcuZGVidWcKaW5kZXggN2E4ZDk0
Y2RkNDkzLi5iNWEwOTljNzRlYjYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9LY29uZmlnLmRlYnVn
CisrKyBiL2FyY2gvbWlwcy9LY29uZmlnLmRlYnVnCkBAIC0zMCw1MCArMzAsNiBAQCBjb25maWcg
RUFSTFlfUFJJTlRLXzgyNTAKIGNvbmZpZyBVU0VfR0VORVJJQ19FQVJMWV9QUklOVEtfODI1MAog
CWJvb2wKIAotY29uZmlnIENNRExJTkVfQk9PTAotCWJvb2wgIkJ1aWx0LWluIGtlcm5lbCBjb21t
YW5kIGxpbmUiCi0JaGVscAotCSAgRm9yIG1vc3Qgc3lzdGVtcywgaXQgaXMgZmlybXdhcmUgb3Ig
c2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIgdGhhdAotCSAgYnkgZGVmYXVsdCBzcGVjaWZpZXMgdGhl
IGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9ucy4gIEhvd2V2ZXIsCi0JICBpdCBtaWdodCBiZSBu
ZWNlc3Nhcnkgb3IgYWR2YW50YWdlb3VzIHRvIGVpdGhlciBvdmVycmlkZSB0aGUKLQkgIGRlZmF1
bHQga2VybmVsIGNvbW1hbmQgbGluZSBvciBhZGQgYSBmZXcgZXh0cmEgb3B0aW9ucyB0byBpdC4K
LQkgIEZvciBzdWNoIGNhc2VzLCB0aGlzIG9wdGlvbiBhbGxvd3MgeW91IHRvIGhhcmRjb2RlIHlv
dXIgb3duCi0JICBjb21tYW5kIGxpbmUgb3B0aW9ucyBkaXJlY3RseSBpbnRvIHRoZSBrZXJuZWwu
ICBGb3IgdGhhdCwgeW91Ci0JICBzaG91bGQgY2hvb3NlICdZJyBoZXJlLCBhbmQgZmlsbCBpbiB0
aGUgZXh0cmEgYm9vdCBhcmd1bWVudHMKLQkgIGluIENPTkZJR19DTURMSU5FLgotCi0JICBUaGUg
YnVpbHQtaW4gb3B0aW9ucyB3aWxsIGJlIGNvbmNhdGVuYXRlZCB0byB0aGUgZGVmYXVsdCBjb21t
YW5kCi0JICBsaW5lIGlmIENNRExJTkVfT1ZFUlJJREUgaXMgc2V0IHRvICdOJy4gT3RoZXJ3aXNl
LCB0aGUgZGVmYXVsdAotCSAgY29tbWFuZCBsaW5lIHdpbGwgYmUgaWdub3JlZCBhbmQgcmVwbGFj
ZWQgYnkgdGhlIGJ1aWx0LWluIHN0cmluZy4KLQotCSAgTW9zdCBNSVBTIHN5c3RlbXMgd2lsbCBu
b3JtYWxseSBleHBlY3QgJ04nIGhlcmUgYW5kIHJlbHkgdXBvbgotCSAgdGhlIGNvbW1hbmQgbGlu
ZSBmcm9tIHRoZSBmaXJtd2FyZSBvciB0aGUgc2Vjb25kLXN0YWdlIGJvb3Rsb2FkZXIuCi0KLWNv
bmZpZyBDTURMSU5FCi0Jc3RyaW5nICJEZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKLQlk
ZXBlbmRzIG9uIENNRExJTkVfQk9PTAotCWhlbHAKLQkgIE9uIHNvbWUgcGxhdGZvcm1zLCB0aGVy
ZSBpcyBjdXJyZW50bHkgbm8gd2F5IGZvciB0aGUgYm9vdCBsb2FkZXIgdG8KLQkgIHBhc3MgYXJn
dW1lbnRzIHRvIHRoZSBrZXJuZWwuICBGb3IgdGhlc2UgcGxhdGZvcm1zLCBhbmQgZm9yIHRoZSBj
YXNlcwotCSAgd2hlbiB5b3Ugd2FudCB0byBhZGQgc29tZSBleHRyYSBvcHRpb25zIHRvIHRoZSBj
b21tYW5kIGxpbmUgb3IgaWdub3JlCi0JICB0aGUgZGVmYXVsdCBjb21tYW5kIGxpbmUsIHlvdSBj
YW4gc3VwcGx5IHNvbWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQKLQkgIGJ1aWxkIHRpbWUgYnkg
ZW50ZXJpbmcgdGhlbSBoZXJlLiAgSW4gb3RoZXIgY2FzZXMgeW91IGNhbiBzcGVjaWZ5Ci0JICBr
ZXJuZWwgYXJncyBzbyB0aGF0IHlvdSBkb24ndCBoYXZlIHRvIHNldCB0aGVtIHVwIGluIGJvYXJk
IHByb20KLQkgIGluaXRpYWxpemF0aW9uIHJvdXRpbmVzLgotCi0JICBGb3IgbW9yZSBpbmZvcm1h
dGlvbiwgc2VlIHRoZSBDTURMSU5FX0JPT0wgYW5kIENNRExJTkVfT1ZFUlJJREUKLQkgIG9wdGlv
bnMuCi0KLWNvbmZpZyBDTURMSU5FX09WRVJSSURFCi0JYm9vbCAiQnVpbHQtaW4gY29tbWFuZCBs
aW5lIG92ZXJyaWRlcyBmaXJtd2FyZSBhcmd1bWVudHMiCi0JZGVwZW5kcyBvbiBDTURMSU5FX0JP
T0wKLQloZWxwCi0JICBCeSBzZXR0aW5nIHRoaXMgb3B0aW9uIHRvICdZJyB5b3Ugd2lsbCBoYXZl
IHlvdXIga2VybmVsIGlnbm9yZQotCSAgY29tbWFuZCBsaW5lIGFyZ3VtZW50cyBmcm9tIGZpcm13
YXJlIG9yIHNlY29uZCBzdGFnZSBib290bG9hZGVyLgotCSAgSW5zdGVhZCwgdGhlIGJ1aWx0LWlu
IGNvbW1hbmQgbGluZSB3aWxsIGJlIHVzZWQgZXhjbHVzaXZlbHkuCi0KLQkgIE5vcm1hbGx5LCB5
b3Ugd2lsbCBjaG9vc2UgJ04nIGhlcmUuCi0KIGNvbmZpZyBTQjFYWFhfQ09SRUxJUwogCWJvb2wg
IkNvcmVsaXMgRGVidWdnZXIiCiAJZGVwZW5kcyBvbiBTSUJZVEVfU0IxeHh4X1NPQwpkaWZmIC0t
Z2l0IGEvYXJjaC9taXBzL2NvbmZpZ3MvYXI3X2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdz
L2FyN19kZWZjb25maWcKaW5kZXggY2Y5YzYzMjliODA3Li41ZThhZGNkNzk5ZDAgMTAwNjQ0Ci0t
LSBhL2FyY2gvbWlwcy9jb25maWdzL2FyN19kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZp
Z3MvYXI3X2RlZmNvbmZpZwpAQCAtMTIwLDUgKzEyMCw0IEBAIENPTkZJR19TUVVBU0hGUz15CiAj
IENPTkZJR19FTkFCTEVfTVVTVF9DSEVDSyBpcyBub3Qgc2V0CiBDT05GSUdfU1RSSVBfQVNNX1NZ
TVM9eQogQ09ORklHX0RFQlVHX0ZTPXkKLUNPTkZJR19DTURMSU5FX0JPT0w9eQogQ09ORklHX0NN
RExJTkU9InJvb3Rmc3R5cGU9c3F1YXNoZnMsamZmczIiCmRpZmYgLS1naXQgYS9hcmNoL21pcHMv
Y29uZmlncy9iY200N3h4X2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdzL2JjbTQ3eHhfZGVm
Y29uZmlnCmluZGV4IDkxY2U3NWVkYmZiNC4uNjkwZjQyMzUwOWYwIDEwMDY0NAotLS0gYS9hcmNo
L21pcHMvY29uZmlncy9iY200N3h4X2RlZmNvbmZpZworKysgYi9hcmNoL21pcHMvY29uZmlncy9i
Y200N3h4X2RlZmNvbmZpZwpAQCAtNzcsNSArNzcsNCBAQCBDT05GSUdfREVCVUdfSU5GT19SRURV
Q0VEPXkKIENPTkZJR19TVFJJUF9BU01fU1lNUz15CiBDT05GSUdfREVCVUdfRlM9eQogQ09ORklH
X01BR0lDX1NZU1JRPXkKLUNPTkZJR19DTURMSU5FX0JPT0w9eQogQ09ORklHX0NNRExJTkU9ImNv
bnNvbGU9dHR5UzAsMTE1MjAwIgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2NvbmZpZ3MvYmNtNjN4
eF9kZWZjb25maWcgYi9hcmNoL21pcHMvY29uZmlncy9iY202M3h4X2RlZmNvbmZpZwppbmRleCA4
NjFmNjgwMTg0YjkuLjE5YjE1NDI0ZjY2OSAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2NvbmZpZ3Mv
YmNtNjN4eF9kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZpZ3MvYmNtNjN4eF9kZWZjb25m
aWcKQEAgLTY1LDUgKzY1LDQgQEAgQ09ORklHX1BST0NfS0NPUkU9eQogIyBDT05GSUdfTkVUV09S
S19GSUxFU1lTVEVNUyBpcyBub3Qgc2V0CiAjIENPTkZJR19DUllQVE9fSFcgaXMgbm90IHNldAog
Q09ORklHX01BR0lDX1NZU1JRPXkKLUNPTkZJR19DTURMSU5FX0JPT0w9eQogQ09ORklHX0NNRExJ
TkU9ImNvbnNvbGU9dHR5UzAsMTE1MjAwIgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2NvbmZpZ3Mv
Ym1pcHNfYmVfZGVmY29uZmlnIGIvYXJjaC9taXBzL2NvbmZpZ3MvYm1pcHNfYmVfZGVmY29uZmln
CmluZGV4IDAzMmJiNTFkZWZlOC4uMmRiNzcxMmFjYzVkIDEwMDY0NAotLS0gYS9hcmNoL21pcHMv
Y29uZmlncy9ibWlwc19iZV9kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZpZ3MvYm1pcHNf
YmVfZGVmY29uZmlnCkBAIC03NSw1ICs3NSw0IEBAIENPTkZJR19OTFNfSVNPODg1OV8xPXkKIENP
TkZJR19QUklOVEtfVElNRT15CiBDT05GSUdfREVCVUdfRlM9eQogQ09ORklHX01BR0lDX1NZU1JR
PXkKLUNPTkZJR19DTURMSU5FX0JPT0w9eQogQ09ORklHX0NNRExJTkU9ImVhcmx5Y29uIgpkaWZm
IC0tZ2l0IGEvYXJjaC9taXBzL2NvbmZpZ3MvYm1pcHNfc3RiX2RlZmNvbmZpZyBiL2FyY2gvbWlw
cy9jb25maWdzL2JtaXBzX3N0Yl9kZWZjb25maWcKaW5kZXggNjI1YmQyZDdlNjg1Li5iYzE2NTlk
NDNjYTcgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9jb25maWdzL2JtaXBzX3N0Yl9kZWZjb25maWcK
KysrIGIvYXJjaC9taXBzL2NvbmZpZ3MvYm1pcHNfc3RiX2RlZmNvbmZpZwpAQCAtODYsNSArODYs
NCBAQCBDT05GSUdfTkxTX0lTTzg4NTlfMT15CiBDT05GSUdfUFJJTlRLX1RJTUU9eQogQ09ORklH
X0RFQlVHX0ZTPXkKIENPTkZJR19NQUdJQ19TWVNSUT15Ci1DT05GSUdfQ01ETElORV9CT09MPXkK
IENPTkZJR19DTURMSU5FPSJlYXJseWNvbiIKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jb25maWdz
L2NhcGNlbGxhX2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdzL2NhcGNlbGxhX2RlZmNvbmZp
ZwppbmRleCA3YmY4OTcxYWY1M2IuLjMwMDAzMmE1Y2FhMCAxMDA2NDQKLS0tIGEvYXJjaC9taXBz
L2NvbmZpZ3MvY2FwY2VsbGFfZGVmY29uZmlnCisrKyBiL2FyY2gvbWlwcy9jb25maWdzL2NhcGNl
bGxhX2RlZmNvbmZpZwpAQCAtODcsNSArODcsNCBAQCBDT05GSUdfQ1JZUFRPX1RFQT1tCiBDT05G
SUdfQ1JZUFRPX1RXT0ZJU0g9bQogQ09ORklHX0NSWVBUT19ERUZMQVRFPW0KICMgQ09ORklHX0NS
WVBUT19IVyBpcyBub3Qgc2V0Ci1DT05GSUdfQ01ETElORV9CT09MPXkKIENPTkZJR19DTURMSU5F
PSJtZW09MzJNIGNvbnNvbGU9dHR5VlIwLDM4NDAwIgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nv
bmZpZ3MvY2kyMF9kZWZjb25maWcgYi9hcmNoL21pcHMvY29uZmlncy9jaTIwX2RlZmNvbmZpZwpp
bmRleCBhYjdlYmIwNjY4MzQuLmY4NzRlNDIxYjU0ZiAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2Nv
bmZpZ3MvY2kyMF9kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZpZ3MvY2kyMF9kZWZjb25m
aWcKQEAgLTIwMyw1ICsyMDMsNCBAQCBDT05GSUdfUEFOSUNfVElNRU9VVD0xMAogIyBDT05GSUdf
REVCVUdfUFJFRU1QVCBpcyBub3Qgc2V0CiBDT05GSUdfU1RBQ0tUUkFDRT15CiAjIENPTkZJR19G
VFJBQ0UgaXMgbm90IHNldAotQ09ORklHX0NNRExJTkVfQk9PTD15CiBDT05GSUdfQ01ETElORT0i
ZWFybHljb24gY29uc29sZT10dHlTNCwxMTUyMDAgY2xrX2lnbm9yZV91bnVzZWQiCmRpZmYgLS1n
aXQgYS9hcmNoL21pcHMvY29uZmlncy9jdTEwMDAtbmVvX2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9j
b25maWdzL2N1MTAwMC1uZW9fZGVmY29uZmlnCmluZGV4IDlkNzVmNWI3N2Q1ZC4uMDNjYjUyNDk2
N2U3IDEwMDY0NAotLS0gYS9hcmNoL21pcHMvY29uZmlncy9jdTEwMDAtbmVvX2RlZmNvbmZpZwor
KysgYi9hcmNoL21pcHMvY29uZmlncy9jdTEwMDAtbmVvX2RlZmNvbmZpZwpAQCAtMTIzLDUgKzEy
Myw0IEBAIENPTkZJR19QQU5JQ19USU1FT1VUPTEwCiAjIENPTkZJR19ERUJVR19QUkVFTVBUIGlz
IG5vdCBzZXQKIENPTkZJR19TVEFDS1RSQUNFPXkKICMgQ09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0
Ci1DT05GSUdfQ01ETElORV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJlYXJseWNvbiBjbGtfaWdu
b3JlX3VudXNlZCIKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jb25maWdzL2N1MTgzMC1uZW9fZGVm
Y29uZmlnIGIvYXJjaC9taXBzL2NvbmZpZ3MvY3UxODMwLW5lb19kZWZjb25maWcKaW5kZXggMjlk
ZWNkMDAwM2M2Li5kNzMzY2NhYjQ5NGUgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9jb25maWdzL2N1
MTgzMC1uZW9fZGVmY29uZmlnCisrKyBiL2FyY2gvbWlwcy9jb25maWdzL2N1MTgzMC1uZW9fZGVm
Y29uZmlnCkBAIC0xMjYsNSArMTI2LDQgQEAgQ09ORklHX1BBTklDX1RJTUVPVVQ9MTAKICMgQ09O
RklHX0RFQlVHX1BSRUVNUFQgaXMgbm90IHNldAogQ09ORklHX1NUQUNLVFJBQ0U9eQogIyBDT05G
SUdfRlRSQUNFIGlzIG5vdCBzZXQKLUNPTkZJR19DTURMSU5FX0JPT0w9eQogQ09ORklHX0NNRExJ
TkU9ImVhcmx5Y29uIGNsa19pZ25vcmVfdW51c2VkIgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nv
bmZpZ3MvZTU1X2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdzL2U1NV9kZWZjb25maWcKaW5k
ZXggZmQ4MmI4NThhOGYwLi5mZmM5NjRkMWJhZTcgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9jb25m
aWdzL2U1NV9kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZpZ3MvZTU1X2RlZmNvbmZpZwpA
QCAtMzMsNSArMzMsNCBAQCBDT05GSUdfQVVUT0ZTNF9GUz15CiBDT05GSUdfUFJPQ19LQ09SRT15
CiBDT05GSUdfVE1QRlM9eQogQ09ORklHX1RNUEZTX1BPU0lYX0FDTD15Ci1DT05GSUdfQ01ETElO
RV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJjb25zb2xlPXR0eVZSMCwxOTIwMCBpZGUwPTB4MWYw
LDB4M2Y2LDQwIG1lbT04TSIKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jb25maWdzL2dlbmVyaWNf
ZGVmY29uZmlnIGIvYXJjaC9taXBzL2NvbmZpZ3MvZ2VuZXJpY19kZWZjb25maWcKaW5kZXggNzE0
MTY5ZTQxMWNmLi42MDAzZjZjN2FhMDkgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9jb25maWdzL2dl
bmVyaWNfZGVmY29uZmlnCisrKyBiL2FyY2gvbWlwcy9jb25maWdzL2dlbmVyaWNfZGVmY29uZmln
CkBAIC04OCw1ICs4OCw0IEBAIENPTkZJR19ERUJVR19JTkZPX1JFRFVDRUQ9eQogQ09ORklHX0RF
QlVHX0ZTPXkKICMgQ09ORklHX1NDSEVEX0RFQlVHIGlzIG5vdCBzZXQKICMgQ09ORklHX0ZUUkFD
RSBpcyBub3Qgc2V0Ci1DT05GSUdfQ01ETElORV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJlYXJs
eWNvbiIKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jb25maWdzL2dwcl9kZWZjb25maWcgYi9hcmNo
L21pcHMvY29uZmlncy9ncHJfZGVmY29uZmlnCmluZGV4IDVjYjkxNTA5YmI3Yy4uODk5OGQyOGI5
NGM4IDEwMDY0NAotLS0gYS9hcmNoL21pcHMvY29uZmlncy9ncHJfZGVmY29uZmlnCisrKyBiL2Fy
Y2gvbWlwcy9jb25maWdzL2dwcl9kZWZjb25maWcKQEAgLTMwNiw1ICszMDYsNCBAQCBDT05GSUdf
Q1JZUFRPX1RXT0ZJU0g9bQogQ09ORklHX0NSWVBUT19ERUZMQVRFPW0KICMgQ09ORklHX0VOQUJM
RV9NVVNUX0NIRUNLIGlzIG5vdCBzZXQKIENPTkZJR19NQUdJQ19TWVNSUT15Ci1DT05GSUdfQ01E
TElORV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJjb25zb2xlPXR0eVMwLDExNTIwMCByb290PS9k
ZXYvbmZzIHJ3IGlwPWF1dG8iCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvY29uZmlncy9sb29uZ3Nv
bjNfZGVmY29uZmlnIGIvYXJjaC9taXBzL2NvbmZpZ3MvbG9vbmdzb24zX2RlZmNvbmZpZwppbmRl
eCAwZTc5ZjgxMjE3YmMuLmM0ZjlhMjM2YmQxZiAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2NvbmZp
Z3MvbG9vbmdzb24zX2RlZmNvbmZpZworKysgYi9hcmNoL21pcHMvY29uZmlncy9sb29uZ3NvbjNf
ZGVmY29uZmlnCkBAIC00MDgsNSArNDA4LDQgQEAgQ09ORklHX01BR0lDX1NZU1JRPXkKICMgQ09O
RklHX1NDSEVEX0RFQlVHIGlzIG5vdCBzZXQKICMgQ09ORklHX0RFQlVHX1BSRUVNUFQgaXMgbm90
IHNldAogIyBDT05GSUdfRlRSQUNFIGlzIG5vdCBzZXQKLUNPTkZJR19DTURMSU5FX0JPT0w9eQog
Q09ORklHX0NNRExJTkU9ImllZWU3NTQ9cmVsYXhlZCIKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9j
b25maWdzL21wYzMweF9kZWZjb25maWcgYi9hcmNoL21pcHMvY29uZmlncy9tcGMzMHhfZGVmY29u
ZmlnCmluZGV4IGQ0ZTAzODgwMjUxMC4uNmVjZWYyYTY2NmZjIDEwMDY0NAotLS0gYS9hcmNoL21p
cHMvY29uZmlncy9tcGMzMHhfZGVmY29uZmlnCisrKyBiL2FyY2gvbWlwcy9jb25maWdzL21wYzMw
eF9kZWZjb25maWcKQEAgLTQ5LDUgKzQ5LDQgQEAgQ09ORklHX0FVVE9GUzRfRlM9eQogQ09ORklH
X1BST0NfS0NPUkU9eQogQ09ORklHX0NPTkZJR0ZTX0ZTPW0KIENPTkZJR19ORlNfRlM9eQotQ09O
RklHX0NNRExJTkVfQk9PTD15CiBDT05GSUdfQ01ETElORT0ibWVtPTMyTSBjb25zb2xlPXR0eVZS
MCwxOTIwMCBpZGUwPTB4MTcwLDB4Mzc2LDczIgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2NvbmZp
Z3MvcnQzMDV4X2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdzL3J0MzA1eF9kZWZjb25maWcK
aW5kZXggZmVjNTg1MWMxNjRiLi5jMzQ0NDFjZTY2MjEgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9j
b25maWdzL3J0MzA1eF9kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZpZ3MvcnQzMDV4X2Rl
ZmNvbmZpZwpAQCAtMTQ3LDQgKzE0NywzIEBAIENPTkZJR19ERUJVR19GUz15CiBDT05GSUdfTUFH
SUNfU1lTUlE9eQogIyBDT05GSUdfU0NIRURfREVCVUcgaXMgbm90IHNldAogIyBDT05GSUdfRlRS
QUNFIGlzIG5vdCBzZXQKLUNPTkZJR19DTURMSU5FX0JPT0w9eQpkaWZmIC0tZ2l0IGEvYXJjaC9t
aXBzL2NvbmZpZ3MvdGIwMjE5X2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdzL3RiMDIxOV9k
ZWZjb25maWcKaW5kZXggNjU0N2Y4NDc1MGI1Li5jY2YyMGJkMTU2YTEgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvbWlwcy9jb25maWdzL3RiMDIxOV9kZWZjb25maWcKKysrIGIvYXJjaC9taXBzL2NvbmZpZ3Mv
dGIwMjE5X2RlZmNvbmZpZwpAQCAtNzMsNSArNzMsNCBAQCBDT05GSUdfTkZTX0ZTPXkKIENPTkZJ
R19ST09UX05GUz15CiBDT05GSUdfTkZTRD15CiBDT05GSUdfTkZTRF9WMz15Ci1DT05GSUdfQ01E
TElORV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJjY2E9MyBtZW09NjRNIGNvbnNvbGU9dHR5VlIw
LDExNTIwMCBpcD1hbnkgcm9vdD0vZGV2L25mcyIKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jb25m
aWdzL3RiMDIyNl9kZWZjb25maWcgYi9hcmNoL21pcHMvY29uZmlncy90YjAyMjZfZGVmY29uZmln
CmluZGV4IDdlMDk5ZjdjMjI4Ni4uOWY3OGZkMDBhNGY2IDEwMDY0NAotLS0gYS9hcmNoL21pcHMv
Y29uZmlncy90YjAyMjZfZGVmY29uZmlnCisrKyBiL2FyY2gvbWlwcy9jb25maWdzL3RiMDIyNl9k
ZWZjb25maWcKQEAgLTY4LDUgKzY4LDQgQEAgQ09ORklHX05GU19GUz15CiBDT05GSUdfUk9PVF9O
RlM9eQogQ09ORklHX05GU0Q9bQogQ09ORklHX05GU0RfVjM9eQotQ09ORklHX0NNRExJTkVfQk9P
TD15CiBDT05GSUdfQ01ETElORT0iY2NhPTMgbWVtPTMyTSBjb25zb2xlPXR0eVZSMCwxMTUyMDAi
CmRpZmYgLS1naXQgYS9hcmNoL21pcHMvY29uZmlncy90YjAyODdfZGVmY29uZmlnIGIvYXJjaC9t
aXBzL2NvbmZpZ3MvdGIwMjg3X2RlZmNvbmZpZwppbmRleCAwZDg4MWRkODYyYzAuLjU1MjlkMGRh
Y2Y5NCAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2NvbmZpZ3MvdGIwMjg3X2RlZmNvbmZpZworKysg
Yi9hcmNoL21pcHMvY29uZmlncy90YjAyODdfZGVmY29uZmlnCkBAIC04MSw1ICs4MSw0IEBAIENP
TkZJR19ORlNEX1YzPXkKIENPTkZJR19GT05UUz15CiBDT05GSUdfRk9OVF84eDg9eQogQ09ORklH
X0ZPTlRfOHgxNj15Ci1DT05GSUdfQ01ETElORV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJjY2E9
MyBtZW09NjRNIGNvbnNvbGU9dHR5VlIwLDExNTIwMCBpcD1hbnkgcm9vdD0vZGV2L25mcyIKZGlm
ZiAtLWdpdCBhL2FyY2gvbWlwcy9jb25maWdzL3dvcmtwYWRfZGVmY29uZmlnIGIvYXJjaC9taXBz
L2NvbmZpZ3Mvd29ya3BhZF9kZWZjb25maWcKaW5kZXggODkxYTVmNzczMDVkLi5lZTcxMmY3YjU1
NzUgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9jb25maWdzL3dvcmtwYWRfZGVmY29uZmlnCisrKyBi
L2FyY2gvbWlwcy9jb25maWdzL3dvcmtwYWRfZGVmY29uZmlnCkBAIC02MSw1ICs2MSw0IEBAIENP
TkZJR19UTVBGU19QT1NJWF9BQ0w9eQogQ09ORklHX05GU19GUz1tCiBDT05GSUdfTkZTRD1tCiBD
T05GSUdfTkZTRF9WMz15Ci1DT05GSUdfQ01ETElORV9CT09MPXkKIENPTkZJR19DTURMSU5FPSJj
b25zb2xlPXR0eVZSMCwxOTIwMCBpZGUwPTB4MTcwLDB4Mzc2LDQ5IG1lbT0xNk0iCmRpZmYgLS1n
aXQgYS9hcmNoL21pcHMvY29uZmlncy94d2F5X2RlZmNvbmZpZyBiL2FyY2gvbWlwcy9jb25maWdz
L3h3YXlfZGVmY29uZmlnCmluZGV4IDlhYmJjMGRlYmMyYS4uZWJkOGRiZGIwNjk1IDEwMDY0NAot
LS0gYS9hcmNoL21pcHMvY29uZmlncy94d2F5X2RlZmNvbmZpZworKysgYi9hcmNoL21pcHMvY29u
Zmlncy94d2F5X2RlZmNvbmZpZwpAQCAtMTUzLDQgKzE1MywzIEBAIENPTkZJR19ERUJVR19GUz15
CiBDT05GSUdfTUFHSUNfU1lTUlE9eQogIyBDT05GSUdfU0NIRURfREVCVUcgaXMgbm90IHNldAog
IyBDT05GSUdfRlRSQUNFIGlzIG5vdCBzZXQKLUNPTkZJR19DTURMSU5FX0JPT0w9eQpkaWZmIC0t
Z2l0IGEvYXJjaC9taXBzL2tlcm5lbC9yZWxvY2F0ZS5jIGIvYXJjaC9taXBzL2tlcm5lbC9yZWxv
Y2F0ZS5jCmluZGV4IDQ5OWE1MzU3YzA5Zi4uMTNjOTU1MDI3Njk2IDEwMDY0NAotLS0gYS9hcmNo
L21pcHMva2VybmVsL3JlbG9jYXRlLmMKKysrIGIvYXJjaC9taXBzL2tlcm5lbC9yZWxvY2F0ZS5j
CkBAIC0yNDQsMTUgKzI0NCwxMyBAQCBzdGF0aWMgaW5saW5lIF9faW5pdCB1bnNpZ25lZCBsb25n
IGdldF9yYW5kb21fYm9vdCh2b2lkKQogc3RhdGljIGlubGluZSBfX2luaXQgYm9vbCBrYXNscl9k
aXNhYmxlZCh2b2lkKQogewogCWNoYXIgKnN0cjsKLQotI2lmIGRlZmluZWQoQ09ORklHX0NNRExJ
TkVfQk9PTCkKIAljb25zdCBjaGFyICpidWlsdGluX2NtZGxpbmUgPSBDT05GSUdfQ01ETElORTsK
IAogCXN0ciA9IHN0cnN0cihidWlsdGluX2NtZGxpbmUsICJub2thc2xyIik7CiAJaWYgKHN0ciA9
PSBidWlsdGluX2NtZGxpbmUgfHwKIAkgICAgKHN0ciA+IGJ1aWx0aW5fY21kbGluZSAmJiAqKHN0
ciAtIDEpID09ICcgJykpCiAJCXJldHVybiB0cnVlOwotI2VuZGlmCisKIAlzdHIgPSBzdHJzdHIo
YXJjc19jbWRsaW5lLCAibm9rYXNsciIpOwogCWlmIChzdHIgPT0gYXJjc19jbWRsaW5lIHx8IChz
dHIgPiBhcmNzX2NtZGxpbmUgJiYgKihzdHIgLSAxKSA9PSAnICcpKQogCQlyZXR1cm4gdHJ1ZTsK
ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvbWlwcy9rZXJuZWwv
c2V0dXAuYwppbmRleCAyNzliZTAxNTNmOGIuLmYyMjcwNTI4MDExYiAxMDA2NDQKLS0tIGEvYXJj
aC9taXBzL2tlcm5lbC9zZXR1cC5jCisrKyBiL2FyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYwpAQCAt
MjksNiArMjksNyBAQAogI2luY2x1ZGUgPGxpbnV4L29mX2ZkdC5oPgogI2luY2x1ZGUgPGxpbnV4
L2RtaS5oPgogI2luY2x1ZGUgPGxpbnV4L2NyYXNoX2R1bXAuaD4KKyNpbmNsdWRlIDxsaW51eC9j
bWRsaW5lLmg+CiAKICNpbmNsdWRlIDxhc20vYWRkcnNwYWNlLmg+CiAjaW5jbHVkZSA8YXNtL2Jv
b3RpbmZvLmg+CkBAIC02NiwxMiArNjcsNiBAQCBFWFBPUlRfU1lNQk9MKG1pcHNfbWFjaHR5cGUp
Owogc3RhdGljIGNoYXIgX19pbml0ZGF0YSBjb21tYW5kX2xpbmVbQ09NTUFORF9MSU5FX1NJWkVd
OwogY2hhciBfX2luaXRkYXRhIGFyY3NfY21kbGluZVtDT01NQU5EX0xJTkVfU0laRV07CiAKLSNp
ZmRlZiBDT05GSUdfQ01ETElORV9CT09MCi1zdGF0aWMgY29uc3QgY2hhciBidWlsdGluX2NtZGxp
bmVbXSBfX2luaXRjb25zdCA9IENPTkZJR19DTURMSU5FOwotI2Vsc2UKLXN0YXRpYyBjb25zdCBj
aGFyIGJ1aWx0aW5fY21kbGluZVtdIF9faW5pdGNvbnN0ID0gIiI7Ci0jZW5kaWYKLQogLyoKICAq
IG1pcHNfaW9fcG9ydF9iYXNlIGlzIHRoZSBiZWdpbiBvZiB0aGUgYWRkcmVzcyBzcGFjZSB0byB3
aGljaCB4ODYgc3R5bGUKICAqIEkvTyBwb3J0cyBhcmUgbWFwcGVkLgpAQCAtNTQ2LDI4ICs1NDEs
NiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYm9vdGNtZGxpbmVfaW5pdCh2b2lkKQogewogCWJvb2wg
ZHRfYm9vdGFyZ3MgPSBmYWxzZTsKIAotCS8qCi0JICogSWYgQ01ETElORV9PVkVSUklERSBpcyBl
bmFibGVkIHRoZW4gaW5pdGlhbGl6aW5nIHRoZSBjb21tYW5kIGxpbmUgaXMKLQkgKiB0cml2aWFs
IC0gd2Ugc2ltcGx5IHVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIHVuY29uZGl0aW9uYWxs
eSAmCi0JICogdW5tb2RpZmllZC4KLQkgKi8KLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElO
RV9PVkVSUklERSkpIHsKLQkJc3RybGNweShib290X2NvbW1hbmRfbGluZSwgYnVpbHRpbl9jbWRs
aW5lLCBDT01NQU5EX0xJTkVfU0laRSk7Ci0JCXJldHVybjsKLQl9Ci0KLQkvKgotCSAqIElmIHRo
ZSB1c2VyIHNwZWNpZmllZCBhIGJ1aWx0LWluIGNvbW1hbmQgbGluZSAmCi0JICogTUlQU19DTURM
SU5FX0JVSUxUSU5fRVhURU5ELCB0aGVuIHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgaXMKLQkg
KiBwcmVwZW5kZWQgdG8gYXJndW1lbnRzIGZyb20gdGhlIGJvb3Rsb2FkZXIgb3IgRFQgc28gd2Un
bGwgY29weSB0aGVtCi0JICogdG8gdGhlIHN0YXJ0IG9mIGJvb3RfY29tbWFuZF9saW5lIGhlcmUu
IE90aGVyd2lzZSwgZW1wdHkKLQkgKiBib290X2NvbW1hbmRfbGluZSB0byB1bmRvIGFueXRoaW5n
IGVhcmx5X2luaXRfZHRfc2Nhbl9jaG9zZW4oKSBkaWQuCi0JICovCi0JaWYgKElTX0VOQUJMRUQo
Q09ORklHX01JUFNfQ01ETElORV9CVUlMVElOX0VYVEVORCkpCi0JCXN0cmxjcHkoYm9vdF9jb21t
YW5kX2xpbmUsIGJ1aWx0aW5fY21kbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOwotCWVsc2UKLQkJ
Ym9vdF9jb21tYW5kX2xpbmVbMF0gPSAwOwotCiAjaWZkZWYgQ09ORklHX09GX0VBUkxZX0ZMQVRU
UkVFCiAJLyoKIAkgKiBJZiB3ZSdyZSBjb25maWd1cmVkIHRvIHRha2UgYm9vdCBhcmd1bWVudHMg
ZnJvbSBEVCwgbG9vayBmb3IgdGhvc2UKQEAgLTU4NSwxNiArNTU4LDcgQEAgc3RhdGljIHZvaWQg
X19pbml0IGJvb3RjbWRsaW5lX2luaXQodm9pZCkKIAkgKiBwbGF0X21lbV9zZXR1cCgpIHNob3Vs
ZCBoYXZlIGZpbGxlZCBhcmNzX2NtZGxpbmUgd2l0aCBhcmd1bWVudHMgZnJvbQogCSAqIHRoZSBi
b290bG9hZGVyLgogCSAqLwotCWlmIChJU19FTkFCTEVEKENPTkZJR19NSVBTX0NNRExJTkVfRFRC
X0VYVEVORCkgfHwgIWR0X2Jvb3RhcmdzKQotCQlib290Y21kbGluZV9hcHBlbmQoYXJjc19jbWRs
aW5lLCBDT01NQU5EX0xJTkVfU0laRSk7Ci0KLQkvKgotCSAqIElmIHRoZSB1c2VyIHNwZWNpZmll
ZCBhIGJ1aWx0LWluIGNvbW1hbmQgbGluZSAmIHdlIGRpZG4ndCBhbHJlYWR5Ci0JICogcHJlcGVu
ZCBpdCwgd2UgYXBwZW5kIGl0IHRvIGJvb3RfY29tbWFuZF9saW5lIGhlcmUuCi0JICovCi0JaWYg
KElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQk9PTCkgJiYKLQkgICAgIUlTX0VOQUJMRUQoQ09O
RklHX01JUFNfQ01ETElORV9CVUlMVElOX0VYVEVORCkpCi0JCWJvb3RjbWRsaW5lX2FwcGVuZChi
dWlsdGluX2NtZGxpbmUsIENPTU1BTkRfTElORV9TSVpFKTsKKwljbWRsaW5lX2J1aWxkKGJvb3Rf
Y29tbWFuZF9saW5lLCBhcmNzX2NtZGxpbmUpOwogfQogCiAvKgpkaWZmIC0tZ2l0IGEvYXJjaC9t
aXBzL3BpYzMyL3BpYzMybXpkYS9lYXJseV9jb25zb2xlLmMgYi9hcmNoL21pcHMvcGljMzIvcGlj
MzJtemRhL2Vhcmx5X2NvbnNvbGUuYwppbmRleCAyNTM3MmU2Mjc4M2IuLjk0ZDNhNWJhNWUxMCAx
MDA2NDQKLS0tIGEvYXJjaC9taXBzL3BpYzMyL3BpYzMybXpkYS9lYXJseV9jb25zb2xlLmMKKysr
IGIvYXJjaC9taXBzL3BpYzMyL3BpYzMybXpkYS9lYXJseV9jb25zb2xlLmMKQEAgLTc1LDcgKzc1
LDcgQEAgc3RhdGljIGNoYXIgKiBfX2luaXQgcGljMzJfZ2V0Y21kbGluZSh2b2lkKQogCSAqIGFy
Y2hfbWVtX2luaXQoKSBoYXMgbm90IGJlZW4gY2FsbGVkIHlldCwgc28gd2UgZG9uJ3QgaGF2ZSBh
IHJlYWwKIAkgKiBjb21tYW5kIGxpbmUgc2V0dXAgaWYgdXNpbmcgQ09ORklHX0NNRExJTkVfQk9P
TC4KIAkgKi8KLSNpZmRlZiBDT05GSUdfQ01ETElORV9PVkVSUklERQorI2lmZGVmIENPTkZJR19D
TURMSU5FX0ZPUkNFCiAJcmV0dXJuIENPTkZJR19DTURMSU5FOwogI2Vsc2UKIAlyZXR1cm4gZndf
Z2V0Y21kbGluZSgpOwpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL3BpYzMyL3BpYzMybXpkYS9pbml0
LmMgYi9hcmNoL21pcHMvcGljMzIvcGljMzJtemRhL2luaXQuYwppbmRleCA3NjRmMmQwMjJmYWUu
LjM5ZmRhY2JiYWM1NiAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL3BpYzMyL3BpYzMybXpkYS9pbml0
LmMKKysrIGIvYXJjaC9taXBzL3BpYzMyL3BpYzMybXpkYS9pbml0LmMKQEAgLTQwLDkgKzQwLDcg
QEAgdm9pZCBfX2luaXQgcGxhdF9tZW1fc2V0dXAodm9pZCkKIAlwcl9pbmZvKCJGb3VuZCBmb2xs
b3dpbmcgY29tbWFuZCBsaW5lc1xuIik7CiAJcHJfaW5mbygiIGJvb3RfY29tbWFuZF9saW5lOiAl
c1xuIiwgYm9vdF9jb21tYW5kX2xpbmUpOwogCXByX2luZm8oIiBhcmNzX2NtZGxpbmUgICAgIDog
JXNcbiIsIGFyY3NfY21kbGluZSk7Ci0jaWZkZWYgQ09ORklHX0NNRExJTkVfQk9PTAogCXByX2lu
Zm8oIiBidWlsdGluX2NtZGxpbmUgIDogJXNcbiIsIENPTkZJR19DTURMSU5FKTsKLSNlbmRpZgog
CWlmIChkdGIgIT0gX19kdGJfc3RhcnQpCiAJCXN0cmxjcHkoYXJjc19jbWRsaW5lLCBib290X2Nv
bW1hbmRfbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOwogCi0tIAoyLjI1LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
