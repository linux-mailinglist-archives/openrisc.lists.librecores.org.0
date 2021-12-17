Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EB7D1478EDD
	for <lists+openrisc@lfdr.de>; Fri, 17 Dec 2021 16:03:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C6C37242B5;
	Fri, 17 Dec 2021 16:03:15 +0100 (CET)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mail.librecores.org (Postfix) with ESMTPS id B351F241F6
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 16:03:13 +0100 (CET)
Received: by mail-pl1-f174.google.com with SMTP id y7so2131001plp.0
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V7306x+Jo+GDemuCIpeIOawTbzWQwkapGEuokahzb7c=;
 b=CKHRAehR0T1pBdm9HmWkV6O5i1/OxAceCBXY3zQyKUQueQkrDm6bK4j0mcnCMR2h8n
 TLpjiqU+9LjFHEY+xsHX/WHzoaf/GYb2MTJLDbt6Se5pXrnK+h194pq1S+n6zYoOyxmJ
 RJaM5B+DVjvBrdmXWm45VdKPtbgxIaa+sHU0oNk172/WjlLz6T83rS1J6rdCpfsyycuJ
 TndeKL0wQwdyNXyFq3IXYPsyEbMp5/SdZZNRA6dFW9S2Dwg/hY6WI7NcWqGntlolTcZq
 bqoQll25Jbp4K45n3b6Tk7CG54GeXrObAI2L2Q02E3g6FX4PBIZD28NyPieJpU2Il2Oa
 ezKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V7306x+Jo+GDemuCIpeIOawTbzWQwkapGEuokahzb7c=;
 b=j3JHFbNDt6Ad9twPHm7z0N9fzvXfPNRvJkgqB7JFOTnkbl5wxQ50MoUFu12b/k+clc
 OKtpZnm2mUT08g3jBLANNobupHW7GIqZ1JcePhO1YEhM7WrYXXrrzl2qabAcvTxhFJgH
 zl/5/y2oZSZtUjGvq5AqPMHVOPC6qGAd/w4vk6Hzg5hWZYux8b33v5KgRYGlALTM+Vup
 zQoyOnfvxS96RHOyxFzsFEyIrjdRHxiBsYL5fFjwjYO3IX2JHNqO7jiMyTn4s31soq9u
 jq97KYmdI7Pm6cBaRMA5xKi/TyrIsjOXwVz2P3ooo+N8LGBIkW/QKPbI86kOXYM0V8+3
 EOpQ==
X-Gm-Message-State: AOAM533D2UIkwvi2fN0VU/GDZkaFfKURL99KrLcC8Wc3z7lmfxB0papG
 mdIOBKTZR0Dr/FSdKsk+aK4=
X-Google-Smtp-Source: ABdhPJxzgcUypqebEoXR3etlpGae8Ppmn/fmi0NGLvG1DCD+gzQhnPcSdCTwysPUCpiZ4XTTnvek5Q==
X-Received: by 2002:a17:90a:a002:: with SMTP id
 q2mr4236894pjp.69.1639753392319; 
 Fri, 17 Dec 2021 07:03:12 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id mm22sm8802152pjb.28.2021.12.17.07.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:03:11 -0800 (PST)
Date: Sat, 18 Dec 2021 00:03:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YbymrS8yMR6OQ36d@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-7-shorne@gmail.com>
 <39803fe3-ab39-524a-c678-1b74d092c436@linaro.org>
 <3facf07d-85b9-7ccc-eee5-78be8dc69f45@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3facf07d-85b9-7ccc-eee5-78be8dc69f45@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 06/13] or1k: Atomics and Locking primitives
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgMDQ6NDM6NTJQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDE2LzEyLzIwMjEgMDk6NTIsIEFkaGVtZXJ2YWwgWmFuZWxs
YSB3cm90ZToKPiA+IExHVE0sIHRoYW5rcy4KPiA+IAo+ID4gT24gMTAvMTIvMjAyMSAyMDozNCwg
U3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6Cj4gPj4gLS0tCj4gPj4gIHN5c2Rl
cHMvb3Ixay9hdG9taWMtbWFjaGluZS5oIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKPiA+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ixay9hdG9taWMtbWFjaGluZS5oCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL2F0b21pYy1tYWNoaW5lLmggYi9zeXNkZXBzL29yMWsv
YXRvbWljLW1hY2hpbmUuaAo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAw
MDAwMDAwMC4uMWUzMDZhZTRlZgo+ID4+IC0tLSAvZGV2L251bGwKPiA+PiArKysgYi9zeXNkZXBz
L29yMWsvYXRvbWljLW1hY2hpbmUuaAo+ID4+IEBAIC0wLDAgKzEsNzkgQEAKPiA+PiArLyogQXRv
bWljIG9wZXJhdGlvbnMuICBPcGVuUklTQyB2ZXJzaW9uLgo+ID4+ICsgICBDb3B5cmlnaHQgKEMp
IDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCj4gPj4gKyAgIFRoaXMgZmlsZSBp
cyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5Lgo+ID4+ICsKPiA+PiArICAgVGhlIEdOVSBDIExp
YnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCj4g
Pj4gKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMKPiA+PiArICAgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgZWl0aGVyCj4gPj4gKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNl
LCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ID4+ICsKPiA+PiArICAg
VGhlIEdOVSBDIExpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxs
IGJlIHVzZWZ1bCwKPiA+PiArICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2
ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiA+PiArICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKPiA+PiArICAgTGVz
c2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiA+PiArCj4gPj4g
KyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2Vu
ZXJhbCBQdWJsaWMKPiA+PiArICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBHTlUgQyBMaWJyYXJ5
LiAgSWYgbm90LCBzZWUKPiA+PiArICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4g
ICovCj4gPj4gKwo+ID4+ICsjaWZuZGVmIF9fT1IxS19BVE9NSUNfSF8KPiA+PiArI2RlZmluZSBf
X09SMUtfQVRPTUlDX0hfCj4gPj4gKwo+ID4+ICsjaW5jbHVkZSA8c3RkaW50Lmg+Cj4gPj4gKwo+
ID4+ICt0eXBlZGVmIGludDMyX3QgYXRvbWljMzJfdDsKPiA+PiArdHlwZWRlZiB1aW50MzJfdCB1
YXRvbWljMzJfdDsKPiA+PiArCj4gPj4gK3R5cGVkZWYgaW50cHRyX3QgYXRvbWljcHRyX3Q7Cj4g
Pj4gK3R5cGVkZWYgdWludHB0cl90IHVhdG9taWNwdHJfdDsKPiA+PiArdHlwZWRlZiBpbnRtYXhf
dCBhdG9taWNfbWF4X3Q7Cj4gPj4gK3R5cGVkZWYgdWludG1heF90IHVhdG9taWNfbWF4X3Q7Cj4g
PiAKPiA+IFNpZ2gsIHRoZXNlIGRlZmluaXRpb24gYXJlIHVzZWQgc29sZWx5IGluIG9ubHkgZmls
ZSwgbWVtdXNhZ2UuYy4gIEFub3RoZXIgdGhpbmcKPiA+IEkgd2lsbCBjbGVhbnVwLgo+IAo+IEkg
anVzdCBzZW5kIGEgcGF0Y2hzZXQgdGhhdCBhaW1zIHRvIHNpbXBsaWZ5IHRoaXMgYm9pbGVycGxh
dGUgWzFdLiAgSXQgc2hvdWxkCj4gYWxzbyBzaW1wbGlmeSBvdGhlciBwYXJ0cyBvZiBPcGVuUklT
QyBzdWJtaXNzaW9uLgo+IAo+IFsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9s
aWJjLWFscGhhLzIwMjEtRGVjZW1iZXIvMTM0Mjg1Lmh0bWwKClRoYW5rcywgSSBoYXZlIHNlZW4g
aXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
