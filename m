Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 90AC733F960
	for <lists+openrisc@lfdr.de>; Wed, 17 Mar 2021 20:34:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EDBA5211E5;
	Wed, 17 Mar 2021 20:34:56 +0100 (CET)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mail.librecores.org (Postfix) with ESMTPS id DCC8D209D8
 for <openrisc@lists.librecores.org>; Wed, 17 Mar 2021 15:03:34 +0100 (CET)
Received: by mail-yb1-f180.google.com with SMTP id p186so40654048ybg.2
 for <openrisc@lists.librecores.org>; Wed, 17 Mar 2021 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
 b=i2DpCpQM7JeSSiS/pjMxgtMmRWaqyEUnqOkpir3k6hjfU9Oor7nDorySG4w47CoCGd
 HaiLgTyqU0kC8zA/M2kZQM1sH1E1LbWud/WbA8om7HWvSV+BUakqiOwPUeTLcoqCLPGf
 JedwFXQpUMM2xc1N014Ahaw2YTMoAf2cj3FsgDsCKv3ZOzvpAcW8c+eMj3EENF375f8x
 11rayPkdrSyY5YcS7+D3f2mNmy0iI8qzZ8PRIa+NRFehp669D1SyF0qYVVKeD+gzVYK8
 LIsktzMZcnA20N+P0QIhTw/wSHTpN81axxWdN3YKq6VrI5qwWqPf0cj92aOsspj4iCYa
 aQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
 b=VWTgZzYe7WeeQ6MyudVDGCr7gu4+k4sBE19cF67FNy4x5k18rZFinaw+sxnzR8lwuU
 V+94id8xuuz3eh9rXBrc5uvD4IwWYQsGmA094xQO/V2sIPxdCw6ITqirRydS/SHWux0B
 FDlhhHpy1Bfb457Qr3NoiNNVL1NYJLL84yc26/fkVWYzY4vgfOLTL/2EurJj4xu0ZSjR
 JnV7acYtouIEwmpOvMc3G1E4Z3TVEkaXiO6znXNGwPMSuhHI7kzdmydCWnP6gWns0Ub6
 oivLVOTHutFOtmxTg82k9c7RmDlKvInRxykGfXq9faPy21SPJYTOdMPnuY44ZeWwhPsF
 t5OQ==
X-Gm-Message-State: AOAM533iJaod5SmLG5keEP81tWbLhyOq4rc4Xo37JYdeXDdfrPgKiurs
 cI7KSEMMPFsvk8/pMZTowKwQYbtSnCo4fb6FVMY=
X-Google-Smtp-Source: ABdhPJxYwg2QBX1owqFPtrq2F/9pLRU/hzhKTzIOR3dpydN55snYMjquLkj00WQN+8aJP9sdN02xLmqhMTlZQxWC8Dc=
X-Received: by 2002:a25:dad4:: with SMTP id n203mr4746316ybf.233.1615989813490; 
 Wed, 17 Mar 2021 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 17 Mar 2021 17:03:22 +0300
Message-ID: <CADxRZqwFokuZrhA6GFr=whM3s7BqZpzo8yq=TW6YEr=eeEUH0A@mail.gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-Mailman-Approved-At: Wed, 17 Mar 2021 20:34:55 +0100
Subject: Re: [OpenRISC] [PATCH v2] mm: Move mem_init_print_info() into
 mm_init()
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMTcsIDIwMjEgYXQgNDo1MSBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53
YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gbWVtX2luaXRfcHJpbnRfaW5mbygpIGlzIGNhbGxl
ZCBpbiBtZW1faW5pdCgpIG9uIGVhY2ggYXJjaGl0ZWN0dXJlLAo+IGFuZCBwYXNzIE5VTEwgYXJn
dW1lbnQsIHNvIHVzaW5nIHZvaWQgYXJndW1lbnQgYW5kIG1vdmUgaXQgaW50byBtbV9pbml0KCku
Cj4KPiBBY2tlZC1ieTogRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+
Cj4gLS0tCj4gdjI6Cj4gLSBDbGVhbnVwICdzdHInIGxpbmUgc3VnZ2VzdGVkIGJ5IENocmlzdG9w
aGUgYW5kIEFDSwoKYXBwbGllZCBwYXRjaCAoNS4xMi4wLXJjMy0wMDAyMC1nMWRmMjczMTNmNTBh
LWRpcnR5KSBvdmVyIGxpbnVzLmdpdAphbmQgdGVzdGVkIGJvb3Qgb24gYSBzcGFyYzY0IHZpcnR1
YWwgbWFjaGluZSAobGRvbSkgLSBib290cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
