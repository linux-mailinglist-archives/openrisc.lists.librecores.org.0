Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AF94239D1B0
	for <lists+openrisc@lfdr.de>; Sun,  6 Jun 2021 23:31:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9F32723F02;
	Sun,  6 Jun 2021 23:31:21 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 5FFB820CDA
 for <openrisc@lists.librecores.org>; Sun,  6 Jun 2021 23:31:20 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEFDA613B6;
 Sun,  6 Jun 2021 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623015078;
 bh=ZtDz+Tx3gDJURxeLGuynFGZ8uxab5SNEIC7k5srsrBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHcE9g6brTgSAV+4xVNhxekKQlGM0mhAwBWD7XpWpqvtSKGR2QVl9LLO9Fp8mdhc+
 pc81xS+K6zgxjC9BvkiLbrgqfQSTHMEsv0LbOBaFKiII1tEOu5/8nloj4MSsU82HIa
 zrNuIDNh84AL4LuphasPGIwe4LNbg9inob5KFPcyQWr6fCOpQ1hseHxL1zqLaM0xud
 rcUhT1KG4HC3/rPAMCNByPC09q5k03V88CjP/YnrWLRCt6Qt1kUehiQTJUTNwYN4hW
 To0R1RL/ILuw03NT52wJ9AiDWAT36NN77oYd2Bnz8ID2ZeewkpMb92YVMYNyVavhgv
 L/9jySVl4Hzcg==
Date: Mon, 7 Jun 2021 00:31:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <YL0+nZPViz5xzxca@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <20210604070633.32363-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604070633.32363-2-wangkefeng.wang@huawei.com>
Subject: Re: [OpenRISC] [PATCH v2 01/15] mm: add setup_initial_init_mm()
 helper
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
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gS2VmZW5nLAoKT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDM6MDY6MTlQTSArMDgwMCwg
S2VmZW5nIFdhbmcgd3JvdGU6Cj4gQWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciB0
byBzZXR1cCBrZXJuZWwgdGV4dCwKPiBkYXRhIGFuZCBicmsuCj4gCj4gQ2M6IGxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHVjbGludXgt
aDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPiBDYzogbGludXgtbTY4a0BsaXN0cy5saW51
eC1tNjhrLm9yZwo+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1zMzkwQHZn
ZXIua2VybmVsLm9yZwo+IENjOiB4ODZAa2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEtlZmVu
ZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9saW51
eC9tbV90eXBlcy5oIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaCBiL2luY2x1ZGUv
bGludXgvbW1fdHlwZXMuaAo+IGluZGV4IDVhYWNjMWMxMGE0NS4uZTFkMjQyOTA4OWE0IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgv
bW1fdHlwZXMuaAo+IEBAIC01NzIsNiArNTcyLDE0IEBAIHN0cnVjdCBtbV9zdHJ1Y3Qgewo+ICB9
Owo+ICAKPiAgZXh0ZXJuIHN0cnVjdCBtbV9zdHJ1Y3QgaW5pdF9tbTsKPiArc3RhdGljIGlubGlu
ZSB2b2lkIHNldHVwX2luaXRpYWxfaW5pdF9tbSh2b2lkICpzdGFydF9jb2RlLCB2b2lkICplbmRf
Y29kZSwKPiArCQkJCQkgdm9pZCAqZW5kX2RhdGEsIHZvaWQgKmJyaykKCkkgdGhpbmsgaXQncyBu
b3QgdGhhdCBwZXJmb3JtYW5jZSBzZW5zaXRpdmUgdG8gbWFrZSBpdCBpbmxpbmUuIEl0IGNhbiBi
ZQpwbGFjZWQgaW4gbW0vaW5pdC1tbS5jIHdpdGggYSBmb3J3YXJkIGRlY2xhcmF0aW9uIGluIG1t
LmgKCj4gK3sKPiArCWluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNpZ25lZCBsb25nKXN0YXJ0X2Nv
ZGU7Cj4gKwlpbml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxvbmcpZW5kX2NvZGU7Cj4gKwlp
bml0X21tLmVuZF9kYXRhID0gKHVuc2lnbmVkIGxvbmcpZW5kX2RhdGE7Cj4gKwlpbml0X21tLmJy
ayA9ICh1bnNpZ25lZCBsb25nKWJyazsKPiArfQogIAo+ICAvKiBQb2ludGVyIG1hZ2ljIGJlY2F1
c2UgdGhlIGR5bmFtaWMgYXJyYXkgc2l6ZSBjb25mdXNlcyBzb21lIGNvbXBpbGVycy4gKi8KPiAg
c3RhdGljIGlubGluZSB2b2lkIG1tX2luaXRfY3B1bWFzayhzdHJ1Y3QgbW1fc3RydWN0ICptbSkK
PiAtLSAKPiAyLjI2LjIKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
