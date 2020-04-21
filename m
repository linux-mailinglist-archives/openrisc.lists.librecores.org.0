Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AAE921B20D0
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 80C0120B1C;
	Tue, 21 Apr 2020 10:02:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id 8139B20708
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 04:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587434782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NeOgQkZsDdoMNz10q5IMbsxGpqUOFvMFdq6FjujHkZg=;
 b=SaCdoY7l299J9vjZ35BwGG6/62d0fDj48GmbWnFzq8cbXVK4pHkiJuhl7lc0OPUUtZ54GO
 jZsHZi8lSDwXNHAQqfQ+G8D8qG2Cn4EccagjrkE1Z3kjpxURi9+h1QfMVrCG6VEqWrhKGf
 Ke73MnEvD7BL9e0prQg4TkD4PfLzWgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-MsTbvPRrM-CWA6xKfn_0bw-1; Mon, 20 Apr 2020 22:06:20 -0400
X-MC-Unique: MsTbvPRrM-CWA6xKfn_0bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E29813FE;
 Tue, 21 Apr 2020 02:06:14 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9AE6A18A0;
 Tue, 21 Apr 2020 02:06:05 +0000 (UTC)
Date: Tue, 21 Apr 2020 10:06:03 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200421020603.GO4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-2-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-2-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: Re: [OpenRISC] [PATCH 01/21] mm: memblock: replace dereferences of
 memblock_region.nid with API calls
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlcmUgYXJlIHNldmVyYWwgcGxh
Y2VzIGluIHRoZSBjb2RlIHRoYXQgZGlyZWN0bHkgZGVyZWZlcmVuY2UKPiBtZW1ibG9ja19yZWdp
b24ubmlkIGRlc3BpdGUgdGhpcyBmaWVsZCBiZWluZyBkZWZpbmVkIG9ubHkgd2hlbgo+IENPTkZJ
R19IQVZFX01FTUJMT0NLX05PREVfTUFQPXkuCj4gCj4gUmVwbGFjZSB0aGVzZSB3aXRoIGNhbGxz
IHRvIG1lbWJsb2NrX2dldF9yZWdpb25fbmlkKCkgdG8gaW1wcm92ZSBjb2RlCj4gcm9idXN0bmVz
cyBhbmQgdG8gYXZvaWQgcG9zc2libGUgYnJlYWthZ2Ugd2hlbgo+IENPTkZJR19IQVZFX01FTUJM
T0NLX05PREVfTUFQIHdpbGwgYmUgcmVtb3ZlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvbW0vbnVtYS5j
IHwgOSArKysrKystLS0KPiAgYXJjaC94ODYvbW0vbnVtYS5jICAgfCA2ICsrKystLQo+ICBtbS9t
ZW1ibG9jay5jICAgICAgICB8IDggKysrKystLS0KPiAgbW0vcGFnZV9hbGxvYy5jICAgICAgfCA0
ICsrLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1hLmMgYi9hcmNoL2FybTY0L21t
L251bWEuYwo+IGluZGV4IDRkZWNmMTY1OTcwMC4uYWFmY2VlM2UzZjdlIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gKysrIGIvYXJjaC9hcm02NC9tbS9udW1hLmMKPiBAQCAt
MzUwLDEzICszNTAsMTYgQEAgc3RhdGljIGludCBfX2luaXQgbnVtYV9yZWdpc3Rlcl9ub2Rlcyh2
b2lkKQo+ICAJc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqbWJsazsKPiAgCj4gIAkvKiBDaGVjayB0
aGF0IHZhbGlkIG5pZCBpcyBzZXQgdG8gbWVtYmxrcyAqLwo+IC0JZm9yX2VhY2hfbWVtYmxvY2so
bWVtb3J5LCBtYmxrKQo+IC0JCWlmIChtYmxrLT5uaWQgPT0gTlVNQV9OT19OT0RFIHx8IG1ibGst
Pm5pZCA+PSBNQVhfTlVNTk9ERVMpIHsKPiArCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgbWJs
aykgewo+ICsJCWludCBtYmxrX25pZCA9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZShtYmxrKTsK
PiArCj4gKwkJaWYgKG1ibGtfbmlkID09IE5VTUFfTk9fTk9ERSB8fCBtYmxrX25pZCA+PSBNQVhf
TlVNTk9ERVMpIHsKPiAgCQkJcHJfd2FybigiV2FybmluZzogaW52YWxpZCBtZW1ibGsgbm9kZSAl
ZCBbbWVtICUjMDEwTHgtJSMwMTBMeF1cbiIsCj4gLQkJCQltYmxrLT5uaWQsIG1ibGstPmJhc2Us
Cj4gKwkJCQltYmxrX25pZCwgbWJsay0+YmFzZSwKPiAgCQkJCW1ibGstPmJhc2UgKyBtYmxrLT5z
aXplIC0gMSk7Cj4gIAkJCXJldHVybiAtRUlOVkFMOwo+ICAJCX0KPiArCX0KPiAgCj4gIAkvKiBG
aW5hbGx5IHJlZ2lzdGVyIG5vZGVzLiAqLwo+ICAJZm9yX2VhY2hfbm9kZV9tYXNrKG5pZCwgbnVt
YV9ub2Rlc19wYXJzZWQpIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0vbnVtYS5jIGIvYXJj
aC94ODYvbW0vbnVtYS5jCj4gaW5kZXggNTliYTAwODUwNGRjLi5mZTAyNGIyYWM3OTYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC94ODYvbW0vbnVtYS5jCj4gKysrIGIvYXJjaC94ODYvbW0vbnVtYS5jCj4g
QEAgLTUxNyw4ICs1MTcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IG51bWFfY2xlYXJfa2VybmVs
X25vZGVfaG90cGx1Zyh2b2lkKQo+ICAJICogICByZXNlcnZlIHNwZWNpZmljIHBhZ2VzIGZvciBT
YW5keSBCcmlkZ2UgZ3JhcGhpY3MuIF0KPiAgCSAqLwo+ICAJZm9yX2VhY2hfbWVtYmxvY2socmVz
ZXJ2ZWQsIG1iX3JlZ2lvbikgewo+IC0JCWlmIChtYl9yZWdpb24tPm5pZCAhPSBNQVhfTlVNTk9E
RVMpCj4gLQkJCW5vZGVfc2V0KG1iX3JlZ2lvbi0+bmlkLCByZXNlcnZlZF9ub2RlbWFzayk7Cj4g
KwkJaW50IG5pZCA9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZShtYl9yZWdpb24pOwo+ICsKPiAr
CQlpZiAobmlkICE9IE1BWF9OVU1OT0RFUykKPiArCQkJbm9kZV9zZXQobmlkLCByZXNlcnZlZF9u
b2RlbWFzayk7Cj4gIAl9Cj4gIAo+ICAJLyoKPiBkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBi
L21tL21lbWJsb2NrLmMKPiBpbmRleCBjNzliYTZmOTkyMGMuLjQzZTJmZDMwMDZjMSAxMDA2NDQK
PiAtLS0gYS9tbS9tZW1ibG9jay5jCj4gKysrIGIvbW0vbWVtYmxvY2suYwo+IEBAIC0xMjA3LDEz
ICsxMjA3LDE1IEBAIHZvaWQgX19pbml0X21lbWJsb2NrIF9fbmV4dF9tZW1fcGZuX3JhbmdlKGlu
dCAqaWR4LCBpbnQgbmlkLAo+ICB7Cj4gIAlzdHJ1Y3QgbWVtYmxvY2tfdHlwZSAqdHlwZSA9ICZt
ZW1ibG9jay5tZW1vcnk7Cj4gIAlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyOwo+ICsJaW50IHJf
bmlkOwo+ICAKPiAgCXdoaWxlICgrKyppZHggPCB0eXBlLT5jbnQpIHsKPiAgCQlyID0gJnR5cGUt
PnJlZ2lvbnNbKmlkeF07Cj4gKwkJcl9uaWQgPSBtZW1ibG9ja19nZXRfcmVnaW9uX25vZGUocik7
Cj4gIAo+ICAJCWlmIChQRk5fVVAoci0+YmFzZSkgPj0gUEZOX0RPV04oci0+YmFzZSArIHItPnNp
emUpKQo+ICAJCQljb250aW51ZTsKPiAtCQlpZiAobmlkID09IE1BWF9OVU1OT0RFUyB8fCBuaWQg
PT0gci0+bmlkKQo+ICsJCWlmIChuaWQgPT0gTUFYX05VTU5PREVTIHx8IG5pZCA9PSByX25pZCkK
PiAgCQkJYnJlYWs7Cj4gIAl9Cj4gIAlpZiAoKmlkeCA+PSB0eXBlLT5jbnQpIHsKPiBAQCAtMTIy
Niw3ICsxMjI4LDcgQEAgdm9pZCBfX2luaXRfbWVtYmxvY2sgX19uZXh0X21lbV9wZm5fcmFuZ2Uo
aW50ICppZHgsIGludCBuaWQsCj4gIAlpZiAob3V0X2VuZF9wZm4pCj4gIAkJKm91dF9lbmRfcGZu
ID0gUEZOX0RPV04oci0+YmFzZSArIHItPnNpemUpOwo+ICAJaWYgKG91dF9uaWQpCj4gLQkJKm91
dF9uaWQgPSByLT5uaWQ7Cj4gKwkJKm91dF9uaWQgPSByX25pZDsKPiAgfQo+ICAKPiAgLyoqCj4g
QEAgLTE4MTAsNyArMTgxMiw3IEBAIGludCBfX2luaXRfbWVtYmxvY2sgbWVtYmxvY2tfc2VhcmNo
X3Bmbl9uaWQodW5zaWduZWQgbG9uZyBwZm4sCj4gIAkqc3RhcnRfcGZuID0gUEZOX0RPV04odHlw
ZS0+cmVnaW9uc1ttaWRdLmJhc2UpOwo+ICAJKmVuZF9wZm4gPSBQRk5fRE9XTih0eXBlLT5yZWdp
b25zW21pZF0uYmFzZSArIHR5cGUtPnJlZ2lvbnNbbWlkXS5zaXplKTsKPiAgCj4gLQlyZXR1cm4g
dHlwZS0+cmVnaW9uc1ttaWRdLm5pZDsKPiArCXJldHVybiBtZW1ibG9ja19nZXRfcmVnaW9uX25v
ZGUoJnR5cGUtPnJlZ2lvbnNbbWlkXSk7Cj4gIH0KPiAgI2VuZGlmCj4gIAo+IGRpZmYgLS1naXQg
YS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBpbmRleCA2OTgyN2Q0ZmEwNTIu
LjBkMDEyZWRhMTY5NCAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysgYi9tbS9w
YWdlX2FsbG9jLmMKPiBAQCAtNzIwOCw3ICs3MjA4LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGZp
bmRfem9uZV9tb3ZhYmxlX3BmbnNfZm9yX25vZGVzKHZvaWQpCj4gIAkJCWlmICghbWVtYmxvY2tf
aXNfaG90cGx1Z2dhYmxlKHIpKQo+ICAJCQkJY29udGludWU7Cj4gIAo+IC0JCQluaWQgPSByLT5u
aWQ7Cj4gKwkJCW5pZCA9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZShyKTsKPiAgCj4gIAkJCXVz
YWJsZV9zdGFydHBmbiA9IFBGTl9ET1dOKHItPmJhc2UpOwo+ICAJCQl6b25lX21vdmFibGVfcGZu
W25pZF0gPSB6b25lX21vdmFibGVfcGZuW25pZF0gPwo+IEBAIC03MjI5LDcgKzcyMjksNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgZmluZF96b25lX21vdmFibGVfcGZuc19mb3Jfbm9kZXModm9pZCkK
PiAgCQkJaWYgKG1lbWJsb2NrX2lzX21pcnJvcihyKSkKPiAgCQkJCWNvbnRpbnVlOwo+ICAKPiAt
CQkJbmlkID0gci0+bmlkOwo+ICsJCQluaWQgPSBtZW1ibG9ja19nZXRfcmVnaW9uX25vZGUocik7
Cj4gIAo+ICAJCQl1c2FibGVfc3RhcnRwZm4gPSBtZW1ibG9ja19yZWdpb25fbWVtb3J5X2Jhc2Vf
cGZuKHIpOwoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVA
cmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
