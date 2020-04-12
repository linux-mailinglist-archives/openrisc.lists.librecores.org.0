Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 619D61B20AC
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 23FB520A73;
	Tue, 21 Apr 2020 10:01:50 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C28A520A46
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:53:30 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6129420936;
 Sun, 12 Apr 2020 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721209;
 bh=BO4q+W2NnpsFFIV9298SlJ1S2n+gwnsfw0xJWPd6Dwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=exuQgzAHeeeiXpFA0RkeGhsuW8e/kbqxWnpPLs/dsdEsZaega5WSKKJKpuQOKPPYn
 oYSyxFKfMvP/ab/l20DMXDTeNJ//Fb6Jm92AMxjD4o+/hF8FzpZTbpbX9TG+ez2a4u
 g3nkwvty/3rgBQjWArk4Bb+QZhm9whFijB9NTO7k=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:55 +0300
Message-Id: <20200412194859.12663-18-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 17/21] mm: free_area_init: allow defining
 max_zone_pfn in descending order
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKU29tZSBhcmNoaXRlY3R1
cmVzIChlLmcuIEFSQykgaGF2ZSB0aGUgWk9ORV9ISUdITUVNIHpvbmUgYmVsb3cgdGhlClpPTkVf
Tk9STUFMLiBBbGxvd2luZyBmcmVlX2FyZWFfaW5pdCgpIHBhcnNlIG1heF96b25lX3BmbiBhcnJh
eSBldmVuIGl0IGlzCnNvcnRlZCBpbiBkZXNjZW5kaW5nIG9yZGVyIGFsbG93cyB1c2luZyBmcmVl
X2FyZWFfaW5pdCgpIG9uIHN1Y2gKYXJjaGl0ZWN0dXJlcy4KCkFkZCB0b3AgLT4gZG93biB0cmF2
ZXJzYWwgb2YgbWF4X3pvbmVfcGZuIGFycmF5IGluIGZyZWVfYXJlYV9pbml0KCkgYW5kIHVzZQp0
aGUgbGF0dGVyIGluIEFSQyBub2RlL3pvbmUgaW5pdGlhbGl6YXRpb24uCgpTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9hcmMvbW0vaW5p
dC5jIHwgMzYgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBtbS9wYWdlX2Fs
bG9jLmMgICAgfCAyNCArKysrKysrKysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcmMv
bW0vaW5pdC5jIGIvYXJjaC9hcmMvbW0vaW5pdC5jCmluZGV4IDA5MjBjOTY5YzQ2Ni4uNDFlYjli
ZTE2NTNjIDEwMDY0NAotLS0gYS9hcmNoL2FyYy9tbS9pbml0LmMKKysrIGIvYXJjaC9hcmMvbW0v
aW5pdC5jCkBAIC02MywxMSArNjMsMTMgQEAgdm9pZCBfX2luaXQgZWFybHlfaW5pdF9kdF9hZGRf
bWVtb3J5X2FyY2godTY0IGJhc2UsIHU2NCBzaXplKQogCiAJCWxvd19tZW1fc3ogPSBzaXplOwog
CQlpbl91c2UgPSAxOworCQltZW1ibG9ja19hZGRfbm9kZShiYXNlLCBzaXplLCAwKTsKIAl9IGVs
c2UgewogI2lmZGVmIENPTkZJR19ISUdITUVNCiAJCWhpZ2hfbWVtX3N0YXJ0ID0gYmFzZTsKIAkJ
aGlnaF9tZW1fc3ogPSBzaXplOwogCQlpbl91c2UgPSAxOworCQltZW1ibG9ja19hZGRfbm9kZShi
YXNlLCBzaXplLCAxKTsKICNlbmRpZgogCX0KIApAQCAtODMsOCArODUsNyBAQCB2b2lkIF9faW5p
dCBlYXJseV9pbml0X2R0X2FkZF9tZW1vcnlfYXJjaCh1NjQgYmFzZSwgdTY0IHNpemUpCiAgKi8K
IHZvaWQgX19pbml0IHNldHVwX2FyY2hfbWVtb3J5KHZvaWQpCiB7Ci0JdW5zaWduZWQgbG9uZyB6
b25lc19zaXplW01BWF9OUl9aT05FU107Ci0JdW5zaWduZWQgbG9uZyB6b25lc19ob2xlc1tNQVhf
TlJfWk9ORVNdOworCXVuc2lnbmVkIGxvbmcgbWF4X3pvbmVfcGZuW01BWF9OUl9aT05FU10gPSB7
IDAgfTsKIAogCWluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNpZ25lZCBsb25nKV90ZXh0OwogCWlu
aXRfbW0uZW5kX2NvZGUgPSAodW5zaWduZWQgbG9uZylfZXRleHQ7CkBAIC0xMTUsNyArMTE2LDYg
QEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaF9tZW1vcnkodm9pZCkKIAkgKiB0aGUgY3Jhc2gKIAkg
Ki8KIAotCW1lbWJsb2NrX2FkZF9ub2RlKGxvd19tZW1fc3RhcnQsIGxvd19tZW1fc3osIDApOwog
CW1lbWJsb2NrX3Jlc2VydmUoQ09ORklHX0xJTlVYX0xJTktfQkFTRSwKIAkJCSBfX3BhKF9lbmQp
IC0gQ09ORklHX0xJTlVYX0xJTktfQkFTRSk7CiAKQEAgLTEzMywyMiArMTMzLDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfYXJjaF9tZW1vcnkodm9pZCkKIAltZW1ibG9ja19kdW1wX2FsbCgpOwogCiAJ
LyotLS0tLS0tLS0tLS0tLS0tLSBub2RlL3pvbmVzIHNldHVwIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKi8KLQltZW1zZXQoem9uZXNfc2l6ZSwgMCwgc2l6ZW9mKHpvbmVzX3NpemUpKTsKLQlt
ZW1zZXQoem9uZXNfaG9sZXMsIDAsIHNpemVvZih6b25lc19ob2xlcykpOwotCi0Jem9uZXNfc2l6
ZVtaT05FX05PUk1BTF0gPSBtYXhfbG93X3BmbiAtIG1pbl9sb3dfcGZuOwotCXpvbmVzX2hvbGVz
W1pPTkVfTk9STUFMXSA9IDA7Ci0KLQkvKgotCSAqIFdlIGNhbid0IHVzZSB0aGUgaGVscGVyIGZy
ZWVfYXJlYV9pbml0KHpvbmVzW10pIGJlY2F1c2UgaXQgdXNlcwotCSAqIFBBR0VfT0ZGU0VUIHRv
IGNvbXB1dGUgdGhlIEBtaW5fbG93X3BmbiB3aGljaCB3b3VsZCBiZSB3cm9uZwotCSAqIHdoZW4g
b3VyIGtlcm5lbCBkb2Vzbid0IHN0YXJ0IGF0IFBBR0VfT0ZGU0VULCBpLmUuCi0JICogUEFHRV9P
RkZTRVQgIT0gQ09ORklHX0xJTlVYX1JBTV9CQVNFCi0JICovCi0JZnJlZV9hcmVhX2luaXRfbm9k
ZSgwLAkJCS8qIG5vZGUtaWQgKi8KLQkJCSAgICB6b25lc19zaXplLAkJLyogbnVtIHBhZ2VzIHBl
ciB6b25lICovCi0JCQkgICAgbWluX2xvd19wZm4sCS8qIGZpcnN0IHBmbiBvZiBub2RlICovCi0J
CQkgICAgem9uZXNfaG9sZXMpOwkvKiBob2xlcyAqLworCW1heF96b25lX3BmbltaT05FX05PUk1B
TF0gPSBtYXhfbG93X3BmbjsKIAogI2lmZGVmIENPTkZJR19ISUdITUVNCiAJLyoKQEAgLTE2OCwy
MCArMTUzLDEzIEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2hfbWVtb3J5KHZvaWQpCiAJbWluX2hp
Z2hfcGZuID0gUEZOX0RPV04oaGlnaF9tZW1fc3RhcnQpOwogCW1heF9oaWdoX3BmbiA9IFBGTl9E
T1dOKGhpZ2hfbWVtX3N0YXJ0ICsgaGlnaF9tZW1fc3opOwogCi0Jem9uZXNfc2l6ZVtaT05FX05P
Uk1BTF0gPSAwOwotCXpvbmVzX2hvbGVzW1pPTkVfTk9STUFMXSA9IDA7Ci0KLQl6b25lc19zaXpl
W1pPTkVfSElHSE1FTV0gPSBtYXhfaGlnaF9wZm4gLSBtaW5faGlnaF9wZm47Ci0Jem9uZXNfaG9s
ZXNbWk9ORV9ISUdITUVNXSA9IDA7Ci0KLQlmcmVlX2FyZWFfaW5pdF9ub2RlKDEsCQkJLyogbm9k
ZS1pZCAqLwotCQkJICAgIHpvbmVzX3NpemUsCQkvKiBudW0gcGFnZXMgcGVyIHpvbmUgKi8KLQkJ
CSAgICBtaW5faGlnaF9wZm4sCS8qIGZpcnN0IHBmbiBvZiBub2RlICovCi0JCQkgICAgem9uZXNf
aG9sZXMpOwkvKiBob2xlcyAqLworCW1heF96b25lX3BmbltaT05FX0hJR0hNRU1dID0gbWF4X2hp
Z2hfcGZuOwogCiAJaGlnaF9tZW1vcnkgPSAodm9pZCAqKShtaW5faGlnaF9wZm4gPDwgUEFHRV9T
SElGVCk7CiAJa21hcF9pbml0KCk7CiAjZW5kaWYKKworCWZyZWVfYXJlYV9pbml0KG1heF96b25l
X3Bmbik7CiB9CiAKIC8qCmRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2Fs
bG9jLmMKaW5kZXggMzQzZDg3Yjg2OTdkLi4zNzY0MzRjN2E3OGIgMTAwNjQ0Ci0tLSBhL21tL3Bh
Z2VfYWxsb2MuYworKysgYi9tbS9wYWdlX2FsbG9jLmMKQEAgLTc0MjksNyArNzQyOSw4IEBAIHN0
YXRpYyB2b2lkIGNoZWNrX2Zvcl9tZW1vcnkocGdfZGF0YV90ICpwZ2RhdCwgaW50IG5pZCkKIHZv
aWQgX19pbml0IGZyZWVfYXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbikKIHsK
IAl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKLQlpbnQgaSwgbmlkOworCWludCBp
LCBuaWQsIHpvbmU7CisJYm9vbCBkZXNjZW5kaW5nID0gZmFsc2U7CiAKIAkvKiBSZWNvcmQgd2hl
cmUgdGhlIHpvbmUgYm91bmRhcmllcyBhcmUgKi8KIAltZW1zZXQoYXJjaF96b25lX2xvd2VzdF9w
b3NzaWJsZV9wZm4sIDAsCkBAIC03NDM5LDEzICs3NDQwLDI2IEBAIHZvaWQgX19pbml0IGZyZWVf
YXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbikKIAogCXN0YXJ0X3BmbiA9IGZp
bmRfbWluX3Bmbl93aXRoX2FjdGl2ZV9yZWdpb25zKCk7CiAKKwkvKgorCSAqIFNvbWUgYXJjaGl0
ZWN0dXJzLCBlLmcuIEFSQyBtYXkgaGF2ZSBaT05FX0hJR0hNRU0gYmVsb3cKKwkgKiBaT05FX05P
Uk1BTC4gRm9yIHN1Y2ggY2FzZXMgd2UgYWxsb3cgbWF4X3pvbmVfcGZuIHNvcnRlZCBpbiB0aGUK
KwkgKiBkZXNjZW5kaW5nIG9yZGVyCisJICovCisJaWYgKE1BWF9OUl9aT05FUyA+IDEgJiYgbWF4
X3pvbmVfcGZuWzBdID4gbWF4X3pvbmVfcGZuWzFdKQorCQlkZXNjZW5kaW5nID0gdHJ1ZTsKKwog
CWZvciAoaSA9IDA7IGkgPCBNQVhfTlJfWk9ORVM7IGkrKykgewotCQlpZiAoaSA9PSBaT05FX01P
VkFCTEUpCisJCWlmIChkZXNjZW5kaW5nKQorCQkJem9uZSA9IE1BWF9OUl9aT05FUyAtIGkgLSAx
OworCQllbHNlCisJCQl6b25lID0gaTsKKworCQlpZiAoem9uZSA9PSBaT05FX01PVkFCTEUpCiAJ
CQljb250aW51ZTsKIAotCQllbmRfcGZuID0gbWF4KG1heF96b25lX3BmbltpXSwgc3RhcnRfcGZu
KTsKLQkJYXJjaF96b25lX2xvd2VzdF9wb3NzaWJsZV9wZm5baV0gPSBzdGFydF9wZm47Ci0JCWFy
Y2hfem9uZV9oaWdoZXN0X3Bvc3NpYmxlX3BmbltpXSA9IGVuZF9wZm47CisJCWVuZF9wZm4gPSBt
YXgobWF4X3pvbmVfcGZuW3pvbmVdLCBzdGFydF9wZm4pOworCQlhcmNoX3pvbmVfbG93ZXN0X3Bv
c3NpYmxlX3Bmblt6b25lXSA9IHN0YXJ0X3BmbjsKKwkJYXJjaF96b25lX2hpZ2hlc3RfcG9zc2li
bGVfcGZuW3pvbmVdID0gZW5kX3BmbjsKIAogCQlzdGFydF9wZm4gPSBlbmRfcGZuOwogCX0KLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
