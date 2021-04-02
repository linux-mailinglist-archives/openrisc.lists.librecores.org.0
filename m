Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D2CA635325D
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A14B4212F9;
	Sat,  3 Apr 2021 06:19:20 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 854DC21303
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:34:02 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkc810p9z9v2m9;
 Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id E-R23ddmhdI0; Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkc76Npnz9v2m8;
 Fri,  2 Apr 2021 17:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE3098BB77;
 Fri,  2 Apr 2021 17:34:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KbAlGNza6YEe; Fri,  2 Apr 2021 17:34:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C1048BB6F;
 Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
To: "Tan, Ley Foon" <ley.foon.tan@intel.com>,
 "will@kernel.org" <will@kernel.org>, "danielwa@cisco.com"
 <danielwa@cisco.com>, "robh@kernel.org" <robh@kernel.org>,
 "daniel@gimpelevich.san-francisco.ca.us"
 <daniel@gimpelevich.san-francisco.ca.us>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
 <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <18f89697-5612-6a1a-ab9d-8842c1b943db@csgroup.eu>
Date: Fri, 2 Apr 2021 17:33:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
Content-Language: fr
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: Re: [OpenRISC] [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 microblaze <monstr@monstr.eu>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyOS8wMy8yMDIxIMOgIDAzOjM1LCBUYW4sIExleSBGb29uIGEgw6ljcml0wqA6Cj4gCj4g
Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPj4gU2VudDogRnJpZGF5LCBNYXJjaCAyNiwg
MjAyMSA5OjQ1IFBNCj4+IFRvOiB3aWxsQGtlcm5lbC5vcmc7IGRhbmllbHdhQGNpc2NvLmNvbTsg
cm9iaEBrZXJuZWwub3JnOwo+PiBkYW5pZWxAZ2ltcGVsZXZpY2guc2FuLWZyYW5jaXNjby5jYS51
cwo+PiBDYzogbGludXgtYXJjaEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyBsaW51eHBwYy0KPj4gZGV2QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLQo+PiBkZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBtaWNyb2JsYXplCj4+IDxtb25zdHJAbW9u
c3RyLmV1PjsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc7IFRhbiwgTGV5IEZvb24KPj4gPGxl
eS5mb29uLnRhbkBpbnRlbC5jb20+OyBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZzsgbGlu
dXgtCj4+IGhleGFnb25Admdlci5rZXJuZWwub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnOyB4ODZAa2VybmVsLm9yZzsKPj4gbGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmc7
IGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZzsKPj4gc3BhcmNsaW51eEB2Z2VyLmtlcm5lbC5vcmcK
Pj4gU3ViamVjdDogW1BBVENIIHYzIDA5LzE3XSBuaW9zMjogQ29udmVydCB0byBHRU5FUklDX0NN
RExJTkUKPj4KPj4gVGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01E
TElORS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pgo+PiAtLS0KPj4gICBhcmNoL25pb3MyL0tjb25maWcgICAgICAgIHwg
MjQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAu
YyB8IDEzICsrKystLS0tLS0tLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMzIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL25pb3MyL0tjb25maWcg
Yi9hcmNoL25pb3MyL0tjb25maWcgaW5kZXgKPj4gYzI0OTU1YzgxYzkyLi5mNjZjOTdiMTU4MTMg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvbmlvczIvS2NvbmZpZwo+PiArKysgYi9hcmNoL25pb3MyL0tj
b25maWcKPj4gQEAgLTkwLDMxICs5MCw5IEBAIGNvbmZpZyBOSU9TMl9BTElHTk1FTlRfVFJBUAo+
Pgo+PiAgIGNvbW1lbnQgIkJvb3Qgb3B0aW9ucyIKPj4KPj4gLWNvbmZpZyBDTURMSU5FX0JPT0wK
Pj4gLQlib29sICJEZWZhdWx0IGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKPj4gLQlkZWZh
dWx0IHkKPj4gLQo+PiAtY29uZmlnIENNRExJTkUKPj4gLQlzdHJpbmcgIkRlZmF1bHQga2VybmVs
IGNvbW1hbmQgc3RyaW5nIgo+PiAtCWRlZmF1bHQgIiIKPj4gLQlkZXBlbmRzIG9uIENNRExJTkVf
Qk9PTAo+PiAtCWhlbHAKPj4gLQkgIE9uIHNvbWUgcGxhdGZvcm1zLCB0aGVyZSBpcyBjdXJyZW50
bHkgbm8gd2F5IGZvciB0aGUgYm9vdCBsb2FkZXIgdG8KPj4gLQkgIHBhc3MgYXJndW1lbnRzIHRv
IHRoZSBrZXJuZWwuIEZvciB0aGVzZSBwbGF0Zm9ybXMsIHlvdSBjYW4gc3VwcGx5Cj4+IC0JICBz
b21lIGNvbW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBo
ZXJlLiAgSW4KPj4gLQkgIG90aGVyIGNhc2VzIHlvdSBjYW4gc3BlY2lmeSBrZXJuZWwgYXJncyBz
byB0aGF0IHlvdSBkb24ndCBoYXZlCj4+IC0JICB0byBzZXQgdGhlbSB1cCBpbiBib2FyZCBwcm9t
IGluaXRpYWxpemF0aW9uIHJvdXRpbmVzLgo+PiAtCj4+IC1jb25maWcgQ01ETElORV9GT1JDRQo+
PiAtCWJvb2wgIkZvcmNlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+PiAtCWRlcGVu
ZHMgb24gQ01ETElORV9CT09MCj4+IC0JaGVscAo+PiAtCSAgU2V0IHRoaXMgdG8gaGF2ZSBhcmd1
bWVudHMgZnJvbSB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcKPj4gLQkgIG92ZXJy
aWRlIHRob3NlIHBhc3NlZCBieSB0aGUgYm9vdCBsb2FkZXIuCj4+IC0KPj4gICBjb25maWcgTklP
UzJfQ01ETElORV9JR05PUkVfRFRCCj4+ICAgCWJvb2wgIklnbm9yZSBrZXJuZWwgY29tbWFuZCBz
dHJpbmcgZnJvbSBEVEIiCj4+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKPj4gKwlkZXBlbmRz
IG9uIENNRExJTkUgIT0gIiIKPj4gICAJZGVwZW5kcyBvbiAhQ01ETElORV9GT1JDRQo+PiAgIAlk
ZWZhdWx0IHkKPj4gICAJaGVscAo+IAo+IE1pc3NpbmcgIiBzZWxlY3QgR0VORVJJQ19DTURMSU5F
IiA/CgpBZGRlZCBpbiB2NAoKVGhhbmtzCkNocmlzdG9waGUKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
