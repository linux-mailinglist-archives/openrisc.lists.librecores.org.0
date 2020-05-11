Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C75331CD30E
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A3F5A20B81;
	Mon, 11 May 2020 09:41:50 +0200 (CEST)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by mail.librecores.org (Postfix) with ESMTPS id B9BDF2062E
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 09:38:37 +0200 (CEST)
Received: by mail-ot1-f67.google.com with SMTP id m33so6786916otc.5
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 00:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNoZEZ57CrI9/0G/8w94E+hwvPuAlWx38MUKzKDQBhc=;
 b=FVcMzwDV2WKbpw4zTLf98V4D+HSdMJ6I3Z7+hVnAOXXjT5PeWZj868rDtnelUjs7qw
 FCbwYiT+QhoWaW+lK9To4HYcNsBNuelzY8o9M9RKIP32pXMawIdf2m516tsvo3orEVw7
 hgwqozb2jwAervEuHHPtmlTmU3QRE4NX65oKCFygW7VgvRBFJ1LtsFxSeNMfXt4Zw0w8
 lJeH9U92aaexi9m3X74VF3bk0/0b5CIHDQntC6a4ubbfmx1z3Pdb3o4rv9Ry0F2OueF7
 +5PhytZ9X3nE8sZ99E9rv90d9sUMM3k1EvHa5V/ftIbGlGxp3jfsCCtjSixaEYCyQ5Ds
 27zQ==
X-Gm-Message-State: AGi0PuZAb6mlY2ySrg8s83ye6QpcSZCZzg6tgEOODKGbFCVi7JG44iPv
 IcC+2ziVbHt84rJyaDMEXGTCa3iap993K5mziLI=
X-Google-Smtp-Source: APiQypLoBt4t5N0l098m7w2IDSx4KyTJchn19q3bmw0+va1jJpmuNmPwj2oo62ETWA1hKW2oSkbgdMOlQ069s61RJoI=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10874719otl.107.1589182716617; 
 Mon, 11 May 2020 00:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-27-hch@lst.de>
In-Reply-To: <20200510075510.987823-27-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:38:25 +0200
Message-ID: <CAMuHMdUTAA_mkS-KY70ykr-n-UJxfqM09EYcVQVKA4+FSkC1Og@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: Re: [OpenRISC] [PATCH 26/31] m68k: implement flush_icache_user_range
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
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMTAsIDIwMjAgYXQgOTo1NyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gUmVuYW1lIHRoZSBjdXJyZW50IGZsdXNoX2ljYWNoZV9yYW5nZSB0byBm
bHVzaF9pY2FjaGVfdXNlcl9yYW5nZSBhcwo+IHBlciBjb21taXQgYWU5MmVmOGE0NDI0ICgiUEFU
Q0hdIGZsdXNoIGljYWNoZSBpbiBjb3JyZWN0IGNvbnRleHQiKSB0aGVyZQo+IHNlZW1zIHRvIGJl
IGFuIGFzc3VtcHRpb24gdGhhdCBpdCBvcGVyYXRlcyBvbiB1c2VyIGFkZHJlc3Nlcy4gIEFkZCBh
Cj4gZmx1c2hfaWNhY2hlX3JhbmdlIGFyb3VuZCBpdCB0aGF0IGZvciBub3cgaXMgYSBuby1vcC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKQWNrZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
