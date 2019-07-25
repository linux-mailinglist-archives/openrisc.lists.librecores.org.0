Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9A75875952
	for <lists+openrisc@lfdr.de>; Thu, 25 Jul 2019 23:08:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2DAD2203D2;
	Thu, 25 Jul 2019 23:08:18 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 3F23B200E4
 for <openrisc@lists.librecores.org>; Thu, 25 Jul 2019 23:08:16 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id b13so23357941pfo.1
 for <openrisc@lists.librecores.org>; Thu, 25 Jul 2019 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WmalSjXU2+UMwu+n7/bMrWZ2JD8OB4RgtPxtzWVAFZw=;
 b=gS69xQ3HQ5DwlpT+3eioEhs0xyKtJ2ftCd5+xt6tcAl1xnay9n7aU43th1Gy2HJULU
 f/leuafud7FhKVA9BmjBKS+AJIK6uCU7J/mHFf2cTNtr2W9sgLMkZ4aMaSqbv5Vtp258
 mnmNK8JOs7s2Fh9AEENDwa7DFQPe9BzsG7I1cEpTvWzvO8Bzesuqw+lk3HWZUn40tkr8
 Y7fb3OO6M3rRXenduMfEXUfb+i+ew207LvkpMKl/axJgJRoYHzMhTL8sNqZijbzqtdxl
 XaPmp+c4EYVYnS7H1Ja4X7B22jufadB6/aZVPfPErjrP3lNU8ctbh9Pms0LBSZ+W7+IG
 nEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WmalSjXU2+UMwu+n7/bMrWZ2JD8OB4RgtPxtzWVAFZw=;
 b=mdbpl0TovG6AY0lvVYvPxVMnl5O2UBTEr/9CamXzPXJR4z4Iz+v1h541MTj2EOG9DJ
 pBcOE72JTahBCabS1IRbtc7+OsBTSnwJgobngxgep6qtahlr0UVGZCzUBJcawkhISIK6
 m5LpXuPXjsvd17P0Q1oRYlu2UgMQG1Hi4GPcj5Yhu4R1xn1YgIQcmQVT1Dm0blPQwUVv
 vnSgaSXcOVNN+JIo3e7SHbVc7TC1aAtF2gcD/wowvadi5AKJT09p/CZ5rh5NFKvxaGIg
 aoGGDNkcChiIZ3YYut93MySfbGwSPvPilQbYMxt8GGc4WwpI6UqxPK32+2dc73nfo1Ir
 8qqA==
X-Gm-Message-State: APjAAAVLAw6cVJTUtl/Brm7MGmPYHINJY8zozmnbfBXsc2KAfeB3Rinu
 QNdKMmG5xR9CKTLbUxi/t4M=
X-Google-Smtp-Source: APXvYqxM/tM/2Sgv48KwjKyC8B0/gF82bwJ6+zC8FAm+hcGqS+5kly5YFikhaL+7TXE39YVMNoMsBQ==
X-Received: by 2002:a17:90a:9b08:: with SMTP id
 f8mr95274395pjp.103.1564088894360; 
 Thu, 25 Jul 2019 14:08:14 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 o14sm41657079pjp.19.2019.07.25.14.08.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 14:08:13 -0700 (PDT)
Date: Fri, 26 Jul 2019 06:08:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190725210811.GK2601@lianli.shorne-pla.net>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
 <353497a08f6c01f2433174acbe35dc5991a51697.1563792334.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <353497a08f6c01f2433174acbe35dc5991a51697.1563792334.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 10/22] docs: openrisc: convert to ReST and
 add to documentation body
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-doc@vger.kernel.org,
 openrisc@lists.librecores.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDg6MDc6MzdBTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IE1hbnVhbGx5IGNvbnZlcnQgdGhlIHR3byBvcGVuUmlzYyBkb2N1bWVu
dHMgdG8gUmVTVCwgYWRkaW5nIHRoZW0KPiB0byB0aGUgTGludXggZG9jdW1lbnRhdGlvbiBib2R5
LgoKVGhhbmtzIGZvciBkb2luZyB0aGlzLCB0aGUgYmVsb3cgbG9va3MgZmluZS4KCkFja2VkLWJ5
OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KIAo+IFNpZ25lZC1vZmYtYnk6IE1h
dXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IERvY3VtZW50YXRpb24vaW5kZXgucnN0ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAg
RG9jdW1lbnRhdGlvbi9vcGVucmlzYy9pbmRleC5yc3QgICAgICAgICAgICAgIHwgMTggKysrKysr
KysrKysrKwo+ICAuLi4vb3BlbnJpc2Mve1JFQURNRSA9PiBvcGVucmlzY19wb3J0LnJzdH0gICAg
fCAyNSArKysrKysrKysrKysrLS0tLS0tCj4gIERvY3VtZW50YXRpb24vb3BlbnJpc2Mve1RPRE8g
PT4gdG9kby5yc3R9ICAgICB8ICA5ICsrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vb3BlbnJpc2MvaW5kZXgucnN0Cj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL29wZW5yaXNj
L3tSRUFETUUgPT4gb3BlbnJpc2NfcG9ydC5yc3R9ICg4MCUpCj4gIHJlbmFtZSBEb2N1bWVudGF0
aW9uL29wZW5yaXNjL3tUT0RPID0+IHRvZG8ucnN0fSAoNzglKQo+IAogCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
