Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 346CD35915B
	for <lists+openrisc@lfdr.de>; Fri,  9 Apr 2021 03:24:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 913C92131A;
	Fri,  9 Apr 2021 03:24:03 +0200 (CEST)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mail.librecores.org (Postfix) with ESMTPS id F26DC210A8
 for <openrisc@lists.librecores.org>; Fri,  9 Apr 2021 03:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1925; q=dns/txt; s=iport;
 t=1617931441; x=1619141041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WkzLqPqjAxF6Ch0t2FT084suyCe7GM/KMpezthHSR4s=;
 b=ZzHqIxhBhc5uVniZVuj9Kr4XvXO8jEWxA2CAbdxiILixuT0nsQexod31
 BEQ8EWbnTbLmqojDhLyXHFv6m/IMfvtCKhamNeMpIUAQZP3ORSqK03PXl
 2k2q5AFxPqdfYbdxUWr88XzdpBDnTxxJghkgEuR+Cf5yGBQ3HLMcPGwk3 A=;
X-IPAS-Result: =?us-ascii?q?A0ABAAAUrG9gmIENJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE+BQEBAQELAYN3ATmNF4k1kA2KXIF8CwEBAQ0BATQEAQGEU?=
 =?us-ascii?q?AKBdwIlNAkOAgMBAQEDAgMBAQEBAQUBAQECAQYEFAEBAQEBAQEBaIVdhkUBA?=
 =?us-ascii?q?gM6OgUQCxIGLjwNDgaDBIMIqjx1gTSBAYgUgUQigRcBjUwnHIFJQoETgyI+i?=
 =?us-ascii?q?jkEgkeCNaAbikiRYYMVgSabRzIQpGEtszuEVgIEBgUCFoFUOIFbMxoIGxWDJ?=
 =?us-ascii?q?U8ZDo44jlAhA2cCBgoBAQMJjDRdAQE?=
IronPort-HdrOrdr: A9a23:QdBVtK4Vqwy1Ov3XkQPXwHXXdLJzesId70hD6mlaQ3VuHfCwvc
 aogfgdyFvYiCwJXmshhNCHP8C7MBbh3LRy5pQcOqrnYRn+tAKTXeNfxKbr3jGIIUfD38FH06
 MIScVDIf32SWN3lMPrpDS/euxQpOWv1ICNqaPgw2x2TQdsApsQjDtRLgqACEV5SE1nKPMCda
 a03cZMqzq+dXl/VK3SbUUtZOTNq8bGk5jre3c9ZyIP0hWEjj+j9dfBfSSw4xF2aV9y6IZn13
 TZmArk4ajmlPe3xnbnpgnuxqUTvsf9wd1eA8HJsOwpE3HHjwalY5kJYczkgAwI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,208,1613433600"; d="scan'208";a="717254170"
Received: from alln-core-9.cisco.com ([173.36.13.129])
 by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 09 Apr 2021 01:23:53 +0000
Received: from zorba ([10.24.9.242])
 by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 1391Nnm8027721
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Apr 2021 01:23:51 GMT
Date: Thu, 8 Apr 2021 18:23:49 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20210409012349.GG3981976@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
 <20210408190408.GA1724284@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408190408.GA1724284@robh.at.kernel.org>
X-Outbound-SMTP-Client: 10.24.9.242, [10.24.9.242]
X-Outbound-Node: alln-core-9.cisco.com
Subject: Re: [OpenRISC] [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, arnd@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, openrisc@lists.librecores.org,
 nios2 <ley.foon.tan@intel.com>, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMDgsIDIwMjEgYXQgMDI6MDQ6MDhQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMTA6Mzg6MzZBTSAtMDcwMCwgRGFuaWVsIFdh
bGtlciB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDAyLCAyMDIxIGF0IDAzOjE4OjIxUE0gKzAwMDAs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPiA+IC1jb25maWcgQ01ETElORV9CT09MCj4gPiA+
IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPiA+ID4gLQloZWxwCj4gPiA+
IC0JICBGb3IgbW9zdCBzeXN0ZW1zLCBpdCBpcyBmaXJtd2FyZSBvciBzZWNvbmQgc3RhZ2UgYm9v
dGxvYWRlciB0aGF0Cj4gPiA+IC0JICBieSBkZWZhdWx0IHNwZWNpZmllcyB0aGUga2VybmVsIGNv
bW1hbmQgbGluZSBvcHRpb25zLiAgSG93ZXZlciwKPiA+ID4gLQkgIGl0IG1pZ2h0IGJlIG5lY2Vz
c2FyeSBvciBhZHZhbnRhZ2VvdXMgdG8gZWl0aGVyIG92ZXJyaWRlIHRoZQo+ID4gPiAtCSAgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIGl0
Lgo+ID4gPiAtCSAgRm9yIHN1Y2ggY2FzZXMsIHRoaXMgb3B0aW9uIGFsbG93cyB5b3UgdG8gaGFy
ZGNvZGUgeW91ciBvd24KPiA+ID4gLQkgIGNvbW1hbmQgbGluZSBvcHRpb25zIGRpcmVjdGx5IGlu
dG8gdGhlIGtlcm5lbC4gIEZvciB0aGF0LCB5b3UKPiA+ID4gLQkgIHNob3VsZCBjaG9vc2UgJ1kn
IGhlcmUsIGFuZCBmaWxsIGluIHRoZSBleHRyYSBib290IGFyZ3VtZW50cwo+ID4gPiAtCSAgaW4g
Q09ORklHX0NNRExJTkUuCj4gPiA+IC0KPiA+ID4gLQkgIFRoZSBidWlsdC1pbiBvcHRpb25zIHdp
bGwgYmUgY29uY2F0ZW5hdGVkIHRvIHRoZSBkZWZhdWx0IGNvbW1hbmQKPiA+ID4gLQkgIGxpbmUg
aWYgQ01ETElORV9PVkVSUklERSBpcyBzZXQgdG8gJ04nLiBPdGhlcndpc2UsIHRoZSBkZWZhdWx0
Cj4gPiA+IC0JICBjb21tYW5kIGxpbmUgd2lsbCBiZSBpZ25vcmVkIGFuZCByZXBsYWNlZCBieSB0
aGUgYnVpbHQtaW4gc3RyaW5nLgo+ID4gPiAtCj4gPiA+IC0JICBNb3N0IE1JUFMgc3lzdGVtcyB3
aWxsIG5vcm1hbGx5IGV4cGVjdCAnTicgaGVyZSBhbmQgcmVseSB1cG9uCj4gPiA+IC0JICB0aGUg
Y29tbWFuZCBsaW5lIGZyb20gdGhlIGZpcm13YXJlIG9yIHRoZSBzZWNvbmQtc3RhZ2UgYm9vdGxv
YWRlci4KPiA+ID4gLQo+ID4gCj4gPiAKPiA+IFNlZSBob3cgeW91IGNvbXBsYWluZWQgdGhhdCBJ
IGhhdmUgQ01ETElORV9CT09MIGluIG15IGNoYW5nZWQsIGFuZCB5b3UgdGhpbmsgaXQKPiA+IHNo
b3VsZG4ndCBleGlzdC4KPiA+IAo+ID4gWWV0IGhlcmUgbWlwcyBoYXMgaXQsIGFuZCB5b3UganVz
dCBkZWxldGVkIGl0IHdpdGggbm8gZmVhdHVyZSBwYXJpdHkgaW4geW91cgo+ID4gY2hhbmdlcyBm
b3IgdGhpcy4KPiAKPiBBRkFJQ1QsIENNRExJTkVfQk9PTCBlcXVhdGVzIHRvIGEgbm9uLWVtcHR5
IG9yIGVtcHR5IENPTkZJR19DTURMSU5FLiBZb3UgCj4gc2VlbSB0byBuZWVkIGl0IGp1c3QgYmVj
YXVzZSB5b3UgaGF2ZSBDTURMSU5FX1BSRVBFTkQgYW5kIAo+IENNRExJTkVfQVBQRU5ELiBJZiB0
aGF0J3Mgbm90IGl0LCB3aGF0IGZlYXR1cmUgaXMgbWlzc2luZz8gQ01ETElORV9CT09MIAo+IGlz
IG5vdCBhIGZlYXR1cmUsIGJ1dCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwuCgpOb3QgdHJ1ZS4K
Ckl0IG1ha2VzIGl0IGVhc2llciB0byB0dXJuIGl0IGFsbCBvZmYgaW5zaWRlIHRoZSBLY29uZmln
ICwgc28gaXQncyBmb3IgdXNhYmlsaXR5CmFuZCBtdWx0aXBsZSBhcmNoaXRlY3R1cmUgaGF2ZSBp
dCBldmVuIHdpdGgganVzdCBDTURMSU5FIGFzIEkgd2FzIGNvbW1lbnRpbmcKaGVyZS4KCkRhbmll
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
