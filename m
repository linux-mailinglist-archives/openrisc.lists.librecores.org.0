Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C9F033A33BB
	for <lists+openrisc@lfdr.de>; Thu, 10 Jun 2021 21:11:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4000C20D64;
	Thu, 10 Jun 2021 21:11:37 +0200 (CEST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mail.librecores.org (Postfix) with ESMTPS id 4186820D40
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 03:19:53 +0200 (CEST)
Received: by mail-pj1-f42.google.com with SMTP id k7so2648946pjf.5
 for <openrisc@lists.librecores.org>; Wed, 09 Jun 2021 18:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PfqL7eKPUKJcQfdVwkjRM9kFnL+ldZDoH7Mr6UC/1Uc=;
 b=YRdliT5T1cqm+VyVqf41Y2XoidT89AVLmoyegoxbpNkbfBjzP3QGKNU3B3Sat7KMKX
 tNkpCDsqYebRnj1u2ZNWkxHSBa7VsPXHMTYrkZsm+3xqeerIc1wnGltpDwzj/X0SU2bQ
 cOGfKYLJmvqcZaKgmCjSz1A3Qpr/dWEItKEXPkRvJCOIzC9mJUpA//rW/NBTZ2FqysSP
 aihaZwPvduBfvLm5g0zmntwec1So2O/Jr88lS61GrTSvMo4upHrla5abFc4WgNpVtEtF
 Uh58VgpvugnnqS5wFELleqAo1BETcdpIzyqh0NENt2UdmjVlnS+zrcI1nTnG9Xm1YeV9
 INUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PfqL7eKPUKJcQfdVwkjRM9kFnL+ldZDoH7Mr6UC/1Uc=;
 b=JryLnpZTKH/Oke0D89OT0z6v5XTHLQxKWOipUPh4HJAph92wLc1Lha8/JGHcnai7YD
 xutTdD3f89foA5dlVMry808/FGEJWjXR0iGm6sqSvMK3sslEZAd5XvN+1HvxlT1aR3d+
 JpCe820ZZyGJ/HL6t9iK/DS5/ZjhH3Z09shZ0+jvNzkDFIIBk6+7kuo6jRlplDS/4MWm
 v6iV5Dz/wLDG+hLPnSTwqiqIqdbZw3+WjTUONycRxvT2pbpNJ6gwrKSS4Ne6O0q4Jahx
 iUJwEIwToUcLzcvzrEVknGukY2z1bv/F2I3oYIPmT7rVP7ZemY1gi21x2bKWbhMzHUef
 /JDw==
X-Gm-Message-State: AOAM533uYb1DDMy2Sp+Rk3SGJwMObFyLk7psZW2eN7knVbDdC4+NNEXA
 3zAWJnKXXxCz6tsGBNGqOt8=
X-Google-Smtp-Source: ABdhPJwPzc3UUqu0MdlSHQQ3BeGOuupNYMHCRiTVJP7FPmQjvwGUJpLtUFzv2YlhWGMHvQNcRC2npw==
X-Received: by 2002:a17:90a:6404:: with SMTP id
 g4mr557627pjj.155.1623287991730; 
 Wed, 09 Jun 2021 18:19:51 -0700 (PDT)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:93be:acfa:5f01:e171])
 by smtp.gmail.com with ESMTPSA id i8sm832009pgt.58.2021.06.09.18.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 18:19:50 -0700 (PDT)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id CDD64BB0007B; Thu, 10 Jun 2021 10:49:46 +0930 (ACST)
Date: Thu, 10 Jun 2021 10:49:46 +0930
From: Alan Modra <amodra@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YMFosi4vsWnxf9Sj@bubble.grove.modra.org>
References: <YME2SzQdpj/AVz/2@antec>
 <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
X-Mailman-Approved-At: Thu, 10 Jun 2021 21:11:34 +0200
Subject: Re: [OpenRISC] [PATCH v2] bfd/elf32-or1k: fix building with gcc
 version < 5
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
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMDksIDIwMjEgYXQgMTE6NTI6MzNQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gR2NjIHZlcnNpb24gPj0gNSBoYXMgc3RhbmRhcmQgQyBtb2RlIG5vdCBzZXQgdG8g
LXN0ZD1nbnUxMSwgc28gaWYgd2UgdXNlCj4gYW4gb2xkIGNvbXBpbGVyKGkuZS4gZ2NjIDQuOSkg
YnVpbGQgZmFpbHMgb246Cj4gYGBgCj4gZWxmMzItb3Ixay5jOjIyNTE6MzogZXJyb3I6ICdmb3In
IGxvb3AgaW5pdGlhbCBkZWNsYXJhdGlvbnMgYXJlIG9ubHkgYWxsb3dlZCBpbgo+IEM5OSBvciBD
MTEgbW9kZQo+ICAgICBmb3IgKHNpemVfdCBpID0gMDsgaSA8IGluc25fY291bnQ7IGkrKykKPiAg
ICAgXgo+IGBgYAoKRGlkIHlvdSBmaW5kIHRoaXMgcHJvYmxlbSBvbiBjdXJyZW50IG1haW5saW5l
IGJpbnV0aWxzPyAgVGhlIGNvbmZpZ3VyZQptYWNoaW5lcnkgaXMgc3VwcG9zZWQgdG8gc3VwcGx5
IHRoZSBhcHByb3ByaWF0ZSAtc3RkPWM5OSBvciAtc3RkPWdudTk5CndoZW4gdXNpbmcgb2xkZXIg
Y29tcGlsZXJzLiAgVGhhdCBoYXBwZW5zIGZvciBtZSB3aGVuIEkgYnVpbGQgd2l0aApnY2MtNC45
LiAgSSBkb24ndCB0aGluayBhbnkgcGF0Y2ggaXMgbmVlZGVkIGZvciBtYWlubGluZS4KCi0tIApB
bGFuIE1vZHJhCkF1c3RyYWxpYSBEZXZlbG9wbWVudCBMYWIsIElCTQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
