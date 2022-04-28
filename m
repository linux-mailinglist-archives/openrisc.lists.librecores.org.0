Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC4C5132EB
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 13:55:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C9A47248C9;
	Thu, 28 Apr 2022 13:55:56 +0200 (CEST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mail.librecores.org (Postfix) with ESMTPS id 3D05324165
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 13:55:55 +0200 (CEST)
Received: by mail-pg1-f176.google.com with SMTP id q76so746204pgq.10
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 04:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nNaL4oWbSaoZkugEaXO//WHohZesy6t6T5egzcvNBJU=;
 b=UE5paQOXIHvF+isxo/nkvMlIFVMoOhZoeSphPe2amLG90ZyGcyfxpF4r3SAfjM3I3l
 FSYZoVv6EmF4O+hzZ60QiNtYcspZ6TeKJAQsXgKt7PBF7yzn9IpVuWAbQ4TKvgAlrRRR
 tJHf/NwVNB+it9VNHHhpIpA99ZfIfetWmM6au/TMlwiZizoHaLGf5eQOwUwViLrN7vpN
 yR8tqWZCedbNBJt5wGh+Zw2Rg35LZgIpwIArw3gZtoARF0DZlPZHGyLrIaQLJAwqM0PK
 AHUPTFgemhWKs6bzsmiZi0rIG9eshdOgu0rbj+uJFTxf6sA5ZTFLNPC1L74aSxUB6D3U
 r7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNaL4oWbSaoZkugEaXO//WHohZesy6t6T5egzcvNBJU=;
 b=JwESIp8gUIOJUUu7g2r01Mk+uribmWidTtQlm8pPwgJlYVUKWz7DKcfTD0ekJQm4rP
 r+Amp5yMsT1mdSZgr/kM8BbmL9L34Oh5lV2MZk/TRmTbT/EYFujH8NVJWYWsiunNVIDE
 xqkeJJ7HpMSkz8fGJo2BZtC2EhPkaTaiya3AH/eHf43LkkC3b6v+gM6qfB9ORhJdHgM+
 23qwC8xss1hsBxfANREPlkYGOdlSORPEmsM+ZBcK4CBslWe2Bpinj+5Qqtmf7i0XWk4U
 ie0uvehEysYQfEeSdIGqzVg0Yuj8x2fFLOn2PB/bRYO6j0GQM63566veea3+H/z4fgTD
 9zVg==
X-Gm-Message-State: AOAM533gjxm5PNS4aa3fqY5bXtJGxuBI9aCCcGgLliPT5KBlePdIxw/E
 hHtM4UpJZvOUmu87VCwbrf8=
X-Google-Smtp-Source: ABdhPJxM4TdmZDJGCeZu3o4bX2/jcid6E3rTBlyeeKlcZ3F9o6XszzHtsfq7fRTAYiVk6TSn/Uvebg==
X-Received: by 2002:a62:5ec6:0:b0:50d:a467:3cb7 with SMTP id
 s189-20020a625ec6000000b0050da4673cb7mr569675pfb.85.1651146953687; 
 Thu, 28 Apr 2022 04:55:53 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a17090a064200b001cd498dc152sm12244744pje.2.2022.04.28.04.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:55:53 -0700 (PDT)
Date: Thu, 28 Apr 2022 20:55:51 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <YmqAx31dtXCaNn7R@antec>
References: <20220428111139.1330966-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428111139.1330966-1-Jason@zx2c4.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: define nop command for simulator
 reboot
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDE6MTE6MzlQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IFRoZSBzaW11bGF0b3IgZGVmaW5lcyBgbC5ub3AgMWAgZm9yIHNodXRkb3du
LCBidXQgZG9lc24ndCBoYXZlIGFueXRoaW5nCj4gZm9yIHJlYm9vdC4gVXNlIDEzIGZvciB0aGlz
LCB3aGljaCBpcyBjdXJyZW50bHkgdW51c2VkLCBkdWJiZWQKPiBgTk9QX1JFQk9PVGAuCj4gCj4g
Q2M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IENjOiBQZXRlciBNYXlkZWxs
IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL1ltbmFEVXBWSTVpaGd2ZzZAengyYzQuY29tLwo+IFNpZ25lZC1vZmYtYnk6IEphc29u
IEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPgo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL2tl
cm5lbC9wcm9jZXNzLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9v
cGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggM2MwYzkxYmNkY2JhLi40Y2NlOTVmYTZl
YjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gKysrIGIv
YXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTUyLDYgKzUyLDggQEAgdm9pZCBt
YWNoaW5lX3Jlc3RhcnQoY2hhciAqY21kKQo+ICB7Cj4gIAlkb19rZXJuZWxfcmVzdGFydChjbWQp
Owo+ICAKPiArCV9fYXNtX18oImwubm9wIDEzIik7Cj4gKwo+ICAJLyogR2l2ZSBhIGdyYWNlIHBl
cmlvZCBmb3IgZmFpbHVyZSB0byByZXN0YXJ0IG9mIDFzICovCj4gIAltZGVsYXkoMTAwMCk7Cj4g
IAo+IC0tIAo+IDIuMzUuMQoKVGhpcyBzZWVtcyBmYWlyLCBwcm9iYWJseSBpdCB3b3VsZCBiZSBn
b29kIHRvIGhhdmUgYSBjb21tZW50IG1lbnRpb25pbm1nIHdoYXQKdGhlIG5vcCBpcyBmb3IsIGZ5
aSBmb3IgY29udGV4dCB0aGVzZSBhcmUgdGhlIG5vcCBudW1iZXJzIHVzZWQgdG8gY29udHJvbApz
aW11bGF0aW9ucy4KCiAgICAjZGVmaW5lIE5PUF9OT1AgICAgICAgICAgMHgwMDAwICAgICAgLyog
Tm9ybWFsIG5vcCBpbnN0cnVjdGlvbiAqLwogICAgI2RlZmluZSBOT1BfRVhJVCAgICAgICAgIDB4
MDAwMSAgICAgIC8qIEVuZCBvZiBzaW11bGF0aW9uICovCiAgICAjZGVmaW5lIE5PUF9SRVBPUlQg
ICAgICAgMHgwMDAyICAgICAgLyogU2ltcGxlIHJlcG9ydCAqLwogICAgLyojZGVmaW5lIE5PUF9Q
UklOVEYgICAgICAgMHgwMDAzICAgICAgIFNpbXByaW50ZiBpbnN0cnVjdGlvbiAob2Jzb2xldGUp
Ki8KICAgICNkZWZpbmUgTk9QX1BVVEMgICAgICAgICAweDAwMDQgICAgICAvKiBKUEI6IFNpbXB1
dGMgaW5zdHJ1Y3Rpb24gKi8KICAgICNkZWZpbmUgTk9QX0NOVF9SRVNFVCAgICAweDAwMDUgICAg
ICAvKiBSZXNldCBzdGF0aXN0aWNzIGNvdW50ZXJzICovCiAgICAjZGVmaW5lIE5PUF9HRVRfVElD
S1MgICAgMHgwMDA2ICAgICAgLyogSlBCOiBHZXQgIyB0aWNrcyBydW5uaW5nICovCiAgICAjZGVm
aW5lIE5PUF9HRVRfUFMgICAgICAgMHgwMDA3ICAgICAgLyogSlBCOiBHZXQgcGljb3NlY3MvY3lj
bGUgKi8KICAgICNkZWZpbmUgTk9QX1RSQUNFX09OICAgICAweDAwMDggICAgICAvKiBUdXJuIG9u
IHRyYWNpbmcgKi8KICAgICNkZWZpbmUgTk9QX1RSQUNFX09GRiAgICAweDAwMDkgICAgICAvKiBU
dXJuIG9mZiB0cmFjaW5nICovCiAgICAjZGVmaW5lIE5PUF9SQU5ET00gICAgICAgMHgwMDBhICAg
ICAgLyogUmV0dXJuIDQgcmFuZG9tIGJ5dGVzICovCiAgICAjZGVmaW5lIE5PUF9PUjFLU0lNICAg
ICAgMHgwMDBiICAgICAgLyogUmV0dXJuIG5vbi16ZXJvIGlmIHRoaXMgaXMgT3Ixa3NpbSAqLwog
ICAgI2RlZmluZSBOT1BfRVhJVF9TSUxFTlQgIDB4MDAwYyAgICAgIC8qIEVuZCBvZiBzaW11bGF0
aW9uLCBxdWlldCB2ZXJzaW9uICovCiAgICAvKiBOZXchICovCiAgICAjZGVmaW5lIE5PUF9SRVNF
VCAgICAgICAgMHgwMDBkICAgICAgLyogUmVzZXQgdGhlIGNwdSAqLwoKSSB3aWxsIHF1ZXVlIHRo
aXMgb25jZSB3ZSB1cGRhdGUgdGhlIHNwZWMgdG8gZGVmaW5lIHNvbWUgb2YgdGhlc2UsIEkgYW0g
dGhpbmtpbmcKaWYgcWVtdSBzaG91bGQgYWxsb3cgZm9yIHRoZSBzaHV0ZG93biB0byB3b3JrIGlu
IHVzZXIgbW9kZS4KCkJUVywgYXJlIHlvdSB3b3JraW5nIHNwZWNpZmljYWxseSBvbiBvcGVucmlz
Yz8gT3IganVzdCBzZXR0aW5nIHVwIHRlc3QKZW52aXJvbm1lbnRzIGZvciBhbGwgYXJjaGl0ZWN0
dXJlcz8KCkFja2VkLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
