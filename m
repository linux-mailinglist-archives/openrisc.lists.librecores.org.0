Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACD024609C
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1169F2088E;
	Mon, 17 Aug 2020 10:45:43 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 803D520B5B
 for <openrisc@lists.librecores.org>; Thu, 30 Jul 2020 03:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596073957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wr/vxuRMCyMaqxtO9q8uf3t1cVc0k0F6Dgt7vG6jHBM=;
 b=eGo2+WlcclXsDpnazLCvnBByb23LW99BZpmC8+GbcFaaMdCnm3RJysRyRZDMYxvP+4tVpw
 q8jIl6iUk6wAYHYogVIU6QUKy1gJ6Hpy9kiGmJN1bv2Cq+9uqUmpt+Zd2d7vA7mA5YJMD7
 qzb8bs++e/uwmP2bvpX1dwq6UnoX26g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-29YBKjvJP4OrLqv9mdWq_A-1; Wed, 29 Jul 2020 21:52:35 -0400
X-MC-Unique: 29YBKjvJP4OrLqv9mdWq_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F7459;
 Thu, 30 Jul 2020 01:52:29 +0000 (UTC)
Received: from localhost (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3136179C;
 Thu, 30 Jul 2020 01:52:27 +0000 (UTC)
Date: Thu, 30 Jul 2020 09:52:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200730015221.GI14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-10-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-10-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 09/15] memblock: make
 for_each_memblock_type() iterator private
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDcvMjgvMjAgYXQgMDg6MTFhbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gZm9yX2VhY2hfbWVtYmxvY2tfdHlw
ZSgpIGlzIG5vdCB1c2VkIG91dHNpZGUgbW0vbWVtYmxvY2suYywgbW92ZSBpdCB0aGVyZQo+IGZy
b20gaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCj4gCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvbWVt
YmxvY2suaCB8IDUgLS0tLS0KPiAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwgNSArKysrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oIGIvaW5jbHVkZS9saW51eC9tZW1i
bG9jay5oCj4gaW5kZXggMDE3ZmFlODMzZDRhLi4yMjBiNWYwZGFkNDIgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9saW51eC9tZW1ibG9jay5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5o
Cj4gQEAgLTUzMiwxMSArNTMyLDYgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIG1lbWJs
b2NrX3JlZ2lvbl9yZXNlcnZlZF9lbmRfcGZuKGNvbnN0IHN0cnVjdCBtZW1ibG8KPiAgCSAgICAg
cmVnaW9uIDwgKG1lbWJsb2NrLm1lbWJsb2NrX3R5cGUucmVnaW9ucyArIG1lbWJsb2NrLm1lbWJs
b2NrX3R5cGUuY250KTsJXAo+ICAJICAgICByZWdpb24rKykKPiAgCj4gLSNkZWZpbmUgZm9yX2Vh
Y2hfbWVtYmxvY2tfdHlwZShpLCBtZW1ibG9ja190eXBlLCByZ24pCQkJXAo+IC0JZm9yIChpID0g
MCwgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbMF07CQkJXAo+IC0JICAgICBpIDwgbWVt
YmxvY2tfdHlwZS0+Y250OwkJCQkJXAo+IC0JICAgICBpKyssIHJnbiA9ICZtZW1ibG9ja190eXBl
LT5yZWdpb25zW2ldKQo+IC0KPiAgZXh0ZXJuIHZvaWQgKmFsbG9jX2xhcmdlX3N5c3RlbV9oYXNo
KGNvbnN0IGNoYXIgKnRhYmxlbmFtZSwKPiAgCQkJCSAgICAgdW5zaWduZWQgbG9uZyBidWNrZXRz
aXplLAo+ICAJCQkJICAgICB1bnNpZ25lZCBsb25nIG51bWVudHJpZXMsCj4gZGlmZiAtLWdpdCBh
L21tL21lbWJsb2NrLmMgYi9tbS9tZW1ibG9jay5jCj4gaW5kZXggMzlhY2VhZmM1N2Y2Li5hNWI5
YjNkZjgxZmMgMTAwNjQ0Cj4gLS0tIGEvbW0vbWVtYmxvY2suYwo+ICsrKyBiL21tL21lbWJsb2Nr
LmMKPiBAQCAtMTI5LDYgKzEyOSwxMSBAQCBzdHJ1Y3QgbWVtYmxvY2sgbWVtYmxvY2sgX19pbml0
ZGF0YV9tZW1ibG9jayA9IHsKPiAgCS5jdXJyZW50X2xpbWl0CQk9IE1FTUJMT0NLX0FMTE9DX0FO
WVdIRVJFLAo+ICB9Owo+ICAKPiArI2RlZmluZSBmb3JfZWFjaF9tZW1ibG9ja190eXBlKGksIG1l
bWJsb2NrX3R5cGUsIHJnbikJCQlcCj4gKwlmb3IgKGkgPSAwLCByZ24gPSAmbWVtYmxvY2tfdHlw
ZS0+cmVnaW9uc1swXTsJCQlcCj4gKwkgICAgIGkgPCBtZW1ibG9ja190eXBlLT5jbnQ7CQkJCQlc
Cj4gKwkgICAgIGkrKywgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbaV0pCj4gKwoKUmV2
aWV3ZWQtYnk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
