Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7913A478EDB
	for <lists+openrisc@lfdr.de>; Fri, 17 Dec 2021 16:02:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4E414242AC;
	Fri, 17 Dec 2021 16:02:35 +0100 (CET)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mail.librecores.org (Postfix) with ESMTPS id 80BE1213CC
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 16:02:33 +0100 (CET)
Received: by mail-pl1-f180.google.com with SMTP id m24so2077264pls.10
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bwyf47l1/MyuI3Ywkk/+dCUo7N2J7fUIj/yqB/XBgH0=;
 b=i5sh2OM7D77BEnHXTrBIQ292ViV4mFsyc0FiUmsku5bn+sxaG/o2F9vIRE4mnHIWxH
 41h+z2bm/++jFdJlYZAEpHkYsTJcJNXDb1i4hwAw060UOVCD1WZfbMoSRsDcqwJYz/wo
 1YoRD8wItG2LPTRWYCZDIm4/4JkI8wc0wgz27IiDvbE4Qy998OGPGKm3kq6MGfNepqLY
 TM0Jqner80kwW7bqRlbQAWO+yt/X6PP50D/qHCpf7suycwwMDcs5zgs2a9tSsYj+cmA1
 LHt+yEX4ENSEVbeoKAAq0aj8Ruu8tkQPeI5aaYFiSaJssEeMx7TgUe784tf6rmnRWiiH
 kAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bwyf47l1/MyuI3Ywkk/+dCUo7N2J7fUIj/yqB/XBgH0=;
 b=cqSlyq14x9gDo9hpog8pX0xY4lQQmfhMVTRIsWpaD7+iOWcYkWJxCuUnwjOt9Qct2P
 l/naebTaqv/XOECd8+1r2bt6ffMQUcq9LVFq6hFf0SodDaDL/1dn6sQSu0yPz8xfsCpo
 vZ4ZegWY/kl/E1uuJ57KkmPA1m0aWgcgF6dhXmbfXOFyCGe3P6NZxn80PAesqBak1wlZ
 r/0s1NuKqVQ38sWY35+I83aTgOU67sncTL/B2RhKkOSN0hwwv/2RB3p2kwpL36A6c454
 CB4cLWVhiaXmtXgH/8VcU2eCBVG1psuKTCBkabrkXynMxZspSb5tur4Gk/1PMizNJAbc
 Nd6g==
X-Gm-Message-State: AOAM530Y2xkcCTtMwuQn932XmxWY6p6UMVo/ITge9ThbPYOv2HA51lym
 qEfsDaUF8oaPfgegzp/ls5kRxvxAgSA=
X-Google-Smtp-Source: ABdhPJyGUbQFEBh0rB7eAuuJRRW9aw8Arl8h0jSCUB7j2XXQuIBU1L5YfHbodC9fZcgl3MI8Q3QQTA==
X-Received: by 2002:a17:90a:7c0d:: with SMTP id
 v13mr1940496pjf.193.1639753351910; 
 Fri, 17 Dec 2021 07:02:31 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id f185sm9839454pfg.39.2021.12.17.07.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:02:31 -0800 (PST)
Date: Sat, 18 Dec 2021 00:02:29 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YbymhURyZCZKOU3Z@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-8-shorne@gmail.com>
 <0ec2704d-e916-63cf-f338-a9c70ec4b66f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ec2704d-e916-63cf-f338-a9c70ec4b66f@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 07/13] or1k: math soft float support
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

T24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgMDQ6NDg6MDZQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDEwLzEyLzIwMjEgMjA6MzQsIFN0YWZmb3JkIEhvcm5lIHZp
YSBMaWJjLWFscGhhIHdyb3RlOgo+ID4gT3BlblJJU0Mgc3VwcG9ydCBoYXJkIGZsb2F0IGJ1dCBJ
IHdpbGwgbGlrZSB0byBzdWJtaXQgdGhhdCBhZnRlciBnbGliYwo+ID4gc29mdCBmbG9hdCBnb2Vz
IHVwc3RyZWFtLiAgVGhlIGhhcmQgZmxvYXQgc3VwcG9ydCBkZXBlbmRzIG9uIGFkZGluZyB1c2Vy
Cj4gPiBhY2Nlc3MgdG8gdGhlIEZQQ1NSLCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBr
ZXJuZWwgeWV0Lgo+IAo+IFRoZSBwYXRjaCBsb29rcyBvayBpbiBnZW5lcmFsLCB0aGUgZmVudiBi
aXRzIG1hdGNoZXMgdGhlIGRvY3VtZW50YXRpb24uIAoKVGhhbmsgeW91LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
