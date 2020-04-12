Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0D35D1B2099
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BED3C20AD4;
	Tue, 21 Apr 2020 10:01:37 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 3640E20716
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:49:39 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2318520732;
 Sun, 12 Apr 2020 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586720978;
 bh=8bF1Pu75QmsOVjbaACX4VAU2zf9BLYADPXDD4519geE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f8MaQrCm0Hl80hu0++ZqU6IDqmN39vSrVOUXSCBiboiDATjuq8zWxXcrhx4reOEFz
 UnT1krn6SVH56kSVAhVqWmi/pqLue6tstokqSoGOhWphOTRTHFT8vEnlL0hd8L/AKu
 f0ajTvRbQbvN/SZEolDhT+HF7ng0L1Xb7dYMxDI0=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:39 +0300
Message-Id: <20200412194859.12663-2-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 01/21] mm: memblock: replace dereferences of
 memblock_region.nid with API calls
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlcmUgYXJlIHNldmVy
YWwgcGxhY2VzIGluIHRoZSBjb2RlIHRoYXQgZGlyZWN0bHkgZGVyZWZlcmVuY2UKbWVtYmxvY2tf
cmVnaW9uLm5pZCBkZXNwaXRlIHRoaXMgZmllbGQgYmVpbmcgZGVmaW5lZCBvbmx5IHdoZW4KQ09O
RklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVA9eS4KClJlcGxhY2UgdGhlc2Ugd2l0aCBjYWxscyB0
byBtZW1ibG9ja19nZXRfcmVnaW9uX25pZCgpIHRvIGltcHJvdmUgY29kZQpyb2J1c3RuZXNzIGFu
ZCB0byBhdm9pZCBwb3NzaWJsZSBicmVha2FnZSB3aGVuCkNPTkZJR19IQVZFX01FTUJMT0NLX05P
REVfTUFQIHdpbGwgYmUgcmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJw
cHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL2FybTY0L21tL251bWEuYyB8IDkgKysrKysrLS0t
CiBhcmNoL3g4Ni9tbS9udW1hLmMgICB8IDYgKysrKy0tCiBtbS9tZW1ibG9jay5jICAgICAgICB8
IDggKysrKystLS0KIG1tL3BhZ2VfYWxsb2MuYyAgICAgIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvbW0vbnVtYS5jIGIvYXJjaC9hcm02NC9tbS9udW1hLmMKaW5kZXggNGRlY2YxNjU5NzAw
Li5hYWZjZWUzZTNmN2UgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vbnVtYS5jCisrKyBiL2Fy
Y2gvYXJtNjQvbW0vbnVtYS5jCkBAIC0zNTAsMTMgKzM1MCwxNiBAQCBzdGF0aWMgaW50IF9faW5p
dCBudW1hX3JlZ2lzdGVyX25vZGVzKHZvaWQpCiAJc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqbWJs
azsKIAogCS8qIENoZWNrIHRoYXQgdmFsaWQgbmlkIGlzIHNldCB0byBtZW1ibGtzICovCi0JZm9y
X2VhY2hfbWVtYmxvY2sobWVtb3J5LCBtYmxrKQotCQlpZiAobWJsay0+bmlkID09IE5VTUFfTk9f
Tk9ERSB8fCBtYmxrLT5uaWQgPj0gTUFYX05VTU5PREVTKSB7CisJZm9yX2VhY2hfbWVtYmxvY2so
bWVtb3J5LCBtYmxrKSB7CisJCWludCBtYmxrX25pZCA9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9k
ZShtYmxrKTsKKworCQlpZiAobWJsa19uaWQgPT0gTlVNQV9OT19OT0RFIHx8IG1ibGtfbmlkID49
IE1BWF9OVU1OT0RFUykgewogCQkJcHJfd2FybigiV2FybmluZzogaW52YWxpZCBtZW1ibGsgbm9k
ZSAlZCBbbWVtICUjMDEwTHgtJSMwMTBMeF1cbiIsCi0JCQkJbWJsay0+bmlkLCBtYmxrLT5iYXNl
LAorCQkJCW1ibGtfbmlkLCBtYmxrLT5iYXNlLAogCQkJCW1ibGstPmJhc2UgKyBtYmxrLT5zaXpl
IC0gMSk7CiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJfQorCX0KIAogCS8qIEZpbmFsbHkgcmVnaXN0
ZXIgbm9kZXMuICovCiAJZm9yX2VhY2hfbm9kZV9tYXNrKG5pZCwgbnVtYV9ub2Rlc19wYXJzZWQp
IHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL251bWEuYyBiL2FyY2gveDg2L21tL251bWEuYwpp
bmRleCA1OWJhMDA4NTA0ZGMuLmZlMDI0YjJhYzc5NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbW0v
bnVtYS5jCisrKyBiL2FyY2gveDg2L21tL251bWEuYwpAQCAtNTE3LDggKzUxNywxMCBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgbnVtYV9jbGVhcl9rZXJuZWxfbm9kZV9ob3RwbHVnKHZvaWQpCiAJICog
ICByZXNlcnZlIHNwZWNpZmljIHBhZ2VzIGZvciBTYW5keSBCcmlkZ2UgZ3JhcGhpY3MuIF0KIAkg
Ki8KIAlmb3JfZWFjaF9tZW1ibG9jayhyZXNlcnZlZCwgbWJfcmVnaW9uKSB7Ci0JCWlmIChtYl9y
ZWdpb24tPm5pZCAhPSBNQVhfTlVNTk9ERVMpCi0JCQlub2RlX3NldChtYl9yZWdpb24tPm5pZCwg
cmVzZXJ2ZWRfbm9kZW1hc2spOworCQlpbnQgbmlkID0gbWVtYmxvY2tfZ2V0X3JlZ2lvbl9ub2Rl
KG1iX3JlZ2lvbik7CisKKwkJaWYgKG5pZCAhPSBNQVhfTlVNTk9ERVMpCisJCQlub2RlX3NldChu
aWQsIHJlc2VydmVkX25vZGVtYXNrKTsKIAl9CiAKIAkvKgpkaWZmIC0tZ2l0IGEvbW0vbWVtYmxv
Y2suYyBiL21tL21lbWJsb2NrLmMKaW5kZXggYzc5YmE2Zjk5MjBjLi40M2UyZmQzMDA2YzEgMTAw
NjQ0Ci0tLSBhL21tL21lbWJsb2NrLmMKKysrIGIvbW0vbWVtYmxvY2suYwpAQCAtMTIwNywxMyAr
MTIwNywxNSBAQCB2b2lkIF9faW5pdF9tZW1ibG9jayBfX25leHRfbWVtX3Bmbl9yYW5nZShpbnQg
KmlkeCwgaW50IG5pZCwKIHsKIAlzdHJ1Y3QgbWVtYmxvY2tfdHlwZSAqdHlwZSA9ICZtZW1ibG9j
ay5tZW1vcnk7CiAJc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcjsKKwlpbnQgcl9uaWQ7CiAKIAl3
aGlsZSAoKysqaWR4IDwgdHlwZS0+Y250KSB7CiAJCXIgPSAmdHlwZS0+cmVnaW9uc1sqaWR4XTsK
KwkJcl9uaWQgPSBtZW1ibG9ja19nZXRfcmVnaW9uX25vZGUocik7CiAKIAkJaWYgKFBGTl9VUChy
LT5iYXNlKSA+PSBQRk5fRE9XTihyLT5iYXNlICsgci0+c2l6ZSkpCiAJCQljb250aW51ZTsKLQkJ
aWYgKG5pZCA9PSBNQVhfTlVNTk9ERVMgfHwgbmlkID09IHItPm5pZCkKKwkJaWYgKG5pZCA9PSBN
QVhfTlVNTk9ERVMgfHwgbmlkID09IHJfbmlkKQogCQkJYnJlYWs7CiAJfQogCWlmICgqaWR4ID49
IHR5cGUtPmNudCkgewpAQCAtMTIyNiw3ICsxMjI4LDcgQEAgdm9pZCBfX2luaXRfbWVtYmxvY2sg
X19uZXh0X21lbV9wZm5fcmFuZ2UoaW50ICppZHgsIGludCBuaWQsCiAJaWYgKG91dF9lbmRfcGZu
KQogCQkqb3V0X2VuZF9wZm4gPSBQRk5fRE9XTihyLT5iYXNlICsgci0+c2l6ZSk7CiAJaWYgKG91
dF9uaWQpCi0JCSpvdXRfbmlkID0gci0+bmlkOworCQkqb3V0X25pZCA9IHJfbmlkOwogfQogCiAv
KioKQEAgLTE4MTAsNyArMTgxMiw3IEBAIGludCBfX2luaXRfbWVtYmxvY2sgbWVtYmxvY2tfc2Vh
cmNoX3Bmbl9uaWQodW5zaWduZWQgbG9uZyBwZm4sCiAJKnN0YXJ0X3BmbiA9IFBGTl9ET1dOKHR5
cGUtPnJlZ2lvbnNbbWlkXS5iYXNlKTsKIAkqZW5kX3BmbiA9IFBGTl9ET1dOKHR5cGUtPnJlZ2lv
bnNbbWlkXS5iYXNlICsgdHlwZS0+cmVnaW9uc1ttaWRdLnNpemUpOwogCi0JcmV0dXJuIHR5cGUt
PnJlZ2lvbnNbbWlkXS5uaWQ7CisJcmV0dXJuIG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZSgmdHlw
ZS0+cmVnaW9uc1ttaWRdKTsKIH0KICNlbmRpZgogCmRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9j
LmMgYi9tbS9wYWdlX2FsbG9jLmMKaW5kZXggNjk4MjdkNGZhMDUyLi4wZDAxMmVkYTE2OTQgMTAw
NjQ0Ci0tLSBhL21tL3BhZ2VfYWxsb2MuYworKysgYi9tbS9wYWdlX2FsbG9jLmMKQEAgLTcyMDgs
NyArNzIwOCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBmaW5kX3pvbmVfbW92YWJsZV9wZm5zX2Zv
cl9ub2Rlcyh2b2lkKQogCQkJaWYgKCFtZW1ibG9ja19pc19ob3RwbHVnZ2FibGUocikpCiAJCQkJ
Y29udGludWU7CiAKLQkJCW5pZCA9IHItPm5pZDsKKwkJCW5pZCA9IG1lbWJsb2NrX2dldF9yZWdp
b25fbm9kZShyKTsKIAogCQkJdXNhYmxlX3N0YXJ0cGZuID0gUEZOX0RPV04oci0+YmFzZSk7CiAJ
CQl6b25lX21vdmFibGVfcGZuW25pZF0gPSB6b25lX21vdmFibGVfcGZuW25pZF0gPwpAQCAtNzIy
OSw3ICs3MjI5LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGZpbmRfem9uZV9tb3ZhYmxlX3BmbnNf
Zm9yX25vZGVzKHZvaWQpCiAJCQlpZiAobWVtYmxvY2tfaXNfbWlycm9yKHIpKQogCQkJCWNvbnRp
bnVlOwogCi0JCQluaWQgPSByLT5uaWQ7CisJCQluaWQgPSBtZW1ibG9ja19nZXRfcmVnaW9uX25v
ZGUocik7CiAKIAkJCXVzYWJsZV9zdGFydHBmbiA9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFz
ZV9wZm4ocik7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
