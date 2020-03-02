Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C318F177206
	for <lists+openrisc@lfdr.de>; Tue,  3 Mar 2020 10:09:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 31E5D209E2;
	Tue,  3 Mar 2020 10:09:26 +0100 (CET)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by mail.librecores.org (Postfix) with ESMTPS id 1591A20689
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 09:22:54 +0100 (CET)
Received: by mail-oi1-f195.google.com with SMTP id d62so9429834oia.11
 for <openrisc@lists.librecores.org>; Mon, 02 Mar 2020 00:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNjwUjeyqSUMReZ1hj8pk3fvMoKCAR8VkF8kU/CEAmI=;
 b=pZBeIskfeG30E5ANnJC+Qf+5c5Wc2NbOFSuU9gZyc/x2G1lGNHJdhP3Pqg14pdgmVI
 dSa/ZTkoe/8okwJIj0P3KqxxepfweY/RIAyuEUOPXdCbt/hx8/4I2+Y/r1+0THvkqGND
 QDzPlRxNDvtJhCGZs5HlIKbklgbcaLKclUksbDyj00+Pncqm4eVKou+IoBvsh9H5cQ8/
 qEEv6vliGI/veZYrxo35ySRg/+Au5ZJaPaE68FxN4eWIAmHvE8/3boBCYTEJdedDTyDy
 FLXsO3CWmtDmwY+24taXJX7ZoYJH4Jd1ks0Hl2IjJp/LZECiK9msj3LOEwqk1E3Yrnri
 8nAg==
X-Gm-Message-State: APjAAAVgnpoP16lbpaV9XekXNZpI4UTSYQryeLaJoH3mXZAuKZvbV7V1
 FH8wciWxcSrvqLpufNm4paD5xKOQZs3unzfVG3Y=
X-Google-Smtp-Source: APXvYqxOxJxSBMm4mxQtyQaE+vbuwqLPCHyyR1SXxHSga4s6HjiXJaifhzoYpNbqmVOhS7uE1qHfAQr6kjTf+c7mdpQ=
X-Received: by 2002:aca:b4c3:: with SMTP id
 d186mr10506660oif.131.1583137372687; 
 Mon, 02 Mar 2020 00:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2020 09:22:41 +0100
Message-ID: <CAMuHMdUfm0X3cgEDzzF6fs0HQj83OPR=xVjQaT7uVDi2WbtHog@mail.gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 10:09:23 +0100
Subject: Re: [OpenRISC] [RFC 1/3] mm/vma: Define a default value for
 VM_DATA_DEFAULT_FLAGS
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Paul Burton <paulburton@kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXIgMiwgMjAyMCBhdCA3OjQ4IEFNIEFuc2h1bWFuIEtoYW5kdWFsCjxhbnNodW1h
bi5raGFuZHVhbEBhcm0uY29tPiB3cm90ZToKPiBUaGVyZSBhcmUgbWFueSBwbGF0Zm9ybXMgd2l0
aCBleGFjdCBzYW1lIHZhbHVlIGZvciBWTV9EQVRBX0RFRkFVTFRfRkxBR1MKPiBUaGlzIGNyZWF0
ZXMgYSBkZWZhdWx0IHZhbHVlIGZvciBWTV9EQVRBX0RFRkFVTFRfRkxBR1MgaW4gbGluZSB3aXRo
IHRoZQo+IGV4aXN0aW5nIFZNX1NUQUNLX0RFRkFVTFRfRkxBR1MuIFdoaWxlIGhlcmUsIGFsc28g
ZGVmaW5lIHNvbWUgbW9yZSBtYWNyb3MKPiB3aXRoIHN0YW5kYXJkIFZNQSBhY2Nlc3MgZmxhZyBj
b21iaW5hdGlvbnMgdGhhdCBhcmUgdXNlZCBmcmVxdWVudGx5IGFjcm9zcwo+IG1hbnkgcGxhdGZv
cm1zLiBBcGFydCBmcm9tIHNpbXBsaWZpY2F0aW9uLCB0aGlzIHJlZHVjZXMgY29kZSBkdXBsaWNh
dGlvbgo+IGFzIHdlbGwuCgo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNo
dW1hbi5raGFuZHVhbEBhcm0uY29tPgoKPiAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3BhZ2UuaCAg
ICAgICB8ICAzIC0tLQoKRm9yIG02OGs6CkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
