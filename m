Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 746BF33EA1E
	for <lists+openrisc@lfdr.de>; Wed, 17 Mar 2021 07:54:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3526A2124E;
	Wed, 17 Mar 2021 07:54:50 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 6A09420894
 for <openrisc@lists.librecores.org>; Wed, 17 Mar 2021 06:48:33 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0fMz3RQ5z9vBLs;
 Wed, 17 Mar 2021 06:48:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5HAfcpzaS9zh; Wed, 17 Mar 2021 06:48:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0fMz2JZBz9vBLr;
 Wed, 17 Mar 2021 06:48:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 434728B7F7;
 Wed, 17 Mar 2021 06:48:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G8uQhGY3jGja; Wed, 17 Mar 2021 06:48:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82F468B768;
 Wed, 17 Mar 2021 06:48:18 +0100 (CET)
To: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
Date: Wed, 17 Mar 2021 06:48:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
Content-Language: fr
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:54:48 +0100
Subject: Re: [OpenRISC] [PATCH v2] mm: Move mem_init_print_info() into
 mm_init()
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAxNy8wMy8yMDIxIMOgIDAyOjUyLCBLZWZlbmcgV2FuZyBhIMOpY3JpdMKgOgo+IG1lbV9p
bml0X3ByaW50X2luZm8oKSBpcyBjYWxsZWQgaW4gbWVtX2luaXQoKSBvbiBlYWNoIGFyY2hpdGVj
dHVyZSwKPiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBzbyB1c2luZyB2b2lkIGFyZ3VtZW50IGFu
ZCBtb3ZlIGl0IGludG8gbW1faW5pdCgpLgo+IAo+IEFja2VkLWJ5OiBEYXZlIEhhbnNlbiA8ZGF2
ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiB2MjoKPiAtIENsZWFudXAgJ3N0cicg
bGluZSBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoZSBhbmQgQUNLCj4gCj4gICBhcmNoL2FscGhhL21t
L2luaXQuYyAgICAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvYXJjL21tL2luaXQuYyAgICAgICAg
ICAgICAgIHwgIDEgLQo+ICAgYXJjaC9hcm0vbW0vaW5pdC5jICAgICAgICAgICAgICAgfCAgMiAt
LQo+ICAgYXJjaC9hcm02NC9tbS9pbml0LmMgICAgICAgICAgICAgfCAgMiAtLQo+ICAgYXJjaC9j
c2t5L21tL2luaXQuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL2g4MzAwL21tL2luaXQu
YyAgICAgICAgICAgICB8ICAyIC0tCj4gICBhcmNoL2hleGFnb24vbW0vaW5pdC5jICAgICAgICAg
ICB8ICAxIC0KPiAgIGFyY2gvaWE2NC9tbS9pbml0LmMgICAgICAgICAgICAgIHwgIDEgLQo+ICAg
YXJjaC9tNjhrL21tL2luaXQuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL21pY3JvYmxh
emUvbW0vaW5pdC5jICAgICAgICB8ICAxIC0KPiAgIGFyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEu
YyAgICAgIHwgIDEgLQo+ICAgYXJjaC9taXBzL21tL2luaXQuYyAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBhcmNoL21pcHMvc2dpLWlwMjcvaXAyNy1tZW1vcnkuYyB8ICAxIC0KPiAgIGFyY2gvbmRz
MzIvbW0vaW5pdC5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9uaW9zMi9tbS9pbml0LmMg
ICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyAgICAgICAgICB8
ICAyIC0tCj4gICBhcmNoL3BhcmlzYy9tbS9pbml0LmMgICAgICAgICAgICB8ICAyIC0tCj4gICBh
cmNoL3Bvd2VycGMvbW0vbWVtLmMgICAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvcmlzY3YvbW0v
aW5pdC5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9zMzkwL21tL2luaXQuYyAgICAgICAg
ICAgICAgfCAgMiAtLQo+ICAgYXJjaC9zaC9tbS9pbml0LmMgICAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBhcmNoL3NwYXJjL21tL2luaXRfMzIuYyAgICAgICAgICB8ICAyIC0tCj4gICBhcmNoL3Nw
YXJjL21tL2luaXRfNjQuYyAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvdW0va2VybmVsL21lbS5j
ICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC94ODYvbW0vaW5pdF8zMi5jICAgICAgICAgICAg
fCAgMiAtLQo+ICAgYXJjaC94ODYvbW0vaW5pdF82NC5jICAgICAgICAgICAgfCAgMiAtLQo+ICAg
YXJjaC94dGVuc2EvbW0vaW5pdC5jICAgICAgICAgICAgfCAgMSAtCj4gICBpbmNsdWRlL2xpbnV4
L21tLmggICAgICAgICAgICAgICB8ICAyICstCj4gICBpbml0L21haW4uYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgIHwgMTAg
KysrKystLS0tLQo+ICAgMzAgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0MiBkZWxl
dGlvbnMoLSkKPiAKCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaAo+IGluZGV4IDg5MzE0NjUxZGQ2Mi4uYzJlMGIzNDk1YzVhIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC0y
MzczLDcgKzIzNzMsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBmcmVlX3Jlc2VydmVkX2FyZWEo
dm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwKPiAgIAkJCQkJaW50IHBvaXNvbiwgY29uc3QgY2hhciAq
cyk7Cj4gICAKPiAgIGV4dGVybiB2b2lkIGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQoc3RydWN0
IHBhZ2UgKnBhZ2UsIGxvbmcgY291bnQpOwo+IC1leHRlcm4gdm9pZCBtZW1faW5pdF9wcmludF9p
bmZvKGNvbnN0IGNoYXIgKnN0cik7Cj4gK2V4dGVybiB2b2lkIG1lbV9pbml0X3ByaW50X2luZm8o
dm9pZCk7CgpTb3JyeSBJIGRpZG4ndCBzZWUgdGhhdCBpbiBwcmV2aW91cyBwYXRjaC4KCidleHRl
cm4nIGtleXdvcmQgaXMgcG9pbnRsZXNzIGZvciBmdW5jdGlvbiBwcm90b3R5cGVzIGFuZCBpcyBk
ZXByZWNhdGVkLCB5b3Ugc2hvdWxkIHJlbW92ZSBpdC4KClRoYXQgc2FpZCwKClJldmlld2VkLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gIyBmb2N1c3NlZCBv
biBwb3dlcnBjCgo+ICAgCj4gICBleHRlcm4gdm9pZCByZXNlcnZlX2Jvb3RtZW1fcmVnaW9uKHBo
eXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQpOwo+ICAgCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
