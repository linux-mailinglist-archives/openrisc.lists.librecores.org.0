Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AB43F2460A4
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 714C520D20;
	Mon, 17 Aug 2020 10:45:52 +0200 (CEST)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by mail.librecores.org (Postfix) with ESMTPS id 26F0E20D67
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 20:02:27 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id c2so19822019edx.8
 for <openrisc@lists.librecores.org>; Sun, 02 Aug 2020 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hIidJgHuEfm+QUxSjJcyWhB4lu2Xjl7LW3yKbJJeIh0=;
 b=uIs7/vU9Kx/pklkEtgD7hBiuHs6a0R+dGlNTjUGRPw721sRkbKusjxGi7PfHcXOJ+P
 EjAE8Vd54opYw74GdBkeR4XNF5IP2MPUk9fmgk6V6Ahfe99oRVQ2eTOjx4V/HNnjxo1p
 8JTL4om9ZC3cnlFf7IvLus1+6HB/iVpPvgkNBuxCV3vkFTVqsYvmHOwMCmyNnjJul9R4
 NyUbZELRb/+vAfU647duOFbumJn5NHcHvq2jBsmvofhPXlaOdyNnECGIYrfm3l1GH6Kt
 lYQels7sHnZLCY218xDI/G+/wAKH/pz8dPVH6DrvKapbnVTrwoCPcuTqLRUxp8GcwS18
 4m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=hIidJgHuEfm+QUxSjJcyWhB4lu2Xjl7LW3yKbJJeIh0=;
 b=LpiOupKvIW9SeLj5cGX/S32tX1Sb80y9q7pN8CoUMmNTt+0F0QxFt5Wcfl9VHQDPXB
 dSeIBYJu3/jKPFlFz01HNFFFxbdulox+2R+rPt30TcXSoDose0fXEw5fOY7AdsxW8ScJ
 GqDRqUAvi7oorhx3a5c8ULXN0ZcyyoDus4dnbHcnm15Ytnk7aCF+aX0AMSm2vDvo4Wg7
 go+Pk1QsdEkDJ9B0cFBWueeZfHpn+IxGt1z9HE+9kwU69B27+UC6UTycHN8vv1bXUMJs
 OUVUuJv9uWgx+JiG18g1CybFlzdakaKgaf0oiAfi9ZQW1IOM47TWukdO6HpP3g9L/dAt
 utYA==
X-Gm-Message-State: AOAM533iZ/84TuVuf1dEbS6u60Pzq7QrZFvDEcYCbzxGOCFqiiDCmrIR
 ACPR/y8MH7pJtxuCTcGuEgY=
X-Google-Smtp-Source: ABdhPJxqUvJyL87Stg26v1+JoHbkpad0yhpL8P6CjttoB9bwnL2tuiWl2R60zFRBWtP21v7K7J2UFg==
X-Received: by 2002:aa7:cb15:: with SMTP id s21mr12929126edt.175.1596391346876; 
 Sun, 02 Aug 2020 11:02:26 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id j21sm14090092edq.20.2020.08.02.11.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:02:26 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:02:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200802180223.GB86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-15-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 14/17] x86/setup: simplify
 reserve_crashkernel()
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
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+ICogUmVwbGFjZSBtYWdpYyBudW1iZXJz
IHdpdGggZGVmaW5lcwo+ICogUmVwbGFjZSBtZW1ibG9ja19maW5kX2luX3JhbmdlKCkgKyBtZW1i
bG9ja19yZXNlcnZlKCkgd2l0aAo+ICAgbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZSgpCj4gKiBT
dG9wIGNoZWNraW5nIGZvciBsb3cgbWVtb3J5IHNpemUgaW4gcmVzZXJ2ZV9jcmFzaGtlcm5lbF9s
b3coKS4gVGhlCj4gICBhbGxvY2F0aW9uIGZyb20gbGltaXRlZCByYW5nZSB3aWxsIGFueXdheSBm
YWlsIGlmIHRoZXJlIGlzIG5vIGVub3VnaAo+ICAgbWVtb3J5LCBzbyB0aGVyZSBpcyBubyBuZWVk
IGZvciBleHRyYSB0cmF2ZXJzYWwgb2YgbWVtYmxvY2subWVtb3J5Cj4gCj4gU2lnbmVkLW9mZi1i
eTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKQXNzdW1pbmcgdGhhdCB0aGlz
IGdvdCBvciB3aWxsIGdldCB0ZXN0ZWQgd2l0aCBhIGNyYXNoIGtlcm5lbDoKCkFja2VkLWJ5OiBJ
bmdvIE1vbG5hciA8bWluZ29Aa2VybmVsLm9yZz4KClRoYW5rcywKCglJbmdvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
