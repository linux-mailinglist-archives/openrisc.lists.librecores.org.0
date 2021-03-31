Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3C435148E
	for <lists+openrisc@lfdr.de>; Thu,  1 Apr 2021 13:44:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E6CC92074A;
	Thu,  1 Apr 2021 13:44:28 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 4A901212B7
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 16:32:20 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F176760FF1;
 Wed, 31 Mar 2021 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201139;
 bh=ET6mHFYyqB1SBq1ewQ1GZzs5w6YT4Vz0URxeLviz9rs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dy4lrqNV7m0Yy2r05bp8XCPUAC8z34FNeWbsZGbTVJ+lgmHiGOSKMdqGkne7CRoBG
 h0aP6WRVV3BKhLHvmSQDrzflE0xWl0GYT7L60PDBgOBiqmYcbTKt2Bu9uZKJRZaUsC
 JLg3lic8aznTBUZTOQL+OKg8JNXlyE4WjU8cBh3xHk++jJEXBQtzEiQLzHnfiNCq/B
 g0HKpMzU6FVFUg006DAIrSZXocPI/6dxOd8xDDjfBpSviR9gXQWC7FD1n/kNq2jEoY
 ZMcJKFPvCAztLJ9A87rOz+Mc+atT+903XzdCNzQmHX5+m1XwlVwCQPi/iackWOsnMS
 W85nWlUX/+dvg==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Wed, 31 Mar 2021 14:30:35 +0000
Message-Id: <1617201040-83905-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Thu, 01 Apr 2021 13:44:25 +0200
Subject: [OpenRISC] [PATCH v6 4/9] csky: locks: Optimize coding convention
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKIC0gVXNpbmcgc21wX2Nv
bmRfbG9hZF9hY3F1aXJlIGluIGFyY2hfc3Bpbl9sb2NrIGJ5IFBldGVyJ3MKICAgYWR2aWNlLgog
LSBVc2luZyBfX3NtcF9hY3F1aXJlX2ZlbmNlIGluIGFyY2hfc3Bpbl90cnlsb2NrCiAtIFVzaW5n
IHNtcF9zdG9yZV9yZWxlYXNlIGluIGFyY2hfc3Bpbl91bmxvY2sKCkFsbCBhYm92ZSBhcmUganVz
dCBjb2RpbmcgY29udmVudGlvbnMgYW5kIHdvbid0IGFmZmVjdCB0aGUKZnVuY3Rpb24uCgpUT0RP
IGluIHNtcF9jb25kX2xvYWRfYWNxdWlyZSBmb3IgYXJjaGl0ZWN0dXJlOgogLSBjdXJyZW50IGNz
a3kgb25seSBoYXM6CiAgIGxyLncgdmFsLCA8cDA+CiAgIHNjLncgPHAwPi4gdmFsMgogICAoQW55
IG90aGVyIHN0b3JlcyB0byBwMCB3aWxsIGxldCBzYy53IGZhaWxlZCkKCiAtIEJ1dCBzbXBfY29u
ZF9sb2FkX2FjcXVpcmUgbmVlZDoKICAgbHIudyB2YWwsIDxwMD4KICAgd2ZlCiAgIChBbnkgc3Rv
cmVzIHRvIHAwIHdpbGwgc2VuZCB0aGUgZXZlbnQgdG8gbGV0IHdmZSByZXRpcmVkKQoKU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQUFoU2R5MUpITFVGd3U3UnVDYVErUlVXUkJr
czJLc0R2YTdFcFJ0OC0tNFpmb2ZTVVFAbWFpbC5nbWFpbC5jb20vVC8jbTEzYWRhYzI4NWI3ZjUx
ZjRmODc5YTVkNmI2NTc1M2VjYjFhNzUyNGUKQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogYXJjaC9j
c2t5L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmggfCAxMSArKysrLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Nz
a3kvaW5jbHVkZS9hc20vc3BpbmxvY2suaCBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9zcGlubG9j
ay5oCmluZGV4IDY5ZjVhYTI0OWM1Zi4uNjk2NzcxNjc5NzdhIDEwMDY0NAotLS0gYS9hcmNoL2Nz
a3kvaW5jbHVkZS9hc20vc3BpbmxvY2suaAorKysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vc3Bp
bmxvY2suaApAQCAtMjYsMTAgKzI2LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfc3Bpbl9s
b2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKIAkJOiAiciIocCksICJyIih0aWNrZXRfbmV4dCkK
IAkJOiAiY2MiKTsKIAotCXdoaWxlIChsb2NrdmFsLnRpY2tldHMubmV4dCAhPSBsb2NrdmFsLnRp
Y2tldHMub3duZXIpCi0JCWxvY2t2YWwudGlja2V0cy5vd25lciA9IFJFQURfT05DRShsb2NrLT50
aWNrZXRzLm93bmVyKTsKLQotCXNtcF9tYigpOworCXNtcF9jb25kX2xvYWRfYWNxdWlyZSgmbG9j
ay0+dGlja2V0cy5vd25lciwKKwkJCQkJVkFMID09IGxvY2t2YWwudGlja2V0cy5uZXh0KTsKIH0K
IAogc3RhdGljIGlubGluZSBpbnQgYXJjaF9zcGluX3RyeWxvY2soYXJjaF9zcGlubG9ja190ICps
b2NrKQpAQCAtNTUsMTUgKzUzLDE0IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFyY2hfc3Bpbl90cnls
b2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKIAl9IHdoaWxlICghcmVzKTsKIAogCWlmICghY29u
dGVuZGVkKQotCQlzbXBfbWIoKTsKKwkJX19zbXBfYWNxdWlyZV9mZW5jZSgpOwogCiAJcmV0dXJu
ICFjb250ZW5kZWQ7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3NwaW5fdW5sb2NrKGFy
Y2hfc3BpbmxvY2tfdCAqbG9jaykKIHsKLQlzbXBfbWIoKTsKLQlXUklURV9PTkNFKGxvY2stPnRp
Y2tldHMub3duZXIsIGxvY2stPnRpY2tldHMub3duZXIgKyAxKTsKKwlzbXBfc3RvcmVfcmVsZWFz
ZSgmbG9jay0+dGlja2V0cy5vd25lciwgbG9jay0+dGlja2V0cy5vd25lciArIDEpOwogfQogCiBz
dGF0aWMgaW5saW5lIGludCBhcmNoX3NwaW5fdmFsdWVfdW5sb2NrZWQoYXJjaF9zcGlubG9ja190
IGxvY2spCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
