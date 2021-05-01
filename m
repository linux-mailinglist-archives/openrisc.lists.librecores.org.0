Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 97A703708F8
	for <lists+openrisc@lfdr.de>; Sat,  1 May 2021 23:02:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2E3252074A;
	Sat,  1 May 2021 23:02:30 +0200 (CEST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mail.librecores.org (Postfix) with ESMTPS id 7F04A20EEB
 for <openrisc@lists.librecores.org>; Sat,  1 May 2021 23:02:27 +0200 (CEST)
Received: by mail-pf1-f175.google.com with SMTP id i13so1480629pfu.2
 for <openrisc@lists.librecores.org>; Sat, 01 May 2021 14:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sUKmas1VE9HK0uavlekhAn38cYzyPP5pPTh/oCc8rjM=;
 b=PVjsVHtmDhR+5nkXmXnIswkbYrSeLeimYyFJsA8jssNHca3yrabSFOijaKDYafyMGb
 riA3M5B1vKIrrPQcL5UhxRsTF0Qcgpl4kW6tuOte/I5GzQ+YcDRO1aKJ5B11D1blAID9
 TmBY/RoVyzOalBGNwXXwXlhXgVWaN45yxZlAKUDghPcmBDhqWerYHX6UngNCQwr7/zMg
 R2ZQ6FM0Iuqm1fwEP7kXUYBnz6GGSt2dFFSiJTG8sjEQBpZDwVKKgr5qNDdRepW7Xtsc
 i4wabvTqlYFEGfO2lbe0Q3wO7cMAct+OmucC2LNdZ6yF8WKP1aeiZci2Iz4HtV5COAES
 2RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sUKmas1VE9HK0uavlekhAn38cYzyPP5pPTh/oCc8rjM=;
 b=XWEwPvtOzmG0069pGGw+/DdTl3XrKDOlD5EWT/1DGBlsGXtqnt9WcJiSEUCpoD6Jcl
 TUmDZBSU/RxX4ClDWkBOWneK4NcLLt3Oecpy16POMWeTVmZlUAfydCKGJSTSIvgaRIv8
 LMGjRgm5l9xSt726MTXk2zkggzltm6FXYn7oG80JS0M8RqB+MXvO7Qfpe+LlDv1T++to
 NW1CADTxSEUsBGs/xzZ1QRyPy6WaplOaA3GqiJV2dhYo+hcgVqFUPmGdaAvoZlkTPEY3
 zzJLlPGRWkJgrk4owRLCCJ3pcaRkPx6If3eeaqqt+CFklffY1JxIuI/OGHNQmG/C6Kmf
 f80Q==
X-Gm-Message-State: AOAM5334OVdKQRV0s0mbodgTdS2L5Cag06fR1sVH+L99s4oNsE3vULlE
 OGrncz7tkBV+SWPpcZgjrP8=
X-Google-Smtp-Source: ABdhPJxG/O+DXFZrKbOOb9D7OMPqLtfaSjP3VmOMdaHB9bLUcEKRq0qMgqeIFo8nWaTNDah0q10dGw==
X-Received: by 2002:a65:480a:: with SMTP id h10mr10658620pgs.63.1619902945848; 
 Sat, 01 May 2021 14:02:25 -0700 (PDT)
Received: from localhost (g17.222-224-135.ppp.wakwak.ne.jp. [222.224.135.17])
 by smtp.gmail.com with ESMTPSA id
 x90sm14110106pjj.55.2021.05.01.14.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 14:02:24 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Sun,  2 May 2021 06:02:13 +0900
Message-Id: <20210501210217.2975268-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 0/4] OpenRISC large binary fixes
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q2hhbmdlcyBzaW5jZSB2MToKIC0gUmVwbGFjZWQgcGF0Y2hlcyAzLzQgd2l0aCBhIGRpZmZlcmVu
dCBhcHByb2FjaC4gIEluc3RlYWQgb2YgcmVseWluZyBvbiBzZWVpbmcKICAgUl9PUjFLX0dPVF9B
SEkxNiByZWxvY2F0aW9ucyB0byBlbmFibGUgbGFyZ2UgcGx0cywgSSBqdXN0IHRyYWNrIHRoZSBQ
TFQgZW50cnkKICAgY291bnQgYW5kIHN3aXRjaCB0byBsYXJnZSBQTFQgd2hlbiB3ZSBkZXRlY3Qg
dGhlIG92ZXJmbG93IHdpbGwgb2NjdXIuCiAtIFBhdGNoICJBdm9pZCBSX09SMUtfR09UMTYgb3Zl
cmZsb3cgZmFpbHVyZXMgaW4gcHJlc2VuY2Ugb2YgUl9PUjFLX0dPVF9BSEkxNiIKICAgaXMgdGhl
IGFjdHVhbCBidWcgZml4IGZvciAyMTQ2NCwgd2hpY2ggd2FzIG1pc3NlZCBpbiB0aGUgb3JpZ2lu
YWwgc2VyaWVzLiAgV2UKICAgaW5oaWJpdCB0cnVuY2F0aW9uIGRldGVjdGlvbiB3aGVuIHRoZSBs
b3cgZ290KCkgcmVsb2NhdGlvbiBpcyBwYWlyZWQgd2l0aCB0aGUKICAgbmV3IGhpZ2ggZ290aGEo
KSByZWxvY2F0aW9uLgoKVGhlc2UgYXJlIHNldmVyYWwgZml4ZXMgdG8gT3BlblJJU0MgQkZEIHRv
IGhhbmRsZSBpc3N1ZXMgbW9zdGx5IHJlbGF0ZWQgdG8KbGlua2luZyBsYXJnZSBmaWxlcy4KClRo
ZXJlIHdpbGwgYmUgYSBHQ0MgcGF0Y2ggdGhlbiBkZXBlbmRzIG9uIHRoaXMsIGEgbmV3IC1tY21v
ZGVsPWxhcmdlIGFyZ3VtZW50IGlzCmFkZGVkIHRvIEdDQyB0byBhbGxvdyBjcmVhdGluZyBHT1Qg
cmVsb2NhdGlvbiB2YWx1ZXMgbGFyZ2VyIHRoYW4gNjRrLgoKVGhlIHNlcmllcyBmaXhlcyAzIGlz
c3VlczoKCiAqIFBSIDI3NjI0IC0gQXNzZXJ0aW9uIGZhaWx1cmUgd2hlbiBkeW5hbWljIHN5bW9s
IGlzIGxvY2FsaXplZAogKiBQUiAyMTQ2NCAtIEdPVCByZWxvY2F0aW9uIHRydW5jYXRpb24uCiAq
IFBSIDI3NzQ2IC0gSXNzdWUgd2l0aCBzaWxlbnQgb3Zlcmxvd3MgaW4gUExUIGNvZGUuCgpTdGFm
Zm9yZCBIb3JuZSAoNCk6CiAgb3IxazogRml4IGlzc3VlIHdpdGggcGx0IGxpbmsgZmFpbHVyZSBm
b3IgbG9jYWwgY2FsbHMKICBvcjFrOiBJbXBsZW1lbnQgcmVsb2NhdGlvbiBSX09SMUtfR09UX0FI
STE2IGZvciBnb3RoYSgpCiAgb3IxazogQXZvaWQgUl9PUjFLX0dPVDE2IG92ZXJmbG93IGZhaWx1
cmVzIGluIHByZXNlbmNlIG9mCiAgICBSX09SMUtfR09UX0FISTE2CiAgb3IxazogU3VwcG9ydCBs
YXJnZSBwbHRfcmVsb2NzIHdoZW4gZ2VuZXJhdGluZyBwbHQgZW50cmllcwoKIGJmZC9iZmQtaW4y
LmggICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGJmZC9lbGYzMi1vcjFrLmMgICAgICAgICAg
ICAgICAgIHwgMTkwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIGJmZC9saWJiZmQu
aCAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGJmZC9yZWxvYy5jICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICsKIGNwdS9vcjFrLm9wYyAgICAgICAgICAgICAgICAgICAgIHwgICA3ICst
CiBnYXMvdGVzdHN1aXRlL2dhcy9vcjFrL3JlbG9jLTEuZCB8ICAgNCArLQogZ2FzL3Rlc3RzdWl0
ZS9nYXMvb3Ixay9yZWxvYy0xLnMgfCAgIDQgKwogaW5jbHVkZS9lbGYvb3Ixay5oICAgICAgICAg
ICAgICAgfCAgIDEgKwogbGQvdGVzdHN1aXRlL2xkLW9yMWsvZ290aGExLmRkICAgfCAgMzQgKysr
KysrCiBsZC90ZXN0c3VpdGUvbGQtb3Ixay9nb3RoYTEucyAgICB8ICAyNCArKysrCiBsZC90ZXN0
c3VpdGUvbGQtb3Ixay9nb3RoYTIuZGQgICB8ICAyMSArKysrCiBsZC90ZXN0c3VpdGUvbGQtb3Ix
ay9nb3RoYTIucyAgICB8ICAyMiArKysrCiBsZC90ZXN0c3VpdGUvbGQtb3Ixay9vcjFrLmV4cCAg
ICB8ICAgOCArKwogbGQvdGVzdHN1aXRlL2xkLW9yMWsvcGx0bGliLnMgICAgfCAgIDEgKwogb3Bj
b2Rlcy9vcjFrLWFzbS5jICAgICAgICAgICAgICAgfCAgIDcgKy0KIDE1IGZpbGVzIGNoYW5nZWQs
IDI3OSBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBs
ZC90ZXN0c3VpdGUvbGQtb3Ixay9nb3RoYTEuZGQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsZC90ZXN0
c3VpdGUvbGQtb3Ixay9nb3RoYTEucwogY3JlYXRlIG1vZGUgMTAwNjQ0IGxkL3Rlc3RzdWl0ZS9s
ZC1vcjFrL2dvdGhhMi5kZAogY3JlYXRlIG1vZGUgMTAwNjQ0IGxkL3Rlc3RzdWl0ZS9sZC1vcjFr
L2dvdGhhMi5zCgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
