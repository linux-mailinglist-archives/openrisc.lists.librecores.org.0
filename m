Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0571B1E5028
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 832B720CAB;
	Wed, 27 May 2020 23:19:17 +0200 (CEST)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by mail.librecores.org (Postfix) with ESMTPS id 6ABBC20BAC
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 15:45:42 +0200 (CEST)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18CCF5B4;
 Wed, 27 May 2020 15:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590587141;
 bh=FOT36A7X8Hk3Rh2sgJfgv1jk67oSyBWaXMLvby3ZVn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K8tyyqP2+EBqMtHIXAixv68AVoyRavwX2+DntbLh2vrjNKUdhw1kPp5L8v8XcEQke
 5hoxdGk3u1oikaekAvVN79PzMi7aqfwFJI9F8IdAk1sxTLb8aiHOOnYPs49h177hrO
 RBBxk1jZGiThAgDTQMwbMwsU3yghDgrHe9UIOuIk=
Date: Wed, 27 May 2020 16:45:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20200527134527.GD6171@pendragon.ideasonboard.com>
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
 <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
 <20200527081337.GA3506499@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527081337.GA3506499@ubuntu-s3-xlarge-x86>
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
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-media@vger.kernel.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@iki.fi>, alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTmF0aGFuLAoKKENDJ2luZyBTYWthcmkgQWlsdXMgYW5kIHRoZSBsaW51eC1tZWRpYSBtYWls
aW5nIGxpc3QpCgpPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAwMToxMzozN0FNIC0wNzAwLCBOYXRo
YW4gQ2hhbmNlbGxvciB3cm90ZToKPiBPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAwOTowMjo1MUFN
ICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyNywgMjAy
MCBhdCA2OjM3IEFNIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+ID4gPiBBZnRlciBtbS5oIHdh
cyByZW1vdmVkIGZyb20gdGhlIGFzbS1nZW5lcmljIHZlcnNpb24gb2YgY2FjaGVmbHVzaC5oLAo+
ID4gPiBzMzkwIGFsbHllc2NvbmZpZyBzaG93cyBzZXZlcmFsIHdhcm5pbmdzIG9mIHRoZSBmb2xs
b3dpbmcgbmF0dXJlOgo+ID4gPgo+ID4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9hcmNoL3Mz
OTAvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL2NhY2hlZmx1c2guaDoxLAo+ID4gPiAgICAgICAgICAg
ICAgICAgIGZyb20gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9vbWFwM2lzcC9pc3AuYzo0MjoKPiA+
ID4gLi9pbmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1c2guaDoxNjo0Mjogd2FybmluZzogJ3N0
cnVjdCBtbV9zdHJ1Y3QnCj4gPiA+IGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxs
IG5vdCBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhpcwo+ID4gPiBkZWZpbml0aW9uIG9yIGRlY2xh
cmF0aW9uCj4gPiA+Cj4gPiA+IGNhY2hlZmx1c2guaCBkb2VzIG5vdCBpbmNsdWRlIG1tLmggbm9y
IGRvZXMgaXQgaW5jbHVkZSBhbnkgZm9yd2FyZAo+ID4gPiBkZWNsYXJhdGlvbiBvZiB0aGVzZSBz
dHJ1Y3R1cmVzIGhlbmNlIHRoZSB3YXJuaW5nLiBUbyBhdm9pZCB0aGlzLAo+ID4gPiBpbmNsdWRl
IG1tLmggZXhwbGljaXRseSBpbiB0aGlzIGZpbGUgYW5kIHNodWZmbGUgY2FjaGVmbHVzaC5oIGJl
bG93IGl0Lgo+ID4gPgo+ID4gPiBGaXhlczogMTljMDA1NDU5N2EwICgiYXNtLWdlbmVyaWM6IGRv
bid0IGluY2x1ZGUgPGxpbnV4L21tLmg+IGluIGNhY2hlZmx1c2guaCIpCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gPiAK
PiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+IAo+ID4gPiBJIGFtIGF3YXJlIHRoZSBmaXhl
cyB0YWcgaXMga2luZCBvZiBpcnJlbGV2YW50IGJlY2F1c2UgdGhhdCBTSEEgd2lsbAo+ID4gPiBj
aGFuZ2UgaW4gdGhlIG5leHQgbGludXgtbmV4dCByZXZpc2lvbiBhbmQgdGhpcyB3aWxsIHByb2Jh
Ymx5IGdldCBmb2xkZWQKPiA+ID4gaW50byB0aGUgb3JpZ2luYWwgcGF0Y2ggYW55d2F5cyBidXQg
c3RpbGwuCj4gPiA+Cj4gPiA+IFRoZSBvdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBhZGQgZm9y
d2FyZCBkZWNsYXJhdGlvbnMgb2YgdGhlc2Ugc3RydWN0cwo+ID4gPiB0byB0aGUgdG9wIG9mIGNh
Y2hlZmx1c2guaCwgSSBqdXN0IGNob3NlIHRvIGRvIHdoYXQgQ2hyaXN0b3BoIGRpZCBpbiB0aGUK
PiA+ID4gb3JpZ2luYWwgcGF0Y2guIEkgYW0gaGFwcHkgdG8gZG8gdGhhdCBpbnN0ZWFkIGlmIHlv
dSBhbGwgZmVlbCB0aGF0IGlzCj4gPiA+IGJldHRlci4KPiA+IAo+ID4gVGhhdCBhY3R1YWxseSBs
b29rcyBsaWtlIGEgYmV0dGVyIHNvbHV0aW9uIHRvIG1lLCBhcyBpdCB3b3VsZCBhZGRyZXNzIHRo
ZQo+ID4gcHJvYmxlbSBmb3IgYWxsIHVzZXJzLgoKSGVhZGVycyBzaG91bGQgYmUgc2VsZi1jb250
YWluZWQsIHNvIHRoYXQgd291bGQgYmUgdGhlIGJlc3QgZml4IGluIG15Cm9waW5pb24uCgpUaGlz
IGJlaW5nIHNhaWQsIGFzIGNhY2hlZmx1c2guaCBpc24ndCBuZWVkZWQgaW4gaXNwLmMsIEkgdGhp
bmsgd2UKc2hvdWxkIGFsc28gZHJvcCBpdC4gSXQgc2VlbXMgdG8gaGF2ZSBiZWVuIGluY2x1ZGVk
IHRoZXJlIHNpbmNlIHRoZQpmaXJzdCBkcml2ZXIgdmVyc2lvbiwgYW5kIHdhcyBsaWtlbHkgYSBs
ZWZ0LW92ZXIgZnJvbSB0aGUgb3V0LW9mLXRyZWUKZGV2ZWxvcG1lbnQuIE1hbnVhbCBjYWNoZSBo
YW5kbGluZyB3YXMgcGFydCBvZgpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcHF1
ZXVlLmMgYW5kIGhhcyBiZWVuIHJlbW92ZWQgaW4KY29tbWl0IGZiYWMxNDAwYmQxYSAoIlttZWRp
YV0gb21hcDNpc3A6IE1vdmUgdG8gdmlkZW9idWYyIikuCgpjYWNoZWZsdXNoLmggY2FuIGFsc28g
YmUgZHJvcHBlZCBmcm9tIGlzcHZpZGVvLmMgd2hpY2ggc3VmZmVycyBmcm9tIHRoZQpzYW1lIGlz
c3VlLgoKPiA+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmMgfCA1ICsr
Ky0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9vbWFwM2lz
cC9pc3AuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmMKPiA+ID4gaW5k
ZXggYTRlZTZiODY2NjNlLi41NDEwNmE3NjhlNTQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vb21hcDNpc3AvaXNwLmMKPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9vbWFwM2lzcC9pc3AuYwo+ID4gPiBAQCAtMzksOCArMzksNiBAQAo+ID4gPiAgICog
ICAgIFRyb3kgTGFyYW15IDx0LWxhcmFteUB0aS5jb20+Cj4gPiA+ICAgKi8KPiA+ID4KPiA+ID4g
LSNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgo+ID4gPiAtCj4gPiA+ICAjaW5jbHVkZSA8bGlu
dXgvY2xrLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvY2xrZGV2Lmg+Cj4gPiA+ICAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KPiA+ID4gQEAgLTQ5LDYgKzQ3LDcgQEAKPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9pMmMuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiA+ID4g
ICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW0u
aD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9vbWFwLWlvbW11Lmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
Cj4gPiA+IEBAIC01OCw2ICs1Nyw4IEBACj4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gPiA+Cj4gPiA+ICsjaW5jbHVkZSA8
YXNtL2NhY2hlZmx1c2guaD4KPiA+ID4gKwo+ID4gPiAgI2lmZGVmIENPTkZJR19BUk1fRE1BX1VT
RV9JT01NVQo+ID4gPiAgI2luY2x1ZGUgPGFzbS9kbWEtaW9tbXUuaD4KPiA+ID4gICNlbmRpZgo+
ID4gCj4gPiBXaHkgZG9lcyB0aGlzIGZpbGUgbmVlZCA8YXNtL2NhY2hlZmx1c2guaD4gYXQgYWxs
Pwo+ID4gSXQgZG9lc24ndCBjYWxsIGFueSBvZiB0aGUgZmx1c2hfKigpIGZ1bmN0aW9ucywgYW5k
IHNlZW1zIHRvIGNvbXBpbGUgZmluZQo+ID4gd2l0aG91dCAob24gYXJtMzIpLgo+ID4gCj4gPiBQ
ZXJoYXBzIGl0IHdhcyBpbmNsdWRlZCBhdCB0aGUgdG9wIGludGVudGlvbmFsbHksIHRvIG92ZXJy
aWRlIHRoZSBkZWZpbml0aW9ucwo+ID4gb2YgY29weV97dG8sZnJvbX1fdXNlcl9wYWdlKCk/IEZv
cnR1bmF0ZWx5IHRoYXQgZG9lc24ndCBzZWVtIHRvIGJlIHRoZQo+ID4gY2FzZSwgZnJvbSBhIHF1
aWNrIGxvb2sgYXQgdGhlIGFzc2VtYmxlciBvdXRwdXQuCj4gPiAKPiA+IFNvIGxldCdzIGp1c3Qg
cmVtb3ZlIHRoZSAjaW5jbHVkZSBpbnN0ZWFkPwo+IAo+IFNvdW5kcyBnb29kIHRvIG1lLiBJIGNh
biBzZW5kIGEgcGF0Y2ggaWYgbmVlZGVkIG9yIEkgc3VwcG9zZSBBbmRyZXcgY2FuCj4ganVzdCBt
YWtlIGEgc21hbGwgZml4dXAgcGF0Y2ggZm9yIGl0LiBMZXQgbWUga25vdyB3aGF0IEkgc2hvdWxk
IGRvLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
