Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7377A353259
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3FD7320BE0;
	Sat,  3 Apr 2021 06:19:08 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 8C989212FE
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:21:51 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkL51pq3z9v2lh;
 Fri,  2 Apr 2021 17:21:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OssVJYy-p_xH; Fri,  2 Apr 2021 17:21:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkL50gT0z9v2lf;
 Fri,  2 Apr 2021 17:21:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 155BE8BB7D;
 Fri,  2 Apr 2021 17:21:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6n2Gg89KkRnV; Fri,  2 Apr 2021 17:21:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C4F58BB7C;
 Fri,  2 Apr 2021 17:21:50 +0200 (CEST)
To: Rob Herring <robh@kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
 <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d71c83a8-cc10-b435-5a28-70ca4df6fdf9@csgroup.eu>
Date: Fri, 2 Apr 2021 17:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Content-Language: fr
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyNi8wMy8yMDIxIMOgIDE2OjI2LCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgTWFyIDI2LCAyMDIxIGF0IDg6MjAgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBMZSAyNi8wMy8yMDIxIMOgIDE1
OjA4LCBBbmRyZWFzIFNjaHdhYiBhIMOpY3JpdCA6Cj4+PiBPbiBNw6RyIDI2IDIwMjEsIENocmlz
dG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4+IGluZGV4IGY4ZjE1MzMy
Y2FhMi4uZTdjOTFlZTQ3OGQxIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+Pj4gQEAgLTIwLDYg
KzIwLDcgQEAKPj4+PiAgICAjaW5jbHVkZSA8bGludXgvc3dpb3RsYi5oPgo+Pj4+ICAgICNpbmNs
dWRlIDxsaW51eC9zbXAuaD4KPj4+PiAgICAjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4+Pj4gKyNp
bmNsdWRlIDxsaW51eC9jbWRsaW5lLmg+Cj4+Pj4KPj4+PiAgICAjaW5jbHVkZSA8YXNtL2NwdV9v
cHMuaD4KPj4+PiAgICAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KPj4+PiBAQCAtMjI4
LDEwICsyMjksOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4+Pj4gICAg
ICAgfQo+Pj4+Cj4+Pj4gICAgICAgcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxc
biIpOwo+Pj4+IC0jaWZkZWYgQ09ORklHX0NNRExJTkVfRk9SQ0UKPj4+PiAtICAgIHN0cmxjcHko
Ym9vdF9jb21tYW5kX2xpbmUsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVfU0laRSk7Cj4+
Pj4gKyAgICBjbWRsaW5lX2J1aWxkKGJvb3RfY29tbWFuZF9saW5lLCBOVUxMLCBDT01NQU5EX0xJ
TkVfU0laRSk7Cj4+Pj4gICAgICAgcHJfaW5mbygiRm9yY2luZyBrZXJuZWwgY29tbWFuZCBsaW5l
IHRvOiAlc1xuIiwgYm9vdF9jb21tYW5kX2xpbmUpOwo+Pj4KPj4+IFNob3VsZG4ndCB0aGF0IG1l
c3NhZ2UgYmVjb21lIGNvbmRpdGlvbmFsIGluIHNvbWUgd2F5Pwo+Pj4KPj4KPj4gWW91IGFyZSBy
aWdodCwgSSBkaWQgc29tZXRoaW5nIHNpbWlsYXIgb24gQVJNIGJ1dCBsb29rcyBsaWtlIEkgbWlz
c2VkIGl0IG9uIFJJU0NWLgo+IAo+IEhvdyBpcyB0aGlzIGh1bmsgZXZlbiB1c2VmdWw/IFVuZGVy
IHdoYXQgY29uZGl0aW9ucyBjYW4geW91IGJvb3QKPiB3aXRob3V0IGEgRFRCPyBFdmVuIHdpdGgg
YSBidWlsdC1pbiBEVEIsIHRoZSBEVCBjbWRsaW5lIGhhbmRsaW5nIHdvdWxkCj4gYmUgY2FsbGVk
Lgo+IAoKRG9uJ3Qga25vdywgSSB3YW50ZWQgdG8ga2VlcCBhcyBpcyB0b2RheS4KCkRvIHlvdSB0
aGluayB0aGUgaHVuayBzaG91bGQgYmUgY29tcGxldGVseSByZW1vdmVkID8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
