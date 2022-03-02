Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C3DA14CA35E
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 12:19:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8D94224852;
	Wed,  2 Mar 2022 12:19:39 +0100 (CET)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 8182420A95
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 12:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1/BTw8u15H3AVnQDepPulkDIkTQG/EDO8JslQ2y518=; b=yzUOmQTC9SehCgZYgd4h+Ey12C
 IF3SwMxqhKSw9mftTnudCgM/6vhgVjqN1K54lqRScHZdWomhMSw8gc4Q17z82/t4ePZPTadPDNBW0
 RAYoi7RTG5lEPYnuj/W83EiMnjCPrblb+04/X34ls5AXk4/1qSt0tzJPYiQCOWZ8wtXGi6o/0W54C
 JYouMTieLlNBty6aTd82+iHFYVBl998jCqSMezXTJKHViIkOZV4L90kAOBr7Bjp+j1Cc20Fo3g2xF
 ZHXM5LboaCYqutYgpLpdk+j1UVvj2hjc2fYOc6snFpF3IOhlr7vydYbVzzsl941esiWGhbWsi5Amp
 qfJLh3Qg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57592)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nPN0v-0002K5-5r; Wed, 02 Mar 2022 11:19:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nPN0s-00085f-7p; Wed, 02 Mar 2022 11:19:22 +0000
Date: Wed, 2 Mar 2022 11:19:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <Yh9SuiayqcDdIB3B@shell.armlinux.org.uk>
References: <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
 <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
 <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
 <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
Subject: Re: [OpenRISC] [PATCH V3 09/30] arm/mm: Enable
 ARCH_HAS_VM_GET_PAGE_PROT
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMDIsIDIwMjIgYXQgMDQ6MzY6NTJQTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cj4gT24gMy8yLzIyIDM6MzUgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
PiA+IEkgZG91YnQgdGhlIHN3aXRjaCgpIHZhcmlhbnQgd291bGQgZ2l2ZSBiZXR0ZXIgY29kZSBv
biBhbnkgcGxhdGZvcm0uCj4gPiAKPiA+IFdoYXQgYWJvdXQgdXNpbmcgdGFibGVzIGV2ZXJ5d2hl
cmUsIHVzaW5nIGRlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJzCj4gPiB0byBpbXByb3ZlIHJlYWRhYmls
aXR5Pwo+IAo+IERlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJzID8gQ291bGQgeW91IHBsZWFzZSBiZSBt
b3JlIHNwZWNpZmljLiBBIHRhYmxlIGxvb2sKPiB1cCBvbiBhcm0gcGxhdGZvcm0gd291bGQgYmUg
c29tZXRoaW5nIGxpa2UgdGhpcyBhbmQgYXJtX3Byb3RlY3Rpb25fbWFwW10KPiBuZWVkcyB0byBi
ZSB1cGRhdGVkIHdpdGggdXNlcl9wZ3Byb3QgbGlrZSBiZWZvcmUuCgpUaGVyZSBpcyAqYWJzb2x1
dGVseSogbm90aGluZyB3cm9uZyB3aXRoIHRoYXQuIFVwZGF0aW5nIGl0IG9uY2UgZHVyaW5nCmJv
b3QgaXMgd2F5IG1vcmUgZWZmaWNpZW50IHRoYW4gaGF2aW5nIHRvIGNvbXB1dGUgdGhlIHZhbHVl
IGVhY2ggdGltZQp2bV9nZXRfcGFnZV9wcm90KCkgZ2V0cyBjYWxsZWQuCgpUaGFua3MuCgotLSAK
Uk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVy
L3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgNDBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29u
bmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
