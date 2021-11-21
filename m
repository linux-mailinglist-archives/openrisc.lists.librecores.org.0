Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABE34582A0
	for <lists+openrisc@lfdr.de>; Sun, 21 Nov 2021 10:01:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 33F1E2424F;
	Sun, 21 Nov 2021 10:01:33 +0100 (CET)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id AAF6322C25
 for <openrisc@lists.librecores.org>; Sun, 21 Nov 2021 10:01:31 +0100 (CET)
Received: by mail-pl1-f173.google.com with SMTP id p18so11493946plf.13
 for <openrisc@lists.librecores.org>; Sun, 21 Nov 2021 01:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
 b=Tgb5Ic+uwSSoM4JZA36HMAnlatkdP+klPPLN5bBR4mKKK7eTLYbvh8o7E0EcmDPq2Q
 qLbdPM+Vl8mxGeh64K6wzQ+bz31be5sOsZRi7/BFqa+3UZR2mkUMH1od5ApykCQ4oge7
 PWRsbIqGPWCVfPaQ/9SinTdE1/ZkUXrgz0XtKq4W6GhO2Tqz3W9WDL2YZ864OPwKasYW
 XOd5tML9uld3R9EbWMfJk2iapJud7W6QS3RAsn8xBt2Px10d2Ru8NLyAcujfPW2JGJIW
 WoJyuNX3QATWQwrzDElQcMEP/yNoxhjpnku/gWQVFiahs4VyOBv8MikwZLaNOsRVBr4h
 1RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
 b=WkO6BNbMMD3K77a7QBvAwNmu7MktAjStSzyqsZToPn3UsysR1GS/yzGSMq7EPkStiO
 8Za4W4sDKXhGI66cyBuN1SXK6hqYtMnudQ6KGr00sTjHAMIiArlQr5rs1aGk3720mY5d
 HtLXBKr2Srt0gj+FR5hBDpO3Tzuv1VQ0ez9BINdBMWpQiuI0/HF0GsNmikijcSxQk7js
 ALwlOFnX4WFIqcSO36sn5fKBOLg0hbqTzhGVF30czqkcaQD/ROldWQr9+W1yBGD/2n06
 Fk//lsVQ55MaGlbOD2OCMRwxhU3bLQbLWYjRzAm0PUqFnGr4DFFKVqbBHsIxBRH+SIzY
 xeqw==
X-Gm-Message-State: AOAM532vyAhhIcIHw6v44pGyXG0FO0Xv5a3/TZpP/xBww2L1yvnHWknG
 oY36zOvAd20hYMECwlD0jzI=
X-Google-Smtp-Source: ABdhPJzLtHKp3ARITLkl6IEvP9ASH3fdvPyqX2o54+OrpL9oFv6P8ZWeoiFpXMGZlDp44TWDeD62sQ==
X-Received: by 2002:a17:903:1d2:b0:142:24f1:1213 with SMTP id
 e18-20020a17090301d200b0014224f11213mr96857331plh.81.1637485290032; 
 Sun, 21 Nov 2021 01:01:30 -0800 (PST)
Received: from localhost ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id lp12sm4320990pjb.24.2021.11.21.01.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 01:01:29 -0800 (PST)
Date: Sun, 21 Nov 2021 17:01:20 +0800
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <YZoK4IiBOTPduEyN@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
Subject: Re: [OpenRISC] [PATCH 0/2] of: remove reserved regions count
 restriction
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
Cc: "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Rich Felker <dalias@libc.org>, Jinyang He <hejinyang@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Vladimir Isaev <isaev@synopsys.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Thierry Reding <treding@nvidia.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-xtensa@linux-xtensa.org, Vineet Gupta <vgupta@kernel.org>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBOb3YgMjEsIDIwMjEgYXQgMDg6NDM6NDdBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPk9uIEZyaSwgTm92IDE5LCAyMDIxIGF0IDAzOjU4OjE3UE0gKzA4MDAsIENhbHZpbiBa
aGFuZyB3cm90ZToKPj4gVGhlIGNvdW50IG9mIHJlc2VydmVkIHJlZ2lvbnMgaW4gL3Jlc2VydmVk
LW1lbW9yeSB3YXMgbGltaXRlZCBiZWNhdXNlCj4+IHRoZSBzdHJ1Y3QgcmVzZXJ2ZWRfbWVtIGFy
cmF5IHdhcyBkZWZpbmVkIHN0YXRpY2FsbHkuIFRoaXMgc2VyaWVzIHNvcnRzCj4+IG91dCByZXNl
cnZlZCBtZW1vcnkgY29kZSBhbmQgYWxsb2NhdGVzIHRoYXQgYXJyYXkgZnJvbSBlYXJseSBhbGxv
Y2F0b3IuCj4+IAo+PiBOb3RlOiByZXNlcnZlZCByZWdpb24gd2l0aCBmaXhlZCBsb2NhdGlvbiBt
dXN0IGJlIHJlc2VydmVkIGJlZm9yZSBhbnkKPj4gbWVtb3J5IGFsbG9jYXRpb24uIFdoaWxlIHN0
cnVjdCByZXNlcnZlZF9tZW0gYXJyYXkgc2hvdWxkIGJlIGFsbG9jYXRlZAo+PiBhZnRlciBhbGxv
Y2F0b3IgaXMgYWN0aXZhdGVkLiBXZSBtYWtlIGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRf
bWVtKCkKPj4gZG8gcmVzZXJ2YXRpb24gb25seSBhbmQgYWRkIGFub3RoZXIgY2FsbCB0byBpbml0
aWFsaXplIHJlc2VydmVkIG1lbW9yeS4KPj4gU28gYXJjaCBjb2RlIGhhdmUgdG8gY2hhbmdlIGZv
ciBpdC4KPgo+SSB0aGluayBtdWNoIHNpbXBsZXIgd291bGQgYmUgdG8gdXNlIHRoZSBzYW1lIGNv
bnN0YW50IGZvciBzaXppbmcKPm1lbWJsb2NrLnJlc2VydmVkIGFuZCByZXNlcnZlZF9tZW0gYXJy
YXlzLgo+Cj5JZiB0aGVyZSBpcyB0b28gbXVjaCByZXNlcnZlZCByZWdpb25zIGluIHRoZSBkZXZp
Y2UgdHJlZSwgcmVzZXJ2aW5nIHRoZW0gaW4KPm1lbWJsb2NrIHdpbGwgZmFpbCBhbnl3YXkgYmVj
YXVzZSBtZW1ibG9jayBhbHNvIHN0YXJ0cyB3aXRoIHN0YXRpYyBhcnJheQo+Zm9yIG1lbWJsb2Nr
LnJlc2VydmVkLCBzbyBkb2luZyBvbmUgcGFzcyB3aXRoIG1lbWJsb2NrX3Jlc2VydmUoKSBhbmQK
PmFub3RoZXIgdG8gc2V0IHVwIHJlc2VydmVkX21lbSB3b3VsZG4ndCBoZWxwIGFueXdheS4KClll
cy4gVGhpcyBoYXBwZW5zIG9ubHkgaWYgdGhlcmUgYXJlIHR3byBtYW55IGZpeGVkIHJlc2VydmVk
IHJlZ2lvbnMuCm1lbWJsb2NrLnJlc2VydmVkIGNhbiBiZSByZXNpemVkIGFmdGVyIHBhZ2luZy4K
CkkgYWxzbyBmaW5kIGFub3RoZXIgcHJvYmxlbS4gSW5pdGlhbGl6aW5nIGR5bmFtaWMgcmVzZXJ2
YXRpb24gYWZ0ZXIKcGFnaW5nIHdvdWxkIGZhaWwgdG8gbWFyayBpdCBuby1tYXAgYmVjYXVzZSBu
by1tYXAgZmxhZyB3b3JrcyB3aGVuIGRvaW5nCmRpcmVjdCBtYXBwaW5nLiBUaGlzIHNlZW1zIHRv
IGJlIGEgY2lyY3VsYXIgZGVwZW5kZW5jeS4KClRoYW5rIFlvdSwKQ2FsdmluCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
