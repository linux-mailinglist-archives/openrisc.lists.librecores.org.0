Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5B64B1B20AD
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08B1D20A67;
	Tue, 21 Apr 2020 10:01:51 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 282E120A47
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:53:45 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 023F32078B;
 Sun, 12 Apr 2020 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721224;
 bh=sN78lZotguCKrttDOIWOXxlcWe+0MryDvjqyKOvrJC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mqfR2DMwYn+chyzSwl2PMMuM6ya1F6cOxPQ66C/OorDG9P01ERaxgUj4H7lJsHBl1
 W2m2rygfbnMWfD3CAJC6UfVy/F6xLgPaslZv1hk7hAlQ7H9VTsVKCl5jX69EwuPblu
 SAkziTW6zISS6COGyW6ck4eOZRdPQ0kPXFj7r2/M=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:56 +0300
Message-Id: <20200412194859.12663-19-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 18/21] mm: rename free_area_init_node() to
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
bml0X25vZGUoKSBpcyBvbmx5IHVzZWQgYnkgeDg2IHRvIGluaXRpYWxpemUgYSBtZW1vcnktbGVz
cwpub2Rlcy4KTWFrZSBpdHMgbmFtZSByZWZsZWN0IHRoaXMgYW5kIGRyb3AgYWxsIHRoZSBmdW5j
dGlvbiBwYXJhbWV0ZXJzIGV4Y2VwdCBub2RlCklEIGFzIHRoZXkgYXJlIGFueXdheSB6ZXJvLgoK
U2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFy
Y2gveDg2L21tL251bWEuYyB8IDUgKy0tLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDkgKysrLS0t
LS0tCiBtbS9wYWdlX2FsbG9jLmMgICAgfCA3ICsrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9u
dW1hLmMgYi9hcmNoL3g4Ni9tbS9udW1hLmMKaW5kZXggZmUwMjRiMmFjNzk2Li44ZWU5NTIwMzhj
ODAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L21tL251bWEuYworKysgYi9hcmNoL3g4Ni9tbS9udW1h
LmMKQEAgLTczNywxMiArNzM3LDkgQEAgdm9pZCBfX2luaXQgeDg2X251bWFfaW5pdCh2b2lkKQog
CiBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9tZW1vcnlfbGVzc19ub2RlKGludCBuaWQpCiB7Ci0J
dW5zaWduZWQgbG9uZyB6b25lc19zaXplW01BWF9OUl9aT05FU10gPSB7MH07Ci0JdW5zaWduZWQg
bG9uZyB6aG9sZXNfc2l6ZVtNQVhfTlJfWk9ORVNdID0gezB9OwotCiAJLyogQWxsb2NhdGUgYW5k
IGluaXRpYWxpemUgbm9kZSBkYXRhLiBNZW1vcnktbGVzcyBub2RlIGlzIG5vdyBvbmxpbmUuKi8K
IAlhbGxvY19ub2RlX2RhdGEobmlkKTsKLQlmcmVlX2FyZWFfaW5pdF9ub2RlKG5pZCwgem9uZXNf
c2l6ZSwgMCwgemhvbGVzX3NpemUpOworCWZyZWVfYXJlYV9pbml0X21lbW9yeWxlc3Nfbm9kZShu
aWQpOwogCiAJLyoKIAkgKiBBbGwgem9uZWxpc3RzIHdpbGwgYmUgYnVpbHQgbGF0ZXIgaW4gc3Rh
cnRfa2VybmVsKCkgYWZ0ZXIgcGVyIGNwdQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5o
IGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IDFjMmVjYjQyZTA0My4uMjc2NjBmNmNmMjZlIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCkBA
IC0yMjcyLDggKzIyNzIsNyBAQCBzdGF0aWMgaW5saW5lIHNwaW5sb2NrX3QgKnB1ZF9sb2NrKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwdWRfdCAqcHVkKQogfQogCiBleHRlcm4gdm9pZCBfX2luaXQg
cGFnZWNhY2hlX2luaXQodm9pZCk7Ci1leHRlcm4gdm9pZCBfX2luaXQgZnJlZV9hcmVhX2luaXRf
bm9kZShpbnQgbmlkLCB1bnNpZ25lZCBsb25nICogem9uZXNfc2l6ZSwKLQkJdW5zaWduZWQgbG9u
ZyB6b25lX3N0YXJ0X3BmbiwgdW5zaWduZWQgbG9uZyAqemhvbGVzX3NpemUpOworZXh0ZXJuIHZv
aWQgX19pbml0IGZyZWVfYXJlYV9pbml0X21lbW9yeWxlc3Nfbm9kZShpbnQgbmlkKTsKIGV4dGVy
biB2b2lkIGZyZWVfaW5pdG1lbSh2b2lkKTsKIAogLyoKQEAgLTIzNDUsMTAgKzIzNDQsOCBAQCBz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZ2V0X251bV9waHlzcGFnZXModm9pZCkKIAogLyoK
ICAqIFVzaW5nIG1lbWJsb2NrIG5vZGUgbWFwcGluZ3MsIGFuIGFyY2hpdGVjdHVyZSBtYXkgaW5p
dGlhbGlzZSBpdHMKLSAqIHpvbmVzLCBhbGxvY2F0ZSB0aGUgYmFja2luZyBtZW1fbWFwIGFuZCBh
Y2NvdW50IGZvciBtZW1vcnkgaG9sZXMgaW4gYSBtb3JlCi0gKiBhcmNoaXRlY3R1cmUgaW5kZXBl
bmRlbnQgbWFubmVyLiBUaGlzIGlzIGEgc3Vic3RpdHV0ZSBmb3IgY3JlYXRpbmcgdGhlCi0gKiB6
b25lX3NpemVzW10gYW5kIHpob2xlc19zaXplW10gYXJyYXlzIGFuZCBwYXNzaW5nIHRoZW0gdG8K
LSAqIGZyZWVfYXJlYV9pbml0X25vZGUoKQorICogem9uZXMsIGFsbG9jYXRlIHRoZSBiYWNraW5n
IG1lbV9tYXAgYW5kIGFjY291bnQgZm9yIG1lbW9yeSBob2xlcyBpbiBhbgorICogYXJjaGl0ZWN0
dXJlIGluZGVwZW5kZW50IG1hbm5lci4KICAqCiAgKiBBbiBhcmNoaXRlY3R1cmUgaXMgZXhwZWN0
ZWQgdG8gcmVnaXN0ZXIgcmFuZ2Ugb2YgcGFnZSBmcmFtZXMgYmFja2VkIGJ5CiAgKiBwaHlzaWNh
bCBtZW1vcnkgd2l0aCBtZW1ibG9ja19hZGRbX25vZGVdKCkgYmVmb3JlIGNhbGxpbmcKZGlmZiAt
LWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCAzNzY0MzRjN2E3
OGIuLmU0NjIzMmVjNDg0OSAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5jCisrKyBiL21tL3Bh
Z2VfYWxsb2MuYwpAQCAtNjk3OSwxMiArNjk3OSw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBfX2Zy
ZWVfYXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5zaWduZWQgbG9uZyAqem9uZXNfc2l6ZSwKIAlm
cmVlX2FyZWFfaW5pdF9jb3JlKHBnZGF0KTsKIH0KIAotdm9pZCBfX2luaXQgZnJlZV9hcmVhX2lu
aXRfbm9kZShpbnQgbmlkLCB1bnNpZ25lZCBsb25nICp6b25lc19zaXplLAotCQkJCXVuc2lnbmVk
IGxvbmcgbm9kZV9zdGFydF9wZm4sCi0JCQkJdW5zaWduZWQgbG9uZyAqemhvbGVzX3NpemUpCit2
b2lkIF9faW5pdCBmcmVlX2FyZWFfaW5pdF9tZW1vcnlsZXNzX25vZGUoaW50IG5pZCkKIHsKLQlf
X2ZyZWVfYXJlYV9pbml0X25vZGUobmlkLCB6b25lc19zaXplLCBub2RlX3N0YXJ0X3Bmbiwgemhv
bGVzX3NpemUsCi0JCQkgICAgICB0cnVlKTsKKwlfX2ZyZWVfYXJlYV9pbml0X25vZGUobmlkLCBO
VUxMLCAwLCBOVUxMLCBmYWxzZSk7CiB9CiAKICNpZiAhZGVmaW5lZChDT05GSUdfRkxBVF9OT0RF
X01FTV9NQVApCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
