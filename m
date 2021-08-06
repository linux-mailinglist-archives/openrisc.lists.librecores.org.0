Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9D95E3E278E
	for <lists+openrisc@lfdr.de>; Fri,  6 Aug 2021 11:42:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 54A97210A9;
	Fri,  6 Aug 2021 11:42:35 +0200 (CEST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mail.librecores.org (Postfix) with ESMTPS id 1630223F24
 for <openrisc@lists.librecores.org>; Fri,  6 Aug 2021 11:42:33 +0200 (CEST)
Received: by mail-pl1-f171.google.com with SMTP id a20so6404485plm.0
 for <openrisc@lists.librecores.org>; Fri, 06 Aug 2021 02:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KAP1GiPxcBkREJMhPNsQlvTNXJSeUTlLDE6WcaDFRE=;
 b=BVemWJgWRtaBiZgpWBt9oTixn1WTDXVtOsUGEi5enbu+spVWOVyAGEnSSIiTM/CzQP
 Lgb6lqYCcvlWOLNWYn98euwjqKzi5UjMwGAj5ZqYdAARUjTv4zhUbIrDIYQLZcpvyoDx
 JFPIMd6rMGsPGtdRtAI16guIzJVj3K0QBLfdg/ZhNY4NoGlD8eOYe1VqedJIA/BCUzQW
 8yG7fmnbWb33203Q1+4OHjZG53at4UYnlTWk7GC0EJcAmbu8159oFHSTlba7ZC5sDWla
 MWBsvkptMiQGIOTtVm3DzMRdQhpPLJv3HOSDNldcqxfJosVsznmXYirs58FvrlV2y9Bn
 qOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KAP1GiPxcBkREJMhPNsQlvTNXJSeUTlLDE6WcaDFRE=;
 b=OlMV14LDfcVxlw2OGNPG2WT5J+DWd/FcwQFnG1XhiXh9tuuhEcmc6Igp5RmhLuVml9
 gKYtkqtYQqFPBdnLEegpZ0FW/hQ06NkUJ9P60DkmdOhSpRnX+OoRSgo6kt6FFkFs5/fJ
 AOqbJGL9cF5u4/Wgltm0hQx97MYKUwodle4N2wEL8omEbQN1tvMwchQ9P6ZNOsxUSlds
 jOLcm/OUM1NGJ25zIP/WdxJ77G+qgeH+63FMi8W4DDopwPaewgYGU7qHCZvxqB4T8mxj
 0dCQEg4E8XyCB/aWh0TAMTlfpjCfhRFFf0aBAGkpetKvqIzcdJKdB5HL1ztD4N/4XjXl
 7gAA==
X-Gm-Message-State: AOAM532v+WzyVPpvNwV/mwQ15Hin8E433eFOoi1G5T3YWkwh+knbzaAa
 gkZ6Cwz2eZuqoHScwg0EEs8=
X-Google-Smtp-Source: ABdhPJyP6MovwFB1lqrAk335NA7KkrgwUU2AFzzt8JlPUBhheVSjn1rK72ASQTILxy42ApOLWWyq2A==
X-Received: by 2002:a63:48c:: with SMTP id 134mr901416pge.122.1628242951314;
 Fri, 06 Aug 2021 02:42:31 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id g23sm10255689pfk.148.2021.08.06.02.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 02:42:30 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Fri,  6 Aug 2021 18:42:17 +0900
Message-Id: <20210806094217.3227877-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2] time: Fix overflow itimer tests on 32-bit
 systems
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
Cc: Openrisc <openrisc@lists.librecores.org>, adhemerval.zanella@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gdGhlIHBvcnQgb2YgT3BlblJJU0MgSSBhbSB3b3JraW5nIG9uIGFuZCBpdCBhcHBlYXJzIHRo
ZSBydjMyIHBvcnQKd2UgaGF2ZSBzZXRzIF9fVElNRVNJWkUgPT0gNjQgJiYgX19XT1JEU0laRSA9
PSAzMi4gIFRoaXMgY2F1c2VzIHRoZQpzaXplIG9mIHRpbWVfdCB0byBiZSA4IGJ5dGVzLCBidXQg
dGhlIHR2X3NlYyBpbiB0aGUga2VybmVsIGlzIHN0aWxsIDMyLWJpdApjYXVzaW5nIHRydW5jYXRp
b24uCgpUaGUgdHJ1bmNhdGlvbnMgYXJlIHVuYXZvaWRhYmxlIG9uIHRoZXNlIHN5c3RlbXMgc28g
c2tpcCB0aGUKdGVzdGluZy9mYWlsdXJlcyBieSBndWFyZGluZyB3aXRoIF9fS0VSTkVMX09MRF9U
SU1FVkFMX01BVENIRVNfVElNRVZBTDY0LgoKQWxzbywgZnV0aGVyIGluIHRoZSB0ZXN0cyBhbmQg
aW4gb3RoZXIgcGFydHMgb2YgY29kZSBjaGVja2luZyBmb3IgdGltZV90Cm92ZXJmbG93IGRvZXMg
bm90IHdvcmsgb24gMzItYml0IHN5c3RlbXMgd2hlbiB0aW1lX3QgaXMgNjQtYml0LiAgQXMKc3Vn
Z2VzdGVkIGJ5IEFkaGVtZXJ2YWwsIHVwZGF0ZSB0aGUgaW5fdGltZV90X3JhbmdlIGZ1bmN0aW9u
IHRvIGFzc3VtZQozMi1iaXRzIGJ5IHVzaW5nIGludDMyX3QuCgpUaGlzIGFsc28gYnJpbmdzIGlu
IHRoZSBoZWFkZXIgZm9yIHN0ZGludC5oIHNvIHdlIGNhbiB1cGRhdGUgb3RoZXIKdXNhZ2VzIG9m
IF9faW50MzJfdCB0byBpbnQzMl90IGFzIHN1Z2dlc3RlZCBieSBBZGhlbWVydmFsLgotLS0KCkhl
bGxvLAoKU29ycnkgZm9yIHRoZSBkZWxheSB0byBnZXQgdGhpcyBvdXQgSSBoYXZlIGJlZW4gYnVz
eSBvbiB0aGUgaGFyZHdhcmUgc2lkZSBvZgpvcGVucmlzYyB0aGUgbGFzdCBtb250aCBzbyBJIGhh
dmVuJ3QgYmVlbiBhYmxlIHRvIHNwZW5kIHRpbWUgb24gZ2V0dGluZyB0aGlzCm91dC4KClRoZSBw
YXRjaCBlbmRzIHVwIGRvaW5nIGEgdGVzdCBmaXggYW5kIHNvbWUgbGliIGNvZGUgZml4ZXMsIEkg
Y2FuIHNwbGl0IGl0IHRvCnNlcGFyYXRlIHNtYWxsIHBhdGNoZXMuICBCdXQgc2luY2UgYXMgYSB3
aG9sZSBpdCdzIHNtYWxsIEkgZmVlbCBsZWF2aW5nIGl0CnRvZ2V0aGVyIGlzIGJlc3QuCgotU3Rh
ZmZvcmQKCiBpbmNsdWRlL3RpbWUuaCAgICB8IDEwICsrKysrKy0tLS0KIHRpbWUvdHN0LWl0aW1l
ci5jIHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS90aW1lLmggYi9pbmNsdWRlL3RpbWUuaAppbmRl
eCA0MzcyYmZiZDk2Li5iYTNjNTExNmNmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3RpbWUuaAorKysg
Yi9pbmNsdWRlL3RpbWUuaApAQCAtMTEsNiArMTEsNyBAQAogIyBpbmNsdWRlIDxzeXMvdGltZS5o
PgogIyBpbmNsdWRlIDx0aW1lLWNsb2NraWQuaD4KICMgaW5jbHVkZSA8c3lzL3RpbWUuaD4KKyMg
aW5jbHVkZSA8c3RkaW50Lmg+CiAKIGV4dGVybiBfX3R5cGVvZiAoc3RyZnRpbWVfbCkgX19zdHJm
dGltZV9sOwogbGliY19oaWRkZW5fcHJvdG8gKF9fc3RyZnRpbWVfbCkKQEAgLTMzNCwxMSArMzM1
LDEyIEBAIGxpYmNfaGlkZGVuX3Byb3RvIChfX3RpbWU2NCkKICAgIGFjdHVhbCBjbG9jayBJRC4g
ICovCiAjZGVmaW5lIENMT0NLX0lERklFTERfU0laRQkzCiAKLS8qIENoZWNrIHdoZXRoZXIgVCBm
aXRzIGluIHRpbWVfdC4gICovCisvKiBDaGVjayB3aGV0aGVyIFQgZml0cyBpbiBpbnQzMl90LCBh
c3N1bWUgYWxsIHVzYWdlcyBhcmUgZm9yCisgICBzaXplb2YodGltZV90KSA9PSAzMi4gICovCiBz
dGF0aWMgaW5saW5lIGJvb2wKIGluX3RpbWVfdF9yYW5nZSAoX190aW1lNjRfdCB0KQogewotICB0
aW1lX3QgcyA9IHQ7CisgIGludDMyX3QgcyA9IHQ7CiAgIHJldHVybiBzID09IHQ7CiB9CiAKQEAg
LTQ0NSw4ICs0NDcsOCBAQCB0aW1lc3BlYzY0X3RvX3RpbWV2YWw2NCAoY29uc3Qgc3RydWN0IF9f
dGltZXNwZWM2NCB0czY0KQogICAgYW5kIHN1c2Vjb25kc190LiAgKi8KIHN0cnVjdCBfX3RpbWV2
YWwzMgogewotICBfX2ludDMyX3QgdHZfc2VjOyAgICAgICAgIC8qIFNlY29uZHMuICAqLwotICBf
X2ludDMyX3QgdHZfdXNlYzsgICAgICAgIC8qIE1pY3Jvc2Vjb25kcy4gICovCisgIGludDMyX3Qg
dHZfc2VjOyAgICAgICAgIC8qIFNlY29uZHMuICAqLworICBpbnQzMl90IHR2X3VzZWM7ICAgICAg
ICAvKiBNaWNyb3NlY29uZHMuICAqLwogfTsKIAogLyogQ29udmVyc2lvbiBmdW5jdGlvbnMgZm9y
IGNvbnZlcnRpbmcgdG8vZnJvbSBfX3RpbWV2YWwzMiAgKi8KZGlmZiAtLWdpdCBhL3RpbWUvdHN0
LWl0aW1lci5jIGIvdGltZS90c3QtaXRpbWVyLmMKaW5kZXggOTI5YzJiNzRjNy4uYmQ3ZDdhZmU4
MyAxMDA2NDQKLS0tIGEvdGltZS90c3QtaXRpbWVyLmMKKysrIGIvdGltZS90c3QtaXRpbWVyLmMK
QEAgLTEwMCw3ICsxMDAsNyBAQCBkb190ZXN0ICh2b2lkKQogCiAgICAgICAvKiBMaW51eCBkb2Vz
IG5vdCBwcm92aWRlIDY0IGJpdCB0aW1lX3Qgc3VwcG9ydCBmb3IgZ2V0aXRpbWVyIGFuZAogCSBz
ZXRpdGltZXIgb24gYXJjaGl0ZWN0dXJlcyB3aXRoIDMyIGJpdCB0aW1lX3Qgc3VwcG9ydC4gICov
Ci0gICAgICBpZiAoc2l6ZW9mIChfX3RpbWVfdCkgPT0gOCkKKyAgICAgIGlmIChfX0tFUk5FTF9P
TERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2NCkKIAl7CiAJICBURVNUX0NPTVBBUkUgKHNldGl0
aW1lciAodGltZXJzW2ldLCAmaXQsIE5VTEwpLCAwKTsKIAkgIFRFU1RfQ09NUEFSRSAoc2V0aXRp
bWVyICh0aW1lcnNbaV0sICYoc3RydWN0IGl0aW1lcnZhbCkgeyAwIH0sCkBAIC0xMzEsNyArMTMx
LDcgQEAgZG9fdGVzdCAodm9pZCkKICAgICAgIGl0Lml0X2ludGVydmFsLnR2X3VzZWMgPSAyMDsK
ICAgICAgIGl0Lml0X3ZhbHVlLnR2X3NlYyA9IDMwOwogICAgICAgaXQuaXRfdmFsdWUudHZfdXNl
YyA9IDQwOwotICAgICAgaWYgKHNpemVvZiAoX190aW1lX3QpID09IDgpCisgICAgICBpZiAoX19L
RVJORUxfT0xEX1RJTUVWQUxfTUFUQ0hFU19USU1FVkFMNjQpCiAJewogCSAgVEVTVF9DT01QQVJF
IChzZXRpdGltZXIgKHRpbWVyc1tpXSwgJml0LCBOVUxMKSwgMCk7CiAKLS0gCjIuMzEuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
