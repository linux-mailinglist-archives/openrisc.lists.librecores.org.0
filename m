Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ABADF204C1B
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7FDAE20C90;
	Tue, 23 Jun 2020 10:19:10 +0200 (CEST)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by mail.librecores.org (Postfix) with ESMTPS id 97F96209D8
 for <openrisc@lists.librecores.org>; Tue, 23 Jun 2020 09:38:55 +0200 (CEST)
Received: by mail-ot1-f67.google.com with SMTP id d4so15646700otk.2
 for <openrisc@lists.librecores.org>; Tue, 23 Jun 2020 00:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9mGofdmrfM+Cq17jzYeyG+wY7L+pzfwnkmxk/i8fTw=;
 b=dqtFLmZFlDQr0JyzHmyjVpB21E4Q4pwe9J6/bWZngEKskt8PlnG2A12TUGH9wlc5XP
 tIawnnvcGFzJzcWNhEJZ34sGmForRUlxgEh22D/yr6ISM1Vs3LKZxZi8Cix9uegGO0AX
 JIt34W1LUci3tnTGovbUkaVBaDux9BemWwGqWbTQ5GgsrbRz0BG0OFL0DaMnJqymvY7r
 L1UQyAnOQVSRESfvB6kmdsyAycniwxWKaj6DImzeMTrcF8zHcIPL//jWOSTOU4gn8VPr
 OkBx7DCTeKm9c03WJoKUDjoLXO48G89LV9htAXZGEqBzfWVQoFoxZiNBn5Q7z4WQQTmF
 ywyQ==
X-Gm-Message-State: AOAM531hnOIBDrndMxQ54w5HYg6mayuX2z2iDWmumW0S8u08Sy+sJAG6
 WCAx2uEo8MY9reM7bN5s7ymt2bM7IxAXz98+9K8=
X-Google-Smtp-Source: ABdhPJyYHMtZQ/KmEcBvLPZOXaTX2/2rzm7D1rBtkmcecNfa1Q10DnhozTkTVHMSfLXQiu0uFFez9UacdxDWy2DmWs0=
X-Received: by 2002:a05:6830:141a:: with SMTP id
 v26mr17416010otp.250.1592897934246; 
 Tue, 23 Jun 2020 00:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2020 09:38:42 +0200
Message-ID: <CAMuHMdV4QW+srkzkCTWs9CQGhxPo3y9E02AJ=4K89mMqoxYkzA@mail.gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
Subject: Re: [OpenRISC] [PATCH 17/17] arch: rename copy_thread_tls() back to
 copy_thread()
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
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
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 linux-csky@vger.kernel.org, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Jeff Dike <jdike@addtoit.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
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
aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4gd3JvdGU6Cj4gTm93IHRoYXQgSEFWRV9DT1BZX1RIUkVB
RF9UTFMgaGFzIGJlZW4gcmVtb3ZlZCwgcmVuYW1lIGNvcHlfdGhyZWFkX3RscygpCj4gYmFjayBz
aW1wbHkgY29weV90aHJlYWQoKS4gSXQncyBhIHNpbXBsZXIgbmFtZSwgYW5kIGRvZXNuJ3QgaW1w
bHkgdGhhdCBvbmx5Cj4gdGxzIGlzIGNvcGllZCBoZXJlLiBUaGlzIGZpbmlzaGVzIGFuIG91dHN0
YW5kaW5nIGNodW5rIG9mIGludGVybmFsIHByb2Nlc3MKPiBjcmVhdGlvbiB3b3JrIHNpbmNlIHdl
J3ZlIGFkZGVkIGNsb25lMygpLgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8
Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KCj4gIGFyY2gvbTY4ay9rZXJuZWwvcHJvY2Vz
cy5jICAgICAgIHwgMiArLQoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
