Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 68033171781
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4791D209C9;
	Thu, 27 Feb 2020 13:35:52 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id EB81A20982
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 09:50:35 +0100 (CET)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3085324683;
 Thu, 27 Feb 2020 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793434;
 bh=AS1N2p4BpR1Wp3lQ9tOhwMdbr5iUMexF6sWGldk1z/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F/Juy6nq1o1s0vcMI/6nYOOr/JvTLwfyiFI3jnaZtRCxGqfSUdoHGQWnetp7qDthX
 er4V16xokvXBNocSwDYsQCE2j9PSEjZc3g/uN+d8cX6BV9muH7MTvQXgGfaX3oorhq
 LLNNs6UCczjXtYc8jIGlV+ep6XppugZPn0kCytN4=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2020 10:46:08 +0200
Message-Id: <20200227084608.18223-15-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH v3 14/14] mm: remove __ARCH_HAS_5LEVEL_HACK and
 include/asm-generic/5level-fixup.h
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, James Morse <james.morse@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlcmUgYXJlIG5vIGFy
Y2hpdGVjdHVyZXMgdGhhdCB1c2UgaW5jbHVkZS9hc20tZ2VuZXJpYy81bGV2ZWwtZml4dXAuaAp0
aGVyZWZvcmUgaXQgY2FuIGJlIHJlbW92ZWQgYWxvbmcgd2l0aCBfX0FSQ0hfSEFTXzVMRVZFTF9I
QUNLIGRlZmluZSBhbmQKdGhlIGNvZGUgaXQgc3Vycm91bmRzCgpTaWduZWQtb2ZmLWJ5OiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy81
bGV2ZWwtZml4dXAuaCB8IDU4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVk
ZS9saW51eC9tbS5oICAgICAgICAgICAgICAgICB8ICA2IC0tLS0KIG1tL2thc2FuL2luaXQuYyAg
ICAgICAgICAgICAgICAgICAgfCAxMSAtLS0tLS0KIG1tL21lbW9yeS5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgOCAtLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA4MyBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2FzbS1nZW5lcmljLzVsZXZlbC1maXh1cC5oCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy81bGV2ZWwtZml4dXAuaCBiL2luY2x1ZGUvYXNt
LWdlbmVyaWMvNWxldmVsLWZpeHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDRj
NzRiMWMxZDEzYi4uMDAwMDAwMDAwMDAwCi0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvNWxldmVs
LWZpeHVwLmgKKysrIC9kZXYvbnVsbApAQCAtMSw1OCArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCAqLwotI2lmbmRlZiBfNUxFVkVMX0ZJWFVQX0gKLSNkZWZpbmUg
XzVMRVZFTF9GSVhVUF9ICi0KLSNkZWZpbmUgX19BUkNIX0hBU181TEVWRUxfSEFDSwotI2RlZmlu
ZSBfX1BBR0VUQUJMRV9QNERfRk9MREVEIDEKLQotI2RlZmluZSBQNERfU0hJRlQJCQlQR0RJUl9T
SElGVAotI2RlZmluZSBQNERfU0laRQkJCVBHRElSX1NJWkUKLSNkZWZpbmUgUDREX01BU0sJCQlQ
R0RJUl9NQVNLCi0jZGVmaW5lIE1BWF9QVFJTX1BFUl9QNEQJCTEKLSNkZWZpbmUgUFRSU19QRVJf
UDRECQkJMQotCi0jZGVmaW5lIHA0ZF90CQkJCXBnZF90Ci0KLSNkZWZpbmUgcHVkX2FsbG9jKG1t
LCBwNGQsIGFkZHJlc3MpIFwKLQkoKHVubGlrZWx5KHBnZF9ub25lKCoocDRkKSkpICYmIF9fcHVk
X2FsbG9jKG1tLCBwNGQsIGFkZHJlc3MpKSA/IFwKLQkJTlVMTCA6IHB1ZF9vZmZzZXQocDRkLCBh
ZGRyZXNzKSkKLQotI2RlZmluZSBwNGRfYWxsb2MobW0sIHBnZCwgYWRkcmVzcykJKHBnZCkKLSNk
ZWZpbmUgcDRkX29mZnNldChwZ2QsIHN0YXJ0KQkJKHBnZCkKLQotI2lmbmRlZiBfX0FTU0VNQkxZ
X18KLXN0YXRpYyBpbmxpbmUgaW50IHA0ZF9ub25lKHA0ZF90IHA0ZCkKLXsKLQlyZXR1cm4gMDsK
LX0KLQotc3RhdGljIGlubGluZSBpbnQgcDRkX2JhZChwNGRfdCBwNGQpCi17Ci0JcmV0dXJuIDA7
Ci19Ci0KLXN0YXRpYyBpbmxpbmUgaW50IHA0ZF9wcmVzZW50KHA0ZF90IHA0ZCkKLXsKLQlyZXR1
cm4gMTsKLX0KLSNlbmRpZgotCi0jZGVmaW5lIHA0ZF9FUlJPUihwNGQpCQkJZG8geyB9IHdoaWxl
ICgwKQotI2RlZmluZSBwNGRfY2xlYXIocDRkKQkJCXBnZF9jbGVhcihwNGQpCi0jZGVmaW5lIHA0
ZF92YWwocDRkKQkJCXBnZF92YWwocDRkKQotI2RlZmluZSBwNGRfcG9wdWxhdGUobW0sIHA0ZCwg
cHVkKQlwZ2RfcG9wdWxhdGUobW0sIHA0ZCwgcHVkKQotI2RlZmluZSBwNGRfcG9wdWxhdGVfc2Fm
ZShtbSwgcDRkLCBwdWQpCXBnZF9wb3B1bGF0ZShtbSwgcDRkLCBwdWQpCi0jZGVmaW5lIHA0ZF9w
YWdlKHA0ZCkJCQlwZ2RfcGFnZShwNGQpCi0jZGVmaW5lIHA0ZF9wYWdlX3ZhZGRyKHA0ZCkJCXBn
ZF9wYWdlX3ZhZGRyKHA0ZCkKLQotI2RlZmluZSBfX3A0ZCh4KQkJCV9fcGdkKHgpCi0jZGVmaW5l
IHNldF9wNGQocDRkcCwgcDRkKQkJc2V0X3BnZChwNGRwLCBwNGQpCi0KLSN1bmRlZiBwNGRfZnJl
ZV90bGIKLSNkZWZpbmUgcDRkX2ZyZWVfdGxiKHRsYiwgeCwgYWRkcikJZG8geyB9IHdoaWxlICgw
KQotI2RlZmluZSBwNGRfZnJlZShtbSwgeCkJCQlkbyB7IH0gd2hpbGUgKDApCi0KLSN1bmRlZiAg
cDRkX2FkZHJfZW5kCi0jZGVmaW5lIHA0ZF9hZGRyX2VuZChhZGRyLCBlbmQpCQkoZW5kKQotCi0j
ZW5kaWYKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0u
aAppbmRleCA1MjI2OWU1NmM1MTQuLjY5ZmI0NmUxZDkxYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtMTg0MSwxMSArMTg0MSw2IEBA
IGludCBfX3B0ZV9hbGxvY19rZXJuZWwocG1kX3QgKnBtZCk7CiAKICNpZiBkZWZpbmVkKENPTkZJ
R19NTVUpCiAKLS8qCi0gKiBUaGUgZm9sbG93aW5nIGlmZGVmIG5lZWRlZCB0byBnZXQgdGhlIDVs
ZXZlbC1maXh1cC5oIGhlYWRlciB0byB3b3JrLgotICogUmVtb3ZlIGl0IHdoZW4gNWxldmVsLWZp
eHVwLmggaGFzIGJlZW4gcmVtb3ZlZC4KLSAqLwotI2lmbmRlZiBfX0FSQ0hfSEFTXzVMRVZFTF9I
QUNLCiBzdGF0aWMgaW5saW5lIHA0ZF90ICpwNGRfYWxsb2Moc3RydWN0IG1tX3N0cnVjdCAqbW0s
IHBnZF90ICpwZ2QsCiAJCXVuc2lnbmVkIGxvbmcgYWRkcmVzcykKIHsKQEAgLTE4NTksNyArMTg1
NCw2IEBAIHN0YXRpYyBpbmxpbmUgcHVkX3QgKnB1ZF9hbGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgcDRkX3QgKnA0ZCwKIAlyZXR1cm4gKHVubGlrZWx5KHA0ZF9ub25lKCpwNGQpKSAmJiBfX3B1
ZF9hbGxvYyhtbSwgcDRkLCBhZGRyZXNzKSkgPwogCQlOVUxMIDogcHVkX29mZnNldChwNGQsIGFk
ZHJlc3MpOwogfQotI2VuZGlmIC8qICFfX0FSQ0hfSEFTXzVMRVZFTF9IQUNLICovCiAKIHN0YXRp
YyBpbmxpbmUgcG1kX3QgKnBtZF9hbGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHVkX3QgKnB1
ZCwgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQogewpkaWZmIC0tZ2l0IGEvbW0va2FzYW4vaW5pdC5j
IGIvbW0va2FzYW4vaW5pdC5jCmluZGV4IGNlNDVjNDkxZWJjZC4uZmU2YmUwYmUxZjc2IDEwMDY0
NAotLS0gYS9tbS9rYXNhbi9pbml0LmMKKysrIGIvbW0va2FzYW4vaW5pdC5jCkBAIC0yNTAsMjAg
KzI1MCw5IEBAIGludCBfX3JlZiBrYXNhbl9wb3B1bGF0ZV9lYXJseV9zaGFkb3coY29uc3Qgdm9p
ZCAqc2hhZG93X3N0YXJ0LAogCQkJICogMywyIC0gbGV2ZWwgcGFnZSB0YWJsZXMgd2hlcmUgd2Ug
ZG9uJ3QgaGF2ZQogCQkJICogcHVkcyxwbWRzLCBzbyBwZ2RfcG9wdWxhdGUoKSwgcHVkX3BvcHVs
YXRlKCkKIAkJCSAqIGlzIG5vb3BzLgotCQkJICoKLQkJCSAqIFRoZSBpZm5kZWYgaXMgcmVxdWly
ZWQgdG8gYXZvaWQgYnVpbGQgYnJlYWthZ2UuCi0JCQkgKgotCQkJICogV2l0aCA1bGV2ZWwtZml4
dXAuaCwgcGdkX3BvcHVsYXRlKCkgaXMgbm90IG5vcCBhbmQKLQkJCSAqIHdlIHJlZmVyZW5jZSBr
YXNhbl9lYXJseV9zaGFkb3dfcDRkLiBJdCdzIG5vdCBkZWZpbmVkCi0JCQkgKiB1bmxlc3MgNS1s
ZXZlbCBwYWdpbmcgZW5hYmxlZC4KLQkJCSAqCi0JCQkgKiBUaGUgaWZuZGVmIGNhbiBiZSBkcm9w
cGVkIG9uY2UgYWxsIEtBU0FOLWVuYWJsZWQKLQkJCSAqIGFyY2hpdGVjdHVyZXMgd2lsbCBzd2l0
Y2ggdG8gcGd0YWJsZS1ub3A0ZC5oLgogCQkJICovCi0jaWZuZGVmIF9fQVJDSF9IQVNfNUxFVkVM
X0hBQ0sKIAkJCXBnZF9wb3B1bGF0ZSgmaW5pdF9tbSwgcGdkLAogCQkJCQlsbV9hbGlhcyhrYXNh
bl9lYXJseV9zaGFkb3dfcDRkKSk7Ci0jZW5kaWYKIAkJCXA0ZCA9IHA0ZF9vZmZzZXQocGdkLCBh
ZGRyKTsKIAkJCXA0ZF9wb3B1bGF0ZSgmaW5pdF9tbSwgcDRkLAogCQkJCQlsbV9hbGlhcyhrYXNh
bl9lYXJseV9zaGFkb3dfcHVkKSk7CmRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9y
eS5jCmluZGV4IDBiY2NjNjIyZTQ4Mi4uMTBjYzE0N2RiMWI4IDEwMDY0NAotLS0gYS9tbS9tZW1v
cnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtNDI1MiwxOSArNDI1MiwxMSBAQCBpbnQgX19wdWRf
YWxsb2Moc3RydWN0IG1tX3N0cnVjdCAqbW0sIHA0ZF90ICpwNGQsIHVuc2lnbmVkIGxvbmcgYWRk
cmVzcykKIAlzbXBfd21iKCk7IC8qIFNlZSBjb21tZW50IGluIF9fcHRlX2FsbG9jICovCiAKIAlz
cGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwotI2lmbmRlZiBfX0FSQ0hfSEFTXzVMRVZF
TF9IQUNLCiAJaWYgKCFwNGRfcHJlc2VudCgqcDRkKSkgewogCQltbV9pbmNfbnJfcHVkcyhtbSk7
CiAJCXA0ZF9wb3B1bGF0ZShtbSwgcDRkLCBuZXcpOwogCX0gZWxzZQkvKiBBbm90aGVyIGhhcyBw
b3B1bGF0ZWQgaXQgKi8KIAkJcHVkX2ZyZWUobW0sIG5ldyk7Ci0jZWxzZQotCWlmICghcGdkX3By
ZXNlbnQoKnA0ZCkpIHsKLQkJbW1faW5jX25yX3B1ZHMobW0pOwotCQlwZ2RfcG9wdWxhdGUobW0s
IHA0ZCwgbmV3KTsKLQl9IGVsc2UJLyogQW5vdGhlciBoYXMgcG9wdWxhdGVkIGl0ICovCi0JCXB1
ZF9mcmVlKG1tLCBuZXcpOwotI2VuZGlmIC8qIF9fQVJDSF9IQVNfNUxFVkVMX0hBQ0sgKi8KIAlz
cGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjI0
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
