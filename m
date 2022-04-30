Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5C315160D7
	for <lists+openrisc@lfdr.de>; Sun,  1 May 2022 00:46:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2CDE22481B;
	Sun,  1 May 2022 00:46:04 +0200 (CEST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mail.librecores.org (Postfix) with ESMTPS id 5FACA213FD
 for <openrisc@lists.librecores.org>; Sun,  1 May 2022 00:46:02 +0200 (CEST)
Received: by mail-pg1-f172.google.com with SMTP id q12so9094644pgj.13
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZuAdolkaQCq2NicEkVQdhF7k7X3iiqR76mQWbveRdYw=;
 b=j46SnpkMorDJS9YRsSfb59a1ZzS6FrQJt7v4iwZHp0tDEvzwKvIGAqJQ75veRQQI7y
 OG5yws4GnQSwj1IeIZxUV2WpF9HGXk9y5fjhHopdr2ZWWnvAFKeVwO3omGuukSfUWDW+
 M8GuQWQMB9VmBJjhcfdukWGfp9GELUDybM14Uv/I7kDIIYmJlLM2tH7V9mzXVYRd65CR
 M+qDIQUPaWV2PxzEKj+VduYMHJQMwXt3V9Vp56y5r7a9n6/+qjr5ZioG4NlpBm0D28JQ
 kbd7NLyCPSBbbrSyVHpdsaYSQCo/wXyVESKKUwkrJp+7riZmZnLsRtve8GnXNE8ngTji
 LKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZuAdolkaQCq2NicEkVQdhF7k7X3iiqR76mQWbveRdYw=;
 b=de4DFGchK6u+2rouSmI0ZxS/AM6IZpGMtHgt05NTr3NZLmdgMCxz15AyewaVJLa71l
 lfV3c1qlfiRfxNccJc6b2ssTQiMUFFOyGTchTFhQ7lDq00TvNxGV/iglp2+A60X5ZxL7
 N0Igj3eq5ItSEwR4v9Z8gAazWbiue85bCpuINFdsBW7AtIIvsNjXHvWPlJnYomsTItuf
 STHl2x1rYA6h/qnuQQvc/2RMMZUPYZkxJzO5633A5b4bt1y/BR5UkLYMyU2c35v+gXng
 hXrOCeM2jRoR0CQpDx8XYnYY421GQMexZ+BGSDOtPooO0eZRpC1VurPEl3WgyaZyQ0XQ
 7VnA==
X-Gm-Message-State: AOAM532c8JMYc28HGiSZGZFGnvZ0bXZTZiHQNkhVCFnasuyTNqdHhRhs
 H5/4LamO0GiwECwJSS9QCk4=
X-Google-Smtp-Source: ABdhPJyPeRzNourp0PknjsZhLuve1Bv4aN5XOascM+eWMjYUMxChKgBmRGZggeVYtR9HwPIzWPSQvw==
X-Received: by 2002:a65:684c:0:b0:3ab:7c9c:f648 with SMTP id
 q12-20020a65684c000000b003ab7c9cf648mr4427528pgt.562.1651358760908; 
 Sat, 30 Apr 2022 15:46:00 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 j17-20020aa783d1000000b0050dc7628166sm2011116pfn.64.2022.04.30.15.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 15:46:00 -0700 (PDT)
Date: Sun, 1 May 2022 07:45:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <Ym28JtltM3xzPA9Y@antec>
References: <20220428111139.1330966-1-Jason@zx2c4.com> <YmqAx31dtXCaNn7R@antec>
 <YmqLrDfbEGP659EO@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmqLrDfbEGP659EO@zx2c4.com>
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

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDI6NDI6MjBQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IE9uIFRodSwgQXByIDI4LCAyMDIyIGF0IDA4OjU1OjUxUE0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDE6MTE6MzlQ
TSArMDIwMCwgSmFzb24gQS4gRG9uZW5mZWxkIHdyb3RlOgo+ID4gPiBUaGUgc2ltdWxhdG9yIGRl
ZmluZXMgYGwubm9wIDFgIGZvciBzaHV0ZG93biwgYnV0IGRvZXNuJ3QgaGF2ZSBhbnl0aGluZwo+
ID4gPiBmb3IgcmVib290LiBVc2UgMTMgZm9yIHRoaXMsIHdoaWNoIGlzIGN1cnJlbnRseSB1bnVz
ZWQsIGR1YmJlZAo+ID4gPiBgTk9QX1JFQk9PVGAuCj4gPiA+IAo+ID4gPiBDYzogU3RhZmZvcmQg
SG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gPiA+IENjOiBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+Cj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9ZbW5hRFVwVkk1aWhndmc2QHp4MmM0LmNvbS8KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24g
QS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9vcGVu
cmlzYy9rZXJuZWwvcHJvY2Vzcy5jIHwgMiArKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYwo+ID4gPiBpbmRleCAz
YzBjOTFiY2RjYmEuLjRjY2U5NWZhNmViNSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvcHJvY2Vzcy5jCj4gPiA+ICsrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nl
c3MuYwo+ID4gPiBAQCAtNTIsNiArNTIsOCBAQCB2b2lkIG1hY2hpbmVfcmVzdGFydChjaGFyICpj
bWQpCj4gPiA+ICB7Cj4gPiA+ICAJZG9fa2VybmVsX3Jlc3RhcnQoY21kKTsKPiA+ID4gIAo+ID4g
PiArCV9fYXNtX18oImwubm9wIDEzIik7Cj4gPiA+ICsKPiA+ID4gIAkvKiBHaXZlIGEgZ3JhY2Ug
cGVyaW9kIGZvciBmYWlsdXJlIHRvIHJlc3RhcnQgb2YgMXMgKi8KPiA+ID4gIAltZGVsYXkoMTAw
MCk7Cj4gPiA+ICAKPiA+ID4gLS0gCj4gPiA+IDIuMzUuMQo+ID4gCj4gPiBUaGlzIHNlZW1zIGZh
aXIsIHByb2JhYmx5IGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIGNvbW1lbnQgbWVudGlvbmlu
bWcgd2hhdAo+ID4gdGhlIG5vcCBpcyBmb3IsIGZ5aSBmb3IgY29udGV4dCB0aGVzZSBhcmUgdGhl
IG5vcCBudW1iZXJzIHVzZWQgdG8gY29udHJvbAo+ID4gc2ltdWxhdGlvbnMuCj4gPiAKPiA+ICAg
ICAjZGVmaW5lIE5PUF9OT1AgICAgICAgICAgMHgwMDAwICAgICAgLyogTm9ybWFsIG5vcCBpbnN0
cnVjdGlvbiAqLwo+ID4gICAgICNkZWZpbmUgTk9QX0VYSVQgICAgICAgICAweDAwMDEgICAgICAv
KiBFbmQgb2Ygc2ltdWxhdGlvbiAqLwo+ID4gICAgICNkZWZpbmUgTk9QX1JFUE9SVCAgICAgICAw
eDAwMDIgICAgICAvKiBTaW1wbGUgcmVwb3J0ICovCj4gPiAgICAgLyojZGVmaW5lIE5PUF9QUklO
VEYgICAgICAgMHgwMDAzICAgICAgIFNpbXByaW50ZiBpbnN0cnVjdGlvbiAob2Jzb2xldGUpKi8K
PiA+ICAgICAjZGVmaW5lIE5PUF9QVVRDICAgICAgICAgMHgwMDA0ICAgICAgLyogSlBCOiBTaW1w
dXRjIGluc3RydWN0aW9uICovCj4gPiAgICAgI2RlZmluZSBOT1BfQ05UX1JFU0VUICAgIDB4MDAw
NSAgICAgIC8qIFJlc2V0IHN0YXRpc3RpY3MgY291bnRlcnMgKi8KPiA+ICAgICAjZGVmaW5lIE5P
UF9HRVRfVElDS1MgICAgMHgwMDA2ICAgICAgLyogSlBCOiBHZXQgIyB0aWNrcyBydW5uaW5nICov
Cj4gPiAgICAgI2RlZmluZSBOT1BfR0VUX1BTICAgICAgIDB4MDAwNyAgICAgIC8qIEpQQjogR2V0
IHBpY29zZWNzL2N5Y2xlICovCj4gPiAgICAgI2RlZmluZSBOT1BfVFJBQ0VfT04gICAgIDB4MDAw
OCAgICAgIC8qIFR1cm4gb24gdHJhY2luZyAqLwo+ID4gICAgICNkZWZpbmUgTk9QX1RSQUNFX09G
RiAgICAweDAwMDkgICAgICAvKiBUdXJuIG9mZiB0cmFjaW5nICovCj4gPiAgICAgI2RlZmluZSBO
T1BfUkFORE9NICAgICAgIDB4MDAwYSAgICAgIC8qIFJldHVybiA0IHJhbmRvbSBieXRlcyAqLwo+
ID4gICAgICNkZWZpbmUgTk9QX09SMUtTSU0gICAgICAweDAwMGIgICAgICAvKiBSZXR1cm4gbm9u
LXplcm8gaWYgdGhpcyBpcyBPcjFrc2ltICovCj4gPiAgICAgI2RlZmluZSBOT1BfRVhJVF9TSUxF
TlQgIDB4MDAwYyAgICAgIC8qIEVuZCBvZiBzaW11bGF0aW9uLCBxdWlldCB2ZXJzaW9uICovCj4g
PiAgICAgLyogTmV3ISAqLwo+ID4gICAgICNkZWZpbmUgTk9QX1JFU0VUICAgICAgICAweDAwMGQg
ICAgICAvKiBSZXNldCB0aGUgY3B1ICovCj4gCj4gUmlnaHQsIHRoYXQncyB3aGVyZSBJIGdvdCAx
MyBmcm9tLiBCeSB0aGUgd2F5LCB0aGUgLnRleCBmaWxlIG9ubHkKPiBtZW50aW9ucyBvbmVzIHVw
IHRvIDExLCBzbyBhdCBmaXJzdCBJIGNob3NlIDEyLCBhbmQgdGhlbiBzYXcgdGhpcyBmaWxlLgoK
QlRXLCBJIGhhdmUgcXVldWVkIHRoaXMgZm9yIDUuMTkuCgo+ID4gCj4gPiBJIHdpbGwgcXVldWUg
dGhpcyBvbmNlIHdlIHVwZGF0ZSB0aGUgc3BlYyB0byBkZWZpbmUgc29tZSBvZiB0aGVzZSwgSSBh
bSB0aGlua2luZwo+ID4gaWYgcWVtdSBzaG91bGQgYWxsb3cgZm9yIHRoZSBzaHV0ZG93biB0byB3
b3JrIGluIHVzZXIgbW9kZS4KPiA+IAo+ID4gQlRXLCBhcmUgeW91IHdvcmtpbmcgc3BlY2lmaWNh
bGx5IG9uIG9wZW5yaXNjPyBPciBqdXN0IHNldHRpbmcgdXAgdGVzdAo+ID4gZW52aXJvbm1lbnRz
IGZvciBhbGwgYXJjaGl0ZWN0dXJlcz8KPiAKPiBUcnlpbmcgdG8gZ2V0IE9wZW5SSVNDIHVwIG9u
IGh0dHBzOi8vYnVpbGQud2lyZWd1YXJkLmNvbS8gLiBUaGUgb3RoZXIKPiBhcmNoaXRlY3R1cmVz
IHdlcmUgc2ltcGxlLCBidXQgT3BlblJJU0MgaXMgcmVxdWlyaW5nIHNvbWUgd29yay4uLgoKVGhh
bmtzLCBhbnkgd29yayBpcyBhcHByZWNpYXRlZC4gIE5vdywgSSBhbSBnb2luZyB0byBnbyBhbmQg
cmVwbGFjZSBteSBvcGVuVlBOCnNldHVwIHdpdGggd2lyZWd1YXJkLgoKLVN0YWZmb3JkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
