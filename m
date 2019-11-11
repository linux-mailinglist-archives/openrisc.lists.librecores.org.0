Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 16B21F7424
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E25A620805;
	Mon, 11 Nov 2019 13:37:48 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by mail.librecores.org (Postfix) with ESMTPS id D826A2079F
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:34:08 +0100 (CET)
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MCsHm-1icsRk1Wi0-008r2d for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:34:08 +0100
Received: by mail-qk1-f172.google.com with SMTP id 205so10730372qkk.1
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:34:07 -0800 (PST)
X-Gm-Message-State: APjAAAXCWHlAIj+AYGYyzUuQfQOxORX4rVg9skwl41i6O1fZQEbG7XQV
 q0HJt4WmcyX1Xb6jZMN6r4SNzcDkTbCG3VuqHQ8=
X-Google-Smtp-Source: APXvYqzESzY62F14rsigxKLBXM91nKVjfO+E517KtV1rTG3fdeRCW+MOilAesC4Pz85XDKVkv4qCW/mxeD7p5CII2Ks=
X-Received: by 2002:a37:4f13:: with SMTP id d19mr9320005qkb.138.1573468446947; 
 Mon, 11 Nov 2019 02:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-2-hch@lst.de>
In-Reply-To: <20191029064834.23438-2-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:33:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xk-mQic84Cv7CYhm2DqDCyu69+qH=i8M=JoE3xkpM=g@mail.gmail.com>
Message-ID: <CAK8P3a3xk-mQic84Cv7CYhm2DqDCyu69+qH=i8M=JoE3xkpM=g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:IRYu5LNxWg7iNVlULVTbnCxPtYS5KuVrUbTS7xpQeSOiLqj7vAS
 0BUeYtiCpRWaN2mVz8TF+O0tfF3Gnl2HQt8OIIgViUpW899tfktgtH2dAlIcvkkIc8PpGH1
 DNl9re22vT5D9hWsxVCPEousDIEVfEgdsiahEzO/o/qriJoFlDRJlSLA9czqqPUpqv8BsWk
 b3UFrJF0qPSRzmmGfGbmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4BvziqUIHJE=:Pi3vhhYT6rovi6wEOde+py
 dTBAgd975XdkctOoUwp+XeYFzLfSiX3d7oN7j34chJW1nDv/QywXPcYdWXyYBKNhPt5TpvtoY
 p6d+XQ/kBzkecO7l65MfVx7liJCBAqjHZIhyumnw0rD1PAj4jaJoSd0f/2AvtkOA8gq9GPefU
 9CPnHC+Ud4b4rXIL3n47cPTgdkTi8ESPXXaYSohTdvfgb7EOmyHNXsvE8KjrUt/Ucn17SNEqS
 UjykL2aEbxFYsSXkaMd2OUcKSZMNfCXeYG32IdY8Z9QaX56Rj4aWtqqTyfBJdxHi6UVqS7aXu
 83VJZGZSd6ErlLDjdnUYRc/EGbr0wxBoGpyRCyNHgeZr/VmYXcev3kmp08MwIKAR2bDx6gmjr
 EW7d4Jnv7bjYy/+8V67gtef8D4eiwAJZ4BcaVfx2H3hgJI5f5k8kYGTLau4xNVppMva+KFfG9
 n11hZ7W7WJsrP3ZElg+DwW9oLXov1B3zJluFu/fl/TgvrUPz6yFl6G1ydK5sp3qgehnG0ueD+
 dErBgByyjyBwtE+toCXKtcwnY5zkrMyhtq2rjw7F1011nOmQu+C0VeHSs4b7eIcP7PGn7pm6C
 cRhZdHPZj2FfD02/apiqUKm+5YK72wpl7GznJjhjNJoOxHlmDS8Al4gJ3dlwAamwuL7KhNX8I
 ikpIgEOPNTQshKGamRnP0e21g4bGHrQI+Yok8NH58Kb3gHwtGM4HNH8kxTRoGEogCOJERF18R
 D2RVl02BNogm2eLswSlHnvTMnomMxpRJno/Qn0T/zAd+vbvoVcExlC0le9/sNbuPByhDIvKEg
 osjJbrNjeJgv+NidQeBdiERpJM/nDVHGJEXUtpYxYhB1GxplJURxfKMfN40BHXhyY+is4JCha
 QiujXdbQqvfAEHOD3dRQ==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 01/21] arm: remove ioremap_cached
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

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgNzo0OCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBObyB1c2VycyBvZiBpb3JlbWFwX2NhY2hlZCBhcmUgbGVmdCwgcmVt
b3ZlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
CgpSZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
