Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8F8470EC1
	for <lists+openrisc@lfdr.de>; Sat, 11 Dec 2021 00:35:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0AFF4242BB;
	Sat, 11 Dec 2021 00:35:17 +0100 (CET)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mail.librecores.org (Postfix) with ESMTPS id 2B189242BA
 for <openrisc@lists.librecores.org>; Sat, 11 Dec 2021 00:35:15 +0100 (CET)
Received: by mail-pf1-f177.google.com with SMTP id u80so9769380pfc.9
 for <openrisc@lists.librecores.org>; Fri, 10 Dec 2021 15:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqOZ/CYELAPRclbZYptoKR6NlKu2839LqE4wp/DvcVQ=;
 b=T+N4bShDbDW2KYeWLk1rzaAsR1/8aOwDXE3FGv/2uPmNYLj5GNKuTi1d1Vfqq6aIwR
 klXh/kdvpDsTEFCHpXJmY0kge8ySIXimPgwRNoSWMHKEyNiF4iDwskq4a+q1X5nKue3t
 rj9nu/DK7ZCkXHpXs/5/men5ETDWL5PYa2lVb29MHzcQTB0lMhkEWr/piKiIDVBV9dOE
 bZarTz4RO3BkvRx5e1lP5kOrYjDNjwAos0maek2o0L0CeF8REKoGy2jOeexIlwW8odLl
 dZl93s0nz7dEI2Fhqg2BVfNmPVpJ2fIxjxjsR6Dy8X6ZpxuQAF2JcY4C0KixV9zsVGXK
 l2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YqOZ/CYELAPRclbZYptoKR6NlKu2839LqE4wp/DvcVQ=;
 b=lfhT7zyJsH1eIfIq37308qObMQnsPs+HVoWLPbixfjdbuSSqXo419blfctqF+qtGlY
 Y7oUk/VrXChUFP23AeT5Tsu6SUUZI1PLUjjL0NAUIhAR/QMzlLcbwrZYP0SPRGKe7Fw0
 dJ2Mo2BQZ6h1cAmDnumjtnNzYUcW5bNQ4VnlplDBH9fYLVbmg/wqTQuh0UeU3pFeE3O9
 l2LFvfTWRxwZ4bmFewrFV0AeYo7tXcxwAwO1vH17EU2TwPiPmot/oglrvVBOVv2LeA26
 RVeKJGdL71M3FbvDpFQqopY4Ox2AtpRN/Ei+a3iE1qwrghO1knaAf95yA2C2Dk04edcD
 167w==
X-Gm-Message-State: AOAM532f264ghDZETMmXnYiHVqQ5sFBHV4nszdlF6d51+ZOnMQK6VypC
 lD9UTfZG4rYCwX83ZTc1j10=
X-Google-Smtp-Source: ABdhPJxIdhlPi5pvkP3oGDa6Iavi/DyooSoxYNenFmBRKh3aFlj8jYiNHY7qzk6k4GE2h+g3EsHtyQ==
X-Received: by 2002:a05:6a00:10cf:b0:4a3:124d:bb81 with SMTP id
 d15-20020a056a0010cf00b004a3124dbb81mr21180361pfu.75.1639179313473; 
 Fri, 10 Dec 2021 15:35:13 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h186sm4372106pfg.64.2021.12.10.15.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 15:35:12 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 11 Dec 2021 08:34:46 +0900
Message-Id: <20211210233456.4146479-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210233456.4146479-1-shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 03/13] or1k: ABI Implementation
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

VGhpcyBjb2RlIGRlYWxzIHdpdGggdGhlIE9wZW5SSVNDIEFCSS4KLS0tCiBzeXNkZXBzL29yMWsv
X19sb25nam1wLlMgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrCiBzeXNkZXBzL29y
MWsvYml0cy9lbmRpYW5uZXNzLmggfCAxMSArKysrKwogc3lzZGVwcy9vcjFrL2JpdHMvc2V0am1w
LmggICAgIHwgMzIgKysrKysrKysrKysrKwogc3lzZGVwcy9vcjFrL2JzZC1fc2V0am1wLlMgICAg
IHwgIDEgKwogc3lzZGVwcy9vcjFrL2JzZC1zZXRqbXAuUyAgICAgIHwgIDEgKwogc3lzZGVwcy9v
cjFrL2RsLXRyYW1wb2xpbmUuUyAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHN5c2RlcHMvb3Ixay9qbXBidWYtb2Zmc2V0cy5oICB8IDIzICsrKysrKysrKysKIHN5c2Rl
cHMvb3Ixay9qbXBidWYtdW53aW5kLmggICB8IDM2ICsrKysrKysrKysrKysrKwogc3lzZGVwcy9v
cjFrL21hY2hpbmUtZ21vbi5oICAgIHwgMzUgKysrKysrKysrKysrKysKIHN5c2RlcHMvb3Ixay9t
ZW11c2FnZS5oICAgICAgICB8IDIxICsrKysrKysrKwogc3lzZGVwcy9vcjFrL3NldGptcC5TICAg
ICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysKIHN5c2RlcHMvb3Ixay9zeXNkZXAu
aCAgICAgICAgICB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEyIGZp
bGVzIGNoYW5nZWQsIDQzMyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVw
cy9vcjFrL19fbG9uZ2ptcC5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2JpdHMv
ZW5kaWFubmVzcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2JpdHMvc2V0am1w
LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvYnNkLV9zZXRqbXAuUwogY3JlYXRl
IG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ixay9ic2Qtc2V0am1wLlMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzeXNkZXBzL29yMWsvZGwtdHJhbXBvbGluZS5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVw
cy9vcjFrL2ptcGJ1Zi1vZmZzZXRzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsv
am1wYnVmLXVud2luZC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL21hY2hpbmUt
Z21vbi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL21lbXVzYWdlLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvc2V0am1wLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
eXNkZXBzL29yMWsvc3lzZGVwLmgKCmRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvX19sb25nam1w
LlMgYi9zeXNkZXBzL29yMWsvX19sb25nam1wLlMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uZjhhYTVkZGE4ZgotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9f
X2xvbmdqbXAuUwpAQCAtMCwwICsxLDU1IEBACisvKiBsb25nam1wLCBPcGVuUklTQyB2ZXJzaW9u
LgorICAgQ29weXJpZ2h0IChDKSAyMDIxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgor
ICAgVGhpcyBmaWxlIGlzIHBhcnQgb2YgdGhlIEdOVSBDIExpYnJhcnkuCisKKyAgIFRoZSBHTlUg
QyBMaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
cgorICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFs
IFB1YmxpYworICAgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyCisgICB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlv
dXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAgIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
CisgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
ICBTZWUgdGhlIEdOVQorICAgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUg
ZGV0YWlscy4KKworICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05V
IExlc3NlciBHZW5lcmFsIFB1YmxpYworICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBHTlUgQyBM
aWJyYXJ5OyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlCisgICBTb2Z0d2FyZSBGb3VuZGF0aW9u
LCBJbmMuLCA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBNQQorICAgMDIxMTEt
MTMwNyBVU0EuICAqLworCisjaW5jbHVkZSA8ZmVhdHVyZXMuaD4KKyNkZWZpbmUgX0FTTQorI2Rl
ZmluZSBfU0VUSk1QX0gKKyNpbmNsdWRlIDxiaXRzL3NldGptcC5oPgorCisJLmdsb2JsCV9fbG9u
Z2ptcDsKKwkudHlwZQlfX2xvbmdqbXAsIEBmdW5jdGlvbjsKKwkuYWxpZ24JNDsKKworX19sb25n
am1wOgorCWwubHd6CXIxLCAwKHIzKQorCWwubHd6CXIyLCA0KHIzKQorCisJLyogaWYgcjQgaXMg
MCwgc29tZXRoaW5nIHdyb25nLCBzbyBzZXQgaXQgdG8gMSAqLworCWwuc2ZlcWkJcjQsIDB4MAor
CWwuYm5mCTFmCQkvKiByNCAhPSAwLCBsb25nam1wIHZhbHVlIHNlbnNpYmxlICovCisJIGwubm9w
CisJbC5vcmkJcjQsIHIwLCAweDEJLyogbWFrZSBub256ZXJvICovCisxOgorCWwuYWRkaQlyMTEs
IHI0LCAwCisJbC5sd3oJcjksIDgocjMpCisJbC5sd3oJcjEwLCAxMihyMykKKwlsLmx3eglyMTQs
IDE2KHIzKQorCWwubHd6CXIxNiwgMjAocjMpCisJbC5sd3oJcjE4LCAyNChyMykKKwlsLmx3egly
MjAsIDI4KHIzKQorCWwubHd6CXIyMiwgMzIocjMpCisJbC5sd3oJcjI0LCAzNihyMykKKwlsLmx3
eglyMjYsIDQwKHIzKQorCWwubHd6CXIyOCwgNDQocjMpCisJbC5sd3oJcjMwLCA0OChyMykKKwls
LmpyCXI5CisJIGwubm9wCisJLnNpemUJX19sb25nam1wLCAuIC0gX19sb25nam1wCisKK2xpYmNf
aGlkZGVuX2RlZihfX2xvbmdqbXApCmRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvYml0cy9lbmRp
YW5uZXNzLmggYi9zeXNkZXBzL29yMWsvYml0cy9lbmRpYW5uZXNzLmgKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uN2I2MWQ4YWRiNwotLS0gL2Rldi9udWxsCisrKyBiL3N5
c2RlcHMvb3Ixay9iaXRzL2VuZGlhbm5lc3MuaApAQCAtMCwwICsxLDExIEBACisjaWZuZGVmIF9C
SVRTX0VORElBTk5FU1NfSAorI2RlZmluZSBfQklUU19FTkRJQU5ORVNTX0ggMQorCisjaWZuZGVm
IF9CSVRTX0VORElBTl9ICisjIGVycm9yICJOZXZlciB1c2UgPGJpdHMvZW5kaWFubmVzcy5oPiBk
aXJlY3RseTsgaW5jbHVkZSA8ZW5kaWFuLmg+IGluc3RlYWQuIgorI2VuZGlmCisKKy8qIE9wZW5S
SVNDIGlzIGJpZy1lbmRpYW4uICAqLworI2RlZmluZSBfX0JZVEVfT1JERVIgX19CSUdfRU5ESUFO
CisKKyNlbmRpZiAvKiBiaXRzL2VuZGlhbm5lc3MuaCAqLwpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9v
cjFrL2JpdHMvc2V0am1wLmggYi9zeXNkZXBzL29yMWsvYml0cy9zZXRqbXAuaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kYWM1MTFjOTA0Ci0tLSAvZGV2L251bGwKKysr
IGIvc3lzZGVwcy9vcjFrL2JpdHMvc2V0am1wLmgKQEAgLTAsMCArMSwzMiBAQAorLyogRGVmaW5l
IHRoZSBtYWNoaW5lLWRlcGVuZGVudCB0eXBlIGBqbXBfYnVmJy4gIE9wZW5SSVNDIHZlcnNpb24u
CisgICBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisg
ICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFyeS4KKworICAgVGhlIEdOVSBD
IExpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
CisgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwg
UHVibGljCisgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIKKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICAgYnV0IFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YK
KyAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
IFNlZSB0aGUgR05VCisgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBk
ZXRhaWxzLgorCisgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
TGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExp
YnJhcnk7IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUKKyAgIFNvZnR3YXJlIEZvdW5kYXRpb24s
IEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BCisgICAwMjExMS0x
MzA3IFVTQS4gICovCisKKworI2lmbmRlZiBfT1IxS19CSVRTX1NFVEpNUF9ICisjZGVmaW5lIF9P
UjFLX0JJVFNfU0VUSk1QX0ggIDEKKworI2lmICFkZWZpbmVkIF9TRVRKTVBfSCAmJiAhZGVmaW5l
ZCBfUFRIUkVBRF9ICisjIGVycm9yICJOZXZlciBpbmNsdWRlIDxiaXRzL3NldGptcC5oPiBkaXJl
Y3RseTsgdXNlIDxzZXRqbXAuaD4gaW5zdGVhZC4iCisjZW5kaWYKKworI2lmbmRlZiBfQVNNCit0
eXBlZGVmIGxvbmcgaW50IF9fam1wX2J1ZlsxM107CisjZW5kaWYKKworI2VuZGlmIC8qIF9PUjFL
X0JJVFNfU0VUSk1QX0ggKi8KZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9ic2QtX3NldGptcC5T
IGIvc3lzZGVwcy9vcjFrL2JzZC1fc2V0am1wLlMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uNGU2YTJkYTU2MAotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9i
c2QtX3NldGptcC5TCkBAIC0wLDAgKzEgQEAKKy8qIF9zZXRqbXAgaXMgaW4gc2V0am1wLlMgICov
CmRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvYnNkLXNldGptcC5TIGIvc3lzZGVwcy9vcjFrL2Jz
ZC1zZXRqbXAuUwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xZGE4NDhk
MmYxCi0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFrL2JzZC1zZXRqbXAuUwpAQCAtMCww
ICsxIEBACisvKiBzZXRqbXAgaXMgaW4gc2V0am1wLlMgICovCmRpZmYgLS1naXQgYS9zeXNkZXBz
L29yMWsvZGwtdHJhbXBvbGluZS5TIGIvc3lzZGVwcy9vcjFrL2RsLXRyYW1wb2xpbmUuUwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45ZWJjNjhmNTI1Ci0tLSAvZGV2L251
bGwKKysrIGIvc3lzZGVwcy9vcjFrL2RsLXRyYW1wb2xpbmUuUwpAQCAtMCwwICsxLDc5IEBACisv
KiBNYWNoaW5lLWRlcGVuZGVudCBFTEYgcnVudGltZSBzeW1ib2wgcmVzb2x1dGlvbiwgT3BlblJJ
U0MgdmVyc2lvbi4KKyAgIENvcHlyaWdodCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisg
ICBUaGUgR05VIEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNz
ZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2Us
IG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBM
aWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWws
CisgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0
aGUgR05VIEMgTGlicmFyeTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZQorICAgU29mdHdhcmUg
Rm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEK
KyAgIDAyMTExLTEzMDcgVVNBLiAgKi8KKworLyogVGhpcyBjb2RlIGlzIHVzZWQgdG8gY2FsbCBf
ZGxfbGludXhfcmVzb2x2ZXIgKGRsLXJ1bnRpbWUuYykuCisKKyAgIFdlIGFzc3VtZSB0aGF0IFIx
MSBjb250YWlucyB0aGUgcmVsb2NhdGlvbiBvZmZzZXQgYW5kIFIxMiBjb250YWlucworICAgbGlu
a19tYXAgKF9EWU5BTUlDKS4gIFRoaXMgbXVzdCBiZSBjb25zaXN0ZW50IHdpdGggdGhlIEpVTVBf
U0xPVAorICAgbGF5b3V0IGdlbmVyYXRlZCBieSBiaW51dGlscy4gICovCisKKwkuc2VjdGlvbiAu
dGV4dAorCS5hbGlnbiA0CisKKwkuZ2xvYmFsCV9kbF9ydW50aW1lX3Jlc29sdmUKKwkudHlwZQlf
ZGxfcnVudGltZV9yZXNvbHZlLCBAZnVuY3Rpb24KKworX2RsX3J1bnRpbWVfcmVzb2x2ZToKKwku
Y2ZpX3N0YXJ0cHJvYworCWwuc3cJLTQocjEpLCByOQorCWwuc3cJLTgocjEpLCByMQorCisJLyog
c2F2ZSBmdW5jdGlvbiBhcmd1bWVudHMuICAqLworCWwuc3cJLTEyKHIxKSwgcjMKKwlsLnN3CS0x
NihyMSksIHI0CisJbC5zdwktMjAocjEpLCByNQorCWwuc3cJLTI0KHIxKSwgcjYKKwlsLnN3CS0y
OChyMSksIHI3CisJbC5zdwktMzIocjEpLCByOAorCisJLmNmaV9vZmZzZXQgOSwgLTQKKwkuY2Zp
X29mZnNldCAxLCAtOAorCS5jZmlfb2Zmc2V0IDMsIC0xMgorCS5jZmlfb2Zmc2V0IDQsIC0xNgor
CS5jZmlfb2Zmc2V0IDUsIC0yMAorCS5jZmlfb2Zmc2V0IDYsIC0yNAorCS5jZmlfb2Zmc2V0IDcs
IC0yOAorCS5jZmlfb2Zmc2V0IDgsIC0zMgorCisJbC5hZGRpCXIxLHIxLCAtMzIKKwkuY2ZpX2Rl
Zl9jZmFfb2Zmc2V0IDMyCisKKwlsLm9yaQlyMywgcjEyLCAwCisJbC5vcmkJcjQsIHIxMSwgMAor
CisJbC5qYWwJX2RsX2ZpeHVwCisJIGwubm9wCisKKwkvKiBSZXN0b3JlIGZ1bmN0aW9uIGFyZ3Vt
ZW50cy4gICovCisJbC5hZGRpCXIxLHIxLCAzMgorCWwubHd6CXI4LCAtMzIocjEpCisJbC5sd3oJ
cjcsIC0yOChyMSkKKwlsLmx3eglyNiwgLTI0KHIxKQorCWwubHd6CXI1LCAtMjAocjEpCisJbC5s
d3oJcjQsIC0xNihyMSkKKwlsLmx3eglyMywgLTEyKHIxKQorCisJLyogcmVzdG9yZSByZXR1cm4g
YWRkcmVzcy4gICovCisJbC5sd3oJcjksIC00KHIxKQorCisJbC5qcglyMTEKKwkgbC5ub3AKKwor
CS5jZmlfZW5kcHJvYworCS5zaXplCV9kbF9ydW50aW1lX3Jlc29sdmUsIC4gLSBfZGxfcnVudGlt
ZV9yZXNvbHZlCmRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvam1wYnVmLW9mZnNldHMuaCBiL3N5
c2RlcHMvb3Ixay9qbXBidWYtb2Zmc2V0cy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLmUzMzEwNWNjMDMKLS0tIC9kZXYvbnVsbAorKysgYi9zeXNkZXBzL29yMWsvam1w
YnVmLW9mZnNldHMuaApAQCAtMCwwICsxLDIzIEBACisvKiBQcml2YXRlIG1hY3JvcyBmb3IgYWNj
ZXNzaW5nIF9fam1wX2J1ZiBjb250ZW50cy4gIE9wZW5SSVNDIHZlcnNpb24uCisgICBDb3B5cmln
aHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisgICBUaGlzIGZpbGUg
aXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFyeS4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgICBtb2RpZnkg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIKKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFu
eSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBp
biB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICAgYnV0IFdJVEhPVVQgQU5ZIFdB
UlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAgIE1FUkNIQU5U
QUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05V
CisgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCisg
ICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVy
YWwgUHVibGljCisgICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJhcnkuICBJZiBu
b3QsIHNlZQorICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4gICovCisKKyNkZWZp
bmUgX19KTVBfQlVGX1NQICAgIDAKKworLyogSGVscGVyIGZvciBnZW5lcmljIGZ1bmN0aW9uIF9f
X19sb25nam1wX2Noay4gICovCisjZGVmaW5lIEpCX0ZSQU1FX0FERFJFU1MoYnVmKSBcCisgICAg
KCh2b2lkICopICh1bnNpZ25lZCBsb25nKSAoYnVmW19fSk1QX0JVRl9TUF0pKQpkaWZmIC0tZ2l0
IGEvc3lzZGVwcy9vcjFrL2ptcGJ1Zi11bndpbmQuaCBiL3N5c2RlcHMvb3Ixay9qbXBidWYtdW53
aW5kLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNjcxMGRlYTk4OQot
LS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9qbXBidWYtdW53aW5kLmgKQEAgLTAsMCAr
MSwzNiBAQAorLyogTWFjcm9zIHRvIGhlbHAgZnJhbWUgdW53aW5kaW5nIHVzaW5nIGptcGJ1Zi4g
IE9wZW5SSVNDIHZlcnNpb24uCisgICBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uLCBJbmMuCisgICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFy
eS4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yCisgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBM
aWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGUg
R05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLAorICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGlt
cGxpZWQgd2FycmFudHkgb2YKKyAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCisgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQg
YSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFsb25n
IHdpdGggdGhlIEdOVSBDIExpYnJhcnkuICBJZiBub3QsIHNlZQorICAgPGh0dHBzOi8vd3d3Lmdu
dS5vcmcvbGljZW5zZXMvPi4gICovCisKKyNpbmNsdWRlIDxzZXRqbXAuaD4KKyNpbmNsdWRlIDxq
bXBidWYtb2Zmc2V0cy5oPgorI2luY2x1ZGUgPHN0ZGludC5oPgorI2luY2x1ZGUgPHVud2luZC5o
PgorCisvKiBUZXN0IGlmIGxvbmdqbXAgdG8gSk1QQlVGIHdvdWxkIHVud2luZCB0aGUgZnJhbWUK
KyAgIGNvbnRhaW5pbmcgYSBsb2NhbCB2YXJpYWJsZSBhdCBBRERSRVNTLiAgKi8KKyNkZWZpbmUg
X0pNUEJVRl9VTldJTkRTKGptcGJ1ZiwgYWRkcmVzcywgZGVtYW5nbGUpIFwKKyAgKCh2b2lkICop
IChhZGRyZXNzKSA8ICh2b2lkICopIGRlbWFuZ2xlIChqbXBidWZbX19KTVBfQlVGX1NQXSkpCisK
KyNkZWZpbmUgX0pNUEJVRl9DRkFfVU5XSU5EU19BREooX2ptcGJ1ZiwgX2NvbnRleHQsIF9hZGop
IFwKKyAgX0pNUEJVRl9VTldJTkRTX0FESiAoX2ptcGJ1ZiwgKHZvaWQgKikgX1Vud2luZF9HZXRD
RkEgKF9jb250ZXh0KSwgX2FkaikKKworI2RlZmluZSBfSk1QQlVGX1VOV0lORFNfQURKKF9qbXBi
dWYsIF9hZGRyZXNzLCBfYWRqKSBcCisgICgodWludHB0cl90KSAoX2FkZHJlc3MpIC0gKF9hZGop
IDwgKHVpbnRwdHJfdCkgKF9qbXBidWYpW19fSk1QX0JVRl9TUF0gLSAoX2FkaikpCisKKy8qIFdl
IHVzZSB0aGUgbm9ybWFsIGxvbmdqbXAgZm9yIHVud2luZGluZy4gICovCisjZGVmaW5lIF9fbGli
Y191bndpbmRfbG9uZ2ptcChidWYsIHZhbCkgX19saWJjX2xvbmdqbXAgKGJ1ZiwgdmFsKQpkaWZm
IC0tZ2l0IGEvc3lzZGVwcy9vcjFrL21hY2hpbmUtZ21vbi5oIGIvc3lzZGVwcy9vcjFrL21hY2hp
bmUtZ21vbi5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjcxNTIxMDVl
ZWMKLS0tIC9kZXYvbnVsbAorKysgYi9zeXNkZXBzL29yMWsvbWFjaGluZS1nbW9uLmgKQEAgLTAs
MCArMSwzNSBAQAorLyogTWFjaGluZS1kZXBlbmRlbnQgZGVmaW5pdGlvbnMgZm9yIHByb2ZpbGlu
ZyBzdXBwb3J0LiAgT3BlblJJU0MgdmVyc2lvbi4KKyAgIENvcHlyaWdodCAoQykgMjAyMSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBH
TlUgQyBMaWJyYXJ5LgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVibGlz
aGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lvbiAy
LjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24u
CisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCisgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExp
Y2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeS4gIElmIG5vdCwgc2VlCisgICA8aHR0
cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KKworI2luY2x1ZGUgPHN5c2RlcC5oPgor
CisjZGVmaW5lIF9NQ09VTlRfREVDTChmcm9tcGMsIHNlbGZwYykJCQkJCVwKK3N0YXRpYyB2b2lk
CQkJCQkJCQlcCitfX21jb3VudF9pbnRlcm5hbCAodW5zaWduZWQgbG9uZyBpbnQgZnJvbXBjLCB1
bnNpZ25lZCBsb25nIGludCBzZWxmcGMpCisKKy8qIFRoaXMgaXMgdmVyeSBzaW1wbGUgYXMgZ2Nj
IGRvZXMgYWxsIHRoZSBoZWF2eSBsaWZ0aW5nIGF0IHRoZSBfbWNvdW50CisgICBjYWxsIHNpdGUu
ICBHQ0MgcGFzc2VzIGluIHRoZSByZXR1cm4gYWRkcmVzcyBvZiB0aGUgZnVuY3Rpb24gY2FsbGlu
ZworICAgX21jb3VudC4gICovCisKKyNkZWZpbmUgTUNPVU5UCQkJCQkJCQlcCit2b2lkCQkJCQkJ
CQkJXAorX21jb3VudCAodm9pZCAqZnJvbXBjKQkJCQkJCQlcCit7CQkJCQkJCQkJXAorICBfX21j
b3VudF9pbnRlcm5hbCAoKHVuc2lnbmVkIGxvbmcgaW50KSBmcm9tcGMsCQkJXAorCQkgICAgICh1
bnNpZ25lZCBsb25nIGludCkgX19idWlsdGluX3JldHVybl9hZGRyZXNzICgwKSk7CVwKK30KZGlm
ZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9tZW11c2FnZS5oIGIvc3lzZGVwcy9vcjFrL21lbXVzYWdl
LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYTYyZGExN2U2MQotLS0g
L2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9tZW11c2FnZS5oCkBAIC0wLDAgKzEsMjEgQEAK
Ky8qIERlZmluaXRpb25zIGZvciBtZW1vcnkgdXNhZ2UgcHJvZmlsaW5nLiAgT3BlblJJU0MgdmVy
c2lvbi4KKyAgIENvcHlyaWdodCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIElu
Yy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUg
R05VIEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2Vu
ZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChh
dCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhl
IEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05V
IEMgTGlicmFyeTsgaWYgbm90LCBzZWUKKyAgIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uICAqLworCisjZGVmaW5lIEdFVFNQKCkgKHsgcmVnaXN0ZXIgdWludHB0cl90IHN0YWNrX3B0
ciBhc20gKCJyMSIpOyBzdGFja19wdHI7IH0pCisKKyNpbmNsdWRlIDxzeXNkZXBzL2dlbmVyaWMv
bWVtdXNhZ2UuaD4KZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9zZXRqbXAuUyBiL3N5c2RlcHMv
b3Ixay9zZXRqbXAuUwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42NjA5
OTViNDkzCi0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFrL3NldGptcC5TCkBAIC0wLDAg
KzEsNTYgQEAKKy8qIHNldGptcCwgT3BlblJJU0MgdmVyc2lvbi4KKyAgIENvcHlyaWdodCAoQykg
MjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0
IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgorICAg
dmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVy
IHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBo
b3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7
IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZ
IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAgIExl
c3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisKKyAgIFlvdSBz
aG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJs
aWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeTsgaWYgbm90LCB3cml0
ZSB0byB0aGUgRnJlZQorICAgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBs
YWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEKKyAgIDAyMTExLTEzMDcgVVNBLiAgKi8KKworI2lu
Y2x1ZGUgPHN5c2RlcC5oPgorI2RlZmluZSBfQVNNCisjZGVmaW5lIF9TRVRKTVBfSAorI2luY2x1
ZGUgPGJpdHMvc2V0am1wLmg+CisKK0VOVFJZIChfc2V0am1wKQorCWwuYWRkaQlyNCwgcjAsIDAg
ICAgIC8qIFNldCBzZWNvbmQgYXJndW1lbnQgdG8gMC4gICovCisJbC5qCS5Mb2NhbF9fc2lnc2V0
am1wCisJIGwubm9wCitFTkQgKF9zZXRqbXApCitsaWJjX2hpZGRlbl9kZWYgKF9zZXRqbXApCisK
K0VOVFJZIChzZXRqbXApCisJbC5hZGRpCXI0LCByMCwgMSAgICAgLyogU2V0IHNlY29uZCBhcmd1
bWVudCB0byAxLiAgKi8KKwlsLmoJLkxvY2FsX19zaWdzZXRqbXAKKwkgbC5ub3AKK0VORCAoc2V0
am1wKQorCitFTlRSWSAoX19zaWdzZXRqbXApCisuTG9jYWxfX3NpZ3NldGptcDoKKwlsLnN3CTAo
cjMpLCByMQorCWwuc3cJNChyMyksIHIyCisJbC5zdwk4KHIzKSwgcjkKKwlsLnN3CTEyKHIzKSwg
cjEwCisJbC5zdwkxNihyMyksIHIxNAorCWwuc3cJMjAocjMpLCByMTYKKwlsLnN3CTI0KHIzKSwg
cjE4CisJbC5zdwkyOChyMyksIHIyMAorCWwuc3cJMzIocjMpLCByMjIKKwlsLnN3CTM2KHIzKSwg
cjI0CisJbC5zdwk0MChyMyksIHIyNgorCWwuc3cJNDQocjMpLCByMjgKKwlsLnN3CTQ4KHIzKSwg
cjMwCisJbC5qCV9fc2lnam1wX3NhdmUKKwkgbC5ub3AKK0VORCAoX19zaWdzZXRqbXApCitoaWRk
ZW5fZGVmIChfX3NpZ3NldGptcCkKZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9zeXNkZXAuaCBi
L3N5c2RlcHMvb3Ixay9zeXNkZXAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi42MWExMzVhZmU3Ci0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFrL3N5c2RlcC5o
CkBAIC0wLDAgKzEsODMgQEAKKy8qIEFzc2VtYmxlciBtYWNybyBkZWZpbml0aW9ucy4gIE9wZW5S
SVNDIHZlcnNpb24uCisgICBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuCisgICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFyeS4KKwor
ICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCisgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVz
c2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNl
LCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGUgR05VIEMg
TGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVs
LAorICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YKKyAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBmb3IgbW9yZSBkZXRhaWxzLgorCisgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5
IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFsb25nIHdpdGgg
dGhlIEdOVSBDIExpYnJhcnkuICBJZiBub3QsIHNlZQorICAgPGh0dHBzOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4gICovCisKKyNpbmNsdWRlIDxzeXNkZXBzL2dlbmVyaWMvc3lzZGVwLmg+Cisj
aW5jbHVkZSA8ZmVhdHVyZXMuaD4KKworI2lmIGRlZmluZWQgX19BU1NFTUJMRVJfXyB8fCBkZWZp
bmVkIFJFUVVFU1RfQVNTRU1CTEVSX01BQ1JPUworCisvKiBNYWtlIHVzZSBvZiAuc2l6ZSBkaXJl
Y3RpdmUuICAqLworI2RlZmluZSBBU01fU0laRV9ESVJFQ1RJVkUobmFtZSkgLnNpemUgbmFtZSwu
LW5hbWU7CisKKy8qIERlZmluZSBhbiBlbnRyeSBwb2ludCB2aXNpYmxlIGZyb20gQy4gICovCisj
ZGVmaW5lIEVOVFJZKG5hbWUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCisgIC5nbG9ibCBDX1NZTUJPTF9OQU1FKG5hbWUpOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgIC50eXBlIENf
U1lNQk9MX05BTUUobmFtZSksQGZ1bmN0aW9uOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCisgIC5hbGlnbiA0OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgIENfTEFCRUwobmFtZSkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCisgIGNmaV9zdGFydHByb2M7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgIENBTExfTUNPVU5UCisKKyN1bmRlZiAgRU5E
CisjZGVmaW5lIEVORChuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCisgIGNmaV9lbmRwcm9jOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgIEFTTV9T
SVpFX0RJUkVDVElWRShuYW1lKQorCisvKiBTaW5jZSBDIGlkZW50aWZpZXJzIGFyZSBub3Qgbm9y
bWFsbHkgcHJlZml4ZWQgd2l0aCBhbiB1bmRlcnNjb3JlCisgICBvbiB0aGlzIHN5c3RlbSwgdGhl
IGFzbSBpZGVudGlmaWVyIGBzeXNjYWxsX2Vycm9yJyBpbnRydWRlcyBvbiB0aGUKKyAgIEMgbmFt
ZSBzcGFjZS4gIE1ha2Ugc3VyZSB3ZSB1c2UgYW4gaW5ub2N1b3VzIG5hbWUuICAqLworI2RlZmlu
ZSBzeXNjYWxsX2Vycm9yICAgX19zeXNjYWxsX2Vycm9yCisKKy8qIElmIGNvbXBpbGVkIGZvciBw
cm9maWxpbmcsIGNhbGwgYG1jb3VudCcgYXQgdGhlIHN0YXJ0IG9mIGVhY2ggZnVuY3Rpb24uICAq
LworI2lmZGVmICBQUk9GCisjIGlmZGVmIF9fUElDX18KKyMgIGRlZmluZSBDQUxMX01DT1VOVAkJ
CQkJCVwKKwlsLmFkZGkJcjEsIHIxLCAtODsJCQkJCVwKKwlsLnN3CTAocjEpLCByOTsJCQkJCVwK
KwlsLnN3CTQocjEpLCByMzsJCQkJCVwKKwlsLm9yaQlyMywgcjksIDA7CQkJCQlcCisJbC5qCXBs
dChfbWNvdW50KTsJCQkJCVwKKwkgbC5ub3A7CQkJCQkJCVwKKwlsLmx3eglyOSwgMChyMSk7CQkJ
CQlcCisJbC5sd3oJcjMsIDQocjEpOwkJCQkJXAorCWwuYWRkaQlyMSwgcjEsIDg7CisjIGVsc2UK
KyMgIGRlZmluZSBDQUxMX01DT1VOVAkJCQkJCVwKKwlsLmFkZGkJcjEsIHIxLCAtODsJCQkJCVwK
KwlsLnN3CTAocjEpLCByOTsJCQkJCVwKKwlsLnN3CTQocjEpLCByMzsJCQkJCVwKKwlsLm9yaQly
MywgcjksIDA7CQkJCQlcCisJbC5tb3ZoaSByMTUsIGhpKF9tY291bnQpOwkJCQlcCisJbC5vcmkJ
cjE1LCByMTUsIGxvKF9tY291bnQpOwkJCQlcCisJbC5qcglyMTU7CQkJCQkJXAorCSBsLm5vcDsJ
CQkJCQkJXAorCWwubHd6CXI5LCAwKHIxKTsJCQkJCVwKKwlsLmx3eglyMywgNChyMSk7CQkJCQlc
CisJbC5hZGRpCXIxLCByMSwgODsKKyMgZW5kaWYKKyNlbHNlCisjIGRlZmluZSBDQUxMX01DT1VO
VCAgICAgICAgICAgICAvKiBEbyBub3RoaW5nLiAgKi8KKyNlbmRpZgorCisvKiBMb2NhbCBsYWJl
bCBuYW1lIGZvciBhc20gY29kZS4gICovCisjZGVmaW5lIEwobmFtZSkgICAgICAgICAuTCMjbmFt
ZQorCisvKiBTcGVjaWZ5IHRoZSBzaXplIGluIGJ5dGVzIG9mIGEgbWFjaGluZSByZWdpc3Rlci4g
ICovCisjZGVmaW5lIFJFR1NJWkUgICAgICAgICA0CisKKyNlbmRpZiAvKiBfX0FTU0VNQkxFUl9f
ICovCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
