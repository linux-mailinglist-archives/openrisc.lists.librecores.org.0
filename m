Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 27BCB1E504D
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CA4D820CCA;
	Wed, 27 May 2020 23:19:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C3CC820A63
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 23:12:17 +0200 (CEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 658E2205CB;
 Fri, 15 May 2020 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589577135;
 bh=UmRPGOLdKmuTI3Qv0jzWmP0JQ6FJlc6TDky71yMCXsw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nxT0Ssf9yY8pLVLUEFt5SAsZlyL5o6RvbYcpe/Ogb/hZ+Ibv3VYpsIHopMwIvk69A
 +v0QRtIwEwpLk0FCwhPrY/meT71ffNnp97a68i1ipAlCz7NidwUH9DVZrUpfKzkMPS
 TuSlq3nyhe5fsuqvT1isjduKVkMQeXc1Kt6J9V7M=
Date: Fri, 15 May 2020 14:12:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Message-Id: <20200515141211.653db07a4e7142107a57cf24@linux-foundation.org>
In-Reply-To: <20200514170327.31389-1-rppt@kernel.org>
References: <20200514170327.31389-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:59 +0200
Subject: Re: [OpenRISC] [PATCH v2 00/12] mm: consolidate definitions of page
 table accessors
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
Cc: linux-m68k@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-csky@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCAxNCBNYXkgMjAyMCAyMDowMzoxNSArMDMwMCBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBUaGUgbG93IGxldmVsIHBhZ2UgdGFibGUgYWNjZXNzb3JzIChw
WFlfaW5kZXgoKSwgcFhZX29mZnNldCgpKSBhcmUKPiBkdXBsaWNhdGVkIGFjcm9zcyBhbGwgYXJj
aGl0ZWN0dXJlcyBhbmQgc29tZXRpbWVzIG1vcmUgdGhhbiBvbmNlLiBGb3IKPiBpbnN0YW5jZSwg
d2UgaGF2ZSAzMSBkZWZpbml0aW9uIG9mIHBnZF9vZmZzZXQoKSBmb3IgMjUgc3VwcG9ydGVkCj4g
YXJjaGl0ZWN0dXJlcy4KPiAKPiBNb3N0IG9mIHRoZXNlIGRlZmluaXRpb25zIGFyZSBhY3R1YWxs
eSBpZGVudGljYWwgYW5kIHR5cGljYWxseSBpdCBib2lscwo+IGRvd24gdG8sIGUuZy4gCj4gCj4g
c3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHBtZF9pbmRleCh1bnNpZ25lZCBsb25nIGFkZHJl
c3MpCj4gewo+ICAgICAgICAgcmV0dXJuIChhZGRyZXNzID4+IFBNRF9TSElGVCkgJiAoUFRSU19Q
RVJfUE1EIC0gMSk7Cj4gfQo+IAo+IHN0YXRpYyBpbmxpbmUgcG1kX3QgKnBtZF9vZmZzZXQocHVk
X3QgKnB1ZCwgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQo+IHsKPiAgICAgICAgIHJldHVybiAocG1k
X3QgKilwdWRfcGFnZV92YWRkcigqcHVkKSArIHBtZF9pbmRleChhZGRyZXNzKTsKPiB9Cj4gCj4g
VGhlc2UgZGVmaW5pdGlvbnMgY2FuIGJlIHNoYXJlZCBhbW9uZyA5MCUgb2YgdGhlIGFyY2hlcyBw
cm92aWRlZCBYWVpfU0hJRlQsCj4gUFRSU19QRVJfWFlaIGFuZCB4eXpfcGFnZV92YWRkcigpIGFy
ZSBkZWZpbmVkLgo+IAo+IEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgcmVhbGx5IG5lZWQgYSBjdXN0
b20gdmVyc2lvbiB0aGVyZSBpcyBhbHdheXMKPiBwb3NzaWJpbGl0eSB0byBvdmVycmlkZSB0aGUg
Z2VuZXJpYyB2ZXJzaW9uIHdpdGggdGhlIHVzdWFsIGlmZGVmcyBtYWdpYy4KPiAKPiBUaGVzZSBw
YXRjaGVzIGludHJvZHVjZSBpbmNsdWRlL2xpbnV4L3BndGFibGUuaCB0aGF0IHJlcGxhY2VzCj4g
aW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLmggYW5kIGFkZCB0aGUgZGVmaW5pdGlvbnMgb2Yg
dGhlIHBhZ2UgdGFibGUKPiBhY2Nlc3NvcnMgdG8gdGhlIG5ldyBoZWFkZXIuCgpobSwKCj4gIDcx
MiBmaWxlcyBjaGFuZ2VkLCA2ODQgaW5zZXJ0aW9ucygrKSwgMjAyMSBkZWxldGlvbnMoLSkKCmJp
ZyEKClRoZXJlJ3MgYSBsb3Qgb2Ygc3R1ZmYgZ29pbmcgb24gYXQgcHJlc2VudCAoSSBzdXNwZWN0
IGV2ZXJ5b25lIGlzCnNpdHRpbmcgYXQgaG9tZSBjb2RpbmcgdXAgYSBzdG9ybSkuICBIb3dldmVy
IHRoaXMgYWxsIG1lcmdlZCB1cCBmYWlybHkKY2xlYW5seSwgaGF2ZW4ndCB0cmllZCBjb21waWxp
bmcgaXQgeWV0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
