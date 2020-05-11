Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 65B781CD30D
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2F24F20B7E;
	Mon, 11 May 2020 09:41:50 +0200 (CEST)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by mail.librecores.org (Postfix) with ESMTPS id 9DC4F2041B
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 09:36:20 +0200 (CEST)
Received: by mail-ot1-f65.google.com with SMTP id i27so6755863ota.7
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 00:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3VY/12wWR1zHjOHzyqluXVdqy0F7FQQDSlqPm2Zx5o=;
 b=XjE8ThTlObrBzojZ9NX8egDsZ2TPMfEaGxRdMg6tnmG1aBFicDEpkuy2wk97YeuOct
 H6Jjuz4WL/zBt8w+Paz4MZShkPkFxy0MJfVg5fU2j01Vd1XmRm/hMDccK6PqbcXBivZn
 ND2AlJbXO87FMQLS3GYw4HAuR59G9ekgb3xBEyz12exUrF5JhIHqhfHx/VEqvNHcc0k7
 BQdEBon6VAROtH4N5ZSMqyDU8aEvaiiDE/go1kuvbN800VSckUWh7P7cSMdpboVxriMe
 utQzszImQGr2D6j8l0cQtJJBZbYgaG4VO6OHTKa20wAsWVWgyg+2DvQEeGpNRiEp1/Oj
 fi7Q==
X-Gm-Message-State: AGi0PuYZT6PjITvYICfdeMZlr/PkuZ9JW3fwhQv3RsMOPaoQWo2wn/pw
 8CqLb0/5I45TrjLxDOegis6JPur9obBcjBkDDYE=
X-Google-Smtp-Source: APiQypLU+moEt/plrIiBoDJtx6y9Ecp1jwHNmsr5IHgDhGkXTabpMRQH56iYz7dU/N/BpO7atrGAmOYhZDTTv1TixAM=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr11274742otm.145.1589182577008; 
 Mon, 11 May 2020 00:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-22-hch@lst.de>
In-Reply-To: <20200510075510.987823-22-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:36:05 +0200
Message-ID: <CAMuHMdXS-ygT01KfhS0y9WcYbi9HKdQL7Q1HXgUZdayzQb_qSA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: Re: [OpenRISC] [PATCH 21/31] mm: rename flush_icache_user_range to
 flush_icache_user_page
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
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMTAsIDIwMjAgYXQgOTo1NyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIGN1cnJlbnRseSBrbm93biBhcyBmbHVzaF9pY2Fj
aGVfdXNlcl9yYW5nZSBvbmx5IG9wZXJhdGVzCj4gb24gYSBzaW5nbGUgcGFnZS4gIFJlbmFtZSBp
dCB0byBmbHVzaF9pY2FjaGVfdXNlcl9wYWdlIGFzIHdlJ2xsIG5lZWQKPiB0aGUgbmFtZSBmbHVz
aF9pY2FjaGVfdXNlcl9yYW5nZSBmb3Igc29tZXRoaW5nIGVsc2Ugc29vbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKPiAgYXJjaC9tNjhrL2luY2x1
ZGUvYXNtL2NhY2hlZmx1c2hfbW0uaCAgfCAgNCArKy0tCj4gIGFyY2gvbTY4ay9tbS9jYWNoZS5j
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
