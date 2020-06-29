Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 18A4E20DCEB
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A666420D33;
	Mon, 29 Jun 2020 22:45:11 +0200 (CEST)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by mail.librecores.org (Postfix) with ESMTPS id 6676920BB4
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 16:01:29 +0200 (CEST)
Received: by mail-qv1-f66.google.com with SMTP id a14so7663270qvq.6
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FrjxWdY/Gjwce8t0JyeJsnYTMhQlskObJO/oLUWzfo=;
 b=KsYeoNtN/hmKD60koJPvKXhY1HT5rh0BdsIymjK2OY+Ah5csm67fWOMInZoSB5MyiF
 z81tpEOU7gbEs2Eu9dK1IU73/ldLFTcOuXQ4NQt1zxjMaUlUH9xpuPmQkDZyG2XpHE5A
 z0rDQ6F3p6odfLFvjQ20/v+vqn3osPhCyUtrTurdqBrAHPO36wwugYL1OqGKXGdazN2M
 p5mNNLqMsIqkd1lea0NNKZvGNZ4NvI4uksXON6N73LrjpsMxdX6M9+heVdl/zTyGvkYj
 tkHXxI8XU7hiVfWyn9RhwdGCF2zdf8eMUPHFh6FNadOyOkvVyTEcnpjW7aa7VVLEWYLN
 vdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FrjxWdY/Gjwce8t0JyeJsnYTMhQlskObJO/oLUWzfo=;
 b=dityZIBzHNGEy1byMxJCu2gd/vWCJnd7SUqaU9L0aMdPH91eLwnfJ0HNX8zeD8rhlV
 OUPyOSl2IJxYUC49OPjzHpylXpUGhfigv8K4kAh0t9xo+5cZXRBpISg6y6jbnsvflZAA
 FBRwUWgpbx+Uwk0NyNLU/entbstpNqHmYPPTfmsSr1czRCzdcXXoumFflP5ZW8NQxyZh
 9rBzWPuk2iiIyJrSQjRLZzrNk+wxfP2B4kDtndR9/uzQV4sxJtogL9nqZ7HXIUv79jwv
 kXWxlkdTy6M6hAo9LIbo0NHzXfVg6NZqcwqrrA2lN7bYSfTGhfUJm5LfGW+DV7YRg4OC
 Zu5w==
X-Gm-Message-State: AOAM530XC6IguhGJhaUFPrYNvgPReVJAPT5NI48wH5tPYb5/+7XdfmX4
 1Wqer1Y1FPiCo7SFRpvv/hEmI3nyJwvkSe/SBos=
X-Google-Smtp-Source: ABdhPJwRvnHK4e9FuZZ286EO2eHunvWxUS+jw1hxD70l+wfbFL9aDwHZRKLC21a2KPKCyOwmNUkOhP18WuRSaAVXDjg=
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr8130354qvz.114.1593439286277; 
 Mon, 29 Jun 2020 07:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
From: Pekka Enberg <penberg@gmail.com>
Date: Mon, 29 Jun 2020 17:01:14 +0300
Message-ID: <CAOJsxLE47WP9aMY3nh=E7C1a_esHt=sBFWCnsVA2umZ7TZ6TTA@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 0/8] mm: cleanup usage of <asm/pgalloc.h>
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
Cc: ia64 <linux-ia64@vger.kernel.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "list@ebiederm.org:DOCUMENTATION <linux-doc@vger.kernel.org>,
 list@ebiederm.org:MEMORY MANAGEMENT <linux-mm@kvack.org>,
 " <linux-arch@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgNTozNSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+IE1vc3QgYXJjaGl0ZWN0dXJlcyBoYXZlIHZlcnkgc2ltaWxhciB2ZXJz
aW9ucyBvZiBwWGRfYWxsb2Nfb25lKCkgYW5kCj4gcFhkX2ZyZWVfb25lKCkgZm9yIGludGVybWVk
aWF0ZSBsZXZlbHMgb2YgcGFnZSB0YWJsZS4KPiBUaGVzZSBwYXRjaGVzIGFkZCBnZW5lcmljIHZl
cnNpb25zIG9mIHRoZXNlIGZ1bmN0aW9ucyBpbgo+IDxhc20tZ2VuZXJpYy9wZ2FsbG9jLmg+IGFu
ZCBlbmFibGUgdXNlIG9mIHRoZSBnZW5lcmljIGZ1bmN0aW9ucyB3aGVyZQo+IGFwcHJvcHJpYXRl
LgoKVmVyeSBuaWNlIGNsZWFudXAgc2VyaWVzIHRvIHRoZSBwYWdlIHRhYmxlIGNvZGUhCgpGV0lX
OgoKUmV2aWV3ZWQtYnk6IFBla2thIEVuYmVyZyA8cGVuYmVyZ0BrZXJuZWwub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
