Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 07E4A517A37
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 00:52:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A3277248E7;
	Tue,  3 May 2022 00:52:39 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 105BC211D5
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 00:52:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A41DB81A60;
 Mon,  2 May 2022 22:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6772BC385AC;
 Mon,  2 May 2022 22:52:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gu3swz4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651531953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jVvqtibdROd/SImZZd0KliWCAmrH5hWUG052WA69KPQ=;
 b=gu3swz4w/Mt631PQWNbyRBtmAIZR7mARZpShm0ZscrKijMtTgBTqy9pk7maDf/l7SL5ETN
 Z+plLevu9kj6tvSOdjmuF4ySxDFdodRFi88VbZVU62twqUT8fFT9QK8Wz5pHUpKPrNLMuO
 U3zAh5eyx5bmPFNZTDHRaRbqTF4/66s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a06a0ed
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 2 May 2022 22:52:33 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	openrisc@lists.librecores.org,
	shorne@gmail.com
Date: Tue,  3 May 2022 00:52:30 +0200
Message-Id: <20220502225230.237369-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] target/openrisc: implement shutdown and reset
 helpers
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

T3BlblJJU0MgZGVmaW5lcyB2YXJpb3VzIG5vcCBpbnN0cnVjdGlvbnMgaW4gb3IxayBhcyBtZWFu
aW5nIHNodXRkb3duIG9yCnJlc2V0LiBJbXBsZW1lbnQgdGhlc2UgaW4gVENHLiBUaGlzIGhhcyBi
ZWVuIHRlc3RlZCB3aXRoIExpbnV4IGFuZApjb25maXJtZWQgdG8gd29yay4KCkNjOiBTdGFmZm9y
ZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gQS4gRG9uZW5m
ZWxkIDxKYXNvbkB6eDJjNC5jb20+Ci0tLQogdGFyZ2V0L29wZW5yaXNjL2hlbHBlci5oICAgICB8
ICAxICsKIHRhcmdldC9vcGVucmlzYy9zeXNfaGVscGVyLmMgfCAxOCArKysrKysrKysrKysrKysr
KysKIHRhcmdldC9vcGVucmlzYy90cmFuc2xhdGUuYyAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvb3BlbnJpc2MvaGVscGVyLmgg
Yi90YXJnZXQvb3BlbnJpc2MvaGVscGVyLmgKaW5kZXggZDg0NzgxNGEyOC4uZWEzNTU3YjNmOSAx
MDA2NDQKLS0tIGEvdGFyZ2V0L29wZW5yaXNjL2hlbHBlci5oCisrKyBiL3RhcmdldC9vcGVucmlz
Yy9oZWxwZXIuaApAQCAtNjQsMyArNjQsNCBAQCBERUZfSEVMUEVSX0ZMQUdTXzEocmZlLCAwLCB2
b2lkLCBlbnYpCiAvKiBzeXMgKi8KIERFRl9IRUxQRVJfRkxBR1NfMyhtdHNwciwgMCwgdm9pZCwg
ZW52LCB0bCwgdGwpCiBERUZfSEVMUEVSX0ZMQUdTXzMobWZzcHIsIFRDR19DQUxMX05PX1dHLCB0
bCwgZW52LCB0bCwgdGwpCitERUZfSEVMUEVSXzEobm9wLCB2b2lkLCBpMzIpCmRpZmYgLS1naXQg
YS90YXJnZXQvb3BlbnJpc2Mvc3lzX2hlbHBlci5jIGIvdGFyZ2V0L29wZW5yaXNjL3N5c19oZWxw
ZXIuYwppbmRleCA0ODY3NDIzMWU3Li5mNjI0OTg5NmZiIDEwMDY0NAotLS0gYS90YXJnZXQvb3Bl
bnJpc2Mvc3lzX2hlbHBlci5jCisrKyBiL3RhcmdldC9vcGVucmlzYy9zeXNfaGVscGVyLmMKQEAg
LTE5LDYgKzE5LDcgQEAKICAqLwogCiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUg
InN5c2VtdS9ydW5zdGF0ZS5oIgogI2luY2x1ZGUgImNwdS5oIgogI2luY2x1ZGUgImV4ZWMvZXhl
Yy1hbGwuaCIKICNpbmNsdWRlICJleGVjL2hlbHBlci1wcm90by5oIgpAQCAtMzE0LDMgKzMxNSwy
MCBAQCB0YXJnZXRfdWxvbmcgSEVMUEVSKG1mc3ByKShDUFVPcGVuUklTQ1N0YXRlICplbnYsIHRh
cmdldF91bG9uZyByZCwKICAgICAvKiBmb3IgcmQgaXMgcGFzc2VkIGluLCBpZiByZCB1bmNoYW5n
ZWQsIGp1c3Qga2VlcCBpdCBiYWNrLiAgKi8KICAgICByZXR1cm4gcmQ7CiB9CisKK3ZvaWQgSEVM
UEVSKG5vcCkodWludDMyX3QgYXJnKQoreworI2lmbmRlZiBDT05GSUdfVVNFUl9PTkxZCisJc3dp
dGNoIChhcmcpIHsKKwljYXNlIDB4MDAxOiAvKiBOT1BfRVhJVCAqLworCWNhc2UgMHgwMGM6IC8q
IE5PUF9FWElUX1NJTEVOVCAqLworCQlxZW11X3N5c3RlbV9zaHV0ZG93bl9yZXF1ZXN0KFNIVVRE
T1dOX0NBVVNFX0dVRVNUX1NIVVRET1dOKTsKKwkJYnJlYWs7CisJY2FzZSAweDAwZDogLyogTk9Q
X1JFU0VUICovCisJCXFlbXVfc3lzdGVtX3Jlc2V0X3JlcXVlc3QoU0hVVERPV05fQ0FVU0VfR1VF
U1RfUkVTRVQpOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlicmVhazsKKwl9CisjZW5kaWYKK30K
ZGlmZiAtLWdpdCBhL3RhcmdldC9vcGVucmlzYy90cmFuc2xhdGUuYyBiL3RhcmdldC9vcGVucmlz
Yy90cmFuc2xhdGUuYwppbmRleCA3YjhhZDQzZDVmLi4yZTRmMzc1OWQ0IDEwMDY0NAotLS0gYS90
YXJnZXQvb3BlbnJpc2MvdHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L29wZW5yaXNjL3RyYW5zbGF0
ZS5jCkBAIC03ODAsNiArNzgwLDcgQEAgc3RhdGljIGJvb2wgdHJhbnNfbF9zaChEaXNhc0NvbnRl
eHQgKmRjLCBhcmdfc3RvcmUgKmEpCiAKIHN0YXRpYyBib29sIHRyYW5zX2xfbm9wKERpc2FzQ29u
dGV4dCAqZGMsIGFyZ19sX25vcCAqYSkKIHsKKyAgICBnZW5faGVscGVyX25vcChjcHVfUihkYywg
YS0+aykpOwogICAgIHJldHVybiB0cnVlOwogfQogCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
