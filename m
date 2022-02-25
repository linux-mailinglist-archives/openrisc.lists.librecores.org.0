Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 56E6C4C3D34
	for <lists+openrisc@lfdr.de>; Fri, 25 Feb 2022 05:31:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1E4DA2482A;
	Fri, 25 Feb 2022 05:31:35 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 9E11A2481D
 for <openrisc@lists.librecores.org>; Fri, 25 Feb 2022 05:31:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73196618D2;
 Fri, 25 Feb 2022 04:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF54C340E7;
 Fri, 25 Feb 2022 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763491;
 bh=GLLjJ1DIY+pcaD5Wxr3GGBnMqVEARs5wDghfvFD40O8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hIVBklbMz20Too2yeCCQf4FR/ynGbzZ2XY3Q4fmoq3AjGgtKL335uxFhoNA+O7GwZ
 1xI9NTIagmUc/WGvwJaXmKN3m6iRlWo7xNSh2VqLx5iFbuZhtPqHWNdyPZFCcQmvJg
 B/wRcBuuSGk7QMYD4O/BWhUPyLQM2U2ZADwP6zy8YV9xa2LwvKMXbfS9owW1MUfUTw
 6fHO3FMrRRy8SAogw4atZuZJaPKXrV3/3aWAhAbetYfwpuO/cHRAnjSsimimMy3Xa2
 RW5lD3MIKq24lj+jc1tNunbJNi08raKakbPeJIfU1woaZaqtvTkkP3acIOYmeu0z/S
 VxtoRQs+6FTNQ==
Message-ID: <d12e6bcc-089d-568b-62cf-036c68c08ca0@kernel.org>
Date: Thu, 24 Feb 2022 22:31:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 13/18] uaccess: generalize access_ok()
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAyLzE2LzIyIDA3OjEzLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhlcmUgYXJlIG1hbnkgZGlmZmVyZW50IHdheXMg
dGhhdCBhY2Nlc3Nfb2soKSBpcyBkZWZpbmVkIGFjcm9zcwo+IGFyY2hpdGVjdHVyZXMsIGJ1dCBp
biB0aGUgZW5kLCB0aGV5IGFsbCBqdXN0IGNvbXBhcmUgYWdhaW5zdCB0aGUKPiB1c2VyX2FkZHJf
bWF4KCkgdmFsdWUgb3IgdGhleSBhY2NlcHQgYW55dGhpbmcuCj4gCj4gUHJvdmlkZSBvbmUgZGVm
aW5pdGlvbiB0aGF0IHdvcmtzIGZvciBtb3N0IGFyY2hpdGVjdHVyZXMsIGNoZWNraW5nCj4gYWdh
aW5zdCBUQVNLX1NJWkVfTUFYIGZvciB1c2VyIHByb2Nlc3NlcyBvciBza2lwcGluZyB0aGUgY2hl
Y2sgaW5zaWRlCj4gb2YgdWFjY2Vzc19rZXJuZWwoKSBzZWN0aW9ucy4KPiAKPiBGb3IgYXJjaGl0
ZWN0dXJlcyB3aXRob3V0IENPTkZJR19TRVRfRlMoKSwgdGhpcyBzaG91bGQgYmUgdGhlIGZhc3Rl
c3QKPiBjaGVjaywgYXMgaXQgY29tZXMgZG93biB0byBhIHNpbmdsZSBjb21wYXJpc29uIG9mIGEg
cG9pbnRlciBhZ2FpbnN0IGEKPiBjb21waWxlLXRpbWUgY29uc3RhbnQsIHdoaWxlIHRoZSBhcmNo
aXRlY3R1cmUgc3BlY2lmaWMgdmVyc2lvbnMgdGVuZCB0bwo+IGRvIHNvbWV0aGluZyBtb3JlIGNv
bXBsZXggZm9yIGhpc3RvcmljIHJlYXNvbnMgb3IgZ2V0IHNvbWV0aGluZyB3cm9uZy4KPiAKPiBU
eXBlIGNoZWNraW5nIGZvciBfX3VzZXIgYW5ub3RhdGlvbnMgaXMgaGFuZGxlZCBpbmNvbnNpc3Rl
bnRseSBhY3Jvc3MKPiBhcmNoaXRlY3R1cmVzLCBidXQgdGhpcyBpcyBlYXNpbHkgc2ltcGxpZmll
ZCBhcyB3ZWxsIGJ5IHVzaW5nIGFuIGlubGluZQo+IGZ1bmN0aW9uIHRoYXQgdGFrZXMgYSAnY29u
c3Qgdm9pZCBfX3VzZXIgKicgYXJndW1lbnQuIEEgaGFuZGZ1bCBvZgo+IGNhbGxlcnMgbmVlZCBh
biBleHRyYSBfX3VzZXIgYW5ub3RhdGlvbiBmb3IgdGhpcy4KPiAKPiBTb21lIGFyY2hpdGVjdHVy
ZXMgaGFkIHRyaWNrIHRvIHVzZSAzMy1iaXQgb3IgNjUtYml0IGFyaXRobWV0aWMgb24gdGhlCj4g
YWRkcmVzc2VzIHRvIGNhbGN1bGF0ZSB0aGUgb3ZlcmZsb3csIGhvd2V2ZXIgdGhpcyBzaW1wbGVy
IHZlcnNpb24gdXNlcwo+IGZld2VyIHJlZ2lzdGVycywgd2hpY2ggbWVhbnMgaXQgY2FuIHByb2R1
Y2UgYmV0dGVyIG9iamVjdCBjb2RlIGluIHRoZQo+IGVuZCBkZXNwaXRlIG5lZWRpbmcgYSBzZWNv
bmQgKHN0YXRpY2FsbHkgcHJlZGljdGVkKSBicmFuY2guCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IEFja2VkLWJ5OiBNYXJrIFJ1dGxhbmQgPG1hcmsu
cnV0bGFuZEBhcm0uY29tPiBbYXJtNjQsIGFzbS1nZW5lcmljXQo+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gICBhcmNoL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKwo+ICAgYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS91
YWNjZXNzLmggICAgICB8IDM0ICsrKy0tLS0tLS0tLS0tLQo+ICAgYXJjaC9hcmMvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oICAgICAgICB8IDI5IC0tLS0tLS0tLS0tLS0KPiAgIGFyY2gvYXJtL2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICAgfCAyMCArLS0tLS0tLS0KPiAgIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oICAgICAgfCAxMSArKy0tLQo+ICAgYXJjaC9jc2t5L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaCAgICAgICB8ICA4IC0tLS0KPiAgIGFyY2gvaGV4YWdvbi9pbmNsdWRlL2Fz
bS91YWNjZXNzLmggICAgfCAyNSAtLS0tLS0tLS0tLS0KPiAgIGFyY2gvaWE2NC9pbmNsdWRlL2Fz
bS91YWNjZXNzLmggICAgICAgfCAgNSArLS0KPiAgIGFyY2gvbTY4ay9LY29uZmlnLmNwdSAgICAg
ICAgICAgICAgICAgfCAgMSArCj4gICBhcmNoL202OGsvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAg
ICAgIHwgMTkgKy0tLS0tLS0tCj4gICBhcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vdWFjY2Vz
cy5oIHwgIDggKy0tLQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICB8
IDI5ICstLS0tLS0tLS0tLS0KPiAgIGFyY2gvbmRzMzIvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAg
ICAgfCAgNyArLS0tCj4gICBhcmNoL25pb3MyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgIHwg
MTEgKy0tLS0KCkFja2VkLWJ5OiBEaW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
