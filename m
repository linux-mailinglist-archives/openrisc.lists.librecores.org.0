Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A7F024B88A6
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:15:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D17124810;
	Wed, 16 Feb 2022 14:15:56 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id E433C2480A
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:15:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C52DD61680;
 Wed, 16 Feb 2022 13:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B6BC004E1;
 Wed, 16 Feb 2022 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017353;
 bh=dnkJIXtWvebNCasCXkRnJYZ7sRLI8mvE+toudMu0he4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mbkiU5PLLn4NDIE1XXLiEo1F9hdUdlYNtT43C6pnWMSMEnNcHeJT08TjKBv9wlavO
 TQIHyKwAX3Q9yO2QLTbU3OYm3uPc3/YkZ7pvQBmT2THInQo7TYroawkDZaAXL5vyhh
 FllPpmvpmlFK45kZzrO4qDSCsDu3EPqfKeJG9TFGZya4fxeNHv6Rte483uYLNxYD13
 uQuYSntQKyv0TTj0RFsVxxEjWwl8zLgAtYDmfXlqvhM3RTaEiIW4u8rxBHtNMi1TA2
 hi7WMFYafgmDnF458kFmL7tjX5qbqMQ6ZZzVXXp+YJKjhVUKCguz4UEfdreoEfaVtr
 MztkrmPVbc3qw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:15 +0100
Message-Id: <20220216131332.1489939-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 01/18] uaccess: fix integer overflow on
 access_ok()
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 stable@vger.kernel.org, dinguyen@kernel.org,
 David Laight <David.Laight@aculab.com>, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClRocmVlIGFyY2hpdGVjdHVyZXMg
Y2hlY2sgdGhlIGVuZCBvZiBhIHVzZXIgYWNjZXNzIGFnYWluc3QgdGhlCmFkZHJlc3MgbGltaXQg
d2l0aG91dCB0YWtpbmcgYSBwb3NzaWJsZSBvdmVyZmxvdyBpbnRvIGFjY291bnQuClBhc3Npbmcg
YSBuZWdhdGl2ZSBsZW5ndGggb3IgYW5vdGhlciBvdmVyZmxvdyBpbiBoZXJlIHJldHVybnMKc3Vj
Y2VzcyB3aGVuIGl0IHNob3VsZCBub3QuCgpVc2UgdGhlIG1vc3QgY29tbW9uIGNvcnJlY3QgaW1w
bGVtZW50YXRpb24gaGVyZSwgd2hpY2ggb3B0aW1pemVzCmZvciBhIGNvbnN0YW50ICdzaXplJyBh
cmd1bWVudCwgYW5kIHR1cm5zIHRoZSBjb21tb24gY2FzZSBpbnRvIGEKc2luZ2xlIGNvbXBhcmlz
b24uCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogZGE1NTEyODE5NDdjICgiY3Nr
eTogVXNlciBhY2Nlc3MiKQpGaXhlczogZjY2M2I2MGY1MjE1ICgibWljcm9ibGF6ZTogRml4IHVh
Y2Nlc3Nfb2sgbWFjcm8iKQpGaXhlczogNzU2Nzc0NmUxYzBkICgiSGV4YWdvbjogQWRkIHVzZXIg
YWNjZXNzIGZ1bmN0aW9ucyIpClJlcG9ydGVkLWJ5OiBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdo
dEBhY3VsYWIuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
ClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogYXJjaC9j
c2t5L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICB8ICA3ICsrKy0tLS0KIGFyY2gvaGV4YWdv
bi9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KIGFyY2gv
bWljcm9ibGF6ZS9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAxOSArKysrLS0tLS0tLS0tLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL2Nza3kvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IGM0MGYwNmVlOGQzZS4uYWM1YTU0ZjU3ZDQwIDEwMDY0
NAotLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCisrKyBiL2FyY2gvY3NreS9p
bmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTMsMTQgKzMsMTMgQEAKICNpZm5kZWYgX19BU01fQ1NL
WV9VQUNDRVNTX0gKICNkZWZpbmUgX19BU01fQ1NLWV9VQUNDRVNTX0gKIAotI2RlZmluZSB1c2Vy
X2FkZHJfbWF4KCkgXAotCSh1YWNjZXNzX2tlcm5lbCgpID8gS0VSTkVMX0RTLnNlZyA6IGdldF9m
cygpLnNlZykKKyNkZWZpbmUgdXNlcl9hZGRyX21heCgpIChjdXJyZW50X3RocmVhZF9pbmZvKCkt
PmFkZHJfbGltaXQuc2VnKQogCiBzdGF0aWMgaW5saW5lIGludCBfX2FjY2Vzc19vayh1bnNpZ25l
ZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKIHsKLQl1bnNpZ25lZCBsb25nIGxpbWl0
ID0gY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRyX2xpbWl0LnNlZzsKKwl1bnNpZ25lZCBsb25n
IGxpbWl0ID0gdXNlcl9hZGRyX21heCgpOwogCi0JcmV0dXJuICgoYWRkciA8IGxpbWl0KSAmJiAo
KGFkZHIgKyBzaXplKSA8IGxpbWl0KSk7CisJcmV0dXJuIChzaXplIDw9IGxpbWl0KSAmJiAoYWRk
ciA8PSAobGltaXQgLSBzaXplKSk7CiB9CiAjZGVmaW5lIF9fYWNjZXNzX29rIF9fYWNjZXNzX29r
CiAKZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdvbi9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNo
L2hleGFnb24vaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IGVmNWJmZWY4ZDQ5MC4uNzE5YmEz
ZjNjNDVjIDEwMDY0NAotLS0gYS9hcmNoL2hleGFnb24vaW5jbHVkZS9hc20vdWFjY2Vzcy5oCisr
KyBiL2FyY2gvaGV4YWdvbi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTI1LDE3ICsyNSwxNyBA
QAogICogUmV0dXJucyB0cnVlIChub256ZXJvKSBpZiB0aGUgbWVtb3J5IGJsb2NrICptYXkqIGJl
IHZhbGlkLCBmYWxzZSAoemVybykKICAqIGlmIGl0IGlzIGRlZmluaXRlbHkgaW52YWxpZC4KICAq
Ci0gKiBVc2VyIGFkZHJlc3Mgc3BhY2UgaW4gSGV4YWdvbiwgbGlrZSB4ODYsIGdvZXMgdG8gMHhi
ZmZmZmZmZiwgc28gdGhlCi0gKiBzaW1wbGUgTVNCLWJhc2VkIHRlc3RzIHVzZWQgYnkgTUlQUyB3
b24ndCB3b3JrLiAgU29tZSBmdXJ0aGVyCi0gKiBvcHRpbWl6YXRpb24gaXMgcHJvYmFibHkgcG9z
c2libGUgaGVyZSwgYnV0IGZvciBub3csIGtlZXAgaXQKLSAqIHJlYXNvbmFibHkgc2ltcGxlIGFu
ZCBub3QgKnRvbyogc2xvdy4gIEFmdGVyIGFsbCwgd2UndmUgZ290IHRoZQotICogTU1VIGZvciBi
YWNrdXAuCiAgKi8KKyNkZWZpbmUgdWFjY2Vzc19rZXJuZWwoKSAoZ2V0X2ZzKCkuc2VnID09IEtF
Uk5FTF9EUy5zZWcpCisjZGVmaW5lIHVzZXJfYWRkcl9tYXgoKSAodWFjY2Vzc19rZXJuZWwoKSA/
IH4wVUwgOiBUQVNLX1NJWkUpCiAKLSNkZWZpbmUgX19hY2Nlc3Nfb2soYWRkciwgc2l6ZSkgXAot
CSgoZ2V0X2ZzKCkuc2VnID09IEtFUk5FTF9EUy5zZWcpIHx8IFwKLQkoKCh1bnNpZ25lZCBsb25n
KWFkZHIgPCBnZXRfZnMoKS5zZWcpICYmIFwKLQkgICh1bnNpZ25lZCBsb25nKXNpemUgPCAoZ2V0
X2ZzKCkuc2VnIC0gKHVuc2lnbmVkIGxvbmcpYWRkcikpKQorc3RhdGljIGlubGluZSBpbnQgX19h
Y2Nlc3Nfb2sodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCit7CisJdW5z
aWduZWQgbG9uZyBsaW1pdCA9IFRBU0tfU0laRTsKKworCXJldHVybiAoc2l6ZSA8PSBsaW1pdCkg
JiYgKGFkZHIgPD0gKGxpbWl0IC0gc2l6ZSkpOworfQorI2RlZmluZSBfX2FjY2Vzc19vayBfX2Fj
Y2Vzc19vawogCiAvKgogICogV2hlbiBhIGtlcm5lbC1tb2RlIHBhZ2UgZmF1bHQgaXMgdGFrZW4s
IHRoZSBmYXVsdGluZyBpbnN0cnVjdGlvbgpkaWZmIC0tZ2l0IGEvYXJjaC9taWNyb2JsYXplL2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS91YWNjZXNz
LmgKaW5kZXggZDJhOGVmOWY4OTc4Li41YjZlMGU3Nzg4ZjQgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlj
cm9ibGF6ZS9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJjaC9taWNyb2JsYXplL2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaApAQCAtMzksMjQgKzM5LDEzIEBACiAKICMgZGVmaW5lIHVhY2Nlc3Nf
a2VybmVsKCkJKGdldF9mcygpLnNlZyA9PSBLRVJORUxfRFMuc2VnKQogCi1zdGF0aWMgaW5saW5l
IGludCBhY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6
ZSkKK3N0YXRpYyBpbmxpbmUgaW50IF9fYWNjZXNzX29rKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5z
aWduZWQgbG9uZyBzaXplKQogewotCWlmICghc2l6ZSkKLQkJZ290byBvazsKKwl1bnNpZ25lZCBs
b25nIGxpbWl0ID0gdXNlcl9hZGRyX21heCgpOwogCi0JaWYgKChnZXRfZnMoKS5zZWcgPCAoKHVu
c2lnbmVkIGxvbmcpYWRkcikpIHx8Ci0JCQkoZ2V0X2ZzKCkuc2VnIDwgKCh1bnNpZ25lZCBsb25n
KWFkZHIgKyBzaXplIC0gMSkpKSB7Ci0JCXByX2RldmVsKCJBQ0NFU1MgZmFpbCBhdCAweCUwOHgg
KHNpemUgMHgleCksIHNlZyAweCUwOHhcbiIsCi0JCQkoX19mb3JjZSB1MzIpYWRkciwgKHUzMilz
aXplLAotCQkJKHUzMilnZXRfZnMoKS5zZWcpOwotCQlyZXR1cm4gMDsKLQl9Ci1vazoKLQlwcl9k
ZXZlbCgiQUNDRVNTIE9LIGF0IDB4JTA4eCAoc2l6ZSAweCV4KSwgc2VnIDB4JTA4eFxuIiwKLQkJ
CShfX2ZvcmNlIHUzMilhZGRyLCAodTMyKXNpemUsCi0JCQkodTMyKWdldF9mcygpLnNlZyk7Ci0J
cmV0dXJuIDE7CisJcmV0dXJuIChzaXplIDw9IGxpbWl0KSAmJiAoYWRkciA8PSAobGltaXQgLSBz
aXplKSk7CiB9CisjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKSBfX2FjY2Vzc19vaygodW5z
aWduZWQgbG9uZylhZGRyLCBzaXplKQogCiAjIGRlZmluZSBfX0ZJWFVQX1NFQ1RJT04JIi5zZWN0
aW9uIC5maXh1cCxcImF4XCJcbiIKICMgZGVmaW5lIF9fRVhfVEFCTEVfU0VDVElPTgkiLnNlY3Rp
b24gX19leF90YWJsZSxcImFcIlxuIgotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
