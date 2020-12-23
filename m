Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D53652E2936
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A1BCE2108D;
	Fri, 25 Dec 2020 00:15:33 +0100 (CET)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by mail.librecores.org (Postfix) with ESMTPS id 4329B20E96
 for <openrisc@lists.librecores.org>; Wed, 23 Dec 2020 11:38:09 +0100 (CET)
Received: by mail-oo1-f43.google.com with SMTP id k7so3603077ooa.0
 for <openrisc@lists.librecores.org>; Wed, 23 Dec 2020 02:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KihTF5JbxFD42cY1wA7aOsNP35ZO1n0Na3DWL4feoYk=;
 b=p1b+zJ2HhfNezu5DQsG/rUNAHumPfYdrggHQKefAM66G3xaloMB8BXkyd0ZQsBEO4H
 Jwvz4wA1RKdoFnTkSTFOZcGrvTkLRLSivtwajlCxJct8ShfOdO4ox0OZ17qoBczspmRD
 akjJMQ4gPk4CzlEZE4Q5FRe4l59XheK1oKvmS8wk3etVeSfaukXZ254RTD7q9wynhGWY
 M9AdmwiB2EERmFAZaL++sAJMnUAYn9nWJADspI1QK/Rybq27WCAaYhyjXur9gcf/71E3
 3qFRSyHOap8aB8v5sHlSgbsVSC857TH3gIfNDTy+XleVNop/NSC6CwSt+oDyDEOMxsCp
 R/cQ==
X-Gm-Message-State: AOAM533avfjyV/b5IHhU/ZhlgX3Bt/t7/hJs4OjYNRhNwQuOmnw30Mgl
 X/pq1RYC2DOO3e0iuVAMruchKTpcUCKSRW54k48=
X-Google-Smtp-Source: ABdhPJy9U98CPLOM9qWfCFZui6dO/PQYCRjI00tgXXUEHSfVAWiteZLCs+U7EpAO2soA/tWzSTNFmBBqnM2RmfJo+z4=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr18070553oop.1.1608719888011; 
 Wed, 23 Dec 2020 02:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20201222184510.19415-1-info@metux.net>
 <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
 <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
In-Reply-To: <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Dec 2020 11:37:56 +0100
Message-ID: <CAMuHMdXoHVPwqC_v6DL2MTi2j_tgnCqy9eiuLHvmZ9cB5scbQA@mail.gmail.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH] arch: consolidate pm_power_off callback
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgRW5yaWNvLAoKT24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgOToxNSBQTSBFbnJpY28gV2VpZ2Vs
dCwgbWV0dXggSVQgY29uc3VsdAo8bGttbEBtZXR1eC5uZXQ+IHdyb3RlOgo+IE9uIDIyLjEyLjIw
IDE5OjU0LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAyMiwgMjAy
MCBhdCA3OjQ2IFBNIEVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0Cj4gPiA8aW5mb0Bt
ZXR1eC5uZXQ+IHdyb3RlOgo+ID4+IE1vdmUgdGhlIHBtX3Bvd2VyX29mZiBjYWxsYmFjayBpbnRv
IG9uZSBnbG9iYWwgcGxhY2UgYW5kIGFsc28gYWRkIGFuCj4gPj4gZnVuY3Rpb24gZm9yIGNvbmRp
dGlvbmFsbHkgY2FsbGluZyBpdCAod2hlbiBub3QgTlVMTCksIGluIG9yZGVyIHRvIHJlbW92ZQo+
ID4+IGNvZGUgZHVwbGljYXRpb24gaW4gYWxsIGluZGl2aWR1YWwgYXJjaHMuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdCA8aW5mb0BtZXR1
eC5uZXQ+Cj4gPgo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+ID4KPiA+PiAtLS0gYS9hcmNo
L2FscGhhL2tlcm5lbC9wcm9jZXNzLmMKPiA+PiArKysgYi9hcmNoL2FscGhhL2tlcm5lbC9wcm9j
ZXNzLmMKPiA+PiBAQCAtNDMsMTIgKzQzLDYgQEAKPiA+PiAgI2luY2x1ZGUgInByb3RvLmgiCj4g
Pj4gICNpbmNsdWRlICJwY2lfaW1wbC5oIgo+ID4+Cj4gPj4gLS8qCj4gPj4gLSAqIFBvd2VyIG9m
ZiBmdW5jdGlvbiwgaWYgYW55Cj4gPj4gLSAqLwo+ID4+IC12b2lkICgqcG1fcG93ZXJfb2ZmKSh2
b2lkKSA9IG1hY2hpbmVfcG93ZXJfb2ZmOwo+ID4KPiA+IEFzc2lnbm1lbnRzIGxpa2UgdGhlc2Ug
YXJlIGxvc3QgaW4gdGhlIGNvbnZlcnNpb24uCj4KPiBZZXMsIGJ1dCB0aGlzIGRvZXNuJ3Qgc2Vl
bSB0byBiZSBldmVyIGNhbGxlZCBhbnl3YXlzLiAoaW4gYXJjaC9hbHBoYSkKPiBBbmQsIEJUVywg
bGV0dGluZyBpdCBwb2ludCB0byBtYWNoaW5lX3Bvd2VyX29mZigpIGRvZXNuJ3QgbWFrZSBtdWNo
Cj4gc2Vuc2UsIHNpbmNlIGl0J3MgdGhlIGFyY2gncyBtYWNoaW5lX3Bvd2VyX29mZigpIGZ1bmN0
aW9uLCB3aG8ncmUKPiBjYWxsaW5nIHBtX3Bvd2VyX29mZigpLgo+Cj4gQWN0dWFsbHksIHdlIGNv
dWxkIHJlbW92ZSBwbV9wb3dlcl9vZmYgY29tcGxldGVseSBmcm9tIGhlcmUsIGFzc3VtaW5nCj4g
bm9ib2R5IHdvdWxkICpidWlsZCogYW55IGRyaXZlcnMgdGhhdCByZWdpc3RlciB0aGVtc2VsdmVz
IGludG8KPiBwbV9wb3dlcl9vZmYuCj4KPiBJZiB5b3UgZmVlbCBiZXR0ZXIgd2l0aCBpdCwgSSBj
b3VsZCBwb3N0IGEgcGF0Y2ggdGhhdCBqdXN0IHJlbW92ZXMKPiBwbV9wb3dlcl9vZmYgZnJvbSBh
cmNoL2FscGhhLgoKVGhpcyBpcyBub3QgbGltaXRlZCB0byBhbHBoYSwgdGhlcmUgYXJlIHNpbWls
YXIgaW5pdGlhbGl6YXRpb25zIG9uCm02OGssIG9wZW5yaXNjLAphbmQgczM5MC4KSWYgbm9uZSBv
ZiB0aGVzZSBhcmUgY2FsbGVkLCB0aGV5IGNhbiBiZSByZW1vdmVkLCBidXQgeW91IHNob3VsZCBt
ZW50aW9uCnRoYXQgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLgoKVGhhbmtzIQoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
