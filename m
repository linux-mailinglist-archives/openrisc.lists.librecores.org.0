Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 28AE6435D7F
	for <lists+openrisc@lfdr.de>; Thu, 21 Oct 2021 11:01:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B9C4E24103;
	Thu, 21 Oct 2021 11:00:59 +0200 (CEST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mail.librecores.org (Postfix) with ESMTPS id EBA09240FB
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 10:32:23 +0200 (CEST)
Received: by mail-oi1-f178.google.com with SMTP id o4so12804494oia.10
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ceLayuoY70owN3NNsnQH6S+jy2K/HGM8B6O2q8i1GAk=;
 b=S86OMd/YOhyZX3j8d4Ow1t7bRIDxa3DnBjeBGQejbMVxRnGLRp4gQlGh07uBxLj2Mr
 3FFJowpEIxw/FIdIZTCT0v/KGGkywms+yWk1DWaLZRVLx3gmytvmulgocF82GXBIrsef
 OKX810MvAVcc7GSzMXURomxOxJDiE0yJTTrtgstTIDmGLMb00DkWx7EJ9xuWSSJjdLA4
 dD3IqNnqnQda9gbiI8EugOUWwmHyz5RFAsbqodbq3fTmdf/TPq9tncUIgEOhHDZ+PsmU
 ZESbs55Jox8/vvTKkUBukEAKIc/qZvqdCEbWfudEhvoFCUE5ybpy8SCAkcDBwc+5ioba
 Seng==
X-Gm-Message-State: AOAM532sRDemO8HkEytZhWuXfTWZd5gc4MODAfwqjaxKrUWQkw/gw0/2
 V+qgB2f/3S8jDcLtDHCm7rXsuUTZrz1yE8TSAQA=
X-Google-Smtp-Source: ABdhPJxII4gwyuuwZSE0+97ar6I7zWp2Jlu7LoTmQcOVpBv5Lkm+3ns6lcPNpIqYwJ3CoMM3pxGAXl0ujDP3wS4Hl9w=
X-Received: by 2002:aca:eb82:: with SMTP id j124mr3578574oih.46.1634805141944; 
 Thu, 21 Oct 2021 01:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <87y26nmwkb.fsf@disp2133> <877de7jrev.fsf@disp2133>
In-Reply-To: <877de7jrev.fsf@disp2133>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 21 Oct 2021 10:32:10 +0200
Message-ID: <CAAdtpL5+bjpy93DY5gf1ZM4k3BtP+JNJAUSSmvt8cq3shsJR4A@mail.gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
X-Mailman-Approved-At: Thu, 21 Oct 2021 11:00:58 +0200
Subject: Re: [OpenRISC] [PATCH 21/20] signal: Replace force_sigsegv(SIGSEGV)
 with force_fatal_sig(SIGSEGV)
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
Cc: Rich Felker <dalias@libc.org>, linux-xtensa@linux-xtensa.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, H Peter Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-sh@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Rozycki <macro@orcam.me.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMTE6NTIgUE0gRXJpYyBXLiBCaWVkZXJtYW4KPGViaWVk
ZXJtQHhtaXNzaW9uLmNvbT4gd3JvdGU6Cj4KPgo+IE5vdyB0aGF0IGZvcmNlX2ZhdGFsX3NpZyBl
eGlzdHMgaXQgaXMgdW5uZWNlc3NhcnkgYW5kIGEgYml0IGNvbmZ1c2luZwo+IHRvIHVzZSBmb3Jj
ZV9zaWdzZWd2IGluIGNhc2VzIHdoZXJlIHRoZSBzaW1wbGVyIGZvcmNlX2ZhdGFsX3NpZyBpcwo+
IHdhbnRlZC4gIFNvIGNoYW5nZSBldmVyeSBpbnN0YW5jZSB3ZSBjYW4gdG8gbWFrZSB0aGUgY29k
ZSBjbGVhcmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogIkVyaWMgVy4gQmllZGVybWFuIiA8ZWJpZWRl
cm1AeG1pc3Npb24uY29tPgo+IC0tLQo+ICBhcmNoL2FyYy9rZXJuZWwvcHJvY2Vzcy5jICAgICAg
IHwgMiArLQo+ICBhcmNoL202OGsva2VybmVsL3RyYXBzLmMgICAgICAgIHwgMiArLQo+ICBhcmNo
L3Bvd2VycGMva2VybmVsL3NpZ25hbF8zMi5jIHwgMiArLQo+ICBhcmNoL3Bvd2VycGMva2VybmVs
L3NpZ25hbF82NC5jIHwgNCArKy0tCj4gIGFyY2gvczM5MC9rZXJuZWwvdHJhcHMuYyAgICAgICAg
fCAyICstCj4gIGFyY2gvdW0va2VybmVsL3RyYXAuYyAgICAgICAgICAgfCAyICstCj4gIGFyY2gv
eDg2L2tlcm5lbC92bTg2XzMyLmMgICAgICAgfCAyICstCj4gIGZzL2V4ZWMuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gIDggZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1
Z0BhbXNhdC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
