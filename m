Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9210A2460A6
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 337BC2041B;
	Mon, 17 Aug 2020 10:45:54 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id DE68320D88
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 05:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596599438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBRFUAvhtw5NCrkPVOAd8K2sp2Oav4oQ9F6n5x6FCHA=;
 b=UbfKB69am46vtxWK00Hrt2B3evhyQ6OnoB+JRMBZoC9j5/Dplaabbxpfxuq+n2I3sh55Y0
 E238xkg3B527U9DIM6WRMHp1gppA0FYxWyQtq4nkYt/8SIZR2vAu5DtyswYuUJvP1CBL7b
 9iy/Z81ZgJEJXGe6ApfSg7dMSetjw3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-xI0_yRdGMPGizyxDuo-nyA-1; Tue, 04 Aug 2020 23:50:36 -0400
X-MC-Unique: xI0_yRdGMPGizyxDuo-nyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFAE102C7EC;
 Wed,  5 Aug 2020 03:50:30 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E4F8AC06;
 Wed,  5 Aug 2020 03:50:27 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:50:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805035024.GR10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-3-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 02/17] dma-contiguous: simplify
 cma_early_percent_memory()
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIG1lbW9yeSBzaXplIGNhbGN1
bGF0aW9uIGluIGNtYV9lYXJseV9wZXJjZW50X21lbW9yeSgpIHRyYXZlcnNlcwo+IG1lbWJsb2Nr
Lm1lbW9yeSByYXRoZXIgdGhhbiBzaW1wbHkgY2FsbCBtZW1ibG9ja19waHlzX21lbV9zaXplKCku
IFRoZQo+IGNvbW1lbnQgaW4gdGhhdCBmdW5jdGlvbiBzdWdnZXN0cyB0aGF0IGF0IHNvbWUgcG9p
bnQgdGhlcmUgc2hvdWxkIGhhdmUgYmVlbgo+IGNhbGwgdG8gbWVtYmxvY2tfYW5hbHl6ZSgpIGJl
Zm9yZSBtZW1ibG9ja19waHlzX21lbV9zaXplKCkgY291bGQgYmUgdXNlZC4KPiBBcyBvZiBub3cs
IHRoZXJlIGlzIG5vIG1lbWJsb2NrX2FuYWx5emUoKSBhdCBhbGwgYW5kCj4gbWVtYmxvY2tfcGh5
c19tZW1fc2l6ZSgpIGNhbiBiZSB1c2VkIGFzIHNvb24gYXMgY29sZC1wbHVnIG1lbW9yeSBpcwo+
IHJlZ2lzdGVyZCB3aXRoIG1lbWJsb2NrLgo+IAo+IFJlcGxhY2UgbG9vcCBvdmVyIG1lbWJsb2Nr
Lm1lbW9yeSB3aXRoIGEgY2FsbCB0byBtZW1ibG9ja19waHlzX21lbV9zaXplKCkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IFJldmlld2Vk
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAga2VybmVsL2RtYS9j
b250aWd1b3VzLmMgfCAxMSArLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvZG1hL2NvbnRp
Z3VvdXMuYyBiL2tlcm5lbC9kbWEvY29udGlndW91cy5jCj4gaW5kZXggMTViYzUwMjZjNDg1Li4x
OTkyYWZkOGNhN2IgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9jb250aWd1b3VzLmMKPiArKysg
Yi9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwo+IEBAIC03MywxNiArNzMsNyBAQCBlYXJseV9wYXJh
bSgiY21hIiwgZWFybHlfY21hKTsKPiAgCj4gIHN0YXRpYyBwaHlzX2FkZHJfdCBfX2luaXQgX19t
YXliZV91bnVzZWQgY21hX2Vhcmx5X3BlcmNlbnRfbWVtb3J5KHZvaWQpCj4gIHsKPiAtCXN0cnVj
dCBtZW1ibG9ja19yZWdpb24gKnJlZzsKPiAtCXVuc2lnbmVkIGxvbmcgdG90YWxfcGFnZXMgPSAw
Owo+IC0KPiAtCS8qCj4gLQkgKiBXZSBjYW5ub3QgdXNlIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUo
KSBoZXJlLCBiZWNhdXNlCj4gLQkgKiBtZW1ibG9ja19hbmFseXplKCkgaGFzIG5vdCBiZWVuIGNh
bGxlZCB5ZXQuCj4gLQkgKi8KPiAtCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKQo+IC0J
CXRvdGFsX3BhZ2VzICs9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3BmbihyZWcpIC0KPiAt
CQkJICAgICAgIG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFzZV9wZm4ocmVnKTsKPiArCXVuc2ln
bmVkIGxvbmcgdG90YWxfcGFnZXMgPSBQSFlTX1BGTihtZW1ibG9ja19waHlzX21lbV9zaXplKCkp
OwoKUmV2aWV3ZWQtYnk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgoKPiAgCj4gIAlyZXR1
cm4gKHRvdGFsX3BhZ2VzICogQ09ORklHX0NNQV9TSVpFX1BFUkNFTlRBR0UgLyAxMDApIDw8IFBB
R0VfU0hJRlQ7Cj4gIH0KPiAtLSAKPiAyLjI2LjIKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
