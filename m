Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8E18035759E
	for <lists+openrisc@lfdr.de>; Wed,  7 Apr 2021 22:13:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 25DB5212CF;
	Wed,  7 Apr 2021 22:13:05 +0200 (CEST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mail.librecores.org (Postfix) with ESMTPS id 33551204A1
 for <openrisc@lists.librecores.org>; Wed,  7 Apr 2021 22:13:02 +0200 (CEST)
Received: by mail-pf1-f176.google.com with SMTP id d124so105234pfa.13
 for <openrisc@lists.librecores.org>; Wed, 07 Apr 2021 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dwldfrHGB7cvjNDHe6gxp+OQ0DSzEe0anuIQnT5lIYc=;
 b=dKW4tyxbGX73iHxH5Iha60EvcjCvKI+5hrpqwPPcbjELczGr/kzgfdsnLJJsWtOJbP
 ubOwwaB3iZb/RBJ+1QPkWGQAjFPjPBqh2IboNE1nH7H1pZZqyeSqspXh1PeeRkVlyVq3
 D+oq7t34NOHRn9OQqu4dUPDeY2QjjFesL1gh9WM+knJrz1i5ZQMIlvyZpNZOQKqZbOKS
 4CB8O8zOE9mVX0eyokxf96eDPzy8oTdAAN584lU799CDSvkBRtjLRtC/rvSTel9pIKWP
 gshTMF9nTcU8N6w8UNgn+aG83qEZcXRIQj51bqqxl3MvzOMunlFLxakjAhVMSVBe674a
 jRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dwldfrHGB7cvjNDHe6gxp+OQ0DSzEe0anuIQnT5lIYc=;
 b=As794kChc7bUYWTi4jv7YnZXwvzidJ37s4jRzQ6bDho0viqs3KKdG3eF2MqTRyppXI
 +ePRMtTm6xB+0/CYqrBIBteBj7poLjFEhOWKQ2iGHD/vF3z6UhqblcpXKuCZZ7vvBQzU
 aV0nnj1bgRciVloHC6JM2tX2r54ikadN7OO07qwVXNWQNYbGnSmQGRlazZdmR9nkagAX
 13tLs+IgtaN6pH0LVREdqI45Wno27px48o+pMOvpcXjARj53BCWphEu9aKkj2xWGD7JY
 kX+CQ0e+PULVZg5BXamSk/77b8cgIHbggI2fHc4AOIEaRturc3rpjR+qV0XBWuXE+8hx
 njLg==
X-Gm-Message-State: AOAM532BstMgCnPgrjIvfnBX/BcgYjyNCoIChV+JtT4PNrPFDEwvSpxY
 3zYk+dnLs6T4Uh0z0bD8knw=
X-Google-Smtp-Source: ABdhPJx1TzjDHM8SCpdazwwikZp8MB63xmALxAEXVlHdCjBoBVsMzPPllM88y4Piph/rcIdj06SGPw==
X-Received: by 2002:a65:610f:: with SMTP id z15mr4931593pgu.360.1617826380553; 
 Wed, 07 Apr 2021 13:13:00 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 m1sm5878421pjk.24.2021.04.07.13.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 13:12:59 -0700 (PDT)
Date: Thu, 8 Apr 2021 05:12:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210407201258.GH3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
 <20210406235208.GG3288043@lianli.shorne-pla.net>
 <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org, guoren@kernel.org,
 sparclinux@vger.kernel.org, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMTE6NDc6NDlBTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMDg6NTI6MDhBTSArMDkwMCwgU3RhZmZv
cmQgSG9ybmUgd3JvdGU6Cj4gPiBXaHkgZG9lc24ndCBSSVNDLVYgYWRkIHRoZSB4Y2hnMTYgZW11
bGF0aW9uIGNvZGUgc2ltaWxhciB0byBPcGVuUklTQz8gIEZvcgo+ID4gT3BlblJJU0Mgd2UgYWRk
ZWQgeGNoZzE2IGFuZCB4Y2hnOCBlbXVsYXRpb24gY29kZSB0byBlbmFibGUgcXNwaW5sb2Nrcy4g
IFNvCj4gPiBvbmUgdGhvdWdodCBpcyB3aXRoIENPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxP
Q0tTX1hDSEczMj15LCBjYW4gd2UgcmVtb3ZlIG91cgo+ID4geGNoZzE2L3hjaGc4IGVtdWxhdGlv
biBjb2RlPwo+IAo+IENPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMiBpcyBn
dWFyYW50ZWVkIGNyYXAuCj4KPiBBbGwgdGhlIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlIHdhbnRl
ZCBpdCBhcmUgUklTQyBzdHlsZSBMTC9TQyBhcmNocywKPiBhbmQgZm9yIHRoZW0gYSBjbXB4Y2hn
IGxvb3AgaXMgYSBkYWZ0IHRoaW5nIHRvIGRvLCBzaW5jZSBpdCByZWR1Y2VzIHRoZQo+IGNoYW5j
ZSBvZiBpdCBiZWhhdmluZyBzYW5lbHkuCj4gCj4gV2h5IHdvdWxkIHdlIHByb3ZpZGUgc29tZXRo
aW5nIHRoYXQncyBrbm93biB0byBiZSBzdWJvcHRpbWFsPyBJZiBhbgo+IGFyY2hpdGVjdHVyZSBj
aG9vc2VzIHRvIG5vdCBjYXJlIGFib3V0IGRldGVybWluaXNtIGFuZCBvciBmd2QgcHJvZ3Jlc3Ms
Cj4gdGhlbiB0aGF0J3MgdGhlaXIgY2hvaWNlLiBCdXQgbm90IG9uZSwgSSBmZWVsLCB3ZSBzaG91
bGQgZW5jb3VyYWdlLgoKVGhhbmtzLCB0aGlzIGlzIHRoZSByZXNwb25zZSBJIHdhcyBob3Bpbmcg
bXkgY29tbWVudCB3b3VsZCBwcm92b2tlLgoKU28gbm90IGVuYWJsaW5nIENPTkZJR19BUkNIX1VT
RV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMiBmb3IgYXJjaGl0ZWN0dXJlcwp1bmxlc3MgdGhleSBy
ZWFsbHkgd2FudCBpdCBzaG91bGQgYmUgdGhlIHdheS4KCi1TdGFmZm9yZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
