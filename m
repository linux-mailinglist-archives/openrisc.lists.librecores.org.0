Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0165B4B891A
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:18:08 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B868324834;
	Wed, 16 Feb 2022 14:18:07 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 8E4BB24806
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:18:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63F17616AE;
 Wed, 16 Feb 2022 13:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12440C340F0;
 Wed, 16 Feb 2022 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017484;
 bh=VX4KkQyuIR3tQGDR6prM8ou6pbxkhf/vAdqGON90Cm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CHCgfRQJGdosNV1evKFnaA5ei4xJAQnutJJPhJDJedQb8ubdZ/7Y4gbjZfBoHlpfu
 02zUcTsVmwftwP3VFFw8cf1xplYfxud05Hq90fcOl+6pChvWJp2VuJGg6f1dhDmeKP
 2Ku7d6y9bCG/B7QQIkLEQll/VqhOb3oxvRxpjL7bHiIP7fh7rr3NkfNXH+hMaXbIfa
 qHFBF3xOTCoSqLhRyub3LajzF4xQe4lV+XRk2zeVmUEYrZWjONVkWPfTimkvr5qUGC
 VogArIAmhrmBKTIWZOEA4fZwuT8tCTP8ztaTT853tTOy2yqxBDNJ8/RxehDqdkvFhY
 Yb158iS57sWQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:28 +0100
Message-Id: <20220216131332.1489939-15-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 14/18] lib/test_lockup: fix kernel pointer
 check for separate address spaces
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
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCnRlc3Rfa2VybmVsX3B0cigpIHVz
ZXMgYWNjZXNzX29rKCkgdG8gZmlndXJlIG91dCBpZiBhIGdpdmVuIGFkZHJlc3MKcG9pbnRzIHRv
IHVzZXIgc3BhY2UgaW5zdGVhZCBvZiBrZXJuZWwgc3BhY2UuIEhvd2V2ZXIgb24gYXJjaGl0ZWN0
dXJlcwp0aGF0IHNldCBDT05GSUdfQUxURVJOQVRFX1VTRVJfQUREUkVTU19TUEFDRSwgYSBwb2lu
dGVyIGNhbiBiZSB2YWxpZApmb3IgYm90aCwgYW5kIHRoZSBjaGVjayBhbHdheXMgZmFpbHMgYmVj
YXVzZSBhY2Nlc3Nfb2soKSByZXR1cm5zIHRydWUuCgpNYWtlIHRoZSBjaGVjayBmb3IgdXNlciBz
cGFjZSBwb2ludGVycyBjb25kaXRpb25hbCBvbiB0aGUgdHlwZSBvZgphZGRyZXNzIHNwYWNlIGxh
eW91dC4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQog
bGliL3Rlc3RfbG9ja3VwLmMgfCAxMSArKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvdGVzdF9sb2NrdXAu
YyBiL2xpYi90ZXN0X2xvY2t1cC5jCmluZGV4IDZhMGYzMjlhNzk0YS4uYzNmZDg3ZDZjMmRkIDEw
MDY0NAotLS0gYS9saWIvdGVzdF9sb2NrdXAuYworKysgYi9saWIvdGVzdF9sb2NrdXAuYwpAQCAt
NDE3LDkgKzQxNywxNCBAQCBzdGF0aWMgYm9vbCB0ZXN0X2tlcm5lbF9wdHIodW5zaWduZWQgbG9u
ZyBhZGRyLCBpbnQgc2l6ZSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJLyogc2hvdWxkIGJlIGF0IGxl
YXN0IHJlYWRhYmxlIGtlcm5lbCBhZGRyZXNzICovCi0JaWYgKGFjY2Vzc19vaygodm9pZCBfX3Vz
ZXIgKilwdHIsIDEpIHx8Ci0JICAgIGFjY2Vzc19vaygodm9pZCBfX3VzZXIgKilwdHIgKyBzaXpl
IC0gMSwgMSkgfHwKLQkgICAgZ2V0X2tlcm5lbF9ub2ZhdWx0KGJ1ZiwgcHRyKSB8fAorCWlmICgh
SVNfRU5BQkxFRChDT05GSUdfQUxURVJOQVRFX1VTRVJfQUREUkVTU19TUEFDRSkgJiYKKwkgICAg
KGFjY2Vzc19vaygodm9pZCBfX3VzZXIgKilwdHIsIDEpIHx8CisJICAgICBhY2Nlc3Nfb2soKHZv
aWQgX191c2VyICopcHRyICsgc2l6ZSAtIDEsIDEpKSkgeworCQlwcl9lcnIoInVzZXIgc3BhY2Ug
cHRyIGludmFsaWQgaW4ga2VybmVsOiAlI2x4XG4iLCBhZGRyKTsKKwkJcmV0dXJuIHRydWU7CisJ
fQorCisJaWYgKGdldF9rZXJuZWxfbm9mYXVsdChidWYsIHB0cikgfHwKIAkgICAgZ2V0X2tlcm5l
bF9ub2ZhdWx0KGJ1ZiwgcHRyICsgc2l6ZSAtIDEpKSB7CiAJCXByX2VycigiaW52YWxpZCBrZXJu
ZWwgcHRyOiAlI2x4XG4iLCBhZGRyKTsKIAkJcmV0dXJuIHRydWU7Ci0tIAoyLjI5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
