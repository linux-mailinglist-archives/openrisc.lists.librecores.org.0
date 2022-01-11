Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABD448B934
	for <lists+openrisc@lfdr.de>; Tue, 11 Jan 2022 22:12:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2F11324778;
	Tue, 11 Jan 2022 22:12:42 +0100 (CET)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mail.librecores.org (Postfix) with ESMTPS id 3B154202A8
 for <openrisc@lists.librecores.org>; Tue, 11 Jan 2022 22:12:40 +0100 (CET)
Received: by mail-pl1-f175.google.com with SMTP id t18so691829plg.9
 for <openrisc@lists.librecores.org>; Tue, 11 Jan 2022 13:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sHIrLuWSttD4lmfZ9Q8HhbdiLbHiGuhFTojquYXKcA0=;
 b=fNoM72BJOADBZrfkcZR2kFweu7XYah6CaTKDHnvkleM4auBTmmlsE5Pkscb5JTVK75
 6MgHTAz6RXt/80FxFsPoPFGnyyXwQL6qa3qRAkEoUMSiUEWP9jqS6DoRfJwrxHcqYGt5
 JKZml3WD650oQTKOJ6kLrlT/5hilSRpqNDF+MoAD98Fp7IMy6e/yNS++xqxwcdw1IIR4
 Ox2cvnvE/QxC9Kt2Knd1QN6oBXcIDgQegdj19fCsbzLFQsZCP1DA5c7nohfd9ble18hR
 PA1WYdAi+i5y7ddD9u/SANIpmJD6zXQnZD4Lh27qVlJs44ePzx8H+PuC2++O3aS9LsTL
 +qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHIrLuWSttD4lmfZ9Q8HhbdiLbHiGuhFTojquYXKcA0=;
 b=HmfBZ9JKx/OOZH9rh79iPfvWizGtQtHY4wZH0SV1EZFNyadUBNDb32lPIrGim2HoWR
 z6QthDBzeYmNfFL1VQqiKW4gjMCm0tAtyOn+dsHQ67I6GF9nSWqxseoImDcmrWRqYzyQ
 y/+0fjZND5IB9We4110WJDAB6ZAjbcesKGTUHs3/jsijsfUZpqzy/atohpHDP+uc9dBA
 JogEq+gENBOwPwmHcOP8o3Wnue6QlMnWROJJjJxLpO4It+TDoNw+E2BB/67B2zkDtrwB
 k3rXqJ/+eoOANucle9yH8sNwJYj5NHsLlAwqCzG+9qvIfQuKByn9F+SW5q387e5DdMY8
 O/Wg==
X-Gm-Message-State: AOAM530TWOcgFgs3Tu5vDQ+Cnt0Xv02BfztZa/YAWoLqOOqQ6o+lVcBu
 +T2ot4Rz2YU+0ntTDlAhO8E=
X-Google-Smtp-Source: ABdhPJxxSpK9L+cVEjOtSqpwT/SvuTp7xmQuCE6EPRu0m4WF+SEtKmuZHoQoYXopsaa18qeWmEAENg==
X-Received: by 2002:a05:6a00:1582:b0:4ba:e636:391 with SMTP id
 u2-20020a056a00158200b004bae6360391mr6387750pfk.55.1641935558715; 
 Tue, 11 Jan 2022 13:12:38 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id g11sm1269385pfv.136.2022.01.11.13.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 13:12:37 -0800 (PST)
Date: Wed, 12 Jan 2022 06:12:36 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <Yd3yxCPpK81psViU@antec>
References: <20220111030055.2043568-1-shorne@gmail.com>
 <CAMuHMdUUShmJfRWUCS+CQ_OUW9cUHuZQS3aTPznt-i+TT0Tgtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUShmJfRWUCS+CQ_OUW9cUHuZQS3aTPznt-i+TT0Tgtw@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: init: Add support for common clk
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
Cc: Jonas Bonn <jonas@southpole.se>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Gabriel Somlo <gsomlo@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKYW4gMTEsIDIwMjIgYXQgMDU6MzE6MDVQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+IE9uIFR1ZSwgSmFuIDExLCAyMDIyIGF0IDQ6
MDEgQU0gU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gV2hlbiB0
ZXN0aW5nIHRoZSBuZXcgbGl0ZXhfbW1jIGRyaXZlciBpdCB3YXMgZm91bmQgdG8gbm90IHdvcmsg
b24KPiA+IE9wZW5SSVNDIGR1ZSB0byBtaXNzaW5nIHN1cHBvcnQgZm9yIGNvbW1vbiBjbGsuICBU
aGlzIHBhdGNoIGRvZXMgdGhlCj4gPiBiYXNpYyBpbml0aWFsaXphdGlvbiB0byBhbGxvdyBPcGVu
UklTQyB0byB1c2UgdGhlIGNvbW1vbiBjbGsgZnJhbWV3b3JrLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IAo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCEKPiAKPiBUaGlzIG1hdGNoZXMgd2hhdCBvdGhlciBhcmNoaXRlY3R1cmVzIGFyZSBk
b2luZywgYW5kIGlzIElNSE8gdGhlIHdheQo+IGZvcndhcmQgZm9yIHNoYXJpbmcgRlBHQSBkcml2
ZXJzIGFtb25nIGFyY2hpdGVjdHVyZXMuCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpUaGFuayB5b3UuCgotU3RhZmZvcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
