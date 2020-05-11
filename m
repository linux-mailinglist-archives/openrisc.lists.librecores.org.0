Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5676F1D1FFB
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E697220B69;
	Wed, 13 May 2020 22:17:35 +0200 (CEST)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by mail.librecores.org (Postfix) with ESMTPS id 1276B207D9
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 17:25:58 +0200 (CEST)
Received: by mail-oi1-f193.google.com with SMTP id c124so15195704oib.13
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 08:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzBIrOjeonGRZOL/Fq7k9DQ5ZvmwekoG5+JYmyzDCXE=;
 b=s5cMGpG7VP4Z7WFZPsFToI1nR/fIIsM/Xitsm5weB68T+dfLL2DTqGhsUnx4lEmeiy
 lgMGApODGDFg7vZfVLivsnhqUAW2FH1OklgVfa0oYyUblUC8uQsfm5BnnrC6WN/4Ha7/
 VsdB71XOt/214/9loFYkQ14LNHhOnm4ujzdE0kb9vNChTdvHwnPD/4+JWNVzXxyL+bZx
 SHvD+HlwTVH6JTog19cPKQnNurkq29i5tgavg8X+Sqyyaxe1VAen4HXYV3T2TnW7Pa6q
 qzOSfo8R1Hy5dH1JX3qDrXSeMdFrVbsu9BBad/d9WOGneykMiL4sH5Xtto6Oc8pb3pZs
 yIJQ==
X-Gm-Message-State: AGi0PuYVI9iRbocbBChBSrvl23cAtqR8Lac5/k0dJ9j1MYdvvF9X7oUo
 g+jLIoi5wzeopzeki1fm3sXBd4GjxSDPnl4O4K4=
X-Google-Smtp-Source: APiQypLlj1mTr31cEwJB2xy6sDTZQtzFBc6S7Z09a7MvI75cUG4xFy+vj6rnOik7yeSDKBHlS8j7JE0DJYDjRznsD0s=
X-Received: by 2002:aca:895:: with SMTP id 143mr19322774oii.153.1589210756876; 
 Mon, 11 May 2020 08:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
 <20200511151356.GB28634@lst.de>
In-Reply-To: <20200511151356.GB28634@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 17:25:45 +0200
Message-ID: <CAMuHMdU1xAmyWysi5xRoaRL7PFurPncvEL0CcEY0V_sUz3EJPw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] sort out the flush_icache_range mess
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
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgNToxNCBQTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDk6
NDY6MTdBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gU3VuLCBNYXkg
MTAsIDIwMjAgYXQgOTo1NSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6
Cj4gPiA+IG5vbmUgb2Ygd2hpY2ggcmVhbGx5IGFyZSB1c2VkIGJ5IGEgdHlwaWNhbCBNTVUgZW5h
YmxlZCBrZXJuZWwsIGFzIGEub3V0IGNhbgo+ID4gPiBvbmx5IGJlIGJ1aWxkIGZvciBhbHBoYSBh
bmQgbTY4ayB0byBzdGFydCB3aXRoLgo+ID4KPiA+IFF1b3RpbmcgbXlzZWxmOgo+ID4gIkkgdGhp
bmsgaXQncyBzYWZlIHRvIGFzc3VtZSBubyBvbmUgc3RpbGwgcnVucyBhLm91dCBiaW5hcmllcyBv
biBtNjhrLiIKPiA+IGh0dHA6Ly9sb3JlLmtlcm5lbC5vcmcvci9DQU11SE1kVyttMFErajNyc1Fk
TVhuckVQbStYQjVZMkFRcnhXNXNEMW1aQUtnbUVxb0FAbWFpbC5nbWFpbC5jb20KPgo+IERvIHlv
dSB3YW50IHRvIGRyb3AgdGhlOgo+Cj4gICAgIHNlbGVjdCBIQVZFX0FPVVQgaWYgTU1VCj4KPiBm
b3IgbTY4ayB0aGVuPwoKSWYgdGhhdCBoZWxwcyB0byByZWR1Y2UgbWFpbnRlbmFuY2UsIGl0J3Mg
ZmluZSBmb3IgbWUuClRoYXQgbGVhdmVzIGFscGhhIGFzIHRoZSBzb2xlIHVzZXI/Cgo+IE5vdGUg
dGhhdCB3ZSdsbCBzdGlsbCBuZWVkIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlIGZvciBtNjhrIHdp
dGggbW11LAo+IGFzIGl0IGFsc28gYWxsb3dzIGJpbmZtdF9mbGF0IGZvciBtbXUgY29uZmlncy4K
ClVuZGVyc3Rvb2QuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
