Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA4345799A
	for <lists+openrisc@lfdr.de>; Sat, 20 Nov 2021 00:37:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 59646242BD;
	Sat, 20 Nov 2021 00:37:02 +0100 (CET)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id 6332E242B8
 for <openrisc@lists.librecores.org>; Sat, 20 Nov 2021 00:37:00 +0100 (CET)
Received: by mail-pl1-f182.google.com with SMTP id q17so9268787plr.11
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 15:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xTd0/KemfPs9xdj7VAtU6M+S5SCkJAPQdl1BI1zIq+0=;
 b=ceU1H60O76X912JQ4KWJzbvFBBc+G/jZLhBAoqnWlhepZ/3y0Mlk0qtNPg4ui44AL0
 Lcv98no5lrbdW2T7AXojh1KG+YGvzgvTNJPNSCaKKKdaGpBoSsdwO179jDni8j+K4c8F
 X11k+zN9dxMM5Ajfgb4OSbD2pl4FI74VH6ablLgLa5jJXqiFtQP0wN+cOm1/aFHKUZhB
 xBtfTxCkKbmD3VXiD7Y0gs9FdHA553WDUFcdR47UqcDQH9EfhEIz33GuDqTKaoUc79Hv
 mpXF8vu4/ojNwHzu32poIKzJoWj5y3URk8+vouFyZr+HT9VbfQVJWUqzjhkbS62fXg2M
 NNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xTd0/KemfPs9xdj7VAtU6M+S5SCkJAPQdl1BI1zIq+0=;
 b=VXqSay9vl/V4HTlJmrptswazMMrOV5Ocb5gy3PZW3bO5vEXIPUDjtxowK1y1Am6d9Z
 QF0wxNczxDgs6S3QNCfjIIZkF7RHh/g9Np28COTJD2EOSYIn2ncjqQGE5UkyatcrCcNW
 ziKF/wxmI+ZqfCjvl9G7ieG+KLWGqpJLMkmqkszx+rc5c2VxnSZswgNKwwMglg41AspO
 REEzpaTiS15biBBGNE74n3Ww77AK88M/x8JIgmw5TYM8qsC4AL0K1RDfcekd6QOPkgXS
 1sC5V4rK2ZU/MmDG3LrVyQRB/0FjzXn5wJ2OrwhKRSr/KdAnCXWZ90oseCpLOxOAzku4
 khcg==
X-Gm-Message-State: AOAM5303naYOK2HEXOUeaWJwOKPcr/M/GpqAMGRPEyuZSxqS1CK0pibJ
 sP0iiJg+b6kN2P3+sLOViIE=
X-Google-Smtp-Source: ABdhPJwR0gFvrvStg1jxlftz9iCoL2WNPn5yv/zqtAAPxscWqQtnM6Jp6akTlN0dC+4lSTA4rSUyhA==
X-Received: by 2002:a17:90a:6487:: with SMTP id
 h7mr4544607pjj.40.1637365018855; 
 Fri, 19 Nov 2021 15:36:58 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id s15sm542274pjs.51.2021.11.19.15.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 15:36:58 -0800 (PST)
Date: Sat, 20 Nov 2021 08:36:56 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YZg1GDq00WB/PtnO@antec>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-12-shorne@gmail.com>
 <alpine.DEB.2.22.394.2111182231450.1393807@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2111182231450.1393807@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v2 11/13] or1k: Build Infrastructure
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

T24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMTA6MzQ6MTBQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIFNhdCwgMTMgTm92IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsv
Y29uZmlndXJlLmFjIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9jb25maWd1cmUuYWMK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5kNDM5ZTdmZDUz
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFr
L2NvbmZpZ3VyZS5hYwo+ID4gQEAgLTAsMCArMSw0IEBACj4gPiArR0xJQkNfUFJPVklERVMgZG5s
IFNlZSBhY2xvY2FsLm00IGluIHRoZSB0b3AgbGV2ZWwgc291cmNlIGRpcmVjdG9yeS4KPiA+ICsj
IExvY2FsIGNvbmZpZ3VyZSBmcmFnbWVudCBmb3Igc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ix
ay4KPiA+ICsKPiA+ICthcmNoX21pbmltdW1fa2VybmVsPTUuMTAuMAo+IAo+IFRoaXMgc2VlbXMg
dG8gYmUgYSBsb3QgbW9yZSByZWNlbnQgdGhhbiB3aGVuIE9wZW5SSVNDIHN1cHBvcnQgd2FzIGFj
dHVhbGx5IAo+IGFkZGVkIHRvIHRoZSBMaW51eCBrZXJuZWwsIGFuZCBhbHNvIG1vcmUgcmVjZW50
IHRoYW4gd2hlbiA2NC1iaXQgdGltZSAKPiBzdXBwb3J0IHdhcyBhZGRlZCBmb3IgMzItYml0IGFy
Y2hpdGVjdHVyZXMgKHdoaWNoIG1heSBiZSBhIGNvbnZlbmllbnQgCj4gbWluaW11bSBrZXJuZWwg
Zm9yIHNvbWUgbmV3IDMyLWJpdCBhcmNoaXRlY3R1cmVzIGZvciB0aGF0IHJlYXNvbikuICAKPiBS
ZXF1aXJpbmcgYSBuZXdlciBrZXJuZWwgbGlrZSB0aGF0IGlzIGNlcnRhaW5seSBmaW5lIGlmIGNv
bnZlbmllbnQgZm9yIHRoZSAKPiBwb3J0LCBidXQgSSB0aGluayB0aGUgY2hvaWNlIG9mIG1pbmlt
dW0ga2VybmVsIHZlcnNpb24sIGFuZCB0aGUgcmVhc29ucyAKPiBmb3IgaXQsIGRlc2VydmUgbWVu
dGlvbiBhdCBsZWFzdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRoZSBORVdTIGZpbGUgCj4g
ZW50cnkuCgpPSywgZHVyaW5nIHRoZSB2MSByZXZpZXcgeW91IG1lbnRpb25lZDoKCiAgICBZb3Un
bGwgcHJvYmFibHkgbmVlZCBhIG5ld2VyIG1pbmltdW0ga2VybmVsIHdoZW4gcmVxdWlyaW5nIDY0
LWJpdCB0aW1lCiAgICBzdXBwb3J0LCB1bnRpbCBhbGwgdGhlIGZhbGxiYWNrIGZvciA2NC1iaXQg
dGltZSBvbiAzMi1iaXQga2VybmVscyB3aXRob3V0CiAgICB0aGUgNjQtYml0LXRpbWUgc3lzY2Fs
bHMgaXMgaW1wbGVtZW50ZWQuCgpJIHJlYWxseSBqdXN0IGNob3NlIHRoZSB2ZXJzaW9uIEkgd2Fz
IHdvcmtpbmcgb24gYXQgdGhlIHRpbWUuICBJIGp1c3QgbG9va2VkCmJhY2sgb24gaXQsIHRoaXMg
dmVyc2lvbiA1LjEwIGlzIGdvb2QgYmVjYXVzZS4gIDEuIGl0IGlzIGEgbG9uZyB0ZXJtIHN1cHBv
cnQKdmVyc2lvbi4gIDIuIGluIDUuOCBJIGZpeGVkIGEga2VybmVsIGJ1ZyB3aGljaCBjYXVzZWQg
Y2xvbmUvZm9yayB0byBub3Qgd29yawp3aXRoIFRMUy4KCkkgd2lsbCB1cGF0ZSB0aGUgY29tbWl0
L25ld3MuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
