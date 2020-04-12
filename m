Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CB52C1B20A1
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6472620AF3;
	Tue, 21 Apr 2020 10:01:41 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 01A3920A1F
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:51:06 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E669B20767;
 Sun, 12 Apr 2020 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721064;
 bh=cH4vss3qNJhXJIvzb7q7Wn734fkKg4X+RTrGl6ZaiYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0BIupA64kGu1HlizFpI+N3TJZ6L2DTl8AS8X7g5LMT+FinwBM0R2+MIXVl+iucOw0
 DmEuHX6++bSA1sSCKakWnnnIhYbIXa+zgWCkmCjU5hRMIxfstrJlNHA1+lPxJ/ZYRj
 826ySKimGemZ4wU66yRDOC9pA0DPDqgsPxKeZ/Mo=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:45 +0300
Message-Id: <20200412194859.12663-8-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 07/21] arm: simplify detection of memory zone
 boundaries
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
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL2FybS9tbS9pbml0LmMgfCA2NiArKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9t
bS9pbml0LmMgYi9hcmNoL2FybS9tbS9pbml0LmMKaW5kZXggMDU0YmU0NGQxY2RiLi40ZTQzNDU1
ZmFiODQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21tL2luaXQuYworKysgYi9hcmNoL2FybS9tbS9p
bml0LmMKQEAgLTkyLDE4ICs5Miw2IEBAIEVYUE9SVF9TWU1CT0woYXJtX2RtYV96b25lX3NpemUp
OwogICovCiBwaHlzX2FkZHJfdCBhcm1fZG1hX2xpbWl0OwogdW5zaWduZWQgbG9uZyBhcm1fZG1h
X3Bmbl9saW1pdDsKLQotc3RhdGljIHZvaWQgX19pbml0IGFybV9hZGp1c3RfZG1hX3pvbmUodW5z
aWduZWQgbG9uZyAqc2l6ZSwgdW5zaWduZWQgbG9uZyAqaG9sZSwKLQl1bnNpZ25lZCBsb25nIGRt
YV9zaXplKQotewotCWlmIChzaXplWzBdIDw9IGRtYV9zaXplKQotCQlyZXR1cm47Ci0KLQlzaXpl
W1pPTkVfTk9STUFMXSA9IHNpemVbMF0gLSBkbWFfc2l6ZTsKLQlzaXplW1pPTkVfRE1BXSA9IGRt
YV9zaXplOwotCWhvbGVbWk9ORV9OT1JNQUxdID0gaG9sZVswXTsKLQlob2xlW1pPTkVfRE1BXSA9
IDA7Ci19CiAjZW5kaWYKIAogdm9pZCBfX2luaXQgc2V0dXBfZG1hX3pvbmUoY29uc3Qgc3RydWN0
IG1hY2hpbmVfZGVzYyAqbWRlc2MpCkBAIC0xMjEsNTYgKzEwOSwxNiBAQCB2b2lkIF9faW5pdCBz
ZXR1cF9kbWFfem9uZShjb25zdCBzdHJ1Y3QgbWFjaGluZV9kZXNjICptZGVzYykKIHN0YXRpYyB2
b2lkIF9faW5pdCB6b25lX3NpemVzX2luaXQodW5zaWduZWQgbG9uZyBtaW4sIHVuc2lnbmVkIGxv
bmcgbWF4X2xvdywKIAl1bnNpZ25lZCBsb25nIG1heF9oaWdoKQogewotCXVuc2lnbmVkIGxvbmcg
em9uZV9zaXplW01BWF9OUl9aT05FU10sIHpob2xlX3NpemVbTUFYX05SX1pPTkVTXTsKLQlzdHJ1
Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7Ci0KLQkvKgotCSAqIGluaXRpYWxpc2UgdGhlIHpvbmVz
LgotCSAqLwotCW1lbXNldCh6b25lX3NpemUsIDAsIHNpemVvZih6b25lX3NpemUpKTsKKwl1bnNp
Z25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJfWk9ORVNdID0geyAwIH07CiAKLQkvKgotCSAq
IFRoZSBtZW1vcnkgc2l6ZSBoYXMgYWxyZWFkeSBiZWVuIGRldGVybWluZWQuICBJZiB3ZSBuZWVk
Ci0JICogdG8gZG8gYW55dGhpbmcgZmFuY3kgd2l0aCB0aGUgYWxsb2NhdGlvbiBvZiB0aGlzIG1l
bW9yeQotCSAqIHRvIHRoZSB6b25lcywgbm93IGlzIHRoZSB0aW1lIHRvIGRvIGl0LgotCSAqLwot
CXpvbmVfc2l6ZVswXSA9IG1heF9sb3cgLSBtaW47Ci0jaWZkZWYgQ09ORklHX0hJR0hNRU0KLQl6
b25lX3NpemVbWk9ORV9ISUdITUVNXSA9IG1heF9oaWdoIC0gbWF4X2xvdzsKKyNpZmRlZiBDT05G
SUdfWk9ORV9ETUEKKwltYXhfem9uZV9wZm5bWk9ORV9ETUFdID0gbWluKGFybV9kbWFfcGZuX2xp
bWl0LCBtYXhfbG93KTsKICNlbmRpZgotCi0JLyoKLQkgKiBDYWxjdWxhdGUgdGhlIHNpemUgb2Yg
dGhlIGhvbGVzLgotCSAqICBob2xlcyA9IG5vZGVfc2l6ZSAtIHN1bShiYW5rX3NpemVzKQotCSAq
LwotCW1lbWNweSh6aG9sZV9zaXplLCB6b25lX3NpemUsIHNpemVvZih6aG9sZV9zaXplKSk7Ci0J
Zm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsKLQkJdW5zaWduZWQgbG9uZyBzdGFydCA9
IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFzZV9wZm4ocmVnKTsKLQkJdW5zaWduZWQgbG9uZyBl
bmQgPSBtZW1ibG9ja19yZWdpb25fbWVtb3J5X2VuZF9wZm4ocmVnKTsKLQotCQlpZiAoc3RhcnQg
PCBtYXhfbG93KSB7Ci0JCQl1bnNpZ25lZCBsb25nIGxvd19lbmQgPSBtaW4oZW5kLCBtYXhfbG93
KTsKLQkJCXpob2xlX3NpemVbMF0gLT0gbG93X2VuZCAtIHN0YXJ0OwotCQl9CisJbWF4X3pvbmVf
cGZuW1pPTkVfTk9STUFMXSA9IG1heF9sb3c7CiAjaWZkZWYgQ09ORklHX0hJR0hNRU0KLQkJaWYg
KGVuZCA+IG1heF9sb3cpIHsKLQkJCXVuc2lnbmVkIGxvbmcgaGlnaF9zdGFydCA9IG1heChzdGFy
dCwgbWF4X2xvdyk7Ci0JCQl6aG9sZV9zaXplW1pPTkVfSElHSE1FTV0gLT0gZW5kIC0gaGlnaF9z
dGFydDsKLQkJfQorCW1heF96b25lX3BmbltaT05FX0hJR0hNRU1dID0gbWF4X2hpZ2g7CiAjZW5k
aWYKLQl9Ci0KLSNpZmRlZiBDT05GSUdfWk9ORV9ETUEKLQkvKgotCSAqIEFkanVzdCB0aGUgc2l6
ZXMgYWNjb3JkaW5nIHRvIGFueSBzcGVjaWFsIHJlcXVpcmVtZW50cyBmb3IKLQkgKiB0aGlzIG1h
Y2hpbmUgdHlwZS4KLQkgKi8KLQlpZiAoYXJtX2RtYV96b25lX3NpemUpCi0JCWFybV9hZGp1c3Rf
ZG1hX3pvbmUoem9uZV9zaXplLCB6aG9sZV9zaXplLAotCQkJYXJtX2RtYV96b25lX3NpemUgPj4g
UEFHRV9TSElGVCk7Ci0jZW5kaWYKLQotCWZyZWVfYXJlYV9pbml0X25vZGUoMCwgem9uZV9zaXpl
LCBtaW4sIHpob2xlX3NpemUpOworCWZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7CiB9CiAK
ICNpZmRlZiBDT05GSUdfSEFWRV9BUkNIX1BGTl9WQUxJRApAQCAtMzA2LDcgKzI1NCw3IEBAIHZv
aWQgX19pbml0IGJvb3RtZW1faW5pdCh2b2lkKQogCXNwYXJzZV9pbml0KCk7CiAKIAkvKgotCSAq
IE5vdyBmcmVlIHRoZSBtZW1vcnkgLSBmcmVlX2FyZWFfaW5pdF9ub2RlIG5lZWRzCisJICogTm93
IGZyZWUgdGhlIG1lbW9yeSAtIGZyZWVfYXJlYV9pbml0IG5lZWRzCiAJICogdGhlIHNwYXJzZSBt
ZW1fbWFwIGFycmF5cyBpbml0aWFsaXplZCBieSBzcGFyc2VfaW5pdCgpCiAJICogZm9yIG1lbW1h
cF9pbml0X3pvbmUoKSwgb3RoZXJ3aXNlIGFsbCBQRk5zIGFyZSBpbnZhbGlkLgogCSAqLwotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
