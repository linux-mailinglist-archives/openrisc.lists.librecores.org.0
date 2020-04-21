Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1E28A1C05D0
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0AD9D20B13;
	Thu, 30 Apr 2020 21:09:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C6B9C2017F
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 10:40:11 +0200 (CEST)
Received: from kernel.org (unknown [87.71.41.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87BFF2084D;
 Tue, 21 Apr 2020 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587458410;
 bh=l7Z4NyqL5od1jbAA7ZDTEBBIO7g4fvfTfMGTzVGUi6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zQogE0EBDyWoltfVVcsUWpEc71vAasrtxi/6gSs/avZ4WYft7fCfj1uyPSS2qCFhm
 qXfoaNsKzKhrsS0tm3OJ+UX6E74IIe+p+MaHcBd5yW/yIMKMZQvraj6agwXvN9OW+h
 LGBiCxPTiVUrhobVpOJ55kgsc8GtUkESKuo6vg10=
Date: Tue, 21 Apr 2020 11:39:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Message-ID: <20200421083946.GA14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-3-rppt@kernel.org>
 <20200421033114.GA29658@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421033114.GA29658@MiWiFi-R3L-srv>
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 02/21] mm: make early_pfn_to_nid() and
 related defintions close to each other
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBBcHIgMjEsIDIwMjAgYXQgMTE6MzE6MTRBTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNC8xMi8yMCBhdCAxMDo0OHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBUaGUgZWFybHlf
cGZuX3RvX25pZCgpIGFuZCBpdCdzIGhlbHBlciBfX2Vhcmx5X3Bmbl90b19uaWQoKSBhcmUgc3By
ZWFkCj4gPiBhcm91bmQgaW5jbHVkZS9saW51eC9tbS5oLCBpbmNsdWRlL2xpbnV4L21tem9uZS5o
IGFuZCBtbS9wYWdlX2FsbG9jLmMuCj4gPiAKPiA+IERyb3AgdW51c2VkIHN0dWIgZm9yIF9fZWFy
bHlfcGZuX3RvX25pZCgpIGFuZCBtb3ZlIGl0cyBhY3R1YWwgZ2VuZXJpYwo+ID4gaW1wbGVtZW50
YXRpb24gY2xvc2UgdG8gaXRzIHVzZXJzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L21t
LmggICAgIHwgIDQgKystLQo+ID4gIGluY2x1ZGUvbGludXgvbW16b25lLmggfCAgOSAtLS0tLS0t
LQo+ID4gIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDM3IGRlbGV0aW9ucygtKQogCi4uLgoKPiA+ICBpbnQgX19tZW1pbml0IGVhcmx5X3Bmbl90
b19uaWQodW5zaWduZWQgbG9uZyBwZm4pCj4gPiAgewo+ID4gIAlzdGF0aWMgREVGSU5FX1NQSU5M
T0NLKGVhcmx5X3Bmbl9sb2NrKTsKPiA+IEBAIC02Mjk4LDMyICs2MzIzLDYgQEAgdm9pZCBfX21l
bWluaXQgaW5pdF9jdXJyZW50bHlfZW1wdHlfem9uZShzdHJ1Y3Qgem9uZSAqem9uZSwKPiA+ICAJ
em9uZS0+aW5pdGlhbGl6ZWQgPSAxOwo+ID4gIH0KPiA+ICAKPiA+IC0jaWZkZWYgQ09ORklHX0hB
VkVfTUVNQkxPQ0tfTk9ERV9NQVAKPiAKPiBIZXJlIGl0J3MgYXBwYXJlbnRseSByZW1vdmluZyBD
T05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUCB0b28gZWFybHksCj4gaXQgc2hvdWxkIGJlIGRv
bmUgaW4gcGF0Y2ggMywgYW5kIGl0cyAjZW5kIGlzIGtlcHQgdGhlcmUuIEkganVzdCBmb3VuZAo+
IGl0IHdoZW4gSSBhbG1vc3QgYmVjYW1lIGRpenp5IGluIHJldmlld2luZyBwYXRjaCAzLgoKUmln
aHQsIHRoYW5rcyBmb3IgY2F0Y2hpbmchCgo+ID4gLSNpZm5kZWYgQ09ORklHX0hBVkVfQVJDSF9F
QVJMWV9QRk5fVE9fTklECj4gPiAtCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
