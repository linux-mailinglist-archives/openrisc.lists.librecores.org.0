Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD591C05B7
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E541420B2C;
	Thu, 30 Apr 2020 21:09:21 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mail.librecores.org (Postfix) with ESMTP id EA3382090F
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 04:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587610651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DBERUkIgixaT3oYuYeglKcK2+1nIAxOiDRTBQmB0x0w=;
 b=UOe3zUGGGGBoIq3GxF5NFi+GdWCY9G4R4dseyPlq3Xr5nSE+c31DXRf7BJFkXku2sh9J3N
 +Ku6+HvuwaemBYn+B8I6We5xUWS92ayBRRqHqYKqwQmmXCpTJcga38HrnO4lpKZuFyPsZg
 mywOdTHz8p0g65uZCkGb0sdT/n6/VOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-t2wXG6hJMDmSJWbWEiQcwQ-1; Wed, 22 Apr 2020 22:57:29 -0400
X-MC-Unique: t2wXG6hJMDmSJWbWEiQcwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67F1CDB23;
 Thu, 23 Apr 2020 02:57:24 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E7660BE0;
 Thu, 23 Apr 2020 02:57:22 +0000 (UTC)
Date: Thu, 23 Apr 2020 10:57:20 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200423025720.GA4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-18-rppt@kernel.org>
 <20200423025311.GZ4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423025311.GZ4247@MiWiFi-R3L-srv>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 17/21] mm: free_area_init: allow defining
 max_zone_pfn in descending order
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

T24gMDQvMjMvMjAgYXQgMTA6NTNhbSwgQmFvcXVhbiBIZSB3cm90ZToKPiBPbiAwNC8xMi8yMCBh
dCAxMDo0OHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJvbTogTWlrZSBSYXBvcG9ydCA8
cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBTb21lIGFyY2hpdGVjdHVyZXMgKGUuZy4gQVJD
KSBoYXZlIHRoZSBaT05FX0hJR0hNRU0gem9uZSBiZWxvdyB0aGUKPiA+IFpPTkVfTk9STUFMLiBB
bGxvd2luZyBmcmVlX2FyZWFfaW5pdCgpIHBhcnNlIG1heF96b25lX3BmbiBhcnJheSBldmVuIGl0
IGlzCj4gPiBzb3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBhbGxvd3MgdXNpbmcgZnJlZV9hcmVh
X2luaXQoKSBvbiBzdWNoCj4gPiBhcmNoaXRlY3R1cmVzLgo+ID4gCj4gPiBBZGQgdG9wIC0+IGRv
d24gdHJhdmVyc2FsIG9mIG1heF96b25lX3BmbiBhcnJheSBpbiBmcmVlX2FyZWFfaW5pdCgpIGFu
ZCB1c2UKPiA+IHRoZSBsYXR0ZXIgaW4gQVJDIG5vZGUvem9uZSBpbml0aWFsaXphdGlvbi4KPiAK
PiBPciBtYXliZSBsZWF2ZSBBUkMgYXMgaXMuIFRoZSBjaGFuZ2UgaW4gdGhpcyBwYXRjaHNldCBk
b2Vzbid0IGltcGFjdAo+IEFSQydzIGhhbmRsaW5nIGFib3V0IHpvbmUgaW5pdGlhbGl6YXRpb24s
IGxlYXZpbmcgaXQgYXMgaXMgY2FuIHJlZHVjZQo+IHRoZSBjb21wbGljYXRpb24gaW4gaW1wbGVt
ZW50YXRpb24gb2YgZnJlZV9hcmVhX2luaXQoKSwgd2hpY2ggaXMgYQo+IGNvbW1vbiBmdW5jdGlv
bi4gU28gSSBwZXJzb25hbGx5IGRvbid0IHNlZSBhIHN0cm9uZyBtb3RpdmF0aW9uIHRvIGhhdmUK
PiB0aGlzIHBhdGNoLgoKT0ssIHNlZW1zIHRoaXMgcGF0Y2ggaXMgcHJlcGFyZWQgdG8gc2ltcGxp
ZnkgZnJlZV9hcmVhX2luaXRfbm9kZSgpLCBzbwp0YWtlIGJhY2sgd2hhdCBJIHNhaWQgYXQgYWJv
dmUuCgpUaGVuIHRoaXMgbG9va3MgbmVjZXNzYXJ5LCBldmVuIHRob3VnaCBpdCBpbnRyb2R1Y2Vz
IHNwZWNpYWwgY2FzZSBpbnRvCmNvbW1vbiBmdW5jdGlvbiBmcmVlX2FyZWFfaW5pdCgpLgoKUmV2
aWV3ZWQtYnk6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPgoKPiAKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gLS0tCj4gPiAg
YXJjaC9hcmMvbW0vaW5pdC5jIHwgMzYgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiAgbW0vcGFnZV9hbGxvYy5jICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKy0tLS0t
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL21tL2luaXQuYyBiL2FyY2gvYXJjL21tL2lu
aXQuYwo+ID4gaW5kZXggMDkyMGM5NjljNDY2Li40MWViOWJlMTY1M2MgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL2FyYy9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvYXJjL21tL2luaXQuYwo+ID4gQEAg
LTYzLDExICs2MywxMyBAQCB2b2lkIF9faW5pdCBlYXJseV9pbml0X2R0X2FkZF9tZW1vcnlfYXJj
aCh1NjQgYmFzZSwgdTY0IHNpemUpCj4gPiAgCj4gPiAgCQlsb3dfbWVtX3N6ID0gc2l6ZTsKPiA+
ICAJCWluX3VzZSA9IDE7Cj4gPiArCQltZW1ibG9ja19hZGRfbm9kZShiYXNlLCBzaXplLCAwKTsK
PiA+ICAJfSBlbHNlIHsKPiA+ICAjaWZkZWYgQ09ORklHX0hJR0hNRU0KPiA+ICAJCWhpZ2hfbWVt
X3N0YXJ0ID0gYmFzZTsKPiA+ICAJCWhpZ2hfbWVtX3N6ID0gc2l6ZTsKPiA+ICAJCWluX3VzZSA9
IDE7Cj4gPiArCQltZW1ibG9ja19hZGRfbm9kZShiYXNlLCBzaXplLCAxKTsKPiA+ICAjZW5kaWYK
PiA+ICAJfQo+ID4gIAo+ID4gQEAgLTgzLDggKzg1LDcgQEAgdm9pZCBfX2luaXQgZWFybHlfaW5p
dF9kdF9hZGRfbWVtb3J5X2FyY2godTY0IGJhc2UsIHU2NCBzaXplKQo+ID4gICAqLwo+ID4gIHZv
aWQgX19pbml0IHNldHVwX2FyY2hfbWVtb3J5KHZvaWQpCj4gPiAgewo+ID4gLQl1bnNpZ25lZCBs
b25nIHpvbmVzX3NpemVbTUFYX05SX1pPTkVTXTsKPiA+IC0JdW5zaWduZWQgbG9uZyB6b25lc19o
b2xlc1tNQVhfTlJfWk9ORVNdOwo+ID4gKwl1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhf
TlJfWk9ORVNdID0geyAwIH07Cj4gPiAgCj4gPiAgCWluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNp
Z25lZCBsb25nKV90ZXh0Owo+ID4gIAlpbml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxvbmcp
X2V0ZXh0Owo+ID4gQEAgLTExNSw3ICsxMTYsNiBAQCB2b2lkIF9faW5pdCBzZXR1cF9hcmNoX21l
bW9yeSh2b2lkKQo+ID4gIAkgKiB0aGUgY3Jhc2gKPiA+ICAJICovCj4gPiAgCj4gPiAtCW1lbWJs
b2NrX2FkZF9ub2RlKGxvd19tZW1fc3RhcnQsIGxvd19tZW1fc3osIDApOwo+ID4gIAltZW1ibG9j
a19yZXNlcnZlKENPTkZJR19MSU5VWF9MSU5LX0JBU0UsCj4gPiAgCQkJIF9fcGEoX2VuZCkgLSBD
T05GSUdfTElOVVhfTElOS19CQVNFKTsKPiA+ICAKPiA+IEBAIC0xMzMsMjIgKzEzMyw3IEBAIHZv
aWQgX19pbml0IHNldHVwX2FyY2hfbWVtb3J5KHZvaWQpCj4gPiAgCW1lbWJsb2NrX2R1bXBfYWxs
KCk7Cj4gPiAgCj4gPiAgCS8qLS0tLS0tLS0tLS0tLS0tLS0gbm9kZS96b25lcyBzZXR1cCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCj4gPiAtCW1lbXNldCh6b25lc19zaXplLCAwLCBzaXpl
b2Yoem9uZXNfc2l6ZSkpOwo+ID4gLQltZW1zZXQoem9uZXNfaG9sZXMsIDAsIHNpemVvZih6b25l
c19ob2xlcykpOwo+ID4gLQo+ID4gLQl6b25lc19zaXplW1pPTkVfTk9STUFMXSA9IG1heF9sb3df
cGZuIC0gbWluX2xvd19wZm47Cj4gPiAtCXpvbmVzX2hvbGVzW1pPTkVfTk9STUFMXSA9IDA7Cj4g
PiAtCj4gPiAtCS8qCj4gPiAtCSAqIFdlIGNhbid0IHVzZSB0aGUgaGVscGVyIGZyZWVfYXJlYV9p
bml0KHpvbmVzW10pIGJlY2F1c2UgaXQgdXNlcwo+ID4gLQkgKiBQQUdFX09GRlNFVCB0byBjb21w
dXRlIHRoZSBAbWluX2xvd19wZm4gd2hpY2ggd291bGQgYmUgd3JvbmcKPiA+IC0JICogd2hlbiBv
dXIga2VybmVsIGRvZXNuJ3Qgc3RhcnQgYXQgUEFHRV9PRkZTRVQsIGkuZS4KPiA+IC0JICogUEFH
RV9PRkZTRVQgIT0gQ09ORklHX0xJTlVYX1JBTV9CQVNFCj4gPiAtCSAqLwo+ID4gLQlmcmVlX2Fy
ZWFfaW5pdF9ub2RlKDAsCQkJLyogbm9kZS1pZCAqLwo+ID4gLQkJCSAgICB6b25lc19zaXplLAkJ
LyogbnVtIHBhZ2VzIHBlciB6b25lICovCj4gPiAtCQkJICAgIG1pbl9sb3dfcGZuLAkvKiBmaXJz
dCBwZm4gb2Ygbm9kZSAqLwo+ID4gLQkJCSAgICB6b25lc19ob2xlcyk7CS8qIGhvbGVzICovCj4g
PiArCW1heF96b25lX3BmbltaT05FX05PUk1BTF0gPSBtYXhfbG93X3BmbjsKPiA+ICAKPiA+ICAj
aWZkZWYgQ09ORklHX0hJR0hNRU0KPiA+ICAJLyoKPiA+IEBAIC0xNjgsMjAgKzE1MywxMyBAQCB2
b2lkIF9faW5pdCBzZXR1cF9hcmNoX21lbW9yeSh2b2lkKQo+ID4gIAltaW5faGlnaF9wZm4gPSBQ
Rk5fRE9XTihoaWdoX21lbV9zdGFydCk7Cj4gPiAgCW1heF9oaWdoX3BmbiA9IFBGTl9ET1dOKGhp
Z2hfbWVtX3N0YXJ0ICsgaGlnaF9tZW1fc3opOwo+ID4gIAo+ID4gLQl6b25lc19zaXplW1pPTkVf
Tk9STUFMXSA9IDA7Cj4gPiAtCXpvbmVzX2hvbGVzW1pPTkVfTk9STUFMXSA9IDA7Cj4gPiAtCj4g
PiAtCXpvbmVzX3NpemVbWk9ORV9ISUdITUVNXSA9IG1heF9oaWdoX3BmbiAtIG1pbl9oaWdoX3Bm
bjsKPiA+IC0Jem9uZXNfaG9sZXNbWk9ORV9ISUdITUVNXSA9IDA7Cj4gPiAtCj4gPiAtCWZyZWVf
YXJlYV9pbml0X25vZGUoMSwJCQkvKiBub2RlLWlkICovCj4gPiAtCQkJICAgIHpvbmVzX3NpemUs
CQkvKiBudW0gcGFnZXMgcGVyIHpvbmUgKi8KPiA+IC0JCQkgICAgbWluX2hpZ2hfcGZuLAkvKiBm
aXJzdCBwZm4gb2Ygbm9kZSAqLwo+ID4gLQkJCSAgICB6b25lc19ob2xlcyk7CS8qIGhvbGVzICov
Cj4gPiArCW1heF96b25lX3BmbltaT05FX0hJR0hNRU1dID0gbWF4X2hpZ2hfcGZuOwo+ID4gIAo+
ID4gIAloaWdoX21lbW9yeSA9ICh2b2lkICopKG1pbl9oaWdoX3BmbiA8PCBQQUdFX1NISUZUKTsK
PiA+ICAJa21hcF9pbml0KCk7Cj4gPiAgI2VuZGlmCj4gPiArCj4gPiArCWZyZWVfYXJlYV9pbml0
KG1heF96b25lX3Bmbik7Cj4gPiAgfQo+ID4gIAo+ID4gIC8qCj4gPiBkaWZmIC0tZ2l0IGEvbW0v
cGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gPiBpbmRleCAzNDNkODdiODY5N2QuLjM3
NjQzNGM3YTc4YiAxMDA2NDQKPiA+IC0tLSBhL21tL3BhZ2VfYWxsb2MuYwo+ID4gKysrIGIvbW0v
cGFnZV9hbGxvYy5jCj4gPiBAQCAtNzQyOSw3ICs3NDI5LDggQEAgc3RhdGljIHZvaWQgY2hlY2tf
Zm9yX21lbW9yeShwZ19kYXRhX3QgKnBnZGF0LCBpbnQgbmlkKQo+ID4gIHZvaWQgX19pbml0IGZy
ZWVfYXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbikKPiA+ICB7Cj4gPiAgCXVu
c2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRfcGZuOwo+ID4gLQlpbnQgaSwgbmlkOwo+ID4gKwlp
bnQgaSwgbmlkLCB6b25lOwo+ID4gKwlib29sIGRlc2NlbmRpbmcgPSBmYWxzZTsKPiA+ICAKPiA+
ICAJLyogUmVjb3JkIHdoZXJlIHRoZSB6b25lIGJvdW5kYXJpZXMgYXJlICovCj4gPiAgCW1lbXNl
dChhcmNoX3pvbmVfbG93ZXN0X3Bvc3NpYmxlX3BmbiwgMCwKPiA+IEBAIC03NDM5LDEzICs3NDQw
LDI2IEBAIHZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25l
X3BmbikKPiA+ICAKPiA+ICAJc3RhcnRfcGZuID0gZmluZF9taW5fcGZuX3dpdGhfYWN0aXZlX3Jl
Z2lvbnMoKTsKPiA+ICAKPiA+ICsJLyoKPiA+ICsJICogU29tZSBhcmNoaXRlY3R1cnMsIGUuZy4g
QVJDIG1heSBoYXZlIFpPTkVfSElHSE1FTSBiZWxvdwo+ID4gKwkgKiBaT05FX05PUk1BTC4gRm9y
IHN1Y2ggY2FzZXMgd2UgYWxsb3cgbWF4X3pvbmVfcGZuIHNvcnRlZCBpbiB0aGUKPiA+ICsJICog
ZGVzY2VuZGluZyBvcmRlcgo+ID4gKwkgKi8KPiA+ICsJaWYgKE1BWF9OUl9aT05FUyA+IDEgJiYg
bWF4X3pvbmVfcGZuWzBdID4gbWF4X3pvbmVfcGZuWzFdKQo+ID4gKwkJZGVzY2VuZGluZyA9IHRy
dWU7Cj4gPiArCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBNQVhfTlJfWk9ORVM7IGkrKykgewo+ID4g
LQkJaWYgKGkgPT0gWk9ORV9NT1ZBQkxFKQo+ID4gKwkJaWYgKGRlc2NlbmRpbmcpCj4gPiArCQkJ
em9uZSA9IE1BWF9OUl9aT05FUyAtIGkgLSAxOwo+ID4gKwkJZWxzZQo+ID4gKwkJCXpvbmUgPSBp
Owo+ID4gKwo+ID4gKwkJaWYgKHpvbmUgPT0gWk9ORV9NT1ZBQkxFKQo+ID4gIAkJCWNvbnRpbnVl
Owo+ID4gIAo+ID4gLQkJZW5kX3BmbiA9IG1heChtYXhfem9uZV9wZm5baV0sIHN0YXJ0X3Bmbik7
Cj4gPiAtCQlhcmNoX3pvbmVfbG93ZXN0X3Bvc3NpYmxlX3BmbltpXSA9IHN0YXJ0X3BmbjsKPiA+
IC0JCWFyY2hfem9uZV9oaWdoZXN0X3Bvc3NpYmxlX3BmbltpXSA9IGVuZF9wZm47Cj4gPiArCQll
bmRfcGZuID0gbWF4KG1heF96b25lX3Bmblt6b25lXSwgc3RhcnRfcGZuKTsKPiA+ICsJCWFyY2hf
em9uZV9sb3dlc3RfcG9zc2libGVfcGZuW3pvbmVdID0gc3RhcnRfcGZuOwo+ID4gKwkJYXJjaF96
b25lX2hpZ2hlc3RfcG9zc2libGVfcGZuW3pvbmVdID0gZW5kX3BmbjsKPiA+ICAKPiA+ICAJCXN0
YXJ0X3BmbiA9IGVuZF9wZm47Cj4gPiAgCX0KPiA+IC0tIAo+ID4gMi4yNS4xCj4gPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
