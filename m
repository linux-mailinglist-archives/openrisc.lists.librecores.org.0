Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 492C81E505F
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CB14420CF0;
	Wed, 27 May 2020 23:19:52 +0200 (CEST)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 3F7C720BF4
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 10:13:45 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id w20so6404333pga.6
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Pvjwk/n6XpSKsFU1yL/UyqSsSwArACV6a9IFuCvWoI=;
 b=g+OBuTNL+ZECp7gRenSfzoC/L0SIFQs2wUNgQ5XneQ49ve7MCXLFqHyaI1J9HP8hFF
 xZFvHdBiADmGYGqBL80SR5GtgLTUbXo9d3UfqDFFj0SLN/B5WFfGMlNyWLAR+tVbvYCz
 C4EDVhl4IEpe78El/g9Nz+dJDWkO/ABrWAn818mbecK+TzsU4h/qWOTh9KLV22jXIyGm
 SrUEFGzeyILWXpcIFBAIOJnIMer+3w8CniZCi5TVTCW1nLLYmDQxBwulWUNK49ca4BOt
 f5OAT0gMgdznpvyOENVsocczF2HFLHy6Oq37nWMHgKTV2N1Nl/lqod7kwe1GiYzM7JwH
 lhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Pvjwk/n6XpSKsFU1yL/UyqSsSwArACV6a9IFuCvWoI=;
 b=liRQPn4J08RuRaHs3NO89RP9Vqa/xnDLPiYautm6QptIeXhTT4KftAM3smsUDZjzfw
 +Ibki6cjcn5a1QPedqBkKVHReLRKn03EmhPAOjrB/5x59hMqmVwbG0FuybcmKm/5+rJC
 f6iw2taIhL9biq+71C2TV+vEOG+NpmQjYsPOFWBnGC8WsXESyhRaEQpAfS8stXh5dMjP
 jHXFY5n9BRqUWCfuFkjaGaSD0mEozVPPt/ymMQIfYZFayTuZD6bPOTnP1a1pHg5Bi+f9
 r+Qp3vslUE407P1wmazHvPvuUKHqrHWz86Anc+4oRByiYlcpYE09L5a4DK3LJ7+N72/2
 YAvg==
X-Gm-Message-State: AOAM532Q74OaKqV8uQotN0rI0q+uOZ4gAvqrFtOditbBNPKE2yvAFazu
 PY//w4sORw+zmZCW7I06nzg=
X-Google-Smtp-Source: ABdhPJzbLRuMmxwJUPY5sv1El/ZdSk39d9IjzJRaDZ9+OJbVht9mTOUgNcWeTP5sLyuANVdm7nAJ8g==
X-Received: by 2002:a63:554e:: with SMTP id f14mr2850561pgm.191.1590567223153; 
 Wed, 27 May 2020 01:13:43 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id gz19sm1568851pjb.33.2020.05.27.01.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:13:42 -0700 (PDT)
Date: Wed, 27 May 2020 01:13:37 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200527081337.GA3506499@ubuntu-s3-xlarge-x86>
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
 <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH] media: omap3isp: Shuffle cacheflush.h and
 include mm.h
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgR2VlcnQsCgpPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAwOTowMjo1MUFNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgTmF0aGFuLAo+IAo+IENDIExhdXJlbnQKPiAKPiBP
biBXZWQsIE1heSAyNywgMjAyMCBhdCA2OjM3IEFNIE5hdGhhbiBDaGFuY2VsbG9yCj4gPG5hdGVj
aGFuY2VsbG9yQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBBZnRlciBtbS5oIHdhcyByZW1vdmVkIGZy
b20gdGhlIGFzbS1nZW5lcmljIHZlcnNpb24gb2YgY2FjaGVmbHVzaC5oLAo+ID4gczM5MCBhbGx5
ZXNjb25maWcgc2hvd3Mgc2V2ZXJhbCB3YXJuaW5ncyBvZiB0aGUgZm9sbG93aW5nIG5hdHVyZToK
PiA+Cj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9hcmNoL3MzOTAvaW5jbHVkZS9nZW5lcmF0
ZWQvYXNtL2NhY2hlZmx1c2guaDoxLAo+ID4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmM6NDI6Cj4gPiAuL2luY2x1ZGUvYXNtLWdlbmVy
aWMvY2FjaGVmbHVzaC5oOjE2OjQyOiB3YXJuaW5nOiAnc3RydWN0IG1tX3N0cnVjdCcKPiA+IGRl
Y2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNpZGUg
b2YgdGhpcwo+ID4gZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbgo+ID4KPiA+IGNhY2hlZmx1c2gu
aCBkb2VzIG5vdCBpbmNsdWRlIG1tLmggbm9yIGRvZXMgaXQgaW5jbHVkZSBhbnkgZm9yd2FyZAo+
ID4gZGVjbGFyYXRpb24gb2YgdGhlc2Ugc3RydWN0dXJlcyBoZW5jZSB0aGUgd2FybmluZy4gVG8g
YXZvaWQgdGhpcywKPiA+IGluY2x1ZGUgbW0uaCBleHBsaWNpdGx5IGluIHRoaXMgZmlsZSBhbmQg
c2h1ZmZsZSBjYWNoZWZsdXNoLmggYmVsb3cgaXQuCj4gPgo+ID4gRml4ZXM6IDE5YzAwNTQ1OTdh
MCAoImFzbS1nZW5lcmljOiBkb24ndCBpbmNsdWRlIDxsaW51eC9tbS5oPiBpbiBjYWNoZWZsdXNo
LmgiKQo+ID4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9y
QGdtYWlsLmNvbT4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gPiBJIGFtIGF3YXJl
IHRoZSBmaXhlcyB0YWcgaXMga2luZCBvZiBpcnJlbGV2YW50IGJlY2F1c2UgdGhhdCBTSEEgd2ls
bAo+ID4gY2hhbmdlIGluIHRoZSBuZXh0IGxpbnV4LW5leHQgcmV2aXNpb24gYW5kIHRoaXMgd2ls
bCBwcm9iYWJseSBnZXQgZm9sZGVkCj4gPiBpbnRvIHRoZSBvcmlnaW5hbCBwYXRjaCBhbnl3YXlz
IGJ1dCBzdGlsbC4KPiA+Cj4gPiBUaGUgb3RoZXIgc29sdXRpb24gd291bGQgYmUgdG8gYWRkIGZv
cndhcmQgZGVjbGFyYXRpb25zIG9mIHRoZXNlIHN0cnVjdHMKPiA+IHRvIHRoZSB0b3Agb2YgY2Fj
aGVmbHVzaC5oLCBJIGp1c3QgY2hvc2UgdG8gZG8gd2hhdCBDaHJpc3RvcGggZGlkIGluIHRoZQo+
ID4gb3JpZ2luYWwgcGF0Y2guIEkgYW0gaGFwcHkgdG8gZG8gdGhhdCBpbnN0ZWFkIGlmIHlvdSBh
bGwgZmVlbCB0aGF0IGlzCj4gPiBiZXR0ZXIuCj4gCj4gVGhhdCBhY3R1YWxseSBsb29rcyBsaWtl
IGEgYmV0dGVyIHNvbHV0aW9uIHRvIG1lLCBhcyBpdCB3b3VsZCBhZGRyZXNzIHRoZQo+IHByb2Js
ZW0gZm9yIGFsbCB1c2Vycy4KPiAKPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNw
L2lzcC5jIHwgNSArKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
b21hcDNpc3AvaXNwLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jCj4g
PiBpbmRleCBhNGVlNmI4NjY2M2UuLjU0MTA2YTc2OGU1NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmMKPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vb21hcDNpc3AvaXNwLmMKPiA+IEBAIC0zOSw4ICszOSw2IEBACj4gPiAgICogICAg
IFRyb3kgTGFyYW15IDx0LWxhcmFteUB0aS5jb20+Cj4gPiAgICovCj4gPgo+ID4gLSNpbmNsdWRl
IDxhc20vY2FjaGVmbHVzaC5oPgo+ID4gLQo+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvY2xrZGV2Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
Cj4gPiBAQCAtNDksNiArNDcsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KPiA+ICAj
aW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNj
b24uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L29tYXAtaW9tbXUuaD4KPiA+ICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiBAQCAtNTgsNiArNTcsOCBAQAo+ID4gICNpbmNs
dWRlIDxsaW51eC9zY2hlZC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gPgo+
ID4gKyNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgo+ID4gKwo+ID4gICNpZmRlZiBDT05GSUdf
QVJNX0RNQV9VU0VfSU9NTVUKPiA+ICAjaW5jbHVkZSA8YXNtL2RtYS1pb21tdS5oPgo+ID4gICNl
bmRpZgo+IAo+IFdoeSBkb2VzIHRoaXMgZmlsZSBuZWVkIDxhc20vY2FjaGVmbHVzaC5oPiBhdCBh
bGw/Cj4gSXQgZG9lc24ndCBjYWxsIGFueSBvZiB0aGUgZmx1c2hfKigpIGZ1bmN0aW9ucywgYW5k
IHNlZW1zIHRvIGNvbXBpbGUgZmluZQo+IHdpdGhvdXQgKG9uIGFybTMyKS4KPiAKPiBQZXJoYXBz
IGl0IHdhcyBpbmNsdWRlZCBhdCB0aGUgdG9wIGludGVudGlvbmFsbHksIHRvIG92ZXJyaWRlIHRo
ZSBkZWZpbml0aW9ucwo+IG9mIGNvcHlfe3RvLGZyb219X3VzZXJfcGFnZSgpPyBGb3J0dW5hdGVs
eSB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUKPiBjYXNlLCBmcm9tIGEgcXVpY2sgbG9vayBh
dCB0aGUgYXNzZW1ibGVyIG91dHB1dC4KPiAKPiBTbyBsZXQncyBqdXN0IHJlbW92ZSB0aGUgI2lu
Y2x1ZGUgaW5zdGVhZD8KClNvdW5kcyBnb29kIHRvIG1lLiBJIGNhbiBzZW5kIGEgcGF0Y2ggaWYg
bmVlZGVkIG9yIEkgc3VwcG9zZSBBbmRyZXcgY2FuCmp1c3QgbWFrZSBhIHNtYWxsIGZpeHVwIHBh
dGNoIGZvciBpdC4gTGV0IG1lIGtub3cgd2hhdCBJIHNob3VsZCBkby4KCkNoZWVycywKTmF0aGFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
