Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83BE4177203
	for <lists+openrisc@lfdr.de>; Tue,  3 Mar 2020 10:09:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6FF27209DC;
	Tue,  3 Mar 2020 10:09:25 +0100 (CET)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by mail.librecores.org (Postfix) with ESMTPS id 6D0462090C
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 09:19:13 +0100 (CET)
Received: by mail-ot1-f67.google.com with SMTP id j5so7941070otn.10
 for <openrisc@lists.librecores.org>; Mon, 02 Mar 2020 00:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqmS1X8qI6/s8cwCJEzUrnvDV3NhuggUO9eO0r27sb0=;
 b=o5d2mgKnU2T/vUPEIqXh/2vSKXtlWmlSaNDZjUdYerVAHhj+2BUWiP/dHcY2d7V94+
 GkU+gshVwI8B4Z68V8Jz2u5UXlPYGjPDcm4RBXJkUO/Z1NxmTgbW2kIKBVoGZMiqqtOy
 W6+wfm6sX7zKTbRbxJ6naaJFvx15cDXEGP6FBGwpNHgFbExpwqRqmLy9NWdSdALPWf3c
 O/z14siKV1xP5duAby3KBLhmV9EOBjsf5M4kyl5qjnA4IH8vD/D23Fhr4itKKlhh3Qcu
 N/9N//jAIpx519NdhfF+Qkv2D3R2RQJcF1C6wpabxy3TCxjR6B2tERy5Gc+hPc/GZ//M
 MhEQ==
X-Gm-Message-State: APjAAAXHAWnoc6LXqsuOAe5aJDBI4AlGoDzDU9tmuvdGbVKuHWrTsT5b
 mMAK1XiBYMfgF8xpJ8v4EfctW2wfX4PNN8xN52A=
X-Google-Smtp-Source: APXvYqxJAsXBEb0up6C6U45pxshI9Ikohe/0ASpQmGQUY7aNow99BqVlQd7sShJKbvufJm9F2NTGKOK92pziLY2199g=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr12398547otk.145.1583137152054; 
 Mon, 02 Mar 2020 00:19:12 -0800 (PST)
MIME-Version: 1.0
References: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2020 09:19:00 +0100
Message-ID: <CAMuHMdXnUeYib2dMALyzrW8LKhTjsnGFsqALoTxVHzPGc+OUTg@mail.gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 10:09:23 +0100
Subject: Re: [OpenRISC] [PATCH] mm/special: Create generic fallbacks for
 pte_special() and pte_mkspecial()
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
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Paul Burton <paulburton@kernel.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Sam Creasey <sammy@sammy.net>, Fenghua Yu <fenghua.yu@intel.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Brian Cain <bcain@codeaurora.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 alpha <linux-alpha@vger.kernel.org>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQW5zaHVtYW4sCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBNb24sIE1hciAyLCAyMDIw
IGF0IDI6NTYgQU0gQW5zaHVtYW4gS2hhbmR1YWwKPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+
IHdyb3RlOgo+IEN1cnJlbnRseSB0aGVyZSBhcmUgbWFueSBwbGF0Zm9ybXMgdGhhdCBkb250IGVu
YWJsZSBIQVZFX0FSQ0hfUFRFX1NQRUNJQUwKCkFSQ0hfSEFTX1BURV9TUEVDSUFMCgo+IGJ1dCBy
ZXF1aXJlZCB0byBkZWZpbmUgcXVpdGUgc2ltaWxhciBmYWxsYmFjayBzdHVicyBmb3Igc3BlY2lh
bCBwYWdlIHRhYmxlCj4gZW50cnkgaGVscGVycyBzdWNoIGFzIHB0ZV9zcGVjaWFsKCkgYW5kIHB0
ZV9ta3NwZWNpYWwoKSwgYXMgdGhleSBnZXQgYnVpbGQKPiBpbiBnZW5lcmljIE1NIHdpdGhvdXQg
YSBjb25maWcgY2hlY2suIFRoaXMgY3JlYXRlcyB0d28gZ2VuZXJpYyBmYWxsYmFjawo+IHN0dWIg
ZGVmaW5pdGlvbnMgZm9yIHRoZXNlIGhlbHBlcnMsIGVsaW1pbmF0aW5nIG11Y2ggY29kZSBkdXBs
aWNhdGlvbi4KPgo+IG1pcHMgcGxhdGZvcm0gaGFzIGEgc3BlY2lhbCBjYXNlIHdoZXJlIHB0ZV9z
cGVjaWFsKCkgYW5kIHB0ZV9ta3NwZWNpYWwoKQo+IHZpc2liaWxpdHkgaXMgd2lkZXIgdGhhbiB3
aGF0IEhBVkVfQVJDSF9QVEVfU1BFQ0lBTCBlbmFibGVtZW50IHJlcXVpcmVzLgoKQVJDSF9IQVNf
UFRFX1NQRUNJQUwKCj4gVGhpcyByZXN0cmljdHMgdGhvc2Ugc3ltYm9sIHZpc2liaWxpdHkgaW4g
b3JkZXIgdG8gYXZvaWQgcmVkZWZpbml0aW9ucwo+IHdoaWNoIGlzIG5vdyBleHBvc2VkIHRocm91
Z2ggdGhpcyBuZXcgZ2VuZXJpYyBzdHVicyBhbmQgc3Vic2VxdWVudCBidWlsZAo+IGZhaWx1cmUu
IGFybSBwbGF0Zm9ybSBzZXRfcHRlX2F0KCkgZGVmaW5pdGlvbiBuZWVkcyB0byBiZSBtb3ZlZCBp
bnRvIGEgQwo+IGZpbGUganVzdCB0byBwcmV2ZW50IGEgYnVpbGQgZmFpbHVyZS4KCj4gU2lnbmVk
LW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Cgo+
ICBhcmNoL202OGsvaW5jbHVkZS9hc20vbWNmX3BndGFibGUuaCAgICAgIHwgMTAgLS0tLS0tCj4g
IGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9tb3Rvcm9sYV9wZ3RhYmxlLmggfCAgMiAtLQo+ICBhcmNo
L202OGsvaW5jbHVkZS9hc20vc3VuM19wZ3RhYmxlLmggICAgIHwgIDIgLS0KCkZvciBtNjhrOgpB
Y2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
