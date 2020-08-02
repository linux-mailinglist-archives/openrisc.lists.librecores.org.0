Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A99D02460A3
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 72F7920CE2;
	Mon, 17 Aug 2020 10:45:51 +0200 (CEST)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by mail.librecores.org (Postfix) with ESMTPS id 799F320917
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 20:01:15 +0200 (CEST)
Received: by mail-ej1-f66.google.com with SMTP id a26so10537539ejc.2
 for <openrisc@lists.librecores.org>; Sun, 02 Aug 2020 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cWqP425OZ00Oz4x2XaCg5sL4Bi3BuFHBZ9fhbstEoPo=;
 b=uknpQ4DMxgwRI+7RXzKKaxSHSsHT4JX+qN+G3Zw62I+z7K+v0oM82e+YsM5L2ibFwZ
 ZtPLnfzJt8IFqkH991n5kK4zcZ2/fsZTMmLNrFK7hPe3auCniFr0qepP8+PKlvq/+X4Y
 6FOXivLK6+BH8tYzSACnWRFDv80Xb8yKxgJKQm36t4gslbAugHoQp37YMrGD2IIEXvEW
 lHLgWw9HHo88+yhhI1SsXvM9DHpmveOnmArUrLkNHDmUxgOR5yVJEiJKHqYfS7BI8LbU
 2xANFxjuEWzWjHDwLiCM886yebnNr5jnEbr0RMGk15mMx04KzIUKhAfWZe7dw+zaroY/
 roWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=cWqP425OZ00Oz4x2XaCg5sL4Bi3BuFHBZ9fhbstEoPo=;
 b=mELK4Kl8J64X/WJkrSaMFW/PoXrd5yc9L8V0Sgqc20EjP6nQmiSK/coUCXPQ2eG2xQ
 dN3GvBR1JiZxPj8iddHIeybOrfudPlE/dTq65cq/nIuzdERVqm2zhNllBfJJlaIn+sAr
 qTWLO6gJEZyMd2GAip9DwWU4bByfn4lICZHJhuKOEt7XSE6dymVvc6xxTeEw9puHB+Gf
 +iipC3n0a8JqAhFD0OPn5yHBocQt6PH5u7e0Em3GgP9KsJAWzjzXI9WoKEGE+Bsg7T7E
 l5+vG7RC+A7J3fU5tRtT5lGT1mcnI21uDw+htBiRw1wcu2Nu1I9thLTGb9qhJ7/WAb7G
 xChw==
X-Gm-Message-State: AOAM532kyvKFlLhmhsCuigcINDgAD+schM6nlJ3hfJDhKP2Gr9IFfoQ8
 64lMExtnG8ofhcca2Rzg6B4=
X-Google-Smtp-Source: ABdhPJzKJVSrfGoQ7+sK5UMaqi5wNpNE5CXoSPOw/FVAw4VikTzayUXH2AGSuVR6AmkbWWniCTFE/A==
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr13929214ejz.108.1596391275076; 
 Sun, 02 Aug 2020 11:01:15 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id t19sm14191760edw.63.2020.08.02.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:01:13 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:01:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200802180110.GA86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-14-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-14-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 13/17] x86/setup: simplify initrd
 relocation and reservation
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CiogTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogTWlrZSBS
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IEN1cnJlbnRseSwgaW5pdHJkIGltYWdl
IGlzIHJlc2VydmVkIHZlcnkgZWFybHkgZHVyaW5nIHNldHVwIGFuZCB0aGVuIGl0Cj4gbWlnaHQg
YmUgcmVsb2NhdGVkIGFuZCByZS1yZXNlcnZlZCBhZnRlciB0aGUgaW5pdGlhbCBwaHlzaWNhbCBt
ZW1vcnkKPiBtYXBwaW5nIGlzIGNyZWF0ZWQuIFRoZSAibGF0ZSIgcmVzZXJ2YXRpb24gb2YgbWVt
YmxvY2sgdmVyaWZpZXMgdGhhdCBtYXBwZWQKPiBtZW1vcnkgc2l6ZSBleGNlZWRzIHRoZSBzaXpl
IG9mIGluaXRyZCwgdGhlIGNoZWNrcyB3aGV0aGVyIHRoZSByZWxvY2F0aW9uCj4gcmVxdWlyZWQg
YW5kLCBpZiB5ZXMsIHJlbG9jYXRlcyBpbmlydGQgdG8gYSBuZXcgbWVtb3J5IGFsbG9jYXRlZCBm
cm9tCj4gbWVtYmxvY2sgYW5kIGZyZWVzIHRoZSBvbGQgbG9jYXRpb24uCj4gCj4gVGhlIGNoZWNr
IGZvciBtZW1vcnkgc2l6ZSBpcyBleGNlc3NpdmUgYXMgbWVtYmxvY2sgYWxsb2NhdGlvbiB3aWxs
IGFueXdheQo+IGZhaWwgaWYgdGhlcmUgaXMgbm90IGVub3VnaCBtZW1vcnkuIEJlc2lkZXMsIHRo
ZXJlIGlzIG5vIHBvaW50IHRvIGFsbG9jYXRlCj4gbWVtb3J5IGZyb20gbWVtYmxvY2sgdXNpbmcg
bWVtYmxvY2tfZmluZF9pbl9yYW5nZSgpICsgbWVtYmxvY2tfcmVzZXJ2ZSgpCj4gd2hlbiB0aGVy
ZSBleGlzdHMgbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZSgpIHdpdGggcmVxdWlyZWQgZnVuY3Rp
b25hbGl0eS4KPiAKPiBSZW1vdmUgdGhlIHJlZHVuZGFudCBjaGVjayBhbmQgc2ltcGxpZnkgbWVt
YmxvY2sgYWxsb2NhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0
QGxpbnV4LmlibS5jb20+CgpBc3N1bWluZyB0aGVyZSdzIG5vIGhpZGRlbiBkZXBlbmRlbmN5IGhl
cmUgYnJlYWtpbmcgc29tZXRoaW5nOgoKICBBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtl
cm5lbC5vcmc+CgpUaGFua3MsCgoJSW5nbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
