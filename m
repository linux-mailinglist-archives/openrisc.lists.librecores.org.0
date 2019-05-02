Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 29C15118EE
	for <lists+openrisc@lfdr.de>; Thu,  2 May 2019 14:23:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CC29028483;
	Thu,  2 May 2019 14:23:05 +0200 (CEST)
Received: from smtp63.i.mail.ru (smtp63.i.mail.ru [217.69.128.43])
 by mail.librecores.org (Postfix) with ESMTPS id C71712847C
 for <openrisc@lists.librecores.org>; Thu,  2 May 2019 14:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:In-Reply-To:References:Cc:To:From:Message-ID;
 bh=I3BzVbPigmEgBdCT403xB8lraK4SbG0eiQ2R/+d7s4A=; 
 b=oGiJMN6mO1WQbVrU9Ns425cZ7cPAyi4NMCFeQcr9MZt7oO2PD785HNKsORNFXdmYHFftBEptOuoghp0RdkaMQgL2Vsrj+cH4S75kvqQVbyKX528C+fVVG7/laQac1VizIRPuptxiztzN7BAYaACPdGYuGwjUcIlp3nAFz0wwCMI=;
Received: by smtp63.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1hMAju-0001tV-UK; Thu, 02 May 2019 15:23:03 +0300
Message-ID: <9933DA48659E43DFAFC830C56C0699A0@BAndViG>
From: "BAndViG" <bandvig@mail.ru>
To: "Stafford Horne" <shorne@gmail.com>
References: <CAAfxs77GkWenpN0s1pM_YeVgNZabBx55fCqLfxoMffTSa-E=cw@mail.gmail.com>
 <afc760d8-0e01-6470-c8d2-6ddc366f3d10@twiddle.net>
 <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <20190426222242.GH32284@lianli.shorne-pla.net>
In-Reply-To: <20190426222242.GH32284@lianli.shorne-pla.net>
Date: Thu, 2 May 2019 15:22:56 +0300
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Authentication-Results: smtp63.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-77F55803: BBE463BEF7A60BD05A78504BD2AC29419190768C267DA4DC2F9A97A5CF19E7CF0A1C5E80CB2ABD9877656B518EB6F267
X-7FA49CB5: 0D63561A33F958A53D3D905AA70E58D73B9C3BF04BE3DAF84A3C34F1D6E80E8E8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249A5DF9383870C0FED3AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE77F3B9A4E0E392C85CD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE72B0AA506C02DADBE424E980D1B275253EFF80C71ABB335746BA297DBC24807EA27F269C8F02392CDCDCF839C8780CBD93C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF1359E5AD812B309C9BBDD65A05441CC6B19D04E63FD3040E196707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
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

PiA+IE9uIFN1biwgQXByIDE0LCAyMDE5IGF0IDEyOjQxOjU2UE0gKzAzMDAsIEJBbmRWaUcgd3Jv
dGU6Cj4gPiA+IEhpLCBTdGFmZm9yZCwgUmljaGFyZAo+ID4gPgo+ID4gPiA+ID4gPiBJIHByb3Bv
c2U6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgYml0LTEwIC0gMSBpbmRpY2F0ZXMgaWYgcmQy
IGlzICsyCj4gPiA+ID4gPiA+ICAgYml0LTkgIC0gMSBpbmRpY2F0ZXMgaWYgcmEyIGlzICsyCj4g
PiA+ID4gPiA+ICAgYml0LTggIC0gMSBpbmRpY2F0ZXMgaWYgcmIyIGlzICsyCj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhhbmtzLiAgTEdUTS4KPiA+Cj4gPiBTb3JyeSwgaXQgdG9vayB0aW1lLCBJIGhh
ZCB2aXNpdG9ycyBhdCBob21lIGxhc3Qgd2VlaywgYW5kIEkgbmVlZGVkIHRvIAo+ID4gcmVsZWFy
bgo+ID4gaG93IGNnZW4gd29ya2VkLgo+ID4KPiA+IFRoaXMgaXMgaW1wbGVtZW50ZWQgaW4gYmlu
dXRpbHMgbm93LiBTZWUgbXkgcGF0Y2hlcyBoZXJlOgo+ID4KPiA+ICAgLSBodHRwczovL2dpdGh1
Yi5jb20vc3RmZnJkaHJuL2JpbnV0aWxzLWdkYi9jb21taXRzL29yZnB4NjRhMzItMwo+ID4KPiA+
IEkgaGF2ZSBub3Qgc3F1YXNoZWQgdGhlIGNvbW1pdHMgYmVjYXVzZSBpdCBtYWtlcyBpdCBhIGJp
dCBlYXNpZXIgZm9yIAo+ID4gcmV2aWV3aW5nCj4gPiB3aGF0IEkgZGlkIHRvIGdldCB0aGVzZSBm
bGFncyB3b3JraW5nLgo+Cj4gSSBoYXZlIHRoZSBHQ0MgcGF0Y2hlcyB1cCBhcyB3ZWxsIG5vdy4K
Pgo+ICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vZ2NjL2NvbW1pdHMvb3Ixay1mcHUt
Mgo+Cj4gSW5pdGlhbCB0ZXN0cyBsb29rIGZpbmUuCj4KPiAtU3RhZmZvcmQKCkkndmUgdXBkYXRl
ZCBtb3Ixa3gncyBGUFUgc3R1ZmYgd2l0aCB2YXJpb3VzIHRoaW5ncy4gSW4gcGFydGljdWxhciAK
T1BUSU9OX0ZUT0lfUk9VTkRJTkcgd2FzIHBvcnRlZCBmcm9tIE1BUk9DQ0hJTk8gKHNlZSBkZXNj
cmlwdGlvbiBpbiBSZWFkbWUubWQpLiAKSSBhbHNvIGNyZWF0ZWQgImZwX3Vub3JkZXJlZF9jbXAi
IGJyYW5jaGVzIGluIGJvdGggLSBtb3Ixa3ggYW5kIApvcjFrX21hcm9jY2hpbm8gLSByZXBvcy4g
VGhlIGJyYW5jaGVzIGNvbnRhaW4gaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBvZiAKdW5vcmRlcmVk
IGNvbXBhcmlzb24gYXMgSSBkZXNjcmliZWQgaW4gYW5vdGhlciBwb3N0IG9mIHRoZSB0aHJlYWQu
IFRoZSAKTUFST0NDSElOTydzIGJyYW5jaCBhbHNvIGltcGxlbWVudHMgb2Zmc2V0IGZvciBhMiwg
YjIgYW5kIGQyIGNvcGllZCBmcm9tIHlvdXIgCnB1bGwgcmVxdWVzdC4gSSBob3BlIHZlcmlsb2cg
bW9kZWxzIGFyZSByZWFkeSBmb3IgeW91ciB1cGNvbWluZyBHQ0M5LXNwZWMxLjMgCnBvcnQuCgpX
QlIKQW5kcmV5IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
