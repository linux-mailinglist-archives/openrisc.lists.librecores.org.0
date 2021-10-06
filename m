Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 547514248DF
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 23:25:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EDCF4241CA;
	Wed,  6 Oct 2021 23:25:15 +0200 (CEST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mail.librecores.org (Postfix) with ESMTPS id C34A1240A4
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 23:25:13 +0200 (CEST)
Received: by mail-pg1-f176.google.com with SMTP id m21so3600950pgu.13
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 14:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e64UMCL2WVnOr2UI7AUcgF8cpI0jeUTyJjvzOQZ8YrE=;
 b=UBSXKYjm15FEKybh0KfefqRjd/fVs22AWYzwe2iCJvmOHscvoAutQW2HwE99YHZeWu
 vEtNDuMS9d78IGfnBrQ47YiMpXMPPhe6dbQyF9hg/uSAQDApFpiVmZ7RCXYk//sWXr1Q
 0LSfp/P7/3d3pFfamzEH93p+y9SKpm/qjQxtZn4fAQUwleau5VdUB+9jn7Ku+OYnfnmC
 SnnK3Phc97T0RV6YdV7B/6OMV0qq1QjiJmwn6G9SBEM6VpE4qBOh3ESLF6KJAuPLSvNB
 EipYZeSbBljiqKzHr1N+foOdNe3WDWrdfrXbmYefd7v8ToBI7aLskwiFwDPpPQdD6I/S
 LWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e64UMCL2WVnOr2UI7AUcgF8cpI0jeUTyJjvzOQZ8YrE=;
 b=rAdLRIBU7Fef/hD/KVhGIbdq+VsAUnCvSJmw/ptWL5yzsE2pobD2JkovXDvWz7J5Zl
 +mijo76jR2dm5xrFLTCbUw4Dzc9HDpxTsgjgR+PQHvGP2RO/m9LLK3NyXKv5QXyCmfME
 crstpdRhv6k1e1/BPqwI+BTTGomoGoj43M3e5jBremsjj5CvB0aKzkYRcuyDEQQROp/0
 R0fbFAFzqnjziM1UAlxmVu6KUr6x+PXBLOGOkcHAqNbY5a38W9DgPuBSXv2WCWqj21m7
 AzewYSb2N64y25c2Du07lOEZ+vS2+eAgg+SbiMLhZJuqjlN23u0YUzVM0tAcI2QU/aXX
 PIjg==
X-Gm-Message-State: AOAM533Uh3M1TyATQiybKkyldUnZyUNFdiqbDfAh8MFAK3yzxPsf/YAv
 6o0nCA8p9tbUPVz9vBZvTqQ=
X-Google-Smtp-Source: ABdhPJyKapemGEMJ+oiRHHIk+xiUwqOqgxkK1126yB2yYflqm+sLMNs5knM5JE9Oh1WDASGMBmxR4Q==
X-Received: by 2002:aa7:92d0:0:b0:44c:ab24:cce7 with SMTP id
 k16-20020aa792d0000000b0044cab24cce7mr370069pfa.6.1633555512314; 
 Wed, 06 Oct 2021 14:25:12 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id i9sm18264104pfd.32.2021.10.06.14.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 14:25:11 -0700 (PDT)
Date: Thu, 7 Oct 2021 06:25:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <YV4UNQg3QROuTfQ/@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 SH-Linux <linux-sh@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, Openrisc <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMDYsIDIwMjEgYXQgMDQ6MDg6MzhQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBPY3QgNiwgMjAyMSBhdCAzOjQ0IFBNIFN0YWZmb3JkIEhvcm5lIDxzaG9y
bmVAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE9jdCAwNiwgMjAyMSBhdCAxMTo0
MzoyNkFNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gUmVwbGFjZSBvcGVuIGNvZGVk
IHBhcnNpbmcgb2YgQ1BVIG5vZGVzJyAncmVnJyBwcm9wZXJ0eSB3aXRoCj4gPiA+IG9mX2dldF9j
cHVfaHdpZCgpLgo+ID4gPgo+ID4gPiBDYzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNl
Pgo+ID4gPiBDYzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVu
YWxhaHRpLmZpPgo+ID4gPiBDYzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4g
PiA+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvb3Bl
bnJpc2Mva2VybmVsL3NtcC5jIHwgNiArLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
b3BlbnJpc2Mva2VybmVsL3NtcC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKPiA+ID4g
aW5kZXggNDE1ZTIwOTczMmEzLi43ZDVhNGYzMDNhNWEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gv
b3BlbnJpc2Mva2VybmVsL3NtcC5jCj4gPiA+ICsrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Nt
cC5jCj4gPiA+IEBAIC02NSwxMSArNjUsNyBAQCB2b2lkIF9faW5pdCBzbXBfaW5pdF9jcHVzKHZv
aWQpCj4gPiA+ICAgICAgIHUzMiBjcHVfaWQ7Cj4gPiA+Cj4gPiA+ICAgICAgIGZvcl9lYWNoX29m
X2NwdV9ub2RlKGNwdSkgewo+ID4gPiAtICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFk
X3UzMihjcHUsICJyZWciLCAmY3B1X2lkKSkgewo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
cHJfd2FybigiJXMgbWlzc2luZyByZWcgcHJvcGVydHkiLCBjcHUtPmZ1bGxfbmFtZSk7Cj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gLSAgICAgICAgICAgICB9Cj4g
PiA+IC0KPiA+ID4gKyAgICAgICAgICAgICBjcHVfaWQgPSBvZl9nZXRfY3B1X2h3aWQoY3B1KTsK
PiAKPiBPb3BzLCB0aGF0IHNob3VsZCBiZTogb2ZfZ2V0X2NwdV9od2lkKGNwdSwgMCk7CgpPSy4g
SSBjaGVja2VkIGFsbCBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMsIGl0IHNlZW1zIE9wZW5S
SVNDIHdhcyB0aGUgb25seQpvbmUgbWlzc2luZyB0aGF0LiAgU29ycnkgSSBtaXNzZWQgaXQgaW5p
dGlhbGx5LgoKPiBJIHRob3VnaHQgSSBkb3VibGUgY2hlY2tlZCBhbGwgdGhvc2UuLi4KPiAKPiA+
IFlvdSBoYXZlIGRlZmluZWQgb2ZfZ2V0X2NwdV9od2lkIHRvIHJldHVybiB1NjQsIHdpbGwgdGhp
cyBjcmVhdGUgY29tcGlsZXIKPiA+IHdhcm5pbmdzIHdoZW4gc2luY2Ugd2UgYXJlIHN0b3Jpbmcg
YSB1NjQgaW50byBhIHUzMj8KPiAKPiBJJ20gY291bnRpbmcgb24gdGhlIGNhbGxlciB0byBrbm93
IHRoZSBtYXggc2l6ZSBmb3IgdGhlaXIgcGxhdGZvcm0uCgpPSy4KCj4gPgo+ID4gSXQgc2VlbXMg
b25seSBpZiB3ZSBtYWtlIHdpdGggVz0zLgo+ID4KPiA+IEkgdGhvdWdodCB3ZSB1c3VhbGx5IHdh
cm5lZCBvbiB0aGlzLiAgT2ggd2VsbCwgZm9yIHRoZSBvcGVucmlzYyBiaXRzLgo+IAo+IFRoYXQn
cyBvbmx5IG9uIHB0ciB0cnVuY2F0aW9uIEkgdGhpbmsuCgpSaWdodCwgdGhhdCBtYWtlcyBzZW5z
ZS4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
