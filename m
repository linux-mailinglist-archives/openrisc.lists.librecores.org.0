Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4014AF741E
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1E527207C0;
	Mon, 11 Nov 2019 13:37:47 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by mail.librecores.org (Postfix) with ESMTPS id 0BD5F20791
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:11:18 +0100 (CET)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVe1U-1iMRgP1HTY-00RWBk for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:11:17 +0100
Received: by mail-qv1-f41.google.com with SMTP id i3so4435804qvv.7
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:11:16 -0800 (PST)
X-Gm-Message-State: APjAAAX42HE98+txD9+fjaSEyd1w4Uys+VINSbcEbbTD1vFTaqGJzDln
 /FV/6J904dYbEADIrs7M9aTvE4n+ugxzghMHm/g=
X-Google-Smtp-Source: APXvYqyPlYZ0IqFyt+F/Kw+2cGPdhPemO7nTBHjMV2hNTSSGSuWp0EuM7jgO4bHxqVV9VdMKLREBG37EpIWZ8cUBhPs=
X-Received: by 2002:a05:6214:2c2:: with SMTP id
 g2mr4941532qvu.210.1573467075908; 
 Mon, 11 Nov 2019 02:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-18-hch@lst.de>
In-Reply-To: <20191029064834.23438-18-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:10:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zfmup8DYQQnT3GNCkgcv9cWxejj2QAr+FmYWs46ZuHQ@mail.gmail.com>
Message-ID: <CAK8P3a0zfmup8DYQQnT3GNCkgcv9cWxejj2QAr+FmYWs46ZuHQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:seT5f7QPiVNimFQgBAKH+tzlyyEha5Sz/BPDdSdm9ONciA0mbb4
 NCXbkY5frJfLH2/ogtFjal7lJRQU4GsCulSCncMhXMMqVktucxvudXIclGDuRgqhwDmmlRa
 rGswByFcU52l4FPpqUCmvaiMuiyo8wkKI8pVKKBeYDwf5VNEREdmLvIQVLdhKymN59e1mMd
 dyZR0xFr2W+WxfhTG3RnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f2d4UPU6qiI=:CfycTC8EOnlH+7uOo7dxp3
 01hAYF07Bi2IL+rJS61DVnEqqN0LYzIpLp6Nf88Xgq2W/qUsfgdbHCTIyUnoi5yojD1qtIfYD
 5FCjkUQcmc1QY6mRrcsa1dW+ZV0Dl8f2Z1z9CItoQykmvMKgd1mnsj1Ea8GrR7c6RJ5+KISED
 5nlZ96whk00QIA2vWc6HDHG8tgdc7PMGtLUOz7E+TuYYkUX0jRHrzIHxiAEdPCKgOSav27T9x
 9TwD+DE9tQTzGYThRPfZGaN0S/IQJG4gJ+oNE/l6rH2dMYB9F4z3HliGriU2z6goNGCud6QEl
 qvlnnmFu8ZyUqNt4wBrH9uTfWaPnP+RAI2OidsT8k/aeR1nyLACh8vEaJ24bKQ0egAMEYS0Qb
 OSG9D0xcgGNks8gxY3jCz/AtIDkNYv5n8+Qy5matRr9qE7HgzXvevL0NTHaknE3ZeOZf8xqJj
 /5flc9eb+vyrxpVmSgfaf8YGOUJNn4YRQcQlTYovyCRRENwi5/ik9RQkDIhRybye3UkyXMw3f
 fxDbzO3azO7URoxlsFXWts+nkFeGgUxafboj+J/uqbxDyUx8Kz3JtGEd7CNXup4sUOAcb+mph
 aTKQcHWx+8W7t6PYT056AdlkAowRnF6xyNdN0KA4PxQLLdG5enqbAH2IgtIDUVbO58dH6IwSl
 KleQ3qbC4y3tKv1Mg9kQFo36h5BtVc+dKGTEdjbCLA8I3+M3q6o9EFNz1p0naU79R6cs+MGkC
 3Ov970ifMot3bPLHEuDkjUH891aX/ixA8Qm1cd2QnbZcRN3r3QwVAvz048q8OSidpeUYIcQd2
 edKFwyMCGLRm0kj7bDmqdsbcnBdBu9ejJ1F/jYBkqUBY+LslwYTYoJNGpq+xnJFek8B0d6ZS1
 hUvtaFCQEsi4ByARFyqQ==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 17/21] lib: provide a simple generic ioremap
 implementation
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
dC5kZT4gd3JvdGU6Cj4KPiBBIGxvdCBvZiBhcmNoaXRlY3R1cmVzIHJldXNlIHRoZSBzYW1lIHNp
bXBsZSBpb3JlbWFwIGltcGxlbWVudGF0aW9uLCBzbwo+IHN0YXJ0IGxpZnRpbmcgdGhlIG1vc3Qg
c2ltcGxlIHZhcmlhbnQgdG8gbGliL2lvcmVtYXAuYy4gIEl0IHByb3ZpZGVzCj4gaW9yZW1hcF9w
cm90IGFuZCBpb3VubWFwLCBwbHVzIGEgZGVmYXVsdCBpb3JlbWFwIHRoYXQgdXNlcyBwcm90X25v
bmNhY2hlZCwKPiBhbHRob3VnaCB0aGF0IGNhbiBiZSBvdmVycmlkZGVuIGJ5IGFzbS9pby5oLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpSZXZpZXdl
ZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
