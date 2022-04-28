Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 490E051315A
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 12:35:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E3F1C248C7;
	Thu, 28 Apr 2022 12:35:25 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 0AEED211B2
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 12:35:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C411961DD9;
 Thu, 28 Apr 2022 10:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7885EC385A9;
 Thu, 28 Apr 2022 10:35:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bXy/j2fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651142120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nJ6RTU4RXAUTOLu2hrurvGS4AlaBGyTTAdMHn68hABo=;
 b=bXy/j2frlXL7J8n6rYUK3ACQ/yEKzsrjW6DMMk0Zn7ZB6MHWyQ+Ivk1m7IUpahx0g2sp7v
 MuAXE7v2vm32Ckju1H4xEYtnRLfVzCOM+VSYS8wS4wlqB5DjVooTK6FgkM2BzhdWgQcyvf
 twGCw2hYw0pp20aGLWOoL3zq1BOafmA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2cc36e21
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 10:35:20 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: openrisc@lists.librecores.org,
	qemu-devel@nongnu.org,
	shorne@gmail.com
Date: Thu, 28 Apr 2022 12:35:16 +0200
Message-Id: <20220428103516.1149436-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] hw/openrisc: page-align FDT address
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIFFFTVUtcHJvdmlkZWQgRkRUIHdhcyBvbmx5IGJlaW5nIHJlY29nbml6ZWQgYnkgdGhlIGtl
cm5lbCB3aGVuIGl0CndhcyB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggLWluaXRyZC4gV2l0aG91
dCBpdCwgdGhlIG1hZ2ljIGJ5dGVzCndvdWxkbid0IGJlIHRoZXJlIGFuZCB0aGUga2VybmVsIGNv
dWxkbid0IGxvYWQgaXQuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlCmlzc3VlIGJ5IHBhZ2UgYWxpZ25p
bmcgdGhlIHByb3ZpZGVkIEZEVC4KCkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNv
bT4KQ2M6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KU2lnbmVkLW9m
Zi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Ci0tLQogaHcvb3BlbnJp
c2Mvb3BlbnJpc2Nfc2ltLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ody9vcGVucmlzYy9vcGVucmlzY19zaW0uYyBi
L2h3L29wZW5yaXNjL29wZW5yaXNjX3NpbS5jCmluZGV4IDgxODRjYWE2MGIuLjk5YjE0OTQwZjQg
MTAwNjQ0Ci0tLSBhL2h3L29wZW5yaXNjL29wZW5yaXNjX3NpbS5jCisrKyBiL2h3L29wZW5yaXNj
L29wZW5yaXNjX3NpbS5jCkBAIC0zNTYsNyArMzU2LDcgQEAgc3RhdGljIHVpbnQzMl90IG9wZW5y
aXNjX2xvYWRfZmR0KE9yMWtzaW1TdGF0ZSAqc3RhdGUsIGh3YWRkciBsb2FkX3N0YXJ0LAogICAg
IH0KIAogICAgIC8qIFdlIHB1dCBmZHQgcmlnaHQgYWZ0ZXIgdGhlIGtlcm5lbCBhbmQvb3IgaW5p
dHJkLiAqLwotICAgIGZkdF9hZGRyID0gUk9VTkRfVVAobG9hZF9zdGFydCwgNCk7CisgICAgZmR0
X2FkZHIgPSBUQVJHRVRfUEFHRV9BTElHTihsb2FkX3N0YXJ0KTsKIAogICAgIHJldCA9IGZkdF9w
YWNrKGZkdCk7CiAgICAgLyogU2hvdWxkIG9ubHkgZmFpbCBpZiB3ZSd2ZSBidWlsdCBhIGNvcnJ1
cHRlZCB0cmVlICovCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
