Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A7DCC9719C
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DB3D620264;
	Wed, 21 Aug 2019 07:30:46 +0200 (CEST)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by mail.librecores.org (Postfix) with ESMTPS id 9102720378
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 10:56:15 +0200 (CEST)
Received: by mail-oi1-f195.google.com with SMTP id b25so743987oib.4
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 01:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6G5Q8MNHtBsxtM0EYIY9kLhACl1vZMsZYLOG6VK87LE=;
 b=eKi3QIk3KAJROxXkdLCE11uskBUbOyAujBMb8UFgLLfRxyLWHRaamxhftQsf4n/2Qh
 yr+rdTFY6idlKCI42/pAsVJb3vt+nTfFTwBKzcsthH/cWL5wsfQ09mQFVmxKK2ez5nBB
 muJk1Ml3H3O+AeTtf+wi+CeB1tunYXIQPsNwxdCJcQveNYk5VhOKBSs+JOjIcaM8rXHs
 FT98BCuiykvORjPhUEfkOmhrfPk8OusK9NPDIj1JPu7nCUnQwXT3EhnUDH7XSonYJ7hB
 arxK3VOu00goBwD5HjHiVUDwwVojADAA1WdJ8xDqz4u9yFmmbn5f5aiuVow1y2EDtfIL
 VcvA==
X-Gm-Message-State: APjAAAVWb6w0fZCZO9bT7giBbDhR99aaPAEwpWuTH6FLsdCaddCC67Fd
 46052qR0pP4a+RHcDaU3EKVq85vVmbaYf5z22Oo=
X-Google-Smtp-Source: APXvYqwNkMBh58jQZs/taAE8CIPOk6D0evfJ20SfbPqDG1zrFPybSy7xKWIfKgi9aIO2Yy6HJzobqI2PMgSWcaN0QpY=
X-Received: by 2002:a54:478d:: with SMTP id o13mr12702951oic.54.1566204974376; 
 Mon, 19 Aug 2019 01:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-9-hch@lst.de>
In-Reply-To: <20190817073253.27819-9-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 10:56:02 +0200
Message-ID: <CAMuHMdWyXGjokWi7tn9JHCTz9YMb_vHn6XKeE7KzH5n-54Sy0A@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
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

SGkgQ2hyaXN0b3BoLAoKT24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgOTo0OCBBTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gSnVzdCBkZWZpbmUgaW9yZW1hcF9ub2NhY2hl
IHRvIGlvcmVtYXAgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUKPiBpbmxpbmUuICBBbHNvIGRl
ZmluZWQgaW9yZW1hcF91YyBpbiB0ZXJtcyBvZiBpb3JlbWFwIGluc3RlYWQgb2YKPiB0aGUgdXNp
bmcgYSBkb3VibGUgaW5kaXJlY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgoKQlRXLCBzaG91bGRuJ3Qgd2UgZ2V0IHJpZCBvZiB0aGUgc29sZSB1c2Vy
IG9mIGlvcmVtYXBfdWMoKSwgdG9vPwpTZWVtcyB0byBtYWtlIGEgZGlmZmVyZW5jZSBvbiB4ODYg
b25seSwgd2hlcmUgaXQgaXMgInN0cm9uZ2x5IHVuY2FjaGVkIgood2hhdGV2ZXIgdGhhdCBtYXkg
bWVhbiA7LSkKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
