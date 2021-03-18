Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5F33C33FCD9
	for <lists+openrisc@lfdr.de>; Thu, 18 Mar 2021 02:52:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9104121251;
	Thu, 18 Mar 2021 02:52:16 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mail.librecores.org (Postfix) with ESMTPS id 342E320689
 for <openrisc@lists.librecores.org>; Thu, 18 Mar 2021 02:02:05 +0100 (CET)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F17w73LVNzmZ6G;
 Thu, 18 Mar 2021 08:59:35 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 09:01:56 +0800
To: Dave Hansen <dave.hansen@intel.com>, <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
 <2a7d6e39-b293-7422-87b0-741f1ab0c22c@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <190f5356-f947-d474-a9fe-bc8e622a426e@huawei.com>
Date: Thu, 18 Mar 2021 09:01:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2a7d6e39-b293-7422-87b0-741f1ab0c22c@intel.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 18 Mar 2021 02:52:15 +0100
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter
 Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>,
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

Ck9uIDIwMjEvMy8xOCAyOjQ4LCBEYXZlIEhhbnNlbiB3cm90ZToKPiBPbiAzLzE2LzIxIDY6NTIg
UE0sIEtlZmVuZyBXYW5nIHdyb3RlOgo+PiBtZW1faW5pdF9wcmludF9pbmZvKCkgaXMgY2FsbGVk
IGluIG1lbV9pbml0KCkgb24gZWFjaCBhcmNoaXRlY3R1cmUsCj4+IGFuZCBwYXNzIE5VTEwgYXJn
dW1lbnQsIHNvIHVzaW5nIHZvaWQgYXJndW1lbnQgYW5kIG1vdmUgaXQgaW50byBtbV9pbml0KCku
Cj4+Cj4+IEFja2VkLWJ5OiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29t
Pgo+IEl0J3Mgbm90IGEgYmlnIGRlYWwgYnV0IHlvdSBtaWdodCB3YW50IHRvIHNheSBzb21ldGhp
bmcgbGlrZToKPgo+IEFja2VkLWJ5OiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50
ZWwuY29tPiAjIHg4NiBiaXRzCj4KPiBKdXN0IHRvIG1ha2UgaXQgY2xlYXIgdGhhdCBJIGRpZG4n
dCBsb29rIGF0IHRoZSBhbHBoYSBiaXRzIGF0IGFsbC4gOikKR2V0IGl0LCB3aWxsIGJlIGNhcmVm
dWwsIHRoYW5rcy4KPiAuCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
