Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8C5517AA8
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 01:21:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 10592248EC;
	Tue,  3 May 2022 01:21:04 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 22F8B20D0C
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 01:21:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4FBF6126B;
 Mon,  2 May 2022 23:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D66C385AE;
 Mon,  2 May 2022 23:21:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UGDpEgAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651533658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=drNnPwOIu75Uiln8TrQrWPM013fyoOXTJndTHgjnkMU=;
 b=UGDpEgAk/OLqCLdNIi9E9tuVQCO1H0AKBAzocH2CJ/lpY7y/DrC5nn84YYiqWoe31bKE0+
 e3c5HvX7bS+AYZgVSiqV7EqluvnlOtJaBM09j8UeBxP1A+pJbXGvShzdx4z96mx2Ebyyp+
 Cw6IxBDxV/NaP6MJWtxj+t21SnO/9ZA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e69bd9a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 2 May 2022 23:20:58 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	openrisc@lists.librecores.org,
	shorne@gmail.com
Date: Tue,  3 May 2022 01:20:56 +0200
Message-Id: <20220502232056.248292-1-Jason@zx2c4.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] hw/openrisc: support 4 serial ports in or1ksim
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

VGhlIDgyNTAgc2VyaWFsIGNvbnRyb2xsZXIgc3VwcG9ydHMgNCBzZXJpYWwgcG9ydHMsIHNvIHdp
cmUgdGhlbSBhbGwgdXAsCnNvIHRoYXQgd2UgY2FuIGhhdmUgbW9yZSB0aGFuIG9uZSBiYXNpYyBJ
L08gY2hhbm5lbC4KCkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Ci0tLQogaHcvb3Bl
bnJpc2Mvb3BlbnJpc2Nfc2ltLmMgfCAyMSArKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3
L29wZW5yaXNjL29wZW5yaXNjX3NpbS5jIGIvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKaW5k
ZXggYmY0MzRlOTczNy4uZmUwN2RiMWNjNSAxMDA2NDQKLS0tIGEvaHcvb3BlbnJpc2Mvb3BlbnJp
c2Nfc2ltLmMKKysrIGIvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKQEAgLTcxLDYgKzcxLDEw
IEBAIGVudW0gewogICAgIE9SMUtTSU1fRVRIT0NfSVJRID0gNCwKIH07CiAKK2VudW0geworICAg
IE9SMUtTSU1fVUFSVF9DT1VOVCA9IDQKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgTWVtbWFw
RW50cnkgewogICAgIGh3YWRkciBiYXNlOwogICAgIGh3YWRkciBzaXplOwpAQCAtMjM5LDExICsy
NDMsMTMgQEAgc3RhdGljIHZvaWQgb3BlbnJpc2Nfc2ltX29tcGljX2luaXQoT3Ixa3NpbVN0YXRl
ICpzdGF0ZSwgaHdhZGRyIGJhc2UsCiAKIHN0YXRpYyB2b2lkIG9wZW5yaXNjX3NpbV9zZXJpYWxf
aW5pdChPcjFrc2ltU3RhdGUgKnN0YXRlLCBod2FkZHIgYmFzZSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBod2FkZHIgc2l6ZSwgaW50IG51bV9jcHVzLAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9wZW5SSVNDQ1BVICpjcHVzW10sIGludCBpcnFf
cGluKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9wZW5SSVNDQ1BVICpj
cHVzW10sIGludCBpcnFfcGluLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCB1YXJ0X2lkeCkKIHsKICAgICB2b2lkICpmZHQgPSBzdGF0ZS0+ZmR0OwogICAgIGNoYXIg
Km5vZGVuYW1lOwogICAgIHFlbXVfaXJxIHNlcmlhbF9pcnE7CisgICAgY2hhciBhbGlhc1tzaXpl
b2YoInVhcnQwIildOwogICAgIGludCBpOwogCiAgICAgaWYgKG51bV9jcHVzID4gMSkgewpAQCAt
MjU4LDcgKzI2NCw3IEBAIHN0YXRpYyB2b2lkIG9wZW5yaXNjX3NpbV9zZXJpYWxfaW5pdChPcjFr
c2ltU3RhdGUgKnN0YXRlLCBod2FkZHIgYmFzZSwKICAgICAgICAgc2VyaWFsX2lycSA9IGdldF9j
cHVfaXJxKGNwdXMsIDAsIGlycV9waW4pOwogICAgIH0KICAgICBzZXJpYWxfbW1faW5pdChnZXRf
c3lzdGVtX21lbW9yeSgpLCBiYXNlLCAwLCBzZXJpYWxfaXJxLCAxMTUyMDAsCi0gICAgICAgICAg
ICAgICAgICAgc2VyaWFsX2hkKDApLCBERVZJQ0VfTkFUSVZFX0VORElBTik7CisgICAgICAgICAg
ICAgICAgICAgc2VyaWFsX2hkKE9SMUtTSU1fVUFSVF9DT1VOVCAtIHVhcnRfaWR4IC0gMSksIERF
VklDRV9OQVRJVkVfRU5ESUFOKTsKIAogICAgIC8qIEFkZCBkZXZpY2UgdHJlZSBub2RlIGZvciBz
ZXJpYWwuICovCiAgICAgbm9kZW5hbWUgPSBnX3N0cmR1cF9wcmludGYoIi9zZXJpYWxAJSIgSFdB
RERSX1BSSXgsIGJhc2UpOwpAQCAtMjcxLDcgKzI3Nyw4IEBAIHN0YXRpYyB2b2lkIG9wZW5yaXNj
X3NpbV9zZXJpYWxfaW5pdChPcjFrc2ltU3RhdGUgKnN0YXRlLCBod2FkZHIgYmFzZSwKIAogICAg
IC8qIFRoZSAvY2hvc2VuIG5vZGUgaXMgY3JlYXRlZCBkdXJpbmcgZmR0IGNyZWF0aW9uLiAqLwog
ICAgIHFlbXVfZmR0X3NldHByb3Bfc3RyaW5nKGZkdCwgIi9jaG9zZW4iLCAic3Rkb3V0LXBhdGgi
LCBub2RlbmFtZSk7Ci0gICAgcWVtdV9mZHRfc2V0cHJvcF9zdHJpbmcoZmR0LCAiL2FsaWFzZXMi
LCAidWFydDAiLCBub2RlbmFtZSk7CisgICAgc25wcmludGYoYWxpYXMsIHNpemVvZihhbGlhcyks
ICJ1YXJ0JWQiLCB1YXJ0X2lkeCk7CisgICAgcWVtdV9mZHRfc2V0cHJvcF9zdHJpbmcoZmR0LCAi
L2FsaWFzZXMiLCBhbGlhcywgbm9kZW5hbWUpOwogICAgIGdfZnJlZShub2RlbmFtZSk7CiB9CiAK
QEAgLTQxNCw5ICs0MjEsMTEgQEAgc3RhdGljIHZvaWQgb3BlbnJpc2Nfc2ltX2luaXQoTWFjaGlu
ZVN0YXRlICptYWNoaW5lKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzbXBfY3B1
cywgY3B1cywgT1IxS1NJTV9PTVBJQ19JUlEpOwogICAgIH0KIAotICAgIG9wZW5yaXNjX3NpbV9z
ZXJpYWxfaW5pdChzdGF0ZSwgb3Ixa3NpbV9tZW1tYXBbT1IxS1NJTV9VQVJUXS5iYXNlLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBvcjFrc2ltX21lbW1hcFtPUjFLU0lNX1VBUlRdLnNp
emUsIHNtcF9jcHVzLCBjcHVzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPUjFLU0lN
X1VBUlRfSVJRKTsKKyAgICBmb3IgKG4gPSAwOyBuIDwgT1IxS1NJTV9VQVJUX0NPVU5UOyArK24p
CisgICAgICAgICAgICBvcGVucmlzY19zaW1fc2VyaWFsX2luaXQoc3RhdGUsIG9yMWtzaW1fbWVt
bWFwW09SMUtTSU1fVUFSVF0uYmFzZSArCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9yMWtzaW1fbWVtbWFwW09SMUtTSU1fVUFSVF0uc2l6ZSAqIG4sCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Ixa3NpbV9tZW1tYXBbT1IxS1NJTV9V
QVJUXS5zaXplLCBzbXBfY3B1cywgY3B1cywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBPUjFLU0lNX1VBUlRfSVJRLCBuKTsKIAogICAgIGxvYWRfYWRkciA9IG9wZW5yaXNj
X2xvYWRfa2VybmVsKHJhbV9zaXplLCBrZXJuZWxfZmlsZW5hbWUpOwogICAgIGlmIChsb2FkX2Fk
ZHIgPiAwKSB7Ci0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
