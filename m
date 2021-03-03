Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5081A32B884
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 15:12:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E21902120A;
	Wed,  3 Mar 2021 15:12:20 +0100 (CET)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mail.librecores.org (Postfix) with ESMTPS id 6B4222120A
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 15:12:19 +0100 (CET)
Received: by mail-pf1-f171.google.com with SMTP id o188so9705386pfg.2
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 06:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nyc79OkBqcm91dkYJ8y+teIBbOTw+kWRs6mRqnmse6Q=;
 b=UiJ5B8DNYc+tMp/m8bJR7YjJ5D4v1XpJV7/7RZTdF0ef2Ch2xSUbs9v3VUXd5dyFEs
 FNNgzGEMERw1tPeUFfXtuJppD1N7s8NxZgLPqaOQlQ8k5hIMIjgQGwyUmrEXRU/J66OT
 LAy1nJZBQNY3KiP7T6C1GDxbltfY8/Rd2QL7obmLziBms/bHMKGp1Y/ucf1S8ixO509G
 xjVcoMn4CX0pMp0oc53fFzguf0PkvbHhf5kaZQwwDuVtXIqTZU439rMW5uRZ/oEB2dxi
 T1NkijT03rWkRohgL3PEsMy2UbzSBFMshyApxbvLGd2UCpBnr6CO9tamh+ohoyRbk1LD
 ti2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nyc79OkBqcm91dkYJ8y+teIBbOTw+kWRs6mRqnmse6Q=;
 b=cA4lGF6GspTBZly4HWQX/nG49GM59n2QkgsoysAx0TrLPNK7HzWOqJe7ChibvPxG7G
 qcnfn2gDZtDWOi/sHWzFzDA3Sx8OkkJCCIJKwRxFWwZEj9olJs3oe/5PuuhCUsrhjw2R
 CkN2jGJGu9I6LpfSJQemOpo0i8B21KWuuRmpspxAd+4etKzJRFNxx0f+HoKlyMaOrSo5
 IQ7hbY4HzIfYVTseG4ni4BB3s7VVXjjZnR30G73nFAOBdOcTEggJMgAX5B/nrk0J+qyR
 +skao5jyNSo5ZP8y9u9beYxkqXjvFCmZsS6YAJDIxzKK3gKOrEMt+MYTRzQrPGwCuVSU
 NgVA==
X-Gm-Message-State: AOAM532n6GvPGYP5oJq+FFv9XWUYL7LDnH/NHbCVpDvptDa6doNgHfeL
 VUWc3g8jSBHpTJpfK7xcebscS6Pn3JQ=
X-Google-Smtp-Source: ABdhPJypQEnF38zZ3cu8bG/UWzZKijlW/Tbckc4bFxPUWM2rqFLo6eulTofJwbXpgbpxSqD/vHM2DA==
X-Received: by 2002:a63:4e09:: with SMTP id c9mr23402537pgb.107.1614780737947; 
 Wed, 03 Mar 2021 06:12:17 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id 190sm24992707pfv.155.2021.03.03.06.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 06:12:17 -0800 (PST)
Date: Wed, 3 Mar 2021 23:12:14 +0900
From: Stafford Horne <shorne@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210303141214.GG365039@lianli.shorne-pla.net>
References: <20210303135026.3450789-1-shorne@gmail.com>
 <57222afc-9d92-e52d-34d4-0737eff1ec82@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57222afc-9d92-e52d-34d4-0737eff1ec82@pengutronix.de>
Subject: Re: [OpenRISC] [PATCH 0/4] OpenRISC fixes and setjmp/longjmp work
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
Cc: Barebox <barebox@lists.infradead.org>, s.hauer@pengutronix.de,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMDMsIDIwMjEgYXQgMDM6MDM6MTFQTSArMDEwMCwgQWhtYWQgRmF0b3VtIHdy
b3RlOgo+IEhlbGxvIFN0YWZmb3JkLAo+IAo+IE9uIDAzLjAzLjIxIDE0OjUwLCBTdGFmZm9yZCBI
b3JuZSB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBUaGVzZSBhcmUgdGhlIHBhdGNoZXMgSSBj
YW1lIHVwIHdpdGggdG8gZ2V0IHRoZSBzZXRqbXAvbG9uZ2ptcCByb3V0aW5lcyB0byB3b3JrCj4g
PiBvbiBPcGVuUklTQy4gIEl0IHNlZW1zIHRvIGJlIHdvcmtpbmcgd2VsbC4KPiA+IAo+ID4gVGhl
IHBhdGNoZXMgYXJlIG9uIGdpdGh1YiBoZXJlOgo+ID4gICBodHRwczovL2dpdGh1Yi5jb20vc3Rm
ZnJkaHJuL2JhcmVib3gvdHJlZS9vcGVucmlzYy1idGhyZWFkCj4gPiAKPiA+IEkgaGFkIHRvIHJl
dmVydCBhIGNvbW1pdCB0byByZW1vdmUgb3BlbnJpc2MgdG8gZG8gdGhpcyB3b3JrLCBJIGhvcGUg
dGhhdCBjYW4gYmUKPiA+IHJldmVydGVkLgo+IAo+IEdyZWF0LiBUaGFua3MgZm9yIHRha2luZyB0
aGUgdGltZSEKPiBDb3VsZCB0aGlzIGJlIHRlc3RlZCBvbiBxZW11LXN5c3RlbS1vcjFrPyBJZiBz
bywgaXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSB0aGlzCj4gZG9jdW1lbnRlZCBpbi10cmVlLCBz
byBmdXR1cmUgY2hhbmdlcyBjb3VsZCBiZSB0ZXN0ZWQuCgpTdXJlLCBJIHdpbGwgdHJ5IHRvIGdl
dCBpdCB3b3JraW5nLiAgRm9yIHNvbWUgcmVhc29uIHFlbXUgd2FzIGdldHRpbmcgaHVuZy4KCkdp
dmUgbWUgYSBmZXcgZGF5cy4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
