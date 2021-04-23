Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 526B6369BF4
	for <lists+openrisc@lfdr.de>; Fri, 23 Apr 2021 23:19:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E65A22127C;
	Fri, 23 Apr 2021 23:19:45 +0200 (CEST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mail.librecores.org (Postfix) with ESMTPS id 7AE7620DD5
 for <openrisc@lists.librecores.org>; Fri, 23 Apr 2021 23:19:43 +0200 (CEST)
Received: by mail-pf1-f169.google.com with SMTP id w6so20336038pfc.8
 for <openrisc@lists.librecores.org>; Fri, 23 Apr 2021 14:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WAO+nTeTFKCXmHl+vp74ehdsr2jzD+Il2HojC2vivp4=;
 b=jh3E0F9cmHHV45i2iz4jSxo6rNeP1zus8z7oJn9SUycV0Qwp/5hqJ6LIJsCaGM5azq
 0j4/pX8V/HNvmN3TQcgtlvCWt5l7I05gNF2CImlB4N0UnWK0RBoe7UGB/GKi3cF02Et8
 s/8ILNzGnE/1JyxtRr919BrJZc/2ZOxe/stWx7HHzDxJFfmABIgxNjbKCwBq/h+ZTPtN
 sCzAgUtJSiXsLpfjUNH8RZPI7kImn3S7zT0jUNr2Bv4oGPWAs7mkhaia9TMELq6YCKNg
 3esi8HjeOyeHnmCk9h1kQzG61G0TVi+6DFxepUsPo9cdET7YCwVw++0hE421c5V0q9dN
 7n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WAO+nTeTFKCXmHl+vp74ehdsr2jzD+Il2HojC2vivp4=;
 b=ERk6T9+n6ZXoDCgwrEASXBbQxzxY/WgWIbS6wAQc95UtuIcomcq/ceUQHP5s0xRuJE
 5vrFeBLKHFAlqnl1UrRLShKymNxNPzo1RN3V8J/zSvBKvl0ViHwPRoHxxa4p/t81HuMK
 QAE1FslIIva3UHj0KG1kKaJ0/36LCC9FQKrpEC7+kslvOdkzuqO/VT91J5q0KTTPYdc4
 9J7e5jkN/kYpjU+CjZrxvB/AQnIdNB+IwMtI32LmzmssKWX5x85I0duJF8dXp40PZfb/
 y7Ri2Nksy0OrysvsQwFbdi0Y1TljbmKs6ewchPQnjfIsEolyPX5/f8s/WhFvTvq1bjWf
 MNAQ==
X-Gm-Message-State: AOAM530yh1e8AedwCj417wtviPDp28YOEIXNWGKseXDXZIzTnJxBQ88a
 sIZjubIWvs/7kE7wZVO/nc4=
X-Google-Smtp-Source: ABdhPJwgDjseqFJlZ7o7q9LGMWZO9BTmSGr0Y6iCXKAXi19G4EFyrcnl6ZWfwKsgNo8LSmW07YWeTA==
X-Received: by 2002:a63:5626:: with SMTP id k38mr5878365pgb.128.1619212781788; 
 Fri, 23 Apr 2021 14:19:41 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 d17sm5339384pfn.60.2021.04.23.14.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 14:19:41 -0700 (PDT)
Date: Sat, 24 Apr 2021 06:19:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20210423211939.GP3288043@lianli.shorne-pla.net>
References: <c078439e31fd60e1617be8c17cc1ec57639e0586.1619190470.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c078439e31fd60e1617be8c17cc1ec57639e0586.1619190470.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix a memory leak
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
Cc: jonas@southpole.se, arnd@arndb.de, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDU6MDk6MjhQTSArMDIwMCwgQ2hyaXN0b3BoZSBKQUlM
TEVUIHdyb3RlOgo+ICdzZXR1cF9maW5kX2NwdV9ub2RlKCknIHRha2UgYSByZWZlcmVuY2Ugb24g
dGhlIG5vZGUgaXQgcmV0dXJucy4KPiBUaGlzIHJlZmVyZW5jZSBtdXN0IGJlIGRlY3JlbWVudGVk
IHdoZW4gbm90IG5lZWRlZCBhbnltb3JlLCBvciB0aGVyZSB3aWxsCj4gYmUgYSBsZWFrLgo+IAo+
IEFkZCB0aGUgbWlzc2luZyAnb2Zfbm9kZV9wdXQoY3B1KScuCj4gCj4gTm90ZSB0aGF0ICdzZXR1
cF9jcHVpbmZvKCknIHRoYXQgYWxzbyBjYWxscyB0aGlzIGZ1bmN0aW9uIGFscmVhZHkgaGFzIGEK
PiBjb3JyZWN0ICdvZl9ub2RlX3B1dChjcHUpJyBhdCBpdHMgZW5kLgoKVGhhbmtzLCB0aGlzIGxv
b2tzIGdvb2QgdG8gbWUuICBJIHdpbGwgcXVldWUgaXQgdXAuCgo+IEZpeGVzOiA5ZDAyYTQyODNl
OWMgKCJPcGVuUklTQzogQm9vdCBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpB
SUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+IC0tLQo+ICBhcmNoL29wZW5y
aXNjL2tlcm5lbC9zZXR1cC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgYi9hcmNo
L29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gaW5kZXggMjQxNmE5ZjkxNTMzLi5jNmY5ZTdiOWY3
Y2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiBAQCAtMjc4LDYgKzI3OCw4IEBAIHZvaWQgY2Fs
aWJyYXRlX2RlbGF5KHZvaWQpCj4gIAlwcl9jb250KCIlbHUuJTAybHUgQm9nb01JUFMgKGxwaj0l
bHUpXG4iLAo+ICAJCWxvb3BzX3Blcl9qaWZmeSAvICg1MDAwMDAgLyBIWiksCj4gIAkJKGxvb3Bz
X3Blcl9qaWZmeSAvICg1MDAwIC8gSFopKSAlIDEwMCwgbG9vcHNfcGVyX2ppZmZ5KTsKPiArCj4g
KwlvZl9ub2RlX3B1dChjcHUpOwo+ICB9Cj4gIAo+ICB2b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNo
YXIgKipjbWRsaW5lX3ApCj4gLS0gCj4gMi4yNy4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
