Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 481D934B0E5
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:24 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F2081212D6;
	Fri, 26 Mar 2021 21:52:23 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id C02F42129D
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 16:50:00 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6RHp3FcVz9v0N7;
 Fri, 26 Mar 2021 16:49:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GMS7qKW9a4qh; Fri, 26 Mar 2021 16:49:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6RHp1M13z9v0N3;
 Fri, 26 Mar 2021 16:49:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C764C8B8D7;
 Fri, 26 Mar 2021 16:49:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UQFsEfZGymR7; Fri, 26 Mar 2021 16:49:59 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD5ED8B8C7;
 Fri, 26 Mar 2021 16:49:58 +0100 (CET)
To: Rob Herring <robh@kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
 <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c18ef8f7-8e79-a9d3-3853-f8b992a4fc93@csgroup.eu>
Date: Fri, 26 Mar 2021 16:49:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
Content-Language: fr
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:57 +0100
Subject: Re: [OpenRISC] [PATCH v3 05/17] arm: Convert to GENERIC_CMDLINE
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
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyNi8wMy8yMDIxIMOgIDE2OjQ3LCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgTWFyIDI2LCAyMDIxIGF0IDc6NDQgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pgo+PiBUaGlzIGNvbnZlcnRzIHRoZSBhcmNoaXRl
Y3R1cmUgdG8gR0VORVJJQ19DTURMSU5FLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+PiAgIGFyY2gvYXJt
L0tjb25maWcgICAgICAgICAgICAgIHwgMzggKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gICBhcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYyB8IDE1ICsrKysrLS0tLS0t
LS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vS2NvbmZpZyBiL2FyY2gvYXJtL0tjb25maWcK
Pj4gaW5kZXggNWRhOTZmNWRmNDhmLi42N2JjNzVmMmRhODEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
YXJtL0tjb25maWcKPj4gKysrIGIvYXJjaC9hcm0vS2NvbmZpZwo+PiBAQCAtNTAsNiArNTAsNyBA
QCBjb25maWcgQVJNCj4+ICAgICAgICAgIHNlbGVjdCBHRU5FUklDX0FSQ0hfVE9QT0xPR1kgaWYg
QVJNX0NQVV9UT1BPTE9HWQo+PiAgICAgICAgICBzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiBD
UFVfVjdNIHx8IENQVV9WNiB8fCAhQ1BVXzMydjZLIHx8ICFBRUFCSQo+PiAgICAgICAgICBzZWxl
Y3QgR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCj4+ICsgICAgICAgc2VsZWN0
IEdFTkVSSUNfQ01ETElORSBpZiBBVEFHUwo+IAo+IERvbid0IHdlIG5lZWQgdGhpcyBlbmFibGVk
IGZvciAhQVRBR1MgKGkuZS4gRFQgYm9vdCk/Cj4gCj4gQ2FuIHdlIGFsd2F5cyBlbmFibGUgR0VO
RVJJQ19DTURMSU5FIGZvciBPRl9FQVJMWV9GTEFUVFJFRT8KPiAKCkRvbid0IGtub3cuCgpUb2Rh
eSBBUk0gaGFzOgoKY2hvaWNlCglwcm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYg
Q01ETElORSAhPSAiIgoJZGVmYXVsdCBDTURMSU5FX0ZST01fQk9PVExPQURFUgoJZGVwZW5kcyBv
biBBVEFHUwoKCgpDaHJpc3RvcGhlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
