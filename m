Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D025F309F0F
	for <lists+openrisc@lfdr.de>; Sun, 31 Jan 2021 22:27:59 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 741DC210FB;
	Sun, 31 Jan 2021 22:27:59 +0100 (CET)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mail.librecores.org (Postfix) with ESMTPS id 619F9210BB
 for <openrisc@lists.librecores.org>; Sun, 31 Jan 2021 22:27:57 +0100 (CET)
Received: by mail-pg1-f177.google.com with SMTP id o7so10690382pgl.1
 for <openrisc@lists.librecores.org>; Sun, 31 Jan 2021 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k5gknQGkGUzASx8c3sQWwxyHAwGAxQHJHYAYO85lVuM=;
 b=jR8CKT6tJsirIhnvYN4jIKMqMJ5kgouxgnU+gsy8J9L7J00WudqhIbr/bzhJlw8if6
 8rqEOkiJTqo+IUEsjxMzvLTMpeIuiILKnop7H0zgb6yn/nxI8QZU/hwP0Tb16TQFc/Y1
 JoTCtPYqRyM4irT6cuvt/Y62A7021eP1V7vjy8PV8eE7syjahvL4DJee9LzfePcBM0aR
 NwWRHIG1HENOyrubWckByn6zLfAz6tBXJ2HCs6O3hDPwh0kpFBD/QFwcHegvyiobuXI4
 ZjXvO0yoKPj1cZwHoVzCRr2uCZ1C5rzEXR8Z83y+NolssZfexd3s3A+5b5QD8/QOSBuR
 Lv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k5gknQGkGUzASx8c3sQWwxyHAwGAxQHJHYAYO85lVuM=;
 b=k1kiW2Jso1sUC3CeUebFMtTMPXrodScWfCHrIj/3iReSQ1ooT6LGgSxBKRNbEO61mK
 3Fg5KKSAdYQqd/YwtTwTtbp8HxIyXFz1K/TYJas2vNKTWd1YzcHAIFX8gUb0Q9Gr+JaJ
 8uzAc32ByYTXMF7NRj5vxS3nT5AvbtX3KNX0rf7lf/YwTWUxstbBvPPKsXQm1XSQnSQ9
 Sd9aCWyHwB5ja1SfmkFE9Gfb7wc4w8mXWUW3JP9sD5fEqPIbTgHrktXEp4kzCoOXRt2Q
 qNZSf5RiaCtZWJ/UyZAUpGsTveD5lU+s1zWttG4xkvc4VKCr0dtTjGlhUci8GmCWk0b3
 usGA==
X-Gm-Message-State: AOAM532wuS8yK62sUf4EClyCySVQvNPObitDiB4Tx6FY+hKKEi6MzyAY
 hdu9qLTf69xSLpOst+SX80w=
X-Google-Smtp-Source: ABdhPJzpmAvoiBMdL2XIITF8BpfFJkRXIBGtcZpfq2wf+YwUfFGAwfP3D5oSIIK87UmHHlj+TLIyYQ==
X-Received: by 2002:a05:6a00:148a:b029:1ae:6d20:fbb3 with SMTP id
 v10-20020a056a00148ab02901ae6d20fbb3mr13231343pfu.55.1612128475890; 
 Sun, 31 Jan 2021 13:27:55 -0800 (PST)
Received: from localhost (g186.222-224-165.ppp.wakwak.ne.jp. [222.224.165.186])
 by smtp.gmail.com with ESMTPSA id v9sm13175294pju.33.2021.01.31.13.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 13:27:55 -0800 (PST)
Date: Mon, 1 Feb 2021 06:27:52 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <20210131212752.GG2002709@lianli.shorne-pla.net>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
Subject: Re: [OpenRISC] [PATCH] openrisc: use device tree to determine
 present cpus
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
Cc: jonas@southpole.se, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBKYW4gMzEsIDIwMjEgYXQgMDk6MjI6MzFBTSArMDEwMCwgSmFuIEhlbnJpayBXZWlu
c3RvY2sgd3JvdGU6Cj4gT24gMzEvMDEvMjAyMSAwMDowMywgU3RhZmZvcmQgSG9ybmUgd3JvdGU6
Cj4gCj4gPiBUaGlzIGxvb2tzIGdvb2QsIG9uZSBzbWFsbCBjb21tZW50IGJlbG93LiAgQ2FuIHlv
dSBzZW5kIHRoZSBuZXh0IHBhdGNoIGFzIGEgdjI/Cj4gPiAKPiA+IFVzaW5nICdnaXQgZm9ybWF0
LXBhdGNoIC12MiAuLi4nCj4gCj4gU29ycnksIHdhcyBub3QgYXdhcmUgb2YgdGhhdCwgd2lsbCBk
byBiZXR0ZXIgbmV4dCB0aW1lIQo+IAo+ID4gU2hvdWxkIHdlIHdhcm4gb24gdGhlIGVsc2UgY2Fz
ZT8KPiAKPiBJIHRoaW5rIGl0IGlzIGZpbmUgZm9yIHRoZSBrZXJuZWwgdG8gaGF2ZSByb29tIGZv
ciBtb3JlIENQVXMgdGhhbiBhcmUKPiBhY3R1YWxseSBwcmVzZW50IChpLmUuIE5SX0NQVXMgPiBw
cmVzZW50X2NwdXMgaXMgT0spLiBPdGhlciBBcmNocyBkbyBub3QKPiBzaG93IGEgd2FybmluZyBp
biB0aGlzIGNhc2UgZWl0aGVyLCB0aGVyZWZvcmUgSSBhbHNvIG9taXR0ZWQgaXQuCgpGYWlyIGVu
b3VnaC4KClJldmlld2VkLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KCkkg
Y2FuIHF1ZXVlIHRoaXMgZm9yIDUuMTIgd2hlbiB5b3Ugc2VuZCB2Mi4KCi1TdGFmZm9yZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
