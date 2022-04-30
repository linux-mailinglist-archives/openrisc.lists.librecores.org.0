Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 23497515CDD
	for <lists+openrisc@lfdr.de>; Sat, 30 Apr 2022 14:24:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C0B60248E8;
	Sat, 30 Apr 2022 14:24:41 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 39D34247D4
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 14:24:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3FBFB829F8;
 Sat, 30 Apr 2022 12:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23826C385A7;
 Sat, 30 Apr 2022 12:24:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eshy/VUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651321475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgcN0qR53PxDNDyRz8mDwIaBEjIsjkyTe89/FfZgIDM=;
 b=eshy/VUiIAgCcfeuV75Wr/Er5w1aUXt6kzCJoYjL15KSNHeEk5Jh2kfFZE04m/Q87EiXym
 PF2/F+ko2ujnFvZfStEdi9cFC/HZqkpv+lmKPIP8OWcglsvBB5pRZAhWxmxKRJcfHYA6V9
 N9vHELmyGyG+03V5TZgeyG3/1+c+VV8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9b1305e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 30 Apr 2022 12:24:35 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 openrisc@lists.librecores.org, shorne@gmail.com
Date: Sat, 30 Apr 2022 14:24:33 +0200
Message-Id: <20220430122433.2719029-1-Jason@zx2c4.com>
In-Reply-To: <20220430122355.2718797-1-Jason@zx2c4.com>
References: <20220430122355.2718797-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v8 06/19] openrisc: start CPU timer early in boot
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SW4gb3JkZXIgdG8gbWVhc3VyZSB0aGUgYm9vdCBwcm9jZXNzLCB0aGUgdGltZXIgc2hvdWxkIGJl
IHN3aXRjaGVkIG9uIGFzCmVhcmx5IGluIGJvb3QgYXMgcG9zc2libGUuIFRoaXMgaXMgbmVjZXNz
YXJ5IHNvIHRoYXQgYnkgdGhlIHRpbWUgdGhlCnNldHVwIGNvZGUgcmVhY2hlcyByYW5kb21faW5p
dCgpLCBnZXRfY3ljbGVzKCkgKGJ5IHdheSBvZgpyYW5kb21fZ2V0X2VudHJvcHkoKSkgcmV0dXJu
cyBub24temVybywgaW5kaWNhdGluZyB0aGF0IGl0IGlzIGFjdHVhbGx5CmNhcGFibGUgb2YgY291
bnRpbmcuIFNvIHRoaXMgY29tbWl0IGVuYWJsZXMgdGhlIHRpbWVyIGltbWVkaWF0ZWx5IHVwb24K
Ym9vdGluZyB1cC4gQXMgd2VsbCwgdGhlIGNvbW1pdCBkZWZpbmUgdGhlIGdldF9jeWNsZXMgbWFj
cm8sIGxpa2UgdGhlCnByZXZpb3VzIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIHNvIHRoYXQgZ2Vu
ZXJpYyBjb2RlIGlzIGF3YXJlIHRoYXQgaXQncwppbXBsZW1lbnRlZCBieSB0aGUgcGxhdGZvcm0s
IGFzIGlzIGRvbmUgb24gb3RoZXIgYXJjaHMuCgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+CkNjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpDYzogSm9uYXMg
Qm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgpDYzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFu
LmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZpPgpDYzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBn
bWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQu
Y29tPgotLS0KQ2hhbmdlcyB2Ny0+djg6Ci0gUmF0aGVyIHRoYW4gZG9pbmcgZ2V0X2N5Y2xlcygp
KzEgdG8gaGFuZGxlIHRoZSBlYXJseSBib290IGNhc2UsCiAgYWN0dWFsbHkgc3RhcnQgdGhlIHRp
bWVyIGVhcmx5IGluIGJvb3QuIFRoaXMgaGFzIHRoZSBodWdlIGFkdmFudGFnZSBvZgogIHByb3Bl
cmx5IG1lYXN1cmluZyB0aGUgYm9vdCBzZXF1ZW5jZSB0aW1pbmcsIHdoaWNoIGNvdWxkIGJlIGEg
dmFsdWFibGUKICBzb3VyY2Ugb2YgZW50cm9weS4KCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3RpbWV4LmggfCAxICsKIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgICAgICB8IDcgKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL3RpbWV4LmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3RpbWV4LmgKaW5kZXggZDUyYjRlNTM2ZTNmLi41NDg3ZmE5M2RkOWIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaAorKysgYi9hcmNoL29wZW5yaXNjL2luY2x1
ZGUvYXNtL3RpbWV4LmgKQEAgLTIzLDYgKzIzLDcgQEAgc3RhdGljIGlubGluZSBjeWNsZXNfdCBn
ZXRfY3ljbGVzKHZvaWQpCiB7CiAJcmV0dXJuIG1mc3ByKFNQUl9UVENSKTsKIH0KKyNkZWZpbmUg
Z2V0X2N5Y2xlcyBnZXRfY3ljbGVzCiAKIC8qIFRoaXMgaXNuJ3QgcmVhbGx5IHVzZWQgYW55IG1v
cmUgKi8KICNkZWZpbmUgQ0xPQ0tfVElDS19SQVRFIDEwMDAKZGlmZiAtLWdpdCBhL2FyY2gvb3Bl
bnJpc2Mva2VybmVsL3NldHVwLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCmluZGV4
IDBjZDA0ZDkzNmE3YS4uMWNiN2MxNzcwYTE3IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tl
cm5lbC9zZXR1cC5jCisrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKQEAgLTIyMCw2
ICsyMjAsMTMgQEAgdm9pZCBfX2luaXQgc2V0dXBfY3B1aW5mbyh2b2lkKQogCiB2b2lkIF9faW5p
dCBvcjFrX2Vhcmx5X3NldHVwKHZvaWQgKmZkdCkKIHsKKwkvKiBTdGFydCB0aGUgVFRDUiBhcyBl
YXJseSBhcyBwb3NzaWJsZSwgc28gdGhhdCB0aGUgUk5HIGNhbiBtYWtlIHVzZSBvZgorCSAqIG1l
YXN1cmVtZW50cyBvZiBib290IHRpbWUgZnJvbSB0aGUgZWFybGllc3Qgb3Bwb3J0dW5pdHkuIEVz
cGVjaWFsbHkKKwkgKiBpbXBvcnRhbnQgaXMgdGhhdCB0aGUgVFRDUiBkb2VzIG5vdCByZXR1cm4g
emVybyBieSB0aGUgdGltZSB3ZSByZWFjaAorCSAqIHJhbmRfaW5pdGlhbGl6ZSgpLgorCSAqLwor
CW10c3ByKFNQUl9UVE1SLCBTUFJfVFRNUl9DUik7CisKIAlpZiAoZmR0KQogCQlwcl9pbmZvKCJG
RFQgYXQgJXBcbiIsIGZkdCk7CiAJZWxzZSB7Ci0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
