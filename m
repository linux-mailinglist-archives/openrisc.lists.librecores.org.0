Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B71BE2460B3
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6872120D7B;
	Mon, 17 Aug 2020 10:46:12 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CEC8820CC8
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:13:04 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF6522250E;
 Tue, 28 Jul 2020 05:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913183;
 bh=gzwerAM5mue0P8mAb9RTcMcptKQskdlleSUQBoxuoyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Say3vh4QamTYtvnYNu+lnlZMJneUQqUnbMTX43a8WoTOrUYvMeKTwUVkw/DEqkPhG
 HnPJWpQTYZNG7fegwc0EKmJMGw2JgZY3KWzFmeYTl228nTa6vRBl5n108KojpP7OBY
 xf3ECXf8bK2qItN0xsPBA+mi/0GEjLhJvgIymxCA=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:43 +0300
Message-Id: <20200728051153.1590-6-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 05/15] h8300, nds32,
 openrisc: simplify detection of memory extents
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKSW5zdGVhZCBvZiB0cmF2
ZXJzaW5nIG1lbWJsb2NrLm1lbW9yeSByZWdpb25zIHRvIGZpbmQgbWVtb3J5X3N0YXJ0IGFuZApt
ZW1vcnlfZW5kLCBzaW1wbHkgcXVlcnkgbWVtYmxvY2tfe3N0YXJ0LGVuZH1fb2ZfRFJBTSgpLgoK
U2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFy
Y2gvaDgzMDAva2VybmVsL3NldHVwLmMgICAgfCA4ICsrKy0tLS0tCiBhcmNoL25kczMyL2tlcm5l
bC9zZXR1cC5jICAgIHwgOCArKy0tLS0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyB8
IDkgKystLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9oODMwMC9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvaDgz
MDAva2VybmVsL3NldHVwLmMKaW5kZXggMjhhYzg4MzU4YTg5Li4wMjgxZjkyZWVhM2QgMTAwNjQ0
Ci0tLSBhL2FyY2gvaDgzMDAva2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC9oODMwMC9rZXJuZWwv
c2V0dXAuYwpAQCAtNzQsMTcgKzc0LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBib290bWVtX2lu
aXQodm9pZCkKIAltZW1vcnlfZW5kID0gbWVtb3J5X3N0YXJ0ID0gMDsKIAogCS8qIEZpbmQgbWFp
biBtZW1vcnkgd2hlcmUgaXMgdGhlIGtlcm5lbCAqLwotCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9y
eSwgcmVnaW9uKSB7Ci0JCW1lbW9yeV9zdGFydCA9IHJlZ2lvbi0+YmFzZTsKLQkJbWVtb3J5X2Vu
ZCA9IHJlZ2lvbi0+YmFzZSArIHJlZ2lvbi0+c2l6ZTsKLQl9CisJbWVtb3J5X3N0YXJ0ID0gbWVt
YmxvY2tfc3RhcnRfb2ZfRFJBTSgpOworCW1lbW9yeV9lbmQgPSBtZW1ibG9ja19lbmRfb2ZfRFJB
TSgpOwogCiAJaWYgKCFtZW1vcnlfZW5kKQogCQlwYW5pYygiTm8gbWVtb3J5ISIpOwogCiAJLyog
c2V0dXAgYm9vdG1lbSBnbG9iYWxzICh3ZSB1c2Ugbm9fYm9vdG1lbSwgYnV0IG1tIHN0aWxsIGRl
cGVuZHMgb24gdGhpcykgKi8KIAltaW5fbG93X3BmbiA9IFBGTl9VUChtZW1vcnlfc3RhcnQpOwot
CW1heF9sb3dfcGZuID0gUEZOX0RPV04obWVtYmxvY2tfZW5kX29mX0RSQU0oKSk7CisJbWF4X2xv
d19wZm4gPSBQRk5fRE9XTihtZW1vcnlfZW5kKTsKIAltYXhfcGZuID0gbWF4X2xvd19wZm47CiAK
IAltZW1ibG9ja19yZXNlcnZlKF9fcGEoX3N0ZXh0KSwgX2VuZCAtIF9zdGV4dCk7CmRpZmYgLS1n
aXQgYS9hcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9uZHMzMi9rZXJuZWwvc2V0dXAu
YwppbmRleCBhMDY2ZWZiZTUzYzAuLmMzNTZlNDg0ZGNhYiAxMDA2NDQKLS0tIGEvYXJjaC9uZHMz
Mi9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jCkBAIC0yNDks
MTIgKzI0OSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIAltZW1v
cnlfZW5kID0gbWVtb3J5X3N0YXJ0ID0gMDsKIAogCS8qIEZpbmQgbWFpbiBtZW1vcnkgd2hlcmUg
aXMgdGhlIGtlcm5lbCAqLwotCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnaW9uKSB7Ci0J
CW1lbW9yeV9zdGFydCA9IHJlZ2lvbi0+YmFzZTsKLQkJbWVtb3J5X2VuZCA9IHJlZ2lvbi0+YmFz
ZSArIHJlZ2lvbi0+c2l6ZTsKLQkJcHJfaW5mbygiJXM6IE1lbW9yeTogMHgleC0weCV4XG4iLCBf
X2Z1bmNfXywKLQkJCW1lbW9yeV9zdGFydCwgbWVtb3J5X2VuZCk7Ci0JfQorCW1lbW9yeV9zdGFy
dCA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKTsKKwltZW1vcnlfZW5kID0gbWVtYmxvY2tfZW5k
X29mX0RSQU0oKTsKIAogCWlmICghbWVtb3J5X2VuZCkgewogCQlwYW5pYygiTm8gbWVtb3J5ISIp
OwpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmMKaW5kZXggOGFhNDM4ZTFmNTFmLi5jNTcwNjE1M2QzYjYgMTAwNjQ0
Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC9vcGVucmlzYy9r
ZXJuZWwvc2V0dXAuYwpAQCAtNDgsMTcgKzQ4LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1
cF9tZW1vcnkodm9pZCkKIAl1bnNpZ25lZCBsb25nIHJhbV9zdGFydF9wZm47CiAJdW5zaWduZWQg
bG9uZyByYW1fZW5kX3BmbjsKIAlwaHlzX2FkZHJfdCBtZW1vcnlfc3RhcnQsIG1lbW9yeV9lbmQ7
Ci0Jc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnaW9uOwogCiAJbWVtb3J5X2VuZCA9IG1lbW9y
eV9zdGFydCA9IDA7CiAKIAkvKiBGaW5kIG1haW4gbWVtb3J5IHdoZXJlIGlzIHRoZSBrZXJuZWws
IHdlIGFzc3VtZSBpdHMgdGhlIG9ubHkgb25lICovCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5
LCByZWdpb24pIHsKLQkJbWVtb3J5X3N0YXJ0ID0gcmVnaW9uLT5iYXNlOwotCQltZW1vcnlfZW5k
ID0gcmVnaW9uLT5iYXNlICsgcmVnaW9uLT5zaXplOwotCQlwcmludGsoS0VSTl9JTkZPICIlczog
TWVtb3J5OiAweCV4LTB4JXhcbiIsIF9fZnVuY19fLAotCQkgICAgICAgbWVtb3J5X3N0YXJ0LCBt
ZW1vcnlfZW5kKTsKLQl9CisJbWVtb3J5X3N0YXJ0ID0gbWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgp
OworCW1lbW9yeV9lbmQgPSBtZW1ibG9ja19lbmRfb2ZfRFJBTSgpOwogCiAJaWYgKCFtZW1vcnlf
ZW5kKSB7CiAJCXBhbmljKCJObyBtZW1vcnkhIik7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
