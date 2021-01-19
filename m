Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 79FF02FC1A8
	for <lists+openrisc@lfdr.de>; Tue, 19 Jan 2021 21:56:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 092D5205A7;
	Tue, 19 Jan 2021 21:56:57 +0100 (CET)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mail.librecores.org (Postfix) with ESMTPS id 437FB2045C
 for <openrisc@lists.librecores.org>; Tue, 19 Jan 2021 21:56:55 +0100 (CET)
Received: from [100.113.1.157] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 67/2D-41911-69747006;
 Tue, 19 Jan 2021 20:56:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRWlGSWpSXmKPExsUS8J9tou40d/Y
 Eg6WXBSye3drLZLGp8zKbxd6pDxgdmD12zrrL7nHocAejx/oN2xgDmKNYM/OS8isSWDOu9P9i
 LJguVPGp7zV7A+N7vi5GTg4hgQZGiQcTZUBsCQE/iR9Letm6GLmA4msYJWZtO80O4exllNhwc
 R4TSJWwQIrE0WeLgRIcHCICuhJzfoKFmQXyJWa+f8wCUf+GUeLv6VdgCTYBM4n1L54xg9i8Ar
 YS7We2soLYLAKqEgfPrweLiwpESCzc38kKUSMocXLmExYQm1MgUGLP2tPMILuYBTQl1u/Sh9g
 lLnHryXyovdoSyxa+ZoZ4RlNizak1zBDPKEhMmvWUCaRVQiBO4ssdUwjTWmLi5kSICjWJ+Yu7
 GCFsTon3Hz4wTWAUn4XkhlkIe2ch2TsLyd4FjCyrGC2TijLTM0pyEzNzdA0NDHQNDY11DXSNT
 I30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgTGaUsjwZwfj6jcf9A4xSnIwKY
 nyvvjOliDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgpfPhT1BSLAoNT21Ii0zB5guYNISHDxKIrw
 XQNK8xQWJucWZ6RCpU4zGHMeOzlvEzHHz/ZJFzEIsefl5qVLivEWuQKUCIKUZpXlwg2Bp7BKj
 rJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5TkCk8mXklcPteAZ3CBHTK/UdsIKeUJCKkpBqYH
 Nc07F2bv0VO729OSnrwfYPFjhVRcUsXehsfYTOe+zAnsrYu4R9La9EZ7vMePrevrlonMrvitv
 hx4RRnvYoX3lNXSj/Tdzwz7d2HvRMn/3l34LfQzhPtvbufsduIrLr62ubX5RRPnuIyqXOGhya
 6/H37o+Z+6esWhUfrCoJFTMIX5qpO6jnBfOzs9l+2u0sOXXeb8lhs1faHD6b8WDj/tPXRmb0T
 uPv7Lbw6dTonbZyj/FRu76ZbXf/ffF7B5lKloOj3XaRamYf3avt29cKdX1dkr7r3zn/mP5HCL
 PNLv4I6ttxJjD+jsXrDEq9JE/o1i3oS/01nTjRfMN8t4n6ujipr0hqLA6/Xhh7yuGh6iE+JpT
 gj0VCLuag4EQCftXR93gMAAA==
X-Env-Sender: Abhijeet.Badurkar@duagon.com
X-Msg-Ref: server-21.tower-223.messagelabs.com!1611089813!1832194!1
X-Originating-IP: [80.255.6.145]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28694 invoked from network); 19 Jan 2021 20:56:54 -0000
Received: from unknown (HELO keys.men.de) (80.255.6.145)
 by server-21.tower-223.messagelabs.com with DHE-RSA-AES256-SHA encrypted SMTP;
 19 Jan 2021 20:56:54 -0000
Received: from MEN-EX01.intra.men.de ([192.168.1.1])
 by keys.men.de (PGP Universal service);
 Tue, 19 Jan 2021 21:56:54 +0100
X-PGP-Universal: processed; by keys.men.de on Tue, 19 Jan 2021 21:56:54 +0100
Received: from MEN-EX01.intra.men.de (192.168.1.1) by MEN-EX01.intra.men.de
 (192.168.1.1) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 19 Jan
 2021 21:56:53 +0100
Received: from [10.64.14.204] (10.64.14.204) by MEN-EX01.intra.men.de
 (192.168.1.1) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 21:56:53 +0100
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <81bbd71a-ff79-9f15-753a-d47b36b91756@pengutronix.de>
 <ea134d96-0856-62af-ea19-f6e0c2d80c90@duagon.com>
 <20210118212917.GI2002709@lianli.shorne-pla.net>
 <CAMuHMdU+2oopABWih=-5t01gwaX-EQauMz7u=xFxiA62WJ4+8A@mail.gmail.com>
From: Abhijeet Badurkar <abhijeet.badurkar@duagon.com>
Message-ID: <d56117cb-c2f2-a33e-5bcf-c9d2b7293f42@duagon.com>
Date: Tue, 19 Jan 2021 21:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU+2oopABWih=-5t01gwaX-EQauMz7u=xFxiA62WJ4+8A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.64.14.204]
X-ClientProxiedBy: MEN-EX01.intra.men.de (192.168.1.1) To
 MEN-EX01.intra.men.de (192.168.1.1)
X-EXCLAIMER-MD-CONFIG: e4841e51-7998-49c0-ba41-8b8a0e2d8962
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Loop: 2
Subject: Re: [OpenRISC] Fwd: Re: [PATCH v5] net: can: Introduce MEN
 16Z192-00 CAN controller driver
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
Cc: Openrisc <openrisc@lists.librecores.org>, andreas.geissler@duagon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

77u/CkhpIEdlZXJ0LAoKY2FuIG15IHBhdGNoIGFuZCB5b3VyIHBhdGNoIGJlIGludGVncmF0ZWQg
c28gdGhhdCB0aGV5IGdldCB0aHJvdWdoIHdpdGhvdXQgc3BhcnNlIHdhcm5pbmc/IG9yIEkgd2ls
bCBoYXZlIHRvIHdhaXQgdGlsbCB5b3VyIHBhdGNoIGlzIHRocm91Z2g/CgpUaHguCgpBYmhpamVl
dAoKCgpNLiBTYy4KQWJoaWplZXQgQmFkdXJrYXIKU29mdHdhcmUgRW5naW5lZXJpbmcgCkJ1c2lu
ZXNzIFVuaXQgQ29tcHV0aW5nIFN5c3RlbXMsIGR1YWdvbgoKZHVhZ29uIEdlcm1hbnkgR21iSApO
ZXV3aWVkZXIgU3RyYcOfZSAxLTcKOTA0MTEgTsO8cm5iZXJnCkRldXRzY2hsYW5kClBob25lCQkr
NDkgOTExIDk5IDMzIDUgLSAyMTkKd3d3LmR1YWdvbi5jb20KCmR1YWdvbiBHZXJtYW55IEdtYkgg
LSBHZXNjaMOkZnRzZsO8aHJlcjogRHIuIE1pY2hhZWwgR29sZGJhY2ggLSBNYXRoaWFzIEthbW9s
eiAtIEthbGluYSBTY290dCAtIEhhbmRlbHNyZWdpc3Rlci9UcmFkZSBSZWdpc3RlciBBRyBOw7xy
bmJlcmcgSFJCIDU1NDAKClRoaXMgbWVzc2FnZSBhbmQvb3IgYXR0YWNobWVudHMgbWF5IGJlIHBy
aXZpbGVnZWQgb3IgY29uZmlkZW50aWFsLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50LCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgdHJhbnNtaXR0YWwgaW4gZXJyb3I7IGFueSByZXZpZXcsIGRpc3NlbWluYXRpb24sIG9yIGNv
cHlpbmcgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmVkIHRoaXMgdHJhbnNt
aXR0YWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdXMgaW1tZWRpYXRlbHkgYnkgcmVwbHkgYW5k
IGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGFsbCBpdHMgYXR0YWNobWVudHMu
IFRoYW5rIHlvdS4KT24gMTkuMDEuMjEgMDg6MzcsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
PiBIaSBTdGFmZm9yZCwKPiAKPiBPbiBNb24sIEphbiAxOCwgMjAyMSBhdCAxMDoyOSBQTSBTdGFm
Zm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgSmFuIDE4LCAy
MDIxIGF0IDA5OjA5OjA0UE0gKzAxMDAsIEFiaGlqZWV0IEJhZHVya2FyIHdyb3RlOgo+Pj4gaSBh
bSBnZXR0aW5nIHNwYXJzZSB3YXJuaW5nIHJlZ2FyZGluZyBpb3VubWFwIGltcGxlbWVudGF0aW9u
IG9mIG9wZW5yaXNjIGFyY2hpdGVjdHVyZSBmb3IgbXkgQ0FOIGRyaXZlciBwYXRjaC4gSXMgdGhl
cmUgYW55IHNwZWNpZmljIHJlYXNvbiB3aHkgaW91bm1hcCBvZiBvcGVucmlzYyBkb2Vzbid0IGhh
dmUgX19pb21lbSBhbm5ub3RhdGlvbj8gQ291bGQgeW91IHBsZWFzZSBzdWdnZXN0IGEgZml4IGZv
ciB0aGlzPwo+Pgo+PiBIZWxsbywKPj4KPj4gU29ycnkgSSBtaXNzZWQgdGhpcyBwYXRjaCBhcyBJ
IGRpZG4ndCByZWNvZ25pemUgdGhlIHN1YmplY3QuCj4+Cj4+IFlvdSBjb3VsZCBzZW5kIGEgcGF0
Y2ggZm9yIGlvdW5tYXAgaWYgeW91IGxpa2UuICBPdGhlcndpc2UgSSBjYW4gZ2V0IGFyb3VuZCB0
bwo+PiBpdCBpbiBhIGZldyBkYXlzLgo+Pgo+PiBUaGUgcGF0Y2ggd291bGQgYmUgc29tZXRoaW5n
IGxpa2U6Cj4+Cj4+IC0tLSBhL2FyY2gvb3BlbnJpc2MvbW0vaW9yZW1hcC5jCj4+ICsrKyBiL2Fy
Y2gvb3BlbnJpc2MvbW0vaW9yZW1hcC5jCj4+IEBAIC03Nyw3ICs3Nyw3IEBAIHZvaWQgX19pb21l
bSAqX19yZWYgaW9yZW1hcChwaHlzX2FkZHJfdCBhZGRyLCB1bnNpZ25lZCBsb25nCj4+IHNpemUp
Cj4+ICB9Cj4+ICBFWFBPUlRfU1lNQk9MKGlvcmVtYXApOwo+Pgo+PiAtdm9pZCBpb3VubWFwKHZv
aWQgKmFkZHIpCj4+ICt2b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVtICphZGRyKQo+PiAgewo+PiAg
ICAgICAgIC8qIElmIHRoZSBwYWdlIGlzIGZyb20gdGhlIGZpeG1hcCBwb29sIHRoZW4gd2UganVz
dCBjbGVhciBvdXQKPj4gICAgICAgICAgKiB0aGUgZml4bWFwIG1hcHBpbmcuCj4gCj4gVGhhdCBp
cyBub3Qgc3VmZmljaWVudC4KPiBQbGVhc2UgY2hlY2sgb3V0IHRoZSBwYXRjaCBJIHN1Ym1pdHRl
ZCB0aHJlZSB3ZWVrcyBhZ286Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMTIy
ODA4MzMyOC4zODIzNDMxLTEtZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IAo+IEdye29ldGplLGVl
dGluZ31zLAo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4gCgotLSAKQWJoaWpl
ZXQgQmFkdXJrYXIgLSBTb2Z0d2FyZSBFbmdpbmVlcgoKIApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
