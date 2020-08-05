Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3C32460A7
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D696820E3A;
	Mon, 17 Aug 2020 10:45:54 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by mail.librecores.org (Postfix) with ESMTP id 90ECB20CB0
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 05:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596599849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYHMWO+/kd/xb1BEqnZIo41jyaK7ZhQvyZqkmGc35KI=;
 b=Xr2voHUYkBjlVhxBLEFlUUZQkFLmFIMB9d+ScRmkNqp8Ban4KesCOdD6ZLMwI2DHfddeQL
 PFG6UFzzLTKW6Ye954Fd+rwM1ZVy1XRJXJBxCAEDlew3/IvEgIwYcK6ReAyzVz3ywuopXh
 GnPqhg0mlMnNU9x4elFXTWXxDJPlCEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-qwjgBZnQPM-_Txp2UuCA1g-1; Tue, 04 Aug 2020 23:57:25 -0400
X-MC-Unique: qwjgBZnQPM-_Txp2UuCA1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FD12800138;
 Wed,  5 Aug 2020 03:57:20 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B719C87B38;
 Wed,  5 Aug 2020 03:57:18 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:57:15 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805035715.GS10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-12-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-12-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 11/17] arch,
 mm: replace for_each_memblock() with for_each_mem_pfn_range()
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

T24gMDgvMDIvMjAgYXQgMDc6MzVwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlcmUgYXJlIHNldmVyYWwgb2Nj
dXJyZW5jZXMgb2YgdGhlIGZvbGxvd2luZyBwYXR0ZXJuOgo+IAo+IAlmb3JfZWFjaF9tZW1ibG9j
ayhtZW1vcnksIHJlZykgewo+IAkJc3RhcnRfcGZuID0gbWVtYmxvY2tfcmVnaW9uX21lbW9yeV9i
YXNlX3BmbihyZWcpOwo+IAkJZW5kX3BmbiA9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3Bm
bihyZWcpOwo+IAo+IAkJLyogZG8gc29tZXRoaW5nIHdpdGggc3RhcnRfcGZuIGFuZCBlbmRfcGZu
ICovCj4gCX0KPiAKPiBSYXRoZXIgdGhhbiBpdGVyYXRlIG92ZXIgYWxsIG1lbWJsb2NrLm1lbW9y
eSByZWdpb25zIGFuZCBlYWNoIHRpbWUgcXVlcnkKPiBmb3IgdGhlaXIgc3RhcnQgYW5kIGVuZCBQ
Rk5zLCB1c2UgZm9yX2VhY2hfbWVtX3Bmbl9yYW5nZSgpIGl0ZXJhdG9yIHRvIGdldAo+IHNpbXBs
ZXIgYW5kIGNsZWFyZXIgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxy
cHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtL21tL2luaXQuYyAgICAgICAgICAg
fCAxMSArKysrLS0tLS0tLQo+ICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgIHwgMTEgKysr
Ky0tLS0tLS0KPiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYyB8IDExICsrKysrKy0tLS0t
Cj4gIGFyY2gvcG93ZXJwYy9tbS9tZW0uYyAgICAgICAgfCAxNSArKysrKysrKy0tLS0tLS0KPiAg
YXJjaC9wb3dlcnBjL21tL251bWEuYyAgICAgICB8ICA3ICsrLS0tLS0KPiAgYXJjaC9zMzkwL21t
L3BhZ2Utc3RhdGVzLmMgICB8ICA2ICsrLS0tLQo+ICBhcmNoL3NoL21tL2luaXQuYyAgICAgICAg
ICAgIHwgIDkgKysrLS0tLS0tCj4gIG1tL21lbWJsb2NrLmMgICAgICAgICAgICAgICAgfCAgNiAr
Ky0tLS0KPiAgbW0vc3BhcnNlLmMgICAgICAgICAgICAgICAgICB8IDEwICsrKystLS0tLS0KPiAg
OSBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkKPiAKClJl
dmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
