Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 61F431CD30F
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EB9742088E;
	Mon, 11 May 2020 09:41:51 +0200 (CEST)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by mail.librecores.org (Postfix) with ESMTPS id 0866D20B2A
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 09:41:01 +0200 (CEST)
Received: by mail-ot1-f67.google.com with SMTP id m13so6787873otf.6
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 00:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VS2fk1JcC03oZxkfqvBGknuVzDopGVbMhfQjjlcRALA=;
 b=K+m+ZPuepI1I4I9bPfmatZyVg6rcEZpYH5Bepkr/+nD0jYhzPseOQqrQAP9tGs2sZM
 kakXVwXoI40G6il9MObkL7DTgBGc4JA23OQklw8iS+CibOnv3feyxIbAWU++OXDkiDaA
 DTtLI/Q0vYVWIQcGNFF7K7YTV8rfNL5YD3ZDE1Ej2mx6/4U4wT5IOx0ZueBoc+2HE6at
 bVbKKi0M9tqasF2GsoOQgNdehopSk0ELrPi3btS5HCXd0qjHbdo8CkB4bfGj+WLiPDTa
 aa9iMgnHCIpL+QTbsl9BzlOim3v5e50hrZLSezF7dmXsxZgZ7/sMNo4osryCIfZ8JbkY
 E7AA==
X-Gm-Message-State: AGi0PuafyywhEN4sYjlEcrK5ilxhMQNL6HRlz5FuwCyDcbN7O8mbw+hB
 Rd2CXAbw2XQv3Eh1mv+0VSGoDqhpsu7AhbICjx8=
X-Google-Smtp-Source: APiQypLrnA3x0TQgcu4GbQXkWDUyTXgEK7R9Byl6mAxrtqxgZZGXhJd6czCyilOQXM5O9JA2CdYzbDyIV5/QIHKRb9A=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10878643otl.107.1589182859874; 
 Mon, 11 May 2020 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-32-hch@lst.de>
In-Reply-To: <20200510075510.987823-32-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:40:39 +0200
Message-ID: <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:43 +0200
Subject: Re: [OpenRISC] [PATCH 31/31] module: move the set_fs hack for
 flush_icache_range to m68k
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
dC5kZT4gd3JvdGU6Cj4KPiBmbHVzaF9pY2FjaGVfcmFuZ2UgZ2VuZXJhbGx5IG9wZXJhdGVzIG9u
IGtlcm5lbCBhZGRyZXNzZXMsIGJ1dCBmb3Igc29tZQo+IHJlYXNvbiBtNjhrIG5lZWRlZCBhIHNl
dF9mcyBvdmVycmlkZS4gIE1vdmUgdGhhdCBpbnRvIHRoZSBtNjhrIGNvZGUKPiBpbnN0ZWQgb2Yg
a2VlcGluZyBpdCBpbiB0aGUgbW9kdWxlIGxvYWRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
