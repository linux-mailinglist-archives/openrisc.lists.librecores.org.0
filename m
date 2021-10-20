Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83EBF4354AE
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 22:38:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3097324216;
	Wed, 20 Oct 2021 22:38:59 +0200 (CEST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mail.librecores.org (Postfix) with ESMTPS id 5C74D240F4
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 22:38:57 +0200 (CEST)
Received: by mail-pf1-f171.google.com with SMTP id 187so3950504pfc.10
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 13:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wnUfSvZ3oVkpbHK1Ie9Q/sSpEARC30mLV/QYy9Pp/jU=;
 b=VxYzTFw8jex52ZrlGrv0fmtzvKOm/iCOpozf9Y3HmmT4n9/iTRauv74pF5sJaW18dI
 usIERuOeUheey0z6RTmbf1M9jGBKmgvPzZ4FF0pcfiV0uymW4WRA1N8UDLsaHb6IMS36
 FFCIMAMjRS4J8qrzC9bgjnSMEQds8mv3HPbS/LamgLkDQKUPYx8vPkyMEBSgvgiXgGBU
 4RaoE0WZpk9ooOpaqICZZ7MN5e7rthTJ8rcGLJXNVu1IGZJ3Qx5RgH4eRQLUTcAGr8zA
 jZZEnuvAj8B1LgQZT7Af0aow5Gcbma2heV4Z9XyG/P4tFBr+dnGdXB29Sz464DwS0bcB
 eKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wnUfSvZ3oVkpbHK1Ie9Q/sSpEARC30mLV/QYy9Pp/jU=;
 b=idfrX8IGvGyPZnRF1Hp0dvzgaK3+5naw8W7PGOmnW0XrygMOhy22bIkuocDjKH63UY
 y4Cf4fbqmSBBFEN3dSwhWKrEnsDXZVVVVnlbkNgadrZY281XrPBOun+FnJ3TKPVO92wo
 qFseq3JkD8KH0JVleL6+iv3npVlxfUcYjSilw8xhwOr5Qc7Re1ji9NuI3nSrFTfXuT0p
 oCZmQyPMffU6Ueupxc3urdstdCGsZkssYa1t79VwNhH1EgQWqkMo4Gnozo4dw4VrkRAU
 3YIHyiHamwW3P1h+MMJVnPJrqvIe4Da/Qho6liE1NASTTgBsObz/ZAQUwZ7jt1aG5cR/
 D52Q==
X-Gm-Message-State: AOAM5305Y3WhrDods7CferV9F+NTsDZ0osmMENqYHHme+hXPZkEbaKwb
 GY01ORrbtOXXrmC6sZDP+1M=
X-Google-Smtp-Source: ABdhPJz8ss6lO9pzgQt3LxTQdWMJmqlSObYy8m9SuTjcu3PXj4f2IeMokF5haekxFyXr5CGRUaMB8A==
X-Received: by 2002:a63:cd09:: with SMTP id i9mr1148777pgg.129.1634762335746; 
 Wed, 20 Oct 2021 13:38:55 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id t2sm6762003pjf.1.2021.10.20.13.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 13:38:54 -0700 (PDT)
Date: Thu, 21 Oct 2021 05:38:53 +0900
From: Stafford Horne <shorne@gmail.com>
To: Denis Kirjanov <kda@linux-powerpc.org>
Message-ID: <YXB+XVb/mBlI5fWo@antec>
References: <20211020121637.6629-1-kda@linux-powerpc.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020121637.6629-1-kda@linux-powerpc.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: signal: remove unused DEBUG_SIG
 macro
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMDM6MTY6MzdQTSArMDMwMCwgRGVuaXMgS2lyamFub3Yg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogRGVuaXMgS2lyamFub3YgPGtkYUBsaW51eC1wb3dlcnBj
Lm9yZz4KPiAtLS0KPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2lnbmFsLmMgfCAyIC0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2tlcm5lbC9zaWduYWwuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCj4gaW5k
ZXggMWViY2ZmMjcxMDk2Li45OTUxNmM5MTkxYzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc2lnbmFsLmMKPiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYwo+
IEBAIC0yOCw4ICsyOCw2IEBACj4gICNpbmNsdWRlIDxhc20vdWNvbnRleHQuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiAgCj4gLSNkZWZpbmUgREVCVUdfU0lHIDAKPiAtCj4gIHN0
cnVjdCBydF9zaWdmcmFtZSB7Cj4gIAlzdHJ1Y3Qgc2lnaW5mbyBpbmZvOwo+ICAJc3RydWN0IHVj
b250ZXh0IHVjOwoKVGhpcyBsb29rcyBvayB0byBtZS4gIEkgd2lsbCBxdWV1ZSBpdC4KClRoYW5r
cy4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
