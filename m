Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9922A1C05D2
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4994520AA1;
	Thu, 30 Apr 2020 21:09:20 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id F343F206AB
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 04:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587610406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FvU2JHm64Xqsh116BbsmynN/ksM/DPbTtZrj6ee5Dto=;
 b=EPWd92+McRZ9wfI2KcWBa4rNqTAvXCGHyi56fvB6F1J4NvCI5/y14pLfcCQlAZpYjo86pH
 g82YcfGdnzGhnZ8prMWnSSYLd61udDBFb5vhehBNnMyOZzapj6YP6Q0NdmoBIYGfY9p/+U
 9iE/kLvtqgsF63dmYDvc10sSgm0U7G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-424MaE2NNzCl66D9y-ZbuQ-1; Wed, 22 Apr 2020 22:53:24 -0400
X-MC-Unique: 424MaE2NNzCl66D9y-ZbuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 135F01B2C980;
 Thu, 23 Apr 2020 02:53:17 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB88C600D2;
 Thu, 23 Apr 2020 02:53:13 +0000 (UTC)
Date: Thu, 23 Apr 2020 10:53:11 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200423025311.GZ4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-18-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

T24gMDQvMTIvMjAgYXQgMTA6NDhwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gU29tZSBhcmNoaXRlY3R1cmVzIChl
LmcuIEFSQykgaGF2ZSB0aGUgWk9ORV9ISUdITUVNIHpvbmUgYmVsb3cgdGhlCj4gWk9ORV9OT1JN
QUwuIEFsbG93aW5nIGZyZWVfYXJlYV9pbml0KCkgcGFyc2UgbWF4X3pvbmVfcGZuIGFycmF5IGV2
ZW4gaXQgaXMKPiBzb3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBhbGxvd3MgdXNpbmcgZnJlZV9h
cmVhX2luaXQoKSBvbiBzdWNoCj4gYXJjaGl0ZWN0dXJlcy4KPiAKPiBBZGQgdG9wIC0+IGRvd24g
dHJhdmVyc2FsIG9mIG1heF96b25lX3BmbiBhcnJheSBpbiBmcmVlX2FyZWFfaW5pdCgpIGFuZCB1
c2UKPiB0aGUgbGF0dGVyIGluIEFSQyBub2RlL3pvbmUgaW5pdGlhbGl6YXRpb24uCgpPciBtYXli
ZSBsZWF2ZSBBUkMgYXMgaXMuIFRoZSBjaGFuZ2UgaW4gdGhpcyBwYXRjaHNldCBkb2Vzbid0IGlt
cGFjdApBUkMncyBoYW5kbGluZyBhYm91dCB6b25lIGluaXRpYWxpemF0aW9uLCBsZWF2aW5nIGl0
IGFzIGlzIGNhbiByZWR1Y2UKdGhlIGNvbXBsaWNhdGlvbiBpbiBpbXBsZW1lbnRhdGlvbiBvZiBm
cmVlX2FyZWFfaW5pdCgpLCB3aGljaCBpcyBhCmNvbW1vbiBmdW5jdGlvbi4gU28gSSBwZXJzb25h
bGx5IGRvbid0IHNlZSBhIHN0cm9uZyBtb3RpdmF0aW9uIHRvIGhhdmUKdGhpcyBwYXRjaC4KCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0t
LQo+ICBhcmNoL2FyYy9tbS9pbml0LmMgfCAzNiArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgbW0vcGFnZV9hbGxvYy5jICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKy0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL21tL2luaXQuYyBiL2FyY2gvYXJjL21tL2luaXQu
Ywo+IGluZGV4IDA5MjBjOTY5YzQ2Ni4uNDFlYjliZTE2NTNjIDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJjL21tL2luaXQuYwo+ICsrKyBiL2FyY2gvYXJjL21tL2luaXQuYwo+IEBAIC02MywxMSArNjMs
MTMgQEAgdm9pZCBfX2luaXQgZWFybHlfaW5pdF9kdF9hZGRfbWVtb3J5X2FyY2godTY0IGJhc2Us
IHU2NCBzaXplKQo+ICAKPiAgCQlsb3dfbWVtX3N6ID0gc2l6ZTsKPiAgCQlpbl91c2UgPSAxOwo+
ICsJCW1lbWJsb2NrX2FkZF9ub2RlKGJhc2UsIHNpemUsIDApOwo+ICAJfSBlbHNlIHsKPiAgI2lm
ZGVmIENPTkZJR19ISUdITUVNCj4gIAkJaGlnaF9tZW1fc3RhcnQgPSBiYXNlOwo+ICAJCWhpZ2hf
bWVtX3N6ID0gc2l6ZTsKPiAgCQlpbl91c2UgPSAxOwo+ICsJCW1lbWJsb2NrX2FkZF9ub2RlKGJh
c2UsIHNpemUsIDEpOwo+ICAjZW5kaWYKPiAgCX0KPiAgCj4gQEAgLTgzLDggKzg1LDcgQEAgdm9p
ZCBfX2luaXQgZWFybHlfaW5pdF9kdF9hZGRfbWVtb3J5X2FyY2godTY0IGJhc2UsIHU2NCBzaXpl
KQo+ICAgKi8KPiAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaF9tZW1vcnkodm9pZCkKPiAgewo+IC0J
dW5zaWduZWQgbG9uZyB6b25lc19zaXplW01BWF9OUl9aT05FU107Cj4gLQl1bnNpZ25lZCBsb25n
IHpvbmVzX2hvbGVzW01BWF9OUl9aT05FU107Cj4gKwl1bnNpZ25lZCBsb25nIG1heF96b25lX3Bm
bltNQVhfTlJfWk9ORVNdID0geyAwIH07Cj4gIAo+ICAJaW5pdF9tbS5zdGFydF9jb2RlID0gKHVu
c2lnbmVkIGxvbmcpX3RleHQ7Cj4gIAlpbml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxvbmcp
X2V0ZXh0Owo+IEBAIC0xMTUsNyArMTE2LDYgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaF9tZW1v
cnkodm9pZCkKPiAgCSAqIHRoZSBjcmFzaAo+ICAJICovCj4gIAo+IC0JbWVtYmxvY2tfYWRkX25v
ZGUobG93X21lbV9zdGFydCwgbG93X21lbV9zeiwgMCk7Cj4gIAltZW1ibG9ja19yZXNlcnZlKENP
TkZJR19MSU5VWF9MSU5LX0JBU0UsCj4gIAkJCSBfX3BhKF9lbmQpIC0gQ09ORklHX0xJTlVYX0xJ
TktfQkFTRSk7Cj4gIAo+IEBAIC0xMzMsMjIgKzEzMyw3IEBAIHZvaWQgX19pbml0IHNldHVwX2Fy
Y2hfbWVtb3J5KHZvaWQpCj4gIAltZW1ibG9ja19kdW1wX2FsbCgpOwo+ICAKPiAgCS8qLS0tLS0t
LS0tLS0tLS0tLS0gbm9kZS96b25lcyBzZXR1cCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSov
Cj4gLQltZW1zZXQoem9uZXNfc2l6ZSwgMCwgc2l6ZW9mKHpvbmVzX3NpemUpKTsKPiAtCW1lbXNl
dCh6b25lc19ob2xlcywgMCwgc2l6ZW9mKHpvbmVzX2hvbGVzKSk7Cj4gLQo+IC0Jem9uZXNfc2l6
ZVtaT05FX05PUk1BTF0gPSBtYXhfbG93X3BmbiAtIG1pbl9sb3dfcGZuOwo+IC0Jem9uZXNfaG9s
ZXNbWk9ORV9OT1JNQUxdID0gMDsKPiAtCj4gLQkvKgo+IC0JICogV2UgY2FuJ3QgdXNlIHRoZSBo
ZWxwZXIgZnJlZV9hcmVhX2luaXQoem9uZXNbXSkgYmVjYXVzZSBpdCB1c2VzCj4gLQkgKiBQQUdF
X09GRlNFVCB0byBjb21wdXRlIHRoZSBAbWluX2xvd19wZm4gd2hpY2ggd291bGQgYmUgd3JvbmcK
PiAtCSAqIHdoZW4gb3VyIGtlcm5lbCBkb2Vzbid0IHN0YXJ0IGF0IFBBR0VfT0ZGU0VULCBpLmUu
Cj4gLQkgKiBQQUdFX09GRlNFVCAhPSBDT05GSUdfTElOVVhfUkFNX0JBU0UKPiAtCSAqLwo+IC0J
ZnJlZV9hcmVhX2luaXRfbm9kZSgwLAkJCS8qIG5vZGUtaWQgKi8KPiAtCQkJICAgIHpvbmVzX3Np
emUsCQkvKiBudW0gcGFnZXMgcGVyIHpvbmUgKi8KPiAtCQkJICAgIG1pbl9sb3dfcGZuLAkvKiBm
aXJzdCBwZm4gb2Ygbm9kZSAqLwo+IC0JCQkgICAgem9uZXNfaG9sZXMpOwkvKiBob2xlcyAqLwo+
ICsJbWF4X3pvbmVfcGZuW1pPTkVfTk9STUFMXSA9IG1heF9sb3dfcGZuOwo+ICAKPiAgI2lmZGVm
IENPTkZJR19ISUdITUVNCj4gIAkvKgo+IEBAIC0xNjgsMjAgKzE1MywxMyBAQCB2b2lkIF9faW5p
dCBzZXR1cF9hcmNoX21lbW9yeSh2b2lkKQo+ICAJbWluX2hpZ2hfcGZuID0gUEZOX0RPV04oaGln
aF9tZW1fc3RhcnQpOwo+ICAJbWF4X2hpZ2hfcGZuID0gUEZOX0RPV04oaGlnaF9tZW1fc3RhcnQg
KyBoaWdoX21lbV9zeik7Cj4gIAo+IC0Jem9uZXNfc2l6ZVtaT05FX05PUk1BTF0gPSAwOwo+IC0J
em9uZXNfaG9sZXNbWk9ORV9OT1JNQUxdID0gMDsKPiAtCj4gLQl6b25lc19zaXplW1pPTkVfSElH
SE1FTV0gPSBtYXhfaGlnaF9wZm4gLSBtaW5faGlnaF9wZm47Cj4gLQl6b25lc19ob2xlc1taT05F
X0hJR0hNRU1dID0gMDsKPiAtCj4gLQlmcmVlX2FyZWFfaW5pdF9ub2RlKDEsCQkJLyogbm9kZS1p
ZCAqLwo+IC0JCQkgICAgem9uZXNfc2l6ZSwJCS8qIG51bSBwYWdlcyBwZXIgem9uZSAqLwo+IC0J
CQkgICAgbWluX2hpZ2hfcGZuLAkvKiBmaXJzdCBwZm4gb2Ygbm9kZSAqLwo+IC0JCQkgICAgem9u
ZXNfaG9sZXMpOwkvKiBob2xlcyAqLwo+ICsJbWF4X3pvbmVfcGZuW1pPTkVfSElHSE1FTV0gPSBt
YXhfaGlnaF9wZm47Cj4gIAo+ICAJaGlnaF9tZW1vcnkgPSAodm9pZCAqKShtaW5faGlnaF9wZm4g
PDwgUEFHRV9TSElGVCk7Cj4gIAlrbWFwX2luaXQoKTsKPiAgI2VuZGlmCj4gKwo+ICsJZnJlZV9h
cmVhX2luaXQobWF4X3pvbmVfcGZuKTsKPiAgfQo+ICAKPiAgLyoKPiBkaWZmIC0tZ2l0IGEvbW0v
cGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5kZXggMzQzZDg3Yjg2OTdkLi4zNzY0
MzRjN2E3OGIgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4gKysrIGIvbW0vcGFnZV9h
bGxvYy5jCj4gQEAgLTc0MjksNyArNzQyOSw4IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2Zvcl9tZW1v
cnkocGdfZGF0YV90ICpwZ2RhdCwgaW50IG5pZCkKPiAgdm9pZCBfX2luaXQgZnJlZV9hcmVhX2lu
aXQodW5zaWduZWQgbG9uZyAqbWF4X3pvbmVfcGZuKQo+ICB7Cj4gIAl1bnNpZ25lZCBsb25nIHN0
YXJ0X3BmbiwgZW5kX3BmbjsKPiAtCWludCBpLCBuaWQ7Cj4gKwlpbnQgaSwgbmlkLCB6b25lOwo+
ICsJYm9vbCBkZXNjZW5kaW5nID0gZmFsc2U7Cj4gIAo+ICAJLyogUmVjb3JkIHdoZXJlIHRoZSB6
b25lIGJvdW5kYXJpZXMgYXJlICovCj4gIAltZW1zZXQoYXJjaF96b25lX2xvd2VzdF9wb3NzaWJs
ZV9wZm4sIDAsCj4gQEAgLTc0MzksMTMgKzc0NDAsMjYgQEAgdm9pZCBfX2luaXQgZnJlZV9hcmVh
X2luaXQodW5zaWduZWQgbG9uZyAqbWF4X3pvbmVfcGZuKQo+ICAKPiAgCXN0YXJ0X3BmbiA9IGZp
bmRfbWluX3Bmbl93aXRoX2FjdGl2ZV9yZWdpb25zKCk7Cj4gIAo+ICsJLyoKPiArCSAqIFNvbWUg
YXJjaGl0ZWN0dXJzLCBlLmcuIEFSQyBtYXkgaGF2ZSBaT05FX0hJR0hNRU0gYmVsb3cKPiArCSAq
IFpPTkVfTk9STUFMLiBGb3Igc3VjaCBjYXNlcyB3ZSBhbGxvdyBtYXhfem9uZV9wZm4gc29ydGVk
IGluIHRoZQo+ICsJICogZGVzY2VuZGluZyBvcmRlcgo+ICsJICovCj4gKwlpZiAoTUFYX05SX1pP
TkVTID4gMSAmJiBtYXhfem9uZV9wZm5bMF0gPiBtYXhfem9uZV9wZm5bMV0pCj4gKwkJZGVzY2Vu
ZGluZyA9IHRydWU7Cj4gKwo+ICAJZm9yIChpID0gMDsgaSA8IE1BWF9OUl9aT05FUzsgaSsrKSB7
Cj4gLQkJaWYgKGkgPT0gWk9ORV9NT1ZBQkxFKQo+ICsJCWlmIChkZXNjZW5kaW5nKQo+ICsJCQl6
b25lID0gTUFYX05SX1pPTkVTIC0gaSAtIDE7Cj4gKwkJZWxzZQo+ICsJCQl6b25lID0gaTsKPiAr
Cj4gKwkJaWYgKHpvbmUgPT0gWk9ORV9NT1ZBQkxFKQo+ICAJCQljb250aW51ZTsKPiAgCj4gLQkJ
ZW5kX3BmbiA9IG1heChtYXhfem9uZV9wZm5baV0sIHN0YXJ0X3Bmbik7Cj4gLQkJYXJjaF96b25l
X2xvd2VzdF9wb3NzaWJsZV9wZm5baV0gPSBzdGFydF9wZm47Cj4gLQkJYXJjaF96b25lX2hpZ2hl
c3RfcG9zc2libGVfcGZuW2ldID0gZW5kX3BmbjsKPiArCQllbmRfcGZuID0gbWF4KG1heF96b25l
X3Bmblt6b25lXSwgc3RhcnRfcGZuKTsKPiArCQlhcmNoX3pvbmVfbG93ZXN0X3Bvc3NpYmxlX3Bm
blt6b25lXSA9IHN0YXJ0X3BmbjsKPiArCQlhcmNoX3pvbmVfaGlnaGVzdF9wb3NzaWJsZV9wZm5b
em9uZV0gPSBlbmRfcGZuOwo+ICAKPiAgCQlzdGFydF9wZm4gPSBlbmRfcGZuOwo+ICAJfQo+IC0t
IAo+IDIuMjUuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
