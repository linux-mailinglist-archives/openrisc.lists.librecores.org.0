Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 811A82499C4
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2930A20D7A;
	Wed, 19 Aug 2020 11:55:58 +0200 (CEST)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by mail.librecores.org (Postfix) with ESMTPS id A497E20CF7
 for <openrisc@lists.librecores.org>; Wed, 19 Aug 2020 00:18:11 +0200 (CEST)
Received: by mail-lf1-f67.google.com with SMTP id b11so11043396lfe.10
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn5mkrGFBbPg90QSTX4ScoaPazdulb+v6hO8tmlQUhM=;
 b=OIqydpEtkNgTroF3lnVBbcPUKQ2ogcmEFiN7wEqPDoyKdbDTrVZZ+NzClaB1tmtiGg
 1q5dVw3gvA1HPNIt4f5Vr2bR4NBZwxXhiEUf3tzRwKt7NekpaA3/ibZvmA16+OG3grZ+
 Y0pgD14ByceFmFxwkAMy97PtaHPZGmMkTHmHfX1qI8cguewQrhSEyNet//D8uLt3URbX
 wtAIYHJxjbyMRdcrkRjXE+IjNA6JaY3Jp4v8SILylCVLQ416pwm5RG8VS/kkCIf9Vupf
 N2rIlz5ZIsghwkVWwHdlgrBINrap6VQaSjRwMPYFZcqiCFlD1Cw4CyHiSO7wqpA8NX8m
 GJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn5mkrGFBbPg90QSTX4ScoaPazdulb+v6hO8tmlQUhM=;
 b=huPAIHzRw4/apDtVzYttjaMboqnG4MUWMjpQpikzHk2XV44hwqYMYYcuXiLbrKRKpj
 CcB9f5LNpOlbkE7Sf+BxDdNK+z3e9s2gJ9RUyU1sNQHiL4122f9lBOsyzBmuzRUzxyQN
 jGe48uuQ72CujzS07uc3+Gc9lZgS5OeFYXPjC5gqVfy/pcChdvEzITbeiBBMHYgbRA+t
 RL8uWrOX+G3ptcIbaqDiJs7Z9opbwiToATLxOiHmMkDqw79ytHSl5E87s8dRS5F+Un6E
 PBtVZgiF+f0vZeyzfKRBmzme8jizBJS1K7LOkSS/80w8SA+G2LBApf3b6ggPrZPFlgg6
 UvfQ==
X-Gm-Message-State: AOAM532adGT60yjJpW6FStshXJEPQlYHNn5K0KsZMJQr0NPcFbk1beyo
 ac9JTPhoIn5jU/x8VOG9CXv37isQvUpfu/m79/8=
X-Google-Smtp-Source: ABdhPJyYNUN3v5scOCVMaoKuHu78eqvAibUFuUkJdpzA5rqp/I7KCAgyGHrlcUN+z5qLySo7/N7W852szcke7k/pYlA=
X-Received: by 2002:a19:cb51:: with SMTP id b78mr10676996lfg.130.1597789091106; 
 Tue, 18 Aug 2020 15:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-11-rppt@kernel.org>
In-Reply-To: <20200818151634.14343-11-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2020 00:18:00 +0200
Message-ID: <CANiq72mnzTv7SphVxsYy++rAPdaKVVLGGHauxNLY5D4dzq3CPA@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: Re: [OpenRISC] [PATCH v3 10/17] memblock: reduce number of
 parameters in for_each_mem_range()
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
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-MM <linux-mm@kvack.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgNToxOSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gIC5jbGFuZy1mb3JtYXQgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKysKCkZvciB0aGUgLmNsYW5nLWZvcm1hdCBiaXQ6CgpBY2tlZC1ieTogTWlndWVsIE9q
ZWRhIDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgoKQ2hlZXJzLApNaWd1ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
