Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 64D0634B0E0
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 396BD2128A;
	Fri, 26 Mar 2021 21:52:20 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 19FEA20D49
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 15:20:24 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6PJQ0zLJz9v03Q;
 Fri, 26 Mar 2021 15:20:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id s0KOf5I51hUM; Fri, 26 Mar 2021 15:20:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6PJP6Vfbz9v0P3;
 Fri, 26 Mar 2021 15:20:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B5C58B8CF;
 Fri, 26 Mar 2021 15:20:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id apm4h56oZ3Cq; Fri, 26 Mar 2021 15:20:23 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95C5C8B8C7;
 Fri, 26 Mar 2021 15:20:22 +0100 (CET)
To: Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
Date: Fri, 26 Mar 2021 15:20:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87zgyqdn3d.fsf@igel.home>
Content-Language: fr
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:57 +0100
Subject: Re: [OpenRISC] [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, danielwa@cisco.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyNi8wMy8yMDIxIMOgIDE1OjA4LCBBbmRyZWFzIFNjaHdhYiBhIMOpY3JpdMKgOgo+IE9u
IE3DpHIgMjYgMjAyMSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+
IGluZGV4IGY4ZjE1MzMyY2FhMi4uZTdjOTFlZTQ3OGQxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4g
QEAgLTIwLDYgKzIwLDcgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvc3dpb3RsYi5oPgo+PiAgICNp
bmNsdWRlIDxsaW51eC9zbXAuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4+ICsjaW5j
bHVkZSA8bGludXgvY21kbGluZS5oPgo+PiAgIAo+PiAgICNpbmNsdWRlIDxhc20vY3B1X29wcy5o
Pgo+PiAgICNpbmNsdWRlIDxhc20vZWFybHlfaW9yZW1hcC5oPgo+PiBAQCAtMjI4LDEwICsyMjks
OCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4+ICAgCX0KPj4gICAKPj4g
ICAJcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxcbiIpOwo+PiAtI2lmZGVmIENP
TkZJR19DTURMSU5FX0ZPUkNFCj4+IC0Jc3RybGNweShib290X2NvbW1hbmRfbGluZSwgQ09ORklH
X0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsKPj4gKwljbWRsaW5lX2J1aWxkKGJvb3RfY29t
bWFuZF9saW5lLCBOVUxMLCBDT01NQU5EX0xJTkVfU0laRSk7Cj4+ICAgCXByX2luZm8oIkZvcmNp
bmcga2VybmVsIGNvbW1hbmQgbGluZSB0bzogJXNcbiIsIGJvb3RfY29tbWFuZF9saW5lKTsKPiAK
PiBTaG91bGRuJ3QgdGhhdCBtZXNzYWdlIGJlY29tZSBjb25kaXRpb25hbCBpbiBzb21lIHdheT8K
PiAKCllvdSBhcmUgcmlnaHQsIEkgZGlkIHNvbWV0aGluZyBzaW1pbGFyIG9uIEFSTSBidXQgbG9v
a3MgbGlrZSBJIG1pc3NlZCBpdCBvbiBSSVNDVi4KCkNocmlzdG9waGUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
