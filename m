Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4CB1DA2DF
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:38:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4EE5820B7E;
	Tue, 19 May 2020 22:38:21 +0200 (CEST)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id 3041220B6C
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:38:19 +0200 (CEST)
Received: by mail-pl1-f193.google.com with SMTP id u22so354563plq.12
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QHZ8NJ9g0fmCcb+/vfv0FRgPQRQYCW/QUBmwtXWAVoQ=;
 b=lq9lp1NY/PlIQDY7d33/4bCWi/4vr+gc0sc4Et+8gWYzS7zMRpdf5oYT4clHsnf3ce
 +LzBM9ukmQRCBddM6Ln9CVpDdUqKQWu7cH8EYQoupH7GVsx9y9PO0rNlU+pdj/KGqd12
 kb1yKgQ/YJjmWJChSLp8nSkZBmN2qQbNrIqU3WObcvTO9zukbD8rMOTUTi5RaVM8WIHp
 nelxNfD+RdlmfTyEqZmlZFMPs19LoHd+N2j/+SIVuCkJQCMelujJdVxoDMsqDBzzKNxx
 2+LjDGOuyq5ha6rlFmCRMOVIWowg3LjflvQPb9da3y2fz8b53kdyOKoiu3V2RN6gyqMr
 C12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QHZ8NJ9g0fmCcb+/vfv0FRgPQRQYCW/QUBmwtXWAVoQ=;
 b=ClKYGSn6Is6TGRposAzh+wwREy7Fqafd+vVvVqfzEO10QuWL2wd7gR7gJj5WKknqkB
 /ESuK9HWD6+Ot5fUuQcZHWO/bhqBIJz9Yaq158a26LxOTCK+CAD2DexcH91W+QFntfTs
 eIi0rIr9ATQ9oCJ0no6RAGvuYLMgbg98W9bAo9mK4crC/j21GEAM+m8SmFNt8ojBTuyy
 PhUdOmmaabhcEk0FEQesoHpsk/3d2hRZZEWniBJNnk4RZ6NgQGj+Z8vo7xhcgvpHG/Ul
 3PijSbtIeENDaMRFhTi9vuLp2tPdQY9FovD+KeQkBOA9NRPmUWgTQ6ZLsjrHuFQuH7ED
 MGBQ==
X-Gm-Message-State: AOAM53131FjQYAdewoFndci6LRs1floGQG8Tc3H3/1/3FfmZiozFw2cc
 OfErcm9Yb6lOSQYFABW1QV0=
X-Google-Smtp-Source: ABdhPJyg/cFxQqPp5wUsNTfdnOK2AVGHEQcupeiS1B7iZt6AD9y2MrgPvUX/u+53NWvkpNFL0zO9MA==
X-Received: by 2002:a17:902:b405:: with SMTP id
 x5mr1106585plr.31.1589920697814; 
 Tue, 19 May 2020 13:38:17 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id w69sm301332pff.168.2020.05.19.13.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:38:16 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed, 20 May 2020 05:37:48 +0900
Message-Id: <20200519203750.401593-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519203750.401593-1-shorne@gmail.com>
References: <20200519203750.401593-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 3/5] or1k: Support for softfloat to emulate hw
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
