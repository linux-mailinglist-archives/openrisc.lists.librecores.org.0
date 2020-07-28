Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DA993246098
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4A0F020D5C;
	Mon, 17 Aug 2020 10:45:41 +0200 (CEST)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by mail.librecores.org (Postfix) with ESMTPS id 650F2207E4
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 13:31:30 +0200 (CEST)
Received: by mail-ej1-f68.google.com with SMTP id kq25so7337186ejb.3
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y5PIG9gv3+Q65q73c5WJL/D8ixTHr55LzcpS0la2b94=;
 b=P7HSEqdJclVd5Bnzob/XF2RdTn0Nmb3HUJySlROmL68osljlcfCEFlV3HJYGTsfk+b
 VHrJ1f+xMExFZ+YSvv8Rmeh1N5GaQQ3p6pZuSDQBx0nbSt1s4XPLJfYIDrJpBvMTIQ3T
 tnPlkWxuMjJu8J60O/OlnbAruEsKB2973ivyYANGexg1cYLi5G1vwz7DY7w0Hk/PvarE
 qINCzPe5al7+9kODm2QQrbeaDo+Ef9vruELr0bSlzbcnvJrfytMgRRiJ5yKDr3S0B9bh
 pUq4JqHBAw9f6ZNp7JiPY7EX8klIc+e+asMdZK9Yz7BoN21wjEsZd5KQdrrR+TAABie5
 JrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=y5PIG9gv3+Q65q73c5WJL/D8ixTHr55LzcpS0la2b94=;
 b=pvJlcepR14JlQXqeGBCyfxcoQllzXixm00kFQv+xFBzY4+ZeqTAZDIxywftaqe+54z
 fN6fW3TI56iYI5fsl89hCDl+83sgAmt6sLbyvcBfvY7Se44MqSTG3NjlDkC2p++HWa36
 02Giq7E/QhlVCJWjWRwBQmlT3V+sqvDx5c/H0HV5pI39zsZZwOeGNXU11aOjiwRlb9tY
 u/tOuLT2I/Iv4h57xkScXl/MDAHSZXgNH6oq5WZzIvOiQPB/Nc8Sni8UYO/USpp16zRe
 H02QYietBMi1iQJqF7m513tRaIg+hA1jTXZpvNOpuH27XKG94PpkiwDBmCiNUr9ozLYw
 wIFA==
X-Gm-Message-State: AOAM532zBderEtlwU1OtiJPkVsIMrkYAexLPrOqzkitTwX2df/mdcQ35
 PF6RN7cfomvHLqz1FNLKEDg=
X-Google-Smtp-Source: ABdhPJyQbAVtd7rvh28AKuUuAlpNq5u8pcARe+eVx7W3hTuAzpqofzarCSjsJ0a8Qe+YPenFOSGRUQ==
X-Received: by 2002:a17:906:22c1:: with SMTP id
 q1mr16036266eja.443.1595935889994; 
 Tue, 28 Jul 2020 04:31:29 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id qw19sm7634705ejb.46.2020.07.28.04.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:31:29 -0700 (PDT)
Date: Tue, 28 Jul 2020 13:31:26 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200728113126.GB233444@gmail.com>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728104440.GA222284@gmail.com>
 <20200728105602.GB3655207@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728105602.GB3655207@kernel.org>
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

CiogTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKCj4gT24gVHVlLCBKdWwg
MjgsIDIwMjAgYXQgMTI6NDQ6NDBQTSArMDIwMCwgSW5nbyBNb2xuYXIgd3JvdGU6Cj4gPiAKPiA+
ICogTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gPiBGcm9t
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPiA+IAo+ID4gPiBudW1hX2Ns
ZWFyX2tlcm5lbF9ub2RlX2hvdHBsdWcoKSBmdW5jdGlvbiBmaXJzdCB0cmF2ZXJzZXMgbnVtYV9t
ZW1pbmZvCj4gPiA+IHJlZ2lvbnMgdG8gc2V0IG5vZGUgSUQgaW4gbWVtYmxvY2sucmVzZXJ2ZWQg
YW5kIHRoYW4gdHJhdmVyc2VzCj4gPiA+IG1lbWJsb2NrLnJlc2VydmVkIHRvIHVwZGF0ZSByZXNl
cnZlZF9ub2RlbWFzayB0byBpbmNsdWRlIG5vZGUgSURzIHRoYXQgd2VyZQo+ID4gPiBzZXQgaW4g
dGhlIGZpcnN0IGxvb3AuCj4gPiA+IAo+ID4gPiBSZW1vdmUgcmVkdW5kYW50IHRyYXZlcnNhbCBv
dmVyIG1lbWJsb2NrLnJlc2VydmVkIGFuZCB1cGRhdGUKPiA+ID4gcmVzZXJ2ZWRfbm9kZW1hc2sg
d2hpbGUgaXRlcmF0aW5nIG92ZXIgbnVtYV9tZW1pbmZvLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGFyY2gveDg2L21tL251bWEuYyB8IDI2ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IEkgc3VzcGVjdCB5b3UnZCBsaWtlIHRvIGNhcnJ5IHRoaXMgaW4gdGhlIC1tbSB0cmVlPwo+
IAo+IFllcy4KPiAgCj4gPiBBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+
Cj4gCj4gVGhhbmtzIQoKQXNzdW1pbmcgaXQgaXMgY29ycmVjdCBhbmQgd29ya3MuIDotKQoKVGhh
bmtzLAoKCUluZ28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
