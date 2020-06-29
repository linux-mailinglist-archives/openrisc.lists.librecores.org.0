Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7A51320DCEC
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0460B20D35;
	Mon, 29 Jun 2020 22:45:12 +0200 (CEST)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by mail.librecores.org (Postfix) with ESMTPS id 4153420B36
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 17:41:56 +0200 (CEST)
Received: by mail-ot1-f66.google.com with SMTP id 72so15935135otc.3
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 08:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18DuSBZeLijFT5byeb07kqFnxpD8Og5k3o71uVKMsdg=;
 b=SypCowAUtZNf+krBnJTaoKa8bmiOu3lmwhqLkvjmqXxQgg4DNrLAaPnkVURURHWUCt
 A/k+75LBZ/WjcCBQMYgycMbU+qe9Tjn/gIGM5z98KPRxLcI8MCgh51rdi4iFhiIOcqn2
 PbHDgPMMRDFB8JfcSHExU5PKQu/DRt3m42YeZy5emu1t3LiPPmQPNjFPuqc4qGwLhRAV
 XwiVuREbGjTiU8fLOaBm1icFESMliKnrYUI8EX6kdMlTmTcpfmdh+krY/SILcONJBk0W
 c5wD2ynbTO/+BJNr07rbKfRqvTC3GtW5g3X4npapdfJLGTtzUjzn4AabeOWBYG+HUv/6
 4lCQ==
X-Gm-Message-State: AOAM533RFRNRBEA/P6PHHwKdn4U1r8PUWMARfLG+K7j9MHrbQuAlKAzc
 bxcVo49nkQ1zRavKADfLZhBO7Wl4/p6X1UGDvkM=
X-Google-Smtp-Source: ABdhPJyfGDnofAtWY6Vq9zQSiEjHHywgsNVHJzUbnOYeAK8rSOSVeLQNZQAOcMed2+/KO3c+bzP8Q5CiqDzs7aUNX9g=
X-Received: by 2002:a05:6830:1451:: with SMTP id
 w17mr1238896otp.250.1593445314725; 
 Mon, 29 Jun 2020 08:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-2-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-2-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2020 17:41:43 +0200
Message-ID: <CAMuHMdUOrrrtKuhtWJvzKNNLXY1fx+Ym1oXGN2J_CZ7RqByGHQ@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 1/8] mm: remove unneeded includes of
 <asm/pgalloc.h>
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
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Andy Lutomirski <luto@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgNDozNSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
Pgo+IEluIHRoZSBtb3N0IGNhc2VzIDxhc20vcGdhbGxvYy5oPiBoZWFkZXIgaXMgcmVxdWlyZWQg
b25seSBmb3IgYWxsb2NhdGlvbnMKPiBvZiBwYWdlIHRhYmxlIG1lbW9yeS4gTW9zdCBvZiB0aGUg
LmMgZmlsZXMgdGhhdCBpbmNsdWRlIHRoYXQgaGVhZGVyIGRvIG5vdAo+IHVzZSBzeW1ib2xzIGRl
Y2xhcmVkIGluIDxhc20vcGdhbGxvYy5oPiBhbmQgZG8gbm90IHJlcXVpcmUgdGhhdCBoZWFkZXIu
Cj4KPiBBcyBmb3IgdGhlIG90aGVyIGhlYWRlciBmaWxlcyB0aGF0IHVzZWQgdG8gaW5jbHVkZSA8
YXNtL3BnYWxsb2MuaD4sIGl0IGlzCj4gcG9zc2libGUgdG8gbW92ZSB0aGF0IGluY2x1ZGUgaW50
byB0aGUgLmMgZmlsZSB0aGF0IGFjdHVhbGx5IHVzZXMgc3ltYm9scwo+IGZyb20gPGFzbS9wZ2Fs
bG9jLmg+IGFuZCBkcm9wIHRoZSBpbmNsdWRlIGZyb20gdGhlIGhlYWRlciBmaWxlLgo+Cj4gVGhl
IHByb2Nlc3Mgd2FzIHNvbWV3aGF0IGF1dG9tYXRlZCB1c2luZwo+Cj4gICAgICAgICBzZWQgLWkg
LUUgJy9bPCJdYXNtXC9wZ2FsbG9jXC5oL2QnIFwKPiAgICAgICAgICAgICAgICAgJChncmVwIC1M
IC13IC1mIC90bXAveHggXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICQoZ2l0IGdyZXAgLUUg
LWwgJ1s8Il1hc20vcGdhbGxvY1wuaCcpKQo+Cj4gd2hlcmUgL3RtcC94eCBjb250YWlucyBhbGwg
dGhlIHN5bWJvbHMgZGVmaW5lZCBpbgo+IGFyY2gvKi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmguCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+CgpGb3Ig
dGhlIG02OGsgcGFydDoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
