Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B9B6A2460A5
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6317420B09;
	Mon, 17 Aug 2020 10:45:53 +0200 (CEST)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by mail.librecores.org (Postfix) with ESMTPS id E8CEE20D7E
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 20:03:08 +0200 (CEST)
Received: by mail-ej1-f68.google.com with SMTP id d6so22503298ejr.5
 for <openrisc@lists.librecores.org>; Sun, 02 Aug 2020 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fQZKbY0rONiHjM83HibQy63AEJaxpKeGQhQtY04gDSU=;
 b=NClt20d7Ft+K6FkgUCUu4JaE3tIZQCut3LntjJUJhXUsmJc9/hAN8f1uhRfdf1xDS4
 v+mVxDX9o4kozVR+Ah8Xum0mBupoLJJ8sGRFuq+zGUPap92vHCw3QWRVbrRdpExOLg1f
 PfYSYoa+08lkV+ejUHsbzm11vb6ZXDx9wG5OH/PIC6kGD+/IwmcMBK0f+S9Q47Ilfp0r
 CnDK0w5UJZcBtyEbi0uelKFQBUpbqi9svF4nCggxxWbCeGrL/RSClOw7dY42O+RKurT4
 SeQmDc1qACQRwd/qkF4Bl6+EBF1g484NpzCeNGAZebTMM88+MrzhcW/7+ogo+dclYvqf
 xJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=fQZKbY0rONiHjM83HibQy63AEJaxpKeGQhQtY04gDSU=;
 b=nMm85VjNAGQsDm+5EU2GkzyJRn4RqE+djaIKh30FYtnvBUt0cuGlm8seSofLSgzgAf
 D6G4yMMwJCE3DurTcCaFNFK+/XODYcoeFdrcTPwloG4m2Gj2hQaDbh7U+uQ9T48eJYPu
 zFSBS5eoG3MBAJ7TQtuKi7GhbT1kBGzFJ1nB2aLGkXNDAgh/SKErFQO67hyScJNYVznR
 pCkQp6TXfdZNsNMjmxvIH4RhrDuD8lOuukD8i3LcixftiT/6VejdXH4k6ApMLKL7nMBl
 xszZqKUykUiZjhHZNdKg03Y54BXEP0uyqvfafupH+Cxai8EuuV3FocvOJvx6fHJnkW2W
 BHVg==
X-Gm-Message-State: AOAM533hudy10SrfvczRK4cxfyqYTo5BlkciAf9ELOKAjLaboHuwzic7
 4SqKB1056Bm7bVaQu/c5OyM=
X-Google-Smtp-Source: ABdhPJwRVVa9oTHFz53Gep6kufj7aL7kFTxC9FLC9t+X6tOc6fXoy+b82cv+AC/Z1BhRkxvbjIG1Og==
X-Received: by 2002:a17:907:94ce:: with SMTP id
 dn14mr12944760ejc.351.1596391388538; 
 Sun, 02 Aug 2020 11:03:08 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id x1sm13599477ejc.119.2020.08.02.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:03:07 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:03:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200802180304.GC86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 17/17] memblock: use separate iterators
 for memory and reserved regions
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
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IGZvcl9lYWNoX21lbWJsb2NrKCkgaXMg
dXNlZCB0byBpdGVyYXRlIG92ZXIgbWVtYmxvY2subWVtb3J5IGluCj4gYSBmZXcgcGxhY2VzIHRo
YXQgdXNlIGRhdGEgZnJvbSBtZW1ibG9ja19yZWdpb24gcmF0aGVyIHRoYW4gdGhlIG1lbW9yeQo+
IHJhbmdlcy4KPiAKPiBJbnRyb2R1Y2Ugc2VwYXJhdGUgZm9yX2VhY2hfbWVtX3JlZ2lvbigpIGFu
ZCBmb3JfZWFjaF9yZXNlcnZlZF9tZW1fcmVnaW9uKCkKPiB0byBpbXByb3ZlIGVuY2Fwc3VsYXRp
b24gb2YgbWVtYmxvY2sgaW50ZXJuYWxzIGZyb20gaXRzIHVzZXJzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiAtLS0KPiAgLmNsYW5nLWZv
cm1hdCAgICAgICAgICAgICAgICAgIHwgIDMgKystCj4gIGFyY2gvYXJtNjQva2VybmVsL3NldHVw
LmMgICAgICB8ICAyICstCj4gIGFyY2gvYXJtNjQvbW0vbnVtYS5jICAgICAgICAgICB8ICAyICst
Cj4gIGFyY2gvbWlwcy9uZXRsb2dpYy94bHAvc2V0dXAuYyB8ICAyICstCj4gIGFyY2gveDg2L21t
L251bWEuYyAgICAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaCAg
ICAgICB8IDE5ICsrKysrKysrKysrKysrKystLS0KPiAgbW0vbWVtYmxvY2suYyAgICAgICAgICAg
ICAgICAgIHwgIDQgKystLQo+ICBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgICAgfCAgOCAr
KysrLS0tLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKVGhlIHg4NiBwYXJ0OgoKQWNrZWQtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwu
b3JnPgoKVGhhbmtzLAoKCUluZ28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
