Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 614892FACA4
	for <lists+openrisc@lfdr.de>; Mon, 18 Jan 2021 22:29:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EB4F720162;
	Mon, 18 Jan 2021 22:29:24 +0100 (CET)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mail.librecores.org (Postfix) with ESMTPS id 3565020CD1
 for <openrisc@lists.librecores.org>; Mon, 18 Jan 2021 22:29:22 +0100 (CET)
Received: by mail-pg1-f169.google.com with SMTP id n10so11692756pgl.10
 for <openrisc@lists.librecores.org>; Mon, 18 Jan 2021 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yDS8nKSt0QHtoGRlVL3yo7Tz42bRn7bdm46KMMYcl9k=;
 b=N8/SoCXLX49yqIllemAgolFmUXPq5IQ/hob+WWe3SJsi20z5hMx5uh2uWQDaDs6Tiu
 CvRC0cmSVqbn/xCmL+D0lHROksdafidlZu+Nfafrkqo/eO3Y9y3ZYxPwNh6lmcItxaY6
 M0tNDOBpMesWoeQ0TeQY0SaErNoojuFpZQZAEAQoSyMRc4aqv8qMONQ7MxIOlI8lcZKr
 Nq3orgCVehvfb4M0YQ7S3EFhrq1v/WVTGQeihuyjCRw1UJDRUSU4JyCWT7fkF8oz6mdP
 nPqb/th1yoR8vfA4SeEcVvD9N6YcFLfI+H0hQHzl0arTN3toyLNEPl9XTxmCD+IWWdjE
 9TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yDS8nKSt0QHtoGRlVL3yo7Tz42bRn7bdm46KMMYcl9k=;
 b=PpvY5qgFwa+//GT9K1huXbYQCSQmx//UhckBlVCk/X3fYSSO3mQ2QUus21TLJhw2R/
 1MR+7tSM7kFxnGAmh0hGC57G7SpDsE10VKq65y0TPRzo2elHkeBy1LQqYRou2Iw/TTbt
 7Wxhcy4ExoKeW6FBuVW2U6Wje5ObS+BMs9RrIe9sHeEtXUkh2WxqzD5uSMRBwuN0Y1lC
 ILJqpkIPBsBmYpFJzyzILj1CLto6xceHl3nqfNZWNz7wHTZF2mPynU7KtfyXvCC0tcTS
 xuFykr/mzmGB5vQERnn7nBowWEquZZL5PGHKOMFWYjctZL+y0Qm6uQ9Sgf8L/F89bcfx
 8C0w==
X-Gm-Message-State: AOAM5319eOGkAssHMV9pCvaTcFd6NCJs63Vf9Q2aTadosu4Ahuj39LXY
 aB0LrnDbocNX3oj4braeumM=
X-Google-Smtp-Source: ABdhPJwtkFTed57eOpqSNWNlSWvJLnYPDOsYv4zyV6jRqCKZFq3wp6YlHrLlEnEm2XBj5o5HTxlQHw==
X-Received: by 2002:a63:130b:: with SMTP id i11mr1474750pgl.300.1611005359768; 
 Mon, 18 Jan 2021 13:29:19 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 w18sm16613701pfj.120.2021.01.18.13.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 13:29:19 -0800 (PST)
Date: Tue, 19 Jan 2021 06:29:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Abhijeet Badurkar <abhijeet.badurkar@duagon.com>
Message-ID: <20210118212917.GI2002709@lianli.shorne-pla.net>
References: <81bbd71a-ff79-9f15-753a-d47b36b91756@pengutronix.de>
 <ea134d96-0856-62af-ea19-f6e0c2d80c90@duagon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea134d96-0856-62af-ea19-f6e0c2d80c90@duagon.com>
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
Cc: openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgMDk6MDk6MDRQTSArMDEwMCwgQWJoaWplZXQgQmFkdXJr
YXIgd3JvdGU6Cj4g77u/Cj4gSGVsbG8sCj4gCj4gaSBhbSBnZXR0aW5nIHNwYXJzZSB3YXJuaW5n
IHJlZ2FyZGluZyBpb3VubWFwIGltcGxlbWVudGF0aW9uIG9mIG9wZW5yaXNjIGFyY2hpdGVjdHVy
ZSBmb3IgbXkgQ0FOIGRyaXZlciBwYXRjaC4gSXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiB3
aHkgaW91bm1hcCBvZiBvcGVucmlzYyBkb2Vzbid0IGhhdmUgX19pb21lbSBhbm5ub3RhdGlvbj8g
Q291bGQgeW91IHBsZWFzZSBzdWdnZXN0IGEgZml4IGZvciB0aGlzPwoKSGVsbG8sCgpTb3JyeSBJ
IG1pc3NlZCB0aGlzIHBhdGNoIGFzIEkgZGlkbid0IHJlY29nbml6ZSB0aGUgc3ViamVjdC4KCllv
dSBjb3VsZCBzZW5kIGEgcGF0Y2ggZm9yIGlvdW5tYXAgaWYgeW91IGxpa2UuICBPdGhlcndpc2Ug
SSBjYW4gZ2V0IGFyb3VuZCB0bwppdCBpbiBhIGZldyBkYXlzLgoKVGhlIHBhdGNoIHdvdWxkIGJl
IHNvbWV0aGluZyBsaWtlOgoKLS0tIGEvYXJjaC9vcGVucmlzYy9tbS9pb3JlbWFwLmMKKysrIGIv
YXJjaC9vcGVucmlzYy9tbS9pb3JlbWFwLmMKQEAgLTc3LDcgKzc3LDcgQEAgdm9pZCBfX2lvbWVt
ICpfX3JlZiBpb3JlbWFwKHBoeXNfYWRkcl90IGFkZHIsIHVuc2lnbmVkIGxvbmcKc2l6ZSkKIH0K
IEVYUE9SVF9TWU1CT0woaW9yZW1hcCk7CiAKLXZvaWQgaW91bm1hcCh2b2lkICphZGRyKQordm9p
ZCBpb3VubWFwKHZvaWQgX19pb21lbSAqYWRkcikKIHsKICAgICAgICAvKiBJZiB0aGUgcGFnZSBp
cyBmcm9tIHRoZSBmaXhtYXAgcG9vbCB0aGVuIHdlIGp1c3QgY2xlYXIgb3V0CiAgICAgICAgICog
dGhlIGZpeG1hcCBtYXBwaW5nLgoKCj4gVGh4Lgo+IAo+IEFiaGlqZWV0Cj4gCj4gCj4gCj4gTS4g
U2MuCj4gQWJoaWplZXQgQmFkdXJrYXIKPiBTb2Z0d2FyZSBFbmdpbmVlcmluZyAKPiBCdXNpbmVz
cyBVbml0IENvbXB1dGluZyBTeXN0ZW1zLCBkdWFnb24KPiAKPiBkdWFnb24gR2VybWFueSBHbWJI
Cj4gTmV1d2llZGVyIFN0cmHDn2UgMS03Cj4gOTA0MTEgTsO8cm5iZXJnCj4gRGV1dHNjaGxhbmQK
PiBQaG9uZQkJKzQ5IDkxMSA5OSAzMyA1IC0gMjE5Cj4gd3d3LmR1YWdvbi5jb20KPiAKPiBkdWFn
b24gR2VybWFueSBHbWJIIC0gR2VzY2jDpGZ0c2bDvGhyZXI6IERyLiBNaWNoYWVsIEdvbGRiYWNo
IC0gTWF0aGlhcyBLYW1vbHogLSBLYWxpbmEgU2NvdHQgLSBIYW5kZWxzcmVnaXN0ZXIvVHJhZGUg
UmVnaXN0ZXIgQUcgTsO8cm5iZXJnIEhSQiA1NTQwCj4gCj4gVGhpcyBtZXNzYWdlIGFuZC9vciBh
dHRhY2htZW50cyBtYXkgYmUgcHJpdmlsZWdlZCBvciBjb25maWRlbnRpYWwuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgaGVyZWJ5IG5vdGlmaWVkIHRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyB0cmFuc21pdHRhbCBpbiBlcnJvcjsgYW55IHJldmlldywg
ZGlzc2VtaW5hdGlvbiwgb3IgY29weWluZyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3Ug
cmVjZWl2ZWQgdGhpcyB0cmFuc21pdHRhbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB1cyBpbW1l
ZGlhdGVseSBieSByZXBseSBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQg
YWxsIGl0cyBhdHRhY2htZW50cy4gVGhhbmsgeW91Lgo+IC0tLS0tLS0tIEZvcndhcmRlZCBNZXNz
YWdlIC0tLS0tLS0tCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NV0gbmV0OiBjYW46IEludHJvZHVj
ZSBNRU4gMTZaMTkyLTAwIENBTiBjb250cm9sbGVyIGRyaXZlcgo+IERhdGU6IEZyaSwgMTYgT2N0
IDIwMjAgMDk6NTU6MzYgKzAyMDAKPiBGcm9tOiBNYXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1
dHJvbml4LmRlPgo+IFRvOiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4sIEFiaGlq
ZWV0IEJhZHVya2FyIDxhYmhpamVldC5iYWR1cmthckBkdWFnb24uY29tPiwgd2dAZ3JhbmRlZ2dl
ci5jb20KPiBDQzoga2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcsIGxpbnV4LWNhbkB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJlYXMuZ2Vpc3NsZXJAZHVh
Z29uLmNvbSwgSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPiwgU3RlZmFuIEtyaXN0aWFu
c3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZpPiwgU3RhZmZvcmQgSG9ybmUg
PHNob3JuZUBnbWFpbC5jb20+LCBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IAo+ICog
UEdQIFNpZ25lZCBieSBhbiB1bmtub3duIGtleQo+IAo+IE9uIDEwLzE2LzIwIDE6NDkgQU0sIGtl
cm5lbCB0ZXN0IHJvYm90IHdyb3RlOgo+ID4gSGkgQWJoaWplZXQsCj4gPiAKPiA+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoISBQZXJoYXBzIHNvbWV0aGluZyB0byBpbXByb3ZlOgo+ID4gCj4gPiBb
YXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gNTQ5NzM4ZjE1ZGEwZTVhMDAyNzU5Nzc2MjNiZTE5
OWZiYmY3ZGY1MF0KPiA+IAo+ID4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9s
aW51eC9jb21taXRzL0FiaGlqZWV0LUJhZHVya2FyL25ldC1jYW4tSW50cm9kdWNlLU1FTi0xNlox
OTItMDAtQ0FOLWNvbnRyb2xsZXItZHJpdmVyLzIwMjAxMDA1LTE5MjEzMgo+ID4gYmFzZTogICAg
NTQ5NzM4ZjE1ZGEwZTVhMDAyNzU5Nzc2MjNiZTE5OWZiYmY3ZGY1MAo+ID4gY29uZmlnOiBvcGVu
cmlzYy1yYW5kY29uZmlnLXMwMzEtMjAyMDEwMTUgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gPiBj
b21waWxlcjogb3Ixay1saW51eC1nY2MgKEdDQykgOS4zLjAKPiA+IHJlcHJvZHVjZToKPiA+ICAg
ICAgICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRl
c3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcwo+ID4gICAgICAg
ICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gPiAgICAgICAgICMgYXB0LWdldCBpbnN0YWxs
IHNwYXJzZQo+ID4gICAgICAgICAjIHNwYXJzZSB2ZXJzaW9uOiB2MC42LjMtcmMxLWRpcnR5Cj4g
PiAgICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0LzI2Nzg3
Njc3MWE0MzRiMmJlMzI3OGMyYzg3ZDM2MTQ2YzBmYWM3N2QKPiA+ICAgICAgICAgZ2l0IHJlbW90
ZSBhZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4Cj4gPiAg
ICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtcmV2aWV3IEFiaGlqZWV0LUJhZHVya2Fy
L25ldC1jYW4tSW50cm9kdWNlLU1FTi0xNloxOTItMDAtQ0FOLWNvbnRyb2xsZXItZHJpdmVyLzIw
MjAxMDA1LTE5MjEzMgo+ID4gICAgICAgICBnaXQgY2hlY2tvdXQgMjY3ODc2NzcxYTQzNGIyYmUz
Mjc4YzJjODdkMzYxNDZjMGZhYzc3ZAo+ID4gICAgICAgICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5j
b25maWcgdG8gbGludXggYnVpbGQgdHJlZQo+ID4gICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BB
VEg9JEhPTUUvMGRheSBDT01QSUxFUj1nY2MtOS4zLjAgbWFrZS5jcm9zcyBDPTEgQ0Y9Jy1mZGlh
Z25vc3RpYy1wcmVmaXggLURfX0NIRUNLX0VORElBTl9fJyBBUkNIPW9wZW5yaXNjIAo+IAo+IEkg
dGhpbmsgaXQncyB0aGUgb3BlbnJpc2MgYXJjaCB0byBibGFtZV53IGFzayBoZXJlLCBzaW5jZSB0
aGVpciBpb3VubWFwIGRvZXNuJ3QKPiBoYXZlIF9faW9tZW0gYW5ub3RhdGlvbi4KPiAKPiA+IAo+
ID4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHBy
b3ByaWF0ZQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pgo+ID4gCj4gPiAKPiA+ICJzcGFyc2Ugd2FybmluZ3M6IChuZXcgb25lcyBwcmVmaXhlZCBieSA+
PikiCj4gPj4+IGRyaXZlcnMvbmV0L2Nhbi9tZW5fejE5Ml9jYW4uYzoxMDU3OjE3OiBzcGFyc2U6
IHNwYXJzZTogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGFkZHJlc3Mg
c3BhY2VzKSBAQCAgICAgZXhwZWN0ZWQgdm9pZCAqYWRkciBAQCAgICAgZ290IHZvaWQgW25vZGVy
ZWZdIF9faW9tZW0gKlthc3NpZ25lZF0gZGV2X2Jhc2UgQEAKPiA+Pj4gZHJpdmVycy9uZXQvY2Fu
L21lbl96MTkyX2Nhbi5jOjEwNTc6MTc6IHNwYXJzZTogICAgIGV4cGVjdGVkIHZvaWQgKmFkZHIK
PiA+Pj4gZHJpdmVycy9uZXQvY2FuL21lbl96MTkyX2Nhbi5jOjEwNTc6MTc6IHNwYXJzZTogICAg
IGdvdCB2b2lkIFtub2RlcmVmXSBfX2lvbWVtICpbYXNzaWduZWRdIGRldl9iYXNlCj4gPj4+IGRy
aXZlcnMvbmV0L2Nhbi9tZW5fejE5Ml9jYW4uYzoxMDcxOjIxOiBzcGFyc2U6IHNwYXJzZTogaW5j
b3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKSBAQCAg
ICAgZXhwZWN0ZWQgdm9pZCAqYWRkciBAQCAgICAgZ290IHZvaWQgW25vZGVyZWZdIF9faW9tZW0g
KmRldl9iYXNlIEBACj4gPiAgICBkcml2ZXJzL25ldC9jYW4vbWVuX3oxOTJfY2FuLmM6MTA3MToy
MTogc3BhcnNlOiAgICAgZXhwZWN0ZWQgdm9pZCAqYWRkcgo+ID4+PiBkcml2ZXJzL25ldC9jYW4v
bWVuX3oxOTJfY2FuLmM6MTA3MToyMTogc3BhcnNlOiAgICAgZ290IHZvaWQgW25vZGVyZWZdIF9f
aW9tZW0gKmRldl9iYXNlCj4gPiAKPiA+IHZpbSArMTA1NyBkcml2ZXJzL25ldC9jYW4vbWVuX3ox
OTJfY2FuLmMKPiA+IAo+ID4gICAgOTYyCQo+ID4gICAgOTYzCXN0YXRpYyBpbnQgbWVuX3oxOTJf
cHJvYmUoc3RydWN0IG1jYl9kZXZpY2UgKm1kZXYsCj4gPiAgICA5NjQJCQkJICBjb25zdCBzdHJ1
Y3QgbWNiX2RldmljZV9pZCAqaWQpCj4gPiAgICA5NjUJewo+ID4gICAgOTY2CQlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmbWRldi0+ZGV2Owo+ID4gICAgOTY3CQlzdHJ1Y3QgbWVuX3oxOTIgKnByaXY7
Cj4gPiAgICA5NjgJCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2Owo+ID4gICAgOTY5CQl2b2lkIF9f
aW9tZW0gKmRldl9iYXNlOwo+ID4gICAgOTcwCQlzdHJ1Y3QgcmVzb3VyY2UgKm1lbTsKPiA+ICAg
IDk3MQkJdTMyIHRpbWViYXNlOwo+ID4gICAgOTcyCQlpbnQgcmV0ID0gMDsKPiA+ICAgIDk3MwkJ
aW50IGlycTsKPiA+ICAgIDk3NAkKPiA+ICAgIDk3NQkJbWVtID0gbWNiX3JlcXVlc3RfbWVtKG1k
ZXYsIGRldl9uYW1lKGRldikpOwo+ID4gICAgOTc2CQlpZiAoSVNfRVJSKG1lbSkpIHsKPiA+ICAg
IDk3NwkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlcXVlc3QgZGV2aWNlIG1lbW9yeSIpOwo+
ID4gICAgOTc4CQkJcmV0dXJuIFBUUl9FUlIobWVtKTsKPiA+ICAgIDk3OQkJfQo+ID4gICAgOTgw
CQo+ID4gICAgOTgxCQlkZXZfYmFzZSA9IGlvcmVtYXAobWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6
ZShtZW0pKTsKPiA+ICAgIDk4MgkJaWYgKCFkZXZfYmFzZSkgewo+ID4gICAgOTgzCQkJZGV2X2Vy
cihkZXYsICJmYWlsZWQgdG8gaW9yZW1hcCBkZXZpY2UgbWVtb3J5Iik7Cj4gPiAgICA5ODQJCQly
ZXQgPSAtRU5YSU87Cj4gPiAgICA5ODUJCQlnb3RvIG91dF9yZWxlYXNlOwo+ID4gICAgOTg2CQl9
Cj4gPiAgICA5ODcJCj4gPiAgICA5ODgJCWlycSA9IG1jYl9nZXRfaXJxKG1kZXYpOwo+ID4gICAg
OTg5CQlpZiAoaXJxIDw9IDApIHsKPiA+ICAgIDk5MAkJCXJldCA9IC1FTk9ERVY7Cj4gPiAgICA5
OTEJCQlnb3RvIG91dF91bm1hcDsKPiA+ICAgIDk5MgkJfQo+ID4gICAgOTkzCQo+ID4gICAgOTk0
CQluZGV2ID0gYWxsb2NfY2FuZGV2KHNpemVvZihzdHJ1Y3QgbWVuX3oxOTIpLCAwKTsKPiA+ICAg
IDk5NQkJaWYgKCFuZGV2KSB7Cj4gPiAgICA5OTYJCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBh
bGxvY2F0IHRoZSBjYW4gZGV2aWNlIik7Cj4gPiAgICA5OTcJCQlyZXQgPSAtRU5PTUVNOwo+ID4g
ICAgOTk4CQkJZ290byBvdXRfdW5tYXA7Cj4gPiAgICA5OTkJCX0KPiA+ICAgMTAwMAkKPiA+ICAg
MTAwMQkJbmRldi0+bmV0ZGV2X29wcyA9ICZtZW5fejE5Ml9uZXRkZXZfb3BzOwo+ID4gICAxMDAy
CQluZGV2LT5pcnEgPSBpcnE7Cj4gPiAgIDEwMDMJCW5kZXYtPmZsYWdzIHw9IElGRl9FQ0hPOwo+
ID4gICAxMDA0CQo+ID4gICAxMDA1CQlwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7Cj4gPiAgIDEw
MDYJCXByaXYtPm5kZXYgPSBuZGV2Owo+ID4gICAxMDA3CQlwcml2LT5kZXYgPSBkZXY7Cj4gPiAg
IDEwMDgJCj4gPiAgIDEwMDkJCXByaXYtPm1lbSA9IG1lbTsKPiA+ICAgMTAxMAkJcHJpdi0+ZGV2
X2Jhc2UgPSBkZXZfYmFzZTsKPiA+ICAgMTAxMQkJcHJpdi0+cmVncyA9IHByaXYtPmRldl9iYXNl
ICsgTUVOX1oxOTJfUkVHU19PRkZTOwo+ID4gICAxMDEyCQo+ID4gICAxMDEzCQl0aW1lYmFzZSA9
IHJlYWRsKCZwcml2LT5yZWdzLT50aW1lYmFzZSk7Cj4gPiAgIDEwMTQJCWlmICghdGltZWJhc2Up
IHsKPiA+ICAgMTAxNQkJCWRldl9lcnIoZGV2LCAiaW52YWxpZCB0aW1lYmFzZSBjb25maWd1cmVk
ICh0aW1lYmFzZT0lZClcbiIsCj4gPiAgIDEwMTYJCQkJdGltZWJhc2UpOwo+ID4gICAxMDE3CQkJ
cmV0ID0gLUVJTlZBTDsKPiA+ICAgMTAxOAkJCWdvdG8gb3V0X2ZyZWVfY2FuZGV2Owo+ID4gICAx
MDE5CQl9Cj4gPiAgIDEwMjAJCj4gPiAgIDEwMjEJCXByaXYtPmNhbi5jbG9jay5mcmVxID0gdGlt
ZWJhc2U7Cj4gPiAgIDEwMjIJCXByaXYtPmNhbi5iaXR0aW1pbmdfY29uc3QgPSAmbWVuX3oxOTJf
Yml0dGltaW5nX2NvbnN0Owo+ID4gICAxMDIzCQlwcml2LT5jYW4uZG9fc2V0X21vZGUgPSBtZW5f
ejE5Ml9zZXRfbW9kZTsKPiA+ICAgMTAyNAkJcHJpdi0+Y2FuLmRvX2dldF9iZXJyX2NvdW50ZXIg
PSBtZW5fejE5Ml9nZXRfYmVycl9jb3VudGVyOwo+ID4gICAxMDI1CQlwcml2LT5jYW4uY3RybG1v
ZGVfc3VwcG9ydGVkID0gQ0FOX0NUUkxNT0RFX0xJU1RFTk9OTFkgfAo+ID4gICAxMDI2CQkJCQkg
ICAgICAgQ0FOX0NUUkxNT0RFXzNfU0FNUExFUyB8Cj4gPiAgIDEwMjcJCQkJCSAgICAgICBDQU5f
Q1RSTE1PREVfTE9PUEJBQ0s7Cj4gPiAgIDEwMjgJCj4gPiAgIDEwMjkJCXNwaW5fbG9ja19pbml0
KCZwcml2LT5sb2NrKTsKPiA+ICAgMTAzMAkKPiA+ICAgMTAzMQkJbmV0aWZfbmFwaV9hZGQobmRl
diwgJnByaXYtPm5hcGksIG1lbl96MTkyX3BvbGwsCj4gPiAgIDEwMzIJCQkgICAgICAgTkFQSV9Q
T0xMX1dFSUdIVCk7Cj4gPiAgIDEwMzMJCj4gPiAgIDEwMzQJCXNrYl9xdWV1ZV9oZWFkX2luaXQo
JnByaXYtPmVjaG9xKTsKPiA+ICAgMTAzNQkKPiA+ICAgMTAzNgkJbWNiX3NldF9kcnZkYXRhKG1k
ZXYsIG5kZXYpOwo+ID4gICAxMDM3CQlTRVRfTkVUREVWX0RFVihuZGV2LCBkZXYpOwo+ID4gICAx
MDM4CQo+ID4gICAxMDM5CQluZGV2LT5ldGh0b29sX29wcyA9ICZtZW5fejE5Ml9ldGh0b29sX29w
czsKPiA+ICAgMTA0MAkKPiA+ICAgMTA0MQkJcmV0ID0gbWVuX3oxOTJfcmVnaXN0ZXIobmRldik7
Cj4gPiAgIDEwNDIJCWlmIChyZXQpIHsKPiA+ICAgMTA0MwkJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIHJlZ2lzdGVyIENBTiBkZXZpY2UiKTsKPiA+ICAgMTA0NAkJCWdvdG8gb3V0X2ZyZWVfY2Fu
ZGV2Owo+ID4gICAxMDQ1CQl9Cj4gPiAgIDEwNDYJCj4gPiAgIDEwNDcJCWRldm1fY2FuX2xlZF9p
bml0KG5kZXYpOwo+ID4gICAxMDQ4CQo+ID4gICAxMDQ5CQlkZXZfaW5mbyhkZXYsICJNRU4gMTZ6
MTkyIENBTiBkcml2ZXIgc3VjY2Vzc2Z1bGx5IHJlZ2lzdGVyZWRcbiIpOwo+ID4gICAxMDUwCQo+
ID4gICAxMDUxCQlyZXR1cm4gMDsKPiA+ICAgMTA1MgkKPiA+ICAgMTA1MwlvdXRfZnJlZV9jYW5k
ZXY6Cj4gPiAgIDEwNTQJCW5ldGlmX25hcGlfZGVsKCZwcml2LT5uYXBpKTsKPiA+ICAgMTA1NQkJ
ZnJlZV9jYW5kZXYobmRldik7Cj4gPiAgIDEwNTYJb3V0X3VubWFwOgo+ID4+IDEwNTcJCWlvdW5t
YXAoZGV2X2Jhc2UpOwo+ID4gICAxMDU4CW91dF9yZWxlYXNlOgo+ID4gICAxMDU5CQltY2JfcmVs
ZWFzZV9tZW0obWVtKTsKPiA+ICAgMTA2MAkJcmV0dXJuIHJldDsKPiA+ICAgMTA2MQl9Cj4gPiAg
IDEwNjIJCj4gPiAgIDEwNjMJc3RhdGljIHZvaWQgbWVuX3oxOTJfcmVtb3ZlKHN0cnVjdCBtY2Jf
ZGV2aWNlICptZGV2KQo+ID4gICAxMDY0CXsKPiA+ICAgMTA2NQkJc3RydWN0IG5ldF9kZXZpY2Ug
Km5kZXYgPSBtY2JfZ2V0X2RydmRhdGEobWRldik7Cj4gPiAgIDEwNjYJCXN0cnVjdCBtZW5fejE5
MiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwo+ID4gICAxMDY3CQo+ID4gICAxMDY4CQl1bnJl
Z2lzdGVyX2NhbmRldihuZGV2KTsKPiA+ICAgMTA2OQkJbmV0aWZfbmFwaV9kZWwoJnByaXYtPm5h
cGkpOwo+ID4gICAxMDcwCQo+ID4+IDEwNzEJCWlvdW5tYXAocHJpdi0+ZGV2X2Jhc2UpOwo+ID4g
ICAxMDcyCQltY2JfcmVsZWFzZV9tZW0ocHJpdi0+bWVtKTsKPiA+ICAgMTA3MwkKPiA+ICAgMTA3
NAkJZnJlZV9jYW5kZXYobmRldik7Cj4gPiAgIDEwNzUJfQo+ID4gICAxMDc2CQo+ID4gCj4gPiAt
LS0KPiA+IDAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENvcnBvcmF0aW9uCj4g
PiBodHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4w
MS5vcmcKPiA+IAo+IAo+IE1hcmMKPiAKPiAtLSAKPiBQZW5ndXRyb25peCBlLksuICAgICAgICAg
ICAgICAgICB8IE1hcmMgS2xlaW5lLUJ1ZGRlICAgICAgICAgICB8Cj4gRW1iZWRkZWQgTGludXgg
ICAgICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZSAgfAo+IFZlcnRy
ZXR1bmcgV2VzdC9Eb3J0bXVuZCAgICAgICAgIHwgUGhvbmU6ICs0OS0yMzEtMjgyNi05MjQgICAg
IHwKPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiB8IEZheDogICArNDktNTEyMS0y
MDY5MTctNTU1NSB8Cj4gCj4gCj4gKiBVbmtub3duIEtleQo+ICogMHhGQUVERUZBOQo+IAo+ICAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
