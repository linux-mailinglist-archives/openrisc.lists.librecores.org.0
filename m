Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E09512460AC
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9E6DD20E4D;
	Mon, 17 Aug 2020 10:45:58 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 9B11720CB5
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 11:30:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596619802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KGrNYVry5FOInRW/Xy0yFMiPNeyHmg20qhVD8oGfJJ4=;
 b=aUOxTUPpBPd48TQUNVSosUBrx0RpYWwrCSGKn8GWTGhB28sC3H1gVhK3g5jDWcq7hb1KLW
 HZC/Y/5rDZbbpdfxZ99aYgN5c7MepdlUlLdBcuzSbWncjo6uHbrkf+n4c9F1jMaqB2oSnv
 k3iBr7h6S4pqZcnEQhPLETOc35VuQnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-ZnwKN9E9NxSzYumJ2rNNrw-1; Wed, 05 Aug 2020 05:29:58 -0400
X-MC-Unique: ZnwKN9E9NxSzYumJ2rNNrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24BE680183C;
 Wed,  5 Aug 2020 09:29:53 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 068AF726A5;
 Wed,  5 Aug 2020 09:29:51 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:29:48 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805092948.GX10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 17/17] memblock: use separate iterators
 for memory and reserved regions
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDgvMDIvMjAgYXQgMDc6MzZwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gZm9yX2VhY2hfbWVtYmxvY2soKSBp
cyB1c2VkIHRvIGl0ZXJhdGUgb3ZlciBtZW1ibG9jay5tZW1vcnkgaW4KPiBhIGZldyBwbGFjZXMg
dGhhdCB1c2UgZGF0YSBmcm9tIG1lbWJsb2NrX3JlZ2lvbiByYXRoZXIgdGhhbiB0aGUgbWVtb3J5
Cj4gcmFuZ2VzLgo+IAo+IEludHJvZHVjZSBzZXBhcmF0ZSBmb3JfZWFjaF9tZW1fcmVnaW9uKCkg
YW5kIGZvcl9lYWNoX3Jlc2VydmVkX21lbV9yZWdpb24oKQo+IHRvIGltcHJvdmUgZW5jYXBzdWxh
dGlvbiBvZiBtZW1ibG9jayBpbnRlcm5hbHMgZnJvbSBpdHMgdXNlcnMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0tLQo+ICAuY2xhbmct
Zm9ybWF0ICAgICAgICAgICAgICAgICAgfCAgMyArKy0KPiAgYXJjaC9hcm02NC9rZXJuZWwvc2V0
dXAuYyAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm02NC9tbS9udW1hLmMgICAgICAgICAgIHwgIDIg
Ky0KPiAgYXJjaC9taXBzL25ldGxvZ2ljL3hscC9zZXR1cC5jIHwgIDIgKy0KPiAgYXJjaC94ODYv
bW0vbnVtYS5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9saW51eC9tZW1ibG9jay5o
ICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKy0tLQo+ICBtbS9tZW1ibG9jay5jICAgICAgICAg
ICAgICAgICAgfCAgNCArKy0tCj4gIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICB8ICA4
ICsrKystLS0tCj4gIDggZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCj4gCi4uLgoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oIGIv
aW5jbHVkZS9saW51eC9tZW1ibG9jay5oCj4gaW5kZXggOWU1MWIzZmQ0MTM0Li5hNjk3MGUwNThi
ZDcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9tZW1ibG9jay5oCj4gQEAgLTUyMiw5ICs1MjIsMjIgQEAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIG1lbWJsb2NrX3JlZ2lvbl9yZXNlcnZlZF9lbmRfcGZuKGNvbnN0IHN0cnVj
dCBtZW1ibG8KPiAgCXJldHVybiBQRk5fVVAocmVnLT5iYXNlICsgcmVnLT5zaXplKTsKPiAgfQo+
ICAKPiAtI2RlZmluZSBmb3JfZWFjaF9tZW1ibG9jayhtZW1ibG9ja190eXBlLCByZWdpb24pCQkJ
CQlcCj4gLQlmb3IgKHJlZ2lvbiA9IG1lbWJsb2NrLm1lbWJsb2NrX3R5cGUucmVnaW9uczsJCQkJ
CVwKPiAtCSAgICAgcmVnaW9uIDwgKG1lbWJsb2NrLm1lbWJsb2NrX3R5cGUucmVnaW9ucyArIG1l
bWJsb2NrLm1lbWJsb2NrX3R5cGUuY250KTsJXAo+ICsvKioKPiArICogZm9yX2VhY2hfbWVtX3Jl
Z2lvbiAtIGl0ZXJlYXRlIG92ZXIgcmVnaXN0ZXJlZCBtZW1vcnkgcmVnaW9ucwogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fgoKV29uZGVy
IHdoeSBlbXBoYXNpemUgJ3JlZ2lzdGVyZWQnIG1lbW9yeS4KCk90aGVyIHRoYW4gdGhpcyBjb25m
dXNpb24gdG8gbWUsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBCYW9xdWFu
IEhlIDxiaGVAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
