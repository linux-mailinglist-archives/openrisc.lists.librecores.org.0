Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 94F973F90FE
	for <lists+openrisc@lfdr.de>; Fri, 27 Aug 2021 01:41:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2D568240F5;
	Fri, 27 Aug 2021 01:41:53 +0200 (CEST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mail.librecores.org (Postfix) with ESMTPS id D0675240F5
 for <openrisc@lists.librecores.org>; Fri, 27 Aug 2021 01:41:51 +0200 (CEST)
Received: by mail-pl1-f176.google.com with SMTP id e15so2768884plh.8
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0RhLyMr5ZF44wpuTsEcSZMjcWc/D0NHGSwNnHSx64DM=;
 b=gy73M1CcYBqhH2OC5JJ52ZaoxHjnRZF9D8A7dRwF4caXoA9Ek4trRBeEYUuhqybAxs
 3Yz+Ed1OQzOjiBYq2sf4lnXOw6QnAShyXe0O7Ivqq6475RUI2b/dQxmlJJFNgZq8bYnP
 fAZVYO5Q/RcrwGnA2867Ii02GAwRLJjjgQTTIhbCdfttUoIMcfLO9/pKlUKDyxM9r0Z6
 tq1v96eQ+jiWtRl4WLoM5fvd9g2whWiafFvaayxtLkNB4ny+CaxCnZk1xbmYzd4Q8HQ7
 N798PivbVIde4fIjWjoHDyDW1Wj+ubtWaqBy/5fEL+JpB0q2YQXp6tjRp8kUXAnTKl3K
 CGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0RhLyMr5ZF44wpuTsEcSZMjcWc/D0NHGSwNnHSx64DM=;
 b=tYEjvZLawavva3wcXzP1kX5AsWklksRxfyxVlwtYkoAYxmJUezFGUb+dfDLGFZNokS
 Ezb4ngZdwnOHie3bhvPR4uP+ocSH45mnbsRPQHnmZLyy+p2BNwG8HjlWKPkPyX971HMN
 OuOWLrPZWFSgMmk96w+j8H28IMUNXO3CIejw2m/5Erl5b9u5MK6p0iluiPlaT1hz+SWN
 DGZDByTtgxwGDhwLmmDdnEC9dWZcb9fv2W/QdPz6Xm0fZdk7WX2rLECm+kX5yfrvAY5S
 s12PzACV7UGbQ71maL80DInGlfblBUjTIWvQz7UE0DjfUh3kldElNsVUa4D6cKxapVtU
 zP/g==
X-Gm-Message-State: AOAM531zCaPcSGOAtCxUbKbuhJE5Ay7nn/XQEBynkeuEJwjmsMD7X/x5
 VmQ35HEetIwRch/x6QbBja8=
X-Google-Smtp-Source: ABdhPJxiWsjlT9eqbyOKw0fLAbu7zXTDeee/cOAQcNPUfaP0TtOrkIQuh6msywaPFh2bga6scUUZww==
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr7101119pjl.150.1630021310316; 
 Thu, 26 Aug 2021 16:41:50 -0700 (PDT)
Received: from localhost (g163.222-224-165.ppp.wakwak.ne.jp. [222.224.165.163])
 by smtp.gmail.com with ESMTPSA id l12sm4589598pgc.41.2021.08.26.16.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 16:41:49 -0700 (PDT)
Date: Fri, 27 Aug 2021 08:41:47 +0900
From: Stafford Horne <shorne@gmail.com>
To: Harshitha S <harshithasridhar172000@gmail.com>
Message-ID: <YSgmu/bnzRnI7AGI@antec>
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
Subject: Re: [OpenRISC] Continue OpenRISC contibution
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMjYsIDIwMjEgYXQgMTA6MTc6MTdQTSArMDUzMCwgSGFyc2hpdGhhIFMgd3Jv
dGU6Cj4gSGVsbG8sCj4gCj4gSSdtIHRoaW5raW5nIG9mIGNvbnRpbnVpbmcgbXkgY29udHJpYnV0
aW9uIHRvIHRoZSBPcGVuUklTQyBwcm9qZWN0LiBXaXRoIG15Cj4gR1NvQyBwcm9qZWN0LCBJIGhh
dmUgbGVhcm5lZCB0b28gbWFueSBuZXcgc2tpbGxzIGFuZCB3aXNoIHRvIGtlZXAgdGhpcwo+IGxl
YXJuaW5nIHBhY2UuIEkgd291bGQgYmUgaGFwcHkgdG8gbGVhcm4gYW5kIGV4cGxvcmUgbmV3IHNr
aWxscy4gUGxlYXNlIGxldAo+IG1lIGtub3cgd2hhdCBJIGNhbiB3b3JrIHVwb24uCgpIaSBIYXJz
aGl0YSwKCihDQ2luZyBsaXN0KQoKR2xhZCB0byBoZWFyIHlvdSBhcmUgc3RpbGwgaW50ZXJlc3Rl
ZC4gIEkgdGhpbmsgdGhlcmUgYXJlIGFsd2F5cyBwbGVudHkgb2YKdGhpbmdzLCBzb21lIHRoaW5n
cyBvbiB0aGUgdG9wIG9mIG15IGhlYWQ6CiAgLSBTaW1wbGUgLSB1cGRhdGUgdGhlIG1vcjFreC9y
ZWFkbWUubWQgdG8gZXhwbGFpbiB3ZSBzdXBwb3J0IGZvcm1hbAogIC0gTWVkaXVtIC0gZml4IHRo
ZSBidWdzIHRoYXQgeW91IHJhaXNlZAogIC0gQmlnZ2VyIC0gb3Ixay1mb3JtYWwgKGxpa2Ugcmlz
Y3YtZm9ybWFsLCBmb3JtYWxseSB2ZXJpZnkgZWFjaCBpbnN0cnVjdGlvbikKCi1TdGFmZm9yZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
