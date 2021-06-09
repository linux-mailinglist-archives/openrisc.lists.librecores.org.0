Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 758F93A1F6C
	for <lists+openrisc@lfdr.de>; Wed,  9 Jun 2021 23:53:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 56CD5233BA;
	Wed,  9 Jun 2021 23:53:22 +0200 (CEST)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by mail.librecores.org (Postfix) with ESMTP id DAA5E200E4
 for <openrisc@lists.librecores.org>; Wed,  9 Jun 2021 23:53:20 +0200 (CEST)
Received: from [192.168.126.129] ([146.241.205.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id r68WltruIWlaqr68WlxDSi; Wed, 09 Jun 2021 23:53:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1623275600; bh=FHyP9Tf1e3Zyn0L5mpLcG06aFo88inf609cFiO1YVC8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=S4q9AR2wf8QqcvpieI/XLA5GOW/VIGBHHkLBzczMyhvULlknqJOFaXAvxRs7kJ+wt
 dF7uVtvgcRGNsZZuWO65yhdxJDoRH7CA767CrVqbzGHyOyq5v9gmfzhAEfgMvMSFE2
 lLB+iIW0KrBdfe9sRodBAdnPjt3pp0yFA3/+bmuJmamDUbyZiJJKQGEpHGbqLfyNPK
 4bAdpsLe7/qGtpz0MpfCJeW+PI/A5IckLBs0zpgXak7u2VUOhY5YEWu/wr/InW574O
 yvBrliMQS4Ar2tn29iCMNmn9DgXbg6jOIUufAK2v4F7HCNxuh6tpGB5Sqp3O+TxW6A
 Qd4fNaQEy8r+Q==
To: Stafford Horne <shorne@gmail.com>
References: <20210609153059.191496-1-giulio.benetti@benettiengineering.com>
 <YME2SzQdpj/AVz/2@antec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f2696244-8074-e4ab-6f71-d0c7414a4fd4@benettiengineering.com>
Date: Wed, 9 Jun 2021 23:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YME2SzQdpj/AVz/2@antec>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPD+cPh9sHZVpLImjBdHDRRHWl2O5aZe9UAH6RLKBm8Gs8l2HnkXq/x0CzS/NTubQBr2+J1e2+zA1FoB49TAC6VdYhlkO2Evy6QY6GE5cfN/wTEXBkdK
 F4M/CAtjf3XyjmWLKDJCy29BF75FQ5YqBeAaqux4vSaWlAhZC+SnRqIah2uRcMfPRrVgPN59KlrtuAlSUVNcsTAyJWuVBK+uo1ZAW+FRDMNVogQlFTIT893G
 5fjTFYns5N4ixEIscaSx1VPtnJeOYarZU9dvDB8CM2BWOhvGFaKvAxAw/w4y8fAz6sXNzIivXsor2aEdkI25CQ==
Subject: Re: [OpenRISC] [PATCH] bfd/elf32-or1k: fix building with gcc
 version < 5
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiA2LzkvMjEgMTE6NDQgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDA5LCAyMDIxIGF0IDA1OjMwOjU5UE0gKzAyMDAsIEdpdWxpbyBCZW5ldHRp
IHdyb3RlOgo+PiBHY2MgdmVyc2lvbiA+PSA1IGhhcyBzdGFuZGFyZCBDIG1vZGUgbm90IHNldCB0
byAtc3RkPWdudTExLCBzbyBpZiB3ZSB1c2UKPj4gYW4gb2xkIGNvbXBpbGVyKGkuZS4gZ2NjIDQu
OSkgYnVpbGQgZmFpbHMgb246Cj4+IGBgYAo+PiBlbGYzMi1vcjFrLmM6MjI1MTozOiBlcnJvcjog
J2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxvd2VkIGluCj4+IEM5
OSBvciBDMTEgbW9kZQo+PiAgICAgIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3VudDsg
aSsrKQo+PiAgICAgIF4KPj4gYGBgCj4+Cj4+IFNvIGxldCdzIGRlY2xhcmUgYHNpemVfdCBpYCBh
dCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIGluc2lkZQo+PiBmb3IgbG9vcC4K
PiAKPiBUaGlzIGxvb2tzIG9rIHRvIG1lLiAgQ2FuIHlvdSBhbHNvIGluY2x1ZGUgdGhlIGNoYW5n
ZWxvZyBlbnRyeSBuZWVkZWQgZm9yCj4gYmludXRpbHMgcGF0Y2hlcz8KPiAKPiBTb21ldGhpbmcg
bGlrZToKPiAKPiBiZmQvQ2hhbmdlTG9nOgo+IAo+IAkqIGVsZjMyLW9yMWsuYyAob3Ixa193cml0
ZV9wbHRfZW50cnkpOiBNb3ZlIGkgZGVjbGFyYXRpb24gdG8gdG9wIG9mCj4gCWZ1bmN0aW9uLgoK
U3VyZSwgdGhpcyBpdCB0aGUgZmlyc3QgdGltZSBJIHNlbmQgYSBwYXRjaCBmb3IgYmludXRpbHMu
IEkndmUganVzdCBzZW50IAp0aGUgdjIuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRp
CkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0
aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+ICAgYmZk
L2VsZjMyLW9yMWsuYyB8IDUgKysrLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYmZkL2VsZjMyLW9yMWsuYyBi
L2JmZC9lbGYzMi1vcjFrLmMKPj4gaW5kZXggNGFlN2YzMjRkMzMuLjMyMDYzYWIwMjg5IDEwMDY0
NAo+PiAtLS0gYS9iZmQvZWxmMzItb3Ixay5jCj4+ICsrKyBiL2JmZC9lbGYzMi1vcjFrLmMKPj4g
QEAgLTIyNDQsOSArMjI0NCwxMCBAQCBvcjFrX3dyaXRlX3BsdF9lbnRyeSAoYmZkICpvdXRwdXRf
YmZkLCBiZmRfYnl0ZSAqY29udGVudHMsIHVuc2lnbmVkIGluc25qLAo+PiAgIHsKPj4gICAgIHVu
c2lnbmVkIG5vZGVsYXkgPSBlbGZfZWxmaGVhZGVyIChvdXRwdXRfYmZkKS0+ZV9mbGFncyAmIEVG
X09SMUtfTk9ERUxBWTsKPj4gICAgIHVuc2lnbmVkIG91dHB1dF9pbnNuc1tQTFRfTUFYX0lOU05f
Q09VTlRdOwo+PiArICBzaXplX3QgaTsKPj4gICAKPj4gICAgIC8qIENvcHkgaW5zdHJ1Y3Rpb25z
IGludG8gdGhlIG91dHB1dCBidWZmZXIuICAqLwo+PiAtICBmb3IgKHNpemVfdCBpID0gMDsgaSA8
IGluc25fY291bnQ7IGkrKykKPj4gKyAgZm9yIChpID0gMDsgaSA8IGluc25fY291bnQ7IGkrKykK
Pj4gICAgICAgb3V0cHV0X2luc25zW2ldID0gaW5zbnNbaV07Cj4+ICAgCj4+ICAgICAvKiBIb25v
ciB0aGUgbm8tZGVsYXktc2xvdCBzZXR0aW5nLiAgKi8KPj4gQEAgLTIyNzcsNyArMjI3OCw3IEBA
IG9yMWtfd3JpdGVfcGx0X2VudHJ5IChiZmQgKm91dHB1dF9iZmQsIGJmZF9ieXRlICpjb250ZW50
cywgdW5zaWduZWQgaW5zbmosCj4+ICAgICAgIH0KPj4gICAKPj4gICAgIC8qIFdyaXRlIG91dCB0
aGUgb3V0cHV0IGJ1ZmZlci4gICovCj4+IC0gIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgKGluc25f
Y291bnQrMSk7IGkrKykKPj4gKyAgZm9yIChpID0gMDsgaSA8IChpbnNuX2NvdW50KzEpOyBpKysp
Cj4+ICAgICAgIGJmZF9wdXRfMzIgKG91dHB1dF9iZmQsIG91dHB1dF9pbnNuc1tpXSwgY29udGVu
dHMgKyAoaSo0KSk7Cj4+ICAgfQo+PiAgIAo+PiAtLSAKPj4gMi4yNS4xCj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
