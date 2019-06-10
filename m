Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD8B3BDC6
	for <lists+openrisc@lfdr.de>; Mon, 10 Jun 2019 22:49:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08A362016A;
	Mon, 10 Jun 2019 22:49:55 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id D430620150
 for <openrisc@lists.librecores.org>; Mon, 10 Jun 2019 22:49:52 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id p184so2679176pfp.7
 for <openrisc@lists.librecores.org>; Mon, 10 Jun 2019 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5jeakLw3eDv6iCxDUF/pZbngCc/MNulrb+Y/+Dyu4JA=;
 b=hyeojTAV9wVIZgO/pQRSsGYtlak5j9LEIsWPswo9iPVZwGz29LlFFvCDmvPyazxcS4
 0bEuo4vBgmV6vuHSndtXLzlEZnSIJWL2Y3okI3B4IxMY82vr6+xppjmlHwY8/FqdmneD
 +979WUAkRVy6beq2+aHBJkV7ofStjhGytJGfHvfVZ7Mc68NblNEvGRjQrHwkTwA7UIQn
 FbdpZuL3WA/MRl+TLz/QO9i3qlD99J1l9W8ft4iLXgIQJlw5nFqe8DAhlJmCD4i2pSOB
 0TaA8vC/5491EMUYfODJQ8Nl+vpdN6GYmFCqx9i82sYk3euGxgHtiTOjf8j8GeG81pFt
 g3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5jeakLw3eDv6iCxDUF/pZbngCc/MNulrb+Y/+Dyu4JA=;
 b=Gn2hlcIppX00gDW77JoRjM2e1Q/EAfm+IpRqqU7/rgw1tPrhaxBXYpGW2P8h353aU6
 iThyHqmrrG2IomqGax53B8RDKLwTlEj8CmHkqFm6rUZB4vXm2+Jp4zru9orfVV7UZE/H
 2dnxUGa8uH8mlA8/aZVha5kxuFj/WXK2lPHqUxtiljdnUGP1yUNEmr3Elaxen2CJQ2t+
 EBqHf+Tgw6cKcMz8VLVuL5h121iGNvtABrAX/8oVjpgi6Qxqr2XkBKps1lRaDmuyPX/0
 JgBRNOkYMSdrBQEhNUnkiklCCP1Qcd/kd6b9yjSkjl0C+GmEDpERNZARQvzvADp6bEOK
 jIJA==
X-Gm-Message-State: APjAAAV5eovFgxtqgFTlTBIUhTL6pmyCKOCYOru/sVUtmpO7agbieyI9
 +8kWLlhG6QYyFfPku3H7tjs=
X-Google-Smtp-Source: APXvYqw95tr6QgN+hcGT36/Y8Bz8Bw9nIRGDgfemz51/m+IADndJetnNaQquW4e1tVEKHzOXJgiGUA==
X-Received: by 2002:a62:1885:: with SMTP id 127mr77854257pfy.48.1560199791144; 
 Mon, 10 Jun 2019 13:49:51 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id f10sm11852002pfd.151.2019.06.10.13.49.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 13:49:50 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>,
 GNU Binutils <binutils@sourceware.org>
Date: Tue, 11 Jun 2019 05:49:39 +0900
Message-Id: <20190610204940.3846-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 10/11] sim/testsuite/or1k: Add test case for
 l.adrp instruction
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBpcyBhIHNpbXBsZSB0ZXN0IHRvIGVuc3VyZSB0aGF0IHRoZSBsLmFkcnAgaW5zdHJ1Y3Rp
b24gY2FuIGJlIGFzc2VtYmxlZCBhbmQKc2ltdWxhdGVkIGNvcnJlY3RseS4KCnNpbS90ZXN0c3Vp
dGUvc2ltL29yMWsvQ2hhbmdlTG9nOgoKeXl5eS1tbS1kZCAgU3RhZmZvcmQgSG9ybmUgIDxzaG9y
bmVAZ21haWwuY29tPgoKCSogYWRycC5TOiBOZXcgZmlsZS4KLS0tCkNoYW5nZXMgc2luY2UgdjI6
CiAtIG5ldyBwYXRjaAoKIHNpbS90ZXN0c3VpdGUvc2ltL29yMWsvYWRycC5TIHwgNzMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2ltL3Rlc3RzdWl0ZS9zaW0vb3Ixay9hZHJwLlMK
CmRpZmYgLS1naXQgYS9zaW0vdGVzdHN1aXRlL3NpbS9vcjFrL2FkcnAuUyBiL3NpbS90ZXN0c3Vp
dGUvc2ltL29yMWsvYWRycC5TCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LmJhMzg0Y2NjODQKLS0tIC9kZXYvbnVsbAorKysgYi9zaW0vdGVzdHN1aXRlL3NpbS9vcjFrL2Fk
cnAuUwpAQCAtMCwwICsxLDczIEBACisvKiBUZXN0cyB0aGUgbG9hZCBwYWdlIGFkZHJlc3MgaW5z
dHJ1Y3Rpb24uCisKKyAgIENvcHlyaWdodCAoQykgMjAxNy0yMDE5IEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLgorCisgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAgIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDMgb2YgdGhlIExpY2Vuc2Us
IG9yCisgICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGlzIHBy
b2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwK
KyAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCisgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuICBTZWUgdGhlCisgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgorCisgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJ
ZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uICAqLworCisjIG1hY2g6
IG9yMWsKKyMgb3V0cHV0OiByZXBvcnQoMHgwMDAwMjA2NCk7XG4KKyMgb3V0cHV0OiByZXBvcnQo
MHgwMDAxMjEzOCk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHgwMDAwMjAwMCk7XG4KKyMgb3V0cHV0
OiByZXBvcnQoMHgwMDAxMjAwMCk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHgwMDAwMjAwMCk7XG4K
KyMgb3V0cHV0OiByZXBvcnQoMHgwMDAxNDAwMCk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHgwMDAw
MDAwMCk7XG4KKyMgb3V0cHV0OiBleGl0KDApXG4KKworI2luY2x1ZGUgIm9yMWstYXNtLXRlc3Qt
aGVscGVycy5oIgorCisJU1RBTkRBUkRfVEVTVF9FTlZJUk9OTUVOVAorCisJLnNlY3Rpb24gLmRh
dGEKKwkub3JnIDB4MTAwMDAKKwkuYWxpZ24gNAorCS50eXBlICAgcGksIEBvYmplY3QKKwkuc2l6
ZSAgIHBpLCA0CitwaToKKwkuZmxvYXQJMy4xNDE1OQorCisJLnNlY3Rpb24gLnRleHQKK3N0YXJ0
X3Rlc3RzOgorCVBVU0ggTElOS19SRUdJU1RFUl9SOQorCisJLyogUHJpbnQgb3V0IHRoZSBQQy4g
IFRvIGNvbXBhcmUgd2l0aCB0aGF0IGxvYWRlZCBieSBsLmFkcnAuICAqLworCWwuamFsCWNhcHR1
cmVfcGMKKwkgbC5ub3AKK2NhcHR1cmVfcGM6CisJUkVQT1JUX1JFR19UT19DT05TT0xFIHI5CisK
KwkvKiBQcmludCBvdXQgb3VyIGRhdGEgYWRkcmVzcyB0byBjb21wYXJlZCB3aXRoIGwuYWRycCBv
ZmZzZXQuICAqLworCWwubW92aGkJcjExLCBoYShwaSkKKwlsLmFkZGkJcjExLCByMTEsIGxvKHBp
KQorCVJFUE9SVF9SRUdfVE9fQ09OU09MRSByMTEKKworCS8qIFRlc3QgbC5hZHJwIHdpdGggc3lt
Ym9scywgbG9hZHMgcGFnZSBvZiBzeW1ib2wgdG8gcmVnaXN0ZXIuICAqLworCWwuYWRycAlyNCwg
c3RhcnRfdGVzdHMKKwlSRVBPUlRfUkVHX1RPX0NPTlNPTEUgcjQKKworCWwuYWRycAlyNCwgcGkK
KwlSRVBPUlRfUkVHX1RPX0NPTlNPTEUgcjQKKworCS8qIFRlc3QgbC5hZHJwIHdpdGggaW1tZWRp
YXRlLCBpbW1lZGlhdGUgaXMgdGhlIHBhZ2Ugb2Zmc2V0LiAgKi8KKwlsLmFkcnAJcjQsIDB4MAor
CVJFUE9SVF9SRUdfVE9fQ09OU09MRSByNAorCisJbC5hZHJwCXI0LCAweDEyMDAwCisJUkVQT1JU
X1JFR19UT19DT05TT0xFIHI0CisKKwlsLmFkcnAJcjQsIC0weDIwMDAKKwlSRVBPUlRfUkVHX1RP
X0NPTlNPTEUgcjQKKworCVBPUCBMSU5LX1JFR0lTVEVSX1I5CisJUkVUVVJOX1RPX0xJTktfUkVH
SVNURVJfUjkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
