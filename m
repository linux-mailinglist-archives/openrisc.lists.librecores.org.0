Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D07DF435532
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 23:17:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8CD5224218;
	Wed, 20 Oct 2021 23:17:11 +0200 (CEST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mail.librecores.org (Postfix) with ESMTPS id 2811920272
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 23:17:10 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id v20so17021322plo.7
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ijuvhYL5JqGnt8gwx4OcpOXNPQx8CIEzH4dWbQJMmNI=;
 b=jp65QG/b68JaAD1EdeVI2yFrwB96QjjKxuiWWUgNcsj2AnQfDXXgjg3RXXTdf7oKyq
 s9HPK+9TVjLOD22BdmDOK2lVMK2I+sWdr01MSjxuDVIjTo8uqhr10EmMHpDv3XcqmHae
 byxE/ARjQpnmUnnW1GQJ0+HU7b74eX+gXUgpuhKE93W5ImG5Jogn3SjxdxeCTUyhn69Q
 YIq2gXiKbKI1FSHpQatpP3eTH9a9TlT1Z2L+lMuYtEkClJQAD6zJpO8UpeyzkOK89iwT
 LIPKw1Eu2no5/2U6IpQEyxelrb5OZ129Rc4nOkxpfTMm9qcmw7xzNGLY8apm3Jd3V3nL
 frhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ijuvhYL5JqGnt8gwx4OcpOXNPQx8CIEzH4dWbQJMmNI=;
 b=RB5gynVZhtrfY/fqEkK/QrBj+GjT1wHhqCzBBsf7Z1YiReVtWQ9GoC+3uTuWq7e2SE
 A2RnkAyLquSbIF8bNkfjAs7Do+dvnxs5GFDe1PMyfy5mNmcCXcNFFNscIIRXv5L8oRky
 10dcG7Pz4tOlPROiPnYXbFSdpjTy5zgedolYW/q7uof+wbcDBQXOhxJbJO3r0/KG1r53
 pW06KHCMWK/tvMZuvFOni062DE3o2dxiNuuqnu3w7qi5s8vbWtCLDwXzjJNWh4PzqtTv
 yaV7TRmTGSeJwUxV6VRq23QUYh8Je7ZvGIJ35+21O6YOqhJ7puxaGQtQmjTEI8RkqyND
 llxg==
X-Gm-Message-State: AOAM533nVIuQC7f+NCXutVi+bFGrqgDXTDB9siUkEoSwVz5A4mFrJ8p+
 9CinY0N8NmXwyusnc78EDmxb9CKLRbU=
X-Google-Smtp-Source: ABdhPJxS+wwoYNpj1opkB8I9CeMq2NQUgK1QlZniXxUjfncUuY9adyALHi2nQ/bHtUdr/FV4X614uw==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id
 v13mr1511086pjj.138.1634764628750; 
 Wed, 20 Oct 2021 14:17:08 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id p16sm3122835pgd.78.2021.10.20.14.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 14:17:07 -0700 (PDT)
Date: Thu, 21 Oct 2021 06:17:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Tom Tromey <tom@tromey.com>
Message-ID: <YXCHUXYCuee3POqO@antec>
References: <20210913124800.471680-1-shorne@gmail.com>
 <20210913124800.471680-2-shorne@gmail.com>
 <87mtn3vbwq.fsf@tromey.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtn3vbwq.fsf@tromey.com>
Subject: Re: [OpenRISC] [PATCH 1/5] gdb: or1k: implement gdb server
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
 Stafford Horne via Gdb-patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMTE6MzM6NDFBTSAtMDYwMCwgVG9tIFRyb21leSB3cm90
ZToKPiA+Pj4+PiAiPiIgPT0gU3RhZmZvcmQgSG9ybmUgdmlhIEdkYi1wYXRjaGVzIDxnZGItcGF0
Y2hlc0Bzb3VyY2V3YXJlLm9yZz4gd3JpdGVzOgo+IAo+ID4+IFRoaXMgcGF0Y2ggYWRkcyBnZGJz
ZXJ2ZXIgc3VwcG9ydCBmb3IgT3BlblJJU0MuICBUaGlzIGhhcyBiZWVuIHVzZWQgZm9yCj4gPj4g
ZGVidWdnaW5nIHRoZSBnbGliYyBwb3J0IHRoYXQgaW4gYmVpbmcgd29ya2VkIG9uIGhlcmU6Cj4g
Cj4gPj4gICBodHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2Mvb3Ixay1nbGliYy90cmVlL29yMWst
cG9ydC0yCj4gCj4gPj4gSGVuY2UgdGhlIGNvbW1lbnQgYWJvdXQgcmVnaXN0ZXJzIGRlZmluaXRp
b25zIGJlaW5nIGlubGluZSB3aXRoIGdsaWJjLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiAg
SSBoYWQgb25lIG1pbm9yIGNvbW1lbnQuCj4gCj4gPj4gKyNkZWZpbmUgb3Ixa19icmVha3BvaW50
X2xlbiA0Cj4gCj4gPj4gK2Jvb2wKPiA+PiArb3Ixa190YXJnZXQ6Omxvd19icmVha3BvaW50X2F0
IChDT1JFX0FERFIgd2hlcmUpCj4gPj4gK3sKPiA+PiArICB1bnNpZ25lZCBpbnQgaW5zbjsKPiA+
PiArCj4gPj4gKyAgcmVhZF9tZW1vcnkgKHdoZXJlLCAodW5zaWduZWQgY2hhciAqKSAmaW5zbiwg
NCk7Cj4gCj4gUGVyaGFwcyB0aGlzIG91Z2h0IHRvIHVzZSBvcjFrX2JyZWFrcG9pbnRfbGVuIGhl
cmUuCgpSaWdodCwgSSB3aWxsIHVwZGF0ZSB0aGF0IGJlZm9yZSBwdXNoaW5nLgoKPiA+PiArLyog
RmV0Y2ggdGhlIHRocmVhZC1sb2NhbCBzdG9yYWdlIHBvaW50ZXIgZm9yIGxpYnRocmVhZF9kYi4g
ICovCj4gPj4gKwo+ID4+ICtwc19lcnJfZQo+ID4+ICtwc19nZXRfdGhyZWFkX2FyZWEgKHN0cnVj
dCBwc19wcm9jaGFuZGxlICpwaCwKPiA+PiArCQkgICAgbHdwaWRfdCBsd3BpZCwgaW50IGlkeCwg
dm9pZCAqKmJhc2UpCj4gPj4gK3sKPiAKPiBOb3QgeW91ciBwcm9ibGVtIGJ1dCBpdCBzZWVtcyBs
aWtlIGEgc2hhbWUgdGhhdCB0aGlzIGV4YWN0Cj4gaW1wbGVtZW50YXRpb24gaXMgcmVwZWF0ZWQg
c2V2ZXJhbCB0aW1lcyBpbiBnZGJzZXJ2ZXIuCgpJIGFncmVlLgoKLVN0YWZmb3JkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
