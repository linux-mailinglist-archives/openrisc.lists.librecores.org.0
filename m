Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 837BD1C05CB
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8641120B1D;
	Thu, 30 Apr 2020 21:09:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id B0899202E0
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 10:50:03 +0200 (CEST)
Received: from kernel.org (unknown [87.71.41.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8A7620B1F;
 Tue, 21 Apr 2020 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587459002;
 bh=9AREcPZgTLZoOQNS4HkOJCkkvxOi7Qh0sUZN50XGXA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xtIDLhOks9I+BKS5TYEqFJ9Vfc6A4ZSXltBCpypI67DEgioqz+65m6OacsoeIkbAA
 88yc/lqmFc8Ow2Y9SNd9/Z87ieKFQpgU+8EamCx23Pk7I9SAqDmbfCbYt/WaMhGXv6
 fkQQCkLj5UymWDJxhVN8pD6iX/cTrOoL+hLaJy1Q=
Date: Tue, 21 Apr 2020 11:49:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Message-ID: <20200421084935.GB14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-3-rppt@kernel.org>
 <20200421022435.GP4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421022435.GP4247@MiWiFi-R3L-srv>
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
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

T24gVHVlLCBBcHIgMjEsIDIwMjAgYXQgMTA6MjQ6MzVBTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNC8xMi8yMCBhdCAxMDo0OHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBUaGUgZWFybHlf
cGZuX3RvX25pZCgpIGFuZCBpdCdzIGhlbHBlciBfX2Vhcmx5X3Bmbl90b19uaWQoKSBhcmUgc3By
ZWFkCj4gPiBhcm91bmQgaW5jbHVkZS9saW51eC9tbS5oLCBpbmNsdWRlL2xpbnV4L21tem9uZS5o
IGFuZCBtbS9wYWdlX2FsbG9jLmMuCj4gPiAKPiA+IERyb3AgdW51c2VkIHN0dWIgZm9yIF9fZWFy
bHlfcGZuX3RvX25pZCgpIGFuZCBtb3ZlIGl0cyBhY3R1YWwgZ2VuZXJpYwo+ID4gaW1wbGVtZW50
YXRpb24gY2xvc2UgdG8gaXRzIHVzZXJzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L21t
LmggICAgIHwgIDQgKystLQo+ID4gIGluY2x1ZGUvbGludXgvbW16b25lLmggfCAgOSAtLS0tLS0t
LQo+ID4gIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDM3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
bS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPiBpbmRleCA1YTMyMzQyMmQ3ODMuLmE0MDQwMjZk
MTRkNCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ID4gKysrIGIvaW5jbHVk
ZS9saW51eC9tbS5oCj4gPiBAQCAtMjM4OCw5ICsyMzg4LDkgQEAgZXh0ZXJuIHZvaWQgc3BhcnNl
X21lbW9yeV9wcmVzZW50X3dpdGhfYWN0aXZlX3JlZ2lvbnMoaW50IG5pZCk7Cj4gPiAgCj4gPiAg
I2lmICFkZWZpbmVkKENPTkZJR19IQVZFX01FTUJMT0NLX05PREVfTUFQKSAmJiBcCj4gPiAgICAg
ICFkZWZpbmVkKENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZOX1RPX05JRCkKPiA+IC1zdGF0aWMg
aW5saW5lIGludCBfX2Vhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4sCj4gPiAtCQkJ
CQlzdHJ1Y3QgbW1pbml0X3Bmbm5pZF9jYWNoZSAqc3RhdGUpCj4gPiArc3RhdGljIGlubGluZSBp
bnQgZWFybHlfcGZuX3RvX25pZCh1bnNpZ25lZCBsb25nIHBmbikKPiA+ICB7Cj4gPiArCUJVSUxE
X0JVR19PTihJU19FTkFCTEVEKENPTkZJR19OVU1BKSk7Cj4gPiAgCXJldHVybiAwOwo+ID4gIH0K
PiAKPiBJdCdzIGJldHRlciB0byBtYWtlIGEgc2VwYXJhdGUgcGF0Y2ggdG8gZHJvcCBfX2Vhcmx5
X3Bmbl90b19uaWQoKSBoZXJlLgoKTm90IHN1cmUgaXQncyByZWFsbHkgd29ydGggaXQuClRoaXMg
cGF0Y2ggYW55d2F5IG9ubHkgbW92ZXMgdGhlIGNvZGUgYXJvdW5kIHdpdGhvdXQgYW55IGFjdHVh
bCBjaGFuZ2VzLgoKPiA+ICAjZWxzZQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW16
b25lLmggYi9pbmNsdWRlL2xpbnV4L21tem9uZS5oCj4gPiBpbmRleCAxYjlkZTdkMjIwZmIuLjdi
NWI2ZWJhNDAyZiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW16b25lLmgKPiA+ICsr
KyBiL2luY2x1ZGUvbGludXgvbW16b25lLmgKPiA+IEBAIC0xMDc4LDE1ICsxMDc4LDYgQEAgc3Rh
dGljIGlubGluZSBzdHJ1Y3Qgem9uZXJlZiAqZmlyc3Rfem9uZXNfem9uZWxpc3Qoc3RydWN0IHpv
bmVsaXN0ICp6b25lbGlzdCwKPiA+ICAjaW5jbHVkZSA8YXNtL3NwYXJzZW1lbS5oPgo+ID4gICNl
bmRpZgo+ID4gIAo+ID4gLSNpZiAhZGVmaW5lZChDT05GSUdfSEFWRV9BUkNIX0VBUkxZX1BGTl9U
T19OSUQpICYmIFwKPiA+IC0JIWRlZmluZWQoQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAp
Cj4gPiAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGVhcmx5X3Bmbl90b19uaWQodW5zaWdu
ZWQgbG9uZyBwZm4pCj4gPiAtewo+ID4gLQlCVUlMRF9CVUdfT04oSVNfRU5BQkxFRChDT05GSUdf
TlVNQSkpOwo+ID4gLQlyZXR1cm4gMDsKPiA+IC19Cj4gPiAtI2VuZGlmCj4gPiAtCj4gPiAgI2lm
ZGVmIENPTkZJR19GTEFUTUVNCj4gPiAgI2RlZmluZSBwZm5fdG9fbmlkKHBmbikJCSgwKQo+ID4g
ICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2Mu
Ywo+ID4gaW5kZXggMGQwMTJlZGExNjk0Li4xYWM3NzViZmM5Y2YgMTAwNjQ0Cj4gPiAtLS0gYS9t
bS9wYWdlX2FsbG9jLmMKPiA+ICsrKyBiL21tL3BhZ2VfYWxsb2MuYwo+ID4gQEAgLTE1MDQsNiAr
MTUwNCwzMSBAQCB2b2lkIF9fZnJlZV9wYWdlc19jb3JlKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNp
Z25lZCBpbnQgb3JkZXIpCj4gCj4gI2lmIGRlZmluZWQoQ09ORklHX0hBVkVfQVJDSF9FQVJMWV9Q
Rk5fVE9fTklEKSB8fCBcCj4gICAgICAgICBkZWZpbmVkKENPTkZJR19IQVZFX01FTUJMT0NLX05P
REVfTUFQKQo+IAo+IFRoaXMgaXMgdGhlIHVwcGVyIGxheWVyIG9mIGlmZGVmZmVyeSBzY29wZS4K
PiA+ICAKPiA+ICBzdGF0aWMgc3RydWN0IG1taW5pdF9wZm5uaWRfY2FjaGUgZWFybHlfcGZubmlk
X2NhY2hlIF9fbWVtaW5pdGRhdGE7Cj4gPiAgCj4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9BUkNI
X0VBUkxZX1BGTl9UT19OSUQKPiAKPiBNb3ZpbmcgX19lYXJseV9wZm5fdG9fbmlkKCkgaGVyZSBt
YWtlcyB0aGUgdXBwZXIgbGF5ZXIgb2YgaWZkZWZlcnJ5Cj4gc2NvcGUgYSBsaXR0bGUgd2VyaWQu
IEJ1dCBzZWVtcyBubyBiZXR0ZXIgd2F5IHRvIG9wdGltaXplIGl0LgoKSXQgZ2V0cyBhIGJpdCBi
ZXR0ZXIgYWZ0ZXIgcGF0Y2ggMyA6KQoKPiBPdGhlcndpc2UsIHRoaXMgcGF0Y2ggbG9va3MgZ29v
ZCB0byBtZS4KPiAKPiBSZXZpZXdlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+CgpU
aGFua3MhCgo+ID4gKwo+ID4gKy8qCj4gPiArICogUmVxdWlyZWQgYnkgU1BBUlNFTUVNLiBHaXZl
biBhIFBGTiwgcmV0dXJuIHdoYXQgbm9kZSB0aGUgUEZOIGlzIG9uLgo+ID4gKyAqLwo+ID4gK2lu
dCBfX21lbWluaXQgX19lYXJseV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuLAo+ID4gKwkJ
CQkJc3RydWN0IG1taW5pdF9wZm5uaWRfY2FjaGUgKnN0YXRlKQo+ID4gK3sKPiA+ICsJdW5zaWdu
ZWQgbG9uZyBzdGFydF9wZm4sIGVuZF9wZm47Cj4gPiArCWludCBuaWQ7Cj4gPiArCj4gPiArCWlm
IChzdGF0ZS0+bGFzdF9zdGFydCA8PSBwZm4gJiYgcGZuIDwgc3RhdGUtPmxhc3RfZW5kKQo+ID4g
KwkJcmV0dXJuIHN0YXRlLT5sYXN0X25pZDsKPiA+ICsKPiA+ICsJbmlkID0gbWVtYmxvY2tfc2Vh
cmNoX3Bmbl9uaWQocGZuLCAmc3RhcnRfcGZuLCAmZW5kX3Bmbik7Cj4gPiArCWlmIChuaWQgIT0g
TlVNQV9OT19OT0RFKSB7Cj4gPiArCQlzdGF0ZS0+bGFzdF9zdGFydCA9IHN0YXJ0X3BmbjsKPiA+
ICsJCXN0YXRlLT5sYXN0X2VuZCA9IGVuZF9wZm47Cj4gPiArCQlzdGF0ZS0+bGFzdF9uaWQgPSBu
aWQ7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJuIG5pZDsKPiA+ICt9Cj4gPiArI2VuZGlmIC8q
IENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZOX1RPX05JRCAqLwo+ID4gKwo+ID4gIGludCBfX21l
bWluaXQgZWFybHlfcGZuX3RvX25pZCh1bnNpZ25lZCBsb25nIHBmbikKPiA+ICB7Cj4gPiAgCXN0
YXRpYyBERUZJTkVfU1BJTkxPQ0soZWFybHlfcGZuX2xvY2spOwo+ID4gQEAgLTYyOTgsMzIgKzYz
MjMsNiBAQCB2b2lkIF9fbWVtaW5pdCBpbml0X2N1cnJlbnRseV9lbXB0eV96b25lKHN0cnVjdCB6
b25lICp6b25lLAo+ID4gIAl6b25lLT5pbml0aWFsaXplZCA9IDE7Cj4gPiAgfQo+ID4gIAo+ID4g
LSNpZmRlZiBDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUAo+ID4gLSNpZm5kZWYgQ09ORklH
X0hBVkVfQVJDSF9FQVJMWV9QRk5fVE9fTklECj4gPiAtCj4gPiAtLyoKPiA+IC0gKiBSZXF1aXJl
ZCBieSBTUEFSU0VNRU0uIEdpdmVuIGEgUEZOLCByZXR1cm4gd2hhdCBub2RlIHRoZSBQRk4gaXMg
b24uCj4gPiAtICovCj4gPiAtaW50IF9fbWVtaW5pdCBfX2Vhcmx5X3Bmbl90b19uaWQodW5zaWdu
ZWQgbG9uZyBwZm4sCj4gPiAtCQkJCQlzdHJ1Y3QgbW1pbml0X3Bmbm5pZF9jYWNoZSAqc3RhdGUp
Cj4gPiAtewo+ID4gLQl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKPiA+IC0JaW50
IG5pZDsKPiA+IC0KPiA+IC0JaWYgKHN0YXRlLT5sYXN0X3N0YXJ0IDw9IHBmbiAmJiBwZm4gPCBz
dGF0ZS0+bGFzdF9lbmQpCj4gPiAtCQlyZXR1cm4gc3RhdGUtPmxhc3RfbmlkOwo+ID4gLQo+ID4g
LQluaWQgPSBtZW1ibG9ja19zZWFyY2hfcGZuX25pZChwZm4sICZzdGFydF9wZm4sICZlbmRfcGZu
KTsKPiA+IC0JaWYgKG5pZCAhPSBOVU1BX05PX05PREUpIHsKPiA+IC0JCXN0YXRlLT5sYXN0X3N0
YXJ0ID0gc3RhcnRfcGZuOwo+ID4gLQkJc3RhdGUtPmxhc3RfZW5kID0gZW5kX3BmbjsKPiA+IC0J
CXN0YXRlLT5sYXN0X25pZCA9IG5pZDsKPiA+IC0JfQo+ID4gLQo+ID4gLQlyZXR1cm4gbmlkOwo+
ID4gLX0KPiA+IC0jZW5kaWYgLyogQ09ORklHX0hBVkVfQVJDSF9FQVJMWV9QRk5fVE9fTklEICov
Cj4gPiAtCj4gPiAgLyoqCj4gPiAgICogZnJlZV9ib290bWVtX3dpdGhfYWN0aXZlX3JlZ2lvbnMg
LSBDYWxsIG1lbWJsb2NrX2ZyZWVfZWFybHlfbmlkIGZvciBlYWNoIGFjdGl2ZSByYW5nZQo+ID4g
ICAqIEBuaWQ6IFRoZSBub2RlIHRvIGZyZWUgbWVtb3J5IG9uLiBJZiBNQVhfTlVNTk9ERVMsIGFs
bCBub2RlcyBhcmUgZnJlZWQuCj4gPiAtLSAKPiA+IDIuMjUuMQo+ID4gCj4gCgotLSAKU2luY2Vy
ZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
