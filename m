Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CEC31163124
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D1E19206A2;
	Tue, 18 Feb 2020 21:00:19 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 368E320880
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 09:25:34 +0100 (CET)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FF0D215A4
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580459132;
 bh=MWMZ28GeJVLlHXvBwFzIUImYSXTKSSm4m0B/kxjLmk8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mXC3fdgXh/Vjbq/wFDBgMbocboo7kx156GamlPhjQ95A7ICGZ6oFhtba7pv1qn1KL
 d/KwBYUHHFJEnoIokXEyEoMpkKL20hZrHId67A+AvV50ToIApiYgkWYaDtiZCrQRsy
 wmnnEiToC2NNZOpVWqiehhPuu2yHJYpoPajOwYnI=
Received: by mail-lf1-f46.google.com with SMTP id t23so4254395lfk.6
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 00:25:31 -0800 (PST)
X-Gm-Message-State: APjAAAXJWUw8VHy2TyVo6rxDjUyzxOk6o23xMRwxMRnAboU+j/bI6DYA
 1EztjYyu8A591hP1/zytYxL2LN2DR6JF1UYiv80=
X-Google-Smtp-Source: APXvYqxbwJxX4sGSMViDJFZy4RAn/rjlmFDk9uS9eL0zJtCDe9X4PRPy2vWrCayiFqXxttLFTt0kjC5exzGbTRle/lo=
X-Received: by 2002:ac2:5388:: with SMTP id g8mr4811323lfh.43.1580459130141;
 Fri, 31 Jan 2020 00:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20200130191938.2444-1-krzk@kernel.org>
 <20200130213839.GW24874@lianli.shorne-pla.net>
In-Reply-To: <20200130213839.GW24874@lianli.shorne-pla.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 Jan 2020 09:25:18 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcfpTMr+KGLXCC2Kb5Hz+jSX+6KtCoPS-0qWdk2sazTeQ@mail.gmail.com>
Message-ID: <CAJKOXPcfpTMr+KGLXCC2Kb5Hz+jSX+6KtCoPS-0qWdk2sazTeQ@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:14 +0100
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
Cc: Jonas Bonn <jonas@southpole.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yamada.masahiro@socionext.com, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCAzMCBKYW4gMjAyMCBhdCAyMjozOCwgU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gK2NjOiBNYXNhaGlybywKPgo+IE9uIFRodSwgSmFuIDMwLCAyMDIw
IGF0IDA4OjE5OjM4UE0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBDT05G
SUdfQ1JPU1NfQ09NUElMRSBpcyBnb25lIHNpbmNlIGNvbW1pdCBmMTA4OWM5MmRhNzkgKCJrYnVp
bGQ6IHJlbW92ZQo+ID4gQ09ORklHX0NST1NTX0NPTVBJTEUgc3VwcG9ydCIpLgo+Cj4gSSBzZWUg
dGhpcyBwYXRjaCBpcyBhbHJlYWR5IGluLCBidXQgZG9lcyBpdCBicmVhayAwLWRheSB0ZXN0IHRv
b2xzIHRoYXQgZGVwZW5kCj4gb24gdGhpcyBDT05GSUdfQ1JPU1NfQ09NUElMRSBzZXR1cD8gIEkg
Z3Vlc3MgaXRzIGJlZW4gaW4gc2luY2UgMjAxOCwgc28gdGhlcmUKPiBzaG91bGQgYmUgbm8gcHJv
YmxlbS4KPgo+IENhbiB5b3UgYWxzbyBoZWxwIHRvIHVwZGF0ZSAiRG9jdW1lbnRhdGlvbi9vcGVu
cmlzYy9vcGVucmlzY19wb3J0LnJzdCI/ICBJdAo+IG1lbnRpb25zIHRoZSBidWlsZCBzdGVwcyBh
cmU6Cj4KPiAgICAgQnVpbGQgdGhlIExpbnV4IGtlcm5lbCBhcyB1c3VhbDo6Cj4KPiAgICAgICAg
IG1ha2UgQVJDSD1vcGVucmlzYyBkZWZjb25maWcKPiAgICAgICAgIG1ha2UgQVJDSD1vcGVucmlz
Ywo+Cj4gVGhpcyBub3cgY2hhbmdlcywgSSB1c2VkIHRvIHVzZSBgbWFrZSBBUkNIPW9wZW5yaXNj
IENST1NTX0NPTVBJTEU9b3Ixay1saW51eC1gCj4gaXMgdGhpcyBzdGlsbCBnb2luZyB0byB3b3Jr
PwoKQWxsIGNyb3NzIGNvbXBpbGUgcGxhdGZvcm1zIGFyZSBiZWluZyBidWlsdCBsaWtlIHRoaXMs
IHNvIEkgZ3Vlc3MKb3BlbnJpc2Mgc2hvdWxkIG5vdCBiZSBkaWZmZXJlbnQuIEkgd2lsbCBzZW5k
IGEgcGF0Y2ggZm9yIHRoZSBkb2MKdXBkYXRlLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
