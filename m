Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 909BB1C05B9
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0F2F320B35;
	Thu, 30 Apr 2020 21:09:25 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 736BF202FA
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 08:19:09 +0200 (CEST)
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F8D2206CD;
 Thu, 23 Apr 2020 06:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587622747;
 bh=XAOpZMZuKtQOaCSltmHvqjx8KIGVvFXiMPcjDZEl0rA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HxB6zMO+6CDyEhlfbmXcyjA3hwfo5BsFHXL+8EuxLXRM+KiN3MMLaZNN7rZgUR0qI
 jmPAEC89wzyqlGM5pBmEe3melg31/h3Qf5fK53tQ15so5OPKvaPCC/QB1tnqRS0yzf
 5yaRrjPukCXQt+ddPhw2nofayHbWi5BZUuPi3C28=
Date: Thu, 23 Apr 2020 09:18:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Message-ID: <20200423061846.GG14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-19-rppt@kernel.org>
 <20200423031454.GB4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423031454.GB4247@MiWiFi-R3L-srv>
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

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMTE6MTQ6NTRBTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNC8xMi8yMCBhdCAxMDo0OHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBUaGUgZnJlZV9h
cmVhX2luaXRfbm9kZSgpIGlzIG9ubHkgdXNlZCBieSB4ODYgdG8gaW5pdGlhbGl6ZSBhIG1lbW9y
eS1sZXNzCj4gPiBub2Rlcy4KPiA+IE1ha2UgaXRzIG5hbWUgcmVmbGVjdCB0aGlzIGFuZCBkcm9w
IGFsbCB0aGUgZnVuY3Rpb24gcGFyYW1ldGVycyBleGNlcHQgbm9kZQo+ID4gSUQgYXMgdGhleSBh
cmUgYW55d2F5IHplcm8uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJw
cHRAbGludXguaWJtLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gveDg2L21tL251bWEuYyB8IDUgKy0t
LS0KPiA+ICBpbmNsdWRlL2xpbnV4L21tLmggfCA5ICsrKy0tLS0tLQo+ID4gIG1tL3BhZ2VfYWxs
b2MuYyAgICB8IDcgKystLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL251bWEu
YyBiL2FyY2gveDg2L21tL251bWEuYwo+ID4gaW5kZXggZmUwMjRiMmFjNzk2Li44ZWU5NTIwMzhj
ODAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni9tbS9udW1hLmMKPiA+ICsrKyBiL2FyY2gveDg2
L21tL251bWEuYwo+ID4gQEAgLTczNywxMiArNzM3LDkgQEAgdm9pZCBfX2luaXQgeDg2X251bWFf
aW5pdCh2b2lkKQo+ID4gIAo+ID4gIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X21lbW9yeV9sZXNz
X25vZGUoaW50IG5pZCkKPiA+ICB7Cj4gPiAtCXVuc2lnbmVkIGxvbmcgem9uZXNfc2l6ZVtNQVhf
TlJfWk9ORVNdID0gezB9Owo+ID4gLQl1bnNpZ25lZCBsb25nIHpob2xlc19zaXplW01BWF9OUl9a
T05FU10gPSB7MH07Cj4gPiAtCj4gPiAgCS8qIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIG5vZGUg
ZGF0YS4gTWVtb3J5LWxlc3Mgbm9kZSBpcyBub3cgb25saW5lLiovCj4gPiAgCWFsbG9jX25vZGVf
ZGF0YShuaWQpOwo+ID4gLQlmcmVlX2FyZWFfaW5pdF9ub2RlKG5pZCwgem9uZXNfc2l6ZSwgMCwg
emhvbGVzX3NpemUpOwo+ID4gKwlmcmVlX2FyZWFfaW5pdF9tZW1vcnlsZXNzX25vZGUobmlkKTsK
PiA+ICAKPiA+ICAJLyoKPiA+ICAJICogQWxsIHpvbmVsaXN0cyB3aWxsIGJlIGJ1aWx0IGxhdGVy
IGluIHN0YXJ0X2tlcm5lbCgpIGFmdGVyIHBlciBjcHUKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiA+IGluZGV4IDFjMmVjYjQyZTA0My4u
Mjc2NjBmNmNmMjZlIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21tLmgKPiA+IEBAIC0yMjcyLDggKzIyNzIsNyBAQCBzdGF0aWMgaW5s
aW5lIHNwaW5sb2NrX3QgKnB1ZF9sb2NrKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwdWRfdCAqcHVk
KQo+ID4gIH0KPiA+ICAKPiA+ICBleHRlcm4gdm9pZCBfX2luaXQgcGFnZWNhY2hlX2luaXQodm9p
ZCk7Cj4gPiAtZXh0ZXJuIHZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwg
dW5zaWduZWQgbG9uZyAqIHpvbmVzX3NpemUsCj4gPiAtCQl1bnNpZ25lZCBsb25nIHpvbmVfc3Rh
cnRfcGZuLCB1bnNpZ25lZCBsb25nICp6aG9sZXNfc2l6ZSk7Cj4gPiArZXh0ZXJuIHZvaWQgX19p
bml0IGZyZWVfYXJlYV9pbml0X21lbW9yeWxlc3Nfbm9kZShpbnQgbmlkKTsKPiA+ICBleHRlcm4g
dm9pZCBmcmVlX2luaXRtZW0odm9pZCk7Cj4gPiAgCj4gPiAgLyoKPiA+IEBAIC0yMzQ1LDEwICsy
MzQ0LDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdldF9udW1fcGh5c3BhZ2VzKHZv
aWQpCj4gPiAgCj4gPiAgLyoKPiA+ICAgKiBVc2luZyBtZW1ibG9jayBub2RlIG1hcHBpbmdzLCBh
biBhcmNoaXRlY3R1cmUgbWF5IGluaXRpYWxpc2UgaXRzCj4gPiAtICogem9uZXMsIGFsbG9jYXRl
IHRoZSBiYWNraW5nIG1lbV9tYXAgYW5kIGFjY291bnQgZm9yIG1lbW9yeSBob2xlcyBpbiBhIG1v
cmUKPiA+IC0gKiBhcmNoaXRlY3R1cmUgaW5kZXBlbmRlbnQgbWFubmVyLiBUaGlzIGlzIGEgc3Vi
c3RpdHV0ZSBmb3IgY3JlYXRpbmcgdGhlCj4gPiAtICogem9uZV9zaXplc1tdIGFuZCB6aG9sZXNf
c2l6ZVtdIGFycmF5cyBhbmQgcGFzc2luZyB0aGVtIHRvCj4gPiAtICogZnJlZV9hcmVhX2luaXRf
bm9kZSgpCj4gPiArICogem9uZXMsIGFsbG9jYXRlIHRoZSBiYWNraW5nIG1lbV9tYXAgYW5kIGFj
Y291bnQgZm9yIG1lbW9yeSBob2xlcyBpbiBhbgo+ID4gKyAqIGFyY2hpdGVjdHVyZSBpbmRlcGVu
ZGVudCBtYW5uZXIuCj4gPiAgICoKPiA+ICAgKiBBbiBhcmNoaXRlY3R1cmUgaXMgZXhwZWN0ZWQg
dG8gcmVnaXN0ZXIgcmFuZ2Ugb2YgcGFnZSBmcmFtZXMgYmFja2VkIGJ5Cj4gPiAgICogcGh5c2lj
YWwgbWVtb3J5IHdpdGggbWVtYmxvY2tfYWRkW19ub2RlXSgpIGJlZm9yZSBjYWxsaW5nCj4gPiBk
aWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gPiBpbmRleCAz
NzY0MzRjN2E3OGIuLmU0NjIzMmVjNDg0OSAxMDA2NDQKPiA+IC0tLSBhL21tL3BhZ2VfYWxsb2Mu
Ywo+ID4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gPiBAQCAtNjk3OSwxMiArNjk3OSw5IEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBfX2ZyZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5zaWduZWQg
bG9uZyAqem9uZXNfc2l6ZSwKPiA+ICAJZnJlZV9hcmVhX2luaXRfY29yZShwZ2RhdCk7Cj4gPiAg
fQo+ID4gIAo+ID4gLXZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5z
aWduZWQgbG9uZyAqem9uZXNfc2l6ZSwKPiA+IC0JCQkJdW5zaWduZWQgbG9uZyBub2RlX3N0YXJ0
X3BmbiwKPiA+IC0JCQkJdW5zaWduZWQgbG9uZyAqemhvbGVzX3NpemUpCj4gPiArdm9pZCBfX2lu
aXQgZnJlZV9hcmVhX2luaXRfbWVtb3J5bGVzc19ub2RlKGludCBuaWQpCj4gPiAgewo+ID4gLQlf
X2ZyZWVfYXJlYV9pbml0X25vZGUobmlkLCB6b25lc19zaXplLCBub2RlX3N0YXJ0X3Bmbiwgemhv
bGVzX3NpemUsCj4gPiAtCQkJICAgICAgdHJ1ZSk7Cj4gPiArCV9fZnJlZV9hcmVhX2luaXRfbm9k
ZShuaWQsIE5VTEwsIDAsIE5VTEwsIGZhbHNlKTsKPiAKPiBDYW4gd2UgbW92ZSBmcmVlX2FyZWFf
aW5pdF9tZW1vcnlsZXNzX25vZGUoKSBkZWZpbml0aW9uIGludG8gCj4gYXJjaC94ODYvbW0vbnVt
YS5jIHNpbmNlIHRoZXJlJ3Mgb25seSBvbmUgY2FsbGVyIHRoZXJlPwo+IAo+IEFuZCBJIGFtIGFs
c28gd29uZGVyaW5nIGlmIGFkZGluZyBhIHdyYXBwZXIKPiBmcmVlX2FyZWFfaW5pdF9tZW1vcnls
ZXNzX25vZGUoKSBpcyBuZWNlc3NhcnkgaWYgaXQncyBvbmx5IGNhbGxlZCB0aGUKPiBmdW5jdGlv
biBmcmVlX2FyZWFfaW5pdF9ub2RlKCkuCgpZZWFoLCBJIHRoaW5rIHRoaXMgcGF0Y2ggY2FuIGJl
IGVudGlyZWx5IGRyb3BwZWQgYW5kIHRoZSBuZXh0IG9uZSBjb3VsZApiZSBzbGlnaHRseSB1cGRh
dGVkIDopClRoYW5rcyEKCj4gPiAgfQo+ID4gIAo+ID4gICNpZiAhZGVmaW5lZChDT05GSUdfRkxB
VF9OT0RFX01FTV9NQVApIC0tIAo+ID4gMi4yNS4xCj4gPiAKPiAKCi0tIApTaW5jZXJlbHkgeW91
cnMsCk1pa2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
