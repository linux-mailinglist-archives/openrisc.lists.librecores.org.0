Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C3AE3353251
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9621821349;
	Sat,  3 Apr 2021 06:19:03 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 84544212C8
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:18 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG01f94z9v2m6;
 Fri,  2 Apr 2021 17:18:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id swV5Eg2aMaDR; Fri,  2 Apr 2021 17:18:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG00Z8Wz9v2ls;
 Fri,  2 Apr 2021 17:18:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFA948BB7D;
 Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GNJUI4yPQWh2; Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D51D8BB7C;
 Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1A5C167989; Fri,  2 Apr 2021 15:18:17 +0000 (UTC)
Message-Id: <56269e717991d446112958ecf7340ce095b371a6.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:17 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 15/20] sh: Convert to GENERIC_CMDLINE
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
LS0tCnY0OiBSZXN0b3JlIHRoZSByZW1vdmVkICdlbmRtZW51JyBpbiBLY29uZmlnCi0tLQogYXJj
aC9zaC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI4ICstLS0tLS0tLS0t
LS0tLS0tLS0tLQogYXJjaC9zaC9jb25maWdzL2FwMzI1cnhhX2RlZmNvbmZpZyAgICAgICAgICB8
ICAyICstCiBhcmNoL3NoL2NvbmZpZ3MvZHJlYW1jYXN0X2RlZmNvbmZpZyAgICAgICAgIHwgIDIg
Ky0KIGFyY2gvc2gvY29uZmlncy9lY292ZWMyNC1yb21pbWFnZV9kZWZjb25maWcgfCAgMiArLQog
YXJjaC9zaC9jb25maWdzL2Vjb3ZlYzI0X2RlZmNvbmZpZyAgICAgICAgICB8ICAyICstCiBhcmNo
L3NoL2NvbmZpZ3MvZWRvc2s3NzYwX2RlZmNvbmZpZyAgICAgICAgIHwgIDIgKy0KIGFyY2gvc2gv
Y29uZmlncy9lc3B0X2RlZmNvbmZpZyAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9jb25m
aWdzL2oyX2RlZmNvbmZpZyAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3NoL2NvbmZpZ3Mv
a2ZyMnIwOS1yb21pbWFnZV9kZWZjb25maWcgIHwgIDIgKy0KIGFyY2gvc2gvY29uZmlncy9rZnIy
cjA5X2RlZmNvbmZpZyAgICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9jb25maWdzL2xib3hyZTJf
ZGVmY29uZmlnICAgICAgICAgICB8ICAyICstCiBhcmNoL3NoL2NvbmZpZ3MvbWljcm9kZXZfZGVm
Y29uZmlnICAgICAgICAgIHwgIDIgKy0KIGFyY2gvc2gvY29uZmlncy9taWdvcl9kZWZjb25maWcg
ICAgICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9jb25maWdzL3BvbGFyaXNfZGVmY29uZmlnICAg
ICAgICAgICB8ICAyICstCiBhcmNoL3NoL2NvbmZpZ3Mvcjc3ODBtcF9kZWZjb25maWcgICAgICAg
ICAgIHwgIDIgKy0KIGFyY2gvc2gvY29uZmlncy9yNzc4NXJwX2RlZmNvbmZpZyAgICAgICAgICAg
fCAgMiArLQogYXJjaC9zaC9jb25maWdzL3JzazcyMDFfZGVmY29uZmlnICAgICAgICAgICB8ICAy
ICstCiBhcmNoL3NoL2NvbmZpZ3MvcnNrNzIwM19kZWZjb25maWcgICAgICAgICAgIHwgIDIgKy0K
IGFyY2gvc2gvY29uZmlncy9ydHM3NzUxcjJkMV9kZWZjb25maWcgICAgICAgfCAgMiArLQogYXJj
aC9zaC9jb25maWdzL3J0czc3NTFyMmRwbHVzX2RlZmNvbmZpZyAgICB8ICAyICstCiBhcmNoL3No
L2NvbmZpZ3Mvc2RrNzc4MF9kZWZjb25maWcgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvc2gvY29u
Zmlncy9zZGs3Nzg2X2RlZmNvbmZpZyAgICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9jb25maWdz
L3NlNzIwNl9kZWZjb25maWcgICAgICAgICAgICB8ICAyICstCiBhcmNoL3NoL2NvbmZpZ3Mvc2U3
MzQzX2RlZmNvbmZpZyAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvc2gvY29uZmlncy9zZTc3MTJf
ZGVmY29uZmlnICAgICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9jb25maWdzL3NlNzcyMV9kZWZj
b25maWcgICAgICAgICAgICB8ICAyICstCiBhcmNoL3NoL2NvbmZpZ3Mvc2U3NzI0X2RlZmNvbmZp
ZyAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvc2gvY29uZmlncy9zZTc3NTFfZGVmY29uZmlnICAg
ICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9jb25maWdzL3NlNzc4MF9kZWZjb25maWcgICAgICAg
ICAgICB8ICAyICstCiBhcmNoL3NoL2NvbmZpZ3Mvc2gwM19kZWZjb25maWcgICAgICAgICAgICAg
IHwgIDIgKy0KIGFyY2gvc2gvY29uZmlncy9zaDIwMDdfZGVmY29uZmlnICAgICAgICAgICAgfCAg
MiArLQogYXJjaC9zaC9jb25maWdzL3NoNzc1N2xjcl9kZWZjb25maWcgICAgICAgICB8ICAyICst
CiBhcmNoL3NoL2NvbmZpZ3Mvc2g3NzYzcmRwX2RlZmNvbmZpZyAgICAgICAgIHwgIDIgKy0KIGFy
Y2gvc2gvY29uZmlncy9zaG1pbl9kZWZjb25maWcgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9z
aC9jb25maWdzL3NoeDNfZGVmY29uZmlnICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3NoL2Nv
bmZpZ3MvdGl0YW5fZGVmY29uZmlnICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvc2gvY29uZmln
cy91bDJfZGVmY29uZmlnICAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9zaC9rZXJuZWwvc2V0
dXAuYyAgICAgICAgICAgICAgICAgICAgICB8IDExICsrLS0tLS0tCiAzOCBmaWxlcyBjaGFuZ2Vk
LCAzOSBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3No
L0tjb25maWcgYi9hcmNoL3NoL0tjb25maWcKaW5kZXggZTc5OGU1NTkxNWMyLi45MmQ2YTQ0NDMx
NjYgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvS2NvbmZpZworKysgYi9hcmNoL3NoL0tjb25maWcKQEAg
LTE2LDYgKzE2LDcgQEAgY29uZmlnIFNVUEVSSAogCXNlbGVjdCBDUFVfTk9fRUZGSUNJRU5UX0ZG
UwogCXNlbGVjdCBETUFfREVDTEFSRV9DT0hFUkVOVAogCXNlbGVjdCBHRU5FUklDX0FUT01JQzY0
CisJc2VsZWN0IEdFTkVSSUNfQ01ETElORQogCXNlbGVjdCBHRU5FUklDX0NNT1NfVVBEQVRFIGlm
IFNIX1NIMDMgfHwgU0hfRFJFQU1DQVNUCiAJc2VsZWN0IEdFTkVSSUNfSURMRV9QT0xMX1NFVFVQ
CiAJc2VsZWN0IEdFTkVSSUNfSVJRX1NIT1cKQEAgLTc0MiwzMyArNzQzLDYgQEAgY29uZmlnIFJP
TUlNQUdFX01NQ0lGCiAJICBmaXJzdCBwYXJ0IG9mIHRoZSByb21JbWFnZSB3aGljaCBpbiB0dXJu
IGxvYWRzIHRoZSByZXN0IHRoZSBrZXJuZWwKIAkgIGltYWdlIHRvIFJBTSB1c2luZyB0aGUgTU1D
SUYgaGFyZHdhcmUgYmxvY2suCiAKLWNob2ljZQotCXByb21wdCAiS2VybmVsIGNvbW1hbmQgbGlu
ZSIKLQlvcHRpb25hbAotCWRlZmF1bHQgQ01ETElORV9PVkVSV1JJVEUKLQloZWxwCi0JICBTZXR0
aW5nIHRoaXMgb3B0aW9uIGFsbG93cyB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBhcmd1bWVudHMK
LQkgIHRvIGJlIHNldC4KLQotY29uZmlnIENNRExJTkVfT1ZFUldSSVRFCi0JYm9vbCAiT3Zlcndy
aXRlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKLQloZWxwCi0JICBHaXZlbiBzdHJpbmcg
d2lsbCBvdmVyd3JpdGUgYW55IGFyZ3VtZW50cyBwYXNzZWQgaW4gYnkKLQkgIGEgYm9vdGxvYWRl
ci4KLQotY29uZmlnIENNRExJTkVfRVhURU5ECi0JYm9vbCAiRXh0ZW5kIGJvb3Rsb2FkZXIga2Vy
bmVsIGFyZ3VtZW50cyIKLQloZWxwCi0JICBHaXZlbiBzdHJpbmcgd2lsbCBiZSBjb25jYXRlbmF0
ZWQgd2l0aCBhcmd1bWVudHMgcGFzc2VkIGluCi0JICBieSBhIGJvb3Rsb2FkZXIuCi0KLWVuZGNo
b2ljZQotCi1jb25maWcgQ01ETElORQotCXN0cmluZyAiS2VybmVsIGNvbW1hbmQgbGluZSBhcmd1
bWVudHMgc3RyaW5nIgotCWRlcGVuZHMgb24gQ01ETElORV9PVkVSV1JJVEUgfHwgQ01ETElORV9F
WFRFTkQKLQlkZWZhdWx0ICJjb25zb2xlPXR0eVNDMSwxMTUyMDAiCi0KIGVuZG1lbnUKIAogbWVu
dSAiQnVzIG9wdGlvbnMiCmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3MvYXAzMjVyeGFfZGVm
Y29uZmlnIGIvYXJjaC9zaC9jb25maWdzL2FwMzI1cnhhX2RlZmNvbmZpZwppbmRleCA1MTkzYjNl
MDk5YjkuLjM5OTdhYTQ5Yzc1YiAxMDA2NDQKLS0tIGEvYXJjaC9zaC9jb25maWdzL2FwMzI1cnhh
X2RlZmNvbmZpZworKysgYi9hcmNoL3NoL2NvbmZpZ3MvYXAzMjVyeGFfZGVmY29uZmlnCkBAIC0x
NSw3ICsxNSw3IEBAIENPTkZJR19TSF9BUDMyNVJYQT15CiBDT05GSUdfSElHSF9SRVNfVElNRVJT
PXkKIENPTkZJR19TRUNDT01QPXkKIENPTkZJR19QUkVFTVBUPXkKLUNPTkZJR19DTURMSU5FX09W
RVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29s
ZT10dHkxIGNvbnNvbGU9dHR5U0M1LDM4NDAwIHJvb3Q9L2Rldi9uZnMgaXA9ZGhjcCIKIENPTkZJ
R19ORVQ9eQogQ09ORklHX1BBQ0tFVD15CmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3MvZHJl
YW1jYXN0X2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9kcmVhbWNhc3RfZGVmY29uZmlnCmlu
ZGV4IDZhODJjN2I4ZmYzMi4uYWMwMzBjMWEzNTFlIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZp
Z3MvZHJlYW1jYXN0X2RlZmNvbmZpZworKysgYi9hcmNoL3NoL2NvbmZpZ3MvZHJlYW1jYXN0X2Rl
ZmNvbmZpZwpAQCAtMjIsNyArMjIsNyBAQCBDT05GSUdfTlJfRE1BX0NIQU5ORUxTX0JPT0w9eQog
Q09ORklHX05SX0RNQV9DSEFOTkVMUz05CiBDT05GSUdfU0VDQ09NUD15CiBDT05GSUdfUFJFRU1Q
VD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQog
Q09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MxLDExNTIwMCBwYW5pYz0zIgogQ09ORklHX01B
UExFPXkKIENPTkZJR19QQ0k9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL2Vjb3ZlYzI0
LXJvbWltYWdlX2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9lY292ZWMyNC1yb21pbWFnZV9k
ZWZjb25maWcKaW5kZXggNWM2MGU3MWQ4MzllLi5kYjc4ODU3YWUzMGYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvc2gvY29uZmlncy9lY292ZWMyNC1yb21pbWFnZV9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9j
b25maWdzL2Vjb3ZlYzI0LXJvbWltYWdlX2RlZmNvbmZpZwpAQCAtMTQsNyArMTQsNyBAQCBDT05G
SUdfRkxBVE1FTV9NQU5VQUw9eQogQ09ORklHX1NIX0VDT1ZFQz15CiAjIENPTkZJR19TSF9USU1F
Ul9UTVUgaXMgbm90IHNldAogQ09ORklHX0tFWEVDPXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklU
RT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10dHlT
QzAsMTE1MjAwIgogIyBDT05GSUdfU1VTUEVORCBpcyBub3Qgc2V0CiBDT05GSUdfTkVUPXkKZGlm
ZiAtLWdpdCBhL2FyY2gvc2gvY29uZmlncy9lY292ZWMyNF9kZWZjb25maWcgYi9hcmNoL3NoL2Nv
bmZpZ3MvZWNvdmVjMjRfZGVmY29uZmlnCmluZGV4IDAzY2I5MTY4MTlmYS4uZjZmN2QyZTE4NDBk
IDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3MvZWNvdmVjMjRfZGVmY29uZmlnCisrKyBiL2Fy
Y2gvc2gvY29uZmlncy9lY292ZWMyNF9kZWZjb25maWcKQEAgLTE2LDcgKzE2LDcgQEAgQ09ORklH
X1NIX0VDT1ZFQz15CiBDT05GSUdfSEVBUlRCRUFUPXkKIENPTkZJR19TRUNDT01QPXkKIENPTkZJ
R19QUkVFTVBUPXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElORV9G
T1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10dHkwLCBjb25zb2xlPXR0eVNDMCwxMTUy
MDAgcm9vdD0vZGV2L25mcyBpcD1kaGNwIG1lbT0yNDhNIG1lbWNodW5rLnZwdT04bSBtZW1jaHVu
ay52ZXUwPTRtIgogQ09ORklHX05FVD15CiBDT05GSUdfUEFDS0VUPXkKZGlmZiAtLWdpdCBhL2Fy
Y2gvc2gvY29uZmlncy9lZG9zazc3NjBfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL2Vkb3Nr
Nzc2MF9kZWZjb25maWcKaW5kZXggZDc3ZjU0ZTkwNmZkLi4xYWM4ZWI4OWM1NTAgMTAwNjQ0Ci0t
LSBhL2FyY2gvc2gvY29uZmlncy9lZG9zazc3NjBfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29u
Zmlncy9lZG9zazc3NjBfZGVmY29uZmlnCkBAIC0xOSw3ICsxOSw3IEBAIENPTkZJR19ISUdIX1JF
U19USU1FUlM9eQogQ09ORklHX1NIX0RNQT15CiBDT05GSUdfU0hfRE1BX0FQST15CiBDT05GSUdf
UFJFRU1QVD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9S
Q0U9eQogQ09ORklHX0NNRExJTkU9Im1lbT02NE0gY29uc29sZT10dHlTQzIsMTE1MjAwIHJvb3Q9
L2Rldi9uZnMgcncgbmZzcm9vdD0xOTIuMTY4LjAuMzovc2NyaXB0cy9maWxlc3lzIGlwPTE5Mi4x
NjguMC40IgogQ09ORklHX05FVD15CiBDT05GSUdfUEFDS0VUPXkKZGlmZiAtLWdpdCBhL2FyY2gv
c2gvY29uZmlncy9lc3B0X2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9lc3B0X2RlZmNvbmZp
ZwppbmRleCAyODA0Y2I3NjBhNzYuLjFiZmZhY2JhYmEzZCAxMDA2NDQKLS0tIGEvYXJjaC9zaC9j
b25maWdzL2VzcHRfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9lc3B0X2RlZmNvbmZp
ZwpAQCAtMTQsNyArMTQsNyBAQCBDT05GSUdfTUVNT1JZX1NUQVJUPTB4MGMwMDAwMDAKIENPTkZJ
R19TSF9FU1BUPXkKIENPTkZJR19TSF9QQ0xLX0ZSRVE9NjY2NjY2NjYKIENPTkZJR19TRUNDT01Q
PXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBD
T05GSUdfQ01ETElORT0iY29uc29sZT10dHlTQzAsMTE1MjAwIHJvb3Q9L2Rldi9uZnMgaXA9Ym9v
dHAiCiBDT05GSUdfTkVUPXkKIENPTkZJR19QQUNLRVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9j
b25maWdzL2oyX2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9qMl9kZWZjb25maWcKaW5kZXgg
MmViODFlYmUzODg4Li45ODNjNjJlOTM2ZWIgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvY29uZmlncy9q
Ml9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL2oyX2RlZmNvbmZpZwpAQCAtMTAsNyAr
MTAsNyBAQCBDT05GSUdfQ1BVX0JJR19FTkRJQU49eQogQ09ORklHX1NIX0RFVklDRV9UUkVFPXkK
IENPTkZJR19TSF9KQ09SRV9TT0M9eQogQ09ORklHX0haXzEwMD15Ci1DT05GSUdfQ01ETElORV9P
VkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNv
bGU9dHR5VUwwIGVhcmx5Y29uIgogQ09ORklHX0JJTkZNVF9FTEZfRkRQSUM9eQogQ09ORklHX0JJ
TkZNVF9GTEFUPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29uZmlncy9rZnIycjA5LXJvbWltYWdl
X2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9rZnIycjA5LXJvbWltYWdlX2RlZmNvbmZpZwpp
bmRleCAwNDQzNmI0ZmJkNzYuLjg0MThjMWYwYzFjZSAxMDA2NDQKLS0tIGEvYXJjaC9zaC9jb25m
aWdzL2tmcjJyMDktcm9taW1hZ2VfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9rZnIy
cjA5LXJvbWltYWdlX2RlZmNvbmZpZwpAQCAtMTUsNyArMTUsNyBAQCBDT05GSUdfU0hfS0ZSMlIw
OT15CiAjIENPTkZJR19TSF9USU1FUl9UTVUgaXMgbm90IHNldAogQ09ORklHX0haXzEwMD15CiBD
T05GSUdfS0VYRUM9eQotQ09ORklHX0NNRExJTkVfT1ZFUldSSVRFPXkKK0NPTkZJR19DTURMSU5F
X0ZPUkNFPXkKIENPTkZJR19DTURMSU5FPSJjb25zb2xlPXR0eVNDMSwxMTUyMDAgcXVpZXQiCiAj
IENPTkZJR19TVVNQRU5EIGlzIG5vdCBzZXQKIENPTkZJR19ORVQ9eQpkaWZmIC0tZ2l0IGEvYXJj
aC9zaC9jb25maWdzL2tmcjJyMDlfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL2tmcjJyMDlf
ZGVmY29uZmlnCmluZGV4IDgzMzQwNDQ5MGNmZS4uMGIwNGQxNzllYmJhIDEwMDY0NAotLS0gYS9h
cmNoL3NoL2NvbmZpZ3Mva2ZyMnIwOV9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL2tm
cjJyMDlfZGVmY29uZmlnCkBAIC0xOSw3ICsxOSw3IEBAIENPTkZJR19OT19IWj15CiBDT05GSUdf
SFpfMTAwMD15CiBDT05GSUdfS0VYRUM9eQogQ09ORklHX1BSRUVNUFQ9eQotQ09ORklHX0NNRExJ
TkVfT1ZFUldSSVRFPXkKK0NPTkZJR19DTURMSU5FX0ZPUkNFPXkKIENPTkZJR19DTURMSU5FPSJj
b25zb2xlPXR0eTAgY29uc29sZT10dHlTQzEsMTE1MjAwIgogIyBDT05GSUdfU1VTUEVORCBpcyBu
b3Qgc2V0CiBDT05GSUdfQ1BVX0lETEU9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL2xi
b3hyZTJfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL2xib3hyZTJfZGVmY29uZmlnCmluZGV4
IDA1ZTRhYzZmZWQ1Zi4uNDk4Yzg4OTUzZDJhIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mv
bGJveHJlMl9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL2xib3hyZTJfZGVmY29uZmln
CkBAIC0xMiw3ICsxMiw3IEBAIENPTkZJR19GTEFUTUVNX01BTlVBTD15CiBDT05GSUdfU0hfTEJP
WF9SRTI9eQogQ09ORklHX1NIX1BDTEtfRlJFUT00MDAwMDAwMAogQ09ORklHX0tFWEVDPXkKLUNP
TkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdf
Q01ETElORT0iY29uc29sZT10dHlTQzEsMTE1MjAwIHJvb3Q9L2Rldi9zZGExIgogQ09ORklHX1BD
ST15CiBDT05GSUdfUENDQVJEPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29uZmlncy9taWNyb2Rl
dl9kZWZjb25maWcgYi9hcmNoL3NoL2NvbmZpZ3MvbWljcm9kZXZfZGVmY29uZmlnCmluZGV4IGU5
ODI1MTk2ZGQ2Ni4uODQ2N2RlMWQzMDkyIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3MvbWlj
cm9kZXZfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9taWNyb2Rldl9kZWZjb25maWcK
QEAgLTExLDcgKzExLDcgQEAgQ09ORklHX1NIX0RNQT15CiBDT05GSUdfU0hfRE1BX0FQST15CiBD
T05GSUdfSEVBUlRCRUFUPXkKIENPTkZJR19QUkVFTVBUPXkKLUNPTkZJR19DTURMSU5FX09WRVJX
UklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10
dHlTQzAsMTE1MjAwIHJvb3Q9L2Rldi9oZGExIgogQ09ORklHX1NVUEVSSFlXQVk9eQogQ09ORklH
X05FVD15CmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3MvbWlnb3JfZGVmY29uZmlnIGIvYXJj
aC9zaC9jb25maWdzL21pZ29yX2RlZmNvbmZpZwppbmRleCA0ODU5Y2QzMGNmYzQuLmU0M2ZiMmE2
M2YxZiAxMDA2NDQKLS0tIGEvYXJjaC9zaC9jb25maWdzL21pZ29yX2RlZmNvbmZpZworKysgYi9h
cmNoL3NoL2NvbmZpZ3MvbWlnb3JfZGVmY29uZmlnCkBAIC0xNSw3ICsxNSw3IEBAIENPTkZJR19O
VU1BPXkKIENPTkZJR19TSF9NSUdPUj15CiAjIENPTkZJR19TSF9USU1FUl9DTVQgaXMgbm90IHNl
dAogQ09ORklHX1NFQ0NPTVA9eQotQ09ORklHX0NNRExJTkVfT1ZFUldSSVRFPXkKK0NPTkZJR19D
TURMSU5FX0ZPUkNFPXkKIENPTkZJR19DTURMSU5FPSJjb25zb2xlPXR0eTAgY29uc29sZT10dHlT
QzAsMTE1MjAwIGVhcmx5cHJpbnRrPXNlcmlhbCBpcD1vbiByb290PS9kZXYvbmZzIGlwPWRoY3Ai
CiBDT05GSUdfTkVUPXkKIENPTkZJR19QQUNLRVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25m
aWdzL3BvbGFyaXNfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL3BvbGFyaXNfZGVmY29uZmln
CmluZGV4IDI0NjQwOGVjNzQ2Mi4uMmZjMmJkYzBlMDAyIDEwMDY0NAotLS0gYS9hcmNoL3NoL2Nv
bmZpZ3MvcG9sYXJpc19kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3BvbGFyaXNfZGVm
Y29uZmlnCkBAIC0yNSw3ICsyNSw3IEBAIENPTkZJR19TSF9ETUFfQVBJPXkKIENPTkZJR19IRUFS
VEJFQVQ9eQogQ09ORklHX0haXzEwMD15CiBDT05GSUdfUFJFRU1QVD15Ci1DT05GSUdfQ01ETElO
RV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNv
bnNvbGU9dHR5U0MxLDExNTIwMCByb290PS9kZXYvbXRkYmxvY2syIHJvb3Rmc3R5cGU9amZmczIg
bWVtPTYzTSBtdGRwYXJ0cz1waHlzbWFwLWZsYXNoLjA6MHgwMDEwMDAwMChib290bG9hZGVyKXJv
LDB4MDA1MDAwMDAoS2VybmVsKXJvLDB4MDBBMDAwMDAoRmlsZXN5c3RlbSkiCiBDT05GSUdfTkVU
PXkKIENPTkZJR19QQUNLRVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3I3NzgwbXBf
ZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL3I3NzgwbXBfZGVmY29uZmlnCmluZGV4IGY4MjNj
YzZiMThmOS4uOWUyNDM4MTE0ODkwIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvcjc3ODBt
cF9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3I3NzgwbXBfZGVmY29uZmlnCkBAIC0y
MCw3ICsyMCw3IEBAIENPTkZJR19TSF9QQ0xLX0ZSRVE9MzMzMzMzMzMKIENPTkZJR19QVVNIX1NX
SVRDSD15CiBDT05GSUdfS0VYRUM9eQogQ09ORklHX1BSRUVNUFQ9eQotQ09ORklHX0NNRExJTkVf
T1ZFUldSSVRFPXkKK0NPTkZJR19DTURMSU5FX0ZPUkNFPXkKIENPTkZJR19DTURMSU5FPSJjb25z
b2xlPXR0eVNDMCwxMTUyMDAgcm9vdD0vZGV2L3NkYTEiCiBDT05GSUdfUENJPXkKIENPTkZJR19O
RVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3I3Nzg1cnBfZGVmY29uZmlnIGIvYXJj
aC9zaC9jb25maWdzL3I3Nzg1cnBfZGVmY29uZmlnCmluZGV4IGY5NmJjMjBkNGIxYS4uYzFjOTJm
MTU0Njk0IDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvcjc3ODVycF9kZWZjb25maWcKKysr
IGIvYXJjaC9zaC9jb25maWdzL3I3Nzg1cnBfZGVmY29uZmlnCkBAIC0yNiw3ICsyNiw3IEBAIENP
TkZJR19IRUFSVEJFQVQ9eQogQ09ORklHX1BVU0hfU1dJVENIPXkKIENPTkZJR19LRVhFQz15CiBD
T05GSUdfUFJFRU1QVD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJ
TkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MwLDExNTIwMCByb290PS9k
ZXYvc2RhMSIKIENPTkZJR19QQ0k9eQogQ09ORklHX0JJTkZNVF9NSVNDPW0KZGlmZiAtLWdpdCBh
L2FyY2gvc2gvY29uZmlncy9yc2s3MjAxX2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9yc2s3
MjAxX2RlZmNvbmZpZwppbmRleCBlNDE1MjYxMjBiZTEuLjY1ZjNkNjk1YmM3OCAxMDA2NDQKLS0t
IGEvYXJjaC9zaC9jb25maWdzL3JzazcyMDFfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmln
cy9yc2s3MjAxX2RlZmNvbmZpZwpAQCAtMjEsNyArMjEsNyBAQCBDT05GSUdfQ1BVX0JJR19FTkRJ
QU49eQogQ09ORklHX1NIX1JTSz15CiBDT05GSUdfU0hfUENMS19GUkVRPTQwMDAwMDAwCiBDT05G
SUdfSFpfMTAwMD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVf
Rk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MwLDExNTIwMCBlYXJseXByaW50
az1zZXJpYWwgaWdub3JlX2xvZ2xldmVsIgogQ09ORklHX0JJTkZNVF9GTEFUPXkKIENPTkZJR19C
SU5GTVRfWkZMQVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3JzazcyMDNfZGVmY29u
ZmlnIGIvYXJjaC9zaC9jb25maWdzL3JzazcyMDNfZGVmY29uZmlnCmluZGV4IDZhZjA4ZmExZGRm
OC4uMzNmNjA4YzU0Yjg1IDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3MvcnNrNzIwM19kZWZj
b25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3JzazcyMDNfZGVmY29uZmlnCkBAIC0yNiw3ICsy
Niw3IEBAIENPTkZJR19DUFVfRlJFUT15CiBDT05GSUdfU0hfQ1BVX0ZSRVE9eQogQ09ORklHX0hF
QVJUQkVBVD15CiBDT05GSUdfSFpfMTAwMD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQor
Q09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MwLDEx
NTIwMCBlYXJseXByaW50az1zZXJpYWwgaWdub3JlX2xvZ2xldmVsIgogQ09ORklHX0JJTkZNVF9G
TEFUPXkKIENPTkZJR19CSU5GTVRfWkZMQVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdz
L3J0czc3NTFyMmQxX2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9ydHM3NzUxcjJkMV9kZWZj
b25maWcKaW5kZXggOTYyNjNhNDkxMmI3Li4xMzE2OTlhNmRhYTcgMTAwNjQ0Ci0tLSBhL2FyY2gv
c2gvY29uZmlncy9ydHM3NzUxcjJkMV9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3J0
czc3NTFyMmQxX2RlZmNvbmZpZwpAQCAtMTEsNyArMTEsNyBAQCBDT05GSUdfRkxBVE1FTV9NQU5V
QUw9eQogQ09ORklHX1NIX1JUUzc3NTFSMkQ9eQogQ09ORklHX1JUUzc3NTFSMkRfMT15CiBDT05G
SUdfSEVBUlRCRUFUPXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElO
RV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10dHkwIGNvbnNvbGU9dHR5U0MxLDEx
NTIwMCByb290PS9kZXYvc2RhMSIKIENPTkZJR19QQ0k9eQogQ09ORklHX0hPVFBMVUdfUENJPXkK
ZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29uZmlncy9ydHM3NzUxcjJkcGx1c19kZWZjb25maWcgYi9h
cmNoL3NoL2NvbmZpZ3MvcnRzNzc1MXIyZHBsdXNfZGVmY29uZmlnCmluZGV4IDkyZTU4NmU2Yzk3
NC4uZmZhNzZhZDhlZmFhIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3MvcnRzNzc1MXIyZHBs
dXNfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9ydHM3NzUxcjJkcGx1c19kZWZjb25m
aWcKQEAgLTExLDcgKzExLDcgQEAgQ09ORklHX0ZMQVRNRU1fTUFOVUFMPXkKIENPTkZJR19TSF9S
VFM3NzUxUjJEPXkKIENPTkZJR19SVFM3NzUxUjJEX1BMVVM9eQogQ09ORklHX0hFQVJUQkVBVD15
Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09O
RklHX0NNRExJTkU9ImNvbnNvbGU9dHR5MCBjb25zb2xlPXR0eVNDMSwxMTUyMDAgcm9vdD0vZGV2
L3NkYTEiCiBDT05GSUdfUENJPXkKIENPTkZJR19IT1RQTFVHX1BDST15CmRpZmYgLS1naXQgYS9h
cmNoL3NoL2NvbmZpZ3Mvc2RrNzc4MF9kZWZjb25maWcgYi9hcmNoL3NoL2NvbmZpZ3Mvc2RrNzc4
MF9kZWZjb25maWcKaW5kZXggNmM3MTlhYjQzMzJhLi5hMzNmODFjNDFhMTMgMTAwNjQ0Ci0tLSBh
L2FyY2gvc2gvY29uZmlncy9zZGs3NzgwX2RlZmNvbmZpZworKysgYi9hcmNoL3NoL2NvbmZpZ3Mv
c2RrNzc4MF9kZWZjb25maWcKQEAgLTIyLDcgKzIyLDcgQEAgQ09ORklHX1NIX0RNQT15CiBDT05G
SUdfU0hfRE1BX0FQST15CiBDT05GSUdfSEVBUlRCRUFUPXkKIENPTkZJR19QUkVFTVBUPXkKLUNP
TkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdf
Q01ETElORT0ibWVtPTEyOE0gY29uc29sZT10dHkwIGNvbnNvbGU9dHR5U0MwLDExNTIwMCBpcD1i
b290cCByb290PS9kZXYvbmZzIG5mc3Jvb3Q9MTkyLjE2OC4wLjE6L2hvbWUvcm9vdGZzIgogQ09O
RklHX1BDST15CiBDT05GSUdfUENJX0RFQlVHPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29uZmln
cy9zZGs3Nzg2X2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9zZGs3Nzg2X2RlZmNvbmZpZwpp
bmRleCBmNzc2YTFkMGQyNzcuLjFkYWYzZGJmZmMxNiAxMDA2NDQKLS0tIGEvYXJjaC9zaC9jb25m
aWdzL3Nkazc3ODZfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9zZGs3Nzg2X2RlZmNv
bmZpZwpAQCAtNzAsNyArNzAsNyBAQCBDT05GSUdfSE9UUExVR19DUFU9eQogQ09ORklHX1BSRUVN
UFQ9eQogQ09ORklHX0lOVENfVVNFUklNQVNLPXkKIENPTkZJR19JTlRDX0JBTEFOQ0lORz15Ci1D
T05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklH
X0NNRExJTkU9ImNvbnNvbGU9dHR5U0MxLDExNTIwMCBlYXJseXByaW50az1zaC1zY2kuMSwxMTUy
MDAgcm9vdD0vZGV2L3NkYTEgbm1pX2RlYnVnPXN0YXRlLGRlYm91bmNlIHJvb3RkZWxheT01IHBt
Yj1pb21hcCBpZ25vcmVfbG9nbGV2ZWwiCiBDT05GSUdfUENJPXkKIENPTkZJR19QQ0lFUE9SVEJV
Uz15CmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3Mvc2U3MjA2X2RlZmNvbmZpZyBiL2FyY2gv
c2gvY29uZmlncy9zZTcyMDZfZGVmY29uZmlnCmluZGV4IDMxNWIwNGE4ZGQyZi4uYzcyOWRkYjVk
MmM4IDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvc2U3MjA2X2RlZmNvbmZpZworKysgYi9h
cmNoL3NoL2NvbmZpZ3Mvc2U3MjA2X2RlZmNvbmZpZwpAQCAtMzYsNyArMzYsNyBAQCBDT05GSUdf
U0hfQ1BVX0ZSRVE9eQogQ09ORklHX0hFQVJUQkVBVD15CiBDT05GSUdfSFpfMTAwMD15CiBDT05G
SUdfUFJFRU1QVD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVf
Rk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MzLDExNTIwMCBpZ25vcmVfbG9n
bGV2ZWwgZWFybHlwcmludGs9c2VyaWFsIgogQ09ORklHX0JJTkZNVF9GTEFUPXkKIENPTkZJR19C
SU5GTVRfWkZMQVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3NlNzM0M19kZWZjb25m
aWcgYi9hcmNoL3NoL2NvbmZpZ3Mvc2U3MzQzX2RlZmNvbmZpZwppbmRleCA1ZDZjMTkzMzhlYmYu
LjMyZmVkZmQ4YWU4MSAxMDA2NDQKLS0tIGEvYXJjaC9zaC9jb25maWdzL3NlNzM0M19kZWZjb25m
aWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3NlNzM0M19kZWZjb25maWcKQEAgLTE3LDcgKzE3LDcg
QEAgQ09ORklHX0ZMQVRNRU1fTUFOVUFMPXkKIENPTkZJR19TSF83MzQzX1NPTFVUSU9OX0VOR0lO
RT15CiAjIENPTkZJR19TSF9USU1FUl9DTVQgaXMgbm90IHNldAogQ09ORklHX0hFQVJUQkVBVD15
Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09O
RklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MwLDExNTIwMCIKIENPTkZJR19ORVQ9eQogQ09ORklH
X1BBQ0tFVD15CmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3Mvc2U3NzEyX2RlZmNvbmZpZyBi
L2FyY2gvc2gvY29uZmlncy9zZTc3MTJfZGVmY29uZmlnCmluZGV4IGVlNmQyOGFlMDhkZS4uMDJh
OGRjYjg5OGRiIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvc2U3NzEyX2RlZmNvbmZpZwor
KysgYi9hcmNoL3NoL2NvbmZpZ3Mvc2U3NzEyX2RlZmNvbmZpZwpAQCAtMjIsNyArMjIsNyBAQCBD
T05GSUdfU0hfU09MVVRJT05fRU5HSU5FPXkKIENPTkZJR19TSF9QQ0xLX0ZSRVE9NjY2NjY2NjYK
IENPTkZJR19IRUFSVEJFQVQ9eQogQ09ORklHX1BSRUVNUFRfVk9MVU5UQVJZPXkKLUNPTkZJR19D
TURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElO
RT0iY29uc29sZT10dHlTQzAsMTE1MjAwIHJvb3Q9L2Rldi9zZGExIgogQ09ORklHX05FVD15CiBD
T05GSUdfUEFDS0VUPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29uZmlncy9zZTc3MjFfZGVmY29u
ZmlnIGIvYXJjaC9zaC9jb25maWdzL3NlNzcyMV9kZWZjb25maWcKaW5kZXggYmFkOTIxYmMxMGY4
Li5hMGNlNmVjYTNiZjUgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvY29uZmlncy9zZTc3MjFfZGVmY29u
ZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9zZTc3MjFfZGVmY29uZmlnCkBAIC0yMiw3ICsyMiw3
IEBAIENPTkZJR19TSF83NzIxX1NPTFVUSU9OX0VOR0lORT15CiBDT05GSUdfU0hfUENMS19GUkVR
PTMzMzMzMzMzCiBDT05GSUdfSEVBUlRCRUFUPXkKIENPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWT15
Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09O
RklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MwLDExNTIwMCByb290PS9kZXYvc2RhMiIKIENPTkZJ
R19ORVQ9eQogQ09ORklHX1BBQ0tFVD15CmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3Mvc2U3
NzI0X2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9zZTc3MjRfZGVmY29uZmlnCmluZGV4IGEy
NmY3ZjE4NDFjNy4uOWNkNTBhY2Q5NTlkIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvc2U3
NzI0X2RlZmNvbmZpZworKysgYi9hcmNoL3NoL2NvbmZpZ3Mvc2U3NzI0X2RlZmNvbmZpZwpAQCAt
MTcsNyArMTcsNyBAQCBDT05GSUdfU0hfRE1BX0FQST15CiBDT05GSUdfSEVBUlRCRUFUPXkKIENP
TkZJR19TRUNDT01QPXkKIENPTkZJR19QUkVFTVBUPXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklU
RT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10dHkx
IGNvbnNvbGU9dHR5U0MzLDExNTIwMCByb290PS9kZXYvbmZzIGlwPWRoY3AgbWVtY2h1bmsudnB1
PTRtIgogQ09ORklHX05FVD15CiBDT05GSUdfUEFDS0VUPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gv
Y29uZmlncy9zZTc3NTFfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL3NlNzc1MV9kZWZjb25m
aWcKaW5kZXggNGEwMjQwNjViYjc1Li44YzJiZWIzNjc3ZTIgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gv
Y29uZmlncy9zZTc3NTFfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9zZTc3NTFfZGVm
Y29uZmlnCkBAIC0xMiw3ICsxMiw3IEBAIENPTkZJR19NRU1PUllfU1RBUlQ9MHgwYzAwMDAwMAog
Q09ORklHX0ZMQVRNRU1fTUFOVUFMPXkKIENPTkZJR19TSF83NzUxX1NPTFVUSU9OX0VOR0lORT15
CiBDT05GSUdfSEVBUlRCRUFUPXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdf
Q01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10dHlTQzEsMzg0MDAiCiBD
T05GSUdfTkVUPXkKIENPTkZJR19QQUNLRVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdz
L3NlNzc4MF9kZWZjb25maWcgYi9hcmNoL3NoL2NvbmZpZ3Mvc2U3NzgwX2RlZmNvbmZpZwppbmRl
eCBkY2Q4NWI4NThhYzguLjNiZTIzZjY1YzM4ZSAxMDA2NDQKLS0tIGEvYXJjaC9zaC9jb25maWdz
L3NlNzc4MF9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3NlNzc4MF9kZWZjb25maWcK
QEAgLTE0LDcgKzE0LDcgQEAgQ09ORklHX01FTU9SWV9TSVpFPTB4MDgwMDAwMDAKIENPTkZJR19T
SF83NzgwX1NPTFVUSU9OX0VOR0lORT15CiBDT05GSUdfU0hfUENMS19GUkVRPTMzMzMzMzMzCiBD
T05GSUdfSEVBUlRCRUFUPXkKLUNPTkZJR19DTURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01E
TElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29sZT10dHlTQzAsMTE1MjAwIHJvb3Q9
L2Rldi9zZGExIgogQ09ORklHX1BDST15CiBDT05GSUdfTkVUPXkKZGlmZiAtLWdpdCBhL2FyY2gv
c2gvY29uZmlncy9zaDAzX2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9zaDAzX2RlZmNvbmZp
ZwppbmRleCBmZjUwMjY4MzEzMmUuLjg3ZTk4MDViNzZkMCAxMDA2NDQKLS0tIGEvYXJjaC9zaC9j
b25maWdzL3NoMDNfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9zaDAzX2RlZmNvbmZp
ZwpAQCAtMTYsNyArMTYsNyBAQCBDT05GSUdfRkxBVE1FTV9NQU5VQUw9eQogQ09ORklHX1NIX1NI
MDM9eQogQ09ORklHX0hFQVJUQkVBVD15CiBDT05GSUdfUFJFRU1QVD15Ci1DT05GSUdfQ01ETElO
RV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNv
bnNvbGU9dHR5U0MxLDExNTIwMCBtZW09NjRNIHJvb3Q9L2Rldi9uZnMiCiBDT05GSUdfUENJPXkK
IENPTkZJR19IT1RQTFVHX1BDST15CmRpZmYgLS1naXQgYS9hcmNoL3NoL2NvbmZpZ3Mvc2gyMDA3
X2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy9zaDIwMDdfZGVmY29uZmlnCmluZGV4IDk5OTc1
ZGI0NjFkOC4uOGU5MmM1ODMxNmRiIDEwMDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvc2gyMDA3
X2RlZmNvbmZpZworKysgYi9hcmNoL3NoL2NvbmZpZ3Mvc2gyMDA3X2RlZmNvbmZpZwpAQCAtMjAs
NyArMjAsNyBAQCBDT05GSUdfU0hfRE1BPXkKIENPTkZJR19TSF9ETUFfQVBJPXkKIENPTkZJR19O
Ul9ETUFfQ0hBTk5FTFNfQk9PTD15CiBDT05GSUdfSFpfMTAwPXkKLUNPTkZJR19DTURMSU5FX09W
RVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElORT0iY29uc29s
ZT10dHlTQzEsMTE1MjAwIGlwPWRoY3Agcm9vdD0vZGV2L25mcyBydyBuZnNyb290PS9uZnMvcm9v
dGZzLHJzaXplPTEwMjQsd3NpemU9MTAyNCBlYXJseXByaW50az1zaC1zY2kuMSIKIENPTkZJR19Q
Q0NBUkQ9eQogQ09ORklHX0JJTkZNVF9NSVNDPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29uZmln
cy9zaDc3NTdsY3JfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL3NoNzc1N2xjcl9kZWZjb25m
aWcKaW5kZXggYTI3MDBhYjE2NWFmLi5hMTU4NzdkYWZmMTYgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gv
Y29uZmlncy9zaDc3NTdsY3JfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9zaDc3NTds
Y3JfZGVmY29uZmlnCkBAIC0yMSw3ICsyMSw3IEBAIENPTkZJR19GTEFUTUVNX01BTlVBTD15CiBD
T05GSUdfU0hfU0g3NzU3TENSPXkKIENPTkZJR19IRUFSVEJFQVQ9eQogQ09ORklHX1NFQ0NPTVA9
eQotQ09ORklHX0NNRExJTkVfT1ZFUldSSVRFPXkKK0NPTkZJR19DTURMSU5FX0ZPUkNFPXkKIENP
TkZJR19DTURMSU5FPSJjb25zb2xlPXR0eVNDMiwxMTUyMDAgcm9vdD0vZGV2L25mcyBpcD1kaGNw
IgogQ09ORklHX05FVD15CiBDT05GSUdfUEFDS0VUPXkKZGlmZiAtLWdpdCBhL2FyY2gvc2gvY29u
Zmlncy9zaDc3NjNyZHBfZGVmY29uZmlnIGIvYXJjaC9zaC9jb25maWdzL3NoNzc2M3JkcF9kZWZj
b25maWcKaW5kZXggOGE2YTQ0NmY5ZWI4Li4zNTFjY2FiYWM4YTYgMTAwNjQ0Ci0tLSBhL2FyY2gv
c2gvY29uZmlncy9zaDc3NjNyZHBfZGVmY29uZmlnCisrKyBiL2FyY2gvc2gvY29uZmlncy9zaDc3
NjNyZHBfZGVmY29uZmlnCkBAIC0xNCw3ICsxNCw3IEBAIENPTkZJR19NRU1PUllfU1RBUlQ9MHgw
YzAwMDAwMAogQ09ORklHX1NIX1NINzc2M1JEUD15CiBDT05GSUdfU0hfUENMS19GUkVRPTY2NjY2
NjY2CiBDT05GSUdfU0VDQ09NUD15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklH
X0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MyLDExNTIwMCBy
b290PS9kZXYvc2RhMSByb290ZGVsYXk9MTAiCiBDT05GSUdfTkVUPXkKIENPTkZJR19QQUNLRVQ9
eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3NobWluX2RlZmNvbmZpZyBiL2FyY2gvc2gv
Y29uZmlncy9zaG1pbl9kZWZjb25maWcKaW5kZXggYzBiNmY0MGQwMWNjLi43Y2M4NzI1OTUxZjUg
MTAwNjQ0Ci0tLSBhL2FyY2gvc2gvY29uZmlncy9zaG1pbl9kZWZjb25maWcKKysrIGIvYXJjaC9z
aC9jb25maWdzL3NobWluX2RlZmNvbmZpZwpAQCAtMTgsNyArMTgsNyBAQCBDT05GSUdfRkxBVE1F
TV9NQU5VQUw9eQogIyBDT05GSUdfU0hfQURDIGlzIG5vdCBzZXQKIENPTkZJR19TSF9TSE1JTj15
CiBDT05GSUdfU0hfUENMS19GUkVRPTMyMDAwMDAwCi1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9
eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0Mx
LDExNTIwMCByb290PTFmMDEgbXRkcGFydHM9cGh5c19tYXBwZWRfZmxhc2g6NjRrKGZpcm0pcm8s
LShzeXMpIG5ldGRldj0zNCwweDMwMCxldGgwICIKIENPTkZJR19ORVQ9eQogQ09ORklHX1VOSVg9
eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3NoeDNfZGVmY29uZmlnIGIvYXJjaC9zaC9j
b25maWdzL3NoeDNfZGVmY29uZmlnCmluZGV4IDMyZWM2ZWIxZWFiYy4uMzZjYWMzMDY3Y2VmIDEw
MDY0NAotLS0gYS9hcmNoL3NoL2NvbmZpZ3Mvc2h4M19kZWZjb25maWcKKysrIGIvYXJjaC9zaC9j
b25maWdzL3NoeDNfZGVmY29uZmlnCkBAIC00Nyw3ICs0Nyw3IEBAIENPTkZJR19LRVhFQz15CiBD
T05GSUdfU0VDQ09NUD15CiBDT05GSUdfU01QPXkKIENPTkZJR19QUkVFTVBUPXkKLUNPTkZJR19D
TURMSU5FX09WRVJXUklURT15CitDT05GSUdfQ01ETElORV9GT1JDRT15CiBDT05GSUdfQ01ETElO
RT0iY29uc29sZT10dHlTQzAsMTE1MjAwIGVhcmx5cHJpbnRrPWJpb3MgaWdub3JlX2xvZ2xldmVs
IgogQ09ORklHX0JJTkZNVF9NSVNDPXkKIENPTkZJR19ORVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9z
aC9jb25maWdzL3RpdGFuX2RlZmNvbmZpZyBiL2FyY2gvc2gvY29uZmlncy90aXRhbl9kZWZjb25m
aWcKaW5kZXggYmE4ODdmMTM1MWJlLi41YWE1MTNkNTRkZjAgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gv
Y29uZmlncy90aXRhbl9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25maWdzL3RpdGFuX2RlZmNv
bmZpZwpAQCAtMjAsNyArMjAsNyBAQCBDT05GSUdfU0hfUENMS19GUkVRPTMwMDAwMDAwCiBDT05G
SUdfU0hfRE1BPXkKIENPTkZJR19TSF9ETUFfQVBJPXkKIENPTkZJR19QUkVFTVBUX1ZPTFVOVEFS
WT15Ci1DT05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQog
Q09ORklHX0NNRExJTkU9ImNvbnNvbGU9dHR5U0MxLDM4NDAwTjgxIHJvb3Q9L2Rldi9uZnMgaXA9
Ojo6OjpldGgxOmF1dG9jb25mIHJ3IgogQ09ORklHX1BDST15CiBDT05GSUdfSE9UUExVR19QQ0k9
eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9jb25maWdzL3VsMl9kZWZjb25maWcgYi9hcmNoL3NoL2Nv
bmZpZ3MvdWwyX2RlZmNvbmZpZwppbmRleCAxMDNiODFlYzFmZmIuLjhkOGI2Nzg3MzAyZiAxMDA2
NDQKLS0tIGEvYXJjaC9zaC9jb25maWdzL3VsMl9kZWZjb25maWcKKysrIGIvYXJjaC9zaC9jb25m
aWdzL3VsMl9kZWZjb25maWcKQEAgLTE4LDcgKzE4LDcgQEAgQ09ORklHX0hJR0hfUkVTX1RJTUVS
Uz15CiBDT05GSUdfSFpfMTAwPXkKIENPTkZJR19LRVhFQz15CiBDT05GSUdfUFJFRU1QVD15Ci1D
T05GSUdfQ01ETElORV9PVkVSV1JJVEU9eQorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQogQ09ORklH
X0NNRExJTkU9ImNvbnNvbGU9dHR5U0MwLDExNTIwMCByb290PS9kZXYvbmZzIGlwPWRoY3AiCiBD
T05GSUdfTkVUPXkKIENPTkZJR19QQUNLRVQ9eQpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9rZXJuZWwv
c2V0dXAuYyBiL2FyY2gvc2gva2VybmVsL3NldHVwLmMKaW5kZXggNDE0NGJlNjUwZDQxLi40NjRj
Y2JiZDgyMDUgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gva2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC9z
aC9rZXJuZWwvc2V0dXAuYwpAQCAtMzIsNiArMzIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L29mLmg+
CiAjaW5jbHVkZSA8bGludXgvb2ZfZmR0Lmg+CiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgor
I2luY2x1ZGUgPGxpbnV4L2NtZGxpbmUuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L21vdW50Lmg+
CiAjaW5jbHVkZSA8YXNtL2lvLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KQEAgLTMwNiwxNSAr
MzA3LDcgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQogCWJzc19y
ZXNvdXJjZS5zdGFydCA9IHZpcnRfdG9fcGh5cyhfX2Jzc19zdGFydCk7CiAJYnNzX3Jlc291cmNl
LmVuZCA9IHZpcnRfdG9fcGh5cyhfX2Jzc19zdG9wKS0xOwogCi0jaWZkZWYgQ09ORklHX0NNRExJ
TkVfT1ZFUldSSVRFCi0Jc3RybGNweShjb21tYW5kX2xpbmUsIENPTkZJR19DTURMSU5FLCBzaXpl
b2YoY29tbWFuZF9saW5lKSk7Ci0jZWxzZQotCXN0cmxjcHkoY29tbWFuZF9saW5lLCBDT01NQU5E
X0xJTkUsIHNpemVvZihjb21tYW5kX2xpbmUpKTsKLSNpZmRlZiBDT05GSUdfQ01ETElORV9FWFRF
TkQKLQlzdHJsY2F0KGNvbW1hbmRfbGluZSwgIiAiLCBzaXplb2YoY29tbWFuZF9saW5lKSk7Ci0J
c3RybGNhdChjb21tYW5kX2xpbmUsIENPTkZJR19DTURMSU5FLCBzaXplb2YoY29tbWFuZF9saW5l
KSk7Ci0jZW5kaWYKLSNlbmRpZgorCWNtZGxpbmVfYnVpbGQoY29tbWFuZF9saW5lLCBDT01NQU5E
X0xJTkUpOwogCiAJLyogU2F2ZSB1bnBhcnNlZCBjb21tYW5kIGxpbmUgY29weSBmb3IgL3Byb2Mv
Y21kbGluZSAqLwogCW1lbWNweShib290X2NvbW1hbmRfbGluZSwgY29tbWFuZF9saW5lLCBDT01N
QU5EX0xJTkVfU0laRSk7Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
