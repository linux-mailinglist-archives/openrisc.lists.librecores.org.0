Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83F28F7422
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 546B1207FF;
	Mon, 11 Nov 2019 13:37:48 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by mail.librecores.org (Postfix) with ESMTPS id 5F27B2079D
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:29:59 +0100 (CET)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N8X9L-1hqOZD2Php-014QIo for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:29:58 +0100
Received: by mail-qv1-f41.google.com with SMTP id w11so4622381qvu.13
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:29:57 -0800 (PST)
X-Gm-Message-State: APjAAAUuucF3h7Vxq1lOcYf3xrwm48nJPeNV7oXZxlGTcvltq85fCmy2
 srSp2zkmK6oOqLL8M3UolfVLeqiB4wwCylQI6PE=
X-Google-Smtp-Source: APXvYqx3dRDA2rmaPEW4UpY0UEoKLtstJlcCKLowXnTab550quUX1o9OqysLm43EJTh/MA4389FmX1Acn21s2dCCBDI=
X-Received: by 2002:a0c:d0e1:: with SMTP id b30mr23068710qvh.197.1573468197026; 
 Mon, 11 Nov 2019 02:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-12-hch@lst.de>
In-Reply-To: <20191029064834.23438-12-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:29:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36-afn--XqG0ddj6VSPCzA_cfZqRxQXDuan7yk8CKg4w@mail.gmail.com>
Message-ID: <CAK8P3a36-afn--XqG0ddj6VSPCzA_cfZqRxQXDuan7yk8CKg4w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:06d2Od/JxHs2sQ9d6NP3s3Xd9+bTT7V4NLAo1VPLRbJqdHG132S
 gMOkeZF9PpYlUFG/8n+GWXtZ6d/kKOsqAMxUa04KehhgjsoXdWQvJ1HwsvcJ4VLK0XttFHA
 aDQZf021DUUc4jYsFN0d954ZQBsqUlW5mgfIUUDK6yAnfwa2O+barzYp/hpON+oslcz/4Lc
 /4Qn7KLgoHOSPOLTw1nBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YX3JEMx5dvU=:wv3qJsB/2k2JpJMpg+txqe
 IY2ehnKOvw1RlUCiY3iVlindVu2ekwErmINyLsn73Faw48c5EW3cE11cbWHZZQ/mJFmSAmMRP
 rUp0rzawpbkBXidFoZKoPk/otD7V3KdUx7IIh5g6W+hT67XK0nGMzea0PEdTLdQVmetnBfpMj
 ODCXXwrVzKaEEnCYmN8ped6uIFWt1bOcTmWTJ5cuactSG7sqZ18YcIn35Vv1T6bCtzBHie+j/
 2N68aVQbwbix4pFktLzzsam8DQVTffn1GxMcFK7uGSlUqQGcMuMkjjpbJaAS06a4lNoJh4Qje
 plqao6ZcnbasyiBP/62gbJUBb8kvhQow0/AH62emcw0XknO4rIk9jsr/mTxb6hhK7pwsk9U8S
 rRXVbdulMJDe12R3yrG6WOw5wqYAjVeJIw4gbPVy/P5JuzmuEEkvENpYD4w8JGy8TJcrD3u8F
 9jYelnBMbCEeQg4V3HL16g6lT0SzSKIzoBQ0Vlh9IF+0xeIxqWFap0yWQULTrdcqS0cdfELxc
 hBs3xSvQHAow0t2f9DlgtcTQ+rdfpf1cG+jJgAX8Ox8NhwyaMm5tw4laxp/JDWLx1m6R0hlVT
 WYrfU4874fg1i6LjJ3OvD8dyzxh0cVxHhm4rq5kJaD+1UseSnzqn3Zs4EVTgpEA143e35hKQR
 zkXFhMZONin1akyOlXIlCKANRK17kxBm85IyYvKFCqgTyEJ5Wk34yvt0oce7vj88IEAmLO7k4
 gMsE1yxHR0qfAlkeuLcTAyTY1KvGYEa2K7XkyJKTOuYzbxOBjUYxdtuhzGdp+xhqth3Ix9+E5
 1p+t9NchawmLGALZoZx0ooJnT51ayJ/qwof4EkhhKRHuz9A9M72RN26rUV19UP8NNgNjI9/Ys
 6SaoPSMkgtsBngoeo0JQ==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 11/21] asm-generic: don't provide ioremap for
 CONFIG_MMU
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgNzo0OSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBBbGwgTU1VLWVuYWJsZWQgcG9ydHMgaGF2ZSBhIG5vbi10cml2aWFs
IGlvcmVtYXAgYW5kIHNob3VsZCB0aHVzIHByb3ZpZGUKPiB0aGUgcHJvdG90eXBlIGZvciB0aGVp
ciBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFkIG9mIHByb3ZpZGluZyBhIGdlbmVyaWMKPiBvbmUgdW5s
ZXNzIGEgZGlmZmVyZW50IHN5bWJvbCBpcyBub3QgZGVmaW5lZC4gIE5vdGUgdGhhdCB0aGlzIG9u
bHkKPiBhZmZlY3RzIHNwYXJjMzIgbmRzMzIgYXMgYWxsIG90aGVycyBkbyBwcm92aWRlIHRoZWly
IG93biB2ZXJzaW9uLgo+Cj4gQWxzbyB1cGRhdGUgdGhlIGtlcm5lbGRvYyBjb21tZW50cyBpbiBh
c20tZ2VuZXJpYy9pby5oIHRvIGV4cGxhaW4gdGhlCj4gc2l0dWF0aW9uIGFyb3VuZCB0aGUgZGVm
YXVsdCBpb3JlbWFwKiBpbXBsZW1lbnRhdGlvbnMgY29ycmVjdGx5Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpSZXZpZXdlZC1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
