Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C63AC2460AB
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 85D6820E42;
	Mon, 17 Aug 2020 10:45:57 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 0D5E520D82
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 11:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596618681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ozBDa1/xPHY8DQkaA9JqUMmSyVVQ14zD1Crd0znMso=;
 b=BguesofX9N0Cgqkm+rnZVDruRVPjWLrcLPReq0XbYanCBaC6KobM8/oubI+N9v8eaE1Hf7
 fgynUxSpbBXeY/innMxTjdklmGvqlgjBrl0SvR9/p/anmGKhPyOahd8iZHurdnxhlefCiY
 KCBpj5T2xB9TvxVMtKIfgQGvh+o+VPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-yG35Dv0sMVyPaqKEAb-z_A-1; Wed, 05 Aug 2020 05:11:16 -0400
X-MC-Unique: yG35Dv0sMVyPaqKEAb-z_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB37818C63C1;
 Wed,  5 Aug 2020 09:11:11 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D2772E4F;
 Wed,  5 Aug 2020 09:11:07 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:11:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805091105.GW10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-17-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-17-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 16/17] memblock: implement
 for_each_reserved_mem_region() using __next_mem_region()
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gSXRlcmF0aW9uIG92ZXIgbWVtYmxv
Y2sucmVzZXJ2ZWQgd2l0aCBmb3JfZWFjaF9yZXNlcnZlZF9tZW1fcmVnaW9uKCkgdXNlZAo+IF9f
bmV4dF9yZXNlcnZlZF9tZW1fcmVnaW9uKCkgdGhhdCBpbXBsZW1lbnRlZCBhIHN1YnNldCBvZgo+
IF9fbmV4dF9tZW1fcmVnaW9uKCkuCj4gCj4gVXNlIF9fZm9yX2VhY2hfbWVtX3JhbmdlKCkgYW5k
LCBlc3NlbnRpYWxseSwgX19uZXh0X21lbV9yZWdpb24oKSB3aXRoCj4gYXBwcm9wcmlhdGUgcGFy
YW1ldGVycyB0byByZWR1Y2UgY29kZSBkdXBsaWNhdGlvbi4KPiAKPiBXaGlsZSBvbiBpdCwgcmVu
YW1lIGZvcl9lYWNoX3Jlc2VydmVkX21lbV9yZWdpb24oKSB0bwo+IGZvcl9lYWNoX3Jlc2VydmVk
X21lbV9yYW5nZSgpIGZvciBjb25zaXN0ZW5jeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIC5jbGFuZy1mb3JtYXQgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm02NC9rZXJuZWwvc2V0dXAuYyAgICAgICAg
fCAgMiArLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMuYyB8ICAyICstCj4gIGlu
Y2x1ZGUvbGludXgvbWVtYmxvY2suaCAgICAgICAgIHwgMTIgKysrLS0tLS0tCj4gIG1tL21lbWJs
b2NrLmMgICAgICAgICAgICAgICAgICAgIHwgNDYgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMo
LSkKClJldmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
