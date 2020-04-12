Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5B11B20A5
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5CA7920AF9;
	Tue, 21 Apr 2020 10:01:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 3EA0920A2F
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:51:49 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44E992072D;
 Sun, 12 Apr 2020 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721108;
 bh=Ok7w8UnbHiLu4xbocwMzpfIo9IGcAlK4aLbtvivoSXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ptZzn70qaRDHuusIJQ2kDW2vKURV7ng1OZjSC8cxSZf5ErovTSNi7d+/WVAi1Pja2
 9Kam6N7RP258+GtMjN+nQBN9jYnUFSrZz0m7UZbW0YwZPo21AuMw5ljsFdZ6JfoMgj
 cJW86dlpE9XFsX7XBXUlQo6J1HaNWpDnYXUk2ugQ=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:48 +0300
Message-Id: <20200412194859.12663-11-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 10/21] m68k: mm: simplify detection of memory
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL202OGsvbW0vbW90b3JvbGEuYyB8IDExICsr
KysrLS0tLS0tCiBhcmNoL202OGsvbW0vc3VuM21tdS5jICB8IDEwICsrKy0tLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL202OGsvbW0vbW90b3JvbGEuYyBiL2FyY2gvbTY4ay9tbS9tb3Rvcm9sYS5jCmluZGV4
IDg0YWI1OTYzY2FiYi4uOTA0YzJhNjYzOTc3IDEwMDY0NAotLS0gYS9hcmNoL202OGsvbW0vbW90
b3JvbGEuYworKysgYi9hcmNoL202OGsvbW0vbW90b3JvbGEuYwpAQCAtMzY1LDcgKzM2NSw3IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBtYXBfbm9kZShpbnQgbm9kZSkKICAqLwogdm9pZCBfX2luaXQg
cGFnaW5nX2luaXQodm9pZCkKIHsKLQl1bnNpZ25lZCBsb25nIHpvbmVzX3NpemVbTUFYX05SX1pP
TkVTXSA9IHsgMCwgfTsKKwl1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJfWk9ORVNd
ID0geyAwLCB9OwogCXVuc2lnbmVkIGxvbmcgbWluX2FkZHIsIG1heF9hZGRyOwogCXVuc2lnbmVk
IGxvbmcgYWRkcjsKIAlpbnQgaTsKQEAgLTQ0OCwxMSArNDQ4LDEwIEBAIHZvaWQgX19pbml0IHBh
Z2luZ19pbml0KHZvaWQpCiAjaWZkZWYgREVCVUcKIAlwcmludGsgKCJiZWZvcmUgZnJlZV9hcmVh
X2luaXRcbiIpOwogI2VuZGlmCi0JZm9yIChpID0gMDsgaSA8IG02OGtfbnVtX21lbW9yeTsgaSsr
KSB7Ci0JCXpvbmVzX3NpemVbWk9ORV9ETUFdID0gbTY4a19tZW1vcnlbaV0uc2l6ZSA+PiBQQUdF
X1NISUZUOwotCQlmcmVlX2FyZWFfaW5pdF9ub2RlKGksIHpvbmVzX3NpemUsCi0JCQkJICAgIG02
OGtfbWVtb3J5W2ldLmFkZHIgPj4gUEFHRV9TSElGVCwgTlVMTCk7CisJZm9yIChpID0gMDsgaSA8
IG02OGtfbnVtX21lbW9yeTsgaSsrKQogCQlpZiAobm9kZV9wcmVzZW50X3BhZ2VzKGkpKQogCQkJ
bm9kZV9zZXRfc3RhdGUoaSwgTl9OT1JNQUxfTUVNT1JZKTsKLQl9CisKKwltYXhfem9uZV9wZm5b
Wk9ORV9ETUFdID0gbWVtYmxvY2tfZW5kX29mX0RSQU0oKTsKKwlmcmVlX2FyZWFfaW5pdChtYXhf
em9uZV9wZm4pOwogfQpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL21tL3N1bjNtbXUuYyBiL2FyY2gv
bTY4ay9tbS9zdW4zbW11LmMKaW5kZXggZWNhMWM0NmJiOTBhLi41ZDhkOTU2ZDkzMjkgMTAwNjQ0
Ci0tLSBhL2FyY2gvbTY4ay9tbS9zdW4zbW11LmMKKysrIGIvYXJjaC9tNjhrL21tL3N1bjNtbXUu
YwpAQCAtNDIsNyArNDIsNyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogCXVuc2ln
bmVkIGxvbmcgYWRkcmVzczsKIAl1bnNpZ25lZCBsb25nIG5leHRfcGd0YWJsZTsKIAl1bnNpZ25l
ZCBsb25nIGJvb3RtZW1fZW5kOwotCXVuc2lnbmVkIGxvbmcgem9uZXNfc2l6ZVtNQVhfTlJfWk9O
RVNdID0geyAwLCB9OworCXVuc2lnbmVkIGxvbmcgbWF4X3pvbmVfcGZuW01BWF9OUl9aT05FU10g
PSB7IDAsIH07CiAJdW5zaWduZWQgbG9uZyBzaXplOwogCiAJZW1wdHlfemVyb19wYWdlID0gbWVt
YmxvY2tfYWxsb2MoUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwpAQCAtODksMTQgKzg5LDEwIEBAIHZv
aWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCiAJY3VycmVudC0+bW0gPSBOVUxMOwogCiAJLyog
bWVtb3J5IHNpemluZyBpcyBhIGhhY2sgc3RvbGVuIGZyb20gbW90b3JvbGEuYy4uICBob3BlIGl0
IHdvcmtzIGZvciB1cyAqLwotCXpvbmVzX3NpemVbWk9ORV9ETUFdID0gKCh1bnNpZ25lZCBsb25n
KWhpZ2hfbWVtb3J5IC0gUEFHRV9PRkZTRVQpID4+IFBBR0VfU0hJRlQ7CisJbWF4X3pvbmVfcGZu
W1pPTkVfRE1BXSA9ICgodW5zaWduZWQgbG9uZyloaWdoX21lbW9yeSkgPj4gUEFHRV9TSElGVDsK
IAogCS8qIEkgcmVhbGx5IHdpc2ggSSBrbmV3IHdoeSB0aGUgZm9sbG93aW5nIGNoYW5nZSBtYWRl
IHRoaW5ncyBiZXR0ZXIuLi4gIC0tIFNhbSAqLwotLyoJZnJlZV9hcmVhX2luaXQoem9uZXNfc2l6
ZSk7ICovCi0JZnJlZV9hcmVhX2luaXRfbm9kZSgwLCB6b25lc19zaXplLAotCQkJICAgIChfX3Bh
KFBBR0VfT0ZGU0VUKSA+PiBQQUdFX1NISUZUKSArIDEsIE5VTEwpOworCWZyZWVfYXJlYV9pbml0
KG1heF96b25lX3Bmbik7CiAKIAogfQotCi0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
