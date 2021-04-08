Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB4358D2F
	for <lists+openrisc@lfdr.de>; Thu,  8 Apr 2021 21:04:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A9E082130A;
	Thu,  8 Apr 2021 21:04:13 +0200 (CEST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mail.librecores.org (Postfix) with ESMTPS id 89E47210A8
 for <openrisc@lists.librecores.org>; Thu,  8 Apr 2021 21:04:11 +0200 (CEST)
Received: by mail-oi1-f177.google.com with SMTP id x207so3305164oif.1
 for <openrisc@lists.librecores.org>; Thu, 08 Apr 2021 12:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DUrGxOBRGKnSQEqHR05dYQldYxqAXJweo2+bFsG+WpA=;
 b=HtxQXq2QLKR5W8sc/kFu8htqwRdWkzjXe5gyKLmzBUnj5eRpWXgaVC8A2rgblJ7gu0
 7lbG03ie8Tkb+b0hILH5YA2wtLiJOkKIOWYnOz1EsdhlyTBMUzavdrymWvICV0QWzdbi
 32KSSx2qpY0qZaPhLA23RK39zDYf3Fmc02iBLyIwDe+o/3RsO9+TWvhhCGHrugy2f4IA
 uWsaCZEGqEP9HCuKYXXB4wTzkounTbHvmr/0Td7q8g2nxFUkDJsb2gtXysBFy2QXrrMW
 7n1/djaeBbIYwx8Hfvxe8qv6i3C0wiUQDT6ZGqmmPDKf7M9SsvqGowac8Xkt92qMz4Xg
 aDkQ==
X-Gm-Message-State: AOAM530YDAR2AYjY7SJ1h/bvejlSuFgrBfdwFPOBFRlflPvFipXE2sJc
 oPdOtrN6po3dsCYDs5B9Gg==
X-Google-Smtp-Source: ABdhPJzc/ezUgVYn/c2gVo9JEsyTGvBA4ZkkApktnBVPpB6CFT0oT9dS88OzEW8tCbInDt8Gjv+2IA==
X-Received: by 2002:a05:6808:138a:: with SMTP id
 c10mr7276133oiw.117.1617908650345; 
 Thu, 08 Apr 2021 12:04:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g9sm56746otk.6.2021.04.08.12.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 12:04:09 -0700 (PDT)
Received: (nullmailer pid 1795497 invoked by uid 1000);
 Thu, 08 Apr 2021 19:04:08 -0000
Date: Thu, 8 Apr 2021 14:04:08 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Message-ID: <20210408190408.GA1724284@robh.at.kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406173836.GW2469518@zorba>
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

T24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMTA6Mzg6MzZBTSAtMDcwMCwgRGFuaWVsIFdhbGtlciB3
cm90ZToKPiBPbiBGcmksIEFwciAwMiwgMjAyMSBhdCAwMzoxODoyMVBNICswMDAwLCBDaHJpc3Rv
cGhlIExlcm95IHdyb3RlOgo+ID4gLWNvbmZpZyBDTURMSU5FX0JPT0wKPiA+IC0JYm9vbCAiQnVp
bHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPiA+IC0JaGVscAo+ID4gLQkgIEZvciBtb3N0IHN5
c3RlbXMsIGl0IGlzIGZpcm13YXJlIG9yIHNlY29uZCBzdGFnZSBib290bG9hZGVyIHRoYXQKPiA+
IC0JICBieSBkZWZhdWx0IHNwZWNpZmllcyB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb25z
LiAgSG93ZXZlciwKPiA+IC0JICBpdCBtaWdodCBiZSBuZWNlc3Nhcnkgb3IgYWR2YW50YWdlb3Vz
IHRvIGVpdGhlciBvdmVycmlkZSB0aGUKPiA+IC0JICBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIGxp
bmUgb3IgYWRkIGEgZmV3IGV4dHJhIG9wdGlvbnMgdG8gaXQuCj4gPiAtCSAgRm9yIHN1Y2ggY2Fz
ZXMsIHRoaXMgb3B0aW9uIGFsbG93cyB5b3UgdG8gaGFyZGNvZGUgeW91ciBvd24KPiA+IC0JICBj
b21tYW5kIGxpbmUgb3B0aW9ucyBkaXJlY3RseSBpbnRvIHRoZSBrZXJuZWwuICBGb3IgdGhhdCwg
eW91Cj4gPiAtCSAgc2hvdWxkIGNob29zZSAnWScgaGVyZSwgYW5kIGZpbGwgaW4gdGhlIGV4dHJh
IGJvb3QgYXJndW1lbnRzCj4gPiAtCSAgaW4gQ09ORklHX0NNRExJTkUuCj4gPiAtCj4gPiAtCSAg
VGhlIGJ1aWx0LWluIG9wdGlvbnMgd2lsbCBiZSBjb25jYXRlbmF0ZWQgdG8gdGhlIGRlZmF1bHQg
Y29tbWFuZAo+ID4gLQkgIGxpbmUgaWYgQ01ETElORV9PVkVSUklERSBpcyBzZXQgdG8gJ04nLiBP
dGhlcndpc2UsIHRoZSBkZWZhdWx0Cj4gPiAtCSAgY29tbWFuZCBsaW5lIHdpbGwgYmUgaWdub3Jl
ZCBhbmQgcmVwbGFjZWQgYnkgdGhlIGJ1aWx0LWluIHN0cmluZy4KPiA+IC0KPiA+IC0JICBNb3N0
IE1JUFMgc3lzdGVtcyB3aWxsIG5vcm1hbGx5IGV4cGVjdCAnTicgaGVyZSBhbmQgcmVseSB1cG9u
Cj4gPiAtCSAgdGhlIGNvbW1hbmQgbGluZSBmcm9tIHRoZSBmaXJtd2FyZSBvciB0aGUgc2Vjb25k
LXN0YWdlIGJvb3Rsb2FkZXIuCj4gPiAtCj4gCj4gCj4gU2VlIGhvdyB5b3UgY29tcGxhaW5lZCB0
aGF0IEkgaGF2ZSBDTURMSU5FX0JPT0wgaW4gbXkgY2hhbmdlZCwgYW5kIHlvdSB0aGluayBpdAo+
IHNob3VsZG4ndCBleGlzdC4KPiAKPiBZZXQgaGVyZSBtaXBzIGhhcyBpdCwgYW5kIHlvdSBqdXN0
IGRlbGV0ZWQgaXQgd2l0aCBubyBmZWF0dXJlIHBhcml0eSBpbiB5b3VyCj4gY2hhbmdlcyBmb3Ig
dGhpcy4KCkFGQUlDVCwgQ01ETElORV9CT09MIGVxdWF0ZXMgdG8gYSBub24tZW1wdHkgb3IgZW1w
dHkgQ09ORklHX0NNRExJTkUuIFlvdSAKc2VlbSB0byBuZWVkIGl0IGp1c3QgYmVjYXVzZSB5b3Ug
aGF2ZSBDTURMSU5FX1BSRVBFTkQgYW5kIApDTURMSU5FX0FQUEVORC4gSWYgdGhhdCdzIG5vdCBp
dCwgd2hhdCBmZWF0dXJlIGlzIG1pc3Npbmc/IENNRExJTkVfQk9PTCAKaXMgbm90IGEgZmVhdHVy
ZSwgYnV0IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbC4KClJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
