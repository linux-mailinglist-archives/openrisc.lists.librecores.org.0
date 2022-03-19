Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABB54DE599
	for <lists+openrisc@lfdr.de>; Sat, 19 Mar 2022 04:55:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 508B12480A;
	Sat, 19 Mar 2022 04:55:23 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id C24A3247E2
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 04:55:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37212B82153;
 Sat, 19 Mar 2022 03:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B6C340F2;
 Sat, 19 Mar 2022 03:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647662119;
 bh=JDXWg1zwYrTJg3qBN3Fpv5jBQ9oDxemcN/lCbJ/1qRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S2bzTd/C+ZXf8yaJXh9wIel+GNoB5VzxQHQ+lsT0C/jpzUh44QempyUKV27fC6yXi
 VCjc5MTcBX33EGZ43vNLa9n5tfw/m7jfW46JLF66+Jt5raFxr5DmeXuUNFErSvGV0v
 Te47lwtw6Dt9AkvFZYWmn07CzWaLxlE1lc7/O3YSfe51yID6iig2+CO7S2wR7lLaUs
 1a0SzAEwFd4Cl/sF9zczXXp3j3302vaJsUAwIA5X02E43rfEb5Bd4A93USQs5StFo4
 +KxpxBiWG4NV+6UEbOg0dZrEomY4sZER7KkzZ4XN5Snkc/L4T+jguAQkE8l3qsARBb
 NNOBN9XBNA2Lw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, boqun.feng@gmail.com,
 longman@redhat.com, peterz@infradead.org
Date: Sat, 19 Mar 2022 11:54:54 +0800
Message-Id: <20220319035457.2214979-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220319035457.2214979-1-guoren@kernel.org>
References: <20220319035457.2214979-1-guoren@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH V2 2/5] asm-generic: qspinlock: Indicate the use
 of mixed-size atomics
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKVGhlIHFzcGlubG9j
ayBpbXBsZW1lbnRhdGlvbiBkZXBlbmRzIG9uIGhhdmluZyB3ZWxsIGJlaGF2ZWQgbWl4ZWQtc2l6
ZQphdG9taWNzLiAgVGhpcyBpcyB0cnVlIG9uIHRoZSBtb3JlIHdpZGVseS11c2VkIHBsYXRmb3Jt
cywgYnV0IHRoZXNlCnJlcXVpcmVtZW50cyBhcmUgc29tZXdoYXQgc3VidGxlIGFuZCBtYXkgbm90
IGJlIHNhdGlzZmllZCBieSBhbGwgdGhlCnBsYXRmb3JtcyB0aGF0IHFzcGlubG9jayBpcyB1c2Vk
IG9uLgoKRG9jdW1lbnQgdGhlc2UgcmVxdWlyZW1lbnRzLCBzbyBwb3J0cyB0aGF0IHVzZSBxc3Bp
bmxvY2sgY2FuIG1vcmUgZWFzaWx5CmRldGVybWluZSBpZiB0aGV5IG1lZXQgdGhlc2UgcmVxdWly
ZW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5j
b20+ClNpZ25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRl
YWQub3JnPgpBY2tlZC1ieTogV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4KLS0tCiBp
bmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oIHwgMzAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvYXNtLWdlbmVyaWMvcXNwaW5sb2NrLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Fz
cGlubG9jay5oCmluZGV4IGQ3NGIxMzgyNTUwMS4uYTdhMTI5NmIwYjRkIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oCisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMv
cXNwaW5sb2NrLmgKQEAgLTIsNiArMiwzNiBAQAogLyoKICAqIFF1ZXVlZCBzcGlubG9jawogICoK
KyAqIEEgJ2dlbmVyaWMnIHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIHRoYXQgaXMgYmFzZWQgb24g
TUNTIGxvY2tzLiBBbgorICogYXJjaGl0ZWN0dXJlIHRoYXQncyBsb29raW5nIGZvciBhICdnZW5l
cmljJyBzcGlubG9jaywgcGxlYXNlIGZpcnN0IGNvbnNpZGVyCisgKiB0aWNrZXQtbG9jay5oIGFu
ZCBvbmx5IGNvbWUgbG9va2luZyBoZXJlIHdoZW4geW91J3ZlIGNvbnNpZGVyZWQgYWxsIHRoZQor
ICogY29uc3RyYWludHMgYmVsb3cgYW5kIGNhbiBzaG93IHlvdXIgaGFyZHdhcmUgZG9lcyBhY3R1
YWxseSBwZXJmb3JtIGJldHRlcgorICogd2l0aCBxc3BpbmxvY2suCisgKgorICoKKyAqIEl0IHJl
bGllcyBvbiBhdG9taWNfKl9yZWxlYXNlKCkvYXRvbWljXypfYWNxdWlyZSgpIHRvIGJlIFJDc2Mg
KG9yIG5vIHdlYWtlcgorICogdGhhbiBSQ3RzbyBpZiB5b3UncmUgcG93ZXIpLCB3aGVyZSByZWd1
bGFyIGNvZGUgb25seSBleHBlY3RzIGF0b21pY190IHRvIGJlCisgKiBSQ3BjLgorICoKKyAqIEl0
IHJlbGllcyBvbiBhIGZhciBncmVhdGVyIChjb21wYXJlZCB0byB0aWNrZXQtbG9jay5oKSBzZXQg
b2YgYXRvbWljCisgKiBvcGVyYXRpb25zIHRvIGJlaGF2ZSB3ZWxsIHRvZ2V0aGVyLCBwbGVhc2Ug
YXVkaXQgdGhlbSBjYXJlZnVsbHkgdG8gZW5zdXJlCisgKiB0aGV5IGFsbCBoYXZlIGZvcndhcmQg
cHJvZ3Jlc3MuIE1hbnkgYXRvbWljIG9wZXJhdGlvbnMgbWF5IGRlZmF1bHQgdG8KKyAqIGNtcHhj
aGcoKSBsb29wcyB3aGljaCB3aWxsIG5vdCBoYXZlIGdvb2QgZm9yd2FyZCBwcm9ncmVzcyBwcm9w
ZXJ0aWVzIG9uCisgKiBMTC9TQyBhcmNoaXRlY3R1cmVzLgorICoKKyAqIE9uZSBub3RhYmxlIGV4
YW1wbGUgaXMgYXRvbWljX2ZldGNoX29yX2FjcXVpcmUoKSwgd2hpY2ggeDg2IGNhbm5vdCAoY2hl
YXBseSkKKyAqIGRvLiBDYXJlZnVsbHkgcmVhZCB0aGUgcGF0Y2hlcyB0aGF0IGludHJvZHVjZWQg
cXVldWVkX2ZldGNoX3NldF9wZW5kaW5nX2FjcXVpcmUoKS4KKyAqCisgKiBJdCBhbHNvIGhlYXZp
bHkgcmVsaWVzIG9uIG1peGVkIHNpemUgYXRvbWljIG9wZXJhdGlvbnMsIGluIHNwZWNpZmljIGl0
CisgKiByZXF1aXJlcyBhcmNoaXRlY3R1cmVzIHRvIGhhdmUgeGNoZzE2OyBzb21ldGhpbmcgd2hp
Y2ggbWFueSBMTC9TQworICogYXJjaGl0ZWN0dXJlcyBuZWVkIHRvIGltcGxlbWVudCBhcyBhIDMy
Yml0IGFuZCtvciBpbiBvcmRlciB0byBzYXRpc2Z5IHRoZQorICogZm9yd2FyZCBwcm9ncmVzcyBn
dWFyYW50ZWVzIG1lbnRpb25lZCBhYm92ZS4KKyAqCisgKiBGdXJ0aGVyIHJlYWRpbmcgb24gbWl4
ZWQgc2l6ZSBhdG9taWNzIHRoYXQgbWlnaHQgYmUgcmVsZXZhbnQ6CisgKgorICogICBodHRwOi8v
d3d3LmNsLmNhbS5hYy51ay9+cGVzMjAvcG9wbDE3L21peGVkLXNpemUucGRmCisgKgorICoKICAq
IChDKSBDb3B5cmlnaHQgMjAxMy0yMDE1IEhld2xldHQtUGFja2FyZCBEZXZlbG9wbWVudCBDb21w
YW55LCBMLlAuCiAgKiAoQykgQ29weXJpZ2h0IDIwMTUgSGV3bGV0dC1QYWNrYXJkIEVudGVycHJp
c2UgRGV2ZWxvcG1lbnQgTFAKICAqCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
