Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A8719376343
	for <lists+openrisc@lfdr.de>; Fri,  7 May 2021 12:05:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 198322139B;
	Fri,  7 May 2021 12:05:51 +0200 (CEST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mail.librecores.org (Postfix) with ESMTPS id D991521391
 for <openrisc@lists.librecores.org>; Fri,  7 May 2021 12:05:48 +0200 (CEST)
Received: by mail-vk1-f180.google.com with SMTP id k85so1802399vka.9
 for <openrisc@lists.librecores.org>; Fri, 07 May 2021 03:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OhSK4/fRuA4HwTCIuizFPGiwNOBd8/VP64HP5BG0u0=;
 b=VBeizcstdRMDVvYRznUThpjZfwtRWeeiq9b60NdBEuTQEUYN1lHYMqJ3mVcua5M0/p
 fLGsfMF+zTZYY4o2+DSbFZ4i8kaHm+zjKPq+Z7DROOyO2dKFjPP6FBCPpoV9HOXduxr5
 xRE7lxyMhIRwPVdqHRfzhSPProBWh/XggWmt8fVSJZEjqmqnA8ALMc+leLqKIdaH1rmQ
 1VNGCNbnD//l83VkjxhCo9mPn/y3oVDSV6yFymXwaoWSytUMn6mhI3IfHlgC8L/EmGAx
 6HFCfWqkGfMUz7vgTKaECQNfyY0JvJqLoPh+EjONoeoUJ0pIu5zv6hQcFKbdgtAnbhFa
 KFhA==
X-Gm-Message-State: AOAM5322y4SSE3ukD5OGgHgp9fhiYHqpDj9wUjmhaXWhfbM16+cdCcoH
 cw2Zuw5RchyG5IU+M/Dq0aw/S6r0/ay/s/Vpw5Y=
X-Google-Smtp-Source: ABdhPJxt+pOzDHWc5H2t65kh+4s2Qz3s7gwuQ1GebHLmrZDDKPnZtkesGIVfbF6W7iXFexTUx2RQ4J/cfrxj3ln6qbM=
X-Received: by 2002:a1f:5682:: with SMTP id k124mr6833991vkb.2.1620381947610; 
 Fri, 07 May 2021 03:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <87k0oaq311.wl-chenli@uniontech.com>
In-Reply-To: <87k0oaq311.wl-chenli@uniontech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 May 2021 12:05:36 +0200
Message-ID: <CAMuHMdWapV4ZypzpC0gvS01BKRQvPjsiD2uS7odb78dEeP=63Q@mail.gmail.com>
To: chenli@uniontech.com
Subject: Re: [OpenRISC] [PATCH] mm: update legacy flush_tlb_* to use vma
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
Cc: Jonas Bonn <jonas@southpole.se>, Chris Zankel <chris@zankel.net>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXkgNywgMjAyMSBhdCAxMTo1OCBBTSBDaGVuIExpIDxjaGVubGlAdW5pb250ZWNo
LmNvbT4gd3JvdGU6Cj4gMS4gVGhlc2UgdGxiIGZsdXNoIGZ1bmN0aW9ucyAgaGF2ZSBiZWVuIHVz
aW5nIHZtYSBpbnN0ZWFkIG1tIGxvbmcgdGltZSBhZ28sIGJ1dCB0aGVyZQo+IGlzIHN0aWxsIHNv
bWUgY29tZW50cyB1c2UgbW0gYXMgcGFyYW1ldGVyLgo+Cj4gMi4gdGhlIGFjdHVhbCBzdHJ1Y3Qg
d2UgdXNlIGlzIHZtX2FyZWFfc3RydWN0IGluc3RlYWQgb2Ygdm1hX3N0cnVjdC4KPgo+IDMuIHJl
bW92ZSB1bnVzZWQgZmx1c2hfa2Vybl90bGJfcGFnZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENoZW4g
TGkgPGNoZW5saUB1bmlvbnRlY2guY29tPgoKPiAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3RsYmZs
dXNoLmggICAgIHwgIDIgKy0KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
