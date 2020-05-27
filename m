Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2A44F1E505E
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EB51620CF1;
	Wed, 27 May 2020 23:19:51 +0200 (CEST)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by mail.librecores.org (Postfix) with ESMTPS id A41B420BED
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 09:03:04 +0200 (CEST)
Received: by mail-oi1-f195.google.com with SMTP id m67so10517796oif.4
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 00:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmrgkNrS7YJyoX//CVVX8i/eCGz9CaA9GDfJeRj6hok=;
 b=cUme1d9695eqUqvo5/eqURSLnj5Ifw89ZGmYi/TBKu/nO1w8b2vBcWDdgwkEfjzcsx
 2b8IGFFMYsD718ztASgYNl611wDUer5/usQtbo1CA1IGZb4INpOjU4c3EkMHwLO+sVgo
 TtrA7kWpc0HDA7gKGOJ45JwdhMtHbeWOk6+pNfDF//yh9/jXMhSWcjbE2qIISHSaM+f+
 lw4273ZH7RwC57WytP9jMoHgprqtX0qWBkBZTR5Izy/hpHNI+UngW1Ywbti3479eAdmQ
 ZAbfMY9a5xt+Ww/Q9M5OKMwCJIBM9XsesTx2IvYgOfMuc07f9Ij67GsHr9WZtYbz6ydl
 Ua0w==
X-Gm-Message-State: AOAM531mEFhqIQogDgD7MPhKChb1XcElD06lPfd0zXAXW9bavmViASR1
 iV+l5+JlOfWoKTMB9x9x3tod1+Q8LOvLY6UFZYo=
X-Google-Smtp-Source: ABdhPJyJItgq7CbQXJlF6MFLLk/+bu/fSz/XUZ+gwTEqMYOT9P6OwO82+92+P3alNyNfXtW65E6GNWlSoFsc0hwoXsQ=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr1778697oic.54.1590562983010; 
 Wed, 27 May 2020 00:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
In-Reply-To: <20200527043426.3242439-1-natechancellor@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2020 09:02:51 +0200
Message-ID: <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
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

SGkgTmF0aGFuLAoKQ0MgTGF1cmVudAoKT24gV2VkLCBNYXkgMjcsIDIwMjAgYXQgNjozNyBBTSBO
YXRoYW4gQ2hhbmNlbGxvcgo8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPiBBZnRl
ciBtbS5oIHdhcyByZW1vdmVkIGZyb20gdGhlIGFzbS1nZW5lcmljIHZlcnNpb24gb2YgY2FjaGVm
bHVzaC5oLAo+IHMzOTAgYWxseWVzY29uZmlnIHNob3dzIHNldmVyYWwgd2FybmluZ3Mgb2YgdGhl
IGZvbGxvd2luZyBuYXR1cmU6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9hcmNoL3MzOTAv
aW5jbHVkZS9nZW5lcmF0ZWQvYXNtL2NhY2hlZmx1c2guaDoxLAo+ICAgICAgICAgICAgICAgICAg
ZnJvbSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jOjQyOgo+IC4vaW5jbHVk
ZS9hc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmg6MTY6NDI6IHdhcm5pbmc6ICdzdHJ1Y3QgbW1fc3Ry
dWN0Jwo+IGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxl
IG91dHNpZGUgb2YgdGhpcwo+IGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KPgo+IGNhY2hlZmx1
c2guaCBkb2VzIG5vdCBpbmNsdWRlIG1tLmggbm9yIGRvZXMgaXQgaW5jbHVkZSBhbnkgZm9yd2Fy
ZAo+IGRlY2xhcmF0aW9uIG9mIHRoZXNlIHN0cnVjdHVyZXMgaGVuY2UgdGhlIHdhcm5pbmcuIFRv
IGF2b2lkIHRoaXMsCj4gaW5jbHVkZSBtbS5oIGV4cGxpY2l0bHkgaW4gdGhpcyBmaWxlIGFuZCBz
aHVmZmxlIGNhY2hlZmx1c2guaCBiZWxvdyBpdC4KPgo+IEZpeGVzOiAxOWMwMDU0NTk3YTAgKCJh
c20tZ2VuZXJpYzogZG9uJ3QgaW5jbHVkZSA8bGludXgvbW0uaD4gaW4gY2FjaGVmbHVzaC5oIikK
PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwu
Y29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiBJIGFtIGF3YXJlIHRoZSBmaXhlcyB0YWcg
aXMga2luZCBvZiBpcnJlbGV2YW50IGJlY2F1c2UgdGhhdCBTSEEgd2lsbAo+IGNoYW5nZSBpbiB0
aGUgbmV4dCBsaW51eC1uZXh0IHJldmlzaW9uIGFuZCB0aGlzIHdpbGwgcHJvYmFibHkgZ2V0IGZv
bGRlZAo+IGludG8gdGhlIG9yaWdpbmFsIHBhdGNoIGFueXdheXMgYnV0IHN0aWxsLgo+Cj4gVGhl
IG90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGFkZCBmb3J3YXJkIGRlY2xhcmF0aW9ucyBvZiB0
aGVzZSBzdHJ1Y3RzCj4gdG8gdGhlIHRvcCBvZiBjYWNoZWZsdXNoLmgsIEkganVzdCBjaG9zZSB0
byBkbyB3aGF0IENocmlzdG9waCBkaWQgaW4gdGhlCj4gb3JpZ2luYWwgcGF0Y2guIEkgYW0gaGFw
cHkgdG8gZG8gdGhhdCBpbnN0ZWFkIGlmIHlvdSBhbGwgZmVlbCB0aGF0IGlzCj4gYmV0dGVyLgoK
VGhhdCBhY3R1YWxseSBsb29rcyBsaWtlIGEgYmV0dGVyIHNvbHV0aW9uIHRvIG1lLCBhcyBpdCB3
b3VsZCBhZGRyZXNzIHRoZQpwcm9ibGVtIGZvciBhbGwgdXNlcnMuCgo+ICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAz
aXNwL2lzcC5jCj4gaW5kZXggYTRlZTZiODY2NjNlLi41NDEwNmE3NjhlNTQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9vbWFwM2lzcC9pc3AuYwo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmMKPiBAQCAtMzksOCArMzksNiBAQAo+ICAgKiAg
ICAgVHJveSBMYXJhbXkgPHQtbGFyYW15QHRpLmNvbT4KPiAgICovCj4KPiAtI2luY2x1ZGUgPGFz
bS9jYWNoZWZsdXNoLmg+Cj4gLQo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9jbGtkZXYuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gQEAgLTQ5LDYg
KzQ3LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9tbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9vbWFwLWlvbW11Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiBA
QCAtNTgsNiArNTcsOCBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L3ZtYWxsb2MuaD4KPgo+ICsjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiArCj4g
ICNpZmRlZiBDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUKPiAgI2luY2x1ZGUgPGFzbS9kbWEtaW9t
bXUuaD4KPiAgI2VuZGlmCgpXaHkgZG9lcyB0aGlzIGZpbGUgbmVlZCA8YXNtL2NhY2hlZmx1c2gu
aD4gYXQgYWxsPwpJdCBkb2Vzbid0IGNhbGwgYW55IG9mIHRoZSBmbHVzaF8qKCkgZnVuY3Rpb25z
LCBhbmQgc2VlbXMgdG8gY29tcGlsZSBmaW5lCndpdGhvdXQgKG9uIGFybTMyKS4KClBlcmhhcHMg
aXQgd2FzIGluY2x1ZGVkIGF0IHRoZSB0b3AgaW50ZW50aW9uYWxseSwgdG8gb3ZlcnJpZGUgdGhl
IGRlZmluaXRpb25zCm9mIGNvcHlfe3RvLGZyb219X3VzZXJfcGFnZSgpPyBGb3J0dW5hdGVseSB0
aGF0IGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUKY2FzZSwgZnJvbSBhIHF1aWNrIGxvb2sgYXQgdGhl
IGFzc2VtYmxlciBvdXRwdXQuCgpTbyBsZXQncyBqdXN0IHJlbW92ZSB0aGUgI2luY2x1ZGUgaW5z
dGVhZD8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
