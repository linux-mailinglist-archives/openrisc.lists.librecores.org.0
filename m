Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 58D279719B
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 428EF2030D;
	Wed, 21 Aug 2019 07:30:46 +0200 (CEST)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by mail.librecores.org (Postfix) with ESMTPS id 73C112030D
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 10:50:54 +0200 (CEST)
Received: by mail-oi1-f195.google.com with SMTP id t24so718741oij.13
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 01:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvpHNQzLHQyAljD3a4MUdfT4ynucGZ6tzJYlGCkwzvk=;
 b=R/dUqmcwWaMvTOdJxh9I/FISugiVYBq3FYwn/bpWyCSQaAYlXxt/yca0PhUuHqB1Ad
 ewDkz+CNOgeYXDFkbTB4PwKfgjzKMA5hUZZt3V+ixTuQcQJn88PaEzgBpGnfbnkUf7eO
 Ebn7YI7uqYEPZzwMtIOgCxS0nVsfw7titAjGwvHNcEDVqkOUiS/dQm2PrdQb5HIaJVcS
 ZJwNEnMHcIKk3KHBNAVnII9giB/VJVUHqGFBgKF+phw3SO0B0bbADJELRN9On5E0t3iG
 M7g0lt1yE2SYydVoE27tUR7wddqSJ1jPT0wjDrrHyO79nmM6t31zE5xI+VSGPdZBv7mg
 0iEw==
X-Gm-Message-State: APjAAAUZGtP+Bg7pZrP/eaEo4vga6GHSH3L3cJoAy6jV2HSb4ZYaQwsr
 CullpOKAM5P8lHJQNKRs9GzJsupo9vvPhEi7lms=
X-Google-Smtp-Source: APXvYqwmqcH0DTBSRr1W5PEboqZl9eNrRnGfwBz/22T1r10yVcw0KO4fHH9AZZHFDFACKa88tOO5vT/zZa40mMCQj8M=
X-Received: by 2002:a54:4618:: with SMTP id p24mr2849469oip.148.1566204653079; 
 Mon, 19 Aug 2019 01:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-4-hch@lst.de>
In-Reply-To: <20190817073253.27819-4-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 10:50:41 +0200
Message-ID: <CAMuHMdVT3VSQ1S=YEoTjYzxwpavy+43XUWA-wzCO56FuHK6R-g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 03/26] m68k,
 microblaze: remove ioremap_fullcache
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

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgOTo0MSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gTm8gY2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cgo+ICBhcmNoL202OGsvaW5jbHVk
ZS9hc20va21hcC5oICAgICB8IDcgLS0tLS0tLQoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
