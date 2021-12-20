Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 018AE47A90E
	for <lists+openrisc@lfdr.de>; Mon, 20 Dec 2021 12:53:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 90127242D5;
	Mon, 20 Dec 2021 12:53:51 +0100 (CET)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id C211A20E43
 for <openrisc@lists.librecores.org>; Mon, 20 Dec 2021 12:53:49 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so9896750pjq.4
 for <openrisc@lists.librecores.org>; Mon, 20 Dec 2021 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ayc93V3L7BuYFOl6XWRi3HB+Z+45QFXRMG3zcrEwomA=;
 b=JFe+X6TFYaTM7B9HO5ZRRS+N3Icq7KGFrbvrG+UXiVyJHJ7ia5RTpe8enzXZS7kbe2
 U8Dz9wp+GSjmPcvfCH9zn19/gqVm7UHZeF+geQVclGx+yq43bZv0bnt5SQ5VfrfbAPQ8
 7flJug6khVg+Es2OOA4BJwO7bqXU2WqIavpjDRny20lvt1ewgeiaeUxDZEDno5ik+3ql
 bduw7T4nvO3Dy2U6cWirB7fkDhjAtA3tjxWSYKZdup6VPLyAFCziWdwefl/W5tWvZTWj
 IyYGSetf1tweSKqTaI4CpLxsMYM3LIFzPG/g4GdIKXMQgt+3iQ/vNd/loR36Xh2Xz9LM
 oYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ayc93V3L7BuYFOl6XWRi3HB+Z+45QFXRMG3zcrEwomA=;
 b=yq/0uzFw4L0vbjF02AkqHk228QD170ecqP9SD1poPDnCPwXCHZJQIk62WnCP7/hgmG
 rLhC7szffAvsy4Pg+kKQxYoT7/Lxrpw2OznVSfYKjgfBSMi5XNxhFgND31945fhEsg1v
 JjnRrPMjw1Tr6N6Zrsvkw5exbw6zNbu1PVC0f79jD29OUUSdTZU/RZNJKj78oZJH0eC1
 w0Th1uHP4nJR6Glz2UL80GOaRhnWzrNH/hlgjXn0ZoO9lzUH+Y7hZz6rhMzI+9R8ty/T
 qQses6ObUSVRHn8ugcMFjPlt/mxmsXhTiuARSjddvbsZdnn+UvEfM7H+U3HNrAoQbYZK
 nzwQ==
X-Gm-Message-State: AOAM53233viwDZf9W9wAlpOoRX/mz5q2wjruWR7csg9sGy8Azmu1+LlT
 bKgoPvKUK8I8A8k/giQSVdo=
X-Google-Smtp-Source: ABdhPJyF66fUe6GdyzbqyI2ft0d4CPtLrgFQCRfwTaYMRHtFPtOV4cXfoNqkYgK26EEbSG9dWAEqAw==
X-Received: by 2002:a17:902:aa42:b0:148:ab2f:d3dd with SMTP id
 c2-20020a170902aa4200b00148ab2fd3ddmr6139101plr.110.1640001228159; 
 Mon, 20 Dec 2021 03:53:48 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id a1sm19876180pfv.99.2021.12.20.03.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 03:53:47 -0800 (PST)
Date: Mon, 20 Dec 2021 20:53:45 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YcBuya9mU0UM2LrA@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-9-shorne@gmail.com>
 <a4105fcc-1844-b022-f378-3d5474ecaf56@linaro.org>
 <YbymWIYUxR/ndzWb@antec>
 <58c906a6-76b0-e4e1-bc17-5338b10e25f0@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58c906a6-76b0-e4e1-bc17-5338b10e25f0@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 08/13] or1k: Linux Syscall Interface
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

T24gRnJpLCBEZWMgMTcsIDIwMjEgYXQgMDI6NDE6MjBQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDE3LzEyLzIwMjEgMTI6MDEsIFN0YWZmb3JkIEhvcm5lIHdy
b3RlOgo+ID4gT24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgMDY6MTc6NDVQTSAtMDMwMCwgQWRoZW1l
cnZhbCBaYW5lbGxhIHdyb3RlOgo+ID4+PiBkaWZmIC0tZ2l0IGEvc3lzZGVwcy91bml4L3N5c3Yv
bGludXgvb3Ixay9iaXRzL3RpbWVzaXplLmggYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFr
L2JpdHMvdGltZXNpemUuaAo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRleCAw
MDAwMDAwMDAwLi4zYWIzODhkYTdmCj4gPj4+IC0tLSAvZGV2L251bGwKPiA+Pj4gKysrIGIvc3lz
ZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9iaXRzL3RpbWVzaXplLmgKPiA+Pj4gQEAgLTAsMCAr
MSwxOSBAQAo+ID4+PiArLyogQml0IHNpemUgb2YgdGhlIHRpbWVfdCB0eXBlIGF0IGdsaWJjIGJ1
aWxkIHRpbWUsIE9wZW5SSVNDIHZlcnNpb24uCj4gPj4+ICsgICBDb3B5cmlnaHQgKEMpIDIwMjEg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCj4gPj4+ICsgICBUaGlzIGZpbGUgaXMgcGFy
dCBvZiB0aGUgR05VIEMgTGlicmFyeS4KPiA+Pj4gKwo+ID4+PiArICAgVGhlIEdOVSBDIExpYnJh
cnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCj4gPj4+
ICsgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwg
UHVibGljCj4gPj4+ICsgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uOyBlaXRoZXIKPiA+Pj4gKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNl
LCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ID4+PiArCj4gPj4+ICsg
ICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdp
bGwgYmUgdXNlZnVsLAo+ID4+PiArICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0
IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiA+Pj4gKyAgIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCj4gPj4+ICsg
ICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ID4+PiAr
Cj4gPj4+ICsgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVz
c2VyIEdlbmVyYWwgUHVibGljCj4gPj4+ICsgICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBD
IExpYnJhcnk7IGlmIG5vdCwgc2VlCj4gPj4+ICsgICA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy8+LiAgKi8KPiA+Pj4gKwo+ID4+PiArI2RlZmluZSBfX1RJTUVTSVpFCTY0Cj4gPj4KPiA+
PiBPaywgYWx0aG91Z2ggSSB0aGluayB3ZSBzaG91bGQgZmxpcCB0aGUgZGVmYXVsdCB0byA2NCBi
aXRzIG1ha2UKPiA+PiBvbGQgcG9ydHMgdG8gb3ZlcnJpZGUgdG8gMzIuCj4gPiAKPiA+IEl0IG1h
a2VzIHNlbnNlLiAgSXQgbWlnaHQgYmUgYSBiaXQgdHJpY2t5IGFzIGN1cnJlbnRseSBfX1RJTUVT
SVpFIGRlZmF1bHQgaXMKPiA+IF9fV09SRFNJWkUuICBJIHNlZSBhIGZldyBvbGQgcG9ydHMgd2hp
Y2ggaGF2ZSBfX1dPUkRTSVpFIDMyIGFuZCA2NCBsaWtlIHNwYXJjLgo+IAo+IEkgd2lsbCBmaXgg
dGhpcyB1cHN0cmVhbSwgaXQgaXMganVzdCBhIG1hdHRlciB0byBvdmVycmlkZSB0byAzMiBmb3Ig
b2xkZXIgcG9ydHMuCj4gCj4gPj4KPiA+PiBPaywgSSB0YWtlIHRoYXQgaW1wbGVtZW50aW5nIGl0
IHNvbGVseSBvbiBfX29yMWtfY2xvbmUgaXMgbW9yZSBjb21wbGV4IHRoYW4KPiA+PiB1c2luZyBh
IEMgd3JhcHBlci4KPiA+IAo+ID4gSSBhbSBub3QgdG8gY2xlYXIgd2hhdCB5b3UgbWVhbiBoZXJl
LCBJIHRha2UgeW91IGFyZSBhc2tpbmcgd2h5IHdlIGtlZXAKPiA+IF9fb3Ixa19jbG9uZSBpbiBh
c3NlbWJseSByYXRoZXIgdGhhbiBpbXBsZW1lbnQgX19vcjFrX2Nsb25lIGluIEMgdG9vLgo+ID4g
Cj4gPiBUaGVyZSBhcmUgc29tZSBzdGFjayBzZXR1cCBiaXRzIGluIF9fb3Ixa19jbG9uZSB3aGlj
aCByZXF1aXJlIGFzc2VtYmx5Lgo+ID4gCj4gCj4gSSBtZWFudCBvdGhlcndpc2UgaW4gZmFjdCwg
d2h5IG5vdCBpbXBsZW1lbnQgY2xvbmUgZm9yIG9yMWsgcHVyZWx5IGluIGFzc2VtYmx5LgoKSSBz
ZWUsIGl0IGNvdWxkIGJlIGRvbmUgYnV0IEkgdGhpbmsgaXQncyBlYXNpZXIgdG8gbWFpbnRhaW4g
d2l0aCB0aGUgdmFfYXJnCnBhcnNpbmcgYW5kIGdlbmVyaWMgc2V0X2Vycm5vIGhhbmRsaW5nIGJl
aW5nIGluIEMuCgotU3RhZmZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
