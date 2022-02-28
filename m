Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AA9754C6E87
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 14:49:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 65A572486E;
	Mon, 28 Feb 2022 14:49:22 +0100 (CET)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mail.librecores.org (Postfix) with ESMTPS id 8F04D24864
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 14:49:20 +0100 (CET)
Received: by mail-ua1-f47.google.com with SMTP id y1so45569uap.4
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 05:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZlhBssXvwBUH+DmkM+uVIB26RD/VtgYSa5UcFW0OSE=;
 b=PVXZLm6XvOeiNULPJS6TDreUwY5ujyVbjCh/lIuuF5AjySkdUoNNEr+9zCe1aVURJX
 uFRn7kOdbw8A2TW2aVsAvtbYBQw0tMJVuYcfP406FzEj3S6aLZV4GGPKMQzkb1/MbxiD
 v80neFl3EJrkEHfwqNV5wvgAa2B9baZQpkQ0Rr8/1IthN/8tfHWi+xeUeMhak1LQCpTL
 nRTEzZpGuHbHhWtzoI8WSGcl/9StWXjbwdEeCmiFt0DrGoCZFkT4RiQl8I6jVj92JiVJ
 K7JTWIRfp9jacxoD6q1/if6rZSAIFXEEISc+qrjA12ffwSRrkbIX71orYKydPYYWtIH0
 kYLg==
X-Gm-Message-State: AOAM531PH9SeC88HTfxOMnUwP+mzJANIZgL71KJhdppeXCC6EWk32Gf3
 FeshfsXEvjkqaZlhY3S7Xtpjpi6sJpndIw==
X-Google-Smtp-Source: ABdhPJwtlQxr3w6y8qJO0WLPWJGhb+DL3X5Zl0W3Kgb3XpChPW6Ebl1QPB4dNcmhpjJ3RCPYm0pFYw==
X-Received: by 2002:a9f:360f:0:b0:341:8a12:8218 with SMTP id
 r15-20020a9f360f000000b003418a128218mr7310937uad.14.1646056159385; 
 Mon, 28 Feb 2022 05:49:19 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056122138d00b0032c5d72c395sm1684783vkp.55.2022.02.28.05.49.18
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:49:18 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id d26so13062660vsh.0
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 05:49:18 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr7516436vsl.68.1646056157983; Mon, 28 Feb
 2022 05:49:17 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
In-Reply-To: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Feb 2022 14:49:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWve8XkqtMJCTB_BH9JRZ8C4f7ynF60D1fvx3hxaK4YzA@mail.gmail.com>
Message-ID: <CAMuHMdWve8XkqtMJCTB_BH9JRZ8C4f7ynF60D1fvx3hxaK4YzA@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [OpenRISC] [PATCH V3 09/30] arm/mm: Enable
 ARCH_HAS_VM_GET_PAGE_PROT
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
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgUnVzc2VsbCwKCk9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDExOjU3IEFNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBNb24sIEZlYiAy
OCwgMjAyMiBhdCAwNDoxNzozMlBNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPiA+
IFRoaXMgZGVmaW5lcyBhbmQgZXhwb3J0cyBhIHBsYXRmb3JtIHNwZWNpZmljIGN1c3RvbSB2bV9n
ZXRfcGFnZV9wcm90KCkgdmlhCj4gPiBzdWJzY3JpYmluZyBBUkNIX0hBU19WTV9HRVRfUEFHRV9Q
Uk9ULiBTdWJzZXF1ZW50bHkgYWxsIF9fU1hYWCBhbmQgX19QWFhYCj4gPiBtYWNyb3MgY2FuIGJl
IGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCj4KPiBXaGF0IEkgd291bGQgcmVh
bGx5IGxpa2UgdG8ga25vdyBpcyB3aHkgaGF2aW5nIHRvIHJ1biBfY29kZV8gdG8gd29yayBvdXQK
PiB3aGF0IHRoZSBwYWdlIHByb3RlY3Rpb25zIG5lZWQgdG8gYmUgaXMgYmV0dGVyIHRoYW4gbG9v
a2luZyBpdCB1cCBpbiBhCj4gdGFibGUuCj4KPiBOb3Qgb25seSBpcyB0aGlzIG1vcmUgZXhwZW5z
aXZlIGluIHRlcm1zIG9mIENQVSBjeWNsZXMsIGl0IGFsc28gYnJpbmdzCj4gYWRkaXRpb25hbCBj
b2RlIHNpemUgd2l0aCBpdC4KPgo+IEknbSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aGF0IHRoZSBiZW5l
Zml0IGlzLgoKSSB3YXMgd29uZGVyaW5nIGFib3V0IHRoYXQgYXMgd2VsbC4gQnV0IGF0IGxlYXN0
IGZvciBjb2RlIHNpemUgb24KbTY4aywgdGhpcyBkaWRuJ3QgaGF2ZSBtdWNoIGltcGFjdC4gIExv
b2tpbmcgYXQgdGhlIGdlbmVyYXRlZCBjb2RlLAp0aGUgaW5jcmVhc2UgZHVlIHRvIHVzaW5nIGNv
ZGUgZm9yIHRoZSAoZmV3IGRpZmZlcmVudCkgY2FzZXMgaXMgb2Zmc2V0CmJ5IGEgMTYtYml0IGp1
bXAgdGFibGUgKHdoaWNoIGlzIHRvIGJlIGNyZWRpdGVkIHRvIHRoZSBjb21waWxlcikuCgpJbiB0
ZXJtcyBvZiBDUFUgY3ljbGVzLCBpdCdzIGluZGVlZCB3b3JzZSB0aGFuIGJlZm9yZS4KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
