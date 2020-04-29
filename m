Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AA0001C05C6
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 78C0920AFE;
	Thu, 30 Apr 2020 21:09:35 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1092B20AB2
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:13:59 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62130208FE;
 Wed, 29 Apr 2020 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162437;
 bh=PmlA55IFa0TE0KqXPilGt5b1cMKjw1e8NkL5oH+bDN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zp/EwjK4fcSp4MTxQXnTZ3NiV7nl/x2/apdyGHjMUHbRoQIUq2SCVNYsHsLk+sKA0
 OXUq2017GfqW69ke9hm4HJwXGVQJ8kNO5FM/r/R2CRLJajFvTaJ+ia7ZrqRb1Zokvk
 cf+LpdAcg3GqmVfgk3hUO6nFeFCPZeT1rSJcnXXU=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:14 +0300
Message-Id: <20200429121126.17989-9-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 08/20] arm64: simplify detection of memory
 zone boundaries for UMA configs
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL2FybTY0L21tL2luaXQuYyB8IDU0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9pbml0LmMgYi9hcmNo
L2FybTY0L21tL2luaXQuYwppbmRleCBhNjUwYWRiMzU4ZWUuLmQ1NGFkMjI1MGRjZSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9tbS9pbml0LmMKKysrIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKQEAg
LTE5Miw4ICsxOTIsNiBAQCBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1heF96b25lX3BoeXMo
dW5zaWduZWQgaW50IHpvbmVfYml0cykKIAlyZXR1cm4gbWluKG9mZnNldCArICgxVUxMIDw8IHpv
bmVfYml0cyksIG1lbWJsb2NrX2VuZF9vZl9EUkFNKCkpOwogfQogCi0jaWZkZWYgQ09ORklHX05V
TUEKLQogc3RhdGljIHZvaWQgX19pbml0IHpvbmVfc2l6ZXNfaW5pdCh1bnNpZ25lZCBsb25nIG1p
biwgdW5zaWduZWQgbG9uZyBtYXgpCiB7CiAJdW5zaWduZWQgbG9uZyBtYXhfem9uZV9wZm5zW01B
WF9OUl9aT05FU10gID0gezB9OwpAQCAtMjA5LDU4ICsyMDcsNiBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgem9uZV9zaXplc19pbml0KHVuc2lnbmVkIGxvbmcgbWluLCB1bnNpZ25lZCBsb25nIG1heCkK
IAlmcmVlX2FyZWFfaW5pdChtYXhfem9uZV9wZm5zKTsKIH0KIAotI2Vsc2UKLQotc3RhdGljIHZv
aWQgX19pbml0IHpvbmVfc2l6ZXNfaW5pdCh1bnNpZ25lZCBsb25nIG1pbiwgdW5zaWduZWQgbG9u
ZyBtYXgpCi17Ci0Jc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOwotCXVuc2lnbmVkIGxvbmcg
em9uZV9zaXplW01BWF9OUl9aT05FU10sIHpob2xlX3NpemVbTUFYX05SX1pPTkVTXTsKLQl1bnNp
Z25lZCBsb25nIF9fbWF5YmVfdW51c2VkIG1heF9kbWEsIG1heF9kbWEzMjsKLQotCW1lbXNldCh6
b25lX3NpemUsIDAsIHNpemVvZih6b25lX3NpemUpKTsKLQotCW1heF9kbWEgPSBtYXhfZG1hMzIg
PSBtaW47Ci0jaWZkZWYgQ09ORklHX1pPTkVfRE1BCi0JbWF4X2RtYSA9IG1heF9kbWEzMiA9IFBG
Tl9ET1dOKGFybTY0X2RtYV9waHlzX2xpbWl0KTsKLQl6b25lX3NpemVbWk9ORV9ETUFdID0gbWF4
X2RtYSAtIG1pbjsKLSNlbmRpZgotI2lmZGVmIENPTkZJR19aT05FX0RNQTMyCi0JbWF4X2RtYTMy
ID0gUEZOX0RPV04oYXJtNjRfZG1hMzJfcGh5c19saW1pdCk7Ci0Jem9uZV9zaXplW1pPTkVfRE1B
MzJdID0gbWF4X2RtYTMyIC0gbWF4X2RtYTsKLSNlbmRpZgotCXpvbmVfc2l6ZVtaT05FX05PUk1B
TF0gPSBtYXggLSBtYXhfZG1hMzI7Ci0KLQltZW1jcHkoemhvbGVfc2l6ZSwgem9uZV9zaXplLCBz
aXplb2YoemhvbGVfc2l6ZSkpOwotCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsK
LQkJdW5zaWduZWQgbG9uZyBzdGFydCA9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFzZV9wZm4o
cmVnKTsKLQkJdW5zaWduZWQgbG9uZyBlbmQgPSBtZW1ibG9ja19yZWdpb25fbWVtb3J5X2VuZF9w
Zm4ocmVnKTsKLQotI2lmZGVmIENPTkZJR19aT05FX0RNQQotCQlpZiAoc3RhcnQgPj0gbWluICYm
IHN0YXJ0IDwgbWF4X2RtYSkgewotCQkJdW5zaWduZWQgbG9uZyBkbWFfZW5kID0gbWluKGVuZCwg
bWF4X2RtYSk7Ci0JCQl6aG9sZV9zaXplW1pPTkVfRE1BXSAtPSBkbWFfZW5kIC0gc3RhcnQ7Ci0J
CQlzdGFydCA9IGRtYV9lbmQ7Ci0JCX0KLSNlbmRpZgotI2lmZGVmIENPTkZJR19aT05FX0RNQTMy
Ci0JCWlmIChzdGFydCA+PSBtYXhfZG1hICYmIHN0YXJ0IDwgbWF4X2RtYTMyKSB7Ci0JCQl1bnNp
Z25lZCBsb25nIGRtYTMyX2VuZCA9IG1pbihlbmQsIG1heF9kbWEzMik7Ci0JCQl6aG9sZV9zaXpl
W1pPTkVfRE1BMzJdIC09IGRtYTMyX2VuZCAtIHN0YXJ0OwotCQkJc3RhcnQgPSBkbWEzMl9lbmQ7
Ci0JCX0KLSNlbmRpZgotCQlpZiAoc3RhcnQgPj0gbWF4X2RtYTMyICYmIHN0YXJ0IDwgbWF4KSB7
Ci0JCQl1bnNpZ25lZCBsb25nIG5vcm1hbF9lbmQgPSBtaW4oZW5kLCBtYXgpOwotCQkJemhvbGVf
c2l6ZVtaT05FX05PUk1BTF0gLT0gbm9ybWFsX2VuZCAtIHN0YXJ0OwotCQl9Ci0JfQotCi0JZnJl
ZV9hcmVhX2luaXRfbm9kZSgwLCB6b25lX3NpemUsIG1pbiwgemhvbGVfc2l6ZSk7Ci19Ci0KLSNl
bmRpZiAvKiBDT05GSUdfTlVNQSAqLwotCiBpbnQgcGZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgcGZu
KQogewogCXBoeXNfYWRkcl90IGFkZHIgPSBwZm4gPDwgUEFHRV9TSElGVDsKLS0gCjIuMjYuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
