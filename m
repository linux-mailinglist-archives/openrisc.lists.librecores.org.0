Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B41DC1993C
	for <lists+openrisc@lfdr.de>; Fri, 10 May 2019 09:56:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7260628464;
	Fri, 10 May 2019 09:56:24 +0200 (CEST)
Received: from smtp54.i.mail.ru (smtp54.i.mail.ru [217.69.128.34])
 by mail.librecores.org (Postfix) with ESMTPS id 6504E25B78
 for <openrisc@lists.librecores.org>; Fri, 10 May 2019 09:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:In-Reply-To:References:Cc:To:From:Message-ID;
 bh=CBRJr5kyO8yD8FXzKKVcdltnT9R8SzYsvJPJkwoowP8=; 
 b=oRTkfuoP38wCOcAsg5neIRAh0wpPxbo0oJbAu9iGIUVGD/EgAOxy0eEQo18Xe3GlwjNngo85IerEKhX+LhPmGYoUkW+a93NpHNtBg3wkUuqfNY3bxIb4nWCExgPFcClbko/nRB+wOXfvBeqgvSaA5uAng/L5KoX8wx5GvppAtDU=;
Received: by smtp54.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1hP0OD-0003nn-RG; Fri, 10 May 2019 10:56:22 +0300
Message-ID: <AED0C7019AE04A2F87CD0E432FA20A70@BAndViG>
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
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
 <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
In-Reply-To: <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
Date: Fri, 10 May 2019 10:56:05 +0300
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Authentication-Results: smtp54.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-77F55803: 3FFC80838138E3AB5A78504BD2AC2941D39E519F2B0D2197DAD58DF68AC78FAD51B6B98FDA10AF86740B825D4210A831
X-7FA49CB5: 0D63561A33F958A54EDC1DC95561CF1FF4F741D480C26EA5545F62772591C72E8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249D827CA74CCEABFF33AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE79A12DC3F304A1AFDCD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE7B399FDAA86D98C03AAAAB6882A2EB74775ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF1982A4049F6951D9809CE6BD64D4C5F388D2F0B78A5E2C0F996707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
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

PiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbgo+IFNlbnQ6IEZyaWRheSwgTWF5IDEwLCAyMDE5IDEy
OjQ3IEFNCj4gVG86IEJBbmRWaUcgOyBTdGFmZm9yZCBIb3JuZQo+IENjOiBPcGVucmlzYwo+IFN1
YmplY3Q6IFJlOiBbT3BlblJJU0NdIE9wZW5SSVNDIDEuMyBzcGVjCgo+ID4gT24gNS84LzE5IDEx
OjA1IEFNLCBCQW5kVmlHIHdyb3RlOgo+ID4gQWgsIEkgaW1wbGVtZW50ZWQgc2ltaWxhciBhcHBy
b2FjaCBpbiBNQVJPQ0NISU5PIGluZGVwZW5kZW50bHkgOiksIHNlZSAKPiA+IGxhdGVzdAo+ID4g
Y29tbWl0IHRvIGZwX3Vub3JkZXJlZF9jbXAgYnJhbmNoOgo+ID4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5yaXNjL29yMWtfbWFyb2NjaGluby9jb21taXQvMzEzYjI1Njg3NWM4YjYxOWY1YjE2ZGI0
N2Q5MTVlNWRmYWVkZmZmNwoKPiBJbiB0aGUgY29tbWl0IGFib3ZlLCB5b3Ugc2F5Cgo+ID4gSWYg
QTEvQjEvRDEgYWRkcmVzcyBgPiAzMGAgdGhhbiBgaW52YWxpZCBpbnN0cnVjdGlvbmAgZXhjZXB0
aW9uIGlzIHJhaXNlZC4KCk9oLCBpdCBpcyBqdXN0IG1pc3ByaW50LiBJdCBzaG91bGQgYmUgYD49
IDMwYC4KCj4gQnV0IHRoYXQgZG9lc24ndCBoYW5kbGUgRDE9MzAsIEQxUD0xLgo+IFNpbmNlIHlv
dSBhcmUgdXNpbmcgYSAoNS1iaXQ/KSBhZGQtd2l0aC1jYXJyeSBjaXJjdWl0LCBpcyBpdCBlYXN5
IHRvIHJhaXNlIAo+IHRoZQo+IGludmFsaWQgaW5zdHJ1Y3Rpb24gaWYgdGhlcmUgaXMgY2Fycnkg
b3V0IG9mIGJpdCA0LCBpbnN0ZWFkIG9mIHRoZSBoYXJkLWNvZGVkCj4gY29tcGFyaXNvbiBhZ2Fp
bnN0IDMwPwoKQTEvQjEvRDEgYm91bmRhcmllcyBjaGVjayBpcyBpbXBsZW1lbnRlZCBpbiBvcjFr
X21hcm9jY2hpbm9fZGVjb2RlLnYsIGxpbmVzIAojMzQ4LTM1MQoKLy8gICMgY2hlY2sgbGVnYWxp
dHkgb2YgQTEvQjEvRDEgYWRkcmVzc2VzOiB0aGV5IG11c3QgYmUgPCByMzAKd2lyZSBvcF9mcDY0
X3JmYTFfYWRyX2wgPSB+KCZmZXRjaF9yZmExX2Fkcl9pW09QVElPTl9SRl9BRERSX1dJRFRILTE6
MV0pOwp3aXJlIG9wX2ZwNjRfcmZiMV9hZHJfbCA9IH4oJmZldGNoX3JmYjFfYWRyX2lbT1BUSU9O
X1JGX0FERFJfV0lEVEgtMToxXSk7CndpcmUgb3BfZnA2NF9yZmQxX2Fkcl9sID0gfigmZmV0Y2hf
cmZkMV9hZHJfaVtPUFRJT05fUkZfQUREUl9XSURUSC0xOjFdKTsKCkFuZCBoZXJlLCBjb21tZW50
YXJ5IGlzIGNvcnJlY3QgOikuCmBfbGAgc3VmZml4IGhlcmUgbWVhbnMgYGxlZ2FsYC4KSSBjaGVj
ayB0aGF0IFs0OjFdIGJpdHMgbXVzdCBub3QgYmUgNCdiMTExMSwgYmVjYXVzZSA1J2QzMCBpcyA1
J2IxMTExMCBhbmQgCjUnZDMxIGlzIGFsbCBvbmVzLgoKPiBPdGhlcndpc2UsIEknZCBkcm9wIHRo
ZSBpbnZhbGlkIGluc3RydWN0aW9uIGFuZCBsZXQgRDIgd3JhcCBhcm91bmQuCj4gRDE9MzEsRDFQ
PTEgd291bGQgYmUgYSB2YWxpZCAoYnV0IHNpbGx5KSBpbnN0cnVjdGlvbiBjbG9iYmVyaW5nIHRo
ZSBzdGFjawo+IHBvaW50ZXIgKFIxKS4gIEFzIHdvdWxkIEQxPTMxLEQxUD0wLCBvdmVyd3JpdGlu
ZyB0aGUKPiBvdWdodC10by1oYXZlLWJlZW4taGFyZHdpcmVkLWJ1dC1pc24ndCBSMC4gIEJvdGgg
YXJlIGNlcnRhaW5seSB1c2VyIGJ1Z3MsIGJ1dAo+IHNvIHdoYXQgLS0gRG9uJ3QgRG8gVGhhdCBU
aGVuLgoKOikgQXMgeW91IGNvcnJlY3RseSBtZW50aW9uZWQsIGN1cnJlbnQgR1BScyBpbXBsZW1l
bnRhdGlvbiBpbiBNQVJPQ0NISU5PIChhbmQgCmluIGFueSBwaXBlIG9mIG1vcjFreCBpZiBJIHJl
bWVtYmVyIGNvcnJlY3RseSkgYWxsb3dzIHdyaXRpbmcgaW50byBSMCBqdXN0IHRvIApzaW1wbGlm
eSBkZXNpZ24uIEFzIGEgcmVzdWx0IGEgdXNlciBoYXZlIGdvdCBlbm91Z2ggcm9vbSBmb3IgYnVn
cyBhbHJlYWR5LgpJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgYSB2YXJpYW50cyBmb3IgUjAgd3Jp
dGUgcHJvdGVjdGlvbi4gUjAgY291bGQgYmUgemVybyAKaW5pdGlhbGl6ZWQgYXQgY3B1X3JzdCBi
eSBkZWRpY2F0ZWQgY2lyY3VpdHMuIEFuZCBgaW52YWxpZCBpbnN0cnVjdGlvbmAgCmV4Y2VwdGlv
biBzaG91bGQgYmUgcmFpc2VkIGlmIGFuIGluc3RydWN0aW9uIHRyaWVzIHRvIHdyaXRlIHRvIFIw
LiBBdCB0aGUgc2FtZSAKdGltZSBzdWNoIGJlaGF2aW9yIGlzIGluY29tcGF0aWJsZSB3aXRoIGN1
cnJlbnQgcnVuLXRpbWUgaW5pdGlhbGl6YXRpb24gCnNlcXVlbmNlcyBpbXBsZW1lbnRlZCBpbiBP
UjFLIHRvb2wgY2hhaW5zLiBUaGUgY2lyY2xlIGlzIGNsb3NlZC4KCldCUgpBbmRyZXkgCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
