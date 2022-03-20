Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5860A4E1DE7
	for <lists+openrisc@lfdr.de>; Sun, 20 Mar 2022 22:13:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0756E247FB;
	Sun, 20 Mar 2022 22:13:25 +0100 (CET)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mail.librecores.org (Postfix) with ESMTPS id C82602480C
 for <openrisc@lists.librecores.org>; Sun, 20 Mar 2022 22:13:22 +0100 (CET)
Received: by mail-pg1-f178.google.com with SMTP id t14so8996762pgr.3
 for <openrisc@lists.librecores.org>; Sun, 20 Mar 2022 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8QgnP7UE8gcARv7sLJZW+I9q72JODMo6EJTdNQS+2wU=;
 b=SQzxoz7s5621WVGH6xw4gN/niC6ixiYE3upMb078Vd/5NI1Dsx5FgoXdwpwhQHq41T
 eLKKEh1nh594gaDoiqcAEVqgjxOd4/eEg3nt8IdlPcZqePOXzmT+RtWHO0sWjjlCfwRt
 WPGOOilKoJRqGxShU2FHfEpQmFzSdmTXwtg7z6HDuzLIf6yRMIwAj5VrZclQsnKbIwka
 nnGT+Zz+DNV7zcWpUqSamcVdvm24ublAKfAd0IZYhC5d3fdYjf2Ea76Pg1S60eM0/k/z
 TJgjcDGZBPeh/Yb1Rf37A/ACQeAoXfbBijNU09G0cpnUvBiE8VD9HOrqe+kLY7vfify3
 H0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8QgnP7UE8gcARv7sLJZW+I9q72JODMo6EJTdNQS+2wU=;
 b=EwvEGWc2Dd30Amz9R7SFSDQFRwUJnIEAkCseSXNXNI8hbMVSALG98veh25u9EU2yQg
 hk37ssPYAtaG2fpP6vH0JSNkKtJ1DsiFGgfK0oHBtobfVf3jRrnJU4ggrVNfravd8W29
 DrZTa1VX4NeqG9j8dToPvRiYPj4MlJz1Xo3B7FegeOhYtSSmaR8ir4bXzBQ/7h4YwoS+
 s1mtsA+5v2QGWTm35QGJn9aPtI4nAE1hRaLL8w+84bIdw4olX8neMyrQRunHmDx4ISjL
 SHDAozljGxvo1gBiicqPh0a5pedNVo54Focsl+trc3hPhYofulcwwVSsX5gbpNQJ3hT0
 Mh5A==
X-Gm-Message-State: AOAM533d6X1WzOkIugQ47oqbSfX5GuSVXW3uSd+dXZOqIyMA1RzuUNfN
 gw+cbZrGxBjRj1NwfRKIwxs=
X-Google-Smtp-Source: ABdhPJzgq/DRYZUuTy6XlEDhoZLKJRWamc37XxFO1vFMmcGnSWJE6gOse8hFzfojkx/YIdUJAwM+Qg==
X-Received: by 2002:a62:643:0:b0:4f7:2b29:159a with SMTP id
 64-20020a620643000000b004f72b29159amr20763476pfg.16.1647810801203; 
 Sun, 20 Mar 2022 14:13:21 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a056a00168a00b004f7e2a550ccsm16708922pfc.78.2022.03.20.14.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 14:13:18 -0700 (PDT)
Date: Mon, 21 Mar 2022 06:13:16 +0900
From: Stafford Horne <shorne@gmail.com>
To: Guo Ren <guoren@kernel.org>
Message-ID: <YjeY7CfaFKjr8IUc@antec>
References: <20220319035457.2214979-6-guoren@kernel.org>
 <202203200824.EQJTy8pW-lkp@intel.com>
 <CAJF2gTQXgXJjX6h5d_5tM312Ky_QfCKm-wLZP2SJBuYtHvE9xQ@mail.gmail.com>
 <CAAfxs74xtts3bzMGsVp9fOyxfZzj1vQPgrEsquXFa6AGAAC+_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfxs74xtts3bzMGsVp9fOyxfZzj1vQPgrEsquXFa6AGAAC+_w@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH V2 5/5] openrisc: Move to ticket-spinlock
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
Cc: Jonas Bonn <jonas@southpole.se>, Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXIgMjAsIDIwMjIgYXQgMTI6MzY6MzFQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gU3VuLCBNYXIgMjAsIDIwMjIsIDEyOjA1IFBNIEd1byBSZW4gPGd1b3JlbkBr
ZXJuZWwub3JnPiB3cm90ZToKPiAKPiA+IEhpIG9wZW5yaXNjIGd1eXMsCj4gPgo+ID4gPiAgICBr
ZXJuZWwvc2lnbmFsLmM6MjYyNTo0OTogc3BhcnNlOiAgICAgZXhwZWN0ZWQgc3RydWN0IHNpZ2hh
bmRfc3RydWN0Cj4gPiAqc2lnaGFuZAo+ID4gPiAgICBrZXJuZWwvc2lnbmFsLmM6MjYyNTo0OTog
c3BhcnNlOiAgICAgZ290IHN0cnVjdCBzaWdoYW5kX3N0cnVjdAo+ID4gW25vZGVyZWZdIF9fcmN1
ICpzaWdoYW5kCj4gPgo+ID4gU29tZSB3YXJuaW5nIGhlcmUsIElzIHRoYXQgYWxsIHJpZ2h0PyBJ
IGRvbid0IHRoaW5rIGl0IGlzIGJlY2F1c2Ugb2YKPiA+IGNoYW5naW5nIGFyY2hfc3BpbmxvY2tf
dCBmcm9tIHN0cnVjdCBxc3BpbmxvY2sgdG8gYXRvbWljX3QuCj4gPgo+IAo+IEkgaGF2ZW4ndCBi
dWlsdCBvciB0ZXN0ZWQgdGhpcyBzZXJpZXMgeWV0LiAgQnV0IHRoaXMgZG9lc24ndCBsb29rIGxp
a2UgYQo+IG5ldyBwcm9ibGVtLiBJdCBsb29rcyBsaWtlIHRoaXMgcGF0Y2ggc2VyaWVzIG1heSBo
YXZlIGludHJvZHVjZWQgYSBuZXcKPiBpbnN0YW5jZSBvZiB0aGUgZXhpc3RpbmcgaXNzdWUuCj4g
Cj4gSSBoYXZlIHNvbWUgcGF0Y2hlcyB0byBjbGVhbiB1cCBzcGFyc2Ugd2FybmluZ3MgYW5kIEkn
dmUgc2VlbiB0aGlzIHBhdHRlcm4KPiBiZWZvcmUgYnV0IGhhdmVuJ3Qgc3BlbnQgdGhlIHRpbWUg
dG8gY2xlYW4gaXQgdXAuIFRoaXMgaXMgYSBnb29kCj4gb3Bwb3J0dW5pdHkgdG8gZG8gdGhhdCBu
b3cuICBMZXQgbWUgaGF2ZSBhIGxvb2sgaW4gdGhlIG5leHQgZmV3IGRheXMuCgpIZWxsbyBHdW8g
UmVuLAoKSSB3YXMgYWJsZSB0byBidWlsZCB0aGUgcGF0Y2ggc2VyaWVzIGZvciBPcGVuUklTQywg
YnV0IGFmdGVyIGFwcGx5aW5nIHRoZQpvcGVucmlzYyBTTVAga2VybmVsIGJ1aWxkIG5vIGxvbmdl
ciBjYW4gYm9vdC4gIEl0IGRvZXNuJ3QgYm9vdCBvbiBzaW5nbGUgY29yZQpzeXN0ZW0gb3IgbXVs
dGktY29yZSBzeXN0ZW1zLiAgSSBkb24ndCBnZXQgYW55IGNvbnNvbGUgb3V0cHV0IHRvIGhlbHAg
d2l0aApkZWJ1Z2dpbmcgaXQuCgpJdCBtYXkgdGFrZSBiZSBhIGJpdCBsb25nZXIgdG8gZGVidWcg
dGhpcy4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
