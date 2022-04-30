Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CAF3F5160D2
	for <lists+openrisc@lfdr.de>; Sun,  1 May 2022 00:42:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B66EA24816;
	Sun,  1 May 2022 00:42:48 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 77FA223E0C
 for <openrisc@lists.librecores.org>; Sun,  1 May 2022 00:42:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11BE961141;
 Sat, 30 Apr 2022 22:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BC6C385AA;
 Sat, 30 Apr 2022 22:42:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LfZnTRHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651358563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDcxIFbtY1JJMfSvV/JygJMQbDBb6C5R9pMDQBmuC0Q=;
 b=LfZnTRHjVJYWeGWGXRaQmJ91JVdTwQUg+2GGkL+CtIMnxu3F5totH7E1UQTMPUsf7sVPu2
 7xs6ABX4fKEJ6sgE0HqZcQacVxYw7n9+Pgi5HQXxin8AICsVMxg/rKozBkiZ3fa3vgH6Y/
 jpbzmsLknh3YiqlBtez3inRV73uZ8QQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4f9b3ca1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 30 Apr 2022 22:42:42 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>
Date: Sun,  1 May 2022 00:42:40 +0200
Message-Id: <20220430224240.3157636-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9r-=ShRomP=Nrcz-GjP4kv4e9wKHvNdAMiRui7_FSbH-A@mail.gmail.com>
References: <CAHmME9r-=ShRomP=Nrcz-GjP4kv4e9wKHvNdAMiRui7_FSbH-A@mail.gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v9 06/21] openrisc: start CPU timer early in boot
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
LmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZpPgpBY2tlZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+ClJlcG9ydGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11
cy5uZXQ+ClNpZ25lZC1vZmYtYnk6IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29t
PgotLS0KQ2hhbmdlcyB2OC0+djk6Ci0gVXNlIFN0YWZmb3JkJ3Mgc3VnZ2VzdGVkIGFzc2VtYmx5
IGluIGhlYWQuUyBpbnN0ZWFkIG9mIGRvaW5nIHRoaXMKICBsYXRlciBvbiBpbiBDLCBzbyB0aGF0
IHRoZSBjeWNsZSBjb3VudGVyIHN0YXJ0cyB2ZXJ5IGVhcmx5IGFuZCB0aHVzCiAgIm1lYXN1cmVz
IiBib290LgoKIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaCB8IDEgKwogYXJjaC9v
cGVucmlzYy9rZXJuZWwvaGVhZC5TICAgICAgIHwgOSArKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vdGltZXguaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaAppbmRleCBkNTJi
NGU1MzZlM2YuLjU0ODdmYTkzZGQ5YiAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS90aW1leC5oCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaApAQCAt
MjMsNiArMjMsNyBAQCBzdGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXModm9pZCkKIHsK
IAlyZXR1cm4gbWZzcHIoU1BSX1RUQ1IpOwogfQorI2RlZmluZSBnZXRfY3ljbGVzIGdldF9jeWNs
ZXMKIAogLyogVGhpcyBpc24ndCByZWFsbHkgdXNlZCBhbnkgbW9yZSAqLwogI2RlZmluZSBDTE9D
S19USUNLX1JBVEUgMTAwMApkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvaGVhZC5T
IGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvaGVhZC5TCmluZGV4IDE1ZjFiMzhkZmUwMy4uODcxZjRj
ODU4ODU5IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9oZWFkLlMKKysrIGIvYXJj
aC9vcGVucmlzYy9rZXJuZWwvaGVhZC5TCkBAIC01MjEsNiArNTIxLDE1IEBAIF9zdGFydDoKIAls
Lm9yaQlyMyxyMCwweDEKIAlsLm10c3ByCXIwLHIzLFNQUl9TUgogCisJLyoKKwkgKiBTdGFydCB0
aGUgVFRDUiBhcyBlYXJseSBhcyBwb3NzaWJsZSwgc28gdGhhdCB0aGUgUk5HIGNhbiBtYWtlIHVz
ZSBvZgorCSAqIG1lYXN1cmVtZW50cyBvZiBib290IHRpbWUgZnJvbSB0aGUgZWFybGllc3Qgb3Bw
b3J0dW5pdHkuIEVzcGVjaWFsbHkKKwkgKiBpbXBvcnRhbnQgaXMgdGhhdCB0aGUgVFRDUiBkb2Vz
IG5vdCByZXR1cm4gemVybyBieSB0aGUgdGltZSB3ZSByZWFjaAorCSAqIHJhbmRfaW5pdGlhbGl6
ZSgpLgorCSAqLworCWwubW92aGkgcjMsaGkoU1BSX1RUTVJfQ1IpCisJbC5tdHNwciByMCxyMyxT
UFJfVFRNUgorCiAJQ0xFQVJfR1BSKHIxKQogCUNMRUFSX0dQUihyMikKIAlDTEVBUl9HUFIocjMp
Ci0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
