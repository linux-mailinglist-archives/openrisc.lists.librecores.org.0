Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B0AF7246099
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8631E20D60;
	Mon, 17 Aug 2020 10:45:41 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 1FFA720CF7
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 16:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595946247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=06rCqpwu1j4S1S47vgUTPXYPKKso17TGQwzOaoYSYfs=;
 b=d4MtWyXFVdfIs8bmNhXyDS+kH3d8JntT7fZihXXdp3duze2F4nVNt/hS5/gIAcUUBfsSyI
 OtmdEuxE12Gp6tAR9wu7V3gXiQ+Gkdnp/UR86zaiXoIce++dVG5AbbGaD/L6x9lrbYrqyY
 uYcVNljIuIKg4I8V6u3rEAcePEiGfNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-XL5fGaBiOsyWEWGpA51xEg-1; Tue, 28 Jul 2020 10:24:02 -0400
X-MC-Unique: XL5fGaBiOsyWEWGpA51xEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B54D1B18BC1;
 Tue, 28 Jul 2020 14:23:54 +0000 (UTC)
Received: from localhost (ovpn-12-117.pek2.redhat.com [10.72.12.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 303B41010427;
 Tue, 28 Jul 2020 14:23:51 +0000 (UTC)
Date: Tue, 28 Jul 2020 22:23:48 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200728142348.GE10792@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
 <20200728141504.GC3655207@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728141504.GC3655207@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

T24gMDcvMjgvMjAgYXQgMDU6MTVwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBPbiBUdWUsIEp1
bCAyOCwgMjAyMCBhdCAwNzowMjo1NFBNICswODAwLCBCYW9xdWFuIEhlIHdyb3RlOgo+ID4gT24g
MDcvMjgvMjAgYXQgMDg6MTFhbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gRnJvbTogTWlr
ZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gPiAKPiA+ID4gbnVtYV9jbGVhcl9r
ZXJuZWxfbm9kZV9ob3RwbHVnKCkgZnVuY3Rpb24gZmlyc3QgdHJhdmVyc2VzIG51bWFfbWVtaW5m
bwo+ID4gPiByZWdpb25zIHRvIHNldCBub2RlIElEIGluIG1lbWJsb2NrLnJlc2VydmVkIGFuZCB0
aGFuIHRyYXZlcnNlcwo+ID4gPiBtZW1ibG9jay5yZXNlcnZlZCB0byB1cGRhdGUgcmVzZXJ2ZWRf
bm9kZW1hc2sgdG8gaW5jbHVkZSBub2RlIElEcyB0aGF0IHdlcmUKPiA+ID4gc2V0IGluIHRoZSBm
aXJzdCBsb29wLgo+ID4gPiAKPiA+ID4gUmVtb3ZlIHJlZHVuZGFudCB0cmF2ZXJzYWwgb3ZlciBt
ZW1ibG9jay5yZXNlcnZlZCBhbmQgdXBkYXRlCj4gPiA+IHJlc2VydmVkX25vZGVtYXNrIHdoaWxl
IGl0ZXJhdGluZyBvdmVyIG51bWFfbWVtaW5mby4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNo
L3g4Ni9tbS9udW1hLmMgfCAyNiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL251bWEuYyBiL2FyY2gveDg2L21tL251bWEuYwo+
ID4gPiBpbmRleCA4ZWU5NTIwMzhjODAuLjQwNzhhYmQzMzkzOCAxMDA2NDQKPiA+ID4gLS0tIGEv
YXJjaC94ODYvbW0vbnVtYS5jCj4gPiA+ICsrKyBiL2FyY2gveDg2L21tL251bWEuYwo+ID4gPiBA
QCAtNDk4LDMxICs0OTgsMjUgQEAgc3RhdGljIHZvaWQgX19pbml0IG51bWFfY2xlYXJfa2VybmVs
X25vZGVfaG90cGx1Zyh2b2lkKQo+ID4gPiAgCSAqIGFuZCB1c2UgdGhvc2UgcmFuZ2VzIHRvIHNl
dCB0aGUgbmlkIGluIG1lbWJsb2NrLnJlc2VydmVkLgo+ID4gPiAgCSAqIFRoaXMgd2lsbCBzcGxp
dCB1cCB0aGUgbWVtYmxvY2sgcmVnaW9ucyBhbG9uZyBub2RlCj4gPiA+ICAJICogYm91bmRhcmll
cyBhbmQgd2lsbCBzZXQgdGhlIG5vZGUgSURzIGFzIHdlbGwuCj4gPiA+ICsJICoKPiA+ID4gKwkg
KiBUaGUgbmlkIHdpbGwgYWxzbyBiZSBzZXQgaW4gcmVzZXJ2ZWRfbm9kZW1hc2sgd2hpY2ggaXMg
bGF0ZXIKPiA+ID4gKwkgKiB1c2VkIHRvIGNsZWFyIE1FTUJMT0NLX0hPVFBMVUcgZmxhZy4KPiA+
ID4gKwkgKgo+ID4gPiArCSAqIFsgTm90ZSwgd2hlbiBib290aW5nIHdpdGggbWVtPW5uW2tNR10g
b3IgaW4gYSBrZHVtcCBrZXJuZWwsCj4gPiA+ICsJICogICBudW1hX21lbWluZm8gbWlnaHQgbm90
IGluY2x1ZGUgYWxsIG1lbWJsb2NrLnJlc2VydmVkCj4gPiA+ICsJICogICBtZW1vcnkgcmFuZ2Vz
LCBiZWNhdXNlIHF1aXJrcyBzdWNoIGFzIHRyaW1fc25iX21lbW9yeSgpCj4gPiA+ICsJICogICBy
ZXNlcnZlIHNwZWNpZmljIHBhZ2VzIGZvciBTYW5keSBCcmlkZ2UgZ3JhcGhpY3MuCj4gPiA+ICsJ
ICogICBUaGVzZSByYW5nZXMgd2lsbCByZW1haW4gd2l0aCBuaWQgPT0gTUFYX05VTU5PREVTLiBd
Cj4gPiA+ICAJICovCj4gPiA+ICAJZm9yIChpID0gMDsgaSA8IG51bWFfbWVtaW5mby5ucl9ibGtz
OyBpKyspIHsKPiA+ID4gIAkJc3RydWN0IG51bWFfbWVtYmxrICptYiA9IG51bWFfbWVtaW5mby5i
bGsgKyBpOwo+ID4gPiAgCQlpbnQgcmV0Owo+ID4gPiAgCj4gPiA+ICAJCXJldCA9IG1lbWJsb2Nr
X3NldF9ub2RlKG1iLT5zdGFydCwgbWItPmVuZCAtIG1iLT5zdGFydCwgJm1lbWJsb2NrLnJlc2Vy
dmVkLCBtYi0+bmlkKTsKPiA+ID4gKwkJbm9kZV9zZXQobWItPm5pZCwgcmVzZXJ2ZWRfbm9kZW1h
c2spOwo+ID4gCj4gPiBSZWFsbHk/IFRoaXMgd2lsbCBzZXQgYWxsIG5vZGUgaWQgaW50byByZXNl
cnZlZF9ub2RlbWFzay4gQnV0IGluIHRoZQo+ID4gY3VycmVudCBjb2RlLCBpdCdzIHNldHRpbmcg
bmlkIGludG8gbWVtYmxvY2sgcmVzZXJ2ZWQgcmVnaW9uIHdoaWNoCj4gPiBpbnRlcmxlYXZlcyB3
aXRoIG51bWFfbWVtb2luZm8sIHRoZW4gZ2V0IHRob3NlIG5pZCBhbmQgc2V0IGl0IGluCj4gPiBy
ZXNlcnZlZF9ub2RlbWFzay4gVGhpcyBpcyBzbyBkaWZmZXJlbnQsIHdpdGggbXkgdW5kZXJzdGFu
ZGluZy4gUGxlYXNlCj4gPiBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuCj4gCj4gWW91IGFyZSBy
aWdodCwgSSd2ZSBtaXNzZWQgdGhlIGludGVyc2VjdGlvbnMgb2YgbnVtYV9tZW1pbmZvIHdpdGgK
PiBtZW1ibG9jay5yZXNlcnZlZC4KPiAKPiB4ODYgaW50ZXJhY3Rpb24gd2l0aCBtZW1ib2NrIGlz
IHNvLCBobW0sIGludGVyZXN0aW5nLi4uCgpZZWFoLCBudW1hX2NsZWFyX2tlcm5lbF9ub2RlX2hv
dHBsdWcoKSBpbnRlbmRzIHRvIGZpbmQgb3V0IGFueSBtZW1vcnkgbm9kZQp3aGljaCBoYXMgcmVz
ZXJ2ZWQgbWVtb3J5LCB0aGVuIG1ha2UgaXQgYXMgdW5tb3ZhYmxlLiBTZXR0aW5nIGFsbCBub2Rl
CmlkIGludG8gcmVzZXJ2ZWRfbm9kZW1hc2sgd2lsbCBicmVhayB0aGUgdXNlIGNhc2Ugb2YgaG90
IHJlbW92aW5nIGhvdHBsdWdnYWJsZQpib290IG1lbW9yeSBhZnRlciBzeXN0ZW0gYm9vdHVwLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
