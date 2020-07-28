Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 42492246097
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 10F7E20D20;
	Mon, 17 Aug 2020 10:45:41 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id CB9F020A40
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 13:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595934192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbH/+n2HvZybv5SHoykd6djdgy/t/5KkFVDCxrMDM1E=;
 b=FpyBFgEYAdPH3frIXeqvXGy6kgOJxM/9AHjX72Rb2v9RbeEO8q1MyhszM7mOxtuaK9j/8S
 CaJP9U1fZblnyeXmyod7yzielFYMq5N/PDpHezk1wH3itx2ca7I5CQwc0VlsYMHgLDhVQa
 X7DVmRn5CE98eNOsxgPjGZnZZ4Tiq3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-YtpimbUANf-rLILSqHuJcA-1; Tue, 28 Jul 2020 07:03:08 -0400
X-MC-Unique: YtpimbUANf-rLILSqHuJcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA57C800597;
 Tue, 28 Jul 2020 11:03:00 +0000 (UTC)
Received: from localhost (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD995DA33;
 Tue, 28 Jul 2020 11:02:56 +0000 (UTC)
Date: Tue, 28 Jul 2020 19:02:54 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200728110254.GA14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-15-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 14/15] x86/numa: remove redundant iteration
 over memblock.reserved
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gbnVtYV9jbGVhcl9rZXJuZWxfbm9k
ZV9ob3RwbHVnKCkgZnVuY3Rpb24gZmlyc3QgdHJhdmVyc2VzIG51bWFfbWVtaW5mbwo+IHJlZ2lv
bnMgdG8gc2V0IG5vZGUgSUQgaW4gbWVtYmxvY2sucmVzZXJ2ZWQgYW5kIHRoYW4gdHJhdmVyc2Vz
Cj4gbWVtYmxvY2sucmVzZXJ2ZWQgdG8gdXBkYXRlIHJlc2VydmVkX25vZGVtYXNrIHRvIGluY2x1
ZGUgbm9kZSBJRHMgdGhhdCB3ZXJlCj4gc2V0IGluIHRoZSBmaXJzdCBsb29wLgo+IAo+IFJlbW92
ZSByZWR1bmRhbnQgdHJhdmVyc2FsIG92ZXIgbWVtYmxvY2sucmVzZXJ2ZWQgYW5kIHVwZGF0ZQo+
IHJlc2VydmVkX25vZGVtYXNrIHdoaWxlIGl0ZXJhdGluZyBvdmVyIG51bWFfbWVtaW5mby4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0t
Cj4gIGFyY2gveDg2L21tL251bWEuYyB8IDI2ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0vbnVtYS5jIGIvYXJjaC94ODYvbW0vbnVtYS5jCj4gaW5k
ZXggOGVlOTUyMDM4YzgwLi40MDc4YWJkMzM5MzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvbW0v
bnVtYS5jCj4gKysrIGIvYXJjaC94ODYvbW0vbnVtYS5jCj4gQEAgLTQ5OCwzMSArNDk4LDI1IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBudW1hX2NsZWFyX2tlcm5lbF9ub2RlX2hvdHBsdWcodm9pZCkK
PiAgCSAqIGFuZCB1c2UgdGhvc2UgcmFuZ2VzIHRvIHNldCB0aGUgbmlkIGluIG1lbWJsb2NrLnJl
c2VydmVkLgo+ICAJICogVGhpcyB3aWxsIHNwbGl0IHVwIHRoZSBtZW1ibG9jayByZWdpb25zIGFs
b25nIG5vZGUKPiAgCSAqIGJvdW5kYXJpZXMgYW5kIHdpbGwgc2V0IHRoZSBub2RlIElEcyBhcyB3
ZWxsLgo+ICsJICoKPiArCSAqIFRoZSBuaWQgd2lsbCBhbHNvIGJlIHNldCBpbiByZXNlcnZlZF9u
b2RlbWFzayB3aGljaCBpcyBsYXRlcgo+ICsJICogdXNlZCB0byBjbGVhciBNRU1CTE9DS19IT1RQ
TFVHIGZsYWcuCj4gKwkgKgo+ICsJICogWyBOb3RlLCB3aGVuIGJvb3Rpbmcgd2l0aCBtZW09bm5b
a01HXSBvciBpbiBhIGtkdW1wIGtlcm5lbCwKPiArCSAqICAgbnVtYV9tZW1pbmZvIG1pZ2h0IG5v
dCBpbmNsdWRlIGFsbCBtZW1ibG9jay5yZXNlcnZlZAo+ICsJICogICBtZW1vcnkgcmFuZ2VzLCBi
ZWNhdXNlIHF1aXJrcyBzdWNoIGFzIHRyaW1fc25iX21lbW9yeSgpCj4gKwkgKiAgIHJlc2VydmUg
c3BlY2lmaWMgcGFnZXMgZm9yIFNhbmR5IEJyaWRnZSBncmFwaGljcy4KPiArCSAqICAgVGhlc2Ug
cmFuZ2VzIHdpbGwgcmVtYWluIHdpdGggbmlkID09IE1BWF9OVU1OT0RFUy4gXQo+ICAJICovCj4g
IAlmb3IgKGkgPSAwOyBpIDwgbnVtYV9tZW1pbmZvLm5yX2Jsa3M7IGkrKykgewo+ICAJCXN0cnVj
dCBudW1hX21lbWJsayAqbWIgPSBudW1hX21lbWluZm8uYmxrICsgaTsKPiAgCQlpbnQgcmV0Owo+
ICAKPiAgCQlyZXQgPSBtZW1ibG9ja19zZXRfbm9kZShtYi0+c3RhcnQsIG1iLT5lbmQgLSBtYi0+
c3RhcnQsICZtZW1ibG9jay5yZXNlcnZlZCwgbWItPm5pZCk7Cj4gKwkJbm9kZV9zZXQobWItPm5p
ZCwgcmVzZXJ2ZWRfbm9kZW1hc2spOwoKUmVhbGx5PyBUaGlzIHdpbGwgc2V0IGFsbCBub2RlIGlk
IGludG8gcmVzZXJ2ZWRfbm9kZW1hc2suIEJ1dCBpbiB0aGUKY3VycmVudCBjb2RlLCBpdCdzIHNl
dHRpbmcgbmlkIGludG8gbWVtYmxvY2sgcmVzZXJ2ZWQgcmVnaW9uIHdoaWNoCmludGVybGVhdmVz
IHdpdGggbnVtYV9tZW1vaW5mbywgdGhlbiBnZXQgdGhvc2UgbmlkIGFuZCBzZXQgaXQgaW4KcmVz
ZXJ2ZWRfbm9kZW1hc2suIFRoaXMgaXMgc28gZGlmZmVyZW50LCB3aXRoIG15IHVuZGVyc3RhbmRp
bmcuIFBsZWFzZQpjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuCgpUaGFua3MKQmFvcXVhbgoKPiAg
CQlXQVJOX09OX09OQ0UocmV0KTsKPiAgCX0KPiAgCj4gLQkvKgo+IC0JICogTm93IGdvIG92ZXIg
YWxsIHJlc2VydmVkIG1lbWJsb2NrIHJlZ2lvbnMsIHRvIGNvbnN0cnVjdCBhCj4gLQkgKiBub2Rl
IG1hc2sgb2YgYWxsIGtlcm5lbCByZXNlcnZlZCBtZW1vcnkgYXJlYXMuCj4gLQkgKgo+IC0JICog
WyBOb3RlLCB3aGVuIGJvb3Rpbmcgd2l0aCBtZW09bm5ba01HXSBvciBpbiBhIGtkdW1wIGtlcm5l
bCwKPiAtCSAqICAgbnVtYV9tZW1pbmZvIG1pZ2h0IG5vdCBpbmNsdWRlIGFsbCBtZW1ibG9jay5y
ZXNlcnZlZAo+IC0JICogICBtZW1vcnkgcmFuZ2VzLCBiZWNhdXNlIHF1aXJrcyBzdWNoIGFzIHRy
aW1fc25iX21lbW9yeSgpCj4gLQkgKiAgIHJlc2VydmUgc3BlY2lmaWMgcGFnZXMgZm9yIFNhbmR5
IEJyaWRnZSBncmFwaGljcy4gXQo+IC0JICovCj4gLQlmb3JfZWFjaF9tZW1ibG9jayhyZXNlcnZl
ZCwgbWJfcmVnaW9uKSB7Cj4gLQkJaW50IG5pZCA9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZSht
Yl9yZWdpb24pOwo+IC0KPiAtCQlpZiAobmlkICE9IE1BWF9OVU1OT0RFUykKPiAtCQkJbm9kZV9z
ZXQobmlkLCByZXNlcnZlZF9ub2RlbWFzayk7Cj4gLQl9Cj4gLQo+ICAJLyoKPiAgCSAqIEZpbmFs
bHksIGNsZWFyIHRoZSBNRU1CTE9DS19IT1RQTFVHIGZsYWcgZm9yIGFsbCBtZW1vcnkKPiAgCSAq
IGJlbG9uZ2luZyB0byB0aGUgcmVzZXJ2ZWQgbm9kZSBtYXNrLgo+IC0tIAo+IDIuMjYuMgo+IAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
