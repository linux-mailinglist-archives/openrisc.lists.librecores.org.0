Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B29D01B20D2
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8C57B20B4D;
	Tue, 21 Apr 2020 10:02:10 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id F0EFC202F6
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 05:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587439893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6ayHxPbaOI5Fcwe26HcjPMTYNR5WARmXXyKaOmZqFE=;
 b=c15kJ28gFL4J9Tqsr5K61ZY0L5YVlv+ZPZmTYl0trBtfzZurOVbjTLduapAfO9KtPjDg/R
 Cwb5V9u8FGv76tJ5Iwwge9vCx1PKBh6e397utqI/zfpw/FEc7oFTliJtSIdTctQRTRTYYM
 nUW5lbUHDG9DMOGkg6MiYG2GjgZmuUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-BiPXbTKWPV-aZttl4iUkcg-1; Mon, 20 Apr 2020 23:31:29 -0400
X-MC-Unique: BiPXbTKWPV-aZttl4iUkcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806271005509;
 Tue, 21 Apr 2020 03:31:22 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 088171001B09;
 Tue, 21 Apr 2020 03:31:17 +0000 (UTC)
Date: Tue, 21 Apr 2020 11:31:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200421033114.GA29658@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-3-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: Re: [OpenRISC] [PATCH 02/21] mm: make early_pfn_to_nid() and
 related defintions close to each other
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIGVhcmx5X3Bmbl90b19uaWQo
KSBhbmQgaXQncyBoZWxwZXIgX19lYXJseV9wZm5fdG9fbmlkKCkgYXJlIHNwcmVhZAo+IGFyb3Vu
ZCBpbmNsdWRlL2xpbnV4L21tLmgsIGluY2x1ZGUvbGludXgvbW16b25lLmggYW5kIG1tL3BhZ2Vf
YWxsb2MuYy4KPiAKPiBEcm9wIHVudXNlZCBzdHViIGZvciBfX2Vhcmx5X3Bmbl90b19uaWQoKSBh
bmQgbW92ZSBpdHMgYWN0dWFsIGdlbmVyaWMKPiBpbXBsZW1lbnRhdGlvbiBjbG9zZSB0byBpdHMg
dXNlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0u
Y29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggICAgIHwgIDQgKystLQo+ICBpbmNsdWRl
L2xpbnV4L21tem9uZS5oIHwgIDkgLS0tLS0tLS0KPiAgbW0vcGFnZV9hbGxvYy5jICAgICAgICB8
IDUxICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCA1YTMy
MzQyMmQ3ODMuLmE0MDQwMjZkMTRkNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBAQCAtMjM4OCw5ICsyMzg4LDkgQEAgZXh0ZXJu
IHZvaWQgc3BhcnNlX21lbW9yeV9wcmVzZW50X3dpdGhfYWN0aXZlX3JlZ2lvbnMoaW50IG5pZCk7
Cj4gIAo+ICAjaWYgIWRlZmluZWQoQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVApICYmIFwK
PiAgICAgICFkZWZpbmVkKENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZOX1RPX05JRCkKPiAtc3Rh
dGljIGlubGluZSBpbnQgX19lYXJseV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuLAo+IC0J
CQkJCXN0cnVjdCBtbWluaXRfcGZubmlkX2NhY2hlICpzdGF0ZSkKPiArc3RhdGljIGlubGluZSBp
bnQgZWFybHlfcGZuX3RvX25pZCh1bnNpZ25lZCBsb25nIHBmbikKPiAgewo+ICsJQlVJTERfQlVH
X09OKElTX0VOQUJMRUQoQ09ORklHX05VTUEpKTsKPiAgCXJldHVybiAwOwo+ICB9Cj4gICNlbHNl
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW16b25lLmggYi9pbmNsdWRlL2xpbnV4L21t
em9uZS5oCj4gaW5kZXggMWI5ZGU3ZDIyMGZiLi43YjViNmViYTQwMmYgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9saW51eC9tbXpvbmUuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW16b25lLmgKPiBA
QCAtMTA3OCwxNSArMTA3OCw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHpvbmVyZWYgKmZpcnN0
X3pvbmVzX3pvbmVsaXN0KHN0cnVjdCB6b25lbGlzdCAqem9uZWxpc3QsCj4gICNpbmNsdWRlIDxh
c20vc3BhcnNlbWVtLmg+Cj4gICNlbmRpZgo+ICAKPiAtI2lmICFkZWZpbmVkKENPTkZJR19IQVZF
X0FSQ0hfRUFSTFlfUEZOX1RPX05JRCkgJiYgXAo+IC0JIWRlZmluZWQoQ09ORklHX0hBVkVfTUVN
QkxPQ0tfTk9ERV9NQVApCj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBlYXJseV9wZm5f
dG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuKQo+IC17Cj4gLQlCVUlMRF9CVUdfT04oSVNfRU5BQkxF
RChDT05GSUdfTlVNQSkpOwo+IC0JcmV0dXJuIDA7Cj4gLX0KPiAtI2VuZGlmCj4gLQo+ICAjaWZk
ZWYgQ09ORklHX0ZMQVRNRU0KPiAgI2RlZmluZSBwZm5fdG9fbmlkKHBmbikJCSgwKQo+ICAjZW5k
aWYKPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5k
ZXggMGQwMTJlZGExNjk0Li4xYWM3NzViZmM5Y2YgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxv
Yy5jCj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAgLTE1MDQsNiArMTUwNCwzMSBAQCB2b2lk
IF9fZnJlZV9wYWdlc19jb3JlKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQgb3JkZXIp
Cj4gIAo+ICBzdGF0aWMgc3RydWN0IG1taW5pdF9wZm5uaWRfY2FjaGUgZWFybHlfcGZubmlkX2Nh
Y2hlIF9fbWVtaW5pdGRhdGE7Cj4gIAo+ICsjaWZuZGVmIENPTkZJR19IQVZFX0FSQ0hfRUFSTFlf
UEZOX1RPX05JRAo+ICsKPiArLyoKPiArICogUmVxdWlyZWQgYnkgU1BBUlNFTUVNLiBHaXZlbiBh
IFBGTiwgcmV0dXJuIHdoYXQgbm9kZSB0aGUgUEZOIGlzIG9uLgo+ICsgKi8KPiAraW50IF9fbWVt
aW5pdCBfX2Vhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4sCj4gKwkJCQkJc3RydWN0
IG1taW5pdF9wZm5uaWRfY2FjaGUgKnN0YXRlKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25nIHN0YXJ0
X3BmbiwgZW5kX3BmbjsKPiArCWludCBuaWQ7Cj4gKwo+ICsJaWYgKHN0YXRlLT5sYXN0X3N0YXJ0
IDw9IHBmbiAmJiBwZm4gPCBzdGF0ZS0+bGFzdF9lbmQpCj4gKwkJcmV0dXJuIHN0YXRlLT5sYXN0
X25pZDsKPiArCj4gKwluaWQgPSBtZW1ibG9ja19zZWFyY2hfcGZuX25pZChwZm4sICZzdGFydF9w
Zm4sICZlbmRfcGZuKTsKPiArCWlmIChuaWQgIT0gTlVNQV9OT19OT0RFKSB7Cj4gKwkJc3RhdGUt
Pmxhc3Rfc3RhcnQgPSBzdGFydF9wZm47Cj4gKwkJc3RhdGUtPmxhc3RfZW5kID0gZW5kX3BmbjsK
PiArCQlzdGF0ZS0+bGFzdF9uaWQgPSBuaWQ7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIG5pZDsKPiAr
fQo+ICsjZW5kaWYgLyogQ09ORklHX0hBVkVfQVJDSF9FQVJMWV9QRk5fVE9fTklEICovCj4gKwo+
ICBpbnQgX19tZW1pbml0IGVhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4pCj4gIHsK
PiAgCXN0YXRpYyBERUZJTkVfU1BJTkxPQ0soZWFybHlfcGZuX2xvY2spOwo+IEBAIC02Mjk4LDMy
ICs2MzIzLDYgQEAgdm9pZCBfX21lbWluaXQgaW5pdF9jdXJyZW50bHlfZW1wdHlfem9uZShzdHJ1
Y3Qgem9uZSAqem9uZSwKPiAgCXpvbmUtPmluaXRpYWxpemVkID0gMTsKPiAgfQo+ICAKPiAtI2lm
ZGVmIENPTkZJR19IQVZFX01FTUJMT0NLX05PREVfTUFQCgpIZXJlIGl0J3MgYXBwYXJlbnRseSBy
ZW1vdmluZyBDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUCB0b28gZWFybHksCml0IHNob3Vs
ZCBiZSBkb25lIGluIHBhdGNoIDMsIGFuZCBpdHMgI2VuZCBpcyBrZXB0IHRoZXJlLiBJIGp1c3Qg
Zm91bmQKaXQgd2hlbiBJIGFsbW9zdCBiZWNhbWUgZGl6enkgaW4gcmV2aWV3aW5nIHBhdGNoIDMu
Cgo+IC0jaWZuZGVmIENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZOX1RPX05JRAo+IC0KPiAtLyoK
PiAtICogUmVxdWlyZWQgYnkgU1BBUlNFTUVNLiBHaXZlbiBhIFBGTiwgcmV0dXJuIHdoYXQgbm9k
ZSB0aGUgUEZOIGlzIG9uLgo+IC0gKi8KPiAtaW50IF9fbWVtaW5pdCBfX2Vhcmx5X3Bmbl90b19u
aWQodW5zaWduZWQgbG9uZyBwZm4sCj4gLQkJCQkJc3RydWN0IG1taW5pdF9wZm5uaWRfY2FjaGUg
KnN0YXRlKQo+IC17Cj4gLQl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKPiAtCWlu
dCBuaWQ7Cj4gLQo+IC0JaWYgKHN0YXRlLT5sYXN0X3N0YXJ0IDw9IHBmbiAmJiBwZm4gPCBzdGF0
ZS0+bGFzdF9lbmQpCj4gLQkJcmV0dXJuIHN0YXRlLT5sYXN0X25pZDsKPiAtCj4gLQluaWQgPSBt
ZW1ibG9ja19zZWFyY2hfcGZuX25pZChwZm4sICZzdGFydF9wZm4sICZlbmRfcGZuKTsKPiAtCWlm
IChuaWQgIT0gTlVNQV9OT19OT0RFKSB7Cj4gLQkJc3RhdGUtPmxhc3Rfc3RhcnQgPSBzdGFydF9w
Zm47Cj4gLQkJc3RhdGUtPmxhc3RfZW5kID0gZW5kX3BmbjsKPiAtCQlzdGF0ZS0+bGFzdF9uaWQg
PSBuaWQ7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuIG5pZDsKPiAtfQo+IC0jZW5kaWYgLyogQ09ORklH
X0hBVkVfQVJDSF9FQVJMWV9QRk5fVE9fTklEICovCj4gLQo+ICAvKioKPiAgICogZnJlZV9ib290
bWVtX3dpdGhfYWN0aXZlX3JlZ2lvbnMgLSBDYWxsIG1lbWJsb2NrX2ZyZWVfZWFybHlfbmlkIGZv
ciBlYWNoIGFjdGl2ZSByYW5nZQo+ICAgKiBAbmlkOiBUaGUgbm9kZSB0byBmcmVlIG1lbW9yeSBv
bi4gSWYgTUFYX05VTU5PREVTLCBhbGwgbm9kZXMgYXJlIGZyZWVkLgo+IC0tIAo+IDIuMjUuMQo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
