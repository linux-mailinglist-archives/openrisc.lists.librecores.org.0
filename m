Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (unknown [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AC37E1C05CD
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2A52320B00;
	Thu, 30 Apr 2020 21:09:17 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mail.librecores.org (Postfix) with ESMTP id E4E8B202EC
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 11:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587461639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZvQHIk5yGSRjXjKFjsIWFy/S1Ns+gE0RZWu1SFT0Hc=;
 b=cKWYRFDLz+pZHVclNuPj0y2r0b/2vdjfl35C8g7r45nnidX9N3fWq9wuhNg0eDgsjlqs6i
 /zOkiULGzgaYhFBsSXh/4bW9QKbfk19lN6iJvA4mVnhIdvyeSX0/zFDqz8LjUQ8MIkVSaE
 9C35np52P/8R328eP2P7DMHs/Ib+dlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-log4rQ_TNsu7b0kMv7uVCQ-1; Tue, 21 Apr 2020 05:33:57 -0400
X-MC-Unique: log4rQ_TNsu7b0kMv7uVCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E61818C35A6;
 Tue, 21 Apr 2020 09:33:50 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A866960C87;
 Tue, 21 Apr 2020 09:33:45 +0000 (UTC)
Date: Tue, 21 Apr 2020 17:33:43 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200421093343.GR4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-3-rppt@kernel.org>
 <20200421022435.GP4247@MiWiFi-R3L-srv>
 <20200421084935.GB14260@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421084935.GB14260@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

T24gMDQvMjEvMjAgYXQgMTE6NDlhbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBPbiBUdWUsIEFw
ciAyMSwgMjAyMCBhdCAxMDoyNDozNUFNICswODAwLCBCYW9xdWFuIEhlIHdyb3RlOgo+ID4gT24g
MDQvMTIvMjAgYXQgMTA6NDhwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gRnJvbTogTWlr
ZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gPiAKPiA+ID4gVGhlIGVhcmx5X3Bm
bl90b19uaWQoKSBhbmQgaXQncyBoZWxwZXIgX19lYXJseV9wZm5fdG9fbmlkKCkgYXJlIHNwcmVh
ZAo+ID4gPiBhcm91bmQgaW5jbHVkZS9saW51eC9tbS5oLCBpbmNsdWRlL2xpbnV4L21tem9uZS5o
IGFuZCBtbS9wYWdlX2FsbG9jLmMuCj4gPiA+IAo+ID4gPiBEcm9wIHVudXNlZCBzdHViIGZvciBf
X2Vhcmx5X3Bmbl90b19uaWQoKSBhbmQgbW92ZSBpdHMgYWN0dWFsIGdlbmVyaWMKPiA+ID4gaW1w
bGVtZW50YXRpb24gY2xvc2UgdG8gaXRzIHVzZXJzLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1i
eTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGlu
Y2x1ZGUvbGludXgvbW0uaCAgICAgfCAgNCArKy0tCj4gPiA+ICBpbmNsdWRlL2xpbnV4L21tem9u
ZS5oIHwgIDkgLS0tLS0tLS0KPiA+ID4gIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgfCA1MSArKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPiA+IGlu
ZGV4IDVhMzIzNDIyZDc4My4uYTQwNDAyNmQxNGQ0IDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L21tLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPiA+IEBAIC0yMzg4
LDkgKzIzODgsOSBAQCBleHRlcm4gdm9pZCBzcGFyc2VfbWVtb3J5X3ByZXNlbnRfd2l0aF9hY3Rp
dmVfcmVnaW9ucyhpbnQgbmlkKTsKPiA+ID4gIAo+ID4gPiAgI2lmICFkZWZpbmVkKENPTkZJR19I
QVZFX01FTUJMT0NLX05PREVfTUFQKSAmJiBcCj4gPiA+ICAgICAgIWRlZmluZWQoQ09ORklHX0hB
VkVfQVJDSF9FQVJMWV9QRk5fVE9fTklEKQo+ID4gPiAtc3RhdGljIGlubGluZSBpbnQgX19lYXJs
eV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuLAo+ID4gPiAtCQkJCQlzdHJ1Y3QgbW1pbml0
X3Bmbm5pZF9jYWNoZSAqc3RhdGUpCj4gPiA+ICtzdGF0aWMgaW5saW5lIGludCBlYXJseV9wZm5f
dG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuKQo+ID4gPiAgewo+ID4gPiArCUJVSUxEX0JVR19PTihJ
U19FTkFCTEVEKENPTkZJR19OVU1BKSk7Cj4gPiA+ICAJcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiAK
PiA+IEl0J3MgYmV0dGVyIHRvIG1ha2UgYSBzZXBhcmF0ZSBwYXRjaCB0byBkcm9wIF9fZWFybHlf
cGZuX3RvX25pZCgpIGhlcmUuCj4gCj4gTm90IHN1cmUgaXQncyByZWFsbHkgd29ydGggaXQuCj4g
VGhpcyBwYXRjaCBhbnl3YXkgb25seSBtb3ZlcyB0aGUgY29kZSBhcm91bmQgd2l0aG91dCBhbnkg
YWN0dWFsIGNoYW5nZXMuCgpPSywgaXQncyBmaW5lIHRvIG1lLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
