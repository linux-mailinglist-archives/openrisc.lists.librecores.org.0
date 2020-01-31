Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 93DF7163123
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E35A0205CB;
	Tue, 18 Feb 2020 21:00:18 +0100 (CET)
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 by mail.librecores.org (Postfix) with ESMTPS id 865AD20192
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 03:20:02 +0100 (CET)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 00V2JpRL020490
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 11:19:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 00V2JpRL020490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1580437192;
 bh=Rmw2ES2NtwlDLJNZ5F0cMIG+v7B9YVLRJoeV03Y+h9M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2zHNxt53hzEP5jckpzpUCyrhLpfwSGnJABGpEANWbiTk4Is8lc28PgKrxuKRIzVyL
 IG7OONYu4r5O1Poozp3DCQ2Cp48f2IWhggJazj6zxpXRsxfnyTHq5Ncu709c8DJR+l
 s4dmTAnDq43a8DOAyvAKQpf1RCMgdDA7WC3QCAFbRLxmGMCp9DvrJJaIjA8/pInqyM
 QdLx3si1Dd7NuPxXG49Z7nP03Z+HDQxMPGJt+TOgVmqgSKK41h65sE5r+YeVv/7Fj1
 uTBaBH+ZeU6pQ3G8iiI1tycwh/WQ+aKIF9P6Yh/XaQlAUjE2SutVTYh9FGG/N8fO52
 vSswElyZQRk9Q==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id x123so3469874vsc.2
 for <openrisc@lists.librecores.org>; Thu, 30 Jan 2020 18:19:51 -0800 (PST)
X-Gm-Message-State: APjAAAXfskRi3R5wOPHfBumCowT7B3uAiNzN6DRa1AQ56Ev1scN1oY2P
 GLkVOb6C+McYjI13D9ddQ0C4Z8polgDXdaU58LA=
X-Google-Smtp-Source: APXvYqzexMZUAD4bymyzre34E6fe//hwk0NuPtd/vurYf4ipBg/PIV8QUSWu4IiMCZ/JOMBf5eBe6jLVwqW23CMz2GE=
X-Received: by 2002:a67:6485:: with SMTP id y127mr5416364vsb.54.1580437190760; 
 Thu, 30 Jan 2020 18:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20200130191938.2444-1-krzk@kernel.org>
 <20200130213839.GW24874@lianli.shorne-pla.net>
In-Reply-To: <20200130213839.GW24874@lianli.shorne-pla.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 31 Jan 2020 11:19:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwE2My-kZZugH7L+6jteU4dosiDt8e-H03n_-VH8nT1Q@mail.gmail.com>
Message-ID: <CAK7LNATwE2My-kZZugH7L+6jteU4dosiDt8e-H03n_-VH8nT1Q@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:14 +0100
Subject: Re: [OpenRISC] [PATCH] openrisc: configs: Cleanup
 CONFIG_CROSS_COMPILE
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgoKT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgNjozOCBBTSBTdGFmZm9yZCBI
b3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiArY2M6IE1hc2FoaXJvLAo+Cj4gT24g
VGh1LCBKYW4gMzAsIDIwMjAgYXQgMDg6MTk6MzhQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToKPiA+IENPTkZJR19DUk9TU19DT01QSUxFIGlzIGdvbmUgc2luY2UgY29tbWl0IGYx
MDg5YzkyZGE3OSAoImtidWlsZDogcmVtb3ZlCj4gPiBDT05GSUdfQ1JPU1NfQ09NUElMRSBzdXBw
b3J0IikuCj4KPiBJIHNlZSB0aGlzIHBhdGNoIGlzIGFscmVhZHkgaW4sIGJ1dCBkb2VzIGl0IGJy
ZWFrIDAtZGF5IHRlc3QgdG9vbHMgdGhhdCBkZXBlbmQKPiBvbiB0aGlzIENPTkZJR19DUk9TU19D
T01QSUxFIHNldHVwPyAgSSBndWVzcyBpdHMgYmVlbiBpbiBzaW5jZSAyMDE4LCBzbyB0aGVyZQo+
IHNob3VsZCBiZSBubyBwcm9ibGVtLgoKCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoZSAwLWRh
eSBib3QgcGFzc2VzIENST1NTX0NPTVBJTEU9IGZyb20gdGhlCmNvbW1hbmQgbGluZSBiZWNhdXNl
IEkgc2VlIGl0IGluICJtYWtlLmNyb3NzIiBzY3JpcHQsIHdoaWNoIGlzCmF0dGFjaGVkIGluIHJl
cG9ydHMuCgpJIGRpZCBub3QgaGVhciBhbnkgY29tcGxhaW50IGZyb20gMC1kYXkgYm90IG1haW50
YWluZXJzLgoKCgo+IENhbiB5b3UgYWxzbyBoZWxwIHRvIHVwZGF0ZSAiRG9jdW1lbnRhdGlvbi9v
cGVucmlzYy9vcGVucmlzY19wb3J0LnJzdCI/ICBJdAo+IG1lbnRpb25zIHRoZSBidWlsZCBzdGVw
cyBhcmU6Cj4KPiAgICAgQnVpbGQgdGhlIExpbnV4IGtlcm5lbCBhcyB1c3VhbDo6Cj4KPiAgICAg
ICAgIG1ha2UgQVJDSD1vcGVucmlzYyBkZWZjb25maWcKPiAgICAgICAgIG1ha2UgQVJDSD1vcGVu
cmlzYwo+Cj4gVGhpcyBub3cgY2hhbmdlcywgSSB1c2VkIHRvIHVzZSBgbWFrZSBBUkNIPW9wZW5y
aXNjIENST1NTX0NPTVBJTEU9b3Ixay1saW51eC1gCj4gaXMgdGhpcyBzdGlsbCBnb2luZyB0byB3
b3JrPwoKWWVzLCBpdCBzdGlsbCB3b3Jrcy4KCgoKPiAtU3RhZmZvcmQKPgo+ID4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAg
YXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVmY29uZmlnICAgIHwgMSAtCj4gPiAgYXJj
aC9vcGVucmlzYy9jb25maWdzL3NpbXBsZV9zbXBfZGVmY29uZmlnIHwgMSAtCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2NvbmZpZ3Mvb3Ixa3NpbV9kZWZjb25maWcgYi9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ix
a3NpbV9kZWZjb25maWcKPiA+IGluZGV4IGQ4ZmY0ZjhmZmI4OC4uNzVmMmRhMzI0ZDBlIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVmY29uZmlnCj4gPiAr
KysgYi9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa3NpbV9kZWZjb25maWcKPiA+IEBAIC0xLDQg
KzEsMyBAQAo+ID4gLUNPTkZJR19DUk9TU19DT01QSUxFPSJvcjFrLWxpbnV4LSIKPiA+ICBDT05G
SUdfTk9fSFo9eQo+ID4gIENPTkZJR19MT0dfQlVGX1NISUZUPTE0Cj4gPiAgQ09ORklHX0JMS19E
RVZfSU5JVFJEPXkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxl
X3NtcF9kZWZjb25maWcgYi9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZjb25m
aWcKPiA+IGluZGV4IDY0Mjc4OTkyZGY5Yy4uZmY0OWQ4NjhlMDQwIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9vcGVucmlzYy9jb25maWdzL3NpbXBsZV9zbXBfZGVmY29uZmlnCj4gPiArKysgYi9hcmNo
L29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZjb25maWcKPiA+IEBAIC0xLDQgKzEsMyBA
QAo+ID4gLUNPTkZJR19DUk9TU19DT01QSUxFPSJvcjFrLWxpbnV4LSIKPiA+ICBDT05GSUdfTE9D
QUxWRVJTSU9OPSItc2ltcGxlLXNtcCIKPiA+ICBDT05GSUdfTk9fSFo9eQo+ID4gIENPTkZJR19M
T0dfQlVGX1NISUZUPTE0Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKCgotLSAKQmVzdCBSZWdhcmRz
Ck1hc2FoaXJvIFlhbWFkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
