Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE472F5548
	for <lists+openrisc@lfdr.de>; Thu, 14 Jan 2021 00:50:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1BB042109F;
	Thu, 14 Jan 2021 00:50:56 +0100 (CET)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mail.librecores.org (Postfix) with ESMTPS id 3DD3B20CA6
 for <openrisc@lists.librecores.org>; Thu, 14 Jan 2021 00:50:54 +0100 (CET)
Received: by mail-pg1-f175.google.com with SMTP id 30so2530536pgr.6
 for <openrisc@lists.librecores.org>; Wed, 13 Jan 2021 15:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QHZ8NJ9g0fmCcb+/vfv0FRgPQRQYCW/QUBmwtXWAVoQ=;
 b=cMswyAzy7iRFWJo035MeZ6FQbA9PcxYn33DlrRJh6KGN9NL6cFxnPKSJt8UBYInz26
 51TzJsHWFU/hzadRD/6wB52nPa1XtKPQ1+5gNzct2Qvic8I+IqDUsU3IsDQCXUIk/mdn
 7hcXgJGJupdYvogA9Q5XSE3bG2PN/qbjtyoxMnL5VsaL3AGbEBD4vBWu+kGzg6jCQ2MU
 J41owUq9BEncwUP/ZCuq+wCCOGro42kbLNpNyOIVrHRMykuKSy/3WT+HeaFCtuh6HP/I
 IfMNuobh973JWjRgUbT8d7IM76xvOAdFbFbYNH4ECq/VKDVFgYCP1fS3/cMeFUwBjd7o
 o6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QHZ8NJ9g0fmCcb+/vfv0FRgPQRQYCW/QUBmwtXWAVoQ=;
 b=rcyYPDq19pVHrB6PBlPBSsCuGz+dSCzgYkJx//13PcRgK4EM2RV0RF3+/kmdKfvgss
 LtpgS+Y4HWqztJz4DQT7/xi9F9hiHzCQl/J4EMwgx4RK5BAbscHoXVI0b3vZoa/4hy61
 Zh8fNV65TBW3KsH+IEXkRSh9WYVcsaB4qzW7BvG59/0A4bmXOMLnSEqJquh6po3+VtHm
 0EHHYzNDeYDDJU+tSeodEUTpN5+FOrInnYSANvaJENmH9Th6bh0dQeqpWwSpfFqMlE2T
 vJ5G4nbBblbb2VCztz/T/itYjMWg2gei54mPk7JOzbeFNo+4zRkFt/SIZ+XQ1RF1SJMF
 Qg0w==
X-Gm-Message-State: AOAM532honOWkxp+RNIG8Tu5uGcB3xLftY7MjUBIKdNqZ63QaIVner8j
 0Z57wxIdVmvRGYc0weLVUFCc/YH3A88=
X-Google-Smtp-Source: ABdhPJy+C0TKnxJyD1eodotq1vrr4AUaJQEYpBJGPL33lv4gM4J0/PfRDaqZ1fDH3oX9hc5aCtcdxA==
X-Received: by 2002:a63:d303:: with SMTP id b3mr4442736pgg.113.1610581852928; 
 Wed, 13 Jan 2021 15:50:52 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 19sm3580280pfn.133.2021.01.13.15.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 15:50:52 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 14 Jan 2021 08:50:30 +0900
Message-Id: <20210113235032.2821155-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113235032.2821155-1-shorne@gmail.com>
References: <20210113235032.2821155-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 3/5] or1k: Support for softfloat to emulate hw
 exceptions
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBhbGxvd3MgdGhlIG9wZW5yaXNjIHNvZnRmbG9hdCBpbXBsZW1lbnRhdGlvbiB0byBzZXQg
ZXhjZXB0aW9ucy4KVGhpcyBhbHNvIHNldHMgdGhlIGNvcnJlY3QgdGluaW5lc3MgYWZ0ZXIgcm91
bmRpbmcgdmFsdWUgdG8gYmUKY29uc2lzdGVudCB3aXRoIGhhcmR3YXJlIGFuZCBzaW11bGF0b3Ig
aW1wbGVtZW50YXRpb25zLgoKbGliZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFrL3NmcC1t
YWNoaW5lLmggKEZQX1JORF9ORUFSRVNULCBGUF9STkRfWkVSTywKCUZQX1JORF9QSU5GLCBGUF9S
TkRfTUlORiwgRlBfUk5EX01BU0ssIEZQX0VYX09WRVJGTE9XLAoJRlBfRVhfVU5ERVJGTE9XLCBG
UF9FWF9JTkVYQUNULCBGUF9FWF9JTlZBTElELCBGUF9FWF9ESVZaRVJPLAoJRlBfRVhfQUxMKTog
TmV3IGNvbnN0YW50IG1hY3Jvcy4KCShfRlBfREVDTF9FWCwgRlBfUk9VTkRNT0RFLCBGUF9JTklU
X1JPVU5ETU9ERSwKCUZQX0hBTkRMRV9FWENFUFRJT05TKTogTmV3IG1hY3Jvcy4KCShfRlBfVElO
SU5FU1NfQUZURVJfUk9VTkRJTkcpOiBDaGFuZ2UgdG8gMS4KLS0tCiBsaWJnY2MvY29uZmlnL29y
MWsvc2ZwLW1hY2hpbmUuaCB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2xpYmdjYy9jb25maWcvb3Ixay9zZnAtbWFjaGluZS5oIGIvbGliZ2NjL2NvbmZpZy9vcjFr
L3NmcC1tYWNoaW5lLmgKaW5kZXggNWRhOWU4NDk5MGQuLmVlYmU1YjA1NzhlIDEwMDY0NAotLS0g
YS9saWJnY2MvY29uZmlnL29yMWsvc2ZwLW1hY2hpbmUuaAorKysgYi9saWJnY2MvY29uZmlnL29y
MWsvc2ZwLW1hY2hpbmUuaApAQCAtNDEsMTIgKzQxLDUxIEBACiAgICAgUiMjX2MgPSBGUF9DTFNf
TkFOOwkJCQkJCVwKICAgfSB3aGlsZSAoMCkKIAorLyogSGFuZGxlIGdldHRpbmcgYW5kIHNldHRp
bmcgcm91bmRpbmcgbW9kZSBmb3Igc29mdCBmcCBvcGVyYXRpb25zLiAgKi8KKworI2RlZmluZSBG
UF9STkRfTkVBUkVTVAkJKDB4MCA8PCAxKQorI2RlZmluZSBGUF9STkRfWkVSTwkJKDB4MSA8PCAx
KQorI2RlZmluZSBGUF9STkRfUElORgkJKDB4MiA8PCAxKQorI2RlZmluZSBGUF9STkRfTUlORgkJ
KDB4MyA8PCAxKQorI2RlZmluZSBGUF9STkRfTUFTSwkJKDB4MyA8PCAxKQorCisjZGVmaW5lIEZQ
X0VYX09WRVJGTE9XCQkxIDw8IDMKKyNkZWZpbmUgRlBfRVhfVU5ERVJGTE9XCQkxIDw8IDQKKyNk
ZWZpbmUgRlBfRVhfSU5FWEFDVAkJMSA8PCA4CisjZGVmaW5lIEZQX0VYX0lOVkFMSUQJCTEgPDwg
OQorI2RlZmluZSBGUF9FWF9ESVZaRVJPCQkxIDw8IDExCisjZGVmaW5lIEZQX0VYX0FMTCBcCisJ
KEZQX0VYX0lOVkFMSUQgfCBGUF9FWF9ESVZaRVJPIHwgRlBfRVhfT1ZFUkZMT1cgfCBGUF9FWF9V
TkRFUkZMT1cgXAorCSB8IEZQX0VYX0lORVhBQ1QpCisKKyNkZWZpbmUgX0ZQX0RFQ0xfRVggXAor
ICB1bnNpZ25lZCBpbnQgX2ZwY3NyIF9fYXR0cmlidXRlX18gKCh1bnVzZWQpKSA9IEZQX1JORF9O
RUFSRVNUCisKKyNkZWZpbmUgRlBfUk9VTkRNT0RFIChfZnBjc3IgJiBGUF9STkRfTUFTSykKKwor
I2lmZGVmIF9fb3Ixa19oYXJkX2Zsb2F0X18KKyNkZWZpbmUgRlBfSU5JVF9ST1VORE1PREUJCQkJ
CVwKK2RvIHsJCQkJCQkJCVwKKyAgX19hc21fXyB2b2xhdGlsZSAoImwubWZzcHIgJTAscjAsMjAi
IDogIj1yIiAoX2ZwY3NyKSk7CVwKK30gd2hpbGUgKDApCisKKyNkZWZpbmUgRlBfSEFORExFX0VY
Q0VQVElPTlMJCQkJCVwKK2RvIHsJCQkJCQkJCVwKKyAgaWYgKF9fYnVpbHRpbl9leHBlY3QgKF9m
ZXgsIDApKQkJCQlcCisgICAgewkJCQkJCQkJXAorICAgICAgX2ZwY3NyICY9IH5GUF9FWF9BTEw7
CQkJCQlcCisgICAgICBfZnBjc3IgfD0gX2ZleDsJCQkJCQlcCisgICAgICBfX2FzbV9fIHZvbGF0
aWxlICgibC5tdHNwciByMCwlMCwyMCIgOiA6ICJyIiAoX2ZwY3NyKSk7CVwKKyAgICB9CQkJCQkJ
CQlcCit9IHdoaWxlICgwKQorI2VuZGlmCisKICNkZWZpbmUJX19MSVRUTEVfRU5ESUFOCTEyMzQK
ICNkZWZpbmUJX19CSUdfRU5ESUFOCTQzMjEKIAogI2RlZmluZSBfX0JZVEVfT1JERVIgX19CSUdf
RU5ESUFOCiAKLSNkZWZpbmUgX0ZQX1RJTklORVNTX0FGVEVSX1JPVU5ESU5HIDAKKyNkZWZpbmUg
X0ZQX1RJTklORVNTX0FGVEVSX1JPVU5ESU5HIDEKIAogLyogRGVmaW5lIEFMSUFTTkFNRSBhcyBh
IHN0cm9uZyBhbGlhcyBmb3IgTkFNRS4gICovCiAjIGRlZmluZSBzdHJvbmdfYWxpYXMobmFtZSwg
YWxpYXNuYW1lKSBfc3Ryb25nX2FsaWFzKG5hbWUsIGFsaWFzbmFtZSkKLS0gCjIuMjYuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
