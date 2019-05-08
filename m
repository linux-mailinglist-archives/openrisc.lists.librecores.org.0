Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AC7D617F7D
	for <lists+openrisc@lfdr.de>; Wed,  8 May 2019 20:06:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 670E32845C;
	Wed,  8 May 2019 20:06:14 +0200 (CEST)
Received: from smtp38.i.mail.ru (smtp38.i.mail.ru [94.100.177.98])
 by mail.librecores.org (Postfix) with ESMTPS id 5FDA6279B9
 for <openrisc@lists.librecores.org>; Wed,  8 May 2019 20:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:In-Reply-To:References:Cc:To:From:Message-ID;
 bh=ew+BTszxCcB+rGBJVAoZ7Q3LnIMbhRZop0aPVMuGNFc=; 
 b=Q7GhqIRH02tapa/U6ajeW86ocznx4Xv4a/bJ6g1G2JLoKE9uCs3do6RCQ6uYJu270P1W+ORc1YdwGFVykOZRkKMpyNK4H6RcVH1m6eBfbfQry1+42jj0JEHMqg/h4GzVJ5ceGaPZKut6yO8ugHDYu3vrXbEQfkfKPtXjFy7+Mrk=;
Received: by smtp38.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1hOQxI-0003p0-85; Wed, 08 May 2019 21:06:12 +0300
Message-ID: <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
From: "BAndViG" <bandvig@mail.ru>
To: "Stafford Horne" <shorne@gmail.com>, "Richard Henderson" <rth@twiddle.net>
References: <CAAfxs77GkWenpN0s1pM_YeVgNZabBx55fCqLfxoMffTSa-E=cw@mail.gmail.com>
 <afc760d8-0e01-6470-c8d2-6ddc366f3d10@twiddle.net>
 <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
In-Reply-To: <20190507211254.GD11006@lianli.shorne-pla.net>
Date: Wed, 8 May 2019 21:05:58 +0300
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Authentication-Results: smtp38.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-77F55803: E14BCC6235C710295A78504BD2AC2941B7A376033C4CF6D70AAE9D750FF7DB1DAF23A03330207425791FBD548A629BAC
X-7FA49CB5: 0D63561A33F958A580294E3D805393502E63C2C8E18FF5C67D67B4EF99483F558941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249D827CA74CCEABFF33AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE77F3B9A4E0E392C85CD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE77276DE20D6E96F8A7E66D79EC4B7041675ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57285124B2A10EEC6C00306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF171295B3FAEBF01292D09BD11E132F943CA523AD9247EC42B96707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
X-Mras: OK
Subject: Re: [OpenRISC] OpenRISC 1.3 spec
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
Cc: BAndViG <bandvig@mail.ru>, Openrisc <openrisc@lists.librecores.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

PiBGcm9tOiBTdGFmZm9yZCBIb3JuZQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDA4LCAyMDE5IDEy
OjEyIEFNCj4gVG86IFJpY2hhcmQgSGVuZGVyc29uCj4gQ2M6IEJBbmRWaUcgOyBPcGVucmlzYwo+
IFN1YmplY3Q6IFJlOiBbT3BlblJJU0NdIE9wZW5SSVNDIDEuMyBzcGVjCgo+IE9uIFR1ZSwgTWF5
IDA3LCAyMDE5IGF0IDA4OjI4OjQ1QU0gLTA3MDAsIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOgo+
ID4gT24gNC8yNS8xOSAyOjE3IFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+ID4gVGhpcyBp
cyBpbXBsZW1lbnRlZCBpbiBiaW51dGlscyBub3cuIFNlZSBteSBwYXRjaGVzIGhlcmU6Cj4gPiA+
Cj4gPiA+ICAgLSBodHRwczovL2dpdGh1Yi5jb20vc3RmZnJkaHJuL2JpbnV0aWxzLWdkYi9jb21t
aXRzL29yZnB4NjRhMzItMwo+ID4gPgo+ID4gPiBJIGhhdmUgbm90IHNxdWFzaGVkIHRoZSBjb21t
aXRzIGJlY2F1c2UgaXQgbWFrZXMgaXQgYSBiaXQgZWFzaWVyIGZvciAKPiA+ID4gcmV2aWV3aW5n
Cj4gPiA+IHdoYXQgSSBkaWQgdG8gZ2V0IHRoZXNlIGZsYWdzIHdvcmtpbmcuCj4gPgo+ID4gSSd2
ZSBpbXBsZW1lbnRlZCB0aGlzIGZvciBxZW11LAo+ID4KPiA+ICAgaHR0cHM6Ly9naXRodWIuY29t
L3J0aDc2ODAvcWVtdS9jb21taXRzL3RndC1vcjFrCj4gPgo+ID4gYWx0aG91Z2ggdW50ZXN0ZWQg
c28gZmFyLiAgSSBuZWVkIHRvIHJlZ2VuZXJhdGUgbXkKPiA+IGNyb3NzLXRlc3RpbmcgZW52aXJv
bm1lbnQgZm9yIG9yMWsuLi4KCj4gVGhpcyBsb29rcyBnb29kLCBJIGxpa2UgaG93IHlvdSBkbyAo
ckQxICsgckQxT2Zmc2V0ICsgMSkgaW5zdGVhZCBvZiB3aGF0IEkgCj4gd2FzCj4gZG9pbmcgKHJE
MSArIChyRDFPZmZzZXQgPyAyIDogMSApKS4gIEkgd2lsbCBmaXggbXkgbWF0Y2hlcyB0byB1c2Ug
eW91ciAKPiBtZXRob2QuCgpBaCwgSSBpbXBsZW1lbnRlZCBzaW1pbGFyIGFwcHJvYWNoIGluIE1B
Uk9DQ0hJTk8gaW5kZXBlbmRlbnRseSA6KSwgc2VlIGxhdGVzdCAKY29tbWl0IHRvIGZwX3Vub3Jk
ZXJlZF9jbXAgYnJhbmNoOgpodHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2Mvb3Ixa19tYXJvY2No
aW5vL2NvbW1pdC8zMTNiMjU2ODc1YzhiNjE5ZjViMTZkYjQ3ZDkxNWU1ZGZhZWRmZmY3Cgo+IEFs
c28sIGp1c3QgYSByZW1pbmRlciwgdGhlIGxhdGVzdCBwYXRjaGVzIGZvciBHQ0MgRlBVIHN1cHBv
cnQgYXJlIHVwIGhlcmUuICBJCj4gaGF2ZSByZWJhc2VkIHRvIHRoZSA5LjEuMCByZWxlYXNlLiAg
QWxzbywgYWRkZWQgYSBuZXcgUkVHIENMQVNTIGZvciBSRUcgUEFJUlMgCj4gdG8KPiBmaXggYW4g
aXNzdWUgZm9yIHdoZW4gKHJEMSArIHJEMU9mZnNldCArIDEpIG92ZXJmbG93cy4KCj4gICBodHRw
czovL2dpdGh1Yi5jb20vc3RmZnJkaHJuL2djYy9jb21taXRzL29yMWstZnB1LTIKCkJ0dywgZWFy
bGllciB5b3Ugd3JvdGUgIi4uLiBvbiBvbmUgZW5kIDY0LWJpdCBvcGVucmlzYyBkb2Vzbid0IGxv
b2tzIHRvIGV2ZW4gYmUgCmNvbWluZyAuLi4iLiBBY3R1YWxseSBJIHRoaW5rIGl0IHdvdWxkbid0
IGJlIGEgdmVyeSBkaWZmaWN1bHQgZm9yIG1lIHRvIGNyZWF0ZSAKNjQtYml0IE9wZVJJU0MgYnkg
c29tZSByZS1mYWN0b3Jpbmcgb2YgTUFST0NDSElOTydzIG1vZHVsZXMuIEF0IHRoZSBzYW1lIHRp
bWUgCmlzIGFueWJvZHkgaW50ZXJlc3RlZCBpbiBpdD8KCkFkZGl0aW9uYWxseSwgaXMgYW55Ym9k
eSBpbnRlcmVzdGVkIGluIGxpdHRsZSBlbmRpYW4gc3VwcG9ydD8gSSd2ZSBiZWVuIAp0aGlua2lu
ZyB0byBpbXBsZW1lbnQgaXQgYXMgYSBwYXJhbWV0ZXIsIGxpa2UgT1BUSU9OX0VORElBTiA9ICJC
SUciLyJMSVRUTEUiLiAKV2l0aCB0aGUgYXBwcm9hY2ggU1JbTEVFXToKICAtIHNob3VsZCBiZSBz
ZXQgYXQgY29tcGlsZSB0aW1lIGluIGFjY29yZGluZyB3aXRoIE9QVElPTl9FTkRJQU4gdmFsdWUK
ICAtIGNvdWxkbid0IGJlIGNoYW5nZWQgYnkgd3JpdGluZyBpbnRvIFNSCgpXQlIKQW5kcmV5IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
