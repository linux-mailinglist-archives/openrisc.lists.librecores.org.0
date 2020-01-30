Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6552614E4E8
	for <lists+openrisc@lfdr.de>; Thu, 30 Jan 2020 22:38:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CF17420907;
	Thu, 30 Jan 2020 22:38:46 +0100 (CET)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 3317A20691
 for <openrisc@lists.librecores.org>; Thu, 30 Jan 2020 22:38:44 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id p14so2164295pfn.4
 for <openrisc@lists.librecores.org>; Thu, 30 Jan 2020 13:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6QfJ9HBGO9DTorqtZWTK9u+KK3d3e9wCrmBq521y58Q=;
 b=EPyBUjHO+0MADFf3JZfdbf7bm5oiDhS6YiZE3gQdN4PQF3asAYW3Dx9ybew4QSCZ1+
 iuxrwyTedod0MtpIz+qbSWXUikGrEJEEoUctYtLvEmhjk1DrtTeHlV8m5r1986P1mQU+
 csU1Fj26m26RcbkfIG3DJNk/dKvO+7N++qCTLuNpOwvRRGd69mpREupGxpLzP82IBIsh
 WuIdeMP1ogcKcOB3RfkTACsZuiEkdDQ1QhNYPV9OUzs0I9vI3XnIu4a+lc6PpnuqLpEz
 zMw31VbkA5lD0VXvCy+bMNnm2F1GcBwE21roMKAkS28Jg/h7uDQnOdd/621Q4LOIsVT4
 VHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6QfJ9HBGO9DTorqtZWTK9u+KK3d3e9wCrmBq521y58Q=;
 b=onAzb6MyZOYBxjguXewnz88e5zXUqw+7cpmKL0oC/QqjlI+mkmsbGRdm12fsr3Vy8v
 bEBbOuSwUMwpaGLbyZLRmz5G2Sv2B0lQgegReKA4RSyi9AxjXSI4bXgG/mDvIbKkVCSv
 xX+gUI6/+Qfl8U6kQK9hKmRVNWtE3hPEInU9fSQGDSqgDXonY8F8kiKp1JPAW0zRpS44
 kqLNet8Jrdj/WU2Ph0Yli9TpWELi1EBrBEnxiFr9kU3avs418nWLB84ofOPB3fZ2/21q
 ANGFDv89168nDUfOGQGTXmOE6KYuKtpavsqbv8z4z9IY39KFpGp2w50dxOjZgUr3wJlO
 P63w==
X-Gm-Message-State: APjAAAVCza0kszwm3v2QLAPaj/SF56eRrBMtiIld0jkFe50wdvVjDeHj
 YEsLCnNaKnddqmLnpniBzRE=
X-Google-Smtp-Source: APXvYqyimoegvKT+KGccepH86/EUUGcZ71ZyKb0o/5V1Hw8ZGiezNG8fAAvzCNWZfHS0VOWLg0R65Q==
X-Received: by 2002:a63:f202:: with SMTP id v2mr6668424pgh.420.1580420322684; 
 Thu, 30 Jan 2020 13:38:42 -0800 (PST)
Received: from localhost (g52.222-224-164.ppp.wakwak.ne.jp. [222.224.164.52])
 by smtp.gmail.com with ESMTPSA id
 100sm8067781pjo.17.2020.01.30.13.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 13:38:41 -0800 (PST)
Date: Fri, 31 Jan 2020 06:38:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200130213839.GW24874@lianli.shorne-pla.net>
References: <20200130191938.2444-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130191938.2444-1-krzk@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH] openrisc: configs: Cleanup
 CONFIG_CROSS_COMPILE
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-kernel@vger.kernel.org,
 yamada.masahiro@socionext.com, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

K2NjOiBNYXNhaGlybywKCk9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDA4OjE5OjM4UE0gKzAxMDAs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gQ09ORklHX0NST1NTX0NPTVBJTEUgaXMgZ29u
ZSBzaW5jZSBjb21taXQgZjEwODljOTJkYTc5ICgia2J1aWxkOiByZW1vdmUKPiBDT05GSUdfQ1JP
U1NfQ09NUElMRSBzdXBwb3J0IikuCgpJIHNlZSB0aGlzIHBhdGNoIGlzIGFscmVhZHkgaW4sIGJ1
dCBkb2VzIGl0IGJyZWFrIDAtZGF5IHRlc3QgdG9vbHMgdGhhdCBkZXBlbmQKb24gdGhpcyBDT05G
SUdfQ1JPU1NfQ09NUElMRSBzZXR1cD8gIEkgZ3Vlc3MgaXRzIGJlZW4gaW4gc2luY2UgMjAxOCwg
c28gdGhlcmUKc2hvdWxkIGJlIG5vIHByb2JsZW0uCgpDYW4geW91IGFsc28gaGVscCB0byB1cGRh
dGUgIkRvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2NfcG9ydC5yc3QiPyAgSXQKbWVudGlv
bnMgdGhlIGJ1aWxkIHN0ZXBzIGFyZToKCiAgICBCdWlsZCB0aGUgTGludXgga2VybmVsIGFzIHVz
dWFsOjogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogICAgICAgIG1ha2UgQVJDSD1vcGVucmlzYyBkZWZjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgIG1ha2Ug
QVJDSD1vcGVucmlzYwoKVGhpcyBub3cgY2hhbmdlcywgSSB1c2VkIHRvIHVzZSBgbWFrZSBBUkNI
PW9wZW5yaXNjIENST1NTX0NPTVBJTEU9b3Ixay1saW51eC1gCmlzIHRoaXMgc3RpbGwgZ29pbmcg
dG8gd29yaz8KCi1TdGFmZm9yZAoKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFrc2lt
X2RlZmNvbmZpZyAgICB8IDEgLQo+ICBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9k
ZWZjb25maWcgfCAxIC0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa3NpbV9kZWZjb25maWcgYi9hcmNo
L29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa3NpbV9kZWZjb25maWcKPiBpbmRleCBkOGZmNGY4ZmZiODgu
Ljc1ZjJkYTMyNGQwZSAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa3Np
bV9kZWZjb25maWcKPiArKysgYi9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa3NpbV9kZWZjb25m
aWcKPiBAQCAtMSw0ICsxLDMgQEAKPiAtQ09ORklHX0NST1NTX0NPTVBJTEU9Im9yMWstbGludXgt
Igo+ICBDT05GSUdfTk9fSFo9eQo+ICBDT05GSUdfTE9HX0JVRl9TSElGVD0xNAo+ICBDT05GSUdf
QkxLX0RFVl9JTklUUkQ9eQo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2lt
cGxlX3NtcF9kZWZjb25maWcgYi9hcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZj
b25maWcKPiBpbmRleCA2NDI3ODk5MmRmOWMuLmZmNDlkODY4ZTA0MCAxMDA2NDQKPiAtLS0gYS9h
cmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZjb25maWcKPiArKysgYi9hcmNoL29w
ZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZjb25maWcKPiBAQCAtMSw0ICsxLDMgQEAKPiAt
Q09ORklHX0NST1NTX0NPTVBJTEU9Im9yMWstbGludXgtIgo+ICBDT05GSUdfTE9DQUxWRVJTSU9O
PSItc2ltcGxlLXNtcCIKPiAgQ09ORklHX05PX0haPXkKPiAgQ09ORklHX0xPR19CVUZfU0hJRlQ9
MTQKPiAtLSAKPiAyLjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
