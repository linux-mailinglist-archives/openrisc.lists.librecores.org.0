Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AE2C31FECBA
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C352A20B5B;
	Thu, 18 Jun 2020 09:47:13 +0200 (CEST)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by mail.librecores.org (Postfix) with ESMTPS id 7A0E2202F2
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 18:54:09 +0200 (CEST)
Received: by mail-lj1-f195.google.com with SMTP id z9so3341539ljh.13
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGXejVSpqx4L2PlHIfd5JVBtSOWL/TuutZfvvE958Z8=;
 b=ZFce94Usj6EkI4Lk9l8ZbLgBKcrOaOEIKI+lsoHoWwucoH5PaFSFEUF5nSpDfmtX/m
 zpiTKIsyT2HuVYK0uUKJl0hfSDP//4+ueTqu4gfQUH9jmW1Fx7086RKZCkNC01IFk27w
 7I94+DibpxplQFqh0putGbec4FKBVLxsfzedA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGXejVSpqx4L2PlHIfd5JVBtSOWL/TuutZfvvE958Z8=;
 b=WsfM/ahCWjUrGGFX7Sr4fEcKlPLrreu/J6rj+rbnpOCvx1gV4tEXkrHL7+b5GkunGu
 bSe1vh35g/uqir+jk/EXeGFhXo4uHlrCWizGBIdF1xJ6BlH0EhGnIyyriLE+U0Iu3xKi
 xUfz2oi2p/L4L8J1EfOcDiM1JPW5oxYktoVM43aVIavCWHd/NM7zw19DUGHgMEtEChzc
 1S0l1kZmmxVflwyS6F/EoclZhHA7H4cps49xbwLZpem8s7MufuJx/IGUyJtbIP/KLoR1
 uHEKF5vD6piw03WXl7fwbIg2mbGQy+b0qlbhbjsPK+JtuqFx6oCfHWiGeNrveXGk0oWV
 r+7A==
X-Gm-Message-State: AOAM530IkJNbkunLzDdEnk/VLvJ4hPdRpWTTJ03UreiUoKun/kMZlIDT
 Tqjhz1/Ymq0rjkUGvgpy9s0r+7euhtY=
X-Google-Smtp-Source: ABdhPJzNancja1i6tIh2BHx4nW5YnLzUJhliemj5a4ROPLxG9FCZbkxn3XymsNGGdhaoB1Wb5wIEWQ==
X-Received: by 2002:a2e:984b:: with SMTP id e11mr2121134ljj.358.1591808048028; 
 Wed, 10 Jun 2020 09:54:08 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id s17sm70408ljd.51.2020.06.10.09.54.05
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 09:54:06 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 9so3362104ljc.8
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 09:54:05 -0700 (PDT)
X-Received: by 2002:a2e:8991:: with SMTP id c17mr1979736lji.421.1591808045437; 
 Wed, 10 Jun 2020 09:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200610174811.44b94525@thinkpad>
In-Reply-To: <20200610174811.44b94525@thinkpad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Jun 2020 09:53:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgm0_0PjXaSVbrpDfgtn6UbDyWjSRnXvfdebweUYSZ+eA@mail.gmail.com>
Message-ID: <CAHk-=wgm0_0PjXaSVbrpDfgtn6UbDyWjSRnXvfdebweUYSZ+eA@mail.gmail.com>
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] Possible duplicate page fault accounting on some
 archs after commit 4064b9827063
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch <linux-arch@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-xtensa@linux-xtensa.org,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 linux-parisc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgODo0OCBBTSBHZXJhbGQgU2NoYWVmZXIKPGdlcmFsZC5z
Y2hhZWZlckBkZS5pYm0uY29tPiB3cm90ZToKPgo+IFRoaXMgd2FzIGZvdW5kIGJ5IGNvaW5jaWRl
bmNlIGluIHMzOTAgY29kZSwgYW5kIGEgcXVpY2sgY2hlY2sgc2hvd2VkIHRoYXQKPiB0aGVyZSBh
cmUgcXVpdGUgYSBsb3Qgb2Ygb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGF0IHNlZW0gdG8gYmUgYWZm
ZWN0ZWQgaW4gYQo+IHNpbWlsYXIgd2F5LiBJJ20gcHJlcGFyaW5nIGEgZml4IGZvciBzMzkwLCBi
eSBtb3ZpbmcgdGhlIGFjY291bnRpbmcgYmVoaW5kCj4gdGhlIHJldHJ5IGxvb3AsIHNpbWlsYXIg
dG8geDg2LiBJdCBpcyBub3QgY29tcGxldGVseSBzdHJhaWdodC1mb3J3YXJkLCBzbwo+IEkgbGVh
dmUgdGhlIGZpeCBmb3Igb3RoZXIgYXJjaHMgdG8gdGhlIHJlc3BlY3RpdmUgbWFpbnRhaW5lcnMu
CgpIbW0uIEkgd29uZGVyIGlmIHdlIGNvdWxkIG1vdmUgdGhlIGhhbmRsaW5nIGludG8gIGhhbmRs
ZV9tbV9mYXVsdCgpIGl0c2VsZi4KCkl0J3MgX2ZhaXJseV8gdHJpdmlhbCB0byBkbyBvbiB0aGUg
YXJjaCBzaWRlLCBqdXN0IGFzIGxvbmcgYXMgeW91CnJlbWVtYmVyIHRvIG1ha2UgdGhlIFZNX0ZB
VUxUX01BSk9SIGJpdCBzdGlja3kgbGlrZSB4ODYgZG9lcyB3aXRoIHRoYXQKCiAgICAgICAgbWFq
b3IgfD0gZmF1bHQgJiBWTV9GQVVMVF9NQUpPUjsKCnJpZ2h0IGFmdGVyIGhhbmRsZV9tbV9mYXVs
dCgpLiBCdXQgaXQgY2VydGFpbmx5IGRvZXNuJ3Qgc2VlbSBsaWtlIGl0CndvdWxkIGJlIGhhcmQg
dG8gbW92ZSBpbnRvIGNvbW1vbiBjb2RlIGluIGhhbmRsZV9tbV9mYXVsdCgpIGVpdGhlciwgYnkK
anVzdCBub3QgZG9pbmcgdGhlIGFjY291bnRpbmcgaWYgaXQncyBhYm91dCB0byByZXR1cm4gVk1f
RkFVTFRfUkVUUlkKb3IgVk1fRkFVTFRfRVJST1IuCgpUaGF0IHNhaWQsIHdlIHdhbnQgdGhhdCBw
ZXJmX3N3X2V2ZW50KCkgYWNjb3VudGluZyB0b28sIHNvIHdlJ2QgaGF2ZQp0byBwYXNzIGluIGEg
J3N0cnVjdCByZWdzIConIGFzIHdlbGwuIEFuZCBpdCdzIG5vdCBjbGVhciB3aGljaCB3YXkKYWNj
b3VudGluZyBzaG91bGQgZ28gZm9yIG90aGVyIGNhbGxlcnMgb2YgaGFuZGxlX21tX2ZhdWx0KCkg
KGllIGd1cApldGMpLgoKU28gSSBndWVzcyBqdXN0IGhhdmluZyBhcmNoaXRlY3R1cmVzIGZpeCBp
dCB1cCBpbmRpdmlkdWFsbHkgYW5kIG1ha2UKc3VyZSB0aGV5IGRvbid0IGRvIGl0IGZvciByZXRy
eSBjb25kaXRpb25zIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4uCgogICAgICAgICAgICAgTGlu
dXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
