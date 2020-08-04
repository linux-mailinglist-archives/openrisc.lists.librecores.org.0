Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 57B9B2460DC
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D4AB020EB3;
	Mon, 17 Aug 2020 10:46:45 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id B959920D87
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 15:53:22 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id 189so4617102pfd.9
 for <openrisc@lists.librecores.org>; Tue, 04 Aug 2020 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nig2/fJdYyt3b0Q5A/SU+0msFseeyybXCaAI4dDRdTg=;
 b=jumdjySCSXZVJzizm9OUzoU9OXCS+Cfq57D4M9+nOmcjFx/ImlUYxx8bn1JnW+143W
 B6tMiLN9WKIVbxAyKxyw81HdIULr1/GZN+VKaYR0TvHVg/4jcAFDj42GWXCA2Swm1Yfw
 5v27iYJTlRgBYWmLp+/HqtnWpSjejedeiZ1fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nig2/fJdYyt3b0Q5A/SU+0msFseeyybXCaAI4dDRdTg=;
 b=i9X0VGmmRMph7Pdlp/UXkfmVDd1EN3MCLOu7WUyQcg4pQesFjUK5b3TpD1j5U1RYyu
 gAH+0sz2dm5DIGpAo0g/WofFybyFOYFA+ChuNOojKbmYaJ2FMVP8sNLoNOE/O3YIciNq
 VP6T+E86ie7gRklVO1fjEWJc9EFATi8ubs3EHrJdULBM4FaErIi/agG4obPQSfsHj+sq
 8ahymSMmY4SxfbquCh613mUZw3ix0fz5UJaPbNbX3vGn6CXZLp870i58CGHyEdrCRG9R
 /jmrrXDWPE1goBaBXH3YdwHs1u5Mud9/RsDzKcQsD0hopMWygTWUKzoyib5tcgOibSmz
 xoUQ==
X-Gm-Message-State: AOAM5316r078SLwpFjlp7bhITCYFny8GrSVIBzGpMRIwZJGm/Fh2WdOG
 GWKRTctnQIn3UxKlh8gG9XCLHw==
X-Google-Smtp-Source: ABdhPJzULAmNSkaX32weXl1O34te5NSuX9EJVhPlxbPjsXptEZqiJedi5i9MSO/avpj2cLsHaUiFtw==
X-Received: by 2002:a63:3587:: with SMTP id
 c129mr20025647pga.322.1596549199803; 
 Tue, 04 Aug 2020 06:53:19 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-0414-2e33-60ed-75ec.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:414:2e33:60ed:75ec])
 by smtp.gmail.com with ESMTPSA id g8sm9981404pfo.132.2020.08.04.06.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 06:53:19 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20200802163601.8189-2-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-2-rppt@kernel.org>
Date: Tue, 04 Aug 2020 23:53:15 +1000
Message-ID: <87tuxio6us.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 01/17] KVM: PPC: Book3S HV: simplify
 kvm_cma_reserve()
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
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTWlrZSwKCj4KPiBUaGUgbWVtb3J5IHNpemUgY2FsY3VsYXRpb24gaW4ga3ZtX2NtYV9yZXNl
cnZlKCkgdHJhdmVyc2VzIG1lbWJsb2NrLm1lbW9yeQo+IHJhdGhlciB0aGFuIHNpbXBseSBjYWxs
IG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKS4gVGhlIGNvbW1lbnQgaW4gdGhhdAo+IGZ1bmN0aW9u
IHN1Z2dlc3RzIHRoYXQgYXQgc29tZSBwb2ludCB0aGVyZSBzaG91bGQgaGF2ZSBiZWVuIGNhbGwg
dG8KPiBtZW1ibG9ja19hbmFseXplKCkgYmVmb3JlIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKSBj
b3VsZCBiZSB1c2VkLgo+IEFzIG9mIG5vdywgdGhlcmUgaXMgbm8gbWVtYmxvY2tfYW5hbHl6ZSgp
IGF0IGFsbCBhbmQKPiBtZW1ibG9ja19waHlzX21lbV9zaXplKCkgY2FuIGJlIHVzZWQgYXMgc29v
biBhcyBjb2xkLXBsdWcgbWVtb3J5IGlzCj4gcmVnaXN0ZXJkIHdpdGggbWVtYmxvY2suCj4KPiBS
ZXBsYWNlIGxvb3Agb3ZlciBtZW1ibG9jay5tZW1vcnkgd2l0aCBhIGNhbGwgdG8gbWVtYmxvY2tf
cGh5c19tZW1fc2l6ZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBs
aW51eC5pYm0uY29tPgo+IC0tLQo+ICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9idWlsdGlu
LmMgfCAxMSArKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2
X2J1aWx0aW4uYyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X2J1aWx0aW4uYwo+IGluZGV4
IDdjZDNjZjNkMzY2Yi4uNTZhYjBkMjhkZTJhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9r
dm0vYm9vazNzX2h2X2J1aWx0aW4uYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2
X2J1aWx0aW4uYwo+IEBAIC05NSwyMiArOTUsMTUgQEAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX2Zy
ZWVfaHB0X2NtYSk7Cj4gIHZvaWQgX19pbml0IGt2bV9jbWFfcmVzZXJ2ZSh2b2lkKQo+ICB7Cj4g
IAl1bnNpZ25lZCBsb25nIGFsaWduX3NpemU7Cj4gLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpy
ZWc7Cj4gLQlwaHlzX2FkZHJfdCBzZWxlY3RlZF9zaXplID0gMDsKPiArCXBoeXNfYWRkcl90IHNl
bGVjdGVkX3NpemU7Cj4gIAo+ICAJLyoKPiAgCSAqIFdlIG5lZWQgQ01BIHJlc2VydmF0aW9uIG9u
bHkgd2hlbiB3ZSBhcmUgaW4gSFYgbW9kZQo+ICAJICovCj4gIAlpZiAoIWNwdV9oYXNfZmVhdHVy
ZShDUFVfRlRSX0hWTU9ERSkpCj4gIAkJcmV0dXJuOwo+IC0JLyoKPiAtCSAqIFdlIGNhbm5vdCB1
c2UgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpIGhlcmUsIGJlY2F1c2UKPiAtCSAqIG1lbWJsb2Nr
X2FuYWx5emUoKSBoYXMgbm90IGJlZW4gY2FsbGVkIHlldC4KPiAtCSAqLwo+IC0JZm9yX2VhY2hf
bWVtYmxvY2sobWVtb3J5LCByZWcpCj4gLQkJc2VsZWN0ZWRfc2l6ZSArPSBtZW1ibG9ja19yZWdp
b25fbWVtb3J5X2VuZF9wZm4ocmVnKSAtCj4gLQkJCQkgbWVtYmxvY2tfcmVnaW9uX21lbW9yeV9i
YXNlX3BmbihyZWcpOwo+ICAKPiArCXNlbGVjdGVkX3NpemUgPSBQSFlTX1BGTihtZW1ibG9ja19w
aHlzX21lbV9zaXplKCkpOwo+ICAJc2VsZWN0ZWRfc2l6ZSA9IChzZWxlY3RlZF9zaXplICoga3Zt
X2NtYV9yZXN2X3JhdGlvIC8gMTAwKSA8PCBQQUdFX1NISUZUOwoKSSB0aGluayB0aGlzIGlzIGNv
cnJlY3QsIGJ1dCBQSFlTX1BGTiBkb2VzIHggPj4gUEFHRV9TSElGVCBhbmQgdGhlbiB0aGUKbmV4
dCBsaW5lIGRvZXMgeCA8PCBQQUdFX1NISUZULCBzbyBJIHRoaW5rIHdlIGNvdWxkIGNvbWJpbmUg
dGhvc2UgdHdvCmxpbmVzIGFzOgoKc2VsZWN0ZWRfc2l6ZSA9IFBBR0VfQUxJR04obWVtYmxvY2tf
cGh5c19tZW1fc2l6ZSgpICoga3ZtX2NtYV9yZXN2X3JhdGlvIC8gMTAwKTsKCihJIHRoaW5rIHRo
YXQgbWlnaHQgdGVjaG5pY2FsbHkgY2hhbmdlIGl0IGZyb20gYWxpZ25pbmcgZG93biB0byBhbGln
bmluZwp1cCBidXQgSSBkb24ndCB0aGluayAxIHBhZ2UgbWF0dGVycyBoZXJlLikKCktpbmQgcmVn
YXJkcywKRGFuaWVsCgoKPiAgCWlmIChzZWxlY3RlZF9zaXplKSB7Cj4gIAkJcHJfZGVidWcoIiVz
OiByZXNlcnZpbmcgJWxkIE1pQiBmb3IgZ2xvYmFsIGFyZWFcbiIsIF9fZnVuY19fLAo+IC0tIAo+
IDIuMjYuMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
