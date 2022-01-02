Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C8A2D4828D5
	for <lists+openrisc@lfdr.de>; Sun,  2 Jan 2022 01:30:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7A12B24319;
	Sun,  2 Jan 2022 01:30:17 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id 00FA22431A
 for <openrisc@lists.librecores.org>; Sun,  2 Jan 2022 01:30:15 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so28824226pjf.3
 for <openrisc@lists.librecores.org>; Sat, 01 Jan 2022 16:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S0e8yu9wUL5voFAuk05NMY8axVAqTvLhhh6plR5bBrE=;
 b=AS8lkf7zaNCvLdt+Jj5vwwYHwVsrDzv/CqCpn2wqA/cUgAgFOFRyiR9uOocFQEqOMd
 k4yy2iwNIf5R1CmEDC9iViq+6ZvsOBu9h+MX2U412XY8VAnLOEkmciKvTN5v37CFGAc9
 ObZQ/ALWRHu9n5f1UVksJUeHrIjIVcIq3/C6lMYJvbWxN5koj+Vro9L+fgt+vgoNOMc6
 MOuPoNgKKjdZXNopx5MTtpFxb0bSzEA83eG8eOJY/IZd2qM1GWZ7Gb2gG6sL7zEohszP
 DsUohCbEXlyyDYGfNjW9dzZenl1t8hKWth52fWxo4IRcYwT8SVuiB8r54CuWsVWIPFEU
 k6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S0e8yu9wUL5voFAuk05NMY8axVAqTvLhhh6plR5bBrE=;
 b=BdTrimCfskPyyqwzRAS3x4ArzkX4XPciuZ7OFaxu6iI/Ut/995PTmPox8AsaDx+wmj
 P1t3MTaMjMXcRrt9gc3isPCVD8AvPknldlQRP5fdTaLhjbN08cbCYE3g8wCPb+LjlRCV
 rTAeEfUme09YuVQwj5ZCfu+It8PQRNIEpLkf8ic5gxCkYaxzNZfZPGWMjXW0x5EumnLd
 7lZzibaclaPsM7aeaRlafIYqBXELdPdvceyUPC7xCcPY6WJFrOSSy7olAW5z8RrKF5qY
 7JrmQ1mooNJqsxW3pw2pVUWPKvDWt3cjNBhmxbgC+5QEkKv1hEOscUjNLTCqb5u/HUml
 DzUQ==
X-Gm-Message-State: AOAM532BL/OJfwrugnR0/4K5TX+9Kp0FkfvTRpf/j8hUhis5PkGyoTse
 xxq8AFJXY+je6gOBtL1rL3U=
X-Google-Smtp-Source: ABdhPJyIHQXP7BP4Oad9+wk5ll9UiAt3DVvPQJ6liOXvtrrtrrfdoDHLd3nhbtRAdwcVpsnyaeuN6w==
X-Received: by 2002:a17:90b:2249:: with SMTP id
 hk9mr48018670pjb.246.1641083414613; 
 Sat, 01 Jan 2022 16:30:14 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id j23sm27787201pga.59.2022.01.01.16.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 16:30:13 -0800 (PST)
Date: Sun, 2 Jan 2022 09:30:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YdDyExgBArUaOmOc@antec>
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-11-shorne@gmail.com>
 <alpine.DEB.2.22.394.2112311744180.2293191@digraph.polyomino.org.uk>
 <CAAfxs77-NEGg5vCTPxNd7aJmOqvvf1Nf6=Mm8YfrFxJ6GOcDHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfxs77-NEGg5vCTPxNd7aJmOqvvf1Nf6=Mm8YfrFxJ6GOcDHQ@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v4 10/13] or1k: ABI lists
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

T24gU2F0LCBKYW4gMDEsIDIwMjIgYXQgMDE6NTQ6MDlQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gU2F0LCBKYW4gMSwgMjAyMiwgMjo0NSBBTSBKb3NlcGggTXllcnMgPGpvc2Vw
aEBjb2Rlc291cmNlcnkuY29tPiB3cm90ZToKPiAKPiA+IE9uIFdlZCwgMjkgRGVjIDIwMjEsIFN0
YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+ID4KPiA+ID4gIHN5c2RlcHMvdW5p
eC9zeXN2L2xpbnV4L29yMWsvbGlibnNsLmFiaWxpc3QgICB8ICAxMjEgKwo+ID4KPiA+IEFzIG5v
dGVkIGZvciB0aGUgTG9vbmdBcmNoIHBvcnQgc3VibWlzc2lvbiwgSSBkb24ndCB0aGluayBuZXcg
cG9ydHMgc2hvdWxkCj4gPiBoYXZlIGxpYm5zbCBvciBhbiBBQkkgdGVzdCBiYXNlbGluZSBmb3Ig
aXQuCj4gPgo+IAo+IE9rLCBJJ2xsIGhhdmUgYSBsb29rLiBJcyB0aGlzIHNvbWV0aGluZyB3ZSBo
YXZlIHRvIGRvIGluIG5ldyBwb3J0cyBvciBpcwo+IHRoaXMgc29tZXRoaW5nIHdyb25nIHdpdGgg
dGhlIGdlbmVyaWMgcGFydHM/CgpIZWxsbywKClRoZSBvcHRpb24gdG8gYnVpbGQgbGlibnNsIHdh
cyByZW1vdmVkIHdpdGggYWU3YTk0ZTVlMy4gIEhvd2V2ZXIsIHNpbmNlIHRoZXJlIGlzCm5vIGxv
bmdlciBhbmQgb3B0aW9uIGl0IGlzIG5vdyBidWlsZCB1bmNvbmRpdGlvbmFsbHkgZm9yIGlmZGVm
IGhhdmUtR0xJQkNfMi4yOC4KCk91ciBuZXcgYXJjaGl0ZWN0dXJlcyB3aWxsIGhhdmUgaGF2ZS1H
TElCQ18yLjM1LCBzbyBsaWJuc2wgaXMgbm90IGJ1aWx0IGF0IGFsbC4KClRoaXMgbGlibnNsLmFi
aWxpc3QgZmlsZSBtdXN0IGp1c3QgYmUgbGVmdG92ZXIuICBJIHJlbW92ZWQgaXQgYW5kIGNoZWNr
LWFiaQpzdGlsbCBwYXNzZXMuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
