Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1F61C05BA
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3DD5A204A1;
	Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id CFDB7202FE
 for <openrisc@lists.librecores.org>; Fri, 24 Apr 2020 09:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587712983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mSCwKGFsRo1tURSlR3wqOWq4Aw66HvWN2vcc7P0apK8=;
 b=YEGQSZAgT7Gs48lH8zGJkBLdJpG+iO1G/djCwGHPGHpKiZUylSsxTm851nD4TYhgRceOo+
 ZJMFGBJ6nJXpb6D7Hw8tUj8UX4FBeokx+1OTjZwOqEOZtYi2iF9HJJNn4UDonqUFogN6xJ
 tmp832ZLkIJX+64lZscw4PHCK0yVCDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-oyPtM_plPTaEdOOdHnoQOw-1; Fri, 24 Apr 2020 03:22:54 -0400
X-MC-Unique: oyPtM_plPTaEdOOdHnoQOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 110B81902EA0;
 Fri, 24 Apr 2020 07:22:47 +0000 (UTC)
Received: from [10.36.113.138] (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9605D70B;
 Fri, 24 Apr 2020 07:22:33 +0000 (UTC)
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-16-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <9143538a-4aaa-ca1d-9c8f-72ac949cf593@redhat.com>
Date: Fri, 24 Apr 2020 09:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200412194859.12663-16-rppt@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 15/21] mm: memmap_init: iterate over memblock
 regions rather that check each PFN
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMTIuMDQuMjAgMjE6NDgsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gRnJvbTogQmFvcXVhbiBI
ZSA8YmhlQHJlZGhhdC5jb20+Cj4gCj4gV2hlbiBjYWxsZWQgZHVyaW5nIGJvb3QgdGhlIG1lbW1h
cF9pbml0X3pvbmUoKSBmdW5jdGlvbiBjaGVja3MgaWYgZWFjaCBQRk4KPiBpcyB2YWxpZCBhbmQg
YWN0dWFsbHkgYmVsb25ncyB0byB0aGUgbm9kZSBiZWluZyBpbml0aWFsaXplZCB1c2luZwo+IGVh
cmx5X3Bmbl92YWxpZCgpIGFuZCBlYXJseV9wZm5faW5fbmlkKCkuCj4gCj4gRWFjaCBzdWNoIGNo
ZWNrIG1heSBjb3N0IHVwIHRvIE8obG9nKG4pKSB3aGVyZSBuIGlzIHRoZSBudW1iZXIgb2YgbWVt
b3J5Cj4gYmFua3MsIHNvIGZvciBsYXJnZSBhbW91bnQgb2YgbWVtb3J5IG92ZXJhbGwgdGltZSBz
cGVudCBpbiBlYXJseV9wZm4qKCkKPiBiZWNvbWVzIHN1YnN0YW50aWFsLgo+IAo+IFNpbmNlIHRo
ZSBpbmZvcm1hdGlvbiBpcyBhbnl3YXkgcHJlc2VudCBpbiBtZW1ibG9jaywgd2UgY2FuIGl0ZXJh
dGUgb3Zlcgo+IG1lbWJsb2NrIG1lbW9yeSByZWdpb25zIGluIG1lbW1hcF9pbml0KCkgYW5kIG9u
bHkgY2FsbCBtZW1tYXBfaW5pdF96b25lKCkKPiBmb3IgUEZOIHJhbmdlcyB0aGF0IGFyZSBrbm93
IHRvIGJlIHZhbGlkIGFuZCBpbiB0aGUgYXBwcm9wcmlhdGUgbm9kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIG1tL3BhZ2VfYWxsb2MuYyB8IDI2
ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5j
IGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5kZXggN2Y2YTMwODFlZGI4Li5jNDNjZTg3MDk0NTcgMTAw
NjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAg
LTU5OTUsMTQgKzU5OTUsNiBAQCB2b2lkIF9fbWVtaW5pdCBtZW1tYXBfaW5pdF96b25lKHVuc2ln
bmVkIGxvbmcgc2l6ZSwgaW50IG5pZCwgdW5zaWduZWQgbG9uZyB6b25lLAo+ICAJCSAqIGZ1bmN0
aW9uLiAgVGhleSBkbyBub3QgZXhpc3Qgb24gaG90cGx1Z2dlZCBtZW1vcnkuCj4gIAkJICovCgpB
ZnRlciB0aGlzIGNoYW5nZSwgdGhlIGNvbW1lbnQgYWJvdmUgaXMgc3RhbGUuIHRoZSAiaG9sZXMg
aW4gYm9vdC10aW1lCm1lbV9tYXAiIGFyZSBoYW5kbGVkIGJ5IHRoZSBjYWxsZXIgbm93IEFGQUlL
cy4KCj4gIAkJaWYgKGNvbnRleHQgPT0gTUVNTUFQX0VBUkxZKSB7Cj4gLQkJCWlmICghZWFybHlf
cGZuX3ZhbGlkKHBmbikpIHsKPiAtCQkJCXBmbiA9IG5leHRfcGZuKHBmbik7Cj4gLQkJCQljb250
aW51ZTsKPiAtCQkJfQo+IC0JCQlpZiAoIWVhcmx5X3Bmbl9pbl9uaWQocGZuLCBuaWQpKSB7Cj4g
LQkJCQlwZm4rKzsKPiAtCQkJCWNvbnRpbnVlOwo+IC0JCQl9Cj4gIAkJCWlmIChvdmVybGFwX21l
bW1hcF9pbml0KHpvbmUsICZwZm4pKQo+ICAJCQkJY29udGludWU7Cj4gIAkJCWlmIChkZWZlcl9p
bml0KG5pZCwgcGZuLCBlbmRfcGZuKSkKCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
