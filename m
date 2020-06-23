Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6E407204C1A
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0E6F920C75;
	Tue, 23 Jun 2020 10:19:10 +0200 (CEST)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by mail.librecores.org (Postfix) with ESMTPS id AC94120BCF
 for <openrisc@lists.librecores.org>; Tue, 23 Jun 2020 09:37:50 +0200 (CEST)
Received: by mail-oi1-f196.google.com with SMTP id k4so18070548oik.2
 for <openrisc@lists.librecores.org>; Tue, 23 Jun 2020 00:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oJwDzhBeEf7oQ+TonriYRlwmomFLiKcHOUg0pAK4SQ=;
 b=DpyYNIYycz++oQ6+PwwvEs2O7LYaObOaa/LHTvdAqVjVpfEj9KTWI7q2FyJ0nDgTuV
 8U1oQMelTZFrUCq/vbsmoNLM11pIGl17BHUDe2R8Q5cBfS3wcZ1sqS8NCi9rEV09WtDw
 9TOK24UIAlwBdZ2bjBpZFWbOJJrMY3O6wqUYrzKcgk1MT809eI9sp3GKzVWdgdOhbefP
 7ZvFrRFkTg+QWS8Cl5+cEfPqV867DKPxKBmkg0uDduPrtDAi3RlFeppkUeCX8mQgx6k8
 KrkI5a+//FeeGWND74XHyqLA/H4/KyPAmSFXfD2u/H3aM6qJxHBHErjK5kuFqOn+BS2p
 YIjA==
X-Gm-Message-State: AOAM532L53d/JBsFncdmsGAhLo7QZwZ3EXbgSeKk+fvFqKN0vC1UbLdU
 DMXkOEhd++9kyj6CYieR6Cj+OnyMimiSYZRPPDY=
X-Google-Smtp-Source: ABdhPJxT4D8Rg3orWN4Ut3NBxZ5/1LZ7NRz/AeZjcH8lRfYfsp5aNzdh8MJbSRaix2qdqbDH5Ocb6CYiGlmuOkGOPBI=
X-Received: by 2002:a54:4006:: with SMTP id x6mr14806231oie.148.1592897869203; 
 Tue, 23 Jun 2020 00:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-17-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-17-christian.brauner@ubuntu.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2020 09:37:38 +0200
Message-ID: <CAMuHMdWYuJW9vnCkfqo=c8FRoxpw_HrUDZsXraAsdTOgHtR8Bw@mail.gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
Subject: Re: [OpenRISC] [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMTo0NyBBTSBDaHJpc3RpYW4gQnJhdW5lcgo8Y2hyaXN0
aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4gd3JvdGU6Cj4gQWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9y
dCBjb3B5X3RocmVhZF90bHMoKSBub3csIHNvIHJlbW92ZSB0aGUgbGVnYWN5Cj4gY29weV90aHJl
YWQoKSBmdW5jdGlvbiBhbmQgdGhlIEhBVkVfQ09QWV9USFJFQURfVExTIGNvbmZpZyBvcHRpb24u
IEV2ZXJ5b25lCj4gdXNlcyB0aGUgc2FtZSBwcm9jZXNzIGNyZWF0aW9uIGNhbGxpbmcgY29udmVu
dGlvbiBiYXNlZCBvbgo+IGNvcHlfdGhyZWFkX3RscygpIGFuZCBzdHJ1Y3Qga2VybmVsX2Nsb25l
X2FyZ3MuIFRoaXMgd2lsbCBtYWtlIGl0IGVhc2llciB0bwo+IG1haW50YWluIHRoZSBjb3JlIHBy
b2Nlc3MgY3JlYXRpb24gY29kZSB1bmRlciBrZXJuZWwvLCBzaW1wbGlmaWVzIHRoZQo+IGNhbGxw
YXRocyBhbmQgbWFrZXMgdGhlIGlkZW50aWNhbCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMuCgo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBCcmF1bmVyIDxjaHJpc3RpYW4uYnJhdW5lckB1YnVudHUu
Y29tPgoKPiAgYXJjaC9tNjhrL0tjb25maWcgICAgICAgICAgfCAgMSAtCgpBY2tlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
