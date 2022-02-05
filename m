Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B0A2F4AA998
	for <lists+openrisc@lfdr.de>; Sat,  5 Feb 2022 16:16:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6A5E323FA3;
	Sat,  5 Feb 2022 16:16:19 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id AB218242FA
 for <openrisc@lists.librecores.org>; Sat,  5 Feb 2022 16:16:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 686E860F30;
 Sat,  5 Feb 2022 15:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4703EC340E8;
 Sat,  5 Feb 2022 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644074175;
 bh=SIPhbdHKmWV6MppiCjN3egF7/k8xhne4taCD8UjBxe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NqK84Z/iupWxKYPEI7t/l9f9mbCubnVPv43sCFs7KVDlgV4qis7Y3OqlWg4Kd4UZK
 +Ibr1j6wyWWAPcB979opIraDAbnlA/FezcG28rW2Mc6D3RbXVmn0fGzbznEmEH6QuI
 bEb6kVg4t070TclIszraqg6GuziNJxooARnuLPOUDPHMAiCMQGCl3bGgH9L4cQBHoF
 qIyfjvURxwWwAgWnOryLm3VT43/Uvv8egflcBVV2tNGuoBIPXRh+99ndosUg3fc0IN
 c4grOz/8dbvyRoTZ7CjwCFpw/kZax7cpRf7zzdxOtkopTTGznYLmw06K7RtN5AWet4
 50cfL7ewB+UnQ==
Date: Sat, 5 Feb 2022 17:16:06 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <Yf6UthQtASGNgW8Q@kernel.org>
References: <20220205141956.3315419-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220205141956.3315419-1-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] mm: Remove mmu_gathers storage from
 remaining architectures
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
Cc: Jonas Bonn <jonas@southpole.se>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Brian Cain <bcain@codeaurora.org>,
 Nick Hu <nickhu@andestech.com>, David Hildenbrand <david@redhat.com>,
 linux-hexagon@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBGZWIgMDUsIDIwMjIgYXQgMTE6MTk6NTNQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT3JpZ2luYWxseSB0aGUgbW11X2dhdGhlcnMgd2VyZSByZW1vdmVkIGluIGNvbW1p
dCAxYzM5NTE3Njk2MjEgKCJtbTogbm93Cj4gdGhhdCBhbGwgb2xkIG1tdV9nYXRoZXIgY29kZSBp
cyBnb25lLCByZW1vdmUgdGhlIHN0b3JhZ2UiKS4gIEhvd2V2ZXIsCj4gdGhlIG9wZW5yaXNjIGFu
ZCBoZXhhZ29uIGFyY2hpdGVjdHVyZSB3ZXJlIG1lcmdlZCBhcm91bmQgdGhlIHNhbWUgdGltZQo+
IGFuZCBtbXVfZ2F0aGVycyB3YXMgbm90IHJlbW92ZWQuCj4gCj4gVGhpcyBwYXRjaCByZW1vdmVz
IHRoZW0gZnJvbSBvcGVucmlzYywgaGV4YWdvbiBhbmQgbmRzMzI6Cj4gCj4gTm90aWNlZCB3aGls
ZSBjbGVhbmluZyB0aGlzIHdhcm5pbmc6Cj4gCj4gICAgIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5j
OjQxOjE6IHdhcm5pbmc6IHN5bWJvbCAnbW11X2dhdGhlcnMnIHdhcyBub3QgZGVjbGFyZWQuIFNo
b3VsZCBpdCBiZSBzdGF0aWM/Cj4gCj4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+CgpBY2tlZC1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0u
Y29tPgoKPiAtLS0KPiAgYXJjaC9oZXhhZ29uL21tL2luaXQuYyAgfCAyIC0tCj4gIGFyY2gvbmRz
MzIvbW0vaW5pdC5jICAgIHwgMSAtCj4gIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5jIHwgMiAtLQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
aGV4YWdvbi9tbS9pbml0LmMgYi9hcmNoL2hleGFnb24vbW0vaW5pdC5jCj4gaW5kZXggZjAxZTkx
ZTEwZDk1Li4zMTY3YTNiNWM5N2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9oZXhhZ29uL21tL2luaXQu
Ywo+ICsrKyBiL2FyY2gvaGV4YWdvbi9tbS9pbml0LmMKPiBAQCAtMjksOCArMjksNiBAQCBpbnQg
bWF4X2tlcm5lbF9zZWcgPSAweDMwMzsKPiAgLyogIGluZGljYXRlIHBmbidzIG9mIGhpZ2ggbWVt
b3J5ICAqLwo+ICB1bnNpZ25lZCBsb25nIGhpZ2hzdGFydF9wZm4sIGhpZ2hlbmRfcGZuOwo+ICAK
PiAtREVGSU5FX1BFUl9DUFUoc3RydWN0IG1tdV9nYXRoZXIsIG1tdV9nYXRoZXJzKTsKPiAtCj4g
IC8qIERlZmF1bHQgY2FjaGUgYXR0cmlidXRlIGZvciBuZXdseSBjcmVhdGVkIHBhZ2UgdGFibGVz
ICovCj4gIHVuc2lnbmVkIGxvbmcgX2RmbHRfY2FjaGVfYXR0ID0gQ0FDSEVERUY7Cj4gIAo+IGRp
ZmYgLS1naXQgYS9hcmNoL25kczMyL21tL2luaXQuYyBiL2FyY2gvbmRzMzIvbW0vaW5pdC5jCj4g
aW5kZXggZjYzZjgzOTczOGM0Li44MjVjODVjYWIxYTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9uZHMz
Mi9tbS9pbml0LmMKPiArKysgYi9hcmNoL25kczMyL21tL2luaXQuYwo+IEBAIC0xOCw3ICsxOCw2
IEBACj4gICNpbmNsdWRlIDxhc20vdGxiLmg+Cj4gICNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ICAK
PiAtREVGSU5FX1BFUl9DUFUoc3RydWN0IG1tdV9nYXRoZXIsIG1tdV9nYXRoZXJzKTsKPiAgREVG
SU5FX1NQSU5MT0NLKGFub25fYWxpYXNfbG9jayk7Cj4gIGV4dGVybiBwZ2RfdCBzd2FwcGVyX3Bn
X2RpcltQVFJTX1BFUl9QR0RdOwo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9tbS9p
bml0LmMgYi9hcmNoL29wZW5yaXNjL21tL2luaXQuYwo+IGluZGV4IDk3MzA1YmRlMWIxNi4uM2Ew
MjFhYjZmMWFlIDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gKysrIGIv
YXJjaC9vcGVucmlzYy9tbS9pbml0LmMKPiBAQCAtMzgsOCArMzgsNiBAQAo+ICAKPiAgaW50IG1l
bV9pbml0X2RvbmU7Cj4gIAo+IC1ERUZJTkVfUEVSX0NQVShzdHJ1Y3QgbW11X2dhdGhlciwgbW11
X2dhdGhlcnMpOwo+IC0KPiAgc3RhdGljIHZvaWQgX19pbml0IHpvbmVfc2l6ZXNfaW5pdCh2b2lk
KQo+ICB7Cj4gIAl1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJfWk9ORVNdID0geyAw
IH07Cj4gLS0gCj4gMi4zMS4xCj4gCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
