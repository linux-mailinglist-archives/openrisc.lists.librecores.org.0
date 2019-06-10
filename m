Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD353BDCA
	for <lists+openrisc@lfdr.de>; Mon, 10 Jun 2019 22:51:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5FD2C2025E;
	Mon, 10 Jun 2019 22:51:01 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id CB0CF20164
 for <openrisc@lists.librecores.org>; Mon, 10 Jun 2019 22:50:59 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id f97so4115575plb.5
 for <openrisc@lists.librecores.org>; Mon, 10 Jun 2019 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F6/uyFUyNkXmx23zinbisuEHma5oC9HfhJW425lg5Q8=;
 b=iQMfRDV8s3kCXtUxCJ/VCQ0qGPc4pL1ebAds23+nr2aQn858CcC52AhMI6mFxgao/U
 3wq/sBGyzlz92XVlrhBHI1GSZbOV/SF2V79MEGQVgtlGhqX8+8rQComsVtRJ84HZJaqS
 O3i1dF0ohhGPqdLtf80eYW0g68P0sIadlyT2i3if+eQd4FR43hsE8jrDBjRcg3W8UKoG
 XQrIyYGDqJQ0J6inurCQwyIeFsNdhHCRrdDKX3JNPlMuqTEdoaN0NaWvvIxzgokZD+Gi
 MpEtsN+ANIsW3smB5BqAdI0Jm2cVR4UZbrqg5l3jqQTeV6TSTx7TaOK+7UC3AqKz0cZz
 qMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F6/uyFUyNkXmx23zinbisuEHma5oC9HfhJW425lg5Q8=;
 b=Nq62uMypEsaf3ZvE6qQjwk3EKvfSqi199ThppulPSuFJQNNCRp7ZsfbBIa9EpRRYD3
 xXejtfsGKV6+A236kek1rhY1r41mBS6pv/52OEn4DsoQtDEIVNsDr7jFCEtnXFulCMNa
 Jlo2UYvCJmkYnLwAbTVgd/RksHBOd6S3gioGYJ4jI+hFLbZGIsxF4Nn7DFimeIjId3Fn
 K4fRTwWPbo6hMJp3HjSv2+RLvzmOjmevvkCw0TV0Eq83HnSySB8ZnnZGdfM1uaeBwyZj
 rmbg42iF0wXBnKjTfXQFNoZ6BKL4G+N53sBDZPKTD5/ZQ+lAMvUBEEVNbssqwXSYZUDt
 4X0w==
X-Gm-Message-State: APjAAAUmqv22CPC8LzgPYFqL1o/qrgWEduGlXslNzmZ1oXmtN6Odgc67
 ccPRNdzXbQc41p0/uwftvpg=
X-Google-Smtp-Source: APXvYqx+/We67nT+hSb4HNKvYS8XkyDVypbVbp+6wQNivMzeZ27vmjVpBnpNOrQTi7kVCgns9kiwMA==
X-Received: by 2002:a17:902:246:: with SMTP id
 64mr2174207plc.311.1560199858414; 
 Mon, 10 Jun 2019 13:50:58 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id i3sm11582745pfa.175.2019.06.10.13.50.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 13:50:57 -0700 (PDT)
Date: Tue, 11 Jun 2019 05:50:56 +0900
From: Stafford Horne <shorne@gmail.com>
To: Nick Clifton <nickc@redhat.com>
Message-ID: <20190610205056.GA2358@lianli.shorne-pla.net>
References: <20190608213225.3230-1-shorne@gmail.com>
 <36502dad-1be9-294f-a2f4-6ab67f76f3ac@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36502dad-1be9-294f-a2f4-6ab67f76f3ac@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v3 0/11] OpenRISC orfpx64a32 and openrisc
 spec 1.3 support
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
 GNU Binutils <binutils@sourceware.org>, Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>,
 GDB patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDQ6MDc6NDhQTSArMDEwMCwgTmljayBDbGlmdG9uIHdy
b3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+ID4gSXRzIGJlZW4gYSB3aGlsZSBzaW5jZSB2MiwgYnV0
IHdlIGhhdmUgYmVlbiBidXN5IGNoYW5naW5nIGRpcmVjdGlvbiBhIGJpdC4KPiA+IEluc3RlYWQg
b2YganVzdCBhZGRpbmcgdGhlIG9yZnB4NjRhMzIgZXh0ZW5zaW9uIHN1cHBvcnQgd2UgaGF2ZSBj
cmVhdGVkIGEgbmV3Cj4gPiBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbiBbMF0gYW5kIHRoaXMg
c2VyaWVzIGluY2x1ZGVzIHNvbWUgb2YgdGhvc2UgY2hhbmdlcy4KPiAKPiBJIGFtIGp1c3Qgc3Rh
cnRpbmcgdG8gbG9vayBhdCB0aGlzIHBhdGNoIHNlcmllcywgYnV0IEkgbmVlZCB0byBjaGVjayBv
bmUgdGhpbmcKPiBmaXJzdC4gIFRoZSBudW1iZXIgc3VnZ2VzdHMgdGhhdCB0aGVyZSBzaG91bGQg
YmUgMTEgcGF0Y2hlcywgYnV0IEkgc2VlIG9ubHkgOS4KPiBBcmUgdHdvIG1pc3NpbmcsIG9yIGlz
IHRoZSBudW1iZXJpbmcgd3JvbmcgPwoKSGVsbG8sCgpUaGFua3MgZm9yIGhhdmluZyBhIGxvb2su
ICBTb3JyeSwgMiB3ZXJlIG1pc3NpbmcgSSBqdXN0IHNlbnQgdGhlbS4KCi1TdGFmZm9yZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
