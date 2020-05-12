Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD6B1D1FFF
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D3613202EB;
	Wed, 13 May 2020 22:17:37 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 06A4220587
 for <openrisc@lists.librecores.org>; Tue, 12 May 2020 16:45:14 +0200 (CEST)
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E64CB206A3;
 Tue, 12 May 2020 14:45:03 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-17-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <fb98853b-c02a-a682-443e-2ae62d0502d9@linux-m68k.org>
Date: Wed, 13 May 2020 00:44:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510075510.987823-17-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 16/31] m68knommu: use asm-generic/cacheflush.h
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gMTAvNS8yMCA1OjU0IHBtLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBtNjhrbm9tbXUgbmVlZHMgYWxtb3N0IG5vIGNhY2hlIGZsdXNoaW5nIHJvdXRpbmVzIG9m
IGl0cyBvd24uICBSZWx5IG9uCj4gYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIGZvciB0aGUgZGVm
YXVsdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
CgpBY2tlZC1ieTogR3JlZyBVbmdlcmVyIDxnZXJnQGxpbnV4LW02OGsub3JnPgoKUmVnYXJkcwpH
cmVnCgoKPiAtLS0KPiAgIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX25vLmggfCAx
OSArKy0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2hfbm8uaCBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX25vLmgK
PiBpbmRleCAxMWU5YTlkY2JmYjI0Li4yNzMxZjA3ZTdiZThjIDEwMDY0NAo+IC0tLSBhL2FyY2gv
bTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX25vLmgKPiArKysgYi9hcmNoL202OGsvaW5jbHVk
ZS9hc20vY2FjaGVmbHVzaF9uby5oCj4gQEAgLTksMjUgKzksOCBAQAo+ICAgI2luY2x1ZGUgPGFz
bS9tY2ZzaW0uaD4KPiAgIAo+ICAgI2RlZmluZSBmbHVzaF9jYWNoZV9hbGwoKQkJCV9fZmx1c2hf
Y2FjaGVfYWxsKCkKPiAtI2RlZmluZSBmbHVzaF9jYWNoZV9tbShtbSkJCQlkbyB7IH0gd2hpbGUg
KDApCj4gLSNkZWZpbmUgZmx1c2hfY2FjaGVfZHVwX21tKG1tKQkJCWRvIHsgfSB3aGlsZSAoMCkK
PiAtI2RlZmluZSBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIHN0YXJ0LCBlbmQpCWRvIHsgfSB3aGls
ZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9jYWNoZV9wYWdlKHZtYSwgdm1hZGRyKQkJZG8geyB9IHdo
aWxlICgwKQo+ICAgI2RlZmluZSBmbHVzaF9kY2FjaGVfcmFuZ2Uoc3RhcnQsIGxlbikJCV9fZmx1
c2hfZGNhY2hlX2FsbCgpCj4gLSNkZWZpbmUgQVJDSF9JTVBMRU1FTlRTX0ZMVVNIX0RDQUNIRV9Q
QUdFIDAKPiAtI2RlZmluZSBmbHVzaF9kY2FjaGVfcGFnZShwYWdlKQkJCWRvIHsgfSB3aGlsZSAo
MCkKPiAtI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF9sb2NrKG1hcHBpbmcpCQlkbyB7IH0gd2hp
bGUgKDApCj4gLSNkZWZpbmUgZmx1c2hfZGNhY2hlX21tYXBfdW5sb2NrKG1hcHBpbmcpCWRvIHsg
fSB3aGlsZSAoMCkKPiAgICNkZWZpbmUgZmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0LCBsZW4pCQlf
X2ZsdXNoX2ljYWNoZV9hbGwoKQo+IC0jZGVmaW5lIGZsdXNoX2ljYWNoZV9wYWdlKHZtYSxwZykJ
CWRvIHsgfSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEs
cGcsYWRyLGxlbikJZG8geyB9IHdoaWxlICgwKQo+IC0jZGVmaW5lIGZsdXNoX2NhY2hlX3ZtYXAo
c3RhcnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9jYWNoZV92dW5t
YXAoc3RhcnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAoMCkKPiAtCj4gLSNkZWZpbmUgY29weV90b191
c2VyX3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAo+IC0JbWVtY3B5KGRz
dCwgc3JjLCBsZW4pCj4gLSNkZWZpbmUgY29weV9mcm9tX3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZh
ZGRyLCBkc3QsIHNyYywgbGVuKSBcCj4gLQltZW1jcHkoZHN0LCBzcmMsIGxlbikKPiAgIAo+ICAg
dm9pZCBtY2ZfY2FjaGVfcHVzaCh2b2lkKTsKPiAgIAo+IEBAIC05OCw0ICs4MSw2IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBjYWNoZV9jbGVhcih1bnNpZ25lZCBsb25nIHBhZGRyLCBpbnQgbGVuKQo+
ICAgCV9fY2xlYXJfY2FjaGVfYWxsKCk7Cj4gICB9Cj4gICAKPiArI2luY2x1ZGUgPGFzbS1nZW5l
cmljL2NhY2hlZmx1c2guaD4KPiArCj4gICAjZW5kaWYgLyogX002OEtOT01NVV9DQUNIRUZMVVNI
X0ggKi8KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
