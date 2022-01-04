Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B7FFF4849F7
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 22:38:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9CF8224312;
	Tue,  4 Jan 2022 22:38:47 +0100 (CET)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id 1B86124105
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 22:38:46 +0100 (CET)
Received: by mail-pl1-f182.google.com with SMTP id p14so27942475plf.3
 for <openrisc@lists.librecores.org>; Tue, 04 Jan 2022 13:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tygyEX8+sKX/7Y8Q0dgLZ9arywzpA+sw/Q+lEnWdueE=;
 b=fHZX5Bx/QS4tTFPgJZ+WBYni/gGbqL5pFQBP0+Mbcntdb0SEeBVvTSNnq5WEuCQ4Px
 0q8+5LLtZw+Ta8XuYEs2nZbxCi8HL03LZtNl1gTamFzwPCQCaXOYMcTNNZmLIr8z5D7D
 /V8AYAs6lh+BSxldWhsdOsxYnIfScSiH1f3qo3akCQgER+8pYwi/ajCvgJPhoOquWNzW
 F/C41w2Fn13PKyr7+jfqCKWedEzma3pgzLt+q+ZhffjTvHmgORFraB7lZk5o6g4EKCVi
 qm6BTzn5e75Vm914pQFNTNoTEZb3oJU/1f1HFdnU/XMKdlKalwSgWAKdYXFKBkb8FJ8c
 jh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tygyEX8+sKX/7Y8Q0dgLZ9arywzpA+sw/Q+lEnWdueE=;
 b=lioOBxev3yReg3tTXyTJOtfF3m32hJkXrmTZJeD/T45YZ6DYKasWRQ6Fxuuh7504Jo
 xxiOGBs9omLjWWDykUyIkCLfm7G1f2UBHGmua+/A83fkJfqjKVHi7e2rC2jIE/YmcWn0
 svBBSFPRfSR0htZd+CthUzS5GOF5lzfYuLLnMq2s28+O63KfeZ5Bl0v+AqoRZnIExp3L
 3tnlKHLpYLEMrtMsyDF5sNXHnQTZZZOHXRgcddAkagfqVtRQhRBytP1wf5os0JPS0QVO
 r4gJOOs2ErBQlN1y5rhTZtH+SA4ODxsgdO97nMfl+suSjwSx8qljP5Wk8ZLu8ew0nX32
 4jiA==
X-Gm-Message-State: AOAM531tsqxTJOf8fIG3qZXdvfa9vAyqHFrAMOZfU6637439dTYxEFfB
 WdSqVrGSCRcIkCkHR2/A0PQ=
X-Google-Smtp-Source: ABdhPJzsnKJu6b3wCsU/A7lWF2BP9b5vBz3d5zIgnFnzbIrJIiTmRk1BE48E9r4HVtLaaf00SYEtJw==
X-Received: by 2002:a17:90b:4b41:: with SMTP id
 mi1mr356442pjb.213.1641332324733; 
 Tue, 04 Jan 2022 13:38:44 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id np1sm258454pjb.42.2022.01.04.13.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 13:38:44 -0800 (PST)
Date: Wed, 5 Jan 2022 06:38:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YdS+YS2v58Oz7wL4@antec>
References: <20220104031414.2416928-1-shorne@gmail.com>
 <20220104031414.2416928-14-shorne@gmail.com>
 <b4207a34-da46-1464-dec2-70c3a39e969d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4207a34-da46-1464-dec2-70c3a39e969d@linaro.org>
Subject: Re: [OpenRISC] [PATCH v5 13/13] Documentation for OpenRISC port
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

T24gVHVlLCBKYW4gMDQsIDIwMjIgYXQgMDk6Mjg6MTJBTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDA0LzAxLzIwMjIgMDA6MTQsIFN0YWZmb3JkIEhvcm5lIHZp
YSBMaWJjLWFscGhhIHdyb3RlOgo+ID4gT3BlblJJU0MgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRp
b246Cj4gPiAKPiA+ICBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vb3BlbnJpc2Mv
ZG9jL21hc3Rlci9vcGVucmlzYy1hcmNoLTEuMy1yZXYxLnBkZgo+ID4gCj4gPiBDdXJyZW50bHkg
dGhlIHBvcnQgYXMgb2YgdGhlIDIwMjItMDEtMDMgcmViYXNpbmcgdGhlcmUgYXJlIG5vIGtub3du
Cj4gPiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgdGVzdCBmYWlsdXJlcy4KPiA+IAo+ID4gV3JpdGlu
ZyBjcmVkaXRzIGZvciB0aGUgcG9ydCBhcmU6Cj4gPiAKPiA+ICBTdGFmZm9yZCBIb3JuZSAgPHNo
b3JuZUBnbWFpbC5jb20+Cj4gPiAgQ2hyaXN0aWFuIFN2ZW5zc29uICA8Ymx1ZUBjbWQubnU+Cj4g
Cj4gTEdUTSwgdGhhbmtzLgo+IAo+IFJldmlld2VkLWJ5OiBBZGhlbWVydmFsIFphbmVsbGEgIDxh
ZGhlbWVydmFsLnphbmVsbGFAbGluYXJvLm9yZz4KClRoYW5rIHlvdS4KCj4gPiAtLS0KPiA+ICBO
RVdTICAgfCA5ICsrKysrKysrKwo+ID4gIFJFQURNRSB8IDEgKwo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvTkVXUyBiL05FV1MKPiA+
IGluZGV4IDlkYTJhNzQwZWMuLjFiN2E2NGQ2NTQgMTAwNjQ0Cj4gPiAtLS0gYS9ORVdTCj4gPiAr
KysgYi9ORVdTCj4gPiBAQCAtMTA2LDYgKzEwNiwxNSBAQCBNYWpvciBuZXcgZmVhdHVyZXM6Cj4g
PiAgICBjYW4gdXNlIGl0IHRvIGVmZmljaWVudGx5IGxvY2F0ZSB1bndpbmRpbmcgaW5mb3JtYXRp
b24gZm9yIGEgY29kZQo+ID4gICAgYWRkcmVzcy4KPiA+ICAKPiA+ICsqIFN1cHBvcnQgZm9yIE9w
ZW5SSVNDIHJ1bm5pbmcgb24gTGludXggaGFzIGJlZW4gYWRkZWQuICBUaGlzIHBvcnQgcmVxdWly
ZXMKPiA+ICsgIGFzIGxlYXN0IGJpbnV0aWxzIDIuMzUsIEdDQyAxMSwgYW5kIExpbnV4IDUuNC4g
IEN1cnJlbnRseSBvbmx5IHNvZnQtZmxvYXQKPiA+ICsgIEFCSSBpcyBzdXBwb3J0ZWQ6Cj4gPiAr
Cj4gPiArICAgIC0gb3Ixay1saW51eC1nbnUKPiA+ICsKPiA+ICsgIFRoZSBPcGVuUklTQyBBQkkg
aXMgMzItYml0IGJpZy1lbmRpYW4gYW5kIHVzZXMgNjQtYml0IHRpbWUgKHkyMDM4IHNhZmUpIGFu
ZAo+ID4gKyAgNjQtYml0IGZpbGUgb2Zmc2V0cyAoTEZTIGRlZmF1bHQpLgo+ID4gKwo+ID4gIERl
cHJlY2F0ZWQgYW5kIHJlbW92ZWQgZmVhdHVyZXMsIGFuZCBvdGhlciBjaGFuZ2VzIGFmZmVjdGlu
ZyBjb21wYXRpYmlsaXR5Ogo+ID4gIAo+ID4gICogT24geDg2LTY0LCB0aGUgTERfUFJFRkVSX01B
UF8zMkJJVF9FWEVDIGVudmlyb25tZW50IHZhcmlhYmxlIHN1cHBvcnQKPiA+IGRpZmYgLS1naXQg
YS9SRUFETUUgYi9SRUFETUUKPiA+IGluZGV4IGQwZjBlZGIzOTMuLjNkNWE3OGNjZmYgMTAwNjQ0
Cj4gPiAtLS0gYS9SRUFETUUKPiA+ICsrKyBiL1JFQURNRQo+ID4gQEAgLTM1LDYgKzM1LDcgQEAg
VGhlIEdOVSBDIExpYnJhcnkgc3VwcG9ydHMgdGhlc2UgY29uZmlndXJhdGlvbnMgZm9yIHVzaW5n
IExpbnV4IGtlcm5lbHM6Cj4gPiAgCW1pY3JvYmxhemUqLSotbGludXgtZ251Cj4gPiAgCW1pcHMt
Ki1saW51eC1nbnUKPiA+ICAJbWlwczY0LSotbGludXgtZ251Cj4gPiArCW9yMWstKi1saW51eC1n
bnUKPiA+ICAJcG93ZXJwYy0qLWxpbnV4LWdudQlIYXJkd2FyZSBvciBzb2Z0d2FyZSBmbG9hdGlu
ZyBwb2ludCwgQkUgb25seS4KPiA+ICAJcG93ZXJwYzY0Ki0qLWxpbnV4LWdudQlCaWctZW5kaWFu
IGFuZCBsaXR0bGUtZW5kaWFuLgo+ID4gIAlzMzkwLSotbGludXgtZ251Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
