Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC2B1C05B5
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A20E420014;
	Thu, 30 Apr 2020 21:09:18 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 0BFA8204A1
 for <openrisc@lists.librecores.org>; Thu, 23 Apr 2020 02:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587600175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58JQfhRZc6FB9xi3d8SYqNSqIDMtxlavcMva87VT0e8=;
 b=FhrfLqBirMWpEl8Mm+d543pbPS3TA+QQCPU/BMNwzJi9+egMVKTlZn1xIp7a+vykonpk7J
 yrjTYhvwpfEDP5tBz2A7/htbRVtUoI71dZkFldyM7xJi82JwBrQn9/7jcxBUkINQAEqdNx
 liiui3KUwescieTwbipxErlEf45ivBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88--gGNncP1O_Gl0ijAAoAtsQ-1; Wed, 22 Apr 2020 20:02:53 -0400
X-MC-Unique: -gGNncP1O_Gl0ijAAoAtsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F54D18FF661;
 Thu, 23 Apr 2020 00:02:47 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89D21002383;
 Thu, 23 Apr 2020 00:02:44 +0000 (UTC)
Date: Thu, 23 Apr 2020 08:02:42 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200423000242.GX4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-6-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 05/21] mm: use free_area_init() instead of
 free_area_init_nodes()
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
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIGZyZWVfYXJlYV9pbml0KCkg
aGFzIGVmZmVjdGl2ZWx5IGJlY2FtZSBhIHdyYXBwZXIgZm9yCj4gZnJlZV9hcmVhX2luaXRfbm9k
ZXMoKSBhbmQgdGhlcmUgaXMgbm8gcG9pbnQgb2Yga2VlcGluZyBpdC4gU3RpbGwKPiBmcmVlX2Fy
ZWFfaW5pdCgpIG5hbWUgaXMgc2hvcnRlciBhbmQgbW9yZSBnZW5lcmFsIGFzIGl0IGRvZXMgbm90
IGltcGx5Cj4gbmVjZXNzaXR5IHRvIGluaXRpYWxpemUgbXVsdGlwbGUgbm9kZXMuCj4gCj4gUmVu
YW1lIGZyZWVfYXJlYV9pbml0X25vZGVzKCkgdG8gZnJlZV9hcmVhX2luaXQoKSwgdXBkYXRlIHRo
ZSBjYWxsZXJzIGFuZAo+IGRyb3Agb2xkIHZlcnNpb24gb2YgZnJlZV9hcmVhX2luaXQoKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0t
Cj4gIGFyY2gvYXJtNjQvbW0vaW5pdC5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9pYTY0
L21tL2NvbnRpZy5jICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2lhNjQvbW0vZGlzY29udGln
LmMgICAgICAgICB8ICAyICstCj4gIGFyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmMgICAgICAgIHwg
IDIgKy0KPiAgYXJjaC9taXBzL2xvb25nc29uNjQvbnVtYS5jICAgICAgfCAgMiArLQo+ICBhcmNo
L21pcHMvbW0vaW5pdC5jICAgICAgICAgICAgICB8ICAyICstCj4gIGFyY2gvbWlwcy9zZ2ktaXAy
Ny9pcDI3LW1lbW9yeS5jIHwgIDIgKy0KPiAgYXJjaC9wb3dlcnBjL21tL21lbS5jICAgICAgICAg
ICAgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICB8ICAyICstCj4g
IGFyY2gvczM5MC9tbS9pbml0LmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9zaC9tbS9p
bml0LmMgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL3NwYXJjL21tL2luaXRfNjQuYyAg
ICAgICAgICB8ICAyICstCj4gIGFyY2gveDg2L21tL2luaXQuYyAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICAgfCAgNyArKystLS0tCj4gIG1t
L3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgIHwgMTAgKystLS0tLS0tLQo+ICAxNSBmaWxl
cyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9tbS9pbml0LmMgYi9hcmNoL2FybTY0L21tL2luaXQuYwo+IGluZGV4
IGU0MjcyN2UzNTY4ZS4uYTY1MGFkYjM1OGVlIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvbW0v
aW5pdC5jCj4gKysrIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKPiBAQCAtMjA2LDcgKzIwNiw3IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCB6b25lX3NpemVzX2luaXQodW5zaWduZWQgbG9uZyBtaW4sIHVu
c2lnbmVkIGxvbmcgbWF4KQo+ICAjZW5kaWYKPiAgCW1heF96b25lX3BmbnNbWk9ORV9OT1JNQUxd
ID0gbWF4Owo+ICAKPiAtCWZyZWVfYXJlYV9pbml0X25vZGVzKG1heF96b25lX3BmbnMpOwo+ICsJ
ZnJlZV9hcmVhX2luaXQobWF4X3pvbmVfcGZucyk7Cj4gIH0KPiAgCj4gICNlbHNlCj4gZGlmZiAt
LWdpdCBhL2FyY2gvaWE2NC9tbS9jb250aWcuYyBiL2FyY2gvaWE2NC9tbS9jb250aWcuYwo+IGlu
ZGV4IDViMDBkYzM4OThlMS4uODc4NmZhNWM3NjEyIDEwMDY0NAo+IC0tLSBhL2FyY2gvaWE2NC9t
bS9jb250aWcuYwo+ICsrKyBiL2FyY2gvaWE2NC9tbS9jb250aWcuYwo+IEBAIC0yMTAsNiArMjEw
LDYgQEAgcGFnaW5nX2luaXQgKHZvaWQpCj4gIAkJcHJpbnRrKCJWaXJ0dWFsIG1lbV9tYXAgc3Rh
cnRzIGF0IDB4JXBcbiIsIG1lbV9tYXApOwo+ICAJfQo+ICAjZW5kaWYgLyogIUNPTkZJR19WSVJU
VUFMX01FTV9NQVAgKi8KPiAtCWZyZWVfYXJlYV9pbml0X25vZGVzKG1heF96b25lX3BmbnMpOwo+
ICsJZnJlZV9hcmVhX2luaXQobWF4X3pvbmVfcGZucyk7Cj4gIAl6ZXJvX3BhZ2VfbWVtbWFwX3B0
ciA9IHZpcnRfdG9fcGFnZShpYTY0X2ltdmEoZW1wdHlfemVyb19wYWdlKSk7Cj4gIH0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9pYTY0L21tL2Rpc2NvbnRpZy5jIGIvYXJjaC9pYTY0L21tL2Rpc2NvbnRp
Zy5jCj4gaW5kZXggNGYzM2Y2ZTdlMjA2Li5kZDgyODRiY2JmMTYgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9pYTY0L21tL2Rpc2NvbnRpZy5jCj4gKysrIGIvYXJjaC9pYTY0L21tL2Rpc2NvbnRpZy5jCj4g
QEAgLTYyNyw3ICs2MjcsNyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICAJbWF4
X3pvbmVfcGZuc1taT05FX0RNQTMyXSA9IG1heF9kbWE7Cj4gICNlbmRpZgo+ICAJbWF4X3pvbmVf
cGZuc1taT05FX05PUk1BTF0gPSBtYXhfcGZuOwo+IC0JZnJlZV9hcmVhX2luaXRfbm9kZXMobWF4
X3pvbmVfcGZucyk7Cj4gKwlmcmVlX2FyZWFfaW5pdChtYXhfem9uZV9wZm5zKTsKPiAgCj4gIAl6
ZXJvX3BhZ2VfbWVtbWFwX3B0ciA9IHZpcnRfdG9fcGFnZShpYTY0X2ltdmEoZW1wdHlfemVyb19w
YWdlKSk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9taWNyb2JsYXplL21tL2luaXQuYyBiL2Fy
Y2gvbWljcm9ibGF6ZS9tbS9pbml0LmMKPiBpbmRleCAxZmZiZmE5NmI5YjguLmRjYWE1M2QxMTMz
OSAxMDA2NDQKPiAtLS0gYS9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9t
aWNyb2JsYXplL21tL2luaXQuYwo+IEBAIC0xMTIsNyArMTEyLDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IHBhZ2luZ19pbml0KHZvaWQpCj4gICNlbmRpZgo+ICAKPiAgCS8qIFdlIGRvbid0IGhhdmUg
aG9sZXMgaW4gbWVtb3J5IG1hcCAqLwo+IC0JZnJlZV9hcmVhX2luaXRfbm9kZXMoem9uZXNfc2l6
ZSk7Cj4gKwlmcmVlX2FyZWFfaW5pdCh6b25lc19zaXplKTsKPiAgfQo+ICAKPiAgdm9pZCBfX2lu
aXQgc2V0dXBfbWVtb3J5KHZvaWQpCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9sb29uZ3NvbjY0
L251bWEuYyBiL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEuYwo+IGluZGV4IDFhZTA3MmRmNDgz
MS4uOTAxZjViZTVlZTc2IDEwMDY0NAo+IC0tLSBhL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEu
Ywo+ICsrKyBiL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEuYwo+IEBAIC0yNDcsNyArMjQ3LDcg
QEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKPiAgCXpvbmVzX3NpemVbWk9ORV9ETUEz
Ml0gPSBNQVhfRE1BMzJfUEZOOwo+ICAjZW5kaWYKPiAgCXpvbmVzX3NpemVbWk9ORV9OT1JNQUxd
ID0gbWF4X2xvd19wZm47Cj4gLQlmcmVlX2FyZWFfaW5pdF9ub2Rlcyh6b25lc19zaXplKTsKPiAr
CWZyZWVfYXJlYV9pbml0KHpvbmVzX3NpemUpOwo+ICB9Cj4gIAo+ICB2b2lkIF9faW5pdCBtZW1f
aW5pdCh2b2lkKQo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvbW0vaW5pdC5jIGIvYXJjaC9taXBz
L21tL2luaXQuYwo+IGluZGV4IDc5Njg0MDAwZGUwZS4uMTk3MTllOGI0MWE1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvbWlwcy9tbS9pbml0LmMKPiArKysgYi9hcmNoL21pcHMvbW0vaW5pdC5jCj4gQEAg
LTQxOCw3ICs0MTgsNyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICAJfQo+ICAj
ZW5kaWYKPiAgCj4gLQlmcmVlX2FyZWFfaW5pdF9ub2RlcyhtYXhfem9uZV9wZm5zKTsKPiArCWZy
ZWVfYXJlYV9pbml0KG1heF96b25lX3BmbnMpOwo+ICB9Cj4gIAo+ICAjaWZkZWYgQ09ORklHXzY0
QklUCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jIGIvYXJj
aC9taXBzL3NnaS1pcDI3L2lwMjctbWVtb3J5LmMKPiBpbmRleCBhNDU2OTFlNmFiOTAuLjEyMTMy
MTVlYTk2NSAxMDA2NDQKPiAtLS0gYS9hcmNoL21pcHMvc2dpLWlwMjcvaXAyNy1tZW1vcnkuYwo+
ICsrKyBiL2FyY2gvbWlwcy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jCj4gQEAgLTQxOSw3ICs0MTks
NyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICAKPiAgCXBhZ2V0YWJsZV9pbml0
KCk7Cj4gIAl6b25lc19zaXplW1pPTkVfTk9STUFMXSA9IG1heF9sb3dfcGZuOwo+IC0JZnJlZV9h
cmVhX2luaXRfbm9kZXMoem9uZXNfc2l6ZSk7Cj4gKwlmcmVlX2FyZWFfaW5pdCh6b25lc19zaXpl
KTsKPiAgfQo+ICAKPiAgdm9pZCBfX2luaXQgbWVtX2luaXQodm9pZCkKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL21tL21lbS5jIGIvYXJjaC9wb3dlcnBjL21tL21lbS5jCj4gaW5kZXggMDQx
ZWQ3Y2ZkMzQxLi4wZmNlYTIxZjI2YjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL21l
bS5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL21lbS5jCj4gQEAgLTI3MSw3ICsyNzEsNyBAQCB2
b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICAJbWF4X3pvbmVfcGZuc1taT05FX0hJR0hN
RU1dID0gbWF4X3BmbjsKPiAgI2VuZGlmCj4gIAo+IC0JZnJlZV9hcmVhX2luaXRfbm9kZXMobWF4
X3pvbmVfcGZucyk7Cj4gKwlmcmVlX2FyZWFfaW5pdChtYXhfem9uZV9wZm5zKTsKPiAgCj4gIAlt
YXJrX25vbnJhbV9ub3NhdmUoKTsKPiAgfQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2lu
aXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gaW5kZXggYjU1YmU0NGZmOWJkLi5mMmNlYWI3
N2I4ZTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiArKysgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwo+IEBAIC0zOSw3ICszOSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCB6b25l
X3NpemVzX2luaXQodm9pZCkKPiAgI2VuZGlmCj4gIAltYXhfem9uZV9wZm5zW1pPTkVfTk9STUFM
XSA9IG1heF9sb3dfcGZuOwo+ICAKPiAtCWZyZWVfYXJlYV9pbml0X25vZGVzKG1heF96b25lX3Bm
bnMpOwo+ICsJZnJlZV9hcmVhX2luaXQobWF4X3pvbmVfcGZucyk7Cj4gIH0KPiAgCj4gIHN0YXRp
YyB2b2lkIHNldHVwX3plcm9fcGFnZSh2b2lkKQo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvbW0v
aW5pdC5jIGIvYXJjaC9zMzkwL21tL2luaXQuYwo+IGluZGV4IDg3YjJkMDI0ZTc1YS4uYjExYmNm
NGRhNTMxIDEwMDY0NAo+IC0tLSBhL2FyY2gvczM5MC9tbS9pbml0LmMKPiArKysgYi9hcmNoL3Mz
OTAvbW0vaW5pdC5jCj4gQEAgLTEyMiw3ICsxMjIsNyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5p
dCh2b2lkKQo+ICAJbWVtc2V0KG1heF96b25lX3BmbnMsIDAsIHNpemVvZihtYXhfem9uZV9wZm5z
KSk7Cj4gIAltYXhfem9uZV9wZm5zW1pPTkVfRE1BXSA9IFBGTl9ET1dOKE1BWF9ETUFfQUREUkVT
Uyk7Cj4gIAltYXhfem9uZV9wZm5zW1pPTkVfTk9STUFMXSA9IG1heF9sb3dfcGZuOwo+IC0JZnJl
ZV9hcmVhX2luaXRfbm9kZXMobWF4X3pvbmVfcGZucyk7Cj4gKwlmcmVlX2FyZWFfaW5pdChtYXhf
em9uZV9wZm5zKTsKPiAgfQo+ICAKPiAgdm9pZCBtYXJrX3JvZGF0YV9ybyh2b2lkKQo+IGRpZmYg
LS1naXQgYS9hcmNoL3NoL21tL2luaXQuYyBiL2FyY2gvc2gvbW0vaW5pdC5jCj4gaW5kZXggYjlk
ZTJkNGZhNTdlLi4yNTczYjE2M2IzYWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zaC9tbS9pbml0LmMK
PiArKysgYi9hcmNoL3NoL21tL2luaXQuYwo+IEBAIC0zMzQsNyArMzM0LDcgQEAgdm9pZCBfX2lu
aXQgcGFnaW5nX2luaXQodm9pZCkKPiAgCj4gIAltZW1zZXQobWF4X3pvbmVfcGZucywgMCwgc2l6
ZW9mKG1heF96b25lX3BmbnMpKTsKPiAgCW1heF96b25lX3BmbnNbWk9ORV9OT1JNQUxdID0gbWF4
X2xvd19wZm47Cj4gLQlmcmVlX2FyZWFfaW5pdF9ub2RlcyhtYXhfem9uZV9wZm5zKTsKPiArCWZy
ZWVfYXJlYV9pbml0KG1heF96b25lX3BmbnMpOwo+ICB9Cj4gIAo+ICB1bnNpZ25lZCBpbnQgbWVt
X2luaXRfZG9uZSA9IDA7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvbW0vaW5pdF82NC5jIGIv
YXJjaC9zcGFyYy9tbS9pbml0XzY0LmMKPiBpbmRleCAxY2YwZDY2NmRlYTMuLjc5ZDNjNWUwODAy
ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3NwYXJjL21tL2luaXRfNjQuYwo+ICsrKyBiL2FyY2gvc3Bh
cmMvbW0vaW5pdF82NC5jCj4gQEAgLTI0ODgsNyArMjQ4OCw3IEBAIHZvaWQgX19pbml0IHBhZ2lu
Z19pbml0KHZvaWQpCj4gIAo+ICAJCW1heF96b25lX3BmbnNbWk9ORV9OT1JNQUxdID0gZW5kX3Bm
bjsKPiAgCj4gLQkJZnJlZV9hcmVhX2luaXRfbm9kZXMobWF4X3pvbmVfcGZucyk7Cj4gKwkJZnJl
ZV9hcmVhX2luaXQobWF4X3pvbmVfcGZucyk7Cj4gIAl9Cj4gIAo+ICAJcHJpbnRrKCJCb290aW5n
IExpbnV4Li4uXG4iKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0vaW5pdC5jIGIvYXJjaC94
ODYvbW0vaW5pdC5jCj4gaW5kZXggMWJiYTE2YzU3NDJiLi40MDE2ZjJiZjVkODcgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC94ODYvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC94ODYvbW0vaW5pdC5jCj4gQEAg
LTk0OSw3ICs5NDksNyBAQCB2b2lkIF9faW5pdCB6b25lX3NpemVzX2luaXQodm9pZCkKPiAgCW1h
eF96b25lX3BmbnNbWk9ORV9ISUdITUVNXQk9IG1heF9wZm47Cj4gICNlbmRpZgo+ICAKPiAtCWZy
ZWVfYXJlYV9pbml0X25vZGVzKG1heF96b25lX3BmbnMpOwo+ICsJZnJlZV9hcmVhX2luaXQobWF4
X3pvbmVfcGZucyk7Cj4gIH0KPiAgCj4gIF9fdmlzaWJsZSBERUZJTkVfUEVSX0NQVV9TSEFSRURf
QUxJR05FRChzdHJ1Y3QgdGxiX3N0YXRlLCBjcHVfdGxic3RhdGUpID0gewo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCBkOWEyNTZh
OTdhYzUuLjFjMmVjYjQyZTA0MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBAQCAtMjI3Miw3ICsyMjcyLDYgQEAgc3RhdGljIGlu
bGluZSBzcGlubG9ja190ICpwdWRfbG9jayhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHVkX3QgKnB1
ZCkKPiAgfQo+ICAKPiAgZXh0ZXJuIHZvaWQgX19pbml0IHBhZ2VjYWNoZV9pbml0KHZvaWQpOwo+
IC1leHRlcm4gdm9pZCBmcmVlX2FyZWFfaW5pdCh1bnNpZ25lZCBsb25nICogbWF4X3pvbmVfcGZu
KTsKPiAgZXh0ZXJuIHZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5z
aWduZWQgbG9uZyAqIHpvbmVzX3NpemUsCj4gIAkJdW5zaWduZWQgbG9uZyB6b25lX3N0YXJ0X3Bm
biwgdW5zaWduZWQgbG9uZyAqemhvbGVzX3NpemUpOwo+ICBleHRlcm4gdm9pZCBmcmVlX2luaXRt
ZW0odm9pZCk7Cj4gQEAgLTIzNTMsMjEgKzIzNTIsMjEgQEAgc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIGdldF9udW1fcGh5c3BhZ2VzKHZvaWQpCj4gICAqCj4gICAqIEFuIGFyY2hpdGVjdHVy
ZSBpcyBleHBlY3RlZCB0byByZWdpc3RlciByYW5nZSBvZiBwYWdlIGZyYW1lcyBiYWNrZWQgYnkK
PiAgICogcGh5c2ljYWwgbWVtb3J5IHdpdGggbWVtYmxvY2tfYWRkW19ub2RlXSgpIGJlZm9yZSBj
YWxsaW5nCj4gLSAqIGZyZWVfYXJlYV9pbml0X25vZGVzKCkgcGFzc2luZyBpbiB0aGUgUEZOIGVh
Y2ggem9uZSBlbmRzIGF0LiBBdCBhIGJhc2ljCj4gKyAqIGZyZWVfYXJlYV9pbml0KCkgcGFzc2lu
ZyBpbiB0aGUgUEZOIGVhY2ggem9uZSBlbmRzIGF0LiBBdCBhIGJhc2ljCj4gICAqIHVzYWdlLCBh
biBhcmNoaXRlY3R1cmUgaXMgZXhwZWN0ZWQgdG8gZG8gc29tZXRoaW5nIGxpa2UKPiAgICoKPiAg
ICogdW5zaWduZWQgbG9uZyBtYXhfem9uZV9wZm5zW01BWF9OUl9aT05FU10gPSB7bWF4X2RtYSwg
bWF4X25vcm1hbF9wZm4sCj4gICAqIAkJCQkJCQkgbWF4X2hpZ2htZW1fcGZufTsKPiAgICogZm9y
X2VhY2hfdmFsaWRfcGh5c2ljYWxfcGFnZV9yYW5nZSgpCj4gICAqIAltZW1ibG9ja19hZGRfbm9k
ZShiYXNlLCBzaXplLCBuaWQpCj4gLSAqIGZyZWVfYXJlYV9pbml0X25vZGVzKG1heF96b25lX3Bm
bnMpOwo+ICsgKiBmcmVlX2FyZWFfaW5pdChtYXhfem9uZV9wZm5zKTsKPiAgICoKPiAgICogZnJl
ZV9ib290bWVtX3dpdGhfYWN0aXZlX3JlZ2lvbnMoKSBjYWxscyBmcmVlX2Jvb3RtZW1fbm9kZSgp
IGZvciBlYWNoCj4gICAqIHJlZ2lzdGVyZWQgcGh5c2ljYWwgcGFnZSByYW5nZS4gIFNpbWlsYXJs
eQo+ICAgKiBzcGFyc2VfbWVtb3J5X3ByZXNlbnRfd2l0aF9hY3RpdmVfcmVnaW9ucygpIGNhbGxz
IG1lbW9yeV9wcmVzZW50KCkgZm9yCj4gICAqIGVhY2ggcmFuZ2Ugd2hlbiBTUEFSU0VNRU0gaXMg
ZW5hYmxlZC4KPiAgICovCj4gLWV4dGVybiB2b2lkIGZyZWVfYXJlYV9pbml0X25vZGVzKHVuc2ln
bmVkIGxvbmcgKm1heF96b25lX3Bmbik7Cj4gK3ZvaWQgZnJlZV9hcmVhX2luaXQodW5zaWduZWQg
bG9uZyAqbWF4X3pvbmVfcGZuKTsKPiAgdW5zaWduZWQgbG9uZyBub2RlX21hcF9wZm5fYWxpZ25t
ZW50KHZvaWQpOwo+ICB1bnNpZ25lZCBsb25nIF9fYWJzZW50X3BhZ2VzX2luX3JhbmdlKGludCBu
aWQsIHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAo+ICAJCQkJCQl1bnNpZ25lZCBsb25nIGVuZF9w
Zm4pOwo+IGRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBp
bmRleCA1MzA3MDFiMzhiYzcuLjdmNmEzMDgxZWRiOCAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlX2Fs
bG9jLmMKPiArKysgYi9tbS9wYWdlX2FsbG9jLmMKPiBAQCAtNzQyOCw3ICs3NDI4LDcgQEAgc3Rh
dGljIHZvaWQgY2hlY2tfZm9yX21lbW9yeShwZ19kYXRhX3QgKnBnZGF0LCBpbnQgbmlkKQo+ICB9
Cj4gIAo+ICAvKioKPiAtICogZnJlZV9hcmVhX2luaXRfbm9kZXMgLSBJbml0aWFsaXNlIGFsbCBw
Z19kYXRhX3QgYW5kIHpvbmUgZGF0YQo+ICsgKiBmcmVlX2FyZWFfaW5pdCAtIEluaXRpYWxpc2Ug
YWxsIHBnX2RhdGFfdCBhbmQgem9uZSBkYXRhCj4gICAqIEBtYXhfem9uZV9wZm46IGFuIGFycmF5
IG9mIG1heCBQRk5zIGZvciBlYWNoIHpvbmUKPiAgICoKPiAgICogVGhpcyB3aWxsIGNhbGwgZnJl
ZV9hcmVhX2luaXRfbm9kZSgpIGZvciBlYWNoIGFjdGl2ZSBub2RlIGluIHRoZSBzeXN0ZW0uCiAg
ICAgICAgICAgICAgIEl0J3MgX19mcmVlX2FyZWFfaW5pdF9ub2RlKCkgaGVyZSBiZWluZyBjYWxs
ZWQsIHdoaWxlCml0IGRvc24ndCBtYXR0ZXIgbXVjaCBiZWNhdXNlIGl0J3MgdXBkYXRlZCBpbiBs
YXRlciBwYXRjaC4KPiBAQCAtNzQ0MCw3ICs3NDQwLDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfZm9y
X21lbW9yeShwZ19kYXRhX3QgKnBnZGF0LCBpbnQgbmlkKQo+ICAgKiBzdGFydHMgd2hlcmUgdGhl
IHByZXZpb3VzIG9uZSBlbmRlZC4gRm9yIGV4YW1wbGUsIFpPTkVfRE1BMzIgc3RhcnRzCj4gICAq
IGF0IGFyY2hfbWF4X2RtYV9wZm4uCj4gICAqLwo+IC12b2lkIF9faW5pdCBmcmVlX2FyZWFfaW5p
dF9ub2Rlcyh1bnNpZ25lZCBsb25nICptYXhfem9uZV9wZm4pCj4gK3ZvaWQgX19pbml0IGZyZWVf
YXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbikKPiAgewo+ICAJdW5zaWduZWQg
bG9uZyBzdGFydF9wZm4sIGVuZF9wZm47Cj4gIAlpbnQgaSwgbmlkOwo+IEBAIC03NzAwLDEyICs3
NzAwLDYgQEAgdm9pZCBfX2luaXQgc2V0X2RtYV9yZXNlcnZlKHVuc2lnbmVkIGxvbmcgbmV3X2Rt
YV9yZXNlcnZlKQo+ICAJZG1hX3Jlc2VydmUgPSBuZXdfZG1hX3Jlc2VydmU7Cj4gIH0KPiAgCj4g
LXZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbikK
PiAtewo+IC0JaW5pdF91bmF2YWlsYWJsZV9tZW0oKTsKPiAtCWZyZWVfYXJlYV9pbml0X25vZGVz
KG1heF96b25lX3Bmbik7Cj4gLX0KPiAtCj4gIHN0YXRpYyBpbnQgcGFnZV9hbGxvY19jcHVfZGVh
ZCh1bnNpZ25lZCBpbnQgY3B1KQo+ICB7CgpSZXZpZXdlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJl
ZGhhdC5jb20+Cgo+ICAKPiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
