Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 987FD4C6767
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:49:03 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 80E4124833;
	Mon, 28 Feb 2022 11:49:03 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 039B92431F
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:49:02 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC2A1063;
 Mon, 28 Feb 2022 02:49:01 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C396D3F73D;
 Mon, 28 Feb 2022 02:48:52 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:25 +0530
Message-Id: <1646045273-9343-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 02/30] mm/mmap: Clarify protection_map[]
 indices
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

cHJvdGVjdGlvbl9tYXBbXSBtYXBzIHZtX2ZsYWdzIGFjY2VzcyBjb21iaW5hdGlvbnMgaW50byBw
YWdlIHByb3RlY3Rpb24KdmFsdWUgYXMgZGVmaW5lZCBieSB0aGUgcGxhdGZvcm0gdmlhIF9fUFhY
WCBhbmQgX19TWFhYIG1hY3Jvcy4gVGhlIGFycmF5CmluZGljZXMgaW4gcHJvdGVjdGlvbl9tYXBb
XSwgcmVwcmVzZW50cyB2bV9mbGFncyBhY2Nlc3MgY29tYmluYXRpb25zIGJ1dAppdCdzIG5vdCB2
ZXJ5IGludHVpdGl2ZSB0byBkZXJpdmUuIFRoaXMgbWFrZXMgaXQgY2xlYXIgYW5kIGV4cGxpY2l0
LgoKQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBsaW51
eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQt
Ynk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpTaWduZWQtb2ZmLWJ5OiBBbnNodW1h
biBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KLS0tCiBtbS9tbWFwLmMgfCAx
OCArKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCBk
NDQ1YzFiOWQ2MDYuLjM0MDAwYTdkN2VmYSAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21t
L21tYXAuYwpAQCAtMTAyLDggKzEwMiwyMiBAQCBzdGF0aWMgdm9pZCB1bm1hcF9yZWdpb24oc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sCiAgKgkJCQkJCQkJeDogKHllcykgeWVzCiAgKi8KIHBncHJvdF90
IHByb3RlY3Rpb25fbWFwWzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7Ci0JX19QMDAwLCBfX1AwMDEs
IF9fUDAxMCwgX19QMDExLCBfX1AxMDAsIF9fUDEwMSwgX19QMTEwLCBfX1AxMTEsCi0JX19TMDAw
LCBfX1MwMDEsIF9fUzAxMCwgX19TMDExLCBfX1MxMDAsIF9fUzEwMSwgX19TMTEwLCBfX1MxMTEK
KwlbVk1fTk9ORV0JCQkJCT0gX19QMDAwLAorCVtWTV9SRUFEXQkJCQkJPSBfX1AwMDEsCisJW1ZN
X1dSSVRFXQkJCQkJPSBfX1AwMTAsCisJW1ZNX1dSSVRFIHwgVk1fUkVBRF0JCQkJPSBfX1AwMTEs
CisJW1ZNX0VYRUNdCQkJCQk9IF9fUDEwMCwKKwlbVk1fRVhFQyB8IFZNX1JFQURdCQkJCT0gX19Q
MTAxLAorCVtWTV9FWEVDIHwgVk1fV1JJVEVdCQkJCT0gX19QMTEwLAorCVtWTV9FWEVDIHwgVk1f
V1JJVEUgfCBWTV9SRUFEXQkJCT0gX19QMTExLAorCVtWTV9TSEFSRURdCQkJCQk9IF9fUzAwMCwK
KwlbVk1fU0hBUkVEIHwgVk1fUkVBRF0JCQkJPSBfX1MwMDEsCisJW1ZNX1NIQVJFRCB8IFZNX1dS
SVRFXQkJCQk9IF9fUzAxMCwKKwlbVk1fU0hBUkVEIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQkJPSBf
X1MwMTEsCisJW1ZNX1NIQVJFRCB8IFZNX0VYRUNdCQkJCT0gX19TMTAwLAorCVtWTV9TSEFSRUQg
fCBWTV9FWEVDIHwgVk1fUkVBRF0JCQk9IF9fUzEwMSwKKwlbVk1fU0hBUkVEIHwgVk1fRVhFQyB8
IFZNX1dSSVRFXQkJPSBfX1MxMTAsCisJW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURSB8
IFZNX1JFQURdCT0gX19TMTExCiB9OwogCiAjaWZuZGVmIENPTkZJR19BUkNIX0hBU19GSUxURVJf
UEdQUk9UCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
