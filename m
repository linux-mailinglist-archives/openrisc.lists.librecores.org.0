Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 666B71C05B6
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7936620B29;
	Thu, 30 Apr 2020 21:09:19 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 45C3F20309
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 03:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587604411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2i5M2ycjs3rlosl36wEuRNmxANDiCG1t4SjA8z/n0gs=;
 b=R6e10Uhs5Yo958u1WHMs5QxFhLnIkQrzgv/gqwubCiTzjo+qQv+3rEr6rCO/RKpd1izZEZ
 x24S3n4zFpoI/WXQ1BBxeGzzZrN5KHURQ4sKVx9C6ff9fQ8O0r6OpP0KlGd5TJQDHtOy4n
 oZO2v0B9WoclAwf1F2826RhcInHgPBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-BEzLYa-fNc2wMeSdUgUC6Q-1; Wed, 22 Apr 2020 21:13:30 -0400
X-MC-Unique: BEzLYa-fNc2wMeSdUgUC6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55EDD8017F3;
 Thu, 23 Apr 2020 01:13:23 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 820715D706;
 Thu, 23 Apr 2020 01:13:15 +0000 (UTC)
Date: Thu, 23 Apr 2020 09:13:12 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200423011312.GY4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-17-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDQvMTIvMjAgYXQgMTA6NDhwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIGNvbW1pdCBmNDdhYzA4OGM0
MDYgKCJtbTogbWVtbWFwX2luaXQ6IGl0ZXJhdGUgb3ZlciBtZW1ibG9jayByZWdpb25zCgpUaGlz
IGNvbW1pdCBpZCBzaG91bGQgYmUgYSB0ZW1wb3Jhcnkgb25lLCB3aWxsIGJlIGNoYW5nZWQgd2hl
biBtZXJnZWQKaW50byBtYWludGFpbmVyJ3MgdHJlZSBhbmQgbGludXMncyB0cmVlLiBPbmx5IHNh
eWluZyBsYXN0IHBhdGNoIHBsdXMgdGhlCnBhdGNoIHN1YmplY3QgaXMgT0s/Cgo+IHJhdGhlciB0
aGF0IGNoZWNrIGVhY2ggUEZOIikgbWFkZSBlYXJseV9wZm5faW5fbmlkKCkgb2Jzb2xldGUgYW5k
IHNpbmNlCj4gQ09ORklHX05PREVTX1NQQU5fT1RIRVJfTk9ERVMgaXMgb25seSB1c2VkIHRvIHBp
Y2sgYSBzdHViIG9yIGEgcmVhbAo+IGltcGxlbWVudGF0aW9uIG9mIGVhcmx5X3Bmbl9pbl9uaWQo
KSBpdCBpcyBhbHNvIG5vdCBuZWVkZWQgYW55bW9yZS4KPiAKPiBSZW1vdmUgYm90aCBlYXJseV9w
Zm5faW5fbmlkKCkgYW5kIHRoZSBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUy4KPiAKPiBD
by1kZXZlbG9wZWQtYnk6IEhvYW4gVHJhbiA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEhvYW4gVHJhbiA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiAtLS0K
PiAgYXJjaC9wb3dlcnBjL0tjb25maWcgfCAgOSAtLS0tLS0tLS0KPiAgYXJjaC9zcGFyYy9LY29u
ZmlnICAgfCAgOSAtLS0tLS0tLS0KPiAgYXJjaC94ODYvS2NvbmZpZyAgICAgfCAgOSAtLS0tLS0t
LS0KPiAgbW0vcGFnZV9hbGxvYy5jICAgICAgfCAyMCAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICA0
IGZpbGVzIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gaW5kZXggNWY4NmIyMmI3ZDJj
Li43NGYzMTZkZWVhZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKPiArKysg
Yi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+IEBAIC02ODUsMTUgKzY4NSw2IEBAIGNvbmZpZyBBUkNI
X01FTU9SWV9QUk9CRQo+ICAJZGVmX2Jvb2wgeQo+ICAJZGVwZW5kcyBvbiBNRU1PUllfSE9UUExV
Rwo+ICAKPiAtIyBTb21lIE5VTUEgbm9kZXMgaGF2ZSBtZW1vcnkgcmFuZ2VzIHRoYXQgc3Bhbgo+
IC0jIG90aGVyIG5vZGVzLiAgRXZlbiB0aG91Z2ggYSBwZm4gaXMgdmFsaWQgYW5kCj4gLSMgYmV0
d2VlbiBhIG5vZGUncyBzdGFydCBhbmQgZW5kIHBmbnMsIGl0IG1heSBub3QKPiAtIyByZXNpZGUg
b24gdGhhdCBub2RlLiAgU2VlIG1lbW1hcF9pbml0X3pvbmUoKQo+IC0jIGZvciBkZXRhaWxzLgo+
IC1jb25maWcgTk9ERVNfU1BBTl9PVEhFUl9OT0RFUwo+IC0JZGVmX2Jvb2wgeQo+IC0JZGVwZW5k
cyBvbiBORUVEX01VTFRJUExFX05PREVTCj4gLQo+ICBjb25maWcgU1REQklOVVRJTFMKPiAgCWJv
b2wgIlVzaW5nIHN0YW5kYXJkIGJpbnV0aWxzIHNldHRpbmdzIgo+ICAJZGVwZW5kcyBvbiA0NHgK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9LY29uZmlnIGIvYXJjaC9zcGFyYy9LY29uZmlnCj4g
aW5kZXggNzk1MjA2YjdiNTUyLi4wZTRmMzg5MWI5MDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zcGFy
Yy9LY29uZmlnCj4gKysrIGIvYXJjaC9zcGFyYy9LY29uZmlnCj4gQEAgLTI4NiwxNSArMjg2LDYg
QEAgY29uZmlnIE5PREVTX1NISUZUCj4gIAkgIFNwZWNpZnkgdGhlIG1heGltdW0gbnVtYmVyIG9m
IE5VTUEgTm9kZXMgYXZhaWxhYmxlIG9uIHRoZSB0YXJnZXQKPiAgCSAgc3lzdGVtLiAgSW5jcmVh
c2VzIG1lbW9yeSByZXNlcnZlZCB0byBhY2NvbW1vZGF0ZSB2YXJpb3VzIHRhYmxlcy4KPiAgCj4g
LSMgU29tZSBOVU1BIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0aGF0IHNwYW4KPiAtIyBvdGhl
ciBub2Rlcy4gIEV2ZW4gdGhvdWdoIGEgcGZuIGlzIHZhbGlkIGFuZAo+IC0jIGJldHdlZW4gYSBu
b2RlJ3Mgc3RhcnQgYW5kIGVuZCBwZm5zLCBpdCBtYXkgbm90Cj4gLSMgcmVzaWRlIG9uIHRoYXQg
bm9kZS4gIFNlZSBtZW1tYXBfaW5pdF96b25lKCkKPiAtIyBmb3IgZGV0YWlscy4KPiAtY29uZmln
IE5PREVTX1NQQU5fT1RIRVJfTk9ERVMKPiAtCWRlZl9ib29sIHkKPiAtCWRlcGVuZHMgb24gTkVF
RF9NVUxUSVBMRV9OT0RFUwo+IC0KPiAgY29uZmlnIEFSQ0hfU1BBUlNFTUVNX0VOQUJMRQo+ICAJ
ZGVmX2Jvb2wgeSBpZiBTUEFSQzY0Cj4gIAlzZWxlY3QgU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxF
Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4gaW5k
ZXggOWQzZTk1YjRmYjg1Li4zN2RhYzA5NTY1OWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvS2Nv
bmZpZwo+ICsrKyBiL2FyY2gveDg2L0tjb25maWcKPiBAQCAtMTU4MSwxNSArMTU4MSw2IEBAIGNv
bmZpZyBYODZfNjRfQUNQSV9OVU1BCj4gIAktLS1oZWxwLS0tCj4gIAkgIEVuYWJsZSBBQ1BJIFNS
QVQgYmFzZWQgbm9kZSB0b3BvbG9neSBkZXRlY3Rpb24uCj4gIAo+IC0jIFNvbWUgTlVNQSBub2Rl
cyBoYXZlIG1lbW9yeSByYW5nZXMgdGhhdCBzcGFuCj4gLSMgb3RoZXIgbm9kZXMuICBFdmVuIHRo
b3VnaCBhIHBmbiBpcyB2YWxpZCBhbmQKPiAtIyBiZXR3ZWVuIGEgbm9kZSdzIHN0YXJ0IGFuZCBl
bmQgcGZucywgaXQgbWF5IG5vdAo+IC0jIHJlc2lkZSBvbiB0aGF0IG5vZGUuICBTZWUgbWVtbWFw
X2luaXRfem9uZSgpCj4gLSMgZm9yIGRldGFpbHMuCj4gLWNvbmZpZyBOT0RFU19TUEFOX09USEVS
X05PREVTCj4gLQlkZWZfYm9vbCB5Cj4gLQlkZXBlbmRzIG9uIFg4Nl82NF9BQ1BJX05VTUEKPiAt
Cj4gIGNvbmZpZyBOVU1BX0VNVQo+ICAJYm9vbCAiTlVNQSBlbXVsYXRpb24iCj4gIAlkZXBlbmRz
IG9uIE5VTUEKPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5j
Cj4gaW5kZXggYzQzY2U4NzA5NDU3Li4zNDNkODdiODY5N2QgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFn
ZV9hbGxvYy5jCj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAgLTE1NDEsMjYgKzE1NDEsNiBA
QCBpbnQgX19tZW1pbml0IGVhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4pCj4gIH0K
PiAgI2VuZGlmIC8qIENPTkZJR19ORUVEX01VTFRJUExFX05PREVTICovCj4gIAo+IC0jaWZkZWYg
Q09ORklHX05PREVTX1NQQU5fT1RIRVJfTk9ERVMKPiAtLyogT25seSBzYWZlIHRvIHVzZSBlYXJs
eSBpbiBib290IHdoZW4gaW5pdGlhbGlzYXRpb24gaXMgc2luZ2xlLXRocmVhZGVkICovCj4gLXN0
YXRpYyBpbmxpbmUgYm9vbCBfX21lbWluaXQgZWFybHlfcGZuX2luX25pZCh1bnNpZ25lZCBsb25n
IHBmbiwgaW50IG5vZGUpCj4gLXsKPiAtCWludCBuaWQ7Cj4gLQo+IC0JbmlkID0gX19lYXJseV9w
Zm5fdG9fbmlkKHBmbiwgJmVhcmx5X3Bmbm5pZF9jYWNoZSk7Cj4gLQlpZiAobmlkID49IDAgJiYg
bmlkICE9IG5vZGUpCj4gLQkJcmV0dXJuIGZhbHNlOwo+IC0JcmV0dXJuIHRydWU7Cj4gLX0KPiAt
Cj4gLSNlbHNlCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBfX21lbWluaXQgZWFybHlfcGZuX2luX25p
ZCh1bnNpZ25lZCBsb25nIHBmbiwgaW50IG5vZGUpCj4gLXsKPiAtCXJldHVybiB0cnVlOwo+IC19
Cj4gLSNlbmRpZgoKQW5kIG1hY3JvIGVhcmx5X3Bmbl92YWxpZCgpIGlzIG5vdCBuZWVkZWQgZWl0
aGVyLCB3ZSBtYXkgbmVlZCByZW1vdmUgaXQKdG9vLiAKCk90aGVyd2lzZSwgcmVtb3ZpbmcgTk9E
RVNfU1BBTl9PVEhFUl9OT0RFUyBpbiB0aGlzIHBhdGNoIGxvb2tzIGdvb2QuCgpSZXZpZXdlZC1i
eTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cgo+IC0KPiAtCj4gIHZvaWQgX19pbml0IG1l
bWJsb2NrX2ZyZWVfcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgcGZuLAo+
ICAJCQkJCQkJdW5zaWduZWQgaW50IG9yZGVyKQo+ICB7Cj4gLS0gCj4gMi4yNS4xCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
