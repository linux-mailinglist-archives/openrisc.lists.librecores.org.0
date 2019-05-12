Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 97EDB1AE06
	for <lists+openrisc@lfdr.de>; Sun, 12 May 2019 21:58:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 442B02843E;
	Sun, 12 May 2019 21:58:57 +0200 (CEST)
Received: from smtp52.i.mail.ru (smtp52.i.mail.ru [94.100.177.112])
 by mail.librecores.org (Postfix) with ESMTPS id 0966C25CD6
 for <openrisc@lists.librecores.org>; Sun, 12 May 2019 21:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:In-Reply-To:References:Cc:To:From:Message-ID;
 bh=CvY5T8ptM4JA0GTMvUMILzTg3AHNWbEADRjOE88EF6M=; 
 b=B8TttbR/LfysfrS1VZofVQ3hZzFjV2AN+zQbsqdfE+Ksbc2/EpcHDM4hCBmBK4UVU+6NsrNwuqMTO5JmdpO0gA+PzakQYUPBa910wB6hjS7tGdWmfh5mLQqfp58PqYS4OFOVJuHdmJBS7ehouYfGJ+1eQoMXxMxBSI+XjCqmvuc=;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1hPucZ-0002Bl-2E; Sun, 12 May 2019 22:58:55 +0300
Message-ID: <A49361B4A05048AD995FF588CC923E61@BAndViG>
From: "BAndViG" <bandvig@mail.ru>
To: "Stafford Horne" <shorne@gmail.com>
References: <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
 <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
 <AED0C7019AE04A2F87CD0E432FA20A70@BAndViG>
 <20190511100433.GA20465@lianli.shorne-pla.net>
In-Reply-To: <20190511100433.GA20465@lianli.shorne-pla.net>
Date: Sun, 12 May 2019 22:58:53 +0300
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Authentication-Results: smtp52.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-77F55803: 2D1AD755E866B1545A78504BD2AC2941D39E519F2B0D219746B56F7B60FC2AB4E24B94EB35DE37BDF18EFD90DC04BAD9
X-7FA49CB5: 0D63561A33F958A5736D71B9A885BA607EC5EEC6C5AA189916BB973EB397E6D28941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249D827CA74CCEABFF33AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE79A12DC3F304A1AFDCD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE7E6D75EFA3759DDF36BC926C30963104775ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF1D381CD384C4436A008844DCBCB234EE5E29C3C9F99C12D6F96707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

PiBGcm9tOiBTdGFmZm9yZCBIb3JuZQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXkgMTEsIDIwMTkgMTow
NCBQTQoKPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDEwOjU2OjA1QU0gKzAzMDAsIEJBbmRW
aUcgd3JvdGU6Cj4gPiBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgYSB2YXJpYW50cyBmb3IgUjAg
d3JpdGUgcHJvdGVjdGlvbi4gUjAgY291bGQgYmUKPiA+IHplcm8gaW5pdGlhbGl6ZWQgYXQgY3B1
X3JzdCBieSBkZWRpY2F0ZWQgY2lyY3VpdHMuIEFuZCBgaW52YWxpZCAKPiA+IGluc3RydWN0aW9u
YAo+ID4gZXhjZXB0aW9uIHNob3VsZCBiZSByYWlzZWQgaWYgYW4gaW5zdHJ1Y3Rpb24gdHJpZXMg
dG8gd3JpdGUgdG8gUjAuIEF0IHRoZQo+ID4gc2FtZSB0aW1lIHN1Y2ggYmVoYXZpb3IgaXMgaW5j
b21wYXRpYmxlIHdpdGggY3VycmVudCBydW4tdGltZSAKPiA+IGluaXRpYWxpemF0aW9uCj4gPiBz
ZXF1ZW5jZXMgaW1wbGVtZW50ZWQgaW4gT1IxSyB0b29sIGNoYWlucy4gVGhlIGNpcmNsZSBpcyBj
bG9zZWQuCgo+IFdlIHN0aWxsIGhhdmUgdGhlIG9wdGlvbiB0byBkcm9wIHRoZSB2YWxpZGF0aW9u
LiAgSnVzdCBhcyB3ZSBkb24ndCBoYXZlCj4gdmFsaWRhdGlvbiBmb3Igd3JpdGluZyB0byByMCwg
SSB0aGluayBpdHMgZmluZSB0byBzYXkgcjMxJ3MgcGFpciByZWdpc3RlciBpcwo+IHVuZGVmaW5l
ZCBhbmQgc2hvdWxkIGJlIGF2b2lkZWQuIChpLmUuIG9uIHNvbWUgbWFjaGluZXMgaXQgbWlnaHQg
Z28gaW50byB0aGUKPiBzaGFkb3cgcmVnIHNwYWNlKQoKT24gdGhlIG9uZSBoYW5kIEknbSBhIGtp
bmQgb2YgcGVyZmVjdGlvbmlzdCBhbmQgd291bGQgcHJlZmVyIHRvIGltcGxlbWVudCBzdWNoIApw
cm90ZWN0aW9ucy4gT24gdGhlIG90aGVyIGhhbmQgdGhleSBjb3N0IG5vdGljZWFibGUgc3BhY2Ug
YW5kIHRpbWluZy4gTm90IAp0cml2aWFsIGNob2ljZSBmb3IgbWUgOikuCgo+IE9uIHRoZSBvdGhl
ciBoYW5kLCBJIGhhdmUgZmluaXNoZWQgdGhlIEdDQyB1cGRhdGVzIGZvciB1bm9yZGVyZWQgY29t
cGFyaXNvbnMuCj4gWW91IGNhbiBzZWUgdGhlIHBhdGNoIGhlcmUsIEkgYnVpbHQgbmV3bGliIHdp
dGggdGhpcyBlbmFibGVkIGFuZCB3YXMgYWJsZSB0bwo+IHNoYWtlIG91dCBhIGZldyBidWdzLiAg
SXQgc2VlbXMgdG8gd29yazoKCj4gICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vZ2Nj
L2NvbW1pdHMvb3Ixay1mcHUtMgoKPiBUaGUgbmV3IGdjYyBhcmd1bWVudCBpczoKCj4gICAtbXVu
b3JkZXJlZC1mbG9hdAoKSSd2ZSBidWlsZCB0d28gdmFyaWFudHMgb2YgR0NDOS9OZXdMSUIgdG9v
bCBjaGFpbnMuIE9uZSBoYXMgZ290IAoiLW1oYXJkLWZsb2F0IC1tdW5vcmRlcmVkLWZsb2F0IiBv
cHRpb25zIHJhaXNlZCBieSBkZWZhdWx0LiBBbmQgYW5vdGhlciBvbmUgaGFzIApnb3QgIi1taGFy
ZC1mbG9hdCAtbWRvdWJsZS1mbG9hdCAtbXVub3JkZXJlZC1mbG9hdCIgZGVmYXVsdCBvcHRpb25z
LiBGaXJzdCAKdmFyaWFudCB3YXMgdXNlZCB0byBidWlsZCBzaW5nbGUgcHJlY2lzaW9uIFdoZXRz
dG9uZSBmb3IgbW9yMWt4K0ZQVTMyIGFuZCAKc2Vjb25kIHRvIGJ1aWxkIHNpbmdsZSBhbmQgZG91
YmxlIHByZWNpc2lvbiBXaGV0c3RvbmUgZm9yIE1BUk9DQ0hJTk8uIEFsbCAKdmFyaWFudHMgd29y
ay4KV2UgY291bGQgbWVyZ2UgZnBfdW5vcmRlcmVkX2NtcCBicmFuY2hlcyBpbnRvIG1hc3Rlci4g
T3Igc2hvdWxkIHdlIHBvc3Rwb25lIHRoZSAKbWVyZ2UgdGlsbCB5b3VyIGJpbnV0aWxzL2djYyBw
YXRjaGVzIGJlaW5nIHVwc3RyZWFtZWQ/CgpXQlIKQW5kcmV5IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
