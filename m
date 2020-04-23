Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29E1C05D3
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C162920309;
	Thu, 30 Apr 2020 21:09:24 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1472B20391
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 07:50:42 +0200 (CEST)
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 316B72075A;
 Thu, 23 Apr 2020 05:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587621040;
 bh=eyVZp9j3F/Xq/nb8E7flj/7Td5RXEkEohgXGHGzzyBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMVthoZAtv0rZAA611yWF87SJbTuYjwkEzlivL15gwv1pTfmKz6qcSkPj9g6tdK3X
 3vKyJlA0AvQUGT1DCH7fpW3AEGHKGhgMYeM3USLfon8nQe86zcU1QzD9IFXYoeaLr8
 3uHfGYSWfNKi0n+hHvp4Yj3/WIVE9+1jq2UW/40o=
Date: Thu, 23 Apr 2020 08:50:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Message-ID: <20200423055022.GE14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
 <20200423011312.GY4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423011312.GY4247@MiWiFi-R3L-srv>
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMDk6MTM6MTJBTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNC8xMi8yMCBhdCAxMDo0OHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBUaGUgY29tbWl0
IGY0N2FjMDg4YzQwNiAoIm1tOiBtZW1tYXBfaW5pdDogaXRlcmF0ZSBvdmVyIG1lbWJsb2NrIHJl
Z2lvbnMKPiAKPiBUaGlzIGNvbW1pdCBpZCBzaG91bGQgYmUgYSB0ZW1wb3Jhcnkgb25lLCB3aWxs
IGJlIGNoYW5nZWQgd2hlbiBtZXJnZWQKPiBpbnRvIG1haW50YWluZXIncyB0cmVlIGFuZCBsaW51
cydzIHRyZWUuIE9ubHkgc2F5aW5nIGxhc3QgcGF0Y2ggcGx1cyB0aGUKPiBwYXRjaCBzdWJqZWN0
IGlzIE9LPwoKUmlnaHQsIHRoZSBjb21taXQgaWQgaGVyZSBpcyBub3Qgc3RhYmxlLiBJJ2xsIHVw
ZGF0ZSB0aGUgY2hhbmdlbG9nLgogCj4gPiByYXRoZXIgdGhhdCBjaGVjayBlYWNoIFBGTiIpIG1h
ZGUgZWFybHlfcGZuX2luX25pZCgpIG9ic29sZXRlIGFuZCBzaW5jZQo+ID4gQ09ORklHX05PREVT
X1NQQU5fT1RIRVJfTk9ERVMgaXMgb25seSB1c2VkIHRvIHBpY2sgYSBzdHViIG9yIGEgcmVhbAo+
ID4gaW1wbGVtZW50YXRpb24gb2YgZWFybHlfcGZuX2luX25pZCgpIGl0IGlzIGFsc28gbm90IG5l
ZWRlZCBhbnltb3JlLgo+ID4gCj4gPiBSZW1vdmUgYm90aCBlYXJseV9wZm5faW5fbmlkKCkgYW5k
IHRoZSBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUy4KPiA+IAo+ID4gQ28tZGV2ZWxvcGVk
LWJ5OiBIb2FuIFRyYW4gPEhvYW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEhvYW4gVHJhbiA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gLS0tCj4gPiAg
YXJjaC9wb3dlcnBjL0tjb25maWcgfCAgOSAtLS0tLS0tLS0KPiA+ICBhcmNoL3NwYXJjL0tjb25m
aWcgICB8ICA5IC0tLS0tLS0tLQo+ID4gIGFyY2gveDg2L0tjb25maWcgICAgIHwgIDkgLS0tLS0t
LS0tCj4gPiAgbW0vcGFnZV9hbGxvYy5jICAgICAgfCAyMCAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gIDQgZmlsZXMgY2hhbmdlZCwgNDcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gPiBpbmRleCA1
Zjg2YjIyYjdkMmMuLjc0ZjMxNmRlZWFlMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9L
Y29uZmlnCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+ID4gQEAgLTY4NSwxNSArNjg1
LDYgQEAgY29uZmlnIEFSQ0hfTUVNT1JZX1BST0JFCj4gPiAgCWRlZl9ib29sIHkKPiA+ICAJZGVw
ZW5kcyBvbiBNRU1PUllfSE9UUExVRwo+ID4gIAo+ID4gLSMgU29tZSBOVU1BIG5vZGVzIGhhdmUg
bWVtb3J5IHJhbmdlcyB0aGF0IHNwYW4KPiA+IC0jIG90aGVyIG5vZGVzLiAgRXZlbiB0aG91Z2gg
YSBwZm4gaXMgdmFsaWQgYW5kCj4gPiAtIyBiZXR3ZWVuIGEgbm9kZSdzIHN0YXJ0IGFuZCBlbmQg
cGZucywgaXQgbWF5IG5vdAo+ID4gLSMgcmVzaWRlIG9uIHRoYXQgbm9kZS4gIFNlZSBtZW1tYXBf
aW5pdF96b25lKCkKPiA+IC0jIGZvciBkZXRhaWxzLgo+ID4gLWNvbmZpZyBOT0RFU19TUEFOX09U
SEVSX05PREVTCj4gPiAtCWRlZl9ib29sIHkKPiA+IC0JZGVwZW5kcyBvbiBORUVEX01VTFRJUExF
X05PREVTCj4gPiAtCj4gPiAgY29uZmlnIFNUREJJTlVUSUxTCj4gPiAgCWJvb2wgIlVzaW5nIHN0
YW5kYXJkIGJpbnV0aWxzIHNldHRpbmdzIgo+ID4gIAlkZXBlbmRzIG9uIDQ0eAo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvc3BhcmMvS2NvbmZpZyBiL2FyY2gvc3BhcmMvS2NvbmZpZwo+ID4gaW5kZXgg
Nzk1MjA2YjdiNTUyLi4wZTRmMzg5MWI5MDQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3NwYXJjL0tj
b25maWcKPiA+ICsrKyBiL2FyY2gvc3BhcmMvS2NvbmZpZwo+ID4gQEAgLTI4NiwxNSArMjg2LDYg
QEAgY29uZmlnIE5PREVTX1NISUZUCj4gPiAgCSAgU3BlY2lmeSB0aGUgbWF4aW11bSBudW1iZXIg
b2YgTlVNQSBOb2RlcyBhdmFpbGFibGUgb24gdGhlIHRhcmdldAo+ID4gIAkgIHN5c3RlbS4gIElu
Y3JlYXNlcyBtZW1vcnkgcmVzZXJ2ZWQgdG8gYWNjb21tb2RhdGUgdmFyaW91cyB0YWJsZXMuCj4g
PiAgCj4gPiAtIyBTb21lIE5VTUEgbm9kZXMgaGF2ZSBtZW1vcnkgcmFuZ2VzIHRoYXQgc3Bhbgo+
ID4gLSMgb3RoZXIgbm9kZXMuICBFdmVuIHRob3VnaCBhIHBmbiBpcyB2YWxpZCBhbmQKPiA+IC0j
IGJldHdlZW4gYSBub2RlJ3Mgc3RhcnQgYW5kIGVuZCBwZm5zLCBpdCBtYXkgbm90Cj4gPiAtIyBy
ZXNpZGUgb24gdGhhdCBub2RlLiAgU2VlIG1lbW1hcF9pbml0X3pvbmUoKQo+ID4gLSMgZm9yIGRl
dGFpbHMuCj4gPiAtY29uZmlnIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMKPiA+IC0JZGVmX2Jvb2wg
eQo+ID4gLQlkZXBlbmRzIG9uIE5FRURfTVVMVElQTEVfTk9ERVMKPiA+IC0KPiA+ICBjb25maWcg
QVJDSF9TUEFSU0VNRU1fRU5BQkxFCj4gPiAgCWRlZl9ib29sIHkgaWYgU1BBUkM2NAo+ID4gIAlz
ZWxlY3QgU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxFCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
S2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcKPiA+IGluZGV4IDlkM2U5NWI0ZmI4NS4uMzdkYWMw
OTU2NTllIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC94ODYvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC94
ODYvS2NvbmZpZwo+ID4gQEAgLTE1ODEsMTUgKzE1ODEsNiBAQCBjb25maWcgWDg2XzY0X0FDUElf
TlVNQQo+ID4gIAktLS1oZWxwLS0tCj4gPiAgCSAgRW5hYmxlIEFDUEkgU1JBVCBiYXNlZCBub2Rl
IHRvcG9sb2d5IGRldGVjdGlvbi4KPiA+ICAKPiA+IC0jIFNvbWUgTlVNQSBub2RlcyBoYXZlIG1l
bW9yeSByYW5nZXMgdGhhdCBzcGFuCj4gPiAtIyBvdGhlciBub2Rlcy4gIEV2ZW4gdGhvdWdoIGEg
cGZuIGlzIHZhbGlkIGFuZAo+ID4gLSMgYmV0d2VlbiBhIG5vZGUncyBzdGFydCBhbmQgZW5kIHBm
bnMsIGl0IG1heSBub3QKPiA+IC0jIHJlc2lkZSBvbiB0aGF0IG5vZGUuICBTZWUgbWVtbWFwX2lu
aXRfem9uZSgpCj4gPiAtIyBmb3IgZGV0YWlscy4KPiA+IC1jb25maWcgTk9ERVNfU1BBTl9PVEhF
Ul9OT0RFUwo+ID4gLQlkZWZfYm9vbCB5Cj4gPiAtCWRlcGVuZHMgb24gWDg2XzY0X0FDUElfTlVN
QQo+ID4gLQo+ID4gIGNvbmZpZyBOVU1BX0VNVQo+ID4gIAlib29sICJOVU1BIGVtdWxhdGlvbiIK
PiA+ICAJZGVwZW5kcyBvbiBOVU1BCj4gPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIv
bW0vcGFnZV9hbGxvYy5jCj4gPiBpbmRleCBjNDNjZTg3MDk0NTcuLjM0M2Q4N2I4Njk3ZCAxMDA2
NDQKPiA+IC0tLSBhL21tL3BhZ2VfYWxsb2MuYwo+ID4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4g
PiBAQCAtMTU0MSwyNiArMTU0MSw2IEBAIGludCBfX21lbWluaXQgZWFybHlfcGZuX3RvX25pZCh1
bnNpZ25lZCBsb25nIHBmbikKPiA+ICB9Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19ORUVEX01VTFRJ
UExFX05PREVTICovCj4gPiAgCj4gPiAtI2lmZGVmIENPTkZJR19OT0RFU19TUEFOX09USEVSX05P
REVTCj4gPiAtLyogT25seSBzYWZlIHRvIHVzZSBlYXJseSBpbiBib290IHdoZW4gaW5pdGlhbGlz
YXRpb24gaXMgc2luZ2xlLXRocmVhZGVkICovCj4gPiAtc3RhdGljIGlubGluZSBib29sIF9fbWVt
aW5pdCBlYXJseV9wZm5faW5fbmlkKHVuc2lnbmVkIGxvbmcgcGZuLCBpbnQgbm9kZSkKPiA+IC17
Cj4gPiAtCWludCBuaWQ7Cj4gPiAtCj4gPiAtCW5pZCA9IF9fZWFybHlfcGZuX3RvX25pZChwZm4s
ICZlYXJseV9wZm5uaWRfY2FjaGUpOwo+ID4gLQlpZiAobmlkID49IDAgJiYgbmlkICE9IG5vZGUp
Cj4gPiAtCQlyZXR1cm4gZmFsc2U7Cj4gPiAtCXJldHVybiB0cnVlOwo+ID4gLX0KPiA+IC0KPiA+
IC0jZWxzZQo+ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCBfX21lbWluaXQgZWFybHlfcGZuX2luX25p
ZCh1bnNpZ25lZCBsb25nIHBmbiwgaW50IG5vZGUpCj4gPiAtewo+ID4gLQlyZXR1cm4gdHJ1ZTsK
PiA+IC19Cj4gPiAtI2VuZGlmCj4gCj4gQW5kIG1hY3JvIGVhcmx5X3Bmbl92YWxpZCgpIGlzIG5v
dCBuZWVkZWQgZWl0aGVyLCB3ZSBtYXkgbmVlZCByZW1vdmUgaXQKPiB0b28uIAoKT2suCgo+IE90
aGVyd2lzZSwgcmVtb3ZpbmcgTk9ERVNfU1BBTl9PVEhFUl9OT0RFUyBpbiB0aGlzIHBhdGNoIGxv
b2tzIGdvb2QuCj4gCj4gUmV2aWV3ZWQtYnk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgo+
IAo+ID4gLQo+ID4gLQo+ID4gIHZvaWQgX19pbml0IG1lbWJsb2NrX2ZyZWVfcGFnZXMoc3RydWN0
IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgcGZuLAo+ID4gIAkJCQkJCQl1bnNpZ25lZCBpbnQg
b3JkZXIpCj4gPiAgewo+ID4gLS0gCj4gPiAyLjI1LjEKPiA+IAo+IAoKLS0gClNpbmNlcmVseSB5
b3VycywKTWlrZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
