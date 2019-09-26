Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C9CD3C4718
	for <lists+openrisc@lfdr.de>; Wed,  2 Oct 2019 07:44:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 49BE920120;
	Wed,  2 Oct 2019 07:44:06 +0200 (CEST)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by mail.librecores.org (Postfix) with ESMTPS id AAEEE20279
 for <openrisc@lists.librecores.org>; Thu, 26 Sep 2019 15:10:05 +0200 (CEST)
Received: by mail-io1-f67.google.com with SMTP id u8so6346703iom.5
 for <openrisc@lists.librecores.org>; Thu, 26 Sep 2019 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZIPxOACSyBTtRH5A7Lgyz9YR30y4W13jpD2I+1mgJM=;
 b=M0MOZVUz4t6WU55SoJjNSOp7QYn65o/NCOkDutq5p4891fxVHa6jIYc0GzSPoE5NgC
 Y/F31CMUMd8X4Qdqfc4MGmYyhNuR+uHG233WadTHQa0xsWxFJv5rl8RVwaE3bu3pB7qr
 wri0795JXn4yi9BdL9A4kIX8Eq3Xd1Myt3BkKJ+99RFh8if3n6D0lMDd1/A4PUTHHLSY
 mi041pBhTLwJRt9cj7XQ/sDkCPZZAFKFgXm6Ri5VzL7A0Gk1JZg/oHQRycR2/sZb03c2
 lzEE4rwwCW+uRuqgQOz+nrJU3ZVzQbE+b9nB1IS53yKZV5lYYrQXdFhuW1+ZKBjhKOVA
 lysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZIPxOACSyBTtRH5A7Lgyz9YR30y4W13jpD2I+1mgJM=;
 b=fZLJIEGXpO2xqGHxNUK7Rm+zofG0l1YSba8Qq5oPqSziQvz04/V/JAqK5oaCqgB1bc
 X7SF/3u0zGsjkLu6cWmGXfJkokuEAoVsefTbght3LXlkB3TS4uJsi3KPFyQRDXaeUgXp
 2eSVfdYKdPDa7M7+ws14eNa7f0p2iAJeetKWwHnH4yfwMn3sfCFWjxMtkHBwpHPsPF4S
 U0TEh1SetteOQ7qtE7AY5c/sMwEC6+DYDQlUkYPQwpQSdp8RPnb7ImBeYzC2yRUen/1h
 QhAk8oUXat49H02LyMmrlegAgMDze/uJhBWfU+t+zQItEE/YihcXRtjPU5A8EVvN0v4P
 7vTA==
X-Gm-Message-State: APjAAAWUu0KEctL2c/G/d92SeC4qz5+cTjD5w5ZOHoXhrdtFA3mva90/
 rXDEdsLJy2P6V3AMxsGBGTr4qNNceXzIj48yPqY=
X-Google-Smtp-Source: APXvYqzlyCi4JSGY6XghEeQ/E8vAIH7ViuIHrzxvUyMsua1GZWLVjXjlSiGwrvjIiebbaCWFI8rRhtB8cjRotnhYNKg=
X-Received: by 2002:a6b:d601:: with SMTP id w1mr3118098ioa.158.1569503404009; 
 Thu, 26 Sep 2019 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
In-Reply-To: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 08:09:52 -0500
Message-ID: <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:44:03 +0200
Subject: Re: [OpenRISC] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Guan Xuetao <gxt@pku.edu.cn>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDk6MTcgQU0gQWRh
bSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJIHRyaWVkIGNtYT0yNTZN
IGFuZCBub3RpY2VkIHRoZSBjbWEgZHVtcCBhdCB0aGUgYmVnaW5uaW5nIGRpZG4ndAo+ID4gY2hh
bmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBhIHJlc2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiA+
IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPgo+IEkgZG9uJ3QgdGhpbmsgc28uCj4KPiBX
ZXJlIHlvdSBhYmxlIHRvIGlkZW50aWZ5IHdoYXQgd2FzIHRoZSBleGFjdCBjb21taXQgdGhhdCBj
YXVzZWQgc3VjaCByZWdyZXNzaW9uPwoKSSB3YXMgYWJsZSB0byBuYXJyb3cgaXQgZG93biB0aGUg
OTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6IHJlZmFjdG9yCmludGVybmFsIGFsbG9jYXRpb24gZnVu
Y3Rpb25zIikgdGhhdCBjYXVzZWQgdGhlIHJlZ3Jlc3Npb24gd2l0aApFdG5hdml2LgoKSSBhbHNv
IG5vdGljZWQgdGhhdCBpZiBJIGNyZWF0ZSBhIHJlc2VydmVkIG1lbW9yeSBub2RlIGFzIHdhcyBk
b25lIG9uZQppbXg2dWwtY2NpbXg2dWxzb20uZHRzaSB0aGUgM0Qgc2VlbXMgdG8gd29yayBhZ2Fp
biwgYnV0IHdpdGhvdXQgaXQsIEkKd2FzIGdldHRpbmcgZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhl
ICdjbWE9MjU2TScgb3Igbm90LgpJIGRvbid0IGhhdmUgYSBwcm9ibGVtIHVzaW5nIHRoZSByZXNl
cnZlZCBtZW1vcnksIGJ1dCBJIGd1ZXNzIEkgYW0gbm90CnN1cmUgd2hhdCB0aGUgYW1vdW50IHNo
b3VsZCBiZS4gIEkga25vdyBmb3IgdGhlIHZpZGVvIGRlY29kaW5nIDEwODBwLApJIGhhdmUgaGlz
dG9yaWNhbGx5IHVzZWQgY21hPTEyOE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29t
ZQptZW1vcnkgYWxsb2NhdGlvbiwgaXMgdGhhdCBlbm91Z2ggb3Igc2hvdWxkIEkgdXNlIDI1Nk0/
CgphZGFtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
