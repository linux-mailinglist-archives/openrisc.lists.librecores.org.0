Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5882460C0
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 043C820E65;
	Mon, 17 Aug 2020 10:46:25 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id D7B4220D0C
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 16:15:21 +0200 (CEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BC04206F5;
 Tue, 28 Jul 2020 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595945719;
 bh=lUPY2x+FC7QKHEsbHiDvmWaDq+mpMmmwkd+OggYom1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgGc4X7YUZ1ckDx2DS7TV0wJ9kprJKWkAHEon+OMgHl2R1sb+tkMTAcVnCBfWfbCy
 0OtC+wiVDREvJNkkA1XcIE7jDME0kzNs1q63GPOaIsM59WTD15P6atSjYRp+nh+npo
 fGSf3gFWEKzBxONEs1GYYDPsR5qUaUEQHRNOUSzo=
Date: Tue, 28 Jul 2020 17:15:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Message-ID: <20200728141504.GC3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728110254.GA14854@MiWiFi-R3L-srv>
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

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDc6MDI6NTRQTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNy8yOC8yMCBhdCAwODoxMWFtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBudW1hX2NsZWFy
X2tlcm5lbF9ub2RlX2hvdHBsdWcoKSBmdW5jdGlvbiBmaXJzdCB0cmF2ZXJzZXMgbnVtYV9tZW1p
bmZvCj4gPiByZWdpb25zIHRvIHNldCBub2RlIElEIGluIG1lbWJsb2NrLnJlc2VydmVkIGFuZCB0
aGFuIHRyYXZlcnNlcwo+ID4gbWVtYmxvY2sucmVzZXJ2ZWQgdG8gdXBkYXRlIHJlc2VydmVkX25v
ZGVtYXNrIHRvIGluY2x1ZGUgbm9kZSBJRHMgdGhhdCB3ZXJlCj4gPiBzZXQgaW4gdGhlIGZpcnN0
IGxvb3AuCj4gPiAKPiA+IFJlbW92ZSByZWR1bmRhbnQgdHJhdmVyc2FsIG92ZXIgbWVtYmxvY2su
cmVzZXJ2ZWQgYW5kIHVwZGF0ZQo+ID4gcmVzZXJ2ZWRfbm9kZW1hc2sgd2hpbGUgaXRlcmF0aW5n
IG92ZXIgbnVtYV9tZW1pbmZvLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0
IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3g4Ni9tbS9udW1hLmMgfCAy
NiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L21tL251bWEuYyBiL2FyY2gveDg2L21tL251bWEuYwo+ID4gaW5kZXggOGVlOTUyMDM4YzgwLi40
MDc4YWJkMzM5MzggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni9tbS9udW1hLmMKPiA+ICsrKyBi
L2FyY2gveDg2L21tL251bWEuYwo+ID4gQEAgLTQ5OCwzMSArNDk4LDI1IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBudW1hX2NsZWFyX2tlcm5lbF9ub2RlX2hvdHBsdWcodm9pZCkKPiA+ICAJICogYW5k
IHVzZSB0aG9zZSByYW5nZXMgdG8gc2V0IHRoZSBuaWQgaW4gbWVtYmxvY2sucmVzZXJ2ZWQuCj4g
PiAgCSAqIFRoaXMgd2lsbCBzcGxpdCB1cCB0aGUgbWVtYmxvY2sgcmVnaW9ucyBhbG9uZyBub2Rl
Cj4gPiAgCSAqIGJvdW5kYXJpZXMgYW5kIHdpbGwgc2V0IHRoZSBub2RlIElEcyBhcyB3ZWxsLgo+
ID4gKwkgKgo+ID4gKwkgKiBUaGUgbmlkIHdpbGwgYWxzbyBiZSBzZXQgaW4gcmVzZXJ2ZWRfbm9k
ZW1hc2sgd2hpY2ggaXMgbGF0ZXIKPiA+ICsJICogdXNlZCB0byBjbGVhciBNRU1CTE9DS19IT1RQ
TFVHIGZsYWcuCj4gPiArCSAqCj4gPiArCSAqIFsgTm90ZSwgd2hlbiBib290aW5nIHdpdGggbWVt
PW5uW2tNR10gb3IgaW4gYSBrZHVtcCBrZXJuZWwsCj4gPiArCSAqICAgbnVtYV9tZW1pbmZvIG1p
Z2h0IG5vdCBpbmNsdWRlIGFsbCBtZW1ibG9jay5yZXNlcnZlZAo+ID4gKwkgKiAgIG1lbW9yeSBy
YW5nZXMsIGJlY2F1c2UgcXVpcmtzIHN1Y2ggYXMgdHJpbV9zbmJfbWVtb3J5KCkKPiA+ICsJICog
ICByZXNlcnZlIHNwZWNpZmljIHBhZ2VzIGZvciBTYW5keSBCcmlkZ2UgZ3JhcGhpY3MuCj4gPiAr
CSAqICAgVGhlc2UgcmFuZ2VzIHdpbGwgcmVtYWluIHdpdGggbmlkID09IE1BWF9OVU1OT0RFUy4g
XQo+ID4gIAkgKi8KPiA+ICAJZm9yIChpID0gMDsgaSA8IG51bWFfbWVtaW5mby5ucl9ibGtzOyBp
KyspIHsKPiA+ICAJCXN0cnVjdCBudW1hX21lbWJsayAqbWIgPSBudW1hX21lbWluZm8uYmxrICsg
aTsKPiA+ICAJCWludCByZXQ7Cj4gPiAgCj4gPiAgCQlyZXQgPSBtZW1ibG9ja19zZXRfbm9kZSht
Yi0+c3RhcnQsIG1iLT5lbmQgLSBtYi0+c3RhcnQsICZtZW1ibG9jay5yZXNlcnZlZCwgbWItPm5p
ZCk7Cj4gPiArCQlub2RlX3NldChtYi0+bmlkLCByZXNlcnZlZF9ub2RlbWFzayk7Cj4gCj4gUmVh
bGx5PyBUaGlzIHdpbGwgc2V0IGFsbCBub2RlIGlkIGludG8gcmVzZXJ2ZWRfbm9kZW1hc2suIEJ1
dCBpbiB0aGUKPiBjdXJyZW50IGNvZGUsIGl0J3Mgc2V0dGluZyBuaWQgaW50byBtZW1ibG9jayBy
ZXNlcnZlZCByZWdpb24gd2hpY2gKPiBpbnRlcmxlYXZlcyB3aXRoIG51bWFfbWVtb2luZm8sIHRo
ZW4gZ2V0IHRob3NlIG5pZCBhbmQgc2V0IGl0IGluCj4gcmVzZXJ2ZWRfbm9kZW1hc2suIFRoaXMg
aXMgc28gZGlmZmVyZW50LCB3aXRoIG15IHVuZGVyc3RhbmRpbmcuIFBsZWFzZQo+IGNvcnJlY3Qg
bWUgaWYgSSBhbSB3cm9uZy4KCllvdSBhcmUgcmlnaHQsIEkndmUgbWlzc2VkIHRoZSBpbnRlcnNl
Y3Rpb25zIG9mIG51bWFfbWVtaW5mbyB3aXRoCm1lbWJsb2NrLnJlc2VydmVkLgoKeDg2IGludGVy
YWN0aW9uIHdpdGggbWVtYm9jayBpcyBzbywgaG1tLCBpbnRlcmVzdGluZy4uLgogCj4gVGhhbmtz
Cj4gQmFvcXVhbgo+IAo+ID4gIAkJV0FSTl9PTl9PTkNFKHJldCk7Cj4gPiAgCX0KPiA+ICAKPiA+
IC0JLyoKPiA+IC0JICogTm93IGdvIG92ZXIgYWxsIHJlc2VydmVkIG1lbWJsb2NrIHJlZ2lvbnMs
IHRvIGNvbnN0cnVjdCBhCj4gPiAtCSAqIG5vZGUgbWFzayBvZiBhbGwga2VybmVsIHJlc2VydmVk
IG1lbW9yeSBhcmVhcy4KPiA+IC0JICoKPiA+IC0JICogWyBOb3RlLCB3aGVuIGJvb3Rpbmcgd2l0
aCBtZW09bm5ba01HXSBvciBpbiBhIGtkdW1wIGtlcm5lbCwKPiA+IC0JICogICBudW1hX21lbWlu
Zm8gbWlnaHQgbm90IGluY2x1ZGUgYWxsIG1lbWJsb2NrLnJlc2VydmVkCj4gPiAtCSAqICAgbWVt
b3J5IHJhbmdlcywgYmVjYXVzZSBxdWlya3Mgc3VjaCBhcyB0cmltX3NuYl9tZW1vcnkoKQo+ID4g
LQkgKiAgIHJlc2VydmUgc3BlY2lmaWMgcGFnZXMgZm9yIFNhbmR5IEJyaWRnZSBncmFwaGljcy4g
XQo+ID4gLQkgKi8KPiA+IC0JZm9yX2VhY2hfbWVtYmxvY2socmVzZXJ2ZWQsIG1iX3JlZ2lvbikg
ewo+ID4gLQkJaW50IG5pZCA9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZShtYl9yZWdpb24pOwo+
ID4gLQo+ID4gLQkJaWYgKG5pZCAhPSBNQVhfTlVNTk9ERVMpCj4gPiAtCQkJbm9kZV9zZXQobmlk
LCByZXNlcnZlZF9ub2RlbWFzayk7Cj4gPiAtCX0KPiA+IC0KPiA+ICAJLyoKPiA+ICAJICogRmlu
YWxseSwgY2xlYXIgdGhlIE1FTUJMT0NLX0hPVFBMVUcgZmxhZyBmb3IgYWxsIG1lbW9yeQo+ID4g
IAkgKiBiZWxvbmdpbmcgdG8gdGhlIHJlc2VydmVkIG5vZGUgbWFzay4KPiA+IC0tIAo+ID4gMi4y
Ni4yCj4gPiAKPiA+IAo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
