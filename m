Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 239C12E2932
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5826E20EF1;
	Fri, 25 Dec 2020 00:15:31 +0100 (CET)
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 by mail.librecores.org (Postfix) with ESMTPS id E275220919
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 08:23:04 +0100 (CET)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 0BM7Mr73008427
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 16:22:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0BM7Mr73008427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608621774;
 bh=MdgXeZjPAoG2zgI/9PTUDD5lMHdp0LVzaQZKW55s0K8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TO/t73WzdUej0SczdBEpIbjmWdxJ/flGrSTdiV6DfNhcJ5g+ULOimzLhLEgc84AF+
 r/LnweqS3DRj0geKjp+fUPfFYyqAROSnG0K1zYGYYeQYVTl//s0JUt/MYqiMrLN1+k
 RHgdO6yjXDcpX/uYiWrCQYw6jSLvoWObeQJZ+The04dCqe/MWtcByKQhC+GWb7KC/P
 +chJCsmp9hxvFN0m+Oil6Nk+oo10Bb5FO5Bu9SkHXnGv7LX/aB3Pp972qBGxuCzmZf
 77T+ABte3m0y6dz3HEsQtkGykjzFqcprKiGLz1ZeVLFYUJsoDSe9cy/kvbKDQDNglw
 J6zFhVeacHrbg==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id w6so7974835pfu.1
 for <openrisc@lists.librecores.org>; Mon, 21 Dec 2020 23:22:53 -0800 (PST)
X-Gm-Message-State: AOAM530HzUBPG2rQp29yjAUg8YOYjECxnl7uYXMOpqYOPuizGsvGoM5H
 ddBgNFARa5d31WR2DLlW2c+DkayUW36GY8whDFg=
X-Google-Smtp-Source: ABdhPJzIeir2iJm8v1W9WsUYckuHzNmooqeZY18Zn2T6uMlQt8USjCn1jMSlEheCXNwLC+uM60dUv6dwww6kOOuriZs=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr18613405pgu.175.1608621772952; 
 Mon, 21 Dec 2020 23:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20201222070731.491076-1-joel@jms.id.au>
In-Reply-To: <20201222070731.491076-1-joel@jms.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 22 Dec 2020 16:22:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_+VTDspmBNXPZzMKDhzDz9+TyKjrOs_Xho-ZMEPGDKA@mail.gmail.com>
Message-ID: <CAK7LNAS_+VTDspmBNXPZzMKDhzDz9+TyKjrOs_Xho-ZMEPGDKA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH v2] openrisc: Add vmlinux.bin target
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
Cc: Jonas Bonn <jonas@southpole.se>, Mateusz Holenko <mholenko@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgNDowNyBQTSBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PiB3cm90ZToKPgo+IEJ1aWxkIGl0IGJ5IGRlZmF1bHQuIFRoaXMgaXMgY29tbW9ubHkgdXNl
ZCBieSBmcGdhIHRhcmdldHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pgo+IC0tLQo+IHYyOiBBZGRyZXNzIHJldmlldyBmcm9tIE1hc2FoaXJvCj4KPiAg
LSBBZGQgdm1saW51eC5iaW4gdG8gcGhvbnkgdGFyZ2V0Cj4gIC0gc2ltcGxmeSB2bWxpbnV4LmJp
biBydWxlCj4gIC0gYWRkIGNsZWFudXAgcnVsZQo+ICAtIGFkZCB2bWxpbnV4LmJpbiB0byB0YXJn
ZXRzCj4gIC0gQWRkIGdpdGlnbm9yZQoKCiBSZXZpZXdlZC1ieTogTWFzYWhpcm8gWWFtYWRhIDxt
YXNhaGlyb3lAa2VybmVsLm9yZz4KCi0tLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
