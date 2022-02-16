Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E57754B8907
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:17:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B76F72482D;
	Wed, 16 Feb 2022 14:17:37 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id F0B2324806
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:17:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE186165A;
 Wed, 16 Feb 2022 13:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29850C36AEA;
 Wed, 16 Feb 2022 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017454;
 bh=vo9dsIEQPQMwDE1F9151Sj8jUgLpMoSWAhLaZqQrPZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBOJyeVG43t32e6bfIFQr2JNVmm/3CNnrSPgqp1aywEBs/TnQkH6UoCiuwvYMO5MT
 lwj96h6bIunw0aUrOBHuzAKda33BuKaGijgF6GnixzSz0Sdjj9nkHeXMHqnuG3V0jx
 44u9TnpCcEvGf+Vd6ksaKYU1m1gu9FHVMuqt7U7Z/oHjVq7rSyW4eH2Jx7Z461guOE
 mcS1xOazBw3oe3viFMv1lFKhgYJQk0K4Po3WN6QX2wQnkyybT7djomYdy6S5JuLuay
 gvNVGTV6/HrfYqwdbeOKnPWvh89RBj9KN27iwj3K2hOs52sURTV04KxU5EHc02P7Ol
 oUX9kkXIU5HPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:25 +0100
Message-Id: <20220216131332.1489939-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 11/18] arm64: simplify access_ok()
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
 linux-parisc@vger.kernel.org, nickhu@andestech.com,
 Robin Murphy <robin.murphy@arm.com>, linux-mips@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmFybTY0IGhhcyBhbiBpbmxpbmUg
YXNtIGltcGxlbWVudGF0aW9uIG9mIGFjY2Vzc19vaygpIHRoYXQgaXMgZGVyaXZlZCBmcm9tCnRo
ZSAzMi1iaXQgYXJtIHZlcnNpb24gYW5kIG9wdGltaXplZCBmb3IgdGhlIGNhc2UgdGhhdCBib3Ro
IHRoZSBsaW1pdCBhbmQKdGhlIHNpemUgYXJlIHZhcmlhYmxlLiBXaXRoIHNldF9mcygpIGdvbmUs
IHRoZSBsaW1pdCBpcyBhbHdheXMgY29uc3RhbnQsCmFuZCB0aGUgc2l6ZSB1c3VhbGx5IGlzIGFz
IHdlbGwsIHNvIGp1c3QgdXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24KcmVkdWNlcyB0
aGUgY2hlY2sgaW50byBhIGNvbXBhcmlzb24gYWdhaW5zdCBhIGNvbnN0YW50IHRoYXQgY2FuIGJl
CnNjaGVkdWxlZCBieSB0aGUgY29tcGlsZXIuCgpPbiBhIGRlZmNvbmZpZyBidWlsZCwgdGhpcyBz
YXZlcyBvdmVyIDI4S0Igb2YgLnRleHQuCgpBY2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5t
dXJwaHlAYXJtLmNvbT4KQWNrZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5j
b20+ClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAzNCArKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXggMmUyMDg3OWZlM2NmLi4xOTljNTUz
Yjc0MGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCisrKyBi
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCkBAIC0yNiw2ICsyNiwxNCBAQAogI2lu
Y2x1ZGUgPGFzbS9tZW1vcnkuaD4KICNpbmNsdWRlIDxhc20vZXh0YWJsZS5oPgogCitzdGF0aWMg
aW5saW5lIGludCBfX2FjY2Vzc19vayhjb25zdCB2b2lkIF9fdXNlciAqcHRyLCB1bnNpZ25lZCBs
b25nIHNpemUpCit7CisJdW5zaWduZWQgbG9uZyBsaW1pdCA9IFRBU0tfU0laRV9NQVg7CisJdW5z
aWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcHRyOworCisJcmV0dXJuIChzaXplIDw9
IGxpbWl0KSAmJiAoYWRkciA8PSAobGltaXQgLSBzaXplKSk7Cit9CisKIC8qCiAgKiBUZXN0IHdo
ZXRoZXIgYSBibG9jayBvZiBtZW1vcnkgaXMgYSB2YWxpZCB1c2VyIHNwYWNlIGFkZHJlc3MuCiAg
KiBSZXR1cm5zIDEgaWYgdGhlIHJhbmdlIGlzIHZhbGlkLCAwIG90aGVyd2lzZS4KQEAgLTMzLDEw
ICs0MSw4IEBACiAgKiBUaGlzIGlzIGVxdWl2YWxlbnQgdG8gdGhlIGZvbGxvd2luZyB0ZXN0Ogog
ICogKHU2NSlhZGRyICsgKHU2NSlzaXplIDw9ICh1NjUpVEFTS19TSVpFX01BWAogICovCi1zdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19yYW5nZV9vayhjb25zdCB2b2lkIF9fdXNlciAqYWRk
ciwgdW5zaWduZWQgbG9uZyBzaXplKQorc3RhdGljIGlubGluZSBpbnQgYWNjZXNzX29rKGNvbnN0
IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiB7Ci0JdW5zaWduZWQgbG9u
ZyByZXQsIGxpbWl0ID0gVEFTS19TSVpFX01BWCAtIDE7Ci0KIAkvKgogCSAqIEFzeW5jaHJvbm91
cyBJL08gcnVubmluZyBpbiBhIGtlcm5lbCB0aHJlYWQgZG9lcyBub3QgaGF2ZSB0aGUKIAkgKiBU
SUZfVEFHR0VEX0FERFIgZmxhZyBvZiB0aGUgcHJvY2VzcyBvd25pbmcgdGhlIG1tLCBzbyBhbHdh
eXMgdW50YWcKQEAgLTQ2LDI5ICs1Miw5IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBf
X3JhbmdlX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNpCiAJICAg
IChjdXJyZW50LT5mbGFncyAmIFBGX0tUSFJFQUQgfHwgdGVzdF90aHJlYWRfZmxhZyhUSUZfVEFH
R0VEX0FERFIpKSkKIAkJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7CiAKLQlfX2Noa191c2Vy
X3B0cihhZGRyKTsKLQlhc20gdm9sYXRpbGUoCi0JLy8gQSArIEIgPD0gQyArIDEgZm9yIGFsbCBB
LEIsQywgaW4gZm91ciBlYXN5IHN0ZXBzOgotCS8vIDE6IFggPSBBICsgQjsgWCcgPSBYICUgMl42
NAotCSIJYWRkcwklMCwgJTMsICUyXG4iCi0JLy8gMjogU2V0IEMgPSAwIGlmIFggPiAyXjY0LCB0
byBndWFyYW50ZWUgWCcgPiBDIGluIHN0ZXAgNAotCSIJY3NlbAklMSwgeHpyLCAlMSwgaGlcbiIK
LQkvLyAzOiBTZXQgWCcgPSB+MCBpZiBYID49IDJeNjQuIEZvciBYID09IDJeNjQsIHRoaXMgZGVj
cmVtZW50cyBYJwotCS8vICAgIHRvIGNvbXBlbnNhdGUgZm9yIHRoZSBjYXJyeSBmbGFnIGJlaW5n
IHNldCBpbiBzdGVwIDQuIEZvcgotCS8vICAgIFggPiAyXjY0LCBYJyBtZXJlbHkgaGFzIHRvIHJl
bWFpbiBub256ZXJvLCB3aGljaCBpdCBkb2VzLgotCSIJY3NpbnYJJTAsICUwLCB4enIsIGNjXG4i
Ci0JLy8gNDogRm9yIFggPCAyXjY0LCB0aGlzIGdpdmVzIHVzIFgnIC0gQyAtIDEgPD0gMCwgd2hl
cmUgdGhlIC0xCi0JLy8gICAgY29tZXMgZnJvbSB0aGUgY2FycnkgaW4gYmVpbmcgY2xlYXIuIE90
aGVyd2lzZSwgd2UgYXJlCi0JLy8gICAgdGVzdGluZyBYJyAtIEMgPT0gMCwgc3ViamVjdCB0byB0
aGUgcHJldmlvdXMgYWRqdXN0bWVudHMuCi0JIglzYmNzCXh6ciwgJTAsICUxXG4iCi0JIgljc2V0
CSUwLCBsc1xuIgotCTogIj0mciIgKHJldCksICIrciIgKGxpbWl0KSA6ICJJciIgKHNpemUpLCAi
MCIgKGFkZHIpIDogImNjIik7Ci0KLQlyZXR1cm4gcmV0OworCXJldHVybiBsaWtlbHkoX19hY2Nl
c3Nfb2soYWRkciwgc2l6ZSkpOwogfQogCi0jZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQlf
X3JhbmdlX29rKGFkZHIsIHNpemUpCi0KIC8qCiAgKiBVc2VyIGFjY2VzcyBlbmFibGluZy9kaXNh
YmxpbmcuCiAgKi8KLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
