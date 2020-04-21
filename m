Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 54A4E1B20D1
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1429A20B34;
	Tue, 21 Apr 2020 10:02:10 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id D0630202C6
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 04:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587435889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Muw3THJhE6mXPlOA/UgJHfU1SluTy1QDua9Qwu1ZGDs=;
 b=Pi6jeKp1fro4josAGSxfofUlP0YxX96NGDpQdGjFKPWBCxi2tohLHaS4zlXl3A1I3EZekC
 kagw2L2uGeyKzo5TQO/7YsgKWXIGDuzqma6/ejZ8a5S7zwqIi7uFVTIrCFISwGq/sb6bo4
 CItvxaaJ6CowaBED3Q8pfAK0dlhfBm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-M7FU_cShM9S7GfjktLA04w-1; Mon, 20 Apr 2020 22:24:48 -0400
X-MC-Unique: M7FU_cShM9S7GfjktLA04w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C109A107ACC9;
 Tue, 21 Apr 2020 02:24:41 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 470B65DA76;
 Tue, 21 Apr 2020 02:24:37 +0000 (UTC)
Date: Tue, 21 Apr 2020 10:24:35 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200421022435.GP4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-3-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X09OKElTX0VOQUJMRUQoQ09ORklHX05VTUEpKTsKPiAgCXJldHVybiAwOwo+ICB9CgpJdCdzIGJl
dHRlciB0byBtYWtlIGEgc2VwYXJhdGUgcGF0Y2ggdG8gZHJvcCBfX2Vhcmx5X3Bmbl90b19uaWQo
KSBoZXJlLgoKPiAgI2Vsc2UKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbXpvbmUuaCBi
L2luY2x1ZGUvbGludXgvbW16b25lLmgKPiBpbmRleCAxYjlkZTdkMjIwZmIuLjdiNWI2ZWJhNDAy
ZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tem9uZS5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9tbXpvbmUuaAo+IEBAIC0xMDc4LDE1ICsxMDc4LDYgQEAgc3RhdGljIGlubGluZSBzdHJ1
Y3Qgem9uZXJlZiAqZmlyc3Rfem9uZXNfem9uZWxpc3Qoc3RydWN0IHpvbmVsaXN0ICp6b25lbGlz
dCwKPiAgI2luY2x1ZGUgPGFzbS9zcGFyc2VtZW0uaD4KPiAgI2VuZGlmCj4gIAo+IC0jaWYgIWRl
ZmluZWQoQ09ORklHX0hBVkVfQVJDSF9FQVJMWV9QRk5fVE9fTklEKSAmJiBcCj4gLQkhZGVmaW5l
ZChDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUCkKPiAtc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIGVhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4pCj4gLXsKPiAtCUJVSUxE
X0JVR19PTihJU19FTkFCTEVEKENPTkZJR19OVU1BKSk7Cj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0j
ZW5kaWYKPiAtCj4gICNpZmRlZiBDT05GSUdfRkxBVE1FTQo+ICAjZGVmaW5lIHBmbl90b19uaWQo
cGZuKQkJKDApCj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9w
YWdlX2FsbG9jLmMKPiBpbmRleCAwZDAxMmVkYTE2OTQuLjFhYzc3NWJmYzljZiAxMDA2NDQKPiAt
LS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysgYi9tbS9wYWdlX2FsbG9jLmMKPiBAQCAtMTUwNCw2
ICsxNTA0LDMxIEBAIHZvaWQgX19mcmVlX3BhZ2VzX2NvcmUoc3RydWN0IHBhZ2UgKnBhZ2UsIHVu
c2lnbmVkIGludCBvcmRlcikKCiNpZiBkZWZpbmVkKENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZO
X1RPX05JRCkgfHwgXAogICAgICAgIGRlZmluZWQoQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9N
QVApCgpUaGlzIGlzIHRoZSB1cHBlciBsYXllciBvZiBpZmRlZmZlcnkgc2NvcGUuCj4gIAo+ICBz
dGF0aWMgc3RydWN0IG1taW5pdF9wZm5uaWRfY2FjaGUgZWFybHlfcGZubmlkX2NhY2hlIF9fbWVt
aW5pdGRhdGE7Cj4gIAo+ICsjaWZuZGVmIENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZOX1RPX05J
RAoKTW92aW5nIF9fZWFybHlfcGZuX3RvX25pZCgpIGhlcmUgbWFrZXMgdGhlIHVwcGVyIGxheWVy
IG9mIGlmZGVmZXJyeQpzY29wZSBhIGxpdHRsZSB3ZXJpZC4gQnV0IHNlZW1zIG5vIGJldHRlciB3
YXkgdG8gb3B0aW1pemUgaXQuCgpPdGhlcndpc2UsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBt
ZS4KClJldmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KCj4gKwo+ICsvKgo+
ICsgKiBSZXF1aXJlZCBieSBTUEFSU0VNRU0uIEdpdmVuIGEgUEZOLCByZXR1cm4gd2hhdCBub2Rl
IHRoZSBQRk4gaXMgb24uCj4gKyAqLwo+ICtpbnQgX19tZW1pbml0IF9fZWFybHlfcGZuX3RvX25p
ZCh1bnNpZ25lZCBsb25nIHBmbiwKPiArCQkJCQlzdHJ1Y3QgbW1pbml0X3Bmbm5pZF9jYWNoZSAq
c3RhdGUpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRfcGZuOwo+ICsJaW50
IG5pZDsKPiArCj4gKwlpZiAoc3RhdGUtPmxhc3Rfc3RhcnQgPD0gcGZuICYmIHBmbiA8IHN0YXRl
LT5sYXN0X2VuZCkKPiArCQlyZXR1cm4gc3RhdGUtPmxhc3RfbmlkOwo+ICsKPiArCW5pZCA9IG1l
bWJsb2NrX3NlYXJjaF9wZm5fbmlkKHBmbiwgJnN0YXJ0X3BmbiwgJmVuZF9wZm4pOwo+ICsJaWYg
KG5pZCAhPSBOVU1BX05PX05PREUpIHsKPiArCQlzdGF0ZS0+bGFzdF9zdGFydCA9IHN0YXJ0X3Bm
bjsKPiArCQlzdGF0ZS0+bGFzdF9lbmQgPSBlbmRfcGZuOwo+ICsJCXN0YXRlLT5sYXN0X25pZCA9
IG5pZDsKPiArCX0KPiArCj4gKwlyZXR1cm4gbmlkOwo+ICt9Cj4gKyNlbmRpZiAvKiBDT05GSUdf
SEFWRV9BUkNIX0VBUkxZX1BGTl9UT19OSUQgKi8KPiArCj4gIGludCBfX21lbWluaXQgZWFybHlf
cGZuX3RvX25pZCh1bnNpZ25lZCBsb25nIHBmbikKPiAgewo+ICAJc3RhdGljIERFRklORV9TUElO
TE9DSyhlYXJseV9wZm5fbG9jayk7Cj4gQEAgLTYyOTgsMzIgKzYzMjMsNiBAQCB2b2lkIF9fbWVt
aW5pdCBpbml0X2N1cnJlbnRseV9lbXB0eV96b25lKHN0cnVjdCB6b25lICp6b25lLAo+ICAJem9u
ZS0+aW5pdGlhbGl6ZWQgPSAxOwo+ICB9Cj4gIAo+IC0jaWZkZWYgQ09ORklHX0hBVkVfTUVNQkxP
Q0tfTk9ERV9NQVAKPiAtI2lmbmRlZiBDT05GSUdfSEFWRV9BUkNIX0VBUkxZX1BGTl9UT19OSUQK
PiAtCj4gLS8qCj4gLSAqIFJlcXVpcmVkIGJ5IFNQQVJTRU1FTS4gR2l2ZW4gYSBQRk4sIHJldHVy
biB3aGF0IG5vZGUgdGhlIFBGTiBpcyBvbi4KPiAtICovCj4gLWludCBfX21lbWluaXQgX19lYXJs
eV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuLAo+IC0JCQkJCXN0cnVjdCBtbWluaXRfcGZu
bmlkX2NhY2hlICpzdGF0ZSkKPiAtewo+IC0JdW5zaWduZWQgbG9uZyBzdGFydF9wZm4sIGVuZF9w
Zm47Cj4gLQlpbnQgbmlkOwo+IC0KPiAtCWlmIChzdGF0ZS0+bGFzdF9zdGFydCA8PSBwZm4gJiYg
cGZuIDwgc3RhdGUtPmxhc3RfZW5kKQo+IC0JCXJldHVybiBzdGF0ZS0+bGFzdF9uaWQ7Cj4gLQo+
IC0JbmlkID0gbWVtYmxvY2tfc2VhcmNoX3Bmbl9uaWQocGZuLCAmc3RhcnRfcGZuLCAmZW5kX3Bm
bik7Cj4gLQlpZiAobmlkICE9IE5VTUFfTk9fTk9ERSkgewo+IC0JCXN0YXRlLT5sYXN0X3N0YXJ0
ID0gc3RhcnRfcGZuOwo+IC0JCXN0YXRlLT5sYXN0X2VuZCA9IGVuZF9wZm47Cj4gLQkJc3RhdGUt
Pmxhc3RfbmlkID0gbmlkOwo+IC0JfQo+IC0KPiAtCXJldHVybiBuaWQ7Cj4gLX0KPiAtI2VuZGlm
IC8qIENPTkZJR19IQVZFX0FSQ0hfRUFSTFlfUEZOX1RPX05JRCAqLwo+IC0KPiAgLyoqCj4gICAq
IGZyZWVfYm9vdG1lbV93aXRoX2FjdGl2ZV9yZWdpb25zIC0gQ2FsbCBtZW1ibG9ja19mcmVlX2Vh
cmx5X25pZCBmb3IgZWFjaCBhY3RpdmUgcmFuZ2UKPiAgICogQG5pZDogVGhlIG5vZGUgdG8gZnJl
ZSBtZW1vcnkgb24uIElmIE1BWF9OVU1OT0RFUywgYWxsIG5vZGVzIGFyZSBmcmVlZC4KPiAtLSAK
PiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
