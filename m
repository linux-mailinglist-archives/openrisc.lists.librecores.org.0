Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 37BFA3A239
	for <lists+openrisc@lfdr.de>; Sat,  8 Jun 2019 23:33:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1BEB92026B;
	Sat,  8 Jun 2019 23:33:04 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 3376020263
 for <openrisc@lists.librecores.org>; Sat,  8 Jun 2019 23:33:03 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id c85so3116149pfc.1
 for <openrisc@lists.librecores.org>; Sat, 08 Jun 2019 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1MGIA16lRnroUvYCawVG97xnyjZa4vM/aeKSuSBf0U=;
 b=SWN8eEvQx3fcnZGSmc63/uaKwkqrwkOBH0kJU9LZA/2fJYnB8xWrB5JfqG8q3+JI0n
 IOdKKxUeww+Z2ZXfx05gwe5PWY5Cp284V/kQr4+uVYrHhGSmpYNH2oatAjpcO9g18Mbt
 QAG0MfjfJascPgYi/c31rpHcH3XEd5yENu9cJILwwLkYhAGiPIFW6wgtJMakZ3CN5tGq
 YKNzgJFGN5SDH2glFqRtG1SHFXW3jiVP3SafsUQJBt3Eh3CR8ztDIuorAozFzuzfxfcx
 a3q0j19IW/k6ZnUVSZqdVJ5VHyY9+G1br10zOJKiDY1qPUInjLdisNMRlMIxkf1OQcHy
 rYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1MGIA16lRnroUvYCawVG97xnyjZa4vM/aeKSuSBf0U=;
 b=CzQ7piict2u1PD27YxpXCIZ5Z7AWADLhvMnXbuttZtWWrVRFQN4N3/P097KaDNN2Ci
 mjSZb6za7Tm7K7+EjZbV7/NgNvzwheXGNCJl7oMEH4bWhaayk75dJkPEB4uU01Cvqa/J
 vI9lVX0+z4rvCQIhvRdDehcB+65729CpQx5ip8/pz72E82fA9hH1asWwJAJVSyULBeUN
 IIE4P/IEH3JBhQG/CV+g2p4snspEKavrb4n7dGh3de4sS0+Jyu8wntifskA8pisatPmI
 uorMqiX9si+oSHIv0m4+IOb+Ncb9kv88qCD/ZJujCDDDJ+4NHQ5aGVbkyfJfFCH3uVXz
 F0DQ==
X-Gm-Message-State: APjAAAUirt/tjSxoCExwIhXJPgCrviiei9HYuCxQo0YOFBakgmTXBa0T
 /0V6J1RMaY0wg3VQTOO0Ask=
X-Google-Smtp-Source: APXvYqwYLGtqwY51AnethLuZjUcZ+l3Ux5hlSm/hiNIcOqQK8FBSgewWdfMxawQGzbZ9yqG0L8FBxw==
X-Received: by 2002:a63:f146:: with SMTP id o6mr8705689pgk.179.1560029581706; 
 Sat, 08 Jun 2019 14:33:01 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id 133sm3120481pfa.92.2019.06.08.14.33.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 14:33:01 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>,
 GNU Binutils <binutils@sourceware.org>
Date: Sun,  9 Jun 2019 06:32:25 +0900
Message-Id: <20190608213225.3230-10-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608213225.3230-1-shorne@gmail.com>
References: <20190608213225.3230-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 09/11] sim/testsuite/or1k: Add test for 64-bit
 fpu operations
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

VGhpcyBpcyBhIHZlcnkgYmFzaWMgdGVzdCBidXQgaXQgZW5zdXJlIHRoZSBtYWNoaW5lIGlzIHdp
cmVkIHVwCmNvcnJlY3RseSBhbmQgdGhhdCB0aGUgYXNzZW1ibGVyIHdvcmtzLgoKc2ltL3Rlc3Rz
dWl0ZS9zaW0vb3Ixay9DaGFuZ2VMb2c6Cgp5eXl5LW1tLWRkICBTdGFmZm9yZCBIb3JuZSAgPHNo
b3JuZUBnbWFpbC5jb20+CgoJKiBmcHU2NGEzMi5TOiBOZXcgZmlsZS4KLS0tCkNoYW5nZXMgZnJv
bSB2MjoKIC0gdXNlIGV4cGxpY2l0IHJlZ2lzdGVyIHBhaXJzLgoKIHNpbS90ZXN0c3VpdGUvc2lt
L29yMWsvZnB1NjRhMzIuUyB8IDE3MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxNzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNpbS90
ZXN0c3VpdGUvc2ltL29yMWsvZnB1NjRhMzIuUwoKZGlmZiAtLWdpdCBhL3NpbS90ZXN0c3VpdGUv
c2ltL29yMWsvZnB1NjRhMzIuUyBiL3NpbS90ZXN0c3VpdGUvc2ltL29yMWsvZnB1NjRhMzIuUwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lMjYzODUzNTgwCi0tLSAvZGV2
L251bGwKKysrIGIvc2ltL3Rlc3RzdWl0ZS9zaW0vb3Ixay9mcHU2NGEzMi5TCkBAIC0wLDAgKzEs
MTcyIEBACisvKiBUZXN0cyBzb21lIGJhc2ljIGZwdSBpbnN0cnVjdGlvbnMuCisKKyAgIENvcHly
aWdodCAoQykgMjAxNy0yMDE5IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorCisgICBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeQorICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDMgb2YgdGhlIExpY2Vuc2UsIG9yCisgICAoYXQgeW91ciBvcHRp
b24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQg
aW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAgIGJ1dCBXSVRIT1VUIEFOWSBX
QVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgICBNRVJDSEFO
VEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisg
ICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCisgICBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZQorICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3
dy5nbnUub3JnL2xpY2Vuc2VzLz4uICAqLworCisjIG1hY2g6IG9yMWsKKyMgb3V0cHV0OiByZXBv
cnQoMHg0MDA5MjFmOSk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHhmMDFiODY2ZSk7XG4KKyMgb3V0
cHV0OiByZXBvcnQoMHg0MDA1YmYwOSk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHg5NWFhZjc5MCk7
XG4KKyMgb3V0cHV0OiByZXBvcnQoMHgwMDAwMDAwMCk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHgw
MDAwMTIzNCk7XG4KKyMgb3V0cHV0OiBcbgorIyBvdXRwdXQ6IHJlcG9ydCgweDQwYjIzNDAwKTtc
bgorIyBvdXRwdXQ6IHJlcG9ydCgweDAwMDAwMDAwKTtcbgorIyBvdXRwdXQ6IHJlcG9ydCgweDQw
YjIzNDAwKTtcbgorIyBvdXRwdXQ6IHJlcG9ydCgweDAwMDAwMDAwKTtcbgorIyBvdXRwdXQ6IFxu
CisjIG91dHB1dDogcmVwb3J0KDB4NDAxNzcwODEpO1xuCisjIG91dHB1dDogcmVwb3J0KDB4YzJl
MzNlZmYpO1xuCisjIG91dHB1dDogcmVwb3J0KDB4NDAwOTIxZjkpO1xuCisjIG91dHB1dDogcmVw
b3J0KDB4ZjAxYjg2NmUpO1xuCisjIG91dHB1dDogXG4KKyMgb3V0cHV0OiByZXBvcnQoMHg0MDIx
MTQ1Nik7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHg1ODdkZmFiZik7XG4KKyMgb3V0cHV0OiByZXBv
cnQoMHg0MDA5MjFmOSk7XG4KKyMgb3V0cHV0OiByZXBvcnQoMHhmMDFiODY2ZCk7XG4KKyMgb3V0
cHV0OiBcbgorIyBvdXRwdXQ6IHJlcG9ydCgweDAwMDAwMDAxKTtcbgorIyBvdXRwdXQ6IFxuCisj
IG91dHB1dDogV0FSTklORzogaWdub3JpbmcgZnB1IGVycm9yIGNhdWdodCBpbiBmYXN0IG1vZGUu
XG4KKyMgb3V0cHV0OiByZXBvcnQoMHgwMDAwMDAwMCk7XG4KKyMgb3V0cHV0OiBcbgorIyBvdXRw
dXQ6IGV4aXQoMClcbgorCisjaW5jbHVkZSAib3Ixay1hc20tdGVzdC1oZWxwZXJzLmgiCisKKwlT
VEFOREFSRF9URVNUX0VOVklST05NRU5UCisKKwkuc2VjdGlvbiAuZXhjZXB0aW9uX3ZlY3RvcnMK
KworCS8qIEZsb2F0aW5nIHBvaW50IGV4Y2VwdGlvbi4gICovCisJLm9yZwkweGQwMAorCisJLyog
VGhlIGhhbmRsaW5nIGlzIGEgYml0IGR1YmlvdXMgYXQgcHJlc2VudC4gIFdlIGp1c3QgcGF0Y2gg
dGhlCisJICAgaW5zdHJ1Y3Rpb24gd2l0aCBsLm5vcCBhbmQgcmVzdGFydC4gIFRoaXMgd2lsbCBn
byB3cm9uZyBpbiBicmFuY2gKKwkgICBkZWxheSBzbG90cy4gIEJ1dCB3ZSBkb24ndCBoYXZlIHRo
b3NlIGluIHRoaXMgdGVzdC4gICovCisJbC5hZGRpIHIxLCByMSwgLUVYQ0VQVElPTl9TVEFDS19T
S0lQX1NJWkUKKwlQVVNIIHIyCisJUFVTSCByMworCS8qIFNhdmUgdGhlIGFkZHJlc3Mgb2YgdGhl
IGluc3RydWN0aW9uIHRoYXQgY2F1c2VkIHRoZSBwcm9ibGVtLiAgKi8KKwlNT1ZFX0ZST01fU1BS
IHIyLCBTUFJfRVBDUl9CQVNFCisJTE9BRF9JTU1FRElBVEUgcjMsIDB4MTUwMDAwMDAgLyogT3Bj
b2RlIGZvciBsLm5vcCAgKi8KKwlsLnN3CS00KHIyKSwgcjMKKwlQT1AgcjMKKwlQT1AgcjIKKwls
LmFkZGkgcjEsIHIxLCBFWENFUFRJT05fU1RBQ0tfU0tJUF9TSVpFCisJbC5yZmUKKworCS5zZWN0
aW9uIC5kYXRhCisJLmFsaWduIDQKKwkudHlwZSAgIHBpLCBAb2JqZWN0CisJLnNpemUgICBwaSwg
OAorYW5jaG9yOgorcGk6CisJLmRvdWJsZSAgMy4xNDE1OQorCisJLnR5cGUgICBlLCBAb2JqZWN0
CisJLnNpemUgICBlLCA4CitlOgorCS5kb3VibGUgIDIuNzE4MjgKKworCS50eXBlICAgbGFyZ2Us
IEBvYmplY3QKKwkuc2l6ZSAgIGxhcmdlLCA4CitsYXJnZToKKwkubG9uZyAgMAorCS5sb25nICAw
eDEyMzQKKworCS5zZWN0aW9uIC50ZXh0CitzdGFydF90ZXN0czoKKwlQVVNIIExJTktfUkVHSVNU
RVJfUjkKKworCS8qIFRlc3QgbGYuaXRvZi5kIGludCB0byBkb3VibGUgY29udmVyc2lvbi4gIFNl
dHRpbmcgdXA6CisJICogIHIxMSAgICAgIHBvaW50ZXIgdG8gZGF0YQorCSAqICByMTIscjEzICBw
aSBhcyBkb3VibGUKKwkgKiAgcjE0LHIxNSAgZSAgYXMgZG91YmxlCisJICogIHIxNixyMTcgIGEg
bG9uZyBsb25nCisJICovCisJbC5vcmkJcjExLCByMCwgaGEoYW5jaG9yKQorCWwuYWRkaQlyMTEs
IHIxMSwgbG8oYW5jaG9yKQorCWwubHd6CXIxMiwgMChyMTEpCisJbC5sd3oJcjEzLCA0KHIxMSkK
KworCWwubHd6CXIxNCwgOChyMTEpCisJbC5sd3oJcjE1LCAxMihyMTEpCisKKwlsLmx3eglyMTYs
IDE2KHIxMSkKKwlsLmx3eglyMTgsIDIwKHIxMSkKKworCS8qIE91dHB1dCB0byBlbnN1cmUgd2Ug
bG9hZGVkIGl0IGNvcnJlY3RseS4gICovCisJUkVQT1JUX1JFR19UT19DT05TT0xFIHIxMgorCVJF
UE9SVF9SRUdfVE9fQ09OU09MRSByMTMKKworCVJFUE9SVF9SRUdfVE9fQ09OU09MRSByMTQKKwlS
RVBPUlRfUkVHX1RPX0NPTlNPTEUgcjE1CisKKwlSRVBPUlRfUkVHX1RPX0NPTlNPTEUgcjE2CisJ
UkVQT1JUX1JFR19UT19DT05TT0xFIHIxOAorCVBSSU5UX05FV0xJTkVfVE9fQ09OU09MRQorCisJ
LyogQ29udmVydCB0aGUgYmlnIGxvbmcgdG8gYSBkb3VibGUuICovCisJbGYuaXRvZi5kIHIxNixy
MTgsIHIxNixyMTgKKwlSRVBPUlRfUkVHX1RPX0NPTlNPTEUgcjE2CisJUkVQT1JUX1JFR19UT19D
T05TT0xFIHIxOAorCisJLyogQ29udmVydCB0aGUgZG91YmxlIGJhY2sgdG8gYSBsb25nLCBpdCBz
aG91bGQgbWF0Y2ggYmVmb3JlLiAqLworCWxmLmZ0b2kuZCByMTYscjE4LCByMTYscjE4CisJbGYu
aXRvZi5kIHIxNixyMTgsIHIxNixyMTgKKworCVJFUE9SVF9SRUdfVE9fQ09OU09MRSByMTYKKwlS
RVBPUlRfUkVHX1RPX0NPTlNPTEUgcjE4CisKKwlQUklOVF9ORVdMSU5FX1RPX0NPTlNPTEUKKwor
CS8qIEFkZCBhbmQgc3VidHJhY3Qgc29tZSBkb3VibGUgdmFsdWVzLiAgKi8KKwlsZi5hZGQuZCBy
MTIscjEzLCByMTIscjEzLCByMTQscjE1CisJUkVQT1JUX1JFR19UT19DT05TT0xFIHIxMgorCVJF
UE9SVF9SRUdfVE9fQ09OU09MRSByMTMKKworCWxmLnN1Yi5kIHIxMixyMTMsIHIxMixyMTMsIHIx
NCxyMTUKKwlSRVBPUlRfUkVHX1RPX0NPTlNPTEUgcjEyCisJUkVQT1JUX1JFR19UT19DT05TT0xF
IHIxMworCVBSSU5UX05FV0xJTkVfVE9fQ09OU09MRQorCisJLyogTXVsdGlwbHkgYW5kIGRpdmlk
ZSBkb3VibGUgdmFsdWVzLiAgKi8KKwlsZi5tdWwuZCByMTIscjEzLCByMTIscjEzLCByMTQscjE1
CisJUkVQT1JUX1JFR19UT19DT05TT0xFIHIxMgorCVJFUE9SVF9SRUdfVE9fQ09OU09MRSByMTMK
KworCWxmLmRpdi5kIHIxMixyMTMsIHIxMixyMTMsIHIxNCxyMTUKKwlSRVBPUlRfUkVHX1RPX0NP
TlNPTEUgcjEyCisJUkVQT1JUX1JFR19UT19DT05TT0xFIHIxMworCVBSSU5UX05FV0xJTkVfVE9f
Q09OU09MRQorCisJLyogVGVzdCBsZi5zZmdlLnMgc2V0IGZsYWcgaWYgcjYgPj0gcjEwLiAgKi8K
KwlsZi5zZmdlLmQgcjEyLHIxMywgcjE0LHIxNQorCU1PVkVfRlJPTV9TUFIgcjIsIFNQUl9TUgor
CVJFUE9SVF9CSVRfVE9fQ09OU09MRSByMiwgU1BSX1NSX0YKKwlQUklOVF9ORVdMSU5FX1RPX0NP
TlNPTEUKKworCS8qIFRlc3QgcmFpc2luZyBhbiBleGNlcHRpb24gYnkgZGl2aWRpbmcgYnkgMC4g
ICovCisJTU9WRV9GUk9NX1NQUiByMiwgU1BSX0ZQQ1NSCisJbC5vcmkJcjIsIHIyLCAweDEKKwlN
T1ZFX1RPX1NQUiBTUFJfRlBDU1IsIHIyCitkaXYwOglsZi5kaXYuZCByMixyMywgcjEyLHIxMywg
cjAscjEKKwlSRVBPUlRfRVhDRVBUSU9OIGRpdjAKKwlQUklOVF9ORVdMSU5FX1RPX0NPTlNPTEUK
KworCVBPUCBMSU5LX1JFR0lTVEVSX1I5CisJUkVUVVJOX1RPX0xJTktfUkVHSVNURVJfUjkKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
