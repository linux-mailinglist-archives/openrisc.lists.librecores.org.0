Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9053BF7425
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 72EEA20808;
	Mon, 11 Nov 2019 13:37:49 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by mail.librecores.org (Postfix) with ESMTPS id A8871207A1
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:36:40 +0100 (CET)
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MjjGX-1i1suJ0QHb-00lHGj for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:36:40 +0100
Received: by mail-qv1-f45.google.com with SMTP id g18so4645272qvp.8
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:36:39 -0800 (PST)
X-Gm-Message-State: APjAAAXQS7t68i6SFp3HSPrkv8nT91PD7CfLcL9/lvWtAxr75gi0oEqv
 D9DIuC7qUlTtpv3xX1OJ+UzMyECs29A+dT+1ktg=
X-Google-Smtp-Source: APXvYqwG9UjDI7BT4/zArLXJROi41Jfl0ozvIqGD8Z6sQp9Psd5jWuuWMeGtnWBnULPRq767xF7AmE4x/PyrFGraS9U=
X-Received: by 2002:a0c:a9cc:: with SMTP id c12mr4580319qvb.222.1573468598676; 
 Mon, 11 Nov 2019 02:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-4-hch@lst.de>
In-Reply-To: <20191029064834.23438-4-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:36:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3k2KRyhCy4OWJkToNBiw_mw0e_A=Ta6UANMMF3EXnhmA@mail.gmail.com>
Message-ID: <CAK8P3a3k2KRyhCy4OWJkToNBiw_mw0e_A=Ta6UANMMF3EXnhmA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:Zo1P0JwOlGKUfp88U/4ehU3C0Qf/OzjnrtbB3YxocsoHrlhSn4E
 /7ynSz3iZr8uK3OtoYK+0owWOhuSEInK7063AaxAKNFrq/WDT8v7amOV+zLHvuWovdgPqg0
 3JVWcaLvQ65K8uTriDzQupSm9Co/RPzcgrVwF4PAwC7ACKZhMzoi9O6W/ZVTBSGLAQAfa5i
 xmEt2x79+06KU4rfhK7Pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:plLXpi8DyoU=:Z1bkyBWlkePa+6PKYftDV9
 6R/n3EEAQoIi+M7PGp7r+NttfYiVFpyJVqF47mVljSvyr3lKv/ZOz+zIg2L8IZ+c3BaEjD+j7
 Pf1GwHcmgWGAcEMDhStFxHpB5azhy84XQlGpx9ySoP0+H2PzxTn2cEuVYWyRiEFOz+dtE2hKx
 A53bxaS7se3LEZcjI5DwK1LGTQwmzw4mh73aTGTsD/H5FjHhvHEkbDdwpt5D2totlCY6TeSg6
 kvYEk9m3XQq07TdJk9GmE1+riKRE4QLI+nV2m9rzeqazySFj24lmIBfG6Cd/BSUfAonJwhCOT
 aZuqWMVdfnpkixWZ4QYRpTuQ8BEMbFIkUb5gPc3nJYSRyZYjrgmnR6qDFCWXymmmOTlvxeNZ0
 UAp5ZAkTyNVVo1aDd26rZ6pfI/s6WuNcOf+imwTL/L5ui/a1p235JlIHTnk3BtydanG/KTCzm
 JBpWtvKpajoRvCmXwA1kz5a+ZTM+6ijTM1qVjCQJA1Wq0A2jd/7uhXq2RXiQEeBZ/GMZ93TXO
 M1iQPfGJIyJ0wKJzepdOyNM+Ul87RKWaVupIy+Fggii4Rz4VP9o57vATCFUDkbvzOiyj/ecSE
 HkZU1MiZ7Feh7Zq8B4zDYOjl2dGxMPz2xiXVYCz7z3YPxyraqWci5IvM4hT4ZKDFegq2KHMoI
 7rJE7UH/QlBza74meEVEM//vGwqLlTIVEiDvZqgwfqULzQDnBcMmDbljWjbb7+H0nwJoDYyNL
 ejNBmMpSffDyhKcoPCvrr89f/8478nL+yULpionfjP4e0hMrhYKvZy0gapxaMDLtI/5KAsJht
 GZZ8/+oas1Ez6y8QuV0YqrwNjp3VccDPyyMlOb/wvdUaNHq5rJc0JI4sRACRl5pdEzxF2d8R3
 RocG8RrXYxlq2qfD4h5A==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 03/21] ia64: rename ioremap_nocache to
 ioremap_uc
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
dC5kZT4gd3JvdGU6Cj4KPiBPbiBpYTY0IGlvcmVtYXBfbm9jYWNoZSBmYWlscyBpZiBhdHRyaWJ1
dGVzIGRvbid0IG1hdGNoLiAgTm90IG90aGVyCj4gYXJjaGl0ZWN0dXJlcyBkb2VzIHRoaXMsIGFu
ZCB3ZSBwbGFuIHRvIGdldCByaWQgb2YgaW9yZW1hcF9ub2NhY2hlLgo+IFNvIGdldCByaWQgb2Yg
dGhlIHNwZWNpYWwgc2VtYW50aWNzIGFuZCBkZWZpbmUgaW9yZW1hcF9ub2NhY2hlIGluCj4gdGVy
bXMgb2YgaW9yZW1hcCBhcyBubyBwb3J0YWJsZSBkcml2ZXIgY291bGQgcmVseSBvbiB0aGUgYmVo
YXZpb3IKPiBhbnl3YXkuCj4KPiBIb3dldmVyIHg4NiBpbXBsZW1lbnRzIGlvcmVtYXBfdWMgaW4g
YSBzaW1pbGFyIHdheSBhcyB0aGUgaWE2NAo+IHZlcnNpb24gb2YgaW9yZW1hcF9ub2NhY2hlLCBp
biB0aGF0IGl0IGlnbm9yZXMgdGhlIGZpcm13YXJlIHRhYmxlcy4KPiBTd2l0Y2ggaWE2NCB0byBv
dmVycmlkZSBpb3JlbWFwX3VjIGluc3RlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KCkdvb2QgaWRlYSwKClJldmlld2VkLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
