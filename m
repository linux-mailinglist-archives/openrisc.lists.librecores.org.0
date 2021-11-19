Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 20A12457942
	for <lists+openrisc@lfdr.de>; Sat, 20 Nov 2021 00:03:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B8E1B242B3;
	Sat, 20 Nov 2021 00:03:44 +0100 (CET)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id DD0BE24296
 for <openrisc@lists.librecores.org>; Sat, 20 Nov 2021 00:03:42 +0100 (CET)
Received: by mail-pj1-f50.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so9749591pjb.1
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 15:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FGe2hx05xiUhVtS3iBlXEfyPhqjn4II1X1cvQiNSVb0=;
 b=cTgf5xIECI3LqlahtD/TEqNccq7ESFLgcUb6Tq6dGvmejw2tEe/+W53vGW/kD+SXmA
 idT7hTN9LzZWet5ZaTTVPzQBIKUzMU7eGwbpT8ykMeKAhueyo+9mw9hrU9q/M/70A3Oe
 W7vhBRBUblckYmyfYRJycEZ9E2IPTEWf27e++2VDjDUe9k7FJid2UIY1ZtY0jC5IJiXp
 kbYoDbmnckiaYNzv44Xr7JGmH4n1ibJo9y7ElIeH9WdXovxm5BBzakePtMOALzA7QAD4
 KV2FFDZIFKe4tefQWN3CigISC57X1OR7c0dctYr7WNxn9WrfjssI4joYevC6+IBPj/qF
 /y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FGe2hx05xiUhVtS3iBlXEfyPhqjn4II1X1cvQiNSVb0=;
 b=AIZKKDZ+C8cVaJoaREP0cLEZhAYpJ2nhMebkOVamVFlrfGSLq/Z7IaBY4gmAwxa+kY
 Xv7+DfG917QUg5ip8gc0kMiNXfhNJHctK11AViLrERhr0ZnKHWYCnnhvwfqbDMBQnone
 ONxtRGOOdnIa+giNqKONDKvU7wt35hUAlqdSBxXXjd2ivQGiIuYEjt+O0+zR16Kw3SUC
 Y03ka2+Wyf72gdoefcIcXqmfjpb0TuiUx51sD79Up21cfeHq8MiYia/W4Z/50UfckS6/
 gJd3jxM/8jfLBXqwhSzIh0S0ewr+XR1tPItmpxJi/PlcOOIEi8uxmTyOpPGK8SRqYdX2
 BvqA==
X-Gm-Message-State: AOAM533glCPBRiaU9/vkuNwMCV8LqOdGj6nR2xmYM8Ie8G3x3BgxCYyx
 deHPDUYmz8sjL2qCs3UH5q0=
X-Google-Smtp-Source: ABdhPJznOPiO0eTqzSSdNkMTu/ElG9CuKzWvEJcT26VeL9rhu7di5UeQeL6sPMOgLj17mtvqcFnxfw==
X-Received: by 2002:a17:90a:7086:: with SMTP id
 g6mr4321545pjk.34.1637363021084; 
 Fri, 19 Nov 2021 15:03:41 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id f8sm679567pfv.135.2021.11.19.15.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 15:03:40 -0800 (PST)
Date: Sat, 20 Nov 2021 08:03:38 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YZgtSoIRAiH/Xjjt@antec>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-6-shorne@gmail.com>
 <alpine.DEB.2.22.394.2111182219580.1393807@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2111182219580.1393807@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v2 05/13] or1k: Thread Local Storage support
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

T24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMTA6MjI6MjNQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIFNhdCwgMTMgTm92IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9kbC10bHMuaCBiL3N5c2Rl
cHMvb3Ixay9kbC10bHMuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAw
MDAwMDAuLmYyNTY0NWM3MTUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3N5c2RlcHMvb3Ix
ay9kbC10bHMuaAo+ID4gQEAgLTAsMCArMSwyNiBAQAo+ID4gKy8qIENvcHlyaWdodCAoQykgMjAy
MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KPiAKPiBFYWNoIGZpbGUgc2hvdWxkIGhh
dmUgYSBvbmUtbGluZSBkZXNjcmlwdGlvbiBvbiB0aGUgbGluZSBiZWZvcmUgdGhlIAo+IGNvcHly
aWdodCBub3RpY2UuCgpPSywgSSB3ZW50IHRocm91Z2ggdGhlIHBhdGNoJ3MgYW5kIG1hZGUgc3Vy
ZSBJIGhhdmUgdGhpcyBvbiBhbGwgLmMgLmggYW5kIC5TCmZpbGVzLgoKPiA+IGRpZmYgLS1naXQg
YS9zeXNkZXBzL29yMWsvbGliYy10bHMuYyBiL3N5c2RlcHMvb3Ixay9saWJjLXRscy5jCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uNDM1NzE5NDRkZAo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvc3lzZGVwcy9vcjFrL2xpYmMtdGxzLmMKPiA+IEBAIC0w
LDAgKzEsMzIgQEAKPiA+ICsvKiBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uLCBJbmMuCj4gCj4gTGlrZXdpc2UuCj4gCj4gPiBkaWZmIC0tZ2l0IGEvc3lzZGVwcy9v
cjFrL3N0YWNraW5mby5oIGIvc3lzZGVwcy9vcjFrL3N0YWNraW5mby5oCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMTRlNzY3YzViZgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvc3lzZGVwcy9vcjFrL3N0YWNraW5mby5oCj4gPiBAQCAtMCwwICsxLDMz
IEBACj4gPiArLyogQ29weXJpZ2h0IChDKSAyMDIxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwg
SW5jLgo+IAo+IExpa2V3aXNlLgo+IAo+ID4gKy8qIERlZmF1bHQgdG8gYW4gZXhlY3V0YWJsZSBz
dGFjay4gIFBGX1ggY2FuIGJlIG92ZXJyaWRkZW4gaWYgUFRfR05VX1NUQUNLIGlzCj4gPiArICog
cHJlc2VudCwgYnV0IGl0IGlzIHByZXN1bWVkIGFic2VudC4gICovCj4gCj4gV2UgZG9uJ3QgdXNl
ICcqJyBhdCB0aGUgc3RhcnQgb2Ygc2Vjb25kIGFuZCBzdWJzZXF1ZW50IGxpbmVzIG9mIGNvbW1l
bnRzLgoKT0ssIEkgd2VudCB0aHJvdWdoIHRoZSBwYXRjaCBhbmQgdHJpZWQgdG8gc29ydCBhbGwg
b2YgdGhlc2Ugb2NjdXJhbmNlcyBvdXQuCkFsc28gdGhlcmUgd2VyZSBhIGZldyB3aGVyZSB3ZSBk
aWRuJ3QgaGF2ZSB0d28gc3BhY2VzIGFmdGVyIHBlcmlvZCAiLiIuIEFsc28sIGEKZmV3IG90aGVy
IHNpbWlsYXIgaXNzdWVzLgoKPiAoSXQgc2VlbXMgdW5mb3J0dW5hdGUgZm9yIGEgbmV3IHBvcnQg
dG8gZGVmYXVsdCB0byBleGVjdXRhYmxlIHN0YWNrcywgYnV0IAo+IGl0IGxvb2tzIGxpa2UgdGhp
cyBpcyBpbmRlZWQgd2hhdCB0aGUgTGludXgga2VybmVsIHBvcnQgdG8gT3BlblJJU0MgZG9lcywg
Cj4gZ2l2ZW4gdGhlIGxhY2sgb2YgYW4gb3ZlcnJpZGUgb2YgdGhlIGRlZmF1bHQgVk1fREFUQV9E
RUZBVUxUX0ZMQUdTIGFuZCAKPiBWTV9TVEFDS19ERUZBVUxUX0ZMQUdTLikKClllcy4KClRoYW5r
cyBmb3IgcmV2aWV3aW5nLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
