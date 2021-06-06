Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 255FB39D1A6
	for <lists+openrisc@lfdr.de>; Sun,  6 Jun 2021 23:29:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D412120CDA;
	Sun,  6 Jun 2021 23:29:23 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6CDBB2159C
 for <openrisc@lists.librecores.org>; Sun,  6 Jun 2021 23:29:21 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 953E4613B6;
 Sun,  6 Jun 2021 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623014959;
 bh=4t5DawWhLmQPAFGRKhX1jFE4WEqbArxXgmERWe2C0xQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wu/fyJA4UR/3OsXx5PdnZuKJmqUDl6cQ0I5qOPmOobYB/YwD3loa7CHDMxmjDs7+O
 /+vTonUI3DKMDg+OJCEqqvIqeoGeqCBaFfCM6MGkwmW6KvTZO5CLkleOMNy5KmfR4d
 PteqC/M3+gPE1uiUsTSHvYSMYrpSkJ75a30BXywU3cSKzUfAv/A0+aJ76/IGuUYyhl
 S6LUi9EmnHUL5lEcDnAewWs8EsYomaOBUCef/cImLCqjaabNrEeHJoCWkyMWvCEGV1
 9+bVS1xXN0QGlOiLh2r3UXefQeesEuK/PQnscumw1S0RmHISk2eF6NrfUP8ytWcSpP
 sTzKK7DJdkKEw==
Date: Mon, 7 Jun 2021 00:29:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <YL0+Jargm+y9aqx1@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
Subject: Re: [OpenRISC] [PATCH v2 00/15] init_mm: cleanup ARCH's
 text/data/brk setup code
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
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gS2VmZW5nLAoKT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDM6MDY6MThQTSArMDgwMCwg
S2VmZW5nIFdhbmcgd3JvdGU6Cj4gQWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciwg
dGhlbiB1c2UgaXQKPiB0byBjbGVhbnVwIHRoZSB0ZXh0LCBkYXRhIGFuZCBicmsgc2V0dXAgY29k
ZS4KPiAKPiB2MjoKPiAtIGNoYW5nZSBhcmd1bWVudCBmcm9tICJjaGFyICoiIHRvICJ2b2lkICoi
IHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4gICBzdWdnZXN0ZWQgYnkgR2VlcnQgVXl0dGVyaG9l
dmVuCj4gLSB1c2UgTlVMTCBpbnN0ZWFkIG9mICh2b2lkICopMCBvbiBoODMwMCBhbmQgbTY4awo+
IC0gY29sbGVjdCBBQ0tzCj4gCj4gQ2M6IGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4
LWNza3lAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UuanAKPiBDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhrLm9yZwo+IENjOiBvcGVu
cmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZwo+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNo
QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+IEtlZmVu
ZyBXYW5nICgxNSk6Cj4gICBtbTogYWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlcgo+
ICAgYXJjOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4gICBhcm06IGNvbnZl
cnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPiAgIGFybTY0OiBjb252ZXJ0IHRvIHNldHVw
X2luaXRpYWxfaW5pdF9tbSgpCj4gICBjc2t5OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5p
dF9tbSgpCj4gICBoODMwMDogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+ICAg
bTY4azogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+ICAgbmRzMzI6IGNvbnZl
cnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPiAgIG5pb3MyOiBjb252ZXJ0IHRvIHNldHVw
X2luaXRpYWxfaW5pdF9tbSgpCj4gICBvcGVucmlzYzogY29udmVydCB0byBzZXR1cF9pbml0aWFs
X2luaXRfbW0oKQo+ICAgcG93ZXJwYzogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0o
KQo+ICAgcmlzY3Y6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPiAgIHMzOTA6
IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPiAgIHNoOiBjb252ZXJ0IHRvIHNl
dHVwX2luaXRpYWxfaW5pdF9tbSgpCj4gICB4ODY6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9p
bml0X21tKCkKCkkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBBRkFJVSB0aGUgaW5p
dF9tbS5zdGFydF9jb2RlIGFuZCBvdGhlcgpmaWVsZHMgYXJlIG5vdCB1c2VkIHJlYWxseSBlYXJs
eSBzbyB0aGUgbmV3IHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCmZ1bmN0aW9uIGNhbiBiZSBjYWxs
ZWQgaW4gdGhlIGdlbmVyaWMgY29kZSBvdXRzaWRlIHNldHVwX2FyY2goKSwgZS5nIGluCm1tX2lu
aXQoKS4KIAo+ICBhcmNoL2FyYy9tbS9pbml0LmMgICAgICAgICAgICAgICAgIHwgNSArLS0tLQo+
ICBhcmNoL2FybS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL2Fy
bTY0L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL2Nza3kva2VybmVs
L3NldHVwLmMgICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL202OGsva2VybmVsL3NldHVwX21tLmMgICAgICAg
IHwgNSArLS0tLQo+ICBhcmNoL202OGsva2VybmVsL3NldHVwX25vLmMgICAgICAgIHwgNSArLS0t
LQo+ICBhcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNo
L25pb3MyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL29wZW5yaXNj
L2tlcm5lbC9zZXR1cC5jICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL3Bvd2VycGMva2VybmVsL3Nl
dHVwLWNvbW1vbi5jIHwgNSArLS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAg
ICAgIHwgNSArLS0tLQo+ICBhcmNoL3MzOTAva2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgNSAr
LS0tLQo+ICBhcmNoL3NoL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgIHwgNSArLS0tLQo+ICBh
cmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ICBpbmNsdWRlL2xp
bnV4L21tX3R5cGVzLmggICAgICAgICAgIHwgOCArKysrKysrKwo+ICAxNiBmaWxlcyBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjI2LjIKPiAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
