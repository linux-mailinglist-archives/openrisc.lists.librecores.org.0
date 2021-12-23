Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 55CC447DF67
	for <lists+openrisc@lfdr.de>; Thu, 23 Dec 2021 08:15:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EFA0023F03;
	Thu, 23 Dec 2021 08:15:48 +0100 (CET)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mail.librecores.org (Postfix) with ESMTPS id C6FFE20F26
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 08:15:46 +0100 (CET)
Received: by mail-pf1-f171.google.com with SMTP id v13so4500542pfi.3
 for <openrisc@lists.librecores.org>; Wed, 22 Dec 2021 23:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yRTXBcTa9jnWvzDAKvD1IauCiWuwkwBvu02lZo/qEcQ=;
 b=lwg1bkJuq0Q13L9fkzJvNGiDxtfgA0CmjZkJAcI6wUBKOkz9MtdcKYwxOKCTZCkNn8
 vsbnyVmUFDdX9+BjOkHV7B0m95rfeBu6hmqduQ+MxasC9VrXTU5UtykDfJ4kbNkm8HwP
 4tnEmnea8LPlkF/edAFIUYRs6JAikKyDCBXK1vemftHguzXRIWc2aTCRdZ3h7gYANttf
 5XwZNYr2SeAoh+bwgMoZuksZlDWw46GOdL9y3pwCscxicoeZVK6ma4kPJUepUPSjgZbh
 kMZ7FpfATz83f2ttb5WRewtI+rPfs2LPW2W/VrhHVrmfslBr8O44SfVuNBPT2sLvMwin
 fyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yRTXBcTa9jnWvzDAKvD1IauCiWuwkwBvu02lZo/qEcQ=;
 b=fFixnAis04s2L0hAYntLeFs2ImNfXKJHmOtqI8ksZ6qt4nODa/YBzYpwKw1ImJeXzG
 bZXV6wrhhu0bhBT//R8kv1a+S6T3ds3HeBJ23I/TLHp1f78aJGdpw7jb2KYymBJVzdi7
 nVXApL9VITYSDhPwcAxBDnoDQH2PkL6gbrij+0yP3+RltqOuLVWscIM6pUNxhOE5P3D0
 y+iHwi9OANSx8qoyTIaWwUnxAnd3plYcH/CVsaszG7Jsngzvrh4azs2AXJ+cf139e2PP
 x+hJg3DmusdsynI+F7NCEiLB1CCBZPG/1ZIAWc0Su4ibKf2mGlBDxtoD96njDvXJ9K8O
 RDow==
X-Gm-Message-State: AOAM531fkYJ/pFse3Pvx3Wp4FlRd+c8IVtPDhv3W0/BurvfoyA72eIho
 rZ+z1nv8ZIWybV08dpPjeX4=
X-Google-Smtp-Source: ABdhPJya4gqr0yc5K3k+J23a980DYjOMXgz68VWc/5eyqrK90/Ynazwt5Y/CM3AY01tfGOnBxDe51g==
X-Received: by 2002:a63:102:: with SMTP id 2mr1107472pgb.311.1640243745278;
 Wed, 22 Dec 2021 23:15:45 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id k8sm5396695pfu.72.2021.12.22.23.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 23:15:44 -0800 (PST)
Date: Thu, 23 Dec 2021 16:15:42 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YcQiHuKPNZqgh1Rn@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-13-shorne@gmail.com>
 <8c8ce20c-eea9-10d5-fef6-08543364fb0d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c8ce20c-eea9-10d5-fef6-08543364fb0d@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 12/13] build-many-glibcs.py: add OpenRISC
 support
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

T24gV2VkLCBEZWMgMjIsIDIwMjEgYXQgMDY6MDQ6MDdQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDEwLzEyLzIwMjEgMjA6MzQsIFN0YWZmb3JkIEhvcm5lIHZp
YSBMaWJjLWFscGhhIHdyb3RlOgo+ID4gLS0tCj4gPiAgc2NyaXB0cy9idWlsZC1tYW55LWdsaWJj
cy5weSB8IDUgKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5IGIvc2NyaXB0cy9i
dWlsZC1tYW55LWdsaWJjcy5weQo+ID4gaW5kZXggNmFlMjE3Mjk1Ni4uNDdiMmNhYmM5YyAxMDA3
NTUKPiA+IC0tLSBhL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkKPiA+ICsrKyBiL3Njcmlw
dHMvYnVpbGQtbWFueS1nbGliY3MucHkKPiA+IEBAIC0zMzQsNiArMzM0LDEwIEBAIGNsYXNzIENv
bnRleHQob2JqZWN0KToKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnY2Nv
cHRzJzogJy1tYWJpPTY0J31dKQo+ID4gICAgICAgICAgc2VsZi5hZGRfY29uZmlnKGFyY2g9J25p
b3MyJywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBvc19uYW1lPSdsaW51eC1nbnUnKQo+
ID4gKyAgICAgICAgc2VsZi5hZGRfY29uZmlnKGFyY2g9J29yMWsnLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIG9zX25hbWU9J2xpbnV4LWdudScsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgdmFyaWFudD0nc29mdCcsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgZ2NjX2Nm
Zz1bJy0td2l0aC1tdWx0aWxpYi1saXN0PW1jbW92J10pCj4gCj4gV2h5IGlzIHRoaXMgb3B0aW9u
IHJlcXVpcmVkPwoKVGhlIGRlZmF1bHQgaXMgdG8gYnVpbGQgd2l0aCBtdWx0aWxpYi1saXN0IG1j
bW92LG1zb2Z0LW11bCxtc29mdC1kaXYuICBXaGljaAp3b3VsZCBnZW5lcmF0ZSAzIHRvb2xjaGFp
bnMuClRvIG1ha2UgdGhlIGJ1aWxkIGZhc3RlciBJIHJlZHVjZWQgaXQgdG8gdGhlIG1jbW92IChz
dXBwb3J0IGNvbmRpdGlvbmFsIG1vdmUKaW5zdHJ1Y3Rpb25zKS4KCkkgY291bGQgY2hhbmdlIHRv
IHJ1biB3aXRoIC0tZGlzYWJsZS1tdWx0aWxpYiwgYnV0IGVuYWJsaW5nIGNtb3YgaXMgdXN1YWxs
eQphbHdheXMgd2FudGVkLgoKPiA+ICAgICAgICAgIHNlbGYuYWRkX2NvbmZpZyhhcmNoPSdwb3dl
cnBjJywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBvc19uYW1lPSdsaW51eC1nbnUnLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgIGdjY19jZmc9WyctLWRpc2FibGUtbXVsdGlsaWIn
LCAnLS1lbmFibGUtc2VjdXJlcGx0J10sCj4gPiBAQCAtMTI3MCw2ICsxMjc0LDcgQEAgZGVmIGlu
c3RhbGxfbGludXhfaGVhZGVycyhwb2xpY3ksIGNtZGxpc3QpOgo+ID4gICAgICAgICAgICAgICAg
ICAnbWljcm9ibGF6ZSc6ICdtaWNyb2JsYXplJywKPiA+ICAgICAgICAgICAgICAgICAgJ21pcHMn
OiAnbWlwcycsCj4gPiAgICAgICAgICAgICAgICAgICduaW9zMic6ICduaW9zMicsCj4gPiArICAg
ICAgICAgICAgICAgICdvcjFrJzogJ29wZW5yaXNjJywKPiA+ICAgICAgICAgICAgICAgICAgJ3Bv
d2VycGMnOiAncG93ZXJwYycsCj4gPiAgICAgICAgICAgICAgICAgICdzMzkwJzogJ3MzOTAnLAo+
ID4gICAgICAgICAgICAgICAgICAncmlzY3YzMic6ICdyaXNjdicsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
