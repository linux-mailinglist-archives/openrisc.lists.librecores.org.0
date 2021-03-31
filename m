Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E000934FD32
	for <lists+openrisc@lfdr.de>; Wed, 31 Mar 2021 11:42:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 506B42074A;
	Wed, 31 Mar 2021 11:42:03 +0200 (CEST)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 5F8E22074A
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 11:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g5jil2A5p1wkLzsVeTmgtclSOGELktvkEXEKlZIjYVg=; b=XiJ+OxK9qQFp9pb3iCkwBlOXp
 SMJ3LhDQZ76ImMGs1+23oQ/WioU0hWz9YYebFqQSGNvQ9UoNd6HpZZO1Sjlw6ufxhQGjsXhlyq1yL
 Rg135ndoOTaxrliAkRSdtcBfX2vfDfUyJu5lpt9Qx1ISZiGbjOFZL9lbJbIgPizvs5nTWoRI4FLnx
 IITtjbSu3y+aMQU0qpykWL/nQFeQEL15bN2ggOwffKUuT89Wrfg/HzYa88LdxJKrx3C6YUip0LQa6
 pzMLGWk3w8Fc3V7dXGDMahXGdpM/gmApUuTa+Zg5+b0cW019JI5maq8g7N3s6BN2W+w/Or1ItM82H
 Rqn3lcuqg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51970)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lRXFB-0001b6-Rl; Wed, 31 Mar 2021 10:34:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lRXF0-0003oo-SH; Wed, 31 Mar 2021 10:34:22 +0100
Date: Wed, 31 Mar 2021 10:34:22 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <20210331093422.GU1463@shell.armlinux.org.uk>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 31 Mar 2021 11:42:00 +0200
Subject: Re: [OpenRISC] [PATCH v2] mm: Move mem_init_print_info() into
 mm_init()
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMTcsIDIwMjEgYXQgMDk6NTI6MTBBTSArMDgwMCwgS2VmZW5nIFdhbmcgd3Jv
dGU6Cj4gbWVtX2luaXRfcHJpbnRfaW5mbygpIGlzIGNhbGxlZCBpbiBtZW1faW5pdCgpIG9uIGVh
Y2ggYXJjaGl0ZWN0dXJlLAo+IGFuZCBwYXNzIE5VTEwgYXJndW1lbnQsIHNvIHVzaW5nIHZvaWQg
YXJndW1lbnQgYW5kIG1vdmUgaXQgaW50byBtbV9pbml0KCkuCj4gCj4gQWNrZWQtYnk6IERhdmUg
SGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2Vm
ZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKQWNrZWQtYnk6IFJ1c3NlbGwg
S2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+ICMgZm9yIGFybSBiaXRzCi0tIApSTUsn
cyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0
Y2hlcy8KRlRUUCBpcyBoZXJlISA0ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0
aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
