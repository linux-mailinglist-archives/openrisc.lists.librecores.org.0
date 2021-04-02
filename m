Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 82B4435325E
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 21A4421311;
	Sat,  3 Apr 2021 06:19:21 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5EAC821305
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:36:15 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkfh6syMz9v2m9;
 Fri,  2 Apr 2021 17:36:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SsC2ob6kJi6G; Fri,  2 Apr 2021 17:36:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkfh5PDlz9v2m8;
 Fri,  2 Apr 2021 17:36:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A97528BB77;
 Fri,  2 Apr 2021 17:36:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dzRgT34PMsr4; Fri,  2 Apr 2021 17:36:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA9038BB6F;
 Fri,  2 Apr 2021 17:36:13 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <6b76649009943f2893fdfded22becd41db2fe1f7.1616765870.git.christophe.leroy@csgroup.eu>
Message-ID: <d672dec1-6fcb-d5dc-a551-2a99e6dd6976@csgroup.eu>
Date: Fri, 2 Apr 2021 17:36:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6b76649009943f2893fdfded22becd41db2fe1f7.1616765870.git.christophe.leroy@csgroup.eu>
Content-Language: fr
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: Re: [OpenRISC] [PATCH v3 12/17] sh: Convert to GENERIC_CMDLINE
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
 microblaze <monstr@monstr.eu>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyNi8wMy8yMDIxIMOgIDE0OjQ0LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4g
VGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAu
ZXU+Cj4gLS0tCgo+IGRpZmYgLS1naXQgYS9hcmNoL3NoL0tjb25maWcgYi9hcmNoL3NoL0tjb25m
aWcKPiBpbmRleCBlNzk4ZTU1OTE1YzIuLmZhYjg0ZjYyNDQ4YyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3NoL0tjb25maWcKPiArKysgYi9hcmNoL3NoL0tjb25maWcKPiBAQCAtMTYsNiArMTYsNyBAQCBj
b25maWcgU1VQRVJICj4gICAJc2VsZWN0IENQVV9OT19FRkZJQ0lFTlRfRkZTCj4gICAJc2VsZWN0
IERNQV9ERUNMQVJFX0NPSEVSRU5UCj4gICAJc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQKPiArCXNl
bGVjdCBHRU5FUklDX0NNRExJTkUKPiAgIAlzZWxlY3QgR0VORVJJQ19DTU9TX1VQREFURSBpZiBT
SF9TSDAzIHx8IFNIX0RSRUFNQ0FTVAo+ICAgCXNlbGVjdCBHRU5FUklDX0lETEVfUE9MTF9TRVRV
UAo+ICAgCXNlbGVjdCBHRU5FUklDX0lSUV9TSE9XCj4gQEAgLTc0MiwzNSArNzQzLDYgQEAgY29u
ZmlnIFJPTUlNQUdFX01NQ0lGCj4gICAJICBmaXJzdCBwYXJ0IG9mIHRoZSByb21JbWFnZSB3aGlj
aCBpbiB0dXJuIGxvYWRzIHRoZSByZXN0IHRoZSBrZXJuZWwKPiAgIAkgIGltYWdlIHRvIFJBTSB1
c2luZyB0aGUgTU1DSUYgaGFyZHdhcmUgYmxvY2suCj4gICAKPiAtY2hvaWNlCj4gLQlwcm9tcHQg
Iktlcm5lbCBjb21tYW5kIGxpbmUiCj4gLQlvcHRpb25hbAo+IC0JZGVmYXVsdCBDTURMSU5FX09W
RVJXUklURQo+IC0JaGVscAo+IC0JICBTZXR0aW5nIHRoaXMgb3B0aW9uIGFsbG93cyB0aGUga2Vy
bmVsIGNvbW1hbmQgbGluZSBhcmd1bWVudHMKPiAtCSAgdG8gYmUgc2V0Lgo+IC0KPiAtY29uZmln
IENNRExJTkVfT1ZFUldSSVRFCj4gLQlib29sICJPdmVyd3JpdGUgYm9vdGxvYWRlciBrZXJuZWwg
YXJndW1lbnRzIgo+IC0JaGVscAo+IC0JICBHaXZlbiBzdHJpbmcgd2lsbCBvdmVyd3JpdGUgYW55
IGFyZ3VtZW50cyBwYXNzZWQgaW4gYnkKPiAtCSAgYSBib290bG9hZGVyLgo+IC0KPiAtY29uZmln
IENNRExJTkVfRVhURU5ECj4gLQlib29sICJFeHRlbmQgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1l
bnRzIgo+IC0JaGVscAo+IC0JICBHaXZlbiBzdHJpbmcgd2lsbCBiZSBjb25jYXRlbmF0ZWQgd2l0
aCBhcmd1bWVudHMgcGFzc2VkIGluCj4gLQkgIGJ5IGEgYm9vdGxvYWRlci4KPiAtCj4gLWVuZGNo
b2ljZQo+IC0KPiAtY29uZmlnIENNRExJTkUKPiAtCXN0cmluZyAiS2VybmVsIGNvbW1hbmQgbGlu
ZSBhcmd1bWVudHMgc3RyaW5nIgo+IC0JZGVwZW5kcyBvbiBDTURMSU5FX09WRVJXUklURSB8fCBD
TURMSU5FX0VYVEVORAo+IC0JZGVmYXVsdCAiY29uc29sZT10dHlTQzEsMTE1MjAwIgo+IC0KPiAt
ZW5kbWVudQo+IC0KClRoYXQgImVuZG1lbnUiIHNoYWxsIG5vdCBiZSByZW1vdmVkLgoKRml4ZWQg
aW4gdjQsCgpUaGFua3MgdG8gUm9iIEwuIGZvciB0aGUgcmVwb3J0LgpDaHJpc3RvcGhlCgo+ICAg
bWVudSAiQnVzIG9wdGlvbnMiCj4gICAKPiAgIGNvbmZpZyBTVVBFUkhZV0FZCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
