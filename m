Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E6E8B9719D
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9DEC220116;
	Wed, 21 Aug 2019 07:30:47 +0200 (CEST)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by mail.librecores.org (Postfix) with ESMTPS id 047C620417
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 11:00:37 +0200 (CEST)
Received: by mail-ot1-f66.google.com with SMTP id c7so999862otp.1
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 02:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmtPnJSRI0zndYON4lQ0lxZkTiNZNjENxpxxDRXsGjM=;
 b=fk1yni33m6AOJZifXrrEZ42NqCyRdZOpsLu489dVxKvOL9eMl8n/v+FQTe4mk/r3Z2
 Ebt1GbwvKFKouapQO0eHjuHRupIN6QMZ/rNUQ67/ulFngYF9Tp3kPnBnpS4pgcy6uBPp
 yPckwX1X5QxKXNtUT7d8oOycLOvt9/kY8ZvlVgVaFC+IY2V8fTmR3SYF6qX/bEsSSmc+
 KjRSoy8BHDBnMUrSe/rj9HzHRsjjdW4a9PqNKqpryy/OpR0LfantZhAGQDCRVZIqbgAO
 Y55cIX+fPsHiCTpxreHw7Tk8ECg8nh8e91fkuca7qOEWv9GD8Tx4OtP4wmEby8EEbz/N
 6UBQ==
X-Gm-Message-State: APjAAAXi8nWpfyaDeT6bI7BScVjLMRvioJI6eDY4qgpZTXFh/ig7/uxl
 t9MUw2Qpbp4of2S6Cv72vhip1SZfYOR0U8zCFAY=
X-Google-Smtp-Source: APXvYqwhI3T2oGgeZwLOQSfvRhaXT1jrSgi6r47r+Se5hS7KcKzZEqkkqP7EFf8wTbDzFidtX+J78UJ3IrYCTcoWc4g=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr17294497oto.250.1566205235743; 
 Mon, 19 Aug 2019 02:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-19-hch@lst.de>
In-Reply-To: <20190817073253.27819-19-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 11:00:24 +0200
Message-ID: <CAMuHMdWjAUMc_G1AUE_dgbrUn3qm4th+jiG3NJwperDVHdcoSw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 18/26] m68k: rename __iounmap and mark it
 static
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgOTo0OSBBTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gbTY4ayB1c2VzIF9faW91bm1hcCBhcyB0aGUg
bmFtZSBmb3IgYW4gaW50ZXJuYWwgaGVscGVyIHRoYXQgaXMgb25seQo+IHVzZWQgZm9yIHNvbWUg
Q1BVIHR5cGVzLiAgTWFyayBpdCBzdGF0aWMgYW5kIGdpdmUgaXQgYSBiZXR0ZXIgbmFtZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL202OGsvbW0va21hcC5jCj4gKysrIGIvYXJjaC9t
NjhrL21tL2ttYXAuYwo+IEBAIC01Miw2ICs1Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmcmVl
X2lvX2FyZWEodm9pZCAqYWRkcikKPgo+ICAjZGVmaW5lIElPX1NJWkUgICAgICAgICAgICAgICAg
KDI1NioxMDI0KQo+Cj4gK3N0YXRpYyB2b2lkIF9fZnJlZV9pb19hcmVhKHZvaWQgKmFkZHIsIHVu
c2lnbmVkIGxvbmcgc2l6ZSk7Cj4gIHN0YXRpYyBzdHJ1Y3Qgdm1fc3RydWN0ICppb2xpc3Q7Cj4K
PiAgc3RhdGljIHN0cnVjdCB2bV9zdHJ1Y3QgKmdldF9pb19hcmVhKHVuc2lnbmVkIGxvbmcgc2l6
ZSkKPiBAQCAtOTAsNyArOTEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZnJlZV9pb19hcmVhKHZv
aWQgKmFkZHIpCj4gICAgICAgICAgICAgICAgIGlmICh0bXAtPmFkZHIgPT0gYWRkcikgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICpwID0gdG1wLT5uZXh0Owo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIHJlbW92ZSBnYXAgYWRkZWQgaW4gZ2V0X2lvX2FyZWEoKSAqLwo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIF9faW91bm1hcCh0bXAtPmFkZHIsIHRtcC0+c2l6ZSAtIElPX1NJWkUp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fZnJlZV9pb19hcmVhKHRtcC0+YWRkciwgdG1w
LT5zaXplIC0gSU9fU0laRSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUodG1wKTsK
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICAgICAgICAgIH0KPiBA
QCAtMjQ5LDEyICsyNTAsMTMgQEAgdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqYWRkcikKPiAg
fQo+ICBFWFBPUlRfU1lNQk9MKGlvdW5tYXApOwo+Cj4gKyNpZm5kZWYgQ1BVX002ODA0MF9PUl9N
NjgwNjBfT05MWQoKQ2FudCB5b3UgbW92ZSB0aGlzIGJsb2NrIHVwLCB0byBhdm9pZCBhZGRpbmcg
bW9yZSAjaWZkZWYgY2x1dHRlcnk/ClRoZSByZXN0IGxvb2tzIGdvb2QgdG8gbWUuCgo+ICAvKgo+
IC0gKiBfX2lvdW5tYXAgdW5tYXBzIG5lYXJseSBldmVyeXRoaW5nLCBzbyBiZSBjYXJlZnVsCj4g
KyAqIF9fZnJlZV9pb19hcmVhIHVubWFwcyBuZWFybHkgZXZlcnl0aGluZywgc28gYmUgY2FyZWZ1
bAo+ICAgKiBDdXJyZW50bHkgaXQgZG9lc24ndCBmcmVlIHBvaW50ZXIvcGFnZSB0YWJsZXMgYW55
bW9yZSBidXQgdGhpcwo+ICAgKiB3YXNuJ3QgdXNlZCBhbnl3YXkgYW5kIG1pZ2h0IGJlIGFkZGVk
IGxhdGVyLgo+ICAgKi8KPiAtdm9pZCBfX2lvdW5tYXAodm9pZCAqYWRkciwgdW5zaWduZWQgbG9u
ZyBzaXplKQo+ICtzdGF0aWMgdm9pZCBfX2ZyZWVfaW9fYXJlYSh2b2lkICphZGRyLCB1bnNpZ25l
ZCBsb25nIHNpemUpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlydGFkZHIgPSAodW5z
aWduZWQgbG9uZylhZGRyOwo+ICAgICAgICAgcGdkX3QgKnBnZF9kaXI7Cj4gQEAgLTI5Nyw2ICsy
OTksNyBAQCB2b2lkIF9faW91bm1hcCh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4K
PiAgICAgICAgIGZsdXNoX3RsYl9hbGwoKTsKPiAgfQo+ICsjZW5kaWYgLyogQ1BVX002ODA0MF9P
Ul9NNjgwNjBfT05MWSAqLwo+Cj4gIC8qCj4gICAqIFNldCBuZXcgY2FjaGUgbW9kZSBmb3Igc29t
ZSBrZXJuZWwgYWRkcmVzcyBzcGFjZS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
