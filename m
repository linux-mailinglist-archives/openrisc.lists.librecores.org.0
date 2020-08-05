Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 30A6C2460AA
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EE7A020B18;
	Mon, 17 Aug 2020 10:45:56 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id C696C20CAB
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 10:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596616184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FvaMXP5a+m7YjPK069Q+H34K0fPtN+F8dCVJuIAUPpY=;
 b=UUTWGjMaC589yMqIkc0P3tcJrgvfrnzLO8GogIGJlXgVmu4mZ8riSGVZ80gJd910sZWZnH
 x/6LkzLnS3lm3aS9tSyXrJKXxfyikTxKoZ52heun1ooQqpuN/VBShPPPSyIpZ1aw8AoC7W
 o+e4SIr3MyXoeyUk2C1AfLQ7axybcPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-Fs5bhd50MLqa0hbUoos07g-1; Wed, 05 Aug 2020 04:29:36 -0400
X-MC-Unique: Fs5bhd50MLqa0hbUoos07g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F02638064AB;
 Wed,  5 Aug 2020 08:29:30 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DCC10013D0;
 Wed,  5 Aug 2020 08:29:26 +0000 (UTC)
Date: Wed, 5 Aug 2020 16:29:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805082924.GV10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-16-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-16-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 15/17] memblock: remove unused
 memblock_mem_size()
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIG9ubHkgdXNlciBvZiBtZW1i
bG9ja19tZW1fc2l6ZSgpIHdhcyB4ODYgc2V0dXAgY29kZSwgaXQgaXMgZ29uZSBub3cgYW5kCj4g
bWVtYmxvY2tfbWVtX3NpemUoKSBmdW5jaXRvbiBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvbGludXgvbWVtYmxvY2suaCB8ICAxIC0KPiAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwg
MTUgLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaCBiL2luY2x1ZGUvbGludXgv
bWVtYmxvY2suaAo+IGluZGV4IGQ3MGMyODM1ZTkxMy4uZWMyZmQ4ZjMyYTE5IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWVtYmxv
Y2suaAo+IEBAIC00NTAsNyArNDUwLDYgQEAgc3RhdGljIGlubGluZSBib29sIG1lbWJsb2NrX2Jv
dHRvbV91cCh2b2lkKQo+ICAKPiAgcGh5c19hZGRyX3QgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSh2
b2lkKTsKPiAgcGh5c19hZGRyX3QgbWVtYmxvY2tfcmVzZXJ2ZWRfc2l6ZSh2b2lkKTsKPiAtcGh5
c19hZGRyX3QgbWVtYmxvY2tfbWVtX3NpemUodW5zaWduZWQgbG9uZyBsaW1pdF9wZm4pOwo+ICBw
aHlzX2FkZHJfdCBtZW1ibG9ja19zdGFydF9vZl9EUkFNKHZvaWQpOwo+ICBwaHlzX2FkZHJfdCBt
ZW1ibG9ja19lbmRfb2ZfRFJBTSh2b2lkKTsKPiAgdm9pZCBtZW1ibG9ja19lbmZvcmNlX21lbW9y
eV9saW1pdChwaHlzX2FkZHJfdCBtZW1vcnlfbGltaXQpOwo+IGRpZmYgLS1naXQgYS9tbS9tZW1i
bG9jay5jIGIvbW0vbWVtYmxvY2suYwo+IGluZGV4IGMxYTRjODc5ODk3My4uNDhkNjE0MzUyYjI1
IDEwMDY0NAo+IC0tLSBhL21tL21lbWJsb2NrLmMKPiArKysgYi9tbS9tZW1ibG9jay5jCj4gQEAg
LTE2NTYsMjEgKzE2NTYsNiBAQCBwaHlzX2FkZHJfdCBfX2luaXRfbWVtYmxvY2sgbWVtYmxvY2tf
cmVzZXJ2ZWRfc2l6ZSh2b2lkKQo+ICAJcmV0dXJuIG1lbWJsb2NrLnJlc2VydmVkLnRvdGFsX3Np
emU7Cj4gIH0KPiAgCj4gLXBoeXNfYWRkcl90IF9faW5pdCBtZW1ibG9ja19tZW1fc2l6ZSh1bnNp
Z25lZCBsb25nIGxpbWl0X3BmbikKPiAtewo+IC0JdW5zaWduZWQgbG9uZyBwYWdlcyA9IDA7Cj4g
LQl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKPiAtCWludCBpOwo+IC0KPiAtCWZv
cl9lYWNoX21lbV9wZm5fcmFuZ2UoaSwgTUFYX05VTU5PREVTLCAmc3RhcnRfcGZuLCAmZW5kX3Bm
biwgTlVMTCkgewo+IC0JCXN0YXJ0X3BmbiA9IG1pbl90KHVuc2lnbmVkIGxvbmcsIHN0YXJ0X3Bm
biwgbGltaXRfcGZuKTsKPiAtCQllbmRfcGZuID0gbWluX3QodW5zaWduZWQgbG9uZywgZW5kX3Bm
biwgbGltaXRfcGZuKTsKPiAtCQlwYWdlcyArPSBlbmRfcGZuIC0gc3RhcnRfcGZuOwo+IC0JfQo+
IC0KPiAtCXJldHVybiBQRk5fUEhZUyhwYWdlcyk7Cj4gLX0KClJldmlld2VkLWJ5OiBCYW9xdWFu
IEhlIDxiaGVAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
