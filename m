Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCAFEF8097
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 20:52:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 202572062A;
	Mon, 11 Nov 2019 20:52:17 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mail.librecores.org (Postfix) with ESMTPS id 6C5192013B
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 20:33:36 +0100 (CET)
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVMuN-1iMqoC1QbH-00SLAk for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 20:33:35 +0100
Received: by mail-qk1-f179.google.com with SMTP id q70so12189986qke.12
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:33:34 -0800 (PST)
X-Gm-Message-State: APjAAAWHv4S5lJ96gtFlg15ShZvAWebyWPsX87Q0J4iPNTZ7R07y8YoV
 1XLZR6m9SN8SESPIGV29iGL+Ndqsthe7pDwRtNQ=
X-Google-Smtp-Source: APXvYqzRT3LvGe5JvZLYKm1upZpHxk2xc9ns43ZUwTpi/JlFXD7dYhA8+4Mt4XVDG2f3/qLjEL/Ms2I9EThmbgvV8Jg=
X-Received: by 2002:a37:58d:: with SMTP id 135mr2321779qkf.394.1573500813881; 
 Mon, 11 Nov 2019 11:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-11-hch@lst.de>
 <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
 <20191111101531.GA12294@lst.de>
 <CAK8P3a0rTvfPP2LUMw8EC0xz5gfZP5+NUkoaZBJrtYYfr6YRig@mail.gmail.com>
 <20191111102923.GA12974@lst.de>
In-Reply-To: <20191111102923.GA12974@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 20:33:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2b=td4JhYOcK1jUshh8Mp-5_w4v+dAr_JjnH783=ptBQ@mail.gmail.com>
Message-ID: <CAK8P3a2b=td4JhYOcK1jUshh8Mp-5_w4v+dAr_JjnH783=ptBQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:GUNtj6/5VJYcpmwbRfgZO4ve3R+rpJxGsrO5gkRnWyw94og3efg
 WrDFYtZ8x+7h22MYVqhvVqInQ4Lmz6L/ViFb7fO4CD2kti8YyL2THfr3BGvtsHqWBjc51Cm
 FdbOXzsk0vEkEos4n3eiEpAvtfPawqk8VESg6boJy+5iTwkQ6/TI4KBtwwwpp/VYT6C/YH0
 7V2VFkXYpLXTXu/fvGesA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ABmiuedt0IU=:2Rzg0pLVnWvEVWJvJWFtLf
 stCfEr+HNAyHWDNp0gAYpQJv7C8/pTFJlEAJJHSjqwGsukOU58E70nkkAee2vV5/Dz6U95Num
 0nlJwZrihU3P7l937QlIFJKc8hbm6VTs3zMAagR3PHTzx9GbP2qrxgyYcfvvAsTzOewtP2Ms5
 S1CIwKYCiFD5hnV9yBqnOUnavbv2IqInocLHzFn+YqeONazQTzU2VNtJbk64lOQLfhdIA+04M
 daHgHAztjeMh2xBWDoa6xGlcairhmA/MeQc9iQglKEixWNX6GE4iAaYHQufGUwg+YDTwZIVYE
 X8rMkjr/xqS5cufa3rGcqK/5Gb8uR7MwHX+EXRWjqAK8lZx9rfk1nL+AVIm1CoBH2joLbdf8R
 NRYzdJXOuvIbbQGP7Vs6iYQ6pkhXhHwdjzr7+mTI5GYbg1bAZd9XYVIcqMi2thMkrSCT/XVXy
 9545j1xi5iOTlu/VNsuREWzzAkdjYGHDv4LZuwI0tpU9ecopBgoE30XO8P6Ufn/h8PbRC0UXh
 FI2Woznb2bcO4ayotlSxMsrZ0AlhRDQHYhu9NdBFtS/r8KDki77t7u0U1Quo5mJwM9Wfonp75
 Wfzjh0zUqoogewdbPNGnaxeAACRzvSYjc+LoYUuC4u3vit1K7jgjaA/FM2UaNbzZV783wyXcD
 53OOdqnJpLB9FsatO1vsAqKiT3+tIJnJlXtoVjVXPSiFK+odlJ/8EALeQOee6IQ6dXo+NdS/Q
 LUvvWqAwPpJ3KJoaaWyWOpTYCJ3fngXVHBSZic7xwseBN3np7YerruKQGx2kXuWCtPFQHwBcm
 hppvo6h3W31wszfYRyctRX9MfVp4rMD6Zf9Oz/nacd/xNC0EqqtU82QBSDjOJTiMIDO5h7Qk5
 GDYWYHSpSxzDHGUwK0ag==
X-Mailman-Approved-At: Mon, 11 Nov 2019 20:52:16 +0100
Subject: Re: [OpenRISC] [PATCH 10/21] asm-generic: ioremap_uc should behave
 the same with and without MMU
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

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTE6MjkgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTE6Mjc6MjdBTSArMDEw
MCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IE9rLCBmYWlyIGVub3VnaC4gTGV0J3MganVzdCBn
byB3aXRoIHlvdXIgdmVyc2lvbiBmb3Igbm93LCBpZiBvbmx5IHRvIG5vdAo+ID4gaG9sZCB5b3Vy
IHNlcmllcyB1cCBtb3JlLiBJJ2Qgc3RpbGwgc3VnZ2VzdCB3ZSBjaGFuZ2UgYXR5ZmIgdG8gb25s
eQo+ID4gdXNlIGlvcmVtYXBfdWMoKSBvbiBpMzg2IGFuZCBtYXliZSBpYTY0LiBJIGNhbiBzZW5k
IGEgcGF0Y2ggZm9yIHRoYXQuCj4KPiBJIGRvbid0IHRoaW5rIHdlIGV2ZW4gbmVlZCBpdCBvbiBp
YTY0LiAgQnV0IGxldHMga2ljayBvZmYgYSBkaWN1c3Npb24KPiB3aXRoIHRoZSBhdHlmYiwgeDg2
IGFuZCBpYTY0IG1haW50YWluZXJzIGFmdGVyIHRoaXMgc2VyaWVzIGlzIGluLgo+IFdoaWNoIHdh
cyBraW5kYSBteSBwbGFuIGFueXdheS4KCkkgbWlzc2VkIHlvdXIgcmVwbHkgYW5kIGFscmVhZHkg
c2VudCBteSBwYXRjaCBub3cuIEkgZ3Vlc3MgaXQgZG9lc24ndApodXJ0IHRvIGRpc2N1c3MgdGhh
dCBpbiBwYXJhbGxlbC4gQW55d2F5IEkgdGhpbmsgdGhhdCB0aGlzIHBhdGNoIGlzIHRoZQpsYXN0
IG9uZSB5b3Ugd2FudCBhbiBBY2sgZnJvbSBtZSBmb3IgKGxldCBtZSBrbm93IGlmIEkgbWlzc2Vk
IG9uZSksIHNvCgpSZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
