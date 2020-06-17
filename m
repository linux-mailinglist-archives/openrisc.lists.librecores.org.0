Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C768A1FECC4
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:23 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5FBE3205B0;
	Thu, 18 Jun 2020 09:47:23 +0200 (CEST)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by mail.librecores.org (Postfix) with ESMTPS id 1F62120CBA
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 14:05:07 +0200 (CEST)
Received: by mail-yb1-f194.google.com with SMTP id 187so1156166ybq.2
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ce5ijYOF0B5Aqlf57GOv1H78E2Rpwmzo3WdEJEFGYSE=;
 b=QAExVmYqjdDJlSzYO0zRvYtLurMgwAeu8aVFVB8OL8VsADCePe+QaZgfl9OkXCKMAQ
 VKuabSPfs5so+ExviNS0jK0/pg8P+SUO6EisqEr5iBs8D8GfHdHzEXPMQyrTW/GvPWaU
 S/rpxTYOoPblTuhGcsXkbxUjMFdffWjZaJAH2Yf+MrKACpx9oUwzd7a6Iv6gA4XIx3Ky
 EP5jCZdtRVa34VO/VJ6okmLDOWuzJ1+ygmLdjT9hXqVNFsvAHysGhxo8YQ4tMhkd7Lkr
 wrif3VT2UfRTXX5dSLWVZ1RRUUPVoYECIfDkG5oeJD/zmqgSnw5qI33u0VsoZflYnWiZ
 wFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ce5ijYOF0B5Aqlf57GOv1H78E2Rpwmzo3WdEJEFGYSE=;
 b=mjd9cWNoU2xRSG/UsmBoNyjRp+wOBjd61bnO7M/ArJxFY63xUDVQS/fLB2qGfa4Six
 Wq4W6I21edPi8a7xfuYJE4k8CljGKg/fS+M/C1jwtjCN8hEUHsjDtrQh3cDUdNuNO+gd
 nx5khJkQuoysMeyZIw/2LVPgJtlblTH2ucvrCke59YX6CBmeTPKcOwEGRiJ7gypruv86
 tXQn0HiCo7T4WhK1ccGqyGqoODamC0XJVUqX8OfbHr0WCFw595dBHGoHucbiodVt+kup
 9KIZnIHYfAyKM6e6USVV8H7ikoz79/Cis4gefLhP9612vLGmQffd/6kQMF8+Kic185my
 p8Sw==
X-Gm-Message-State: AOAM533+lH7K4TZne2fJhjncjEMiI1tVThrDhMNSqF6czT6XC/bCWRzg
 joEAixmz4PED2cng77KLOFiA3HZLVpLVDTRuM58sJQ==
X-Google-Smtp-Source: ABdhPJwVwzsytVeAA15ADKunV37yJHXmL+R8PoOsnbw37rc75bwoSG0DAvnfoh+gLdkshu8DPeRsyLit2wi1veXDijQ=
X-Received: by 2002:a25:7b82:: with SMTP id
 w124mr11825940ybc.320.1592395505465; 
 Wed, 17 Jun 2020 05:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200617090247.1680188-1-shorne@gmail.com>
In-Reply-To: <20200617090247.1680188-1-shorne@gmail.com>
From: Michel Lespinasse <walken@google.com>
Date: Wed, 17 Jun 2020 05:04:52 -0700
Message-ID: <CANN689E_oP3T6J3Rw2rWv1KG3GO3JOJtCdCb3yMLz+u8hFN=Qw@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix boot oops when DEBUG_VM is
 enabled
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
Cc: Jonas Bonn <jonas@southpole.se>, Thomas Hellstrom <thellstrom@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>, Steven Price <steven.price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Daniel Jordan <daniel.m.jordan@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMjowMyBBTSBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gU2luY2UgdjUuOC1yYzEgT3BlblJJU0MgTGludXggZmFpbHMgdG8g
Ym9vdCB3aGVuIERFQlVHX1ZNIGlzIGVuYWJsZWQuCj4gVGhpcyBoYXMgYmVlbiBiaXNlY3RlZCB0
byBjb21taXQgNDJmYzU0MTQwNGYyICgibW1hcCBsb2NraW5nIEFQSTogYWRkCj4gbW1hcF9hc3Nl
cnRfbG9ja2VkKCkgYW5kIG1tYXBfYXNzZXJ0X3dyaXRlX2xvY2tlZCgpIikuCj4KPiBUaGUgYWRk
ZWQgbG9ja2luZyBjaGVja3MgZXhwb3NlZCB0aGUgaXNzdWUgdGhhdCBPcGVuUklTQyB3YXMgbm90
IHRha2luZwo+IHRoaXMgbW1hcCBsb2NrIHdoZW4gZHVyaW5nIHBhZ2Ugd2Fsa3MgZm9yIERNQSBv
cGVyYXRpb25zLiAgVGhpcyBwYXRjaAo+IGxvY2tzIGFuZCB1bmxvY2tzIHRoZSBtbWFwIGxvY2sg
Zm9yIHBhZ2Ugd2Fsa2luZy4KPgo+IEZpeGVzOiA0MmZjNTQxNDA0ZjIgKCJtbWFwIGxvY2tpbmcg
QVBJOiBhZGQgbW1hcF9hc3NlcnRfbG9ja2VkKCkgYW5kIG1tYXBfYXNzZXJ0X3dyaXRlX2xvY2tl
ZCgpIgo+IENjOiBNaWNoZWwgTGVzcGluYXNzZSA8d2Fsa2VuQGdvb2dsZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CgpUaGFua3MgZm9yIHRo
ZSBmaXguCgpSZXZpZXdlZC1ieTogTWljaGVsIExlc3BpbmFzc2UgPHdhbGtlbkBnb29nbGUuY29t
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
