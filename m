Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 202D02460C1
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D4F5C20AB2;
	Mon, 17 Aug 2020 10:46:26 +0200 (CEST)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id 7EF5220B06
 for <openrisc@lists.librecores.org>; Wed, 29 Jul 2020 13:42:03 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id d4so14112946pgk.4
 for <openrisc@lists.librecores.org>; Wed, 29 Jul 2020 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FyoxCr0A58f1XavZrIV1VkDI4AyZt3GTW0GxGRW15PU=;
 b=ErgMzYX2rlBnfYHmvHv9Kb0jAk9sTy/cgwUC91LEM8hW88sSiXCtCju4DtSraYOdN6
 Iz7cbIFHeP/OokbCsIndQn1W0/LL6legP5rUG8YuTLcO1oJBa0Q3JVGulGwjco0UElqI
 VvU/wz6i9utUjGjHa4JZVJYJZv72u/uWssFs8dC69IKpZ4vHIedaLdUQ404Jx+JIDGcj
 xtC8Sy1W9N1QM1A5lPVwWKGR7s1VkCc/Z0Han0x8lhUlPGexDzIucGIkbsBs70Eg0SOc
 poCa7kET1lEBIE2/zAVCwyCXmjvm7W2acmjhWVo6kPWsms3mfhSxEZ1uLiCnzlFIY+r2
 7Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FyoxCr0A58f1XavZrIV1VkDI4AyZt3GTW0GxGRW15PU=;
 b=TWyYvrZVtK6iZf+jVL/nMgqsQiQ4RAXsTZaT3/v1H/wu99LdNvDbl5FEGibAkVdIb9
 6CYzFlaWaUFCsZOdUK7bijjeg3pvtFQJbiTyC7OJpdtNV8Vu/vgoWjKZ65OOTr1KI76I
 8JtN8nnL1WhV8jnNidGIl7M4ScNrECy/4znqqDaIQZUFuP4oo2/Tul976vtkpbWFVzCs
 mQxyGoh9DLlIh+f4abJI2w6Ql2B9w5V5Z0WoV3837mdTbNE0bbiyV3DsttKLFEaC3WVV
 EecQ5lhDkpNDmOS/3hB1f8MhRUFoISH4qVFJrAV9YEgyhmxpJnvl/JPRoHdUqjJ5Wg6t
 sZ2g==
X-Gm-Message-State: AOAM532ZJJHtPZDRGiLF7Q73OerrdsGIdGv8ahSrjrUNDWxNzu2CrHEm
 9QozYTAdfNeWSJ+lVM4OGT0=
X-Google-Smtp-Source: ABdhPJwp4puneP0dTsVKBe6dB1tdiT/38z6QwdAB9b3TkM+HxCNc29Y6zwoL2ht5YGJJkcQZn4i23Q==
X-Received: by 2002:a65:64c7:: with SMTP id t7mr27611626pgv.89.1596022921588; 
 Wed, 29 Jul 2020 04:42:01 -0700 (PDT)
Received: from localhost (g155.222-224-148.ppp.wakwak.ne.jp. [222.224.148.155])
 by smtp.gmail.com with ESMTPSA id y18sm2097780pff.10.2020.07.29.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:42:00 -0700 (PDT)
Date: Wed, 29 Jul 2020 20:41:57 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200729114157.GF80756@lianli.shorne-pla.net>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-6-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 05/15] h8300, nds32,
 openrisc: simplify detection of memory extents
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
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDg6MTE6NDNBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gSW5z
dGVhZCBvZiB0cmF2ZXJzaW5nIG1lbWJsb2NrLm1lbW9yeSByZWdpb25zIHRvIGZpbmQgbWVtb3J5
X3N0YXJ0IGFuZAo+IG1lbW9yeV9lbmQsIHNpbXBseSBxdWVyeSBtZW1ibG9ja197c3RhcnQsZW5k
fV9vZl9EUkFNKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPgo+IC0tLQo+ICBhcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5jICAgIHwgOCArKyst
LS0tLQo+ICBhcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jICAgIHwgOCArKy0tLS0tLQo+ICBhcmNo
L29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIHwgOSArKy0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKSGkgTWlrZSwKCkZvciB0aGUgb3Bl
bnJpc2MgcGFydDoKCkFja2VkLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4K
Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmMKPiBAQCAtNDgsMTcgKzQ4LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBzZXR1cF9tZW1vcnkodm9pZCkKPiAgCXVuc2lnbmVkIGxvbmcgcmFtX3N0YXJ0X3BmbjsKPiAg
CXVuc2lnbmVkIGxvbmcgcmFtX2VuZF9wZm47Cj4gIAlwaHlzX2FkZHJfdCBtZW1vcnlfc3RhcnQs
IG1lbW9yeV9lbmQ7Cj4gLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWdpb247Cj4gIAo+ICAJ
bWVtb3J5X2VuZCA9IG1lbW9yeV9zdGFydCA9IDA7Cj4gIAo+ICAJLyogRmluZCBtYWluIG1lbW9y
eSB3aGVyZSBpcyB0aGUga2VybmVsLCB3ZSBhc3N1bWUgaXRzIHRoZSBvbmx5IG9uZSAqLwo+IC0J
Zm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWdpb24pIHsKPiAtCQltZW1vcnlfc3RhcnQgPSBy
ZWdpb24tPmJhc2U7Cj4gLQkJbWVtb3J5X2VuZCA9IHJlZ2lvbi0+YmFzZSArIHJlZ2lvbi0+c2l6
ZTsKPiAtCQlwcmludGsoS0VSTl9JTkZPICIlczogTWVtb3J5OiAweCV4LTB4JXhcbiIsIF9fZnVu
Y19fLAo+IC0JCSAgICAgICBtZW1vcnlfc3RhcnQsIG1lbW9yeV9lbmQpOwo+IC0JfQo+ICsJbWVt
b3J5X3N0YXJ0ID0gbWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgpOwo+ICsJbWVtb3J5X2VuZCA9IG1l
bWJsb2NrX2VuZF9vZl9EUkFNKCk7Cj4gIAo+ICAJaWYgKCFtZW1vcnlfZW5kKSB7Cj4gIAkJcGFu
aWMoIk5vIG1lbW9yeSEiKTsKPiAtLSAKPiAyLjI2LjIKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
