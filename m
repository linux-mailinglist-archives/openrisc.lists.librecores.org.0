Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8387542B826
	for <lists+openrisc@lfdr.de>; Wed, 13 Oct 2021 08:59:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 36D6C24151;
	Wed, 13 Oct 2021 08:59:18 +0200 (CEST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mail.librecores.org (Postfix) with ESMTPS id 1A131240EC
 for <openrisc@lists.librecores.org>; Wed, 13 Oct 2021 08:59:16 +0200 (CEST)
Received: by mail-ua1-f53.google.com with SMTP id e2so2517820uax.7
 for <openrisc@lists.librecores.org>; Tue, 12 Oct 2021 23:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLmWoWym/1fKiJu7c9gpS1cDGT+57poTvw7kTscrC00=;
 b=AxJ4zmcenzXw3xlrVAjLreBAtXdm6MwVNLqpAW5Hb6+TAKyDgp3SS0lZDGUAlS8fP+
 wHJL9T4xXKevUQKJCso/tGExTHZZ1Cj/TXTi6AHSfTgeeU2MSuIibVeuhvMRSu4AvBWJ
 udrg2em1j2IxxfEZon5OyBHbC7N4HYZ2h+YEkKYFdJz/HcOdt7vM/fzef28oAlsYtst8
 jPYNCLo1atl6B4WBx/8Prcba4W2x9Ky5T5UB4QF/qvJ4rnUDvh46uK+Cojk9kEIKy8Tb
 QBDiNmDgggkZbzV3hDigJGAv0Oga0kayqRf9LNLfggQB9dbVtVKfOKNZuXMPQQFXCb44
 ogeA==
X-Gm-Message-State: AOAM5314eEfV4p07AK+xeWUGKRCVLcpgP7ZoXRRy6ETHLr7FmFSjuOK5
 7v14RzrGDB0tC08ClOV0sUCkVO/wiIjJvb/EaNY=
X-Google-Smtp-Source: ABdhPJzwsQvQy07KzSSKF36slqOOCBmzhi7G4XFKh+MxO1aqVfgv6UylAsUlKqrZrwFEymqmWaysD4XtAMh8gSFAJlY=
X-Received: by 2002:a67:d583:: with SMTP id m3mr36353545vsj.41.1634108355035; 
 Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 08:59:03 +0200
Message-ID: <CAMuHMdUQVpvvq=ZqjL97gV6AxS5eGm4mRS=gL4PPwWiBS-v5AA@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [OpenRISC] [PATCH 2/2] kbuild: use more subdir- for visiting
 subdirectories while cleaning
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 Jonas Bonn <jonas@southpole.se>, Rob Herring <robh@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 William Cohen <wcohen@redhat.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Michal Marek <michal.lkml@markovi.net>,
 Julien Thierry <jthierry@redhat.com>, Nick Hu <nickhu@andestech.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Borislav Petkov <bp@alien8.de>,
 Vineet Gupta <vgupta@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgODo0MyBBTSBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJv
eUBrZXJuZWwub3JnPiB3cm90ZToKPiBEb2N1bWVudGF0aW9uL2tidWlsZC9tYWtlZmlsZXMucnN0
IHN1Z2dlc3RzIHRvIHVzZSAiYXJjaGNsZWFuIiBmb3IKPiBjbGVhbmluZyBhcmNoLyQoU1JDQVJD
SCkvYm9vdC8uCj4KPiBTaW5jZSBjb21taXQgZDkyY2M0ZDUxNjQzICgia2J1aWxkOiByZXF1aXJl
IGFsbCBhcmNoaXRlY3R1cmVzIHRvIGhhdmUKPiBhcmNoLyQoU1JDQVJDSCkvS2J1aWxkIiksIHdl
IGNhbiB1c2UgdGhlICJzdWJkaXItICs9IGJvb3QiIHRyaWNrIGZvcgo+IGFsbCBhcmNoaXRlY3R1
cmVzLiBUaGlzIGNhbiB0YWtlIGFkdmFudGFnZSBvZiB0aGUgcGFyYWxsZWwgb3B0aW9uICgtaikK
PiBmb3IgIm1ha2UgY2xlYW4iLgo+Cj4gSSBhbHNvIGNsZWFuZWQgdXAgdGhlIGNvbW1lbnRzLiBU
aGUgImFyY2hkZXAiIHRhcmdldCBkb2VzIG5vdCBleGlzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1h
c2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cgo+ICBhcmNoL202OGsvTWFrZWZp
bGUgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
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
