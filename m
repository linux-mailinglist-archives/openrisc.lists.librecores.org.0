Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4238F1C05CE
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E139F206AB;
	Thu, 30 Apr 2020 21:09:39 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A406920AB8
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:15:08 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE7A12184D;
 Wed, 29 Apr 2020 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162507;
 bh=wSiCtht7XGk0G5xXo1EFLkbEsxIE900LvsbYCn6Fzv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ty0Ezl2gwznQdHX/QjiKXUjVaUpaBjDw0d0R4fHNz9rFZfs92Jr0GLqFRn/SFE4B+
 sfXFVBXVsiMlbTQ50baltSPOWN5UJEyf7Lwwa3iCKJ4HhksnoH4xoKURE8roUYESqq
 i7MwEHqmOm4Ft3dxu0NpJmgq3kWsOGXxx8BgGNLY=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:19 +0300
Message-Id: <20200429121126.17989-14-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 13/20] unicore32: simplify detection of memory
 zone boundaries
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGZyZWVfYXJlYV9p
bml0KCkgZnVuY3Rpb24gb25seSByZXF1aXJlcyB0aGUgZGVmaW5pdGlvbiBvZiBtYXhpbWFsIFBG
Tgpmb3IgZWFjaCBvZiB0aGUgc3VwcG9ydGVkIHpvbmUgcmF0ZXIgdGhhbiBjYWxjdWxhdGlvbiBv
ZiBhY3R1YWwgem9uZSBzaXplcwphbmQgdGhlIHNpemVzIG9mIHRoZSBob2xlcyBiZXR3ZWVuIHRo
ZSB6b25lcy4KCkFmdGVyIHJlbW92YWwgb2YgQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAg
dGhlIGZyZWVfYXJlYV9pbml0KCkgaXMKYXZhaWxhYmxlIHRvIGFsbCBhcmNoaXRlY3R1cmVzLgoK
VXNpbmcgdGhpcyBmdW5jdGlvbiBpbnN0ZWFkIG9mIGZyZWVfYXJlYV9pbml0X25vZGUoKSBzaW1w
bGlmaWVzIHRoZSB6b25lCmRldGVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQg
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9tZW1v
cnkuaCAgfCAgMiArLQogYXJjaC91bmljb3JlMzIvaW5jbHVkZS9tYWNoL21lbW9yeS5oIHwgIDYg
KystLQogYXJjaC91bmljb3JlMzIva2VybmVsL3BjaS5jICAgICAgICAgIHwgMTQgKystLS0tLS0t
CiBhcmNoL3VuaWNvcmUzMi9tbS9pbml0LmMgICAgICAgICAgICAgfCA0MyArKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvdW5pY29yZTMyL2luY2x1ZGUvYXNtL21lbW9y
eS5oIGIvYXJjaC91bmljb3JlMzIvaW5jbHVkZS9hc20vbWVtb3J5LmgKaW5kZXggMjNjOTMxMDVm
OThmLi42NjI4NTE3OGRkOWIgMTAwNjQ0Ci0tLSBhL2FyY2gvdW5pY29yZTMyL2luY2x1ZGUvYXNt
L21lbW9yeS5oCisrKyBiL2FyY2gvdW5pY29yZTMyL2luY2x1ZGUvYXNtL21lbW9yeS5oCkBAIC02
MCw3ICs2MCw3IEBACiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogCiAjaWZuZGVmIGFyY2hfYWRqdXN0
X3pvbmVzCi0jZGVmaW5lIGFyY2hfYWRqdXN0X3pvbmVzKHNpemUsIGhvbGVzKSBkbyB7IH0gd2hp
bGUgKDApCisjZGVmaW5lIGFyY2hfYWRqdXN0X3pvbmVzKG1heF96b25lX3BmbikgZG8geyB9IHdo
aWxlICgwKQogI2VuZGlmCiAKIC8qCmRpZmYgLS1naXQgYS9hcmNoL3VuaWNvcmUzMi9pbmNsdWRl
L21hY2gvbWVtb3J5LmggYi9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL21hY2gvbWVtb3J5LmgKaW5k
ZXggMmI1MjdjZWRkMDNkLi5iNGU2MDM1Y2I5YTMgMTAwNjQ0Ci0tLSBhL2FyY2gvdW5pY29yZTMy
L2luY2x1ZGUvbWFjaC9tZW1vcnkuaAorKysgYi9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL21hY2gv
bWVtb3J5LmgKQEAgLTI1LDEwICsyNSwxMCBAQAogCiAjaWYgIWRlZmluZWQoX19BU1NFTUJMWV9f
KSAmJiBkZWZpbmVkKENPTkZJR19QQ0kpCiAKLXZvaWQgcHV2M19wY2lfYWRqdXN0X3pvbmVzKHVu
c2lnbmVkIGxvbmcgKnNpemUsIHVuc2lnbmVkIGxvbmcgKmhvbGVzKTsKK3ZvaWQgcHV2M19wY2lf
YWRqdXN0X3pvbmVzKHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3Bmbik7CiAKLSNkZWZpbmUgYXJj
aF9hZGp1c3Rfem9uZXMoc2l6ZSwgaG9sZXMpIFwKLQlwdXYzX3BjaV9hZGp1c3Rfem9uZXMoc2l6
ZSwgaG9sZXMpCisjZGVmaW5lIGFyY2hfYWRqdXN0X3pvbmVzKG1heF96b25lX3BmbikgXAorCXB1
djNfcGNpX2FkanVzdF96b25lcyhtYXhfem9uZV9wZm4pCiAKICNlbmRpZgogCmRpZmYgLS1naXQg
YS9hcmNoL3VuaWNvcmUzMi9rZXJuZWwvcGNpLmMgYi9hcmNoL3VuaWNvcmUzMi9rZXJuZWwvcGNp
LmMKaW5kZXggZWZhMDRhOTRkY2RiLi4wZDA5OGFhMDViNDcgMTAwNjQ0Ci0tLSBhL2FyY2gvdW5p
Y29yZTMyL2tlcm5lbC9wY2kuYworKysgYi9hcmNoL3VuaWNvcmUzMi9rZXJuZWwvcGNpLmMKQEAg
LTEzMywyMSArMTMzLDExIEBAIHN0YXRpYyBpbnQgcGNpX3B1djNfbWFwX2lycShjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqZGV2LCB1OCBzbG90LCB1OCBwaW4pCiAgKiBUaGlzIGlzIHJlYWxseSB1Z2x5
IGFuZCB3ZSBuZWVkIGEgYmV0dGVyIHdheSBvZiBzcGVjaWZ5aW5nCiAgKiBETUEtY2FwYWJsZSBy
ZWdpb25zIG9mIG1lbW9yeS4KICAqLwotdm9pZCBfX2luaXQgcHV2M19wY2lfYWRqdXN0X3pvbmVz
KHVuc2lnbmVkIGxvbmcgKnpvbmVfc2l6ZSwKLQl1bnNpZ25lZCBsb25nICp6aG9sZV9zaXplKQor
dm9pZCBfX2luaXQgcHV2M19wY2lfYWRqdXN0X3pvbmVzKHVuc2lnbmVkIGxvbmcgbWF4X3pvbmVf
cGZuKQogewogCXVuc2lnbmVkIGludCBzeiA9IFNaXzEyOE0gPj4gUEFHRV9TSElGVDsKIAotCS8q
Ci0JICogT25seSBhZGp1c3QgaWYgPiAxMjhNIG9uIGN1cnJlbnQgc3lzdGVtCi0JICovCi0JaWYg
KHpvbmVfc2l6ZVswXSA8PSBzeikKLQkJcmV0dXJuOwotCi0Jem9uZV9zaXplWzFdID0gem9uZV9z
aXplWzBdIC0gc3o7Ci0Jem9uZV9zaXplWzBdID0gc3o7Ci0JemhvbGVfc2l6ZVsxXSA9IHpob2xl
X3NpemVbMF07Ci0JemhvbGVfc2l6ZVswXSA9IDA7CisJbWF4X3pvbmVfcGZuW1pPTkVfRE1BXSA9
IHN6OwogfQogCiAvKgpkaWZmIC0tZ2l0IGEvYXJjaC91bmljb3JlMzIvbW0vaW5pdC5jIGIvYXJj
aC91bmljb3JlMzIvbW0vaW5pdC5jCmluZGV4IDZjZjAxMGZhZGM3YS4uNTI0MjVkMzgzY2VhIDEw
MDY0NAotLS0gYS9hcmNoL3VuaWNvcmUzMi9tbS9pbml0LmMKKysrIGIvYXJjaC91bmljb3JlMzIv
bW0vaW5pdC5jCkBAIC02MSw0NiArNjEsMjEgQEAgc3RhdGljIHZvaWQgX19pbml0IGZpbmRfbGlt
aXRzKHVuc2lnbmVkIGxvbmcgKm1pbiwgdW5zaWduZWQgbG9uZyAqbWF4X2xvdywKIAl9CiB9CiAK
LXN0YXRpYyB2b2lkIF9faW5pdCB1YzMyX2Jvb3RtZW1fZnJlZSh1bnNpZ25lZCBsb25nIG1pbiwg
dW5zaWduZWQgbG9uZyBtYXhfbG93LAotCXVuc2lnbmVkIGxvbmcgbWF4X2hpZ2gpCitzdGF0aWMg
dm9pZCBfX2luaXQgdWMzMl9ib290bWVtX2ZyZWUodW5zaWduZWQgbG9uZyBtYXhfbG93KQogewot
CXVuc2lnbmVkIGxvbmcgem9uZV9zaXplW01BWF9OUl9aT05FU10sIHpob2xlX3NpemVbTUFYX05S
X1pPTkVTXTsKLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7CisJdW5zaWduZWQgbG9uZyBt
YXhfem9uZV9wZm5bTUFYX05SX1pPTkVTXSA9IHsgMCB9OwogCi0JLyoKLQkgKiBpbml0aWFsaXNl
IHRoZSB6b25lcy4KLQkgKi8KLQltZW1zZXQoem9uZV9zaXplLCAwLCBzaXplb2Yoem9uZV9zaXpl
KSk7Ci0KLQkvKgotCSAqIFRoZSBtZW1vcnkgc2l6ZSBoYXMgYWxyZWFkeSBiZWVuIGRldGVybWlu
ZWQuICBJZiB3ZSBuZWVkCi0JICogdG8gZG8gYW55dGhpbmcgZmFuY3kgd2l0aCB0aGUgYWxsb2Nh
dGlvbiBvZiB0aGlzIG1lbW9yeQotCSAqIHRvIHRoZSB6b25lcywgbm93IGlzIHRoZSB0aW1lIHRv
IGRvIGl0LgotCSAqLwotCXpvbmVfc2l6ZVswXSA9IG1heF9sb3cgLSBtaW47Ci0KLQkvKgotCSAq
IENhbGN1bGF0ZSB0aGUgc2l6ZSBvZiB0aGUgaG9sZXMuCi0JICogIGhvbGVzID0gbm9kZV9zaXpl
IC0gc3VtKGJhbmtfc2l6ZXMpCi0JICovCi0JbWVtY3B5KHpob2xlX3NpemUsIHpvbmVfc2l6ZSwg
c2l6ZW9mKHpob2xlX3NpemUpKTsKLQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewot
CQl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gbWVtYmxvY2tfcmVnaW9uX21lbW9yeV9iYXNlX3Bmbihy
ZWcpOwotCQl1bnNpZ25lZCBsb25nIGVuZCA9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3Bm
bihyZWcpOwotCi0JCWlmIChzdGFydCA8IG1heF9sb3cpIHsKLQkJCXVuc2lnbmVkIGxvbmcgbG93
X2VuZCA9IG1pbihlbmQsIG1heF9sb3cpOwotCQkJemhvbGVfc2l6ZVswXSAtPSBsb3dfZW5kIC0g
c3RhcnQ7Ci0JCX0KLQl9CisJbWF4X3pvbmVfcGZuW1pPTkVfRE1BXSA9IG1heF9sb3c7CisJbWF4
X3pvbmVfcGZuW1pPTkVfTk9STUFMXSA9IG1heF9sb3c7CiAKIAkvKgogCSAqIEFkanVzdCB0aGUg
c2l6ZXMgYWNjb3JkaW5nIHRvIGFueSBzcGVjaWFsIHJlcXVpcmVtZW50cyBmb3IKIAkgKiB0aGlz
IG1hY2hpbmUgdHlwZS4KKwkgKiBUaGlzIG1pZ2h0IGxvd2VyIFpPTkVfRE1BIGxpbWl0LgogCSAq
LwotCWFyY2hfYWRqdXN0X3pvbmVzKHpvbmVfc2l6ZSwgemhvbGVfc2l6ZSk7CisJYXJjaF9hZGp1
c3Rfem9uZXMobWF4X3pvbmVfcGZuKTsKIAotCWZyZWVfYXJlYV9pbml0X25vZGUoMCwgem9uZV9z
aXplLCBtaW4sIHpob2xlX3NpemUpOworCWZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7CiB9
CiAKIGludCBwZm5fdmFsaWQodW5zaWduZWQgbG9uZyBwZm4pCkBAIC0xNzYsMTEgKzE1MSwxMSBA
QCB2b2lkIF9faW5pdCBib290bWVtX2luaXQodm9pZCkKIAlzcGFyc2VfaW5pdCgpOwogCiAJLyoK
LQkgKiBOb3cgZnJlZSB0aGUgbWVtb3J5IC0gZnJlZV9hcmVhX2luaXRfbm9kZSBuZWVkcworCSAq
IE5vdyBmcmVlIHRoZSBtZW1vcnkgLSBmcmVlX2FyZWFfaW5pdCBuZWVkcwogCSAqIHRoZSBzcGFy
c2UgbWVtX21hcCBhcnJheXMgaW5pdGlhbGl6ZWQgYnkgc3BhcnNlX2luaXQoKQogCSAqIGZvciBt
ZW1tYXBfaW5pdF96b25lKCksIG90aGVyd2lzZSBhbGwgUEZOcyBhcmUgaW52YWxpZC4KIAkgKi8K
LQl1YzMyX2Jvb3RtZW1fZnJlZShtaW4sIG1heF9sb3csIG1heF9oaWdoKTsKKwl1YzMyX2Jvb3Rt
ZW1fZnJlZShtYXhfbG93KTsKIAogCWhpZ2hfbWVtb3J5ID0gX192YSgobWF4X2xvdyA8PCBQQUdF
X1NISUZUKSAtIDEpICsgMTsKIAotLSAKMi4yNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=
