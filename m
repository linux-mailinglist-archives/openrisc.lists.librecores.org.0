Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDF24B5696
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 17:37:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0561524811;
	Mon, 14 Feb 2022 17:37:18 +0100 (CET)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mail.librecores.org (Postfix) with ESMTPS id DCB46211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 17:37:16 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 054B6CE198C;
 Mon, 14 Feb 2022 16:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC10C340F2;
 Mon, 14 Feb 2022 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856633;
 bh=xPmHkcOVS/yITVJeEntOUBw+xw68iqOnYa2twIOtXYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mrqn5vxFjvUagN2pKvxkJBJGliaoy6MP0jFoyX87gnr3XzjUW97zOF2byukzKb7wT
 E7NJtDKT5zv31VRqv+qj0too8+wx5sD0RyH+MTT+msOF1jPOFyDDNvVoSgFUoy9QLD
 t5Lsiozlst1R3n+nWulzcvj+OboDpu885ft5vvuvmiKpyr9q37jLxwtuRMARpqWsIO
 GBpyEJ9KSTjS3eJz1YtPZ5AEx/LAzduOaPtX9npuQqJUzyrgXxlnqYD2lkogyB5K3z
 8L8gKn2P4XZBENc6TnX7Y3RkjeTuj5E4MW+PVjIdx+wEaJHxpbaxGjuVjNKLr8MOwo
 NPAYqCu6fVtxg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Feb 2022 17:34:46 +0100
Message-Id: <20220214163452.1568807-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 08/14] arm64: simplify access_ok()
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
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
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
YXZlcyBvdmVyIDI4S0Igb2YgLnRleHQuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxh
cm5kQGFybmRiLmRlPgotLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjgg
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS91YWNjZXNzLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCAzNTdm
N2JkOWM5ODEuLmU4ZGNlMGNjNWVhYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS91YWNjZXNzLmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTI2
LDYgKzI2LDggQEAKICNpbmNsdWRlIDxhc20vbWVtb3J5Lmg+CiAjaW5jbHVkZSA8YXNtL2V4dGFi
bGUuaD4KIAorc3RhdGljIGlubGluZSBpbnQgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIg
KnB0ciwgdW5zaWduZWQgbG9uZyBzaXplKTsKKwogLyoKICAqIFRlc3Qgd2hldGhlciBhIGJsb2Nr
IG9mIG1lbW9yeSBpcyBhIHZhbGlkIHVzZXIgc3BhY2UgYWRkcmVzcy4KICAqIFJldHVybnMgMSBp
ZiB0aGUgcmFuZ2UgaXMgdmFsaWQsIDAgb3RoZXJ3aXNlLgpAQCAtMzMsMTAgKzM1LDggQEAKICAq
IFRoaXMgaXMgZXF1aXZhbGVudCB0byB0aGUgZm9sbG93aW5nIHRlc3Q6CiAgKiAodTY1KWFkZHIg
KyAodTY1KXNpemUgPD0gKHU2NSlUQVNLX1NJWkVfTUFYCiAgKi8KLXN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBfX2FjY2Vzc19vayhjb25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQg
bG9uZyBzaXplKQorc3RhdGljIGlubGluZSBpbnQgYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2Vy
ICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiB7Ci0JdW5zaWduZWQgbG9uZyByZXQsIGxpbWl0
ID0gVEFTS19TSVpFX01BWCAtIDE7Ci0KIAkvKgogCSAqIEFzeW5jaHJvbm91cyBJL08gcnVubmlu
ZyBpbiBhIGtlcm5lbCB0aHJlYWQgZG9lcyBub3QgaGF2ZSB0aGUKIAkgKiBUSUZfVEFHR0VEX0FE
RFIgZmxhZyBvZiB0aGUgcHJvY2VzcyBvd25pbmcgdGhlIG1tLCBzbyBhbHdheXMgdW50YWcKQEAg
LTQ2LDI3ICs0Niw5IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX2FjY2Vzc19vayhj
b25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzCiAJICAgIChjdXJyZW50LT5m
bGFncyAmIFBGX0tUSFJFQUQgfHwgdGVzdF90aHJlYWRfZmxhZyhUSUZfVEFHR0VEX0FERFIpKSkK
IAkJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7CiAKLQlfX2Noa191c2VyX3B0cihhZGRyKTsK
LQlhc20gdm9sYXRpbGUoCi0JLy8gQSArIEIgPD0gQyArIDEgZm9yIGFsbCBBLEIsQywgaW4gZm91
ciBlYXN5IHN0ZXBzOgotCS8vIDE6IFggPSBBICsgQjsgWCcgPSBYICUgMl42NAotCSIJYWRkcwkl
MCwgJTMsICUyXG4iCi0JLy8gMjogU2V0IEMgPSAwIGlmIFggPiAyXjY0LCB0byBndWFyYW50ZWUg
WCcgPiBDIGluIHN0ZXAgNAotCSIJY3NlbAklMSwgeHpyLCAlMSwgaGlcbiIKLQkvLyAzOiBTZXQg
WCcgPSB+MCBpZiBYID49IDJeNjQuIEZvciBYID09IDJeNjQsIHRoaXMgZGVjcmVtZW50cyBYJwot
CS8vICAgIHRvIGNvbXBlbnNhdGUgZm9yIHRoZSBjYXJyeSBmbGFnIGJlaW5nIHNldCBpbiBzdGVw
IDQuIEZvcgotCS8vICAgIFggPiAyXjY0LCBYJyBtZXJlbHkgaGFzIHRvIHJlbWFpbiBub256ZXJv
LCB3aGljaCBpdCBkb2VzLgotCSIJY3NpbnYJJTAsICUwLCB4enIsIGNjXG4iCi0JLy8gNDogRm9y
IFggPCAyXjY0LCB0aGlzIGdpdmVzIHVzIFgnIC0gQyAtIDEgPD0gMCwgd2hlcmUgdGhlIC0xCi0J
Ly8gICAgY29tZXMgZnJvbSB0aGUgY2FycnkgaW4gYmVpbmcgY2xlYXIuIE90aGVyd2lzZSwgd2Ug
YXJlCi0JLy8gICAgdGVzdGluZyBYJyAtIEMgPT0gMCwgc3ViamVjdCB0byB0aGUgcHJldmlvdXMg
YWRqdXN0bWVudHMuCi0JIglzYmNzCXh6ciwgJTAsICUxXG4iCi0JIgljc2V0CSUwLCBsc1xuIgot
CTogIj0mciIgKHJldCksICIrciIgKGxpbWl0KSA6ICJJciIgKHNpemUpLCAiMCIgKGFkZHIpIDog
ImNjIik7Ci0KLQlyZXR1cm4gcmV0OworCXJldHVybiBsaWtlbHkoX19hY2Nlc3Nfb2soYWRkciwg
c2l6ZSkpOwogfQotI2RlZmluZSBfX2FjY2Vzc19vayBfX2FjY2Vzc19vaworI2RlZmluZSBhY2Nl
c3Nfb2sgYWNjZXNzX29rCiAKICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9hY2Nlc3Nfb2suaD4KIAot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
