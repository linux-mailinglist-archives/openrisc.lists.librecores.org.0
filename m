Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 347E5470EC5
	for <lists+openrisc@lfdr.de>; Sat, 11 Dec 2021 00:35:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 142EA242CD;
	Sat, 11 Dec 2021 00:35:29 +0100 (CET)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mail.librecores.org (Postfix) with ESMTPS id A2901242C9
 for <openrisc@lists.librecores.org>; Sat, 11 Dec 2021 00:35:27 +0100 (CET)
Received: by mail-pg1-f172.google.com with SMTP id s137so9303378pgs.5
 for <openrisc@lists.librecores.org>; Fri, 10 Dec 2021 15:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FapMdTMm0AMehIEeH6tl+lHViy/AGXttvuk5tURrLfY=;
 b=pJQ91lBeKLweDns+nO/X/oYAIpWPWDGNvpXjYGnTIHmP/5bJGwZq1AqoWrjCTWu+3V
 KWRHmDcCw50fmc1S6SpE+hkvI710V1PHklH2NCV3ov5IDXcShQ8Jq68lM1KZ7PNElwfW
 hjfjYeScrAF7ggAx9r+IsbEsgDtlCR+r8Op2l2CHwK+jEbR/q1eA20uiCu1S3UDAk3e3
 Y5rz/cddXEagAoJ54Y0v2vIn3sOrT6qWMRC/EcWYsKqa9UBglk8vSH8TSw07GdF470S5
 /sa9svVx93EWA75wjd8CU/vAH3lTyjNxcyUsFB7ZcrCfzN7Girq9ArF5GxIB8aHAKP/W
 ecHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FapMdTMm0AMehIEeH6tl+lHViy/AGXttvuk5tURrLfY=;
 b=PU9PKKhmhBnraSvJw6EVDvdMCkPwsO3LPIzbUUcF03EJ04coYz4yPSf6I8QiBAvyQn
 AcCwg7mC6eHpvt9jXM35ZljWrEC/QGZejg7/QzNIE0S+RMFiIvTP5X0B1QWsylGc/gky
 vrJ3o9EQXmPqVFm1JvTT5YBagTsCqaclbiIGQmi5vD7idHvLJfgywYtUbWPBQMD9iRWr
 nbYbXv8qwQyVXAlWCGtoS7uN3C+0UzK5o6D1mx4eVhlNe+Qs/iIoGNw/uX/XpQ5S/wE0
 bFGvN7gcRH1DIId72l9KzPME8tyN883SHgkkYKksVUcsEZMT2Tzh8m21dri2bQ20TZij
 amlA==
X-Gm-Message-State: AOAM533NC30Why5W4O/yWyIWWyFKAP9MUqaDRyFv3htH1fJJhYGtRP0F
 arz5sbLf0oqrUslafsRtlIjjhg53j00=
X-Google-Smtp-Source: ABdhPJw7Wn4m7wZ84Rs30H0JqwbsIEawyC93gD/Y9crhkkmKrU+C/lQ5euhH+Svk9KONuoQelegfog==
X-Received: by 2002:a63:6ac2:: with SMTP id
 f185mr41576435pgc.198.1639179325962; 
 Fri, 10 Dec 2021 15:35:25 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h6sm4351657pfh.82.2021.12.10.15.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 15:35:25 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 11 Dec 2021 08:34:50 +0900
Message-Id: <20211210233456.4146479-8-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210233456.4146479-1-shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 07/13] or1k: math soft float support
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

T3BlblJJU0Mgc3VwcG9ydCBoYXJkIGZsb2F0IGJ1dCBJIHdpbGwgbGlrZSB0byBzdWJtaXQgdGhh
dCBhZnRlciBnbGliYwpzb2Z0IGZsb2F0IGdvZXMgdXBzdHJlYW0uICBUaGUgaGFyZCBmbG9hdCBz
dXBwb3J0IGRlcGVuZHMgb24gYWRkaW5nIHVzZXIKYWNjZXNzIHRvIHRoZSBGUENTUiwgd2hpY2gg
aXMgbm90IHN1cHBvcnRlZCBieSB0aGUga2VybmVsIHlldC4KLS0tCiBzeXNkZXBzL29yMWsvYml0
cy9mZW52LmggICAgICAgICAgICAgICAgICAgfCAgIDY5ICsrCiBzeXNkZXBzL29yMWsvbGlibS10
ZXN0LXVscHMgICAgICAgICAgICAgICAgfCAxMTEyICsrKysrKysrKysrKysrKysrKysrCiBzeXNk
ZXBzL29yMWsvbGlibS10ZXN0LXVscHMtbmFtZSAgICAgICAgICAgfCAgICAxICsKIHN5c2RlcHMv
b3Ixay9ub2ZwdS9tYXRoLXRlc3RzLWV4Y2VwdGlvbnMuaCB8ICAgMjkgKwogc3lzZGVwcy9vcjFr
L25vZnB1L21hdGgtdGVzdHMtcm91bmRpbmcuaCAgIHwgICAyOCArCiBzeXNkZXBzL29yMWsvc2Zw
LW1hY2hpbmUuaCAgICAgICAgICAgICAgICAgfCAgIDkzICsrCiBzeXNkZXBzL29yMWsvdGluaW5l
c3MuaCAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIDcgZmlsZXMgY2hhbmdlZCwgMTMzMyBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2JpdHMvZmVudi5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2xpYm0tdGVzdC11bHBzCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2xpYm0tdGVzdC11bHBzLW5hbWUKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzeXNkZXBzL29yMWsvbm9mcHUvbWF0aC10ZXN0cy1leGNlcHRpb25zLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvbm9mcHUvbWF0aC10ZXN0cy1yb3VuZGluZy5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL3NmcC1tYWNoaW5lLmgKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzeXNkZXBzL29yMWsvdGluaW5lc3MuaAoKZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ix
ay9iaXRzL2ZlbnYuaCBiL3N5c2RlcHMvb3Ixay9iaXRzL2ZlbnYuaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi43MjExMzZhNTdkCi0tLSAvZGV2L251bGwKKysrIGIvc3lz
ZGVwcy9vcjFrL2JpdHMvZmVudi5oCkBAIC0wLDAgKzEsNjkgQEAKKy8qIEZsb2F0aW5nIHBvaW50
IGVudmlyb25tZW50LCBPcGVuUklTQyB2ZXJzaW9uLgorICAgQ29weXJpZ2h0IChDKSAyMDIxIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorCisgICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0
aGUgR05VIEMgTGlicmFyeS4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgICBtb2RpZnkgaXQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKKyAgIHB1
Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
LjEgb2YgdGhlCisgICBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJz
aW9uLgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0
aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAgIE1FUkNIQU5UQUJJTElUWSBvciBG
SVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisgICBMZXNzZXIg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCisgICBZb3Ugc2hvdWxk
IGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisg
ICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJhcnk7IGlmIG5vdCwgc2VlCisgICA8
aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KKworI2lmbmRlZiBfRkVOVl9ICisj
IGVycm9yICJOZXZlciB1c2UgPGJpdHMvZmVudi5oPiBkaXJlY3RseTsgaW5jbHVkZSA8ZmVudi5o
PiBpbnN0ZWFkLiIKKyNlbmRpZgorCisvKiBEZWZpbmUgYml0cyByZXByZXNlbnRpbmcgZXhjZXB0
aW9ucyBpbiB0aGUgRlBDU1Igc3RhdHVzIHdvcmQuICAqLworZW51bQorICB7CisgICAgRkVfT1ZF
UkZMT1cgPQorI2RlZmluZSBGRV9PVkVSRkxPVwkoMSA8PCAzKQorICAgICAgRkVfT1ZFUkZMT1cs
CisgICAgRkVfVU5ERVJGTE9XID0KKyNkZWZpbmUgRkVfVU5ERVJGTE9XCSgxIDw8IDQpCisgICAg
ICBGRV9VTkRFUkZMT1csCisgICAgRkVfSU5FWEFDVCA9CisjZGVmaW5lIEZFX0lORVhBQ1QJKDEg
PDwgOCkKKyAgICAgIEZFX0lORVhBQ1QsCisgICAgRkVfSU5WQUxJRCA9CisjZGVmaW5lIEZFX0lO
VkFMSUQJKDEgPDwgOSkKKyAgICAgIEZFX0lOVkFMSUQsCisgICAgRkVfRElWQllaRVJPID0KKyNk
ZWZpbmUgRkVfRElWQllaRVJPCSgxIDw8IDExKQorICAgICAgRkVfRElWQllaRVJPLAorICB9Owor
CisvKiBBbGwgc3VwcG9ydGVkIGV4Y2VwdGlvbnMuICAqLworI2RlZmluZSBGRV9BTExfRVhDRVBU
CVwKKwkoRkVfSU5WQUxJRCB8IEZFX0RJVkJZWkVSTyB8IEZFX09WRVJGTE9XIHwgRkVfVU5ERVJG
TE9XIHwgRkVfSU5FWEFDVCkKKworLyogRGVmaW5lIGJpdHMgcmVwcmVzZW50aW5nIHJvdW5kaW5n
IG1vZGVzIGluIHRoZSBGUENTUiBSbW9kZSBmaWVsZC4gICovCisjZGVmaW5lIEZFX1RPTkVBUkVT
VCAgKDB4MCA8PCAxKQorI2RlZmluZSBGRV9UT1dBUkRaRVJPICgweDEgPDwgMSkKKyNkZWZpbmUg
RkVfVVBXQVJEICAgICAoMHgyIDw8IDEpCisjZGVmaW5lIEZFX0RPV05XQVJEICAgKDB4MyA8PCAx
KQorCisvKiBUeXBlIHJlcHJlc2VudGluZyBleGNlcHRpb24gZmxhZ3MuICAqLwordHlwZWRlZiB1
bnNpZ25lZCBpbnQgZmV4Y2VwdF90OworCisvKiBUeXBlIHJlcHJlc2VudGluZyBmbG9hdGluZy1w
b2ludCBlbnZpcm9ubWVudC4gICovCit0eXBlZGVmIHVuc2lnbmVkIGludCBmZW52X3Q7CisKKy8q
IElmIHRoZSBkZWZhdWx0IGFyZ3VtZW50IGlzIHVzZWQgd2UgdXNlIHRoaXMgdmFsdWUuICAqLwor
I2RlZmluZSBGRV9ERkxfRU5WCSgoY29uc3QgZmVudl90ICopIC0xbCkKKworI2lmIF9fR0xJQkNf
VVNFIChJRUNfNjA1NTlfQkZQX0VYVCkKKy8qIFR5cGUgcmVwcmVzZW50aW5nIGZsb2F0aW5nLXBv
aW50IGNvbnRyb2wgbW9kZXMuICAqLwordHlwZWRlZiB1bnNpZ25lZCBpbnQgZmVtb2RlX3Q7CisK
Ky8qIERlZmF1bHQgZmxvYXRpbmctcG9pbnQgY29udHJvbCBtb2Rlcy4gICovCisjIGRlZmluZSBG
RV9ERkxfTU9ERQkoKGNvbnN0IGZlbW9kZV90ICopIC0xTCkKKyNlbmRpZgpkaWZmIC0tZ2l0IGEv
c3lzZGVwcy9vcjFrL2xpYm0tdGVzdC11bHBzIGIvc3lzZGVwcy9vcjFrL2xpYm0tdGVzdC11bHBz
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjk0YjM4MzY2OWQKLS0tIC9k
ZXYvbnVsbAorKysgYi9zeXNkZXBzL29yMWsvbGlibS10ZXN0LXVscHMKQEAgLTAsMCArMSwxMTEy
IEBACisjIEJlZ2luIG9mIGF1dG9tYXRpYyBnZW5lcmF0aW9uCisKKyMgTWF4aW1hbCBlcnJvciBv
ZiBmdW5jdGlvbnM6CitGdW5jdGlvbjogImFjb3MiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitG
dW5jdGlvbjogImFjb3NfZG93bndhcmQiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlv
bjogImFjb3NfdG93YXJkemVybyI6Citkb3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAi
YWNvc191cHdhcmQiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogImFjb3NoIjoK
K2RvdWJsZTogMgorZmxvYXQ6IDIKKworRnVuY3Rpb246ICJhY29zaF9kb3dud2FyZCI6Citkb3Vi
bGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAiYWNvc2hfdG93YXJkemVybyI6Citkb3VibGU6
IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAiYWNvc2hfdXB3YXJkIjoKK2RvdWJsZTogMgorZmxv
YXQ6IDIKKworRnVuY3Rpb246ICJhc2luIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rp
b246ICJhc2luX2Rvd253YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJh
c2luX3Rvd2FyZHplcm8iOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogImFzaW5f
dXB3YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJhc2luaCI6Citkb3Vi
bGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAiYXNpbmhfZG93bndhcmQiOgorZG91YmxlOiAz
CitmbG9hdDogMworCitGdW5jdGlvbjogImFzaW5oX3Rvd2FyZHplcm8iOgorZG91YmxlOiAyCitm
bG9hdDogMgorCitGdW5jdGlvbjogImFzaW5oX3Vwd2FyZCI6Citkb3VibGU6IDMKK2Zsb2F0OiAz
CisKK0Z1bmN0aW9uOiAiYXRhbiI6Citkb3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAi
YXRhbjIiOgorZmxvYXQ6IDIKKworRnVuY3Rpb246ICJhdGFuMl9kb3dud2FyZCI6Citkb3VibGU6
IDUKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAiYXRhbjJfdG93YXJkemVybyI6Citkb3VibGU6IDUK
K2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAiYXRhbjJfdXB3YXJkIjoKK2RvdWJsZTogOAorZmxvYXQ6
IDIKKworRnVuY3Rpb246ICJhdGFuX2Rvd253YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDIKKwor
RnVuY3Rpb246ICJhdGFuX3Rvd2FyZHplcm8iOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5j
dGlvbjogImF0YW5fdXB3YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDIKKworRnVuY3Rpb246ICJh
dGFuaCI6Citkb3VibGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAiYXRhbmhfZG93bndhcmQi
OgorZG91YmxlOiAzCitmbG9hdDogMworCitGdW5jdGlvbjogImF0YW5oX3Rvd2FyZHplcm8iOgor
ZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogImF0YW5oX3Vwd2FyZCI6Citkb3VibGU6
IDMKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiAiY2FicyI6Citkb3VibGU6IDEKKworRnVuY3Rpb246
ICJjYWJzX2Rvd253YXJkIjoKK2RvdWJsZTogMQorCitGdW5jdGlvbjogImNhYnNfdG93YXJkemVy
byI6Citkb3VibGU6IDEKKworRnVuY3Rpb246ICJjYWJzX3Vwd2FyZCI6Citkb3VibGU6IDEKKwor
RnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2Fjb3MiOgorZG91YmxlOiAxCitmbG9hdDogMgorCitG
dW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhY29zIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIK
KworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2Fjb3NfZG93bndhcmQiOgorZG91YmxlOiAzCitm
bG9hdDogMgorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhY29zX2Rvd253YXJkIjoK
K2RvdWJsZTogNQorZmxvYXQ6IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2Fjb3NfdG93
YXJkemVybyI6Citkb3VibGU6IDMKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFy
dCBvZiAiY2Fjb3NfdG93YXJkemVybyI6Citkb3VibGU6IDQKK2Zsb2F0OiAyCisKK0Z1bmN0aW9u
OiBSZWFsIHBhcnQgb2YgImNhY29zX3Vwd2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0OiAyCisKK0Z1
bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2Fjb3NfdXB3YXJkIjoKK2RvdWJsZTogNQorZmxv
YXQ6IDcKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2Fjb3NoIjoKK2RvdWJsZTogMgorZmxv
YXQ6IDIKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjYWNvc2giOgorZG91YmxlOiAx
CitmbG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjYWNvc2hfZG93bndhcmQiOgor
ZG91YmxlOiA0CitmbG9hdDogMgorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhY29z
aF9kb3dud2FyZCI6Citkb3VibGU6IDMKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQg
b2YgImNhY29zaF90b3dhcmR6ZXJvIjoKK2RvdWJsZTogNAorZmxvYXQ6IDIKKworRnVuY3Rpb246
IEltYWdpbmFyeSBwYXJ0IG9mICJjYWNvc2hfdG93YXJkemVybyI6Citkb3VibGU6IDMKK2Zsb2F0
OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNhY29zaF91cHdhcmQiOgorZG91YmxlOiA0
CitmbG9hdDogMworCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhY29zaF91cHdhcmQi
OgorZG91YmxlOiAzCitmbG9hdDogMgorCitGdW5jdGlvbjogImNhcmciOgorZmxvYXQ6IDEKKwor
RnVuY3Rpb246ICJjYXJnX2Rvd253YXJkIjoKK2RvdWJsZTogNQorZmxvYXQ6IDIKKworRnVuY3Rp
b246ICJjYXJnX3Rvd2FyZHplcm8iOgorZG91YmxlOiA1CitmbG9hdDogMgorCitGdW5jdGlvbjog
ImNhcmdfdXB3YXJkIjoKK2RvdWJsZTogOAorZmxvYXQ6IDIKKworRnVuY3Rpb246IFJlYWwgcGFy
dCBvZiAiY2FzaW4iOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogSW1hZ2luYXJ5
IHBhcnQgb2YgImNhc2luIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIKKworRnVuY3Rpb246IFJlYWwg
cGFydCBvZiAiY2FzaW5fZG93bndhcmQiOgorZG91YmxlOiAzCitmbG9hdDogMgorCitGdW5jdGlv
bjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhc2luX2Rvd253YXJkIjoKK2RvdWJsZTogNQorZmxvYXQ6
IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2FzaW5fdG93YXJkemVybyI6Citkb3VibGU6
IDMKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2FzaW5fdG93YXJk
emVybyI6Citkb3VibGU6IDQKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNh
c2luX3Vwd2FyZCI6Citkb3VibGU6IDMKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkg
cGFydCBvZiAiY2FzaW5fdXB3YXJkIjoKK2RvdWJsZTogNQorZmxvYXQ6IDcKKworRnVuY3Rpb246
IFJlYWwgcGFydCBvZiAiY2FzaW5oIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIKKworRnVuY3Rpb246
IEltYWdpbmFyeSBwYXJ0IG9mICJjYXNpbmgiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5j
dGlvbjogUmVhbCBwYXJ0IG9mICJjYXNpbmhfZG93bndhcmQiOgorZG91YmxlOiA1CitmbG9hdDog
MworCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhc2luaF9kb3dud2FyZCI6Citkb3Vi
bGU6IDMKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNhc2luaF90b3dhcmR6
ZXJvIjoKK2RvdWJsZTogNAorZmxvYXQ6IDIKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9m
ICJjYXNpbmhfdG93YXJkemVybyI6Citkb3VibGU6IDMKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiBS
ZWFsIHBhcnQgb2YgImNhc2luaF91cHdhcmQiOgorZG91YmxlOiA1CitmbG9hdDogNworCitGdW5j
dGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhc2luaF91cHdhcmQiOgorZG91YmxlOiAzCitmbG9h
dDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjYXRhbiI6Citkb3VibGU6IDEKK2Zsb2F0
OiAxCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2F0YW4iOgorZG91YmxlOiAxCitm
bG9hdDogMQorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjYXRhbl9kb3dud2FyZCI6Citkb3Vi
bGU6IDEKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2F0YW5fZG93
bndhcmQiOgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJj
YXRhbl90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorZmxvYXQ6IDIKKworRnVuY3Rpb246IEltYWdp
bmFyeSBwYXJ0IG9mICJjYXRhbl90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIKKwor
RnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2F0YW5fdXB3YXJkIjoKK2RvdWJsZTogMgorZmxvYXQ6
IDEKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjYXRhbl91cHdhcmQiOgorZG91Ymxl
OiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjYXRhbmgiOgorZG91Ymxl
OiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhdGFuaCI6Citk
b3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNhdGFuaF9kb3du
d2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBv
ZiAiY2F0YW5oX2Rvd253YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDIKKworRnVuY3Rpb246IFJl
YWwgcGFydCBvZiAiY2F0YW5oX3Rvd2FyZHplcm8iOgorZG91YmxlOiAyCitmbG9hdDogMgorCitG
dW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNhdGFuaF90b3dhcmR6ZXJvIjoKK2RvdWJsZTog
MQorZmxvYXQ6IDIKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2F0YW5oX3Vwd2FyZCI6Citk
b3VibGU6IDQKK2Zsb2F0OiA0CisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2F0YW5o
X3Vwd2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAiY2JydCI6Citkb3Vi
bGU6IDQKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAiY2JydF9kb3dud2FyZCI6Citkb3VibGU6IDQK
K2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAiY2JydF90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMworZmxv
YXQ6IDEKKworRnVuY3Rpb246ICJjYnJ0X3Vwd2FyZCI6Citkb3VibGU6IDUKK2Zsb2F0OiAxCisK
K0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNjb3MiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitG
dW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNjb3MiOgorZG91YmxlOiAxCitmbG9hdDogMQor
CitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjY29zX2Rvd253YXJkIjoKK2RvdWJsZTogMworZmxv
YXQ6IDEKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjY29zX2Rvd253YXJkIjoKK2Rv
dWJsZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2Nvc190b3dhcmR6
ZXJvIjoKK2RvdWJsZTogMworZmxvYXQ6IDIKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9m
ICJjY29zX3Rvd2FyZHplcm8iOgorZG91YmxlOiAzCitmbG9hdDogMworCitGdW5jdGlvbjogUmVh
bCBwYXJ0IG9mICJjY29zX3Vwd2FyZCI6Citkb3VibGU6IDEKK2Zsb2F0OiAyCisKK0Z1bmN0aW9u
OiBJbWFnaW5hcnkgcGFydCBvZiAiY2Nvc191cHdhcmQiOgorZG91YmxlOiAyCitmbG9hdDogMgor
CitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjY29zaCI6Citkb3VibGU6IDIKK2Zsb2F0OiAxCisK
K0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2Nvc2giOgorZG91YmxlOiAxCitmbG9hdDog
MQorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjY29zaF9kb3dud2FyZCI6Citkb3VibGU6IDMK
K2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2Nvc2hfZG93bndhcmQi
OgorZG91YmxlOiAzCitmbG9hdDogMworCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjY29zaF90
b3dhcmR6ZXJvIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246IEltYWdpbmFyeSBw
YXJ0IG9mICJjY29zaF90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVuY3Rp
b246IFJlYWwgcGFydCBvZiAiY2Nvc2hfdXB3YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDIKKwor
RnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjY29zaF91cHdhcmQiOgorZG91YmxlOiAyCitm
bG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjZXhwIjoKK2RvdWJsZTogMgorZmxv
YXQ6IDEKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjZXhwIjoKK2RvdWJsZTogMQor
ZmxvYXQ6IDIKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2V4cF9kb3dud2FyZCI6Citkb3Vi
bGU6IDQKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2V4cF9kb3du
d2FyZCI6Citkb3VibGU6IDMKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNl
eHBfdG93YXJkemVybyI6Citkb3VibGU6IDQKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5h
cnkgcGFydCBvZiAiY2V4cF90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVu
Y3Rpb246IFJlYWwgcGFydCBvZiAiY2V4cF91cHdhcmQiOgorZG91YmxlOiAyCitmbG9hdDogMgor
CitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNleHBfdXB3YXJkIjoKK2RvdWJsZTogMwor
ZmxvYXQ6IDIKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2xvZyI6Citkb3VibGU6IDMKK2Zs
b2F0OiAzCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2xvZyI6Citkb3VibGU6IDEK
K2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNsb2cxMCI6Citkb3VibGU6IDMK
K2Zsb2F0OiA0CisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2xvZzEwIjoKK2RvdWJs
ZTogMgorZmxvYXQ6IDIKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2xvZzEwX2Rvd253YXJk
IjoKK2RvdWJsZTogNworZmxvYXQ6IDUKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJj
bG9nMTBfZG93bndhcmQiOgorZG91YmxlOiA4CitmbG9hdDogNAorCitGdW5jdGlvbjogUmVhbCBw
YXJ0IG9mICJjbG9nMTBfdG93YXJkemVybyI6Citkb3VibGU6IDUKK2Zsb2F0OiA1CisKK0Z1bmN0
aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2xvZzEwX3Rvd2FyZHplcm8iOgorZG91YmxlOiA4Citm
bG9hdDogNAorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjbG9nMTBfdXB3YXJkIjoKK2RvdWJs
ZTogNgorZmxvYXQ6IDUKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjbG9nMTBfdXB3
YXJkIjoKK2RvdWJsZTogNQorZmxvYXQ6IDQKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2xv
Z19kb3dud2FyZCI6Citkb3VibGU6IDQKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkg
cGFydCBvZiAiY2xvZ19kb3dud2FyZCI6Citkb3VibGU6IDUKK2Zsb2F0OiAyCisKK0Z1bmN0aW9u
OiBSZWFsIHBhcnQgb2YgImNsb2dfdG93YXJkemVybyI6Citkb3VibGU6IDgKK2Zsb2F0OiA0CisK
K0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY2xvZ190b3dhcmR6ZXJvIjoKK2RvdWJsZTog
NQorZmxvYXQ6IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY2xvZ191cHdhcmQiOgorZG91
YmxlOiA4CitmbG9hdDogMworCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNsb2dfdXB3
YXJkIjoKK2RvdWJsZTogOAorZmxvYXQ6IDIKKworRnVuY3Rpb246ICJjb3MiOgorZG91YmxlOiAx
CitmbG9hdDogMQorCitGdW5jdGlvbjogImNvc19kb3dud2FyZCI6Citkb3VibGU6IDEKK2Zsb2F0
OiAxCisKK0Z1bmN0aW9uOiAiY29zX3Rvd2FyZHplcm8iOgorZG91YmxlOiA0CitmbG9hdDogMQor
CitGdW5jdGlvbjogImNvc191cHdhcmQiOgorZG91YmxlOiA0CitmbG9hdDogMQorCitGdW5jdGlv
bjogImNvc2giOgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogImNvc2hfZG93bndh
cmQiOgorZG91YmxlOiAyCitmbG9hdDogMQorCitGdW5jdGlvbjogImNvc2hfdG93YXJkemVybyI6
Citkb3VibGU6IDIKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAiY29zaF91cHdhcmQiOgorZG91Ymxl
OiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjcG93IjoKK2RvdWJsZTog
MgorZmxvYXQ6IDUKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjcG93IjoKK2Zsb2F0
OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNwb3dfZG93bndhcmQiOgorZG91YmxlOiA1
CitmbG9hdDogOAorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNwb3dfZG93bndhcmQi
OgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjcG93X3Rv
d2FyZHplcm8iOgorZG91YmxlOiA1CitmbG9hdDogOAorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBh
cnQgb2YgImNwb3dfdG93YXJkemVybyI6Citkb3VibGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9u
OiBSZWFsIHBhcnQgb2YgImNwb3dfdXB3YXJkIjoKK2RvdWJsZTogNAorZmxvYXQ6IDEKKworRnVu
Y3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjcG93X3Vwd2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0
OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImNzaW4iOgorZG91YmxlOiAxCitmbG9hdDog
MQorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjc2luX2Rvd253YXJkIjoKK2RvdWJsZTogMwor
ZmxvYXQ6IDMKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjc2luX2Rvd253YXJkIjoK
K2RvdWJsZTogMworZmxvYXQ6IDEKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY3Npbl90b3dh
cmR6ZXJvIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0
IG9mICJjc2luX3Rvd2FyZHplcm8iOgorZG91YmxlOiAzCitmbG9hdDogMQorCitGdW5jdGlvbjog
UmVhbCBwYXJ0IG9mICJjc2luX3Vwd2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0
aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY3Npbl91cHdhcmQiOgorZG91YmxlOiAxCitmbG9hdDog
MgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjc2luaCI6CitmbG9hdDogMQorCitGdW5jdGlv
bjogSW1hZ2luYXJ5IHBhcnQgb2YgImNzaW5oIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVu
Y3Rpb246IFJlYWwgcGFydCBvZiAiY3NpbmhfZG93bndhcmQiOgorZG91YmxlOiAzCitmbG9hdDog
MQorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNzaW5oX2Rvd253YXJkIjoKK2RvdWJs
ZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY3NpbmhfdG93YXJkemVy
byI6Citkb3VibGU6IDMKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAi
Y3NpbmhfdG93YXJkemVybyI6Citkb3VibGU6IDMKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiBSZWFs
IHBhcnQgb2YgImNzaW5oX3Vwd2FyZCI6Citkb3VibGU6IDEKK2Zsb2F0OiAyCisKK0Z1bmN0aW9u
OiBJbWFnaW5hcnkgcGFydCBvZiAiY3NpbmhfdXB3YXJkIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIK
KworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY3NxcnQiOgorZG91YmxlOiAyCitmbG9hdDogMgor
CitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNzcXJ0IjoKK2RvdWJsZTogMgorZmxvYXQ6
IDIKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY3NxcnRfZG93bndhcmQiOgorZG91YmxlOiA1
CitmbG9hdDogNAorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImNzcXJ0X2Rvd253YXJk
IjoKK2RvdWJsZTogNAorZmxvYXQ6IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY3NxcnRf
dG93YXJkemVybyI6Citkb3VibGU6IDQKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkg
cGFydCBvZiAiY3NxcnRfdG93YXJkemVybyI6Citkb3VibGU6IDQKK2Zsb2F0OiAzCisKK0Z1bmN0
aW9uOiBSZWFsIHBhcnQgb2YgImNzcXJ0X3Vwd2FyZCI6Citkb3VibGU6IDUKK2Zsb2F0OiA0CisK
K0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY3NxcnRfdXB3YXJkIjoKK2RvdWJsZTogMwor
ZmxvYXQ6IDMKKworRnVuY3Rpb246IFJlYWwgcGFydCBvZiAiY3RhbiI6Citkb3VibGU6IDEKK2Zs
b2F0OiAxCisKK0Z1bmN0aW9uOiBJbWFnaW5hcnkgcGFydCBvZiAiY3RhbiI6Citkb3VibGU6IDIK
K2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImN0YW5fZG93bndhcmQiOgorZG91
YmxlOiA2CitmbG9hdDogNQorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImN0YW5fZG93
bndhcmQiOgorZG91YmxlOiAzCitmbG9hdDogMgorCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJj
dGFuX3Rvd2FyZHplcm8iOgorZG91YmxlOiA1CitmbG9hdDogMworCitGdW5jdGlvbjogSW1hZ2lu
YXJ5IHBhcnQgb2YgImN0YW5fdG93YXJkemVybyI6Citkb3VibGU6IDMKK2Zsb2F0OiAyCisKK0Z1
bmN0aW9uOiBSZWFsIHBhcnQgb2YgImN0YW5fdXB3YXJkIjoKK2RvdWJsZTogMgorZmxvYXQ6IDQK
KworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjdGFuX3Vwd2FyZCI6Citkb3VibGU6IDIK
K2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImN0YW5oIjoKK2RvdWJsZTogMgor
ZmxvYXQ6IDIKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjdGFuaCI6Citkb3VibGU6
IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQgb2YgImN0YW5oX2Rvd253YXJkIjoK
K2RvdWJsZTogMworZmxvYXQ6IDIKKworRnVuY3Rpb246IEltYWdpbmFyeSBwYXJ0IG9mICJjdGFu
aF9kb3dud2FyZCI6Citkb3VibGU6IDYKK2Zsb2F0OiA1CisKK0Z1bmN0aW9uOiBSZWFsIHBhcnQg
b2YgImN0YW5oX3Rvd2FyZHplcm8iOgorZG91YmxlOiAzCitmbG9hdDogMgorCitGdW5jdGlvbjog
SW1hZ2luYXJ5IHBhcnQgb2YgImN0YW5oX3Rvd2FyZHplcm8iOgorZG91YmxlOiA1CitmbG9hdDog
MworCitGdW5jdGlvbjogUmVhbCBwYXJ0IG9mICJjdGFuaF91cHdhcmQiOgorZG91YmxlOiAyCitm
bG9hdDogMgorCitGdW5jdGlvbjogSW1hZ2luYXJ5IHBhcnQgb2YgImN0YW5oX3Vwd2FyZCI6Citk
b3VibGU6IDIKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiAiZXJmIjoKK2RvdWJsZTogMQorZmxvYXQ6
IDEKKworRnVuY3Rpb246ICJlcmZfZG93bndhcmQiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitG
dW5jdGlvbjogImVyZl90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rp
b246ICJlcmZfdXB3YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJlcmZj
IjoKK2RvdWJsZTogNQorZmxvYXQ6IDMKKworRnVuY3Rpb246ICJlcmZjX2Rvd253YXJkIjoKK2Rv
dWJsZTogNQorZmxvYXQ6IDYKKworRnVuY3Rpb246ICJlcmZjX3Rvd2FyZHplcm8iOgorZG91Ymxl
OiAzCitmbG9hdDogNAorCitGdW5jdGlvbjogImVyZmNfdXB3YXJkIjoKK2RvdWJsZTogNQorZmxv
YXQ6IDYKKworRnVuY3Rpb246ICJleHAiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlv
bjogImV4cDEwIjoKK2RvdWJsZTogMgorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJleHAxMF9kb3du
d2FyZCI6Citkb3VibGU6IDMKKworRnVuY3Rpb246ICJleHAxMF90b3dhcmR6ZXJvIjoKK2RvdWJs
ZTogMworCitGdW5jdGlvbjogImV4cDEwX3Vwd2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0OiAxCisK
K0Z1bmN0aW9uOiAiZXhwMiI6Citkb3VibGU6IDEKKworRnVuY3Rpb246ICJleHAyX2Rvd253YXJk
IjoKK2RvdWJsZTogMQorCitGdW5jdGlvbjogImV4cDJfdG93YXJkemVybyI6Citkb3VibGU6IDEK
KworRnVuY3Rpb246ICJleHAyX3Vwd2FyZCI6Citkb3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1bmN0
aW9uOiAiZXhwX2Rvd253YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJl
eHBfdG93YXJkemVybyI6Citkb3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAiZXhwX3Vw
d2FyZCI6Citkb3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAiZXhwbTEiOgorZG91Ymxl
OiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogImV4cG0xX2Rvd253YXJkIjoKK2RvdWJsZTogMQor
ZmxvYXQ6IDEKKworRnVuY3Rpb246ICJleHBtMV90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorZmxv
YXQ6IDIKKworRnVuY3Rpb246ICJleHBtMV91cHdhcmQiOgorZG91YmxlOiAxCitmbG9hdDogMQor
CitGdW5jdGlvbjogImdhbW1hIjoKK2RvdWJsZTogNAorZmxvYXQ6IDcKKworRnVuY3Rpb246ICJn
YW1tYV9kb3dud2FyZCI6Citkb3VibGU6IDcKK2Zsb2F0OiA3CisKK0Z1bmN0aW9uOiAiZ2FtbWFf
dG93YXJkemVybyI6Citkb3VibGU6IDcKK2Zsb2F0OiA3CisKK0Z1bmN0aW9uOiAiZ2FtbWFfdXB3
YXJkIjoKK2RvdWJsZTogNQorZmxvYXQ6IDYKKworRnVuY3Rpb246ICJoeXBvdCI6Citkb3VibGU6
IDEKKworRnVuY3Rpb246ICJoeXBvdF9kb3dud2FyZCI6Citkb3VibGU6IDEKKworRnVuY3Rpb246
ICJoeXBvdF90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorCitGdW5jdGlvbjogImh5cG90X3Vwd2Fy
ZCI6Citkb3VibGU6IDEKKworRnVuY3Rpb246ICJqMCI6Citkb3VibGU6IDIKK2Zsb2F0OiA5CisK
K0Z1bmN0aW9uOiAiajBfZG93bndhcmQiOgorZG91YmxlOiAyCitmbG9hdDogNAorCitGdW5jdGlv
bjogImowX3Rvd2FyZHplcm8iOgorZG91YmxlOiA0CitmbG9hdDogNQorCitGdW5jdGlvbjogImow
X3Vwd2FyZCI6Citkb3VibGU6IDQKK2Zsb2F0OiA1CisKK0Z1bmN0aW9uOiAiajEiOgorZG91Ymxl
OiA0CitmbG9hdDogOQorCitGdW5jdGlvbjogImoxX2Rvd253YXJkIjoKK2RvdWJsZTogNAorZmxv
YXQ6IDUKKworRnVuY3Rpb246ICJqMV90b3dhcmR6ZXJvIjoKK2RvdWJsZTogNAorZmxvYXQ6IDIK
KworRnVuY3Rpb246ICJqMV91cHdhcmQiOgorZG91YmxlOiAzCitmbG9hdDogNQorCitGdW5jdGlv
bjogImpuIjoKK2RvdWJsZTogNAorZmxvYXQ6IDQKKworRnVuY3Rpb246ICJqbl9kb3dud2FyZCI6
Citkb3VibGU6IDcKK2Zsb2F0OiA5CisKK0Z1bmN0aW9uOiAiam5fdG93YXJkemVybyI6Citkb3Vi
bGU6IDcKK2Zsb2F0OiA5CisKK0Z1bmN0aW9uOiAiam5fdXB3YXJkIjoKK2RvdWJsZTogNworZmxv
YXQ6IDkKKworRnVuY3Rpb246ICJsZ2FtbWEiOgorZG91YmxlOiA0CitmbG9hdDogNworCitGdW5j
dGlvbjogImxnYW1tYV9kb3dud2FyZCI6Citkb3VibGU6IDcKK2Zsb2F0OiA3CisKK0Z1bmN0aW9u
OiAibGdhbW1hX3Rvd2FyZHplcm8iOgorZG91YmxlOiA3CitmbG9hdDogNworCitGdW5jdGlvbjog
ImxnYW1tYV91cHdhcmQiOgorZG91YmxlOiA1CitmbG9hdDogNgorCitGdW5jdGlvbjogImxvZzEw
IjoKK2RvdWJsZTogMgorZmxvYXQ6IDIKKworRnVuY3Rpb246ICJsb2cxMF9kb3dud2FyZCI6Citk
b3VibGU6IDIKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiAibG9nMTBfdG93YXJkemVybyI6Citkb3Vi
bGU6IDIKK2Zsb2F0OiAxCisKK0Z1bmN0aW9uOiAibG9nMTBfdXB3YXJkIjoKK2RvdWJsZTogMgor
ZmxvYXQ6IDIKKworRnVuY3Rpb246ICJsb2cxcCI6Citkb3VibGU6IDEKK2Zsb2F0OiAxCisKK0Z1
bmN0aW9uOiAibG9nMXBfZG93bndhcmQiOgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlv
bjogImxvZzFwX3Rvd2FyZHplcm8iOgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlvbjog
ImxvZzFwX3Vwd2FyZCI6Citkb3VibGU6IDIKK2Zsb2F0OiAyCisKK0Z1bmN0aW9uOiAibG9nMiI6
CitmbG9hdDogMQorCitGdW5jdGlvbjogImxvZzJfZG93bndhcmQiOgorZG91YmxlOiAxCisKK0Z1
bmN0aW9uOiAibG9nMl90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorCitGdW5jdGlvbjogImxvZzJf
dXB3YXJkIjoKK2RvdWJsZTogMQorCitGdW5jdGlvbjogInBvdyI6Citkb3VibGU6IDEKKworRnVu
Y3Rpb246ICJwb3dfZG93bndhcmQiOgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlvbjog
InBvd190b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJwb3df
dXB3YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJzaW4iOgorZG91Ymxl
OiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogInNpbl9kb3dud2FyZCI6Citkb3VibGU6IDQKK2Zs
b2F0OiAxCisKK0Z1bmN0aW9uOiAic2luX3Rvd2FyZHplcm8iOgorZG91YmxlOiAzCitmbG9hdDog
MQorCitGdW5jdGlvbjogInNpbl91cHdhcmQiOgorZG91YmxlOiA3CitmbG9hdDogMQorCitGdW5j
dGlvbjogInNpbmNvcyI6Citkb3VibGU6IDEKKworRnVuY3Rpb246ICJzaW5jb3NfZG93bndhcmQi
OgorZG91YmxlOiAxCitmbG9hdDogMQorCitGdW5jdGlvbjogInNpbmNvc190b3dhcmR6ZXJvIjoK
K2RvdWJsZTogNAorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJzaW5jb3NfdXB3YXJkIjoKK2RvdWJs
ZTogMQorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJzaW5oIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIK
KworRnVuY3Rpb246ICJzaW5oX2Rvd253YXJkIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVu
Y3Rpb246ICJzaW5oX3Rvd2FyZHplcm8iOgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlv
bjogInNpbmhfdXB3YXJkIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246ICJ0YW4i
OgorZmxvYXQ6IDEKKworRnVuY3Rpb246ICJ0YW5fZG93bndhcmQiOgorZG91YmxlOiAxCitmbG9h
dDogMgorCitGdW5jdGlvbjogInRhbl90b3dhcmR6ZXJvIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEK
KworRnVuY3Rpb246ICJ0YW5fdXB3YXJkIjoKK2RvdWJsZTogMQorZmxvYXQ6IDEKKworRnVuY3Rp
b246ICJ0YW5oIjoKK2RvdWJsZTogMgorZmxvYXQ6IDIKKworRnVuY3Rpb246ICJ0YW5oX2Rvd253
YXJkIjoKK2RvdWJsZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246ICJ0YW5oX3Rvd2FyZHplcm8i
OgorZG91YmxlOiAyCitmbG9hdDogMgorCitGdW5jdGlvbjogInRhbmhfdXB3YXJkIjoKK2RvdWJs
ZTogMworZmxvYXQ6IDMKKworRnVuY3Rpb246ICJ0Z2FtbWEiOgorZG91YmxlOiA5CitmbG9hdDog
OAorCitGdW5jdGlvbjogInRnYW1tYV9kb3dud2FyZCI6Citkb3VibGU6IDkKK2Zsb2F0OiA5CisK
K0Z1bmN0aW9uOiAidGdhbW1hX3Rvd2FyZHplcm8iOgorZG91YmxlOiA5CitmbG9hdDogOAorCitG
dW5jdGlvbjogInRnYW1tYV91cHdhcmQiOgorZG91YmxlOiA5CitmbG9hdDogOAorCitGdW5jdGlv
bjogInkwIjoKK2RvdWJsZTogMworZmxvYXQ6IDkKKworRnVuY3Rpb246ICJ5MF9kb3dud2FyZCI6
Citkb3VibGU6IDMKK2Zsb2F0OiA2CisKK0Z1bmN0aW9uOiAieTBfdG93YXJkemVybyI6Citkb3Vi
bGU6IDMKK2Zsb2F0OiAzCisKK0Z1bmN0aW9uOiAieTBfdXB3YXJkIjoKK2RvdWJsZTogMworZmxv
YXQ6IDYKKworRnVuY3Rpb246ICJ5MSI6Citkb3VibGU6IDMKK2Zsb2F0OiA5CisKK0Z1bmN0aW9u
OiAieTFfZG93bndhcmQiOgorZG91YmxlOiA2CitmbG9hdDogNworCitGdW5jdGlvbjogInkxX3Rv
d2FyZHplcm8iOgorZG91YmxlOiAzCitmbG9hdDogMworCitGdW5jdGlvbjogInkxX3Vwd2FyZCI6
Citkb3VibGU6IDcKK2Zsb2F0OiA1CisKK0Z1bmN0aW9uOiAieW4iOgorZG91YmxlOiAzCitmbG9h
dDogMworCitGdW5jdGlvbjogInluX2Rvd253YXJkIjoKK2RvdWJsZTogNgorZmxvYXQ6IDgKKwor
RnVuY3Rpb246ICJ5bl90b3dhcmR6ZXJvIjoKK2RvdWJsZTogOAorZmxvYXQ6IDgKKworRnVuY3Rp
b246ICJ5bl91cHdhcmQiOgorZG91YmxlOiA4CitmbG9hdDogOAorCisjIGVuZCBvZiBhdXRvbWF0
aWMgZ2VuZXJhdGlvbgpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL2xpYm0tdGVzdC11bHBzLW5h
bWUgYi9zeXNkZXBzL29yMWsvbGlibS10ZXN0LXVscHMtbmFtZQpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi4wYWY2NTkxZmQ5Ci0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVw
cy9vcjFrL2xpYm0tdGVzdC11bHBzLW5hbWUKQEAgLTAsMCArMSBAQAorT3BlblJJU0MKZGlmZiAt
LWdpdCBhL3N5c2RlcHMvb3Ixay9ub2ZwdS9tYXRoLXRlc3RzLWV4Y2VwdGlvbnMuaCBiL3N5c2Rl
cHMvb3Ixay9ub2ZwdS9tYXRoLXRlc3RzLWV4Y2VwdGlvbnMuaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi5jZjRlZDk4Mjc5Ci0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVw
cy9vcjFrL25vZnB1L21hdGgtdGVzdHMtZXhjZXB0aW9ucy5oCkBAIC0wLDAgKzEsMjkgQEAKKy8q
IENvbmZpZ3VyYXRpb24gZm9yIG1hdGggdGVzdHM6IHN1cHBvcnQgZm9yIGV4Y2VwdGlvbnMuICBP
cGVuUklTQyBuby1GUFUKKyAgIHZlcnNpb24uCisgICBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisgICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05V
IEMgTGlicmFyeS4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKKyAgIHZlcnNpb24gMi4x
IG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgor
CisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLAorICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2
ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisgICBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCisgICBZb3Ugc2hvdWxkIGhhdmUg
cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNl
bnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJhcnk7IGlmIG5vdCwgc2VlCisgICA8aHR0cHM6
Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KKworI2lmbmRlZiBPUjFLX05PRlBVX01BVEhf
VEVTVFNfRVhDRVBUSU9OU19ICisjZGVmaW5lIE9SMUtfTk9GUFVfTUFUSF9URVNUU19FWENFUFRJ
T05TX0ggMQorCisvKiBXZSBzdXBwb3J0IHNldHRpbmcgZmxvYXRpbmctcG9pbnQgZXhjZXB0aW9u
IGZsYWdzIG9uIGhhcmQtZmxvYXQKKyAgIHRhcmdldHMuICBUaGVzZSBhcmUgbm90IHN1cHBvcnRl
ZCBvbiBzb2Z0LWZsb2F0IHRhcmdldHMuICAqLworI2RlZmluZSBFWENFUFRJT05fVEVTVFNfZmxv
YXQgMAorI2RlZmluZSBFWENFUFRJT05fVEVTVFNfZG91YmxlICAgICAgICAwCisjZGVmaW5lIEVY
Q0VQVElPTl9URVNUU19sb25nX2RvdWJsZSAgIDAKKworI2VuZGlmIC8qIG1hdGgtdGVzdHMtZXhj
ZXB0aW9ucy5oLiAgKi8KZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9ub2ZwdS9tYXRoLXRlc3Rz
LXJvdW5kaW5nLmggYi9zeXNkZXBzL29yMWsvbm9mcHUvbWF0aC10ZXN0cy1yb3VuZGluZy5oCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjJiNjlhNTQxYTMKLS0tIC9kZXYv
bnVsbAorKysgYi9zeXNkZXBzL29yMWsvbm9mcHUvbWF0aC10ZXN0cy1yb3VuZGluZy5oCkBAIC0w
LDAgKzEsMjggQEAKKy8qIENvbmZpZ3VyYXRpb24gZm9yIG1hdGggdGVzdHM6IHJvdW5kaW5nIG1v
ZGUgc3VwcG9ydC4gIE9wZW5SSVNDIG5vLUZQVQorICAgdmVyc2lvbi4KKyAgIENvcHlyaWdodCAo
QykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyAgIFRoaXMgZmlsZSBpcyBw
YXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBmcmVl
IHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAgIG1vZGlmeSBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgor
ICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxh
dGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFO
VFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICAgTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAg
IExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisKKyAgIFlv
dSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQ
dWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeTsgaWYgbm90LCBz
ZWUKKyAgIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uICAqLworCisjaWZuZGVmIE9S
MUtfTk9GUFVfTUFUSF9URVNUU19ST1VORElOR19ICisjZGVmaW5lIE9SMUtfTk9GUFVfTUFUSF9U
RVNUU19ST1VORElOR19IIDEKKworLyogT24gc29mdC1mbG9hdCB0YXJnZXRzIHdlIG9ubHkgc3Vw
cG9ydCB0aGUgInRvIG5lYXJlc3QiIHJvdW5kaW5nIG1vZGUuICAqLworI2RlZmluZSBST1VORElO
R19URVNUU19mbG9hdChNT0RFKQkJKChNT0RFKSA9PSBGRV9UT05FQVJFU1QpCisjZGVmaW5lIFJP
VU5ESU5HX1RFU1RTX2RvdWJsZShNT0RFKQkJKChNT0RFKSA9PSBGRV9UT05FQVJFU1QpCisjZGVm
aW5lIFJPVU5ESU5HX1RFU1RTX2xvbmdfZG91YmxlKE1PREUpCSgoTU9ERSkgPT0gRkVfVE9ORUFS
RVNUKQorCisjZW5kaWYgLyogbWF0aC10ZXN0cy1yb3VuZGluZy5oLiAgKi8KZGlmZiAtLWdpdCBh
L3N5c2RlcHMvb3Ixay9zZnAtbWFjaGluZS5oIGIvc3lzZGVwcy9vcjFrL3NmcC1tYWNoaW5lLmgK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMThmMjY3NjUxMAotLS0gL2Rl
di9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9zZnAtbWFjaGluZS5oCkBAIC0wLDAgKzEsOTMgQEAK
Ky8qIE9wZW5SSVNDIHNvZnRmbG9hdCBkZWZpbml0aW9ucy4KKyAgIENvcHlyaWdodCAoQykgMjAy
MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKworICAgVGhpcyBmaWxlIGlzIHBhcnQg
b2YgdGhlIEdOVSBDIExpYnJhcnkuCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorICAgbW9kaWZ5IGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworICAgTGljZW5zZSBh
cyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyCisgICB2
ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhv
cGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsg
d2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgICBNRVJDSEFOVEFCSUxJVFkg
b3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorICAgTGVz
c2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKworICAgWW91IHNo
b3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1Ymxp
YworICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBHTlUgQyBMaWJyYXJ5LiAgSWYgbm90LCBzZWUK
KyAgIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uICAqLworCisjZGVmaW5lIF9GUF9X
X1RZUEVfU0laRQkJMzIKKyNkZWZpbmUgX0ZQX1dfVFlQRQkJdW5zaWduZWQgbG9uZworI2RlZmlu
ZSBfRlBfV1NfVFlQRQkJc2lnbmVkIGxvbmcKKyNkZWZpbmUgX0ZQX0lfVFlQRQkJbG9uZworCisj
ZGVmaW5lIF9GUF9NVUxfTUVBVF9TKFIsWCxZKQkJCQlcCisgIF9GUF9NVUxfTUVBVF8xX3dpZGUo
X0ZQX1dGUkFDQklUU19TLFIsWCxZLHVtdWxfcHBtbSkKKyNkZWZpbmUgX0ZQX01VTF9NRUFUX0Qo
UixYLFkpCQkJCVwKKyAgX0ZQX01VTF9NRUFUXzJfd2lkZShfRlBfV0ZSQUNCSVRTX0QsUixYLFks
dW11bF9wcG1tKQorI2RlZmluZSBfRlBfTVVMX01FQVRfUShSLFgsWSkJCQkJXAorICBfRlBfTVVM
X01FQVRfNF93aWRlKF9GUF9XRlJBQ0JJVFNfUSxSLFgsWSx1bXVsX3BwbW0pCisKKyNkZWZpbmUg
X0ZQX01VTF9NRUFUX0RXX1MoUixYLFkpCQkJCVwKKyAgX0ZQX01VTF9NRUFUX0RXXzFfd2lkZShf
RlBfV0ZSQUNCSVRTX1MsUixYLFksdW11bF9wcG1tKQorI2RlZmluZSBfRlBfTVVMX01FQVRfRFdf
RChSLFgsWSkJCQkJXAorICBfRlBfTVVMX01FQVRfRFdfMl93aWRlKF9GUF9XRlJBQ0JJVFNfRCxS
LFgsWSx1bXVsX3BwbW0pCisjZGVmaW5lIF9GUF9NVUxfTUVBVF9EV19RKFIsWCxZKQkJCQlcCisg
IF9GUF9NVUxfTUVBVF9EV180X3dpZGUoX0ZQX1dGUkFDQklUU19RLFIsWCxZLHVtdWxfcHBtbSkK
KworCisjZGVmaW5lIF9GUF9ESVZfTUVBVF9TKFIsWCxZKQlfRlBfRElWX01FQVRfMV9sb29wKFMs
UixYLFkpCisjZGVmaW5lIF9GUF9ESVZfTUVBVF9EKFIsWCxZKQlfRlBfRElWX01FQVRfMl91ZGl2
KEQsUixYLFkpCisjZGVmaW5lIF9GUF9ESVZfTUVBVF9RKFIsWCxZKQlfRlBfRElWX01FQVRfNF91
ZGl2KFEsUixYLFkpCisKKyNkZWZpbmUgX0ZQX05BTkZSQUNfUwkJKChfRlBfUU5BTkJJVF9TIDw8
IDEpIC0gMSkKKyNkZWZpbmUgX0ZQX05BTkZSQUNfRAkJKChfRlBfUU5BTkJJVF9EIDw8IDEpIC0g
MSksIC0xCisjZGVmaW5lIF9GUF9OQU5GUkFDX1EJCSgoX0ZQX1FOQU5CSVRfUSA8PCAxKSAtIDEp
LCAtMSwgLTEsIC0xCisjZGVmaW5lIF9GUF9OQU5TSUdOX1MJCTAKKyNkZWZpbmUgX0ZQX05BTlNJ
R05fRAkJMAorI2RlZmluZSBfRlBfTkFOU0lHTl9RCQkwCisKKyNkZWZpbmUgX0ZQX0tFRVBOQU5G
UkFDUCAxCisjZGVmaW5lIF9GUF9RTkFOTkVHQVRFRFAgMAorCisvKiBTb21lb25lIHBsZWFzZSBj
aGVjayB0aGlzLiAgKi8KKyNkZWZpbmUgX0ZQX0NIT09TRU5BTihmcywgd2MsIFIsIFgsIFksIE9Q
KQkJCVwKKyAgZG8gewkJCQkJCQkJXAorICAgIGlmICgoX0ZQX0ZSQUNfSElHSF9SQVdfIyNmcyhY
KSAmIF9GUF9RTkFOQklUXyMjZnMpCQlcCisJJiYgIShfRlBfRlJBQ19ISUdIX1JBV18jI2ZzKFkp
ICYgX0ZQX1FOQU5CSVRfIyNmcykpCVwKKyAgICAgIHsJCQkJCQkJCVwKKwlSIyNfcyA9IFkjI19z
OwkJCQkJCVwKKwlfRlBfRlJBQ19DT1BZXyMjd2MoUixZKTsJCQkJXAorICAgICAgfQkJCQkJCQkJ
XAorICAgIGVsc2UJCQkJCQkJXAorICAgICAgewkJCQkJCQkJXAorCVIjI19zID0gWCMjX3M7CQkJ
CQkJXAorCV9GUF9GUkFDX0NPUFlfIyN3YyhSLFgpOwkJCQlcCisgICAgICB9CQkJCQkJCQlcCisg
ICAgUiMjX2MgPSBGUF9DTFNfTkFOOwkJCQkJCVwKKyAgfSB3aGlsZSAoMCkKKworLyogSGFuZGxl
IGdldHRpbmcgYW5kIHNldHRpbmcgcm91bmRpbmcgbW9kZSBmb3Igc29mdCBmcCBvcGVyYXRpb25z
LiAgKi8KKworI2RlZmluZSBGUF9STkRfTkVBUkVTVAkJKDB4MCA8PCAxKQorI2RlZmluZSBGUF9S
TkRfWkVSTwkJKDB4MSA8PCAxKQorI2RlZmluZSBGUF9STkRfUElORgkJKDB4MiA8PCAxKQorI2Rl
ZmluZSBGUF9STkRfTUlORgkJKDB4MyA8PCAxKQorI2RlZmluZSBGUF9STkRfTUFTSwkJKDB4MyA8
PCAxKQorCisjZGVmaW5lIEZQX0VYX09WRVJGTE9XCQkoMSA8PCAzKQorI2RlZmluZSBGUF9FWF9V
TkRFUkZMT1cJCSgxIDw8IDQpCisjZGVmaW5lIEZQX0VYX0lORVhBQ1QJCSgxIDw8IDgpCisjZGVm
aW5lIEZQX0VYX0lOVkFMSUQJCSgxIDw8IDkpCisjZGVmaW5lIEZQX0VYX0RJVlpFUk8JCSgxIDw8
IDExKQorI2RlZmluZSBGUF9FWF9BTEwgXAorCShGUF9FWF9JTlZBTElEIHwgRlBfRVhfRElWWkVS
TyB8IEZQX0VYX09WRVJGTE9XIHwgRlBfRVhfVU5ERVJGTE9XIFwKKwkgfCBGUF9FWF9JTkVYQUNU
KQorCisjZGVmaW5lIF9GUF9ERUNMX0VYIFwKKyAgdW5zaWduZWQgaW50IF9mcGNzciBfX2F0dHJp
YnV0ZV9fICgodW51c2VkKSkgPSBGUF9STkRfTkVBUkVTVAorCisjZGVmaW5lIEZQX1JPVU5ETU9E
RSAoX2ZwY3NyICYgRlBfUk5EX01BU0spCisKKyNkZWZpbmUgX0ZQX1RJTklORVNTX0FGVEVSX1JP
VU5ESU5HIDAKZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay90aW5pbmVzcy5oIGIvc3lzZGVwcy9v
cjFrL3RpbmluZXNzLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZGFm
YmM2Y2FkNQotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay90aW5pbmVzcy5oCkBAIC0w
LDAgKzEgQEAKKyNkZWZpbmUgVElOSU5FU1NfQUZURVJfUk9VTkRJTkcJMAotLSAKMi4zMS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
