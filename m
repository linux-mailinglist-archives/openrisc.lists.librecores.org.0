Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB84832BA5D
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 21:25:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5EFCE20D7F;
	Wed,  3 Mar 2021 21:25:37 +0100 (CET)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mail.librecores.org (Postfix) with ESMTPS id B28D320D7F
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 21:25:35 +0100 (CET)
Received: by mail-pg1-f182.google.com with SMTP id p21so17210733pgl.12
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 12:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kE0k/LZextFeZjByoC+eteL6j8YDtFIuI9mLKXRdND8=;
 b=up/HToCopzQzTgRxIW8JFzJhSvV2PObh11iODapBuJNju/MIwG14EyX0qcyZZ6EbFD
 a+RVJlqwNwI79TkK8z4pcVXjKxVUrwlJCJ5rFLETJHlGyXjnUKjCK0IBwATo8uprVLfy
 orTD2vAOKuX4yQJrwszqPQJv36X1fodMbFVqhN9g3/gFFr0w/yZG9WUDHwdPzuMeZkRw
 WfTfe1OzFjOfr+3mKeNcO7xLJrRE2TdaT9X9jMO6nxNtE5Amp8xtzxotr++T7pJFk80Q
 d+2YmQBPscQHrJUkNf/BwDgSPSgnjmGDmuX/5HVrrJBawWfOkCKn3KTzvMvTQ7FUeFPc
 LGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kE0k/LZextFeZjByoC+eteL6j8YDtFIuI9mLKXRdND8=;
 b=Ulm3ZuvEBt2QkHSXyVzTMUoBTF7RSg2Bg6cst9nvEki4PTjYPmZE8CQhjQJGlew/oF
 XQlB3r2msOy0B9TG62sLka/kNo+Bf4wU6EnkcfL6lBvrjAlloX1YBnNS5PZNpox9ZPWE
 ThfOTtoe4ZloUIWFoLyjC8Fo2J5kyJowfpaLXkj8duXnT2qyvgCEldJqqdx7lILf0ccu
 UCtAai0Somy0I8AS5wLpUYlK1LtVQSK7Eliyoi+CQQi6BzXjPx81hkrQl9r4mAAv+Gbs
 g1gp8XHkqHcWZiM6FtXJ8eui1vV7yL874ntS7YvstvIsmye79N4fC+4m6P7nx4rAwgq7
 QAbg==
X-Gm-Message-State: AOAM531xhz6+jsygUQ3DUmvE2J1et7Va0AGdmuE1sTG79A1hBeMY4qtn
 aEVa7bzNRjHSwyQvXsUORag=
X-Google-Smtp-Source: ABdhPJxEtvtu0QFYGV8HwzCpj+xbR7H47uIjLMM8REOpql4LLIJ0Fhl6bhMlt4ilZuSLPre14Yv/bA==
X-Received: by 2002:aa7:8c49:0:b029:1ed:c1dc:4421 with SMTP id
 e9-20020aa78c490000b02901edc1dc4421mr587702pfd.43.1614803134104; 
 Wed, 03 Mar 2021 12:25:34 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id y1sm7752983pjr.3.2021.03.03.12.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 12:25:33 -0800 (PST)
Date: Thu, 4 Mar 2021 05:25:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210303202531.GH365039@lianli.shorne-pla.net>
References: <20210303135026.3450789-1-shorne@gmail.com>
 <57222afc-9d92-e52d-34d4-0737eff1ec82@pengutronix.de>
 <20210303141214.GG365039@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303141214.GG365039@lianli.shorne-pla.net>
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

T24gV2VkLCBNYXIgMDMsIDIwMjEgYXQgMTE6MTI6MTRQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gV2VkLCBNYXIgMDMsIDIwMjEgYXQgMDM6MDM6MTFQTSArMDEwMCwgQWhtYWQg
RmF0b3VtIHdyb3RlOgo+ID4gSGVsbG8gU3RhZmZvcmQsCj4gPiAKPiA+IE9uIDAzLjAzLjIxIDE0
OjUwLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+ID4gSGVsbG8sCj4gPiA+IAo+ID4gPiBUaGVz
ZSBhcmUgdGhlIHBhdGNoZXMgSSBjYW1lIHVwIHdpdGggdG8gZ2V0IHRoZSBzZXRqbXAvbG9uZ2pt
cCByb3V0aW5lcyB0byB3b3JrCj4gPiA+IG9uIE9wZW5SSVNDLiAgSXQgc2VlbXMgdG8gYmUgd29y
a2luZyB3ZWxsLgo+ID4gPiAKPiA+ID4gVGhlIHBhdGNoZXMgYXJlIG9uIGdpdGh1YiBoZXJlOgo+
ID4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vYmFyZWJveC90cmVlL29wZW5yaXNj
LWJ0aHJlYWQKPiA+ID4gCj4gPiA+IEkgaGFkIHRvIHJldmVydCBhIGNvbW1pdCB0byByZW1vdmUg
b3BlbnJpc2MgdG8gZG8gdGhpcyB3b3JrLCBJIGhvcGUgdGhhdCBjYW4gYmUKPiA+ID4gcmV2ZXJ0
ZWQuCj4gPiAKPiA+IEdyZWF0LiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSEKPiA+IENvdWxk
IHRoaXMgYmUgdGVzdGVkIG9uIHFlbXUtc3lzdGVtLW9yMWs/IElmIHNvLCBpdCB3b3VsZCBiZSBn
cmVhdCB0byBoYXZlIHRoaXMKPiA+IGRvY3VtZW50ZWQgaW4tdHJlZSwgc28gZnV0dXJlIGNoYW5n
ZXMgY291bGQgYmUgdGVzdGVkLgo+IAo+IFN1cmUsIEkgd2lsbCB0cnkgdG8gZ2V0IGl0IHdvcmtp
bmcuICBGb3Igc29tZSByZWFzb24gcWVtdSB3YXMgZ2V0dGluZyBodW5nLgo+IAo+IEdpdmUgbWUg
YSBmZXcgZGF5cy4KCkdvdCBpdCB3b3JraW5nIGFuZCBwb3N0ZWQgYSBzZXBhYXRlIHBhdGNoLiAg
SSB3aWxsIGFkZCBkb2N1bWVudGF0aW9uIGFzIHdlbGwsIGJ1dApoZXJlIGlzIHdoYXQgSSByYW4u
IEl0IHNob3VsZCBiZSBzaW1pbGFyIHRvIHdoYXQgSSBkb2N1bWVudGVkIG9uIHRoZSBxZW11IHdp
a2k6CgogIGh0dHBzOi8vd2lraS5xZW11Lm9yZy9Eb2N1bWVudGF0aW9uL1BsYXRmb3Jtcy9PcGVu
UklTQwoKICAgICQgL2hvbWUvc2hvcm5lL3dvcmsvb3BlbnJpc2MvcWVtdS9idWlsZC9vcjFrLXNv
ZnRtbXUvcWVtdS1zeXN0ZW0tb3IxayAtY3B1IG9yMTIwMCBcCiAgICAgIC1NIG9yMWstc2ltIFwK
ICAgICAgLWtlcm5lbCAvaG9tZS9zaG9ybmUvd29yay9vcGVucmlzYy9iYXJlYm94L2JhcmVib3gg
XAogICAgICAtbmV0IG5pYyAtbmV0IHRhcCxpZm5hbWU9dGFwMCxzY3JpcHQ9bm8sZG93bnNjcmlw
dD1ubyBcCiAgICAgIC1zZXJpYWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgXAogICAgICAtZ2RiIHRj
cDo6MTAwMDEgXAogICAgICAtbSAzMgoKICAgIGJhcmVib3ggMjAyMS4wMi4wLTAwMTIwLWc3NjNj
NmZlZTctZGlydHkgIzE0IFRodSBNYXIgNCAwNToxMzo1MSBKU1QgMjAyMQoKCiAgICBCb2FyZDog
b3Ixa3NpbQogICAgbWRpb19idXM6IG1paWJ1czA6IHByb2JlZAogICAgbWFsbG9jIHNwYWNlOiAw
eDAxYjgwMDAwIC0+IDB4MDFmN2ZmZmYgKHNpemUgNCBNaUIpCgogICAgSGl0IGFueSB0byBzdG9w
IGF1dG9ib290OiAgICAzCiAgICBiYXJlYm94QG9yMWtzaW06LwogICAgYmFyZWJveEBvcjFrc2lt
Oi8KICAgIGJhcmVib3hAb3Ixa3NpbTovIGJ0aHJlYWQgLXYKICAgIGJ0aHJlYWRfcHJpbnRlciB5
aWVsZCAjMQogICAgYnRocmVhZF9wcmludGVyIHlpZWxkICMyCiAgICBidGhyZWFkX3ByaW50ZXIg
eWllbGQgIzMKICAgIGJ0aHJlYWRfcHJpbnRlciB5aWVsZCAjNAogICAgOTk2MyBidGhyZWFkIHlp
ZWxkIGNhbGxzIGluIDFzCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
