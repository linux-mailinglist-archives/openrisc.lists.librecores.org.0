Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C3B89F7423
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A38AB20802;
	Mon, 11 Nov 2019 13:37:48 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by mail.librecores.org (Postfix) with ESMTPS id EFAAF207A0
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:31:23 +0100 (CET)
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mn2Jj-1i5CPc1THT-00k9xC for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:31:23 +0100
Received: by mail-qv1-f43.google.com with SMTP id x14so4658715qvu.0
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:31:23 -0800 (PST)
X-Gm-Message-State: APjAAAUOpBX75lfxfpj5KF3XFMk0xmmFa0xswg4JLiP0bNf1tFFWc8OL
 8IefY5YwP/xj3ldmCmoTgrpfWlxpEJfCbyJ04cM=
X-Google-Smtp-Source: APXvYqxD4F/fwy7LIVnyFzyiMun+f+kScDaMuxMbPMHFdHwTAmNy4Oax48ObAzH1ZmZyCVG2W0sxl5/9Apu79krhc7g=
X-Received: by 2002:a0c:a9cc:: with SMTP id c12mr4561842qvb.222.1573468282069; 
 Mon, 11 Nov 2019 02:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-12-hch@lst.de>
 <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
 <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
In-Reply-To: <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:31:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2a7jwmAKhh3WsowCmvdQpsde5A5nz+3NXRn7amhwUxQg@mail.gmail.com>
Message-ID: <CAK8P3a2a7jwmAKhh3WsowCmvdQpsde5A5nz+3NXRn7amhwUxQg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Provags-ID: V03:K1:qiXoc1jYDB8Za+wQGOTtaeRm8yZV+9iaVv2r/WL3QkzBFQqTqTa
 aIISr96zJE+x/O2YolD0rKu3RMuhTQLID7mGFWiwgIFJfyEYKdi7QSTGVocFjxCtMaYBFTF
 Mc4XYaKwaf67jI5NZegr/N8J5Q8W5fYI3GwJMixAOjlZH1dWheBeVCUoTYqIQZpzRqFr3vG
 pot1YWUwk3dPOlJbAuAvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eBKZj8jJy8c=:LOGTf39OV1MiLlBVEtSqdc
 L5Qq4WProgQMCdS4kdLYb4KmhCdiFlJ9al32U1AWw4zfH6JykfwC7+6v1ofZwu0/VuuJm80h7
 vKZoRAIwdjtwNEypE+ungmwZpQOlJL/BAMvAyVmtFPHq9POBwTeSBtLFP4A8ukk0G4QGGuvQW
 YQWoq2E2GFhJpKuZXRCsS1f24tjdvZB3OMbl9SI5f0i2YRxuE+9JV9F3dUyS4dpOeGIcmXwFb
 jEexd5xPtfGh4jFGD+K9ucpDPNMdFO0UI/Es0g0vSpgHuDTYm9LhgLuB1BM1QpD1haU8Xs7M0
 1hUZMXEiZLvWrna8TF5zQfuV6ku9/sA81PQLTLK9dT/4e9C+KAR+0QrS3UXOXl6cCMAzoTR1L
 VkJDXIqBC654ChtA/mQe5b53Ew+M4GrDnPxVh1iOS8gfuKS6HC46AF13pBFh9YFSAhyV4Za9b
 j6aAjaqHP2vfMOqTI/6v5mbAeB8qJNAIyuYrETNaVwriat4CJXwSc8YLS2uk31PZc2hpS6zzn
 Nfc3JVVAZsEuKTtw6clHdF2TSJq+HPJfIjxDcqOac4wCNgrdqJDrooj5z/WqjVHU9NkC50cGE
 a3fRqAGVgiGzm5f17Qo+dghE1rH/a7iN4ZWM5Yj1FE2dJhsjZJd3bv8PSKWLSM7aTcGF6eVZe
 IiA41nra8QvDcb9NRpDe/+IXcrT7RBDOMIct9KqGK7os9+v7PvDDeYqjvknqQpfZ1tRnC4dwL
 +oFg1omRpktxndTK69s9NxeC36BBGa0iyiHR2Q6TuWwdFXCBhaZ3nn4ql0lAtAmNLPAc4YoUG
 lUX90bYjeQQVphae7vEpUDoaFCVqUD2rt+Lt7e9U02jWKTJEdj60aE5OVV6+QQ/qGcg9X3jke
 9PxtKYVNZqaD1GogBu8A==
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, alpha <linux-alpha@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA3OjE2IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFsbWVyLAo+Cj4gT24gV2VkLCBOb3YgNiwg
MjAxOSBhdCA3OjExIFBNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3Rl
Ogo+ID4gSXQgbG9va3MgbGlrZSB0aGUgZGlmZmVyZW5jZSBpbiBwcm90b3R5cGUgYmV0d2VlbiB0
aGUgYXJjaGl0ZWN0dXJlcyBpcyBiZXR3ZWVuCj4gPgo+ID4gICAgIHZvaWQgX19pb21lbSAqaW9y
ZW1hcChyZXNvdXJjZV9zaXplX3QsIHNpemVfdCkKPiA+ICAgICB2b2lkIF9faW9tZW0gKmlvcmVt
YXAocGh5c19hZGRyX3QsIHNpemVfdCkKPiA+ICAgICB2b2lkIF9faW9tZW0gKmlvcmVtYXAocGh5
c19hZGRyX3QsIHVuc2lnbmVkIGxvbmcpCj4gPiAgICAgdm9pZCBfX2lvbWVtICppb3JlbWFwKHVu
c2lnbmVkIGxvbmcsIHVuc2lnbmVkIGxvbmcpCj4gPgo+ID4gc2hvdWxkbid0IHRoZXkgYWxsIGp1
c3QgYmUgdGhhdCBmaXJzdCBvbmU/ICBJbiBvdGhlciB3b3Jkcywgd291bGRuJ3QgaXQgYmUKPiA+
IGJldHRlciB0byBhbHdheXMgcHJvdmlkZSB0aGUgZ2VuZXJpYyBpb3JlbWFwIHByb3RvdHlwZSBh
bmQgdW5pZnkgdGhlIHBvcnRzCj4gPiBpbnN0ZWFkPwo+Cj4gQWdyZWVkLiBCdXQgSSdkIGdvIGZv
ciB0aGUgc2Vjb25kIG9uZS4KClJpZ2h0LCBwaHlzX2FkZHJfdCBpcyB0aGUgY29ycmVjdCB0eXBl
IGhlcmUsIHJlc291cmNlX3NpemVfdCBpcyBqdXN0IGEgZ2VuZXJpYwp0eXBlIHRoYXQgaXMgYXQg
bGVhc3QgYXMgbG9uZyBhcyBhbnkgcmVzb3VyY2UsIGFuZCB1c3VhbGx5IHRoZSBzYW1lIGFzCnBo
eXNfYWRkcl90LCB3aGljaCBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIGZvciBwaHlzaWNhbCBhZGRy
ZXNzZXMuCgogICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
