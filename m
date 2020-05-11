Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 883291D1FF3
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 92EBA20B39;
	Wed, 13 May 2020 22:17:33 +0200 (CEST)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by mail.librecores.org (Postfix) with ESMTPS id 222BE20372
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 09:46:30 +0200 (CEST)
Received: by mail-oi1-f195.google.com with SMTP id r25so14327295oij.4
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 00:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yJ6ElOmiCSyE9da4JBaYJBkgTCIAd7AfbCRMY3E6sk=;
 b=k0pCrI0B5k3s7qbkhn261Wo72JO5uSB9yVVT6DQ37G2ZdaaBKcDlGv2tOG2AoONyUO
 o182QJQ06tl+nEdRZHnSlCq1O2UTJTTA/Bw/oneoB9swEnhQToS4ChXMoA8Dpo8OBusn
 cYRM5/jZ9VXzD5cf5th61RQukCOhAwJborKMz+4tCY9He78wRsNXQ/PQgwdGaZ8xtSre
 UnUZEH/l6TDPq8B5eb3IV6xrkYKEhvotXfDsrPB8cO10agH8h/mzyUotlJk27yDNvSQR
 sn9YF5a303amFBJYG/JbuQfp4uJRPI7RN0e5Fe+PkgINv9DlV+BWTKZH0FflW7nOxbFM
 HbQQ==
X-Gm-Message-State: AGi0PuY9YRpOfhA+fK23Ewp+WKeJghpd1KTKTP45cbUa/M3WZMdlGtli
 6ra6DuwsNx8zP3dKa+aE4sQQIGlSeUyhXFxnSVk=
X-Google-Smtp-Source: APiQypIoFxa7a3EUthZ/8xx0aZ//Vc0pDLpqFY6DB0zkXv6WP4wkoKn8ne3ghzK30RcpwYDHtmi30TMFV3MiIELEMLg=
X-Received: by 2002:aca:895:: with SMTP id 143mr18042949oii.153.1589183188927; 
 Mon, 11 May 2020 00:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:46:17 +0200
Message-ID: <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] sort out the flush_icache_range mess
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

SGkgQ2hyaXN0b3BoLAoKT24gU3VuLCBNYXkgMTAsIDIwMjAgYXQgOTo1NSBBTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gbm9uZSBvZiB3aGljaCByZWFsbHkgYXJlIHVz
ZWQgYnkgYSB0eXBpY2FsIE1NVSBlbmFibGVkIGtlcm5lbCwgYXMgYS5vdXQgY2FuCj4gb25seSBi
ZSBidWlsZCBmb3IgYWxwaGEgYW5kIG02OGsgdG8gc3RhcnQgd2l0aC4KClF1b3RpbmcgbXlzZWxm
OgoiSSB0aGluayBpdCdzIHNhZmUgdG8gYXNzdW1lIG5vIG9uZSBzdGlsbCBydW5zIGEub3V0IGJp
bmFyaWVzIG9uIG02OGsuIgpodHRwOi8vbG9yZS5rZXJuZWwub3JnL3IvQ0FNdUhNZFcrbTBRK2oz
cnNRZE1YbnJFUG0rWEI1WTJBUXJ4VzVzRDFtWkFLZ21FcW9BQG1haWwuZ21haWwuY29tCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
