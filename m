Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C1A7951322B
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 13:12:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 84553248C9;
	Thu, 28 Apr 2022 13:11:59 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id F30F724165
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 13:11:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDD5B61E71;
 Thu, 28 Apr 2022 11:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F7EC385A0;
 Thu, 28 Apr 2022 11:11:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OuGIwjQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651144313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=md1MNTc1vspPVRzc4103iVAWg3qcKbg05zQ16mss5wU=;
 b=OuGIwjQDeOI2B7bguWdrvoPU23TV9BZIGknyDcDeIiorX0maglyOOtCGowJ10EBFj6JHQp
 JLlr7/a127+CbZJn5HQHWqL8Avt4ZiE+KyUcS5bftw9c5rApmgiYuYjKPeVcKYsp7aokcU
 A2gA1jGTCo5qxMzglRfMtKTKUrENyWo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6ed39d4e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 11:11:53 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: shorne@gmail.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Date: Thu, 28 Apr 2022 13:11:39 +0200
Message-Id: <20220428111139.1330966-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: define nop command for simulator reboot
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

VGhlIHNpbXVsYXRvciBkZWZpbmVzIGBsLm5vcCAxYCBmb3Igc2h1dGRvd24sIGJ1dCBkb2Vzbid0
IGhhdmUgYW55dGhpbmcKZm9yIHJlYm9vdC4gVXNlIDEzIGZvciB0aGlzLCB3aGljaCBpcyBjdXJy
ZW50bHkgdW51c2VkLCBkdWJiZWQKYE5PUF9SRUJPT1RgLgoKQ2M6IFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPgpDYzogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWW1uYURVcFZJNWloZ3ZnNkB6
eDJjNC5jb20vClNpZ25lZC1vZmYtYnk6IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQu
Y29tPgotLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5l
bC9wcm9jZXNzLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggM2MwYzkx
YmNkY2JhLi40Y2NlOTVmYTZlYjUgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3By
b2Nlc3MuYworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKQEAgLTUyLDYgKzUy
LDggQEAgdm9pZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqY21kKQogewogCWRvX2tlcm5lbF9yZXN0
YXJ0KGNtZCk7CiAKKwlfX2FzbV9fKCJsLm5vcCAxMyIpOworCiAJLyogR2l2ZSBhIGdyYWNlIHBl
cmlvZCBmb3IgZmFpbHVyZSB0byByZXN0YXJ0IG9mIDFzICovCiAJbWRlbGF5KDEwMDApOwogCi0t
IAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
