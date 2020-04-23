Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (unknown [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 887791C05D4
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1A1BF20B33;
	Thu, 30 Apr 2020 21:09:24 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mail.librecores.org (Postfix) with ESMTP id 050DD2091D
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 05:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587611709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUgyxTdqEN6SINdaIWtc3kKJE7aXkFDNuKscYDglBVE=;
 b=cysabH1bBL/eRbYutrh5jevRwQUb2v4x+8OxYdIgZL7hwJPNIxQLKXyMlD7eCUkIBmD4io
 5ddAarBBJE5AlUsPpilup2QAB/kXao8WX3XPwFupRu6FVbMCj4PtywRONWgyrnEMKfKgtz
 Qf1qM5kITOcTmEOMBWfYBuNcBq+dVVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-i0UUQLvzOLSX62nPLmus1g-1; Wed, 22 Apr 2020 23:15:07 -0400
X-MC-Unique: i0UUQLvzOLSX62nPLmus1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BFAA1005510;
 Thu, 23 Apr 2020 03:15:01 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8185D19C69;
 Thu, 23 Apr 2020 03:14:58 +0000 (UTC)
Date: Thu, 23 Apr 2020 11:14:54 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200423031454.GB4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-19-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-19-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 18/21] mm: rename free_area_init_node() to
 free_area_init_memoryless_node()
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIGZyZWVfYXJlYV9pbml0X25v
ZGUoKSBpcyBvbmx5IHVzZWQgYnkgeDg2IHRvIGluaXRpYWxpemUgYSBtZW1vcnktbGVzcwo+IG5v
ZGVzLgo+IE1ha2UgaXRzIG5hbWUgcmVmbGVjdCB0aGlzIGFuZCBkcm9wIGFsbCB0aGUgZnVuY3Rp
b24gcGFyYW1ldGVycyBleGNlcHQgbm9kZQo+IElEIGFzIHRoZXkgYXJlIGFueXdheSB6ZXJvLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiAt
LS0KPiAgYXJjaC94ODYvbW0vbnVtYS5jIHwgNSArLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmgg
fCA5ICsrKy0tLS0tLQo+ICBtbS9wYWdlX2FsbG9jLmMgICAgfCA3ICsrLS0tLS0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9tbS9udW1hLmMgYi9hcmNoL3g4Ni9tbS9udW1hLmMKPiBpbmRleCBmZTAy
NGIyYWM3OTYuLjhlZTk1MjAzOGM4MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9tbS9udW1hLmMK
PiArKysgYi9hcmNoL3g4Ni9tbS9udW1hLmMKPiBAQCAtNzM3LDEyICs3MzcsOSBAQCB2b2lkIF9f
aW5pdCB4ODZfbnVtYV9pbml0KHZvaWQpCj4gIAo+ICBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9t
ZW1vcnlfbGVzc19ub2RlKGludCBuaWQpCj4gIHsKPiAtCXVuc2lnbmVkIGxvbmcgem9uZXNfc2l6
ZVtNQVhfTlJfWk9ORVNdID0gezB9Owo+IC0JdW5zaWduZWQgbG9uZyB6aG9sZXNfc2l6ZVtNQVhf
TlJfWk9ORVNdID0gezB9Owo+IC0KPiAgCS8qIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIG5vZGUg
ZGF0YS4gTWVtb3J5LWxlc3Mgbm9kZSBpcyBub3cgb25saW5lLiovCj4gIAlhbGxvY19ub2RlX2Rh
dGEobmlkKTsKPiAtCWZyZWVfYXJlYV9pbml0X25vZGUobmlkLCB6b25lc19zaXplLCAwLCB6aG9s
ZXNfc2l6ZSk7Cj4gKwlmcmVlX2FyZWFfaW5pdF9tZW1vcnlsZXNzX25vZGUobmlkKTsKPiAgCj4g
IAkvKgo+ICAJICogQWxsIHpvbmVsaXN0cyB3aWxsIGJlIGJ1aWx0IGxhdGVyIGluIHN0YXJ0X2tl
cm5lbCgpIGFmdGVyIHBlciBjcHUKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIv
aW5jbHVkZS9saW51eC9tbS5oCj4gaW5kZXggMWMyZWNiNDJlMDQzLi4yNzY2MGY2Y2YyNmUgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5o
Cj4gQEAgLTIyNzIsOCArMjI3Miw3IEBAIHN0YXRpYyBpbmxpbmUgc3BpbmxvY2tfdCAqcHVkX2xv
Y2soc3RydWN0IG1tX3N0cnVjdCAqbW0sIHB1ZF90ICpwdWQpCj4gIH0KPiAgCj4gIGV4dGVybiB2
b2lkIF9faW5pdCBwYWdlY2FjaGVfaW5pdCh2b2lkKTsKPiAtZXh0ZXJuIHZvaWQgX19pbml0IGZy
ZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5zaWduZWQgbG9uZyAqIHpvbmVzX3NpemUsCj4g
LQkJdW5zaWduZWQgbG9uZyB6b25lX3N0YXJ0X3BmbiwgdW5zaWduZWQgbG9uZyAqemhvbGVzX3Np
emUpOwo+ICtleHRlcm4gdm9pZCBfX2luaXQgZnJlZV9hcmVhX2luaXRfbWVtb3J5bGVzc19ub2Rl
KGludCBuaWQpOwo+ICBleHRlcm4gdm9pZCBmcmVlX2luaXRtZW0odm9pZCk7Cj4gIAo+ICAvKgo+
IEBAIC0yMzQ1LDEwICsyMzQ0LDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdldF9u
dW1fcGh5c3BhZ2VzKHZvaWQpCj4gIAo+ICAvKgo+ICAgKiBVc2luZyBtZW1ibG9jayBub2RlIG1h
cHBpbmdzLCBhbiBhcmNoaXRlY3R1cmUgbWF5IGluaXRpYWxpc2UgaXRzCj4gLSAqIHpvbmVzLCBh
bGxvY2F0ZSB0aGUgYmFja2luZyBtZW1fbWFwIGFuZCBhY2NvdW50IGZvciBtZW1vcnkgaG9sZXMg
aW4gYSBtb3JlCj4gLSAqIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudCBtYW5uZXIuIFRoaXMgaXMg
YSBzdWJzdGl0dXRlIGZvciBjcmVhdGluZyB0aGUKPiAtICogem9uZV9zaXplc1tdIGFuZCB6aG9s
ZXNfc2l6ZVtdIGFycmF5cyBhbmQgcGFzc2luZyB0aGVtIHRvCj4gLSAqIGZyZWVfYXJlYV9pbml0
X25vZGUoKQo+ICsgKiB6b25lcywgYWxsb2NhdGUgdGhlIGJhY2tpbmcgbWVtX21hcCBhbmQgYWNj
b3VudCBmb3IgbWVtb3J5IGhvbGVzIGluIGFuCj4gKyAqIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVu
dCBtYW5uZXIuCj4gICAqCj4gICAqIEFuIGFyY2hpdGVjdHVyZSBpcyBleHBlY3RlZCB0byByZWdp
c3RlciByYW5nZSBvZiBwYWdlIGZyYW1lcyBiYWNrZWQgYnkKPiAgICogcGh5c2ljYWwgbWVtb3J5
IHdpdGggbWVtYmxvY2tfYWRkW19ub2RlXSgpIGJlZm9yZSBjYWxsaW5nCj4gZGlmZiAtLWdpdCBh
L21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwo+IGluZGV4IDM3NjQzNGM3YTc4Yi4u
ZTQ2MjMyZWM0ODQ5IDEwMDY0NAo+IC0tLSBhL21tL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL21tL3Bh
Z2VfYWxsb2MuYwo+IEBAIC02OTc5LDEyICs2OTc5LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IF9f
ZnJlZV9hcmVhX2luaXRfbm9kZShpbnQgbmlkLCB1bnNpZ25lZCBsb25nICp6b25lc19zaXplLAo+
ICAJZnJlZV9hcmVhX2luaXRfY29yZShwZ2RhdCk7Cj4gIH0KPiAgCj4gLXZvaWQgX19pbml0IGZy
ZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5zaWduZWQgbG9uZyAqem9uZXNfc2l6ZSwKPiAt
CQkJCXVuc2lnbmVkIGxvbmcgbm9kZV9zdGFydF9wZm4sCj4gLQkJCQl1bnNpZ25lZCBsb25nICp6
aG9sZXNfc2l6ZSkKPiArdm9pZCBfX2luaXQgZnJlZV9hcmVhX2luaXRfbWVtb3J5bGVzc19ub2Rl
KGludCBuaWQpCj4gIHsKPiAtCV9fZnJlZV9hcmVhX2luaXRfbm9kZShuaWQsIHpvbmVzX3NpemUs
IG5vZGVfc3RhcnRfcGZuLCB6aG9sZXNfc2l6ZSwKPiAtCQkJICAgICAgdHJ1ZSk7Cj4gKwlfX2Zy
ZWVfYXJlYV9pbml0X25vZGUobmlkLCBOVUxMLCAwLCBOVUxMLCBmYWxzZSk7CgpDYW4gd2UgbW92
ZSBmcmVlX2FyZWFfaW5pdF9tZW1vcnlsZXNzX25vZGUoKSBkZWZpbml0aW9uIGludG8gCmFyY2gv
eDg2L21tL251bWEuYyBzaW5jZSB0aGVyZSdzIG9ubHkgb25lIGNhbGxlciB0aGVyZT8KCkFuZCBJ
IGFtIGFsc28gd29uZGVyaW5nIGlmIGFkZGluZyBhIHdyYXBwZXIKZnJlZV9hcmVhX2luaXRfbWVt
b3J5bGVzc19ub2RlKCkgaXMgbmVjZXNzYXJ5IGlmIGl0J3Mgb25seSBjYWxsZWQgdGhlCmZ1bmN0
aW9uIGZyZWVfYXJlYV9pbml0X25vZGUoKS4KCj4gIH0KPiAgCj4gICNpZiAhZGVmaW5lZChDT05G
SUdfRkxBVF9OT0RFX01FTV9NQVApCj4gLS0gCj4gMi4yNS4xCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
