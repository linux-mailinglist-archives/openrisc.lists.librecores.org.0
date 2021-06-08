Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEF939F9BB
	for <lists+openrisc@lfdr.de>; Tue,  8 Jun 2021 16:57:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D23D722E09;
	Tue,  8 Jun 2021 16:57:42 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5E47E209D6
 for <openrisc@lists.librecores.org>; Tue,  8 Jun 2021 16:57:41 +0200 (CEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FztdJ6WHszBDj8;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYF-J-sCzJxT; Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FztdJ5XkGzBDj7;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9A608B7BF;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kq4BMwCmb5qz; Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B2B78B7C0;
 Tue,  8 Jun 2021 16:57:39 +0200 (CEST)
To: Souptick Joarder <jrdr.linux@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
 <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
Date: Tue, 8 Jun 2021 16:57:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
Content-Language: fr
Subject: Re: [OpenRISC] [PATCH v3 resend 01/15] mm: add
 setup_initial_init_mm() helper
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, X86 ML <x86@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAwOC8wNi8yMDIxIMOgIDE2OjUzLCBTb3VwdGljayBKb2FyZGVyIGEgw6ljcml0wqA6Cj4g
T24gVHVlLCBKdW4gOCwgMjAyMSBhdCAxOjU2IFBNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndh
bmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBo
ZWxwZXIgdG8gc2V0dXAga2VybmVsIHRleHQsCj4+IGRhdGEgYW5kIGJyay4KPj4KPj4gQ2M6IGxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKPj4g
Q2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPj4gQ2M6IGxpbnV4LW02
OGtAbGlzdHMubGludXgtbTY4ay5vcmcKPj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMu
b3JnCj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+PiBDYzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4+
IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+PiBDYzogeDg2QGtlcm5lbC5vcmcKPj4g
U2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+
PiAtLS0KPj4gICBpbmNsdWRlL2xpbnV4L21tLmggfCAzICsrKwo+PiAgIG1tL2luaXQtbW0uYyAg
ICAgICB8IDkgKysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21t
LmgKPj4gaW5kZXggYzI3NGY3NWVmY2Y5Li4wMmFhMDU3NTQwYjcgMTAwNjQ0Cj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvbW0uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4gQEAgLTI0NCw2
ICsyNDQsOSBAQCBpbnQgX19hZGRfdG9fcGFnZV9jYWNoZV9sb2NrZWQoc3RydWN0IHBhZ2UgKnBh
Z2UsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+Pgo+PiAgICNkZWZpbmUgbHJ1X3Rv
X3BhZ2UoaGVhZCkgKGxpc3RfZW50cnkoKGhlYWQpLT5wcmV2LCBzdHJ1Y3QgcGFnZSwgbHJ1KSkK
Pj4KPj4gK3ZvaWQgc2V0dXBfaW5pdGlhbF9pbml0X21tKHZvaWQgKnN0YXJ0X2NvZGUsIHZvaWQg
KmVuZF9jb2RlLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICplbmRfZGF0YSwg
dm9pZCAqYnJrKTsKPj4gKwo+IAo+IEdlbnRsZSBxdWVyeSAtPiBpcyB0aGVyZSBhbnkgbGltaXRh
dGlvbiB0byBhZGQgaW5saW5lIGZ1bmN0aW9ucyBpbgo+IHNldHVwX2FyY2goKSBmdW5jdGlvbnMg
PwoKS2VmZW5nIGp1c3QgZm9sbG93ZWQgY29tbWVudCBmcm9tIE1pa2UgSSBndWVzcywgc2VlIApo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIw
MjEwNjA0MDcwNjMzLjMyMzYzLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vIzI2OTYyNTMK
CkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
