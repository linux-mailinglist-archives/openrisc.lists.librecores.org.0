Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 440A22460BE
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E884220CB5;
	Mon, 17 Aug 2020 10:46:23 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id DF68B20CE7
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 10:09:58 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id e22so3934878pjt.3
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mO4UW6jhce2IwLYWJIjyNoNVa+Gr5PBQ2rV1LkhhIeA=;
 b=bNG6JL/O5TVQki3sHfHEOfTczEIMUXR0OLqZGWSVnVXN0YvSLXQj4R1CZin1hIrLmj
 rDRSSHKktD8YAK18dQ3Ix7Lo07yJ8erIxBxxxxqVLyUXKDeyjbkBvyU6KTuEXDNL+VQr
 1QQzuFpqB0CYmf+5pX3A4eJDz9R/FeezQPycBuGnXY4EFLSYZVijwWE1t6E2M5B99qAH
 FniHRX5RxN1gZw65OKCdqnG/UzIrS3ICQ278hYR6IoGyzyd6ykow+PajTtCN7ldzFD83
 Hcz6o03i9dPHjv0yz+B7ucVCSupfsp/DKM7XkQQq14g4beE60uqTFBLLU79wWmkWweg4
 xE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mO4UW6jhce2IwLYWJIjyNoNVa+Gr5PBQ2rV1LkhhIeA=;
 b=OFFD9cbCeUCqc5+VtQbWFecjeLeYWw/YStwL7e1GjPoznGFvsCVDtpmuNuLuuK57PP
 sXEXgEjdy+vU0bkY6uCGHvaMj6Ysiger/xscvc2e4RWUJ5gdHVh3lJefZ7nguSv7W9yJ
 2RecPV49Q+jZwTER2klH8apBxW0BhIe/KLp5XJBD2KaF/wmijucBOp37Rp1DQ2n68hVf
 sF4CTy7KkHPIKTuayXFxI+4H4/0Ds5if2/K4nVb44fzzdCHvg0kj9oa63KzHmGvZlWyQ
 GxLB6wMWvs2TvR7d2Rc0Pc0e8Di/8YrMRWhoS7nS4+cQaRFJC6YkFU8O+dAVfzD+soqg
 ZKdw==
X-Gm-Message-State: AOAM531GK4w0QJ4yRhg0y2vc9K1I+fBpaXUBJ/QOBF98NaPusJu6C3Mz
 4zuN1hIfvlBmdPvH7y2V+nfw4NG/0LhoEIttdJ4=
X-Google-Smtp-Source: ABdhPJwl2tr9ClL3asn7D0daWCLxpbWcicGBHl3RglmUadciWpYNtKvtb4F0xzOXS215QqSA9z2se3QNEhc8iGYlMEA=
X-Received: by 2002:a17:90a:8918:: with SMTP id
 u24mr3082134pjn.7.1595923796912; 
 Tue, 28 Jul 2020 01:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-4-rppt@kernel.org>
In-Reply-To: <20200728051153.1590-4-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Jul 2020 01:09:45 -0700
Message-ID: <CAMo8Bf+VKHmAm1GV=0D9Um2mpsxjnwp9WrAJq_eKW1MK+_8r6g@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 03/15] arm,
 xtensa: simplify initialization of high memory pages
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
Cc: "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMTA6MTIgUE0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNv
bT4KPgo+IFRoZSBmdW5jdGlvbiBmcmVlX2hpZ2hwYWdlcygpIGluIGJvdGggYXJtIGFuZCB4dGVu
c2EgZXNzZW50aWFsbHkgb3Blbi1jb2RlCj4gZm9yX2VhY2hfZnJlZV9tZW1fcmFuZ2UoKSBsb29w
IHRvIGRldGVjdCBoaWdoIG1lbW9yeSBwYWdlcyB0aGF0IHdlcmUgbm90Cj4gcmVzZXJ2ZWQgYW5k
IHRoYXQgc2hvdWxkIGJlIGluaXRpYWxpemVkIGFuZCBwYXNzZWQgdG8gdGhlIGJ1ZGR5IGFsbG9j
YXRvci4KPgo+IFJlcGxhY2Ugb3Blbi1jb2RlZCBpbXBsZW1lbnRhdGlvbiBvZiBmb3JfZWFjaF9m
cmVlX21lbV9yYW5nZSgpIHdpdGggdXNhZ2UKPiBvZiBtZW1ibG9jayBBUEkgdG8gc2ltcGxpZnkg
dGhlIGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4Lmli
bS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtL21tL2luaXQuYyAgICB8IDQ4ICsrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC94dGVuc2EvbW0vaW5pdC5jIHwgNTUgKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQoKRm9yIHRoZSB4dGVuc2EgcGFy
dDoKUmV2aWV3ZWQtYnk6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPgpUZXN0ZWQt
Ynk6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPgoKLS0gClRoYW5rcy4KLS0gTWF4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
