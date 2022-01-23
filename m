Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 20611497652
	for <lists+openrisc@lfdr.de>; Mon, 24 Jan 2022 00:28:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A4873242D7;
	Mon, 24 Jan 2022 00:28:01 +0100 (CET)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id 224BB200E4
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 00:27:59 +0100 (CET)
Received: by mail-pj1-f50.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so8317888pjl.0
 for <openrisc@lists.librecores.org>; Sun, 23 Jan 2022 15:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OambT2HyQ0ksSzQY2cfN3PNR9KawIgMxaXdmBqJBPWc=;
 b=qkWfcwPbVcAL2gusNIG93Pe3gzsxsAsSDLsDWZDwS27VyzCiJ6ZuA07PvDLA5/yuLo
 /9Vo2aH3hq5KFcBD4e/p3oTOf0yZwqTZEOcB8xdJvdH/CuyhUAtfmv1OZ+qCV3HhVEfA
 HcOQQaouMeMnF57jlYCgYXcbNSNp6jt3rnsgKJRiHOW2LJ2qvDnK1o56zvlUGC6pgEtq
 jwbxA2SMjUan9XkYGSMnRyotYWM01eQfvFusrHRYwj939UE5awT1X4RZt7szZzDu7AHj
 mlGYo6T4Ml+ho2thupsxCow5t348d7rbsp3QvBshtpLhcHqkSuRG/V0yhxuyFz/IXIvL
 G6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OambT2HyQ0ksSzQY2cfN3PNR9KawIgMxaXdmBqJBPWc=;
 b=0oNSYzVKWdGq+BUN/b586rsfQtFe+Ya8h5lU51Gk0tLKPU1dSK/nKSLqPOVrz37rSP
 dL/EcVeD4jDDHTt/Ac1Xw3fKtShtjBOyKW/3w8wY1pBNnyCCDp38TSahwAgWdMoXSud+
 LTEJqZWmt50cqtxieYg6GJQm64/7Cry8sgGHxlIMO1DmZMaOqkhLsQ29k7qYFAQun0Uu
 FdcmZiemPKVOX0ttmxlZHAsJAGLIIlgyLkbGkELAvyge7w9d9LG2RFIo+xz+yasirBzD
 hXU8aWia8Z3Rkt4N/Qb+ZTefd4ywBv0ZLmdSBGhhoq7bP51JF4L2X+2Zo9KJmssL7QDq
 /PoA==
X-Gm-Message-State: AOAM532Naj3ylD8l+FAhGD1QxaJdFcju4IPFU+3LFa2ht56W8B4BVuck
 PlFsvu6ufosYFyf0QqAZyFY=
X-Google-Smtp-Source: ABdhPJwMNr3PXEokzxhNGsB/n1J+QIvtY/aK1oMnp6CJiL9L5RuUDLE/v7vUAq49vgOfREouA9rU+Q==
X-Received: by 2002:a17:902:da8e:b0:14b:370b:241e with SMTP id
 j14-20020a170902da8e00b0014b370b241emr6268252plx.121.1642980477444; 
 Sun, 23 Jan 2022 15:27:57 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id b12sm14032944pfv.148.2022.01.23.15.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 15:27:56 -0800 (PST)
Date: Mon, 24 Jan 2022 08:27:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
Message-ID: <Ye3keps4aHhkbYzr@antec>
References: <20220123020100.45201-1-kuniyu@amazon.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123020100.45201-1-kuniyu@amazon.co.jp>
Subject: Re: [OpenRISC] [PATCH] openrisc/boot: Remove unnecessary
 initialisation in memcpy().
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
Cc: Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@amazon.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Kuniyuki Iwashima <kuni1840@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBKYW4gMjMsIDIwMjIgYXQgMTE6MDE6MDBBTSArMDkwMCwgS3VuaXl1a2kgSXdhc2hp
bWEgd3JvdGU6Cj4gJ2QnIGFuZCAncycgYXJlIGluaXRpYWxpc2VkIGxhdGVyIHdpdGggJ2Rlc3Rf
dycgYW5kICdzcmNfdycsIHNvIHdlIG5lZWQgbm90Cj4gaW5pdGlhbGlzZSB0aGVtIGJlZm9yZSB0
aGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEt1bml5dWtpIEl3YXNoaW1hIDxrdW5peXVAYW1hem9u
LmNvLmpwPgoKVGhpcyBsb29rcyBmaW5lIHRvIG1lLiAgSSB3aWxsIHF1ZXVlIHRoaXMgZm9yIHRo
ZSBuZXh0IHJlbGVhc2UuCgpKdXN0IGN1cmlvdXMgd2h5IGFyZSB5b3Ugd29ya2luZyBvbiBPcGVu
UklTQz8KCi1TdGFmZm9yZAoKPiAtLS0KPiAgYXJjaC9vcGVucmlzYy9saWIvbWVtY3B5LmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2xpYi9tZW1jcHkuYyBiL2FyY2gvb3BlbnJpc2Mv
bGliL21lbWNweS5jCj4gaW5kZXggZmUyMTc3NjI4Li5lMmFmOWI1MTAgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9vcGVucmlzYy9saWIvbWVtY3B5LmMKPiArKysgYi9hcmNoL29wZW5yaXNjL2xpYi9tZW1j
cHkuYwo+IEBAIC0xMDEsNyArMTAxLDcgQEAgdm9pZCAqbWVtY3B5KHZvaWQgKmRlc3QsIF9fY29u
c3Qgdm9pZCAqc3JjLCBfX2tlcm5lbF9zaXplX3QgbikKPiAgICovCj4gIHZvaWQgKm1lbWNweSh2
b2lkICpkZXN0LCBfX2NvbnN0IHZvaWQgKnNyYywgX19rZXJuZWxfc2l6ZV90IG4pCj4gIHsKPiAt
CXVuc2lnbmVkIGNoYXIgKmQgPSAodW5zaWduZWQgY2hhciAqKWRlc3QsICpzID0gKHVuc2lnbmVk
IGNoYXIgKilzcmM7Cj4gKwl1bnNpZ25lZCBjaGFyICpkLCAqczsKPiAgCXVpbnQzMl90ICpkZXN0
X3cgPSAodWludDMyX3QgKilkZXN0LCAqc3JjX3cgPSAodWludDMyX3QgKilzcmM7Cj4gIAo+ICAJ
LyogSWYgYm90aCBzb3VyY2UgYW5kIGRlc3QgYXJlIHdvcmQgYWxpZ25lZCBjb3B5IHdvcmRzICov
Cj4gLS0gCj4gMi4zMC4yCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
