Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD95246096
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AEA7920D56;
	Mon, 17 Aug 2020 10:45:40 +0200 (CEST)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by mail.librecores.org (Postfix) with ESMTPS id D5ED620CB3
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 12:44:44 +0200 (CEST)
Received: by mail-ed1-f68.google.com with SMTP id b13so12048514edz.7
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
 b=rFUcMCUj2AwdC69csGGjJVjr3K/8WS4HC4QuFwZtg451Qj4L37BpO16QBPnCSOnEqP
 0XLFh6CAcMNi+86g1xCyy/bqdVTYRHcM+S9kEIZb7EWJKKOmGB7fGMyBy9goHLKaJvij
 l3J//FegCgxfC20hSO+SeOOi0ojcNdANd874jllkW9bgWXdBSGjDZ+KKsJ5ItnWu5ElM
 TutsV7Y/UWKyR2rEXX1BEUlxaWMHKF0PMaSsOZWNK/0D0ZH9xxW9nIbDP8AygACtKk6q
 SuVbplxJKZehbky/ztC2U7bihOneNjqjj52Fn1yyk39lDMDQeAEZqoI3viUUxFXSv5vl
 9XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
 b=nqnRj7qQxEpDwxArHevAftpe8AbyCUD5leJOnEHnttQEo95lLPOHBZ4NSNFPt05TRX
 1ofurb+5gpioOP1vcVmj6gmcAGf7yEm7MOCRUMFoW39IoPUlxnDe2MSifN4wDLtj3AA/
 ihRf/ZWj63c02Hcfx5Nyk8j1snTtAQoKyvdIOIDZEp4Rp0ckeU67UBON3+PiarDtrGlU
 AMxyho5N59dh4TvLMpFWxW2iVQUZwpe3JSVlCR3Mj3+mlSciPbBhPz7b7FBEoMZ0/tVS
 JfYaNY4vRfgrqELLMF6589UHVsfurAactDtbAtRzzDT33qZ9z/jmaGAW9RjXPcLslG/1
 k2cg==
X-Gm-Message-State: AOAM533AmhKF+z1SKi29icdKROZ4suussA9d3jqQtSbUQOqQJoF4ePUo
 mF+PVMEqHqP+xKN/nJpGOuw=
X-Google-Smtp-Source: ABdhPJztizS2/FT37W5GVOnd6egL7RbIXP7ubjCB3LMqpraJ3F9fNNOV7TQhtwANWplTQvf13TbOQg==
X-Received: by 2002:aa7:dd15:: with SMTP id i21mr12013673edv.153.1595933084517; 
 Tue, 28 Jul 2020 03:44:44 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id cf10sm460841ejb.4.2020.07.28.03.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:44:43 -0700 (PDT)
Date: Tue, 28 Jul 2020 12:44:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200728104440.GA222284@gmail.com>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-15-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 14/15] x86/numa: remove redundant iteration
 over memblock.reserved
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CiogTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogTWlrZSBS
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IG51bWFfY2xlYXJfa2VybmVsX25vZGVf
aG90cGx1ZygpIGZ1bmN0aW9uIGZpcnN0IHRyYXZlcnNlcyBudW1hX21lbWluZm8KPiByZWdpb25z
IHRvIHNldCBub2RlIElEIGluIG1lbWJsb2NrLnJlc2VydmVkIGFuZCB0aGFuIHRyYXZlcnNlcwo+
IG1lbWJsb2NrLnJlc2VydmVkIHRvIHVwZGF0ZSByZXNlcnZlZF9ub2RlbWFzayB0byBpbmNsdWRl
IG5vZGUgSURzIHRoYXQgd2VyZQo+IHNldCBpbiB0aGUgZmlyc3QgbG9vcC4KPiAKPiBSZW1vdmUg
cmVkdW5kYW50IHRyYXZlcnNhbCBvdmVyIG1lbWJsb2NrLnJlc2VydmVkIGFuZCB1cGRhdGUKPiBy
ZXNlcnZlZF9ub2RlbWFzayB3aGlsZSBpdGVyYXRpbmcgb3ZlciBudW1hX21lbWluZm8uCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0tLQo+
ICBhcmNoL3g4Ni9tbS9udW1hLmMgfCAyNiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpJIHN1c3Bl
Y3QgeW91J2QgbGlrZSB0byBjYXJyeSB0aGlzIGluIHRoZSAtbW0gdHJlZT8KCkFja2VkLWJ5OiBJ
bmdvIE1vbG5hciA8bWluZ29Aa2VybmVsLm9yZz4KClRoYW5rcywKCglJbmdvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
