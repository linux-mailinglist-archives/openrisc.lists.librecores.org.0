Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D9D2721FD96
	for <lists+openrisc@lfdr.de>; Tue, 14 Jul 2020 21:42:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8CFCF202EC;
	Tue, 14 Jul 2020 21:42:11 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id EC8E220CE7
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 21:42:08 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id 207so8020850pfu.3
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=scAKWZ9w0PnLLtxMyje28uys2NF0S5edA01+XM+QBig=;
 b=Uh6O3LWGHVo+rR8bvdIFPF1rtF6BZXiFm/vocDTMfCreMN6x0z6KK52OTeJLSxeNP2
 F68n+OjcIz4XlpqlrDHjcComyXR8mrwwzqNQf77nNucK7AxsHFiqZoAn9NE1phYZG1/7
 0v76P9O9taaZDBegGxGgtDhfTlPUWBBB5xGtNMorfpNREb6qYv3XwktYjD45hiPVIHnv
 mXJA8+8jYD1PqBD5BiuUUqXlpAv7n8dN9X6BtAwQu/byZnrrE+MXNxzYjZ2u2efmyTBf
 F4n5aZbCZUJq9ZEMoJ9vqBGEt/j3C24VuNIeXErWYByvRRr+FzRfd6tpVNrk8wL06lVi
 GRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=scAKWZ9w0PnLLtxMyje28uys2NF0S5edA01+XM+QBig=;
 b=rLOPwCnn0/fRj7/Af6q37Z40iBcyEfBrSS/n9YXDn2YuEbmxL0rBMd19mGojSfl6Co
 OFIRdN3fKf/MRqO43uZPb3O8D5z2DC3HNc5iuCfsniB471YUvFcaFqFBmNf69Wgs1Hgi
 NSZ5G98wu3fHgrfsYDktPVXpZT1zVWKAP2m0DqvjnXMObAs/VuCPvn4gykNAQifcYWS6
 yR5ETsj7Wq9kQO2QobLGnOemmsZls0s8bXuqmwN2dfp0S1cVhY1+5UGoPw/2Te2b5yVh
 G5sY9+1pTVI9IcLe6KGF7e7MYe8BTEtPbeTfKqMmRpSLlJVlPEhTAAzT+OSiPyyNn3h5
 bsTw==
X-Gm-Message-State: AOAM530AVnBK+Onum6UksjEtrLZ82H6NFYKM1J9NDrilSBWnzUA1HNbu
 pcYG/hVShe+6uCCwfnPHigk=
X-Google-Smtp-Source: ABdhPJw/XfW7t8laLRAfSW3wQGYIjrPK3epddxCzffXxjhzfSrf+oav76cn+bQe9QVD8DaiiHifW6Q==
X-Received: by 2002:a63:4545:: with SMTP id u5mr4500145pgk.229.1594755726949; 
 Tue, 14 Jul 2020 12:42:06 -0700 (PDT)
Received: from localhost (g175.219-103-161.ppp.wakwak.ne.jp. [219.103.161.175])
 by smtp.gmail.com with ESMTPSA id bx18sm3335942pjb.49.2020.07.14.12.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 12:42:05 -0700 (PDT)
Date: Wed, 15 Jul 2020 04:42:02 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200714194202.GE437393@lianli.shorne-pla.net>
References: <20200710062019.28755-1-grandmaster@al2klimov.de>
 <20200713113430.1c1777bb@lwn.net>
 <CAMuHMdXoUME_dCOZP1N0tXyMv61edfNECM4-n4NPa56YbBCncw@mail.gmail.com>
 <20200714074022.24481c73@lwn.net>
 <CAMuHMdXMumw9CnMHOc_GJGO0MNsLowTv-wE399BMJveXgTXbLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMumw9CnMHOc_GJGO0MNsLowTv-wE399BMJveXgTXbLQ@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH] OPENRISC ARCHITECTURE: Replace HTTP links
 with HTTPS ones
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
Cc: Jonas Bonn <jonas@southpole.se>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgMDc6MzA6MzhQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDE0LCAyMDIwIGF0IDM6NDAgUE0gSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD4gd3JvdGU6Cj4gPiBPbiBUdWUsIDE0IEp1bCAyMDIwIDA5OjIy
OjM5ICswMjAwCj4gPiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3
cm90ZToKPiA+ID4gPiA+IC0gICAgIHdlYnNpdGUgICAgICAgICBodHRwOi8vb3BlbnJpc2MuaW8K
PiA+ID4gPiA+ICsgICAgIHdlYnNpdGUgICAgICAgICBodHRwczovL29wZW5yaXNjLmlvCj4gPiA+
ID4gPiAgICAgICBlbWFpbCAgICAgICAgICAgb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
PiA+ID4gPiA+ICAgICAgID09PT09PT0gICAgICAgICA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQo+ID4gPiA+Cj4gPiA+ID4gQXBwbGllZCwgdGhhbmtzLgo+ID4gPgo+ID4gPiBJcyB0aGF0
IHNpdGUgYWNjZXNzaWJsZSBmb3IgYW55b25lPyBJdCB0aW1lcyBvdXQgZm9yIG1lLgo+ID4KPiA+
IFdvcmtzIGZvciBtZS4KPiAKPiBOb3cgaXQgaW5kZWVkIGRvZXMuCgpUaGFua3MgZm9yIGNoZWNr
aW5nLAoKVGhlcmUgd2FzIGFuIGlzc3VlIHdpdGggb3VyIHNlcnZlciBoYXJkd2FyZSB0aGF0IGhv
c3RzIGh0dHBzOi8vb3BlbnJpc2MuaW8gYXMKd2VsbCBhcyBvdGhlciBGT1NTSSBzaXRlcyBpbmNs
dWRpbmcgaHR0cHM6Ly93d3cubGlicmVjb3Jlcy5vcmcgYW5kCmh0dHBzOi8vZm9zc2ktZm91bmRh
dGlvbi5vcmcuCgpXZSBtaWdyYXRlZCB0aGVzZSBhbGwgdG8gZGlmZmVyZW50IGluZnJhc3RydWN0
dXJlIChnaXRodWIgcGFnZXMpIHRvIGZpeCB0aGUKaXNzdWUuICBUaGV5IHNob3VsZCBiZSBtb3Jl
IHN0YWJsZSBub3cuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
