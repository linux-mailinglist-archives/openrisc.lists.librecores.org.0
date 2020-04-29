Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AC6E81C05C0
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 049FD20B1A;
	Thu, 30 Apr 2020 21:09:29 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6172F20300
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:12:35 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B48072137B;
 Wed, 29 Apr 2020 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162354;
 bh=pGmPDgM6K7/iwWSDa31GpOgfyYSqxlM/17DqmtP9T0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FM7izhFQvoPq0QV3Pi1A8eDpHVFq9Zp0cT3C5CzjDm8JdAvrc+wZZGVUYm4qetES/
 V/SQO20yZf4dsZBiR67nDQgHKFAgAH6vg5Vup2Bajexd1btsNN20RlbFBplIFJDWlk
 t5cPlwxaffucDNFeNut+PgXi8W966/qE54hcqprM=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:08 +0300
Message-Id: <20200429121126.17989-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 02/20] mm: make early_pfn_to_nid() and related
 defintions close to each other
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGVhcmx5X3Bmbl90
b19uaWQoKSBhbmQgaXQncyBoZWxwZXIgX19lYXJseV9wZm5fdG9fbmlkKCkgYXJlIHNwcmVhZAph
cm91bmQgaW5jbHVkZS9saW51eC9tbS5oLCBpbmNsdWRlL2xpbnV4L21tem9uZS5oIGFuZCBtbS9w
YWdlX2FsbG9jLmMuCgpEcm9wIHVudXNlZCBzdHViIGZvciBfX2Vhcmx5X3Bmbl90b19uaWQoKSBh
bmQgbW92ZSBpdHMgYWN0dWFsIGdlbmVyaWMKaW1wbGVtZW50YXRpb24gY2xvc2UgdG8gaXRzIHVz
ZXJzLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgot
LS0KIGluY2x1ZGUvbGludXgvbW0uaCAgICAgfCAgNCArKy0tCiBpbmNsdWRlL2xpbnV4L21tem9u
ZS5oIHwgIDkgLS0tLS0tLS0KIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgfCA0OSArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
bS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IDVhMzIzNDIyZDc4My4uYTQwNDAyNmQxNGQ0
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbS5o
CkBAIC0yMzg4LDkgKzIzODgsOSBAQCBleHRlcm4gdm9pZCBzcGFyc2VfbWVtb3J5X3ByZXNlbnRf
d2l0aF9hY3RpdmVfcmVnaW9ucyhpbnQgbmlkKTsKIAogI2lmICFkZWZpbmVkKENPTkZJR19IQVZF
X01FTUJMT0NLX05PREVfTUFQKSAmJiBcCiAgICAgIWRlZmluZWQoQ09ORklHX0hBVkVfQVJDSF9F
QVJMWV9QRk5fVE9fTklEKQotc3RhdGljIGlubGluZSBpbnQgX19lYXJseV9wZm5fdG9fbmlkKHVu
c2lnbmVkIGxvbmcgcGZuLAotCQkJCQlzdHJ1Y3QgbW1pbml0X3Bmbm5pZF9jYWNoZSAqc3RhdGUp
CitzdGF0aWMgaW5saW5lIGludCBlYXJseV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuKQog
eworCUJVSUxEX0JVR19PTihJU19FTkFCTEVEKENPTkZJR19OVU1BKSk7CiAJcmV0dXJuIDA7CiB9
CiAjZWxzZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbXpvbmUuaCBiL2luY2x1ZGUvbGlu
dXgvbW16b25lLmgKaW5kZXggMWI5ZGU3ZDIyMGZiLi43YjViNmViYTQwMmYgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvbW16b25lLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbXpvbmUuaApAQCAt
MTA3OCwxNSArMTA3OCw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHpvbmVyZWYgKmZpcnN0X3pv
bmVzX3pvbmVsaXN0KHN0cnVjdCB6b25lbGlzdCAqem9uZWxpc3QsCiAjaW5jbHVkZSA8YXNtL3Nw
YXJzZW1lbS5oPgogI2VuZGlmCiAKLSNpZiAhZGVmaW5lZChDT05GSUdfSEFWRV9BUkNIX0VBUkxZ
X1BGTl9UT19OSUQpICYmIFwKLQkhZGVmaW5lZChDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01B
UCkKLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBlYXJseV9wZm5fdG9fbmlkKHVuc2lnbmVk
IGxvbmcgcGZuKQotewotCUJVSUxEX0JVR19PTihJU19FTkFCTEVEKENPTkZJR19OVU1BKSk7Ci0J
cmV0dXJuIDA7Ci19Ci0jZW5kaWYKLQogI2lmZGVmIENPTkZJR19GTEFUTUVNCiAjZGVmaW5lIHBm
bl90b19uaWQocGZuKQkJKDApCiAjZW5kaWYKZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBi
L21tL3BhZ2VfYWxsb2MuYwppbmRleCAwZDAxMmVkYTE2OTQuLmE4MDJlZTQ3ZTcxNSAxMDA2NDQK
LS0tIGEvbW0vcGFnZV9hbGxvYy5jCisrKyBiL21tL3BhZ2VfYWxsb2MuYwpAQCAtMTUwNCw2ICsx
NTA0LDMxIEBAIHZvaWQgX19mcmVlX3BhZ2VzX2NvcmUoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2ln
bmVkIGludCBvcmRlcikKIAogc3RhdGljIHN0cnVjdCBtbWluaXRfcGZubmlkX2NhY2hlIGVhcmx5
X3Bmbm5pZF9jYWNoZSBfX21lbWluaXRkYXRhOwogCisjaWZuZGVmIENPTkZJR19IQVZFX0FSQ0hf
RUFSTFlfUEZOX1RPX05JRAorCisvKgorICogUmVxdWlyZWQgYnkgU1BBUlNFTUVNLiBHaXZlbiBh
IFBGTiwgcmV0dXJuIHdoYXQgbm9kZSB0aGUgUEZOIGlzIG9uLgorICovCitpbnQgX19tZW1pbml0
IF9fZWFybHlfcGZuX3RvX25pZCh1bnNpZ25lZCBsb25nIHBmbiwKKwkJCQkJc3RydWN0IG1taW5p
dF9wZm5uaWRfY2FjaGUgKnN0YXRlKQoreworCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRf
cGZuOworCWludCBuaWQ7CisKKwlpZiAoc3RhdGUtPmxhc3Rfc3RhcnQgPD0gcGZuICYmIHBmbiA8
IHN0YXRlLT5sYXN0X2VuZCkKKwkJcmV0dXJuIHN0YXRlLT5sYXN0X25pZDsKKworCW5pZCA9IG1l
bWJsb2NrX3NlYXJjaF9wZm5fbmlkKHBmbiwgJnN0YXJ0X3BmbiwgJmVuZF9wZm4pOworCWlmIChu
aWQgIT0gTlVNQV9OT19OT0RFKSB7CisJCXN0YXRlLT5sYXN0X3N0YXJ0ID0gc3RhcnRfcGZuOwor
CQlzdGF0ZS0+bGFzdF9lbmQgPSBlbmRfcGZuOworCQlzdGF0ZS0+bGFzdF9uaWQgPSBuaWQ7CisJ
fQorCisJcmV0dXJuIG5pZDsKK30KKyNlbmRpZiAvKiBDT05GSUdfSEFWRV9BUkNIX0VBUkxZX1BG
Tl9UT19OSUQgKi8KKwogaW50IF9fbWVtaW5pdCBlYXJseV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxv
bmcgcGZuKQogewogCXN0YXRpYyBERUZJTkVfU1BJTkxPQ0soZWFybHlfcGZuX2xvY2spOwpAQCAt
NjI5OSwzMCArNjMyNCw2IEBAIHZvaWQgX19tZW1pbml0IGluaXRfY3VycmVudGx5X2VtcHR5X3pv
bmUoc3RydWN0IHpvbmUgKnpvbmUsCiB9CiAKICNpZmRlZiBDT05GSUdfSEFWRV9NRU1CTE9DS19O
T0RFX01BUAotI2lmbmRlZiBDT05GSUdfSEFWRV9BUkNIX0VBUkxZX1BGTl9UT19OSUQKLQotLyoK
LSAqIFJlcXVpcmVkIGJ5IFNQQVJTRU1FTS4gR2l2ZW4gYSBQRk4sIHJldHVybiB3aGF0IG5vZGUg
dGhlIFBGTiBpcyBvbi4KLSAqLwotaW50IF9fbWVtaW5pdCBfX2Vhcmx5X3Bmbl90b19uaWQodW5z
aWduZWQgbG9uZyBwZm4sCi0JCQkJCXN0cnVjdCBtbWluaXRfcGZubmlkX2NhY2hlICpzdGF0ZSkK
LXsKLQl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKLQlpbnQgbmlkOwotCi0JaWYg
KHN0YXRlLT5sYXN0X3N0YXJ0IDw9IHBmbiAmJiBwZm4gPCBzdGF0ZS0+bGFzdF9lbmQpCi0JCXJl
dHVybiBzdGF0ZS0+bGFzdF9uaWQ7Ci0KLQluaWQgPSBtZW1ibG9ja19zZWFyY2hfcGZuX25pZChw
Zm4sICZzdGFydF9wZm4sICZlbmRfcGZuKTsKLQlpZiAobmlkICE9IE5VTUFfTk9fTk9ERSkgewot
CQlzdGF0ZS0+bGFzdF9zdGFydCA9IHN0YXJ0X3BmbjsKLQkJc3RhdGUtPmxhc3RfZW5kID0gZW5k
X3BmbjsKLQkJc3RhdGUtPmxhc3RfbmlkID0gbmlkOwotCX0KLQotCXJldHVybiBuaWQ7Ci19Ci0j
ZW5kaWYgLyogQ09ORklHX0hBVkVfQVJDSF9FQVJMWV9QRk5fVE9fTklEICovCiAKIC8qKgogICog
ZnJlZV9ib290bWVtX3dpdGhfYWN0aXZlX3JlZ2lvbnMgLSBDYWxsIG1lbWJsb2NrX2ZyZWVfZWFy
bHlfbmlkIGZvciBlYWNoIGFjdGl2ZSByYW5nZQotLSAKMi4yNi4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
