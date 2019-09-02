Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 361A1A5632
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 14:35:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 179C620549;
	Mon,  2 Sep 2019 14:35:39 +0200 (CEST)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by mail.librecores.org (Postfix) with ESMTPS id DC4E320489
 for <openrisc@lists.librecores.org>; Mon,  2 Sep 2019 09:53:13 +0200 (CEST)
Received: by mail-ot1-f68.google.com with SMTP id z17so12739332otk.13
 for <openrisc@lists.librecores.org>; Mon, 02 Sep 2019 00:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXerReUtklcQDMDiAd2B7yy5/iYyeA9QfRGIULHn46Y=;
 b=KyzAq/DRdcwmS2D+SDonI+N1WvjuUNmBD97mhqUAvxJiqiKHk5sGqi0CRfukFkQhyH
 IkbvbLvy0LoQIr+vNTuQPx191jUCQrBr8V457y4NaW0HnMVEt0avCmNJN9QpYodo/5Na
 E3kf/XzvzxOVv7pAoarZM7oWXIAilytAJ5udPVVpYG6tttmEw75RrqtTLKsq38i8f5JX
 0LUcSy03NmurrT85rO/Hv5nu461Uzc0u9QGgNPeqSXBD2yDPNmveptcF+a6S4w9TMFrx
 LVT9OYx8R3zkxBQ7dprvY+CKmVWApkzVzaJXa/isxV42RkSKqis/7Dpbyf/++S2Kadot
 Yfuw==
X-Gm-Message-State: APjAAAWpKJO0ktYiD1MIIl3r5377RtTL1BLtHppqWxW/Y5+t/DgkJTKP
 UkIAo8qN5byM6CfEh+c9EQ2sDGBHKSiAjz4B/JE=
X-Google-Smtp-Source: APXvYqwnZmuBQPAycR4wh+MzLxpLnaIqn9yYtJhnEginGgy5iGXJS00OPV33e9x6cT87GYQg3tA+HlJbqb3xbqDiJRA=
X-Received: by 2002:a9d:61c3:: with SMTP id h3mr14729198otk.39.1567410792636; 
 Mon, 02 Sep 2019 00:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-9-hch@lst.de>
 <CAMuHMdWyXGjokWi7tn9JHCTz9YMb_vHn6XKeE7KzH5n-54Sy0A@mail.gmail.com>
 <20190830160620.GD26887@lst.de>
In-Reply-To: <20190830160620.GD26887@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Sep 2019 09:53:01 +0200
Message-ID: <CAMuHMdXB=DWyu=Y25gih5poeanVnhLEP2MXoozvxdEY6op32FA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 02 Sep 2019 14:35:35 +0200
Subject: Re: [OpenRISC] [PATCH 08/26] m68k: simplify ioremap_nocache
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

SGkgQ2hyaXN0b3BoLAoKT24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgNjowNiBQTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTA6
NTY6MDJBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gU2F0LCBBdWcg
MTcsIDIwMTkgYXQgOTo0OCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6
Cj4gPiA+IEp1c3QgZGVmaW5lIGlvcmVtYXBfbm9jYWNoZSB0byBpb3JlbWFwIGluc3RlYWQgb2Yg
ZHVwbGljYXRpbmcgdGhlCj4gPiA+IGlubGluZS4gIEFsc28gZGVmaW5lZCBpb3JlbWFwX3VjIGlu
IHRlcm1zIG9mIGlvcmVtYXAgaW5zdGVhZCBvZgo+ID4gPiB0aGUgdXNpbmcgYSBkb3VibGUgaW5k
aXJlY3Rpb24uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+ID4KPiA+IEFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgo+Cj4gRG8geW91IG1pbmQgcGlja2luZyB0aGlzIHVwIHRocm91Z2ggdGhl
IG02OGsgdHJlZT8KClN1cmUuIEFwcGxpZWQgYW5kIHF1ZXVlZCBmb3IgdjUuNC4KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
