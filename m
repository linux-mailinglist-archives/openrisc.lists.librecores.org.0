Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 90269F741C
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6336320784;
	Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by mail.librecores.org (Postfix) with ESMTPS id 015D3206B8
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:09:23 +0100 (CET)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N2VKr-1hlSwe0tTD-013yAm for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:09:23 +0100
Received: by mail-qt1-f180.google.com with SMTP id o11so15010996qtr.11
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:09:22 -0800 (PST)
X-Gm-Message-State: APjAAAUbB2P1FfWSExoElLro/V67BFTsPOLb+7osCpm838mM2sh0+YA1
 eW80Pr/h+8uxcwFDzaoRIa8xx1oKeh2M+K1AriI=
X-Google-Smtp-Source: APXvYqwUFI9CNnIwrAVKasmsTd09tLHKshCq1NYJLSrtULcDmOA+h22x7/m2tzlDDqS3Yhkmt+6zqdhU/D75oBqf0Ro=
X-Received: by 2002:aed:3e41:: with SMTP id m1mr16150881qtf.142.1573466961656; 
 Mon, 11 Nov 2019 02:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-11-hch@lst.de>
In-Reply-To: <20191029064834.23438-11-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:09:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
Message-ID: <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:DvmfRSEsD7SwrvD6qQ7YnSDoJ2A28IwQVsxY7wKAgUAdZ4FG3Jy
 LwdHt2WK8uYfPMdLhFDm9MBiff8DcvQTS0mNERt9LLYdDBRd4QC4LOTse4XLxMClsxF7FzZ
 q89vIw5lDVz2Uf+jAdDzTxZlKLvF6u/lC+zoS27Fdlkfg1CixAECEfamJzeiKgeNekIrM59
 LyXUXmnfAP86lRjVfVYkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BMHPLRDRCBE=:EfFg5b4QDoOrM7VPLSGsKo
 n9VkCxf5V6M41q7d+QJqgSPhiKpmswF6nk/3ORwPNvysS7UrW206Zq5JPyJXkHMdpnwkqyp5Z
 9wrAo5EgjV+oT14FEIkacRcMfRyViNiAkMh3RupoxWlLa5d1QRZ03Eq1R+yo1yqHF5McyGQ7a
 p+PHOyWSeyd3NHvgj15abZ1e7oKGLdbdGBsomCgDNAxQZc4BhtiUC6ZMwqJIXLMQBmz5EZf2r
 ovmQX31zoKKcAUuDV5o8RUdSaa3hd/9y/K1YgllnftWFW6cftqqyjYzl7dPztvH3vAKNkFa9D
 pzCfltPS2rRrpFYRhurcvcBGkT7T6PuBn5TJB5Y7B0SY/dg49WuNQNEoNKamd8i4FjYySR/xM
 vNAwBITxZgME20PJrxelYKoPHRlKRX7HThgaF3H8ShTGo8toGJReqS1HOlnNGdWRjW7K9Esi3
 ttUaiUXBeH0e080dVFnBmIsfFRRPj62rIg/4G08e2mZ7Jrjfl4tE7Wz+t/wwbBp1rPC2A5ekK
 iM5PdyhP1rN/8NeT+gtyOC+KUe9YDgZuRkzrzlzKEfrA0hwniGSskaL5jujHPlPwF6fMbzH1G
 umf4jeM8hfsE6qkOytBq8RIZT70zViQ9M8xH2/AQ2GnM1xzYkONI+ql+Oh8rVkY5jWCJiOg66
 4eTPlR9EGPtETqi9hVF9ub9zCfqnWkd1qGrh2157ERzlMn7FwQkuLT0DIz9/N1hDF0dHxHkAI
 bzrqA3jcC2BWQJDpoWIyBqtowY2PVx0e0bW88sIsBUvGCMEIqv9cWF+iXP0VrWSIhG6J3zy+C
 +oN6mxvYKSGcUdKBAAi4RWNgdfL/brJlTa2gt0AuK7rAa1Pp+2QX7cPi7EM7FxNzGuAELcA8J
 lg+Mj7R/fWNwaAx+4FpA==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
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

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgNzo0OSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBXaGF0ZXZlciByZWFzb24gdGhlcmUgaXMgZm9yIHRoZSBleGlzdGVu
Y2Ugb2YgaW9yZW1hcF91YywgYW5kIHRoZSBmYWN0Cj4gdGhhdCBpdCByZXR1cm5zIE5VTEwgYnkg
ZGVmYXVsdCBvbiBhcmNoaXRlY3R1cmVzIHdpdGggYW4gTU1VIGFwcGxpZXMKPiBlcXVhbGx5IHRv
IG5vbW11IGFyY2hpdGVjdHVyZXMsIHNvIGRvbid0IHByb3ZpZGUgZGlmZmVyZW50IGRlZmF1bHRz
LgoKTWFrZXMgc2Vuc2UuCgo+IEluIHByYWN0aWNlIHRoZSBkaWZmZXJlbmNlIGlzIG1lYW5pbmds
ZXNzIGFzIHRoZSBvbmx5IHBvcnRhYmxlIGRyaXZlcgo+IHRoYXQgdXNlcyBpb3JlbWFwX3VjIGlz
IGF0eWZiIHdoaWNoIHByb2JhYmx5IGRvZXNuJ3Qgc2hvdyB1cCBvbiBub21tdQo+IGRldmljZXMu
CgoKCj4gKy8qCj4gKyAqIGlvcmVtYXBfdWMgaXMgc3BlY2lhbCBpbiB0aGF0IHdlIGRvIHJlcXVp
cmUgYW4gZXhwbGljaXQgYXJjaGl0ZWN0dXJlCj4gKyAqIGltcGxlbWVudGF0aW9uLiAgSW4gZ2Vu
ZXJhbCB5b3UgZG8gbm93IHdhbnQgdG8gdXNlIHRoaXMgZnVuY3Rpb24gaW4gYQo+ICsgKiBkcml2
ZXIgYW5kIHVzZSBwbGFpbiBpb3JlbWFwLCB3aGljaCBpcyB1bmNhY2hlZCBieSBkZWZhdWx0LiAg
U2ltaWxhcmx5Cj4gKyAqIGFyY2hpdGVjdHVyZXMgc2hvdWxkIG5vdCBpbXBsZW1lbnQgaXQgdW5s
ZXNzIHRoZXkgaGF2ZSBhIHZlcnkgZ29vZAo+ICsgKiByZWFzb24uCj4gKyAqLwo+ICsjaWZuZGVm
IGlvcmVtYXBfdWMKPiArI2RlZmluZSBpb3JlbWFwX3VjIGlvcmVtYXBfdWMKPiArc3RhdGljIGlu
bGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfdWMocGh5c19hZGRyX3Qgb2Zmc2V0LCBzaXplX3Qg
c2l6ZSkKPiArewo+ICsgICAgICAgcmV0dXJuIE5VTEw7Cj4gK30KPiArI2VuZGlmCgpNYXliZSB3
ZSBjb3VsZCBtb3ZlIHRoZSBkZWZpbml0aW9uIGludG8gdGhlIGF0eWZiIGRyaXZlciBpdHNlbGY/
CgpBcyBJIHVuZGVyc3RhbmQgaXQsIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gaW9yZW1hcCgpL2lv
cmVtYXBfbm9jYWNoZSgpCmFuZCBpb3JlbWFwX3VjKCkgb25seSBleGlzdHMgb24gcHJlLVBBVCB4
ODYtMzIgc3lzdGVtcyAoaS5lLiA0ODYsIFA1LApQcHJvLCBQSUksIEs2LCBWSUEgQzMpLCB3aGls
ZSBvbiBtb3JlIG1vZGVybiBzeXN0ZW1zIChhbGwgbm9uLXg4NiwKUGVudGl1bUlJSSwgQXRobG9u
LCBWSUEgQzcpICB0aG9zZSB0aHJlZSBhcmUgbWVhbnQgdG8gYmUgc3lub255bXMKYW55d2F5LgoK
ICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
