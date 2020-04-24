Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E14BF1C05D6
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9B71720B3C;
	Thu, 30 Apr 2020 21:09:26 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id D0F8120305
 for <openrisc@lists.librecores.org>; Fri, 24 Apr 2020 02:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587688451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n2dWJbdFmIc0aMZ8wHTt5vQhPaXxDdsL9ipp25mLNTI=;
 b=KdEgONvPhf2zQD4Q1oLX8Ely0LBgNy0lS2p8q13iySOytEW/mNJpWisq+dGCigKsbJy9Xt
 cxgpfTckjoV58f/Wxxz5HJj8SE5UfXksovh8zrsviVhbiqTiYbSQvG0GeK9XebBT6TMs0q
 CMoiN9EFU71/wJ078VeHCYoDXCnYtpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-PdLkUA6CP7mzy-z_Ga33bw-1; Thu, 23 Apr 2020 20:34:09 -0400
X-MC-Unique: PdLkUA6CP7mzy-z_Ga33bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 087DD800D24;
 Fri, 24 Apr 2020 00:34:03 +0000 (UTC)
Received: from localhost (ovpn-12-92.pek2.redhat.com [10.72.12.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFBF1C957;
 Fri, 24 Apr 2020 00:33:58 +0000 (UTC)
Date: Fri, 24 Apr 2020 08:33:56 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200424003356.GA10119@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-18-rppt@kernel.org>
 <20200423025311.GZ4247@MiWiFi-R3L-srv>
 <20200423025720.GA4247@MiWiFi-R3L-srv>
 <20200423055559.GF14260@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423055559.GF14260@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 17/21] mm: free_area_init: allow defining
 max_zone_pfn in descending order
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

T24gMDQvMjMvMjAgYXQgMDg6NTVhbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBPbiBUaHUsIEFw
ciAyMywgMjAyMCBhdCAxMDo1NzoyMEFNICswODAwLCBCYW9xdWFuIEhlIHdyb3RlOgo+ID4gT24g
MDQvMjMvMjAgYXQgMTA6NTNhbSwgQmFvcXVhbiBIZSB3cm90ZToKPiA+ID4gT24gMDQvMTIvMjAg
YXQgMTA6NDhwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gPiBGcm9tOiBNaWtlIFJhcG9w
b3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gU29tZSBhcmNoaXRlY3R1
cmVzIChlLmcuIEFSQykgaGF2ZSB0aGUgWk9ORV9ISUdITUVNIHpvbmUgYmVsb3cgdGhlCj4gPiA+
ID4gWk9ORV9OT1JNQUwuIEFsbG93aW5nIGZyZWVfYXJlYV9pbml0KCkgcGFyc2UgbWF4X3pvbmVf
cGZuIGFycmF5IGV2ZW4gaXQgaXMKPiA+ID4gPiBzb3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBh
bGxvd3MgdXNpbmcgZnJlZV9hcmVhX2luaXQoKSBvbiBzdWNoCj4gPiA+ID4gYXJjaGl0ZWN0dXJl
cy4KPiA+ID4gPiAKPiA+ID4gPiBBZGQgdG9wIC0+IGRvd24gdHJhdmVyc2FsIG9mIG1heF96b25l
X3BmbiBhcnJheSBpbiBmcmVlX2FyZWFfaW5pdCgpIGFuZCB1c2UKPiA+ID4gPiB0aGUgbGF0dGVy
IGluIEFSQyBub2RlL3pvbmUgaW5pdGlhbGl6YXRpb24uCj4gPiA+IAo+ID4gPiBPciBtYXliZSBs
ZWF2ZSBBUkMgYXMgaXMuIFRoZSBjaGFuZ2UgaW4gdGhpcyBwYXRjaHNldCBkb2Vzbid0IGltcGFj
dAo+ID4gPiBBUkMncyBoYW5kbGluZyBhYm91dCB6b25lIGluaXRpYWxpemF0aW9uLCBsZWF2aW5n
IGl0IGFzIGlzIGNhbiByZWR1Y2UKPiA+ID4gdGhlIGNvbXBsaWNhdGlvbiBpbiBpbXBsZW1lbnRh
dGlvbiBvZiBmcmVlX2FyZWFfaW5pdCgpLCB3aGljaCBpcyBhCj4gPiA+IGNvbW1vbiBmdW5jdGlv
bi4gU28gSSBwZXJzb25hbGx5IGRvbid0IHNlZSBhIHN0cm9uZyBtb3RpdmF0aW9uIHRvIGhhdmUK
PiA+ID4gdGhpcyBwYXRjaC4KPiA+IAo+ID4gT0ssIHNlZW1zIHRoaXMgcGF0Y2ggaXMgcHJlcGFy
ZWQgdG8gc2ltcGxpZnkgZnJlZV9hcmVhX2luaXRfbm9kZSgpLCBzbwo+ID4gdGFrZSBiYWNrIHdo
YXQgSSBzYWlkIGF0IGFib3ZlLgo+ID4gCj4gPiBUaGVuIHRoaXMgbG9va3MgbmVjZXNzYXJ5LCBl
dmVuIHRob3VnaCBpdCBpbnRyb2R1Y2VzIHNwZWNpYWwgY2FzZSBpbnRvCj4gPiBjb21tb24gZnVu
Y3Rpb24gZnJlZV9hcmVhX2luaXQoKS4KPiAKPiBUaGUgaWRlYSBpcyB0byBoYXZlIGEgc2luZ2xl
IGZyZWVfYXJlYV9pbml0KCkgZm9yIGFsbCBhcmNoaXRlY3R1cmVzCj4gd2l0aG91dCBrZWVwaW5n
IHR3byBjb21wbGV0ZWx5IGRpZmZlcmVudCB3YXlzIG9mIGNhbGN1bGF0aW5nIHRoZSB6b25lCj4g
ZXh0ZW50cy4KPiBBbm90aGVyIHRoaW5nLCBpcyB0aGF0IHdpdGggdGhpcyB3ZSBjb3VsZCBldmVu
dHVhbGx5IHN3aXRjaCBBUkMgZnJvbQo+IERJU0NPTlRJR01FTS4KClllYWgsIEkgdGhpbmsgdW5p
dGluZyB0aGVtIGludG8gYSBzaW5nbGUgZnJlZV9hcmVhX2luaXQoKSBpcyBhIGdyZWF0CmlkZWEu
IEV2ZW4gdGhvdWdoIEkgaGFkIGJlZW4gdGhyb3VnaCB0aGlzIHBhdGNoc2V0LCB3aGVuIGxvb2tl
ZCBpbnRvCmVhY2ggb2YgdGhlbSwgc3RpbGwgbWF5IGZvcmdldCB0aGUgZGV0YWlsIGluIGxhdGVy
IHBhdGNoIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
