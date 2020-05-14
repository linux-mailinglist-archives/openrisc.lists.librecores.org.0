Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B15451D3F7D
	for <lists+openrisc@lfdr.de>; Thu, 14 May 2020 23:00:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9668820AD9;
	Thu, 14 May 2020 23:00:57 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 5873D20AEF
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 23:00:55 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id x15so1930487pfa.1
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 14:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeprYNepU9URyyhhAnr+PV7TOuxT2UfpG93w5WEj+Nc=;
 b=cJsL8aFpg/dL3Hwwj//Se3fMGLIljJejUEwzH00jVMujr47mU0mdhBn2PqyZnllyDZ
 Gx2BWJJOadCaJS8/gFmaBFK2P7PnPVWsiewgeVkAf2d3kL0tLcjE77bJ4FOywsoD8hXv
 v4RQvRhDMnkt2Tdlgrt4b7+9b73HTeE8n/XSA1+DOk9P20zE5PGZs2AM/LRO45mXeP2V
 rAwbHHEnOEVNkux+GKhZJnLi/m9GQjvhKnxkMuXn3/1rCpZhmqzfT1tm54mf1y9waDPi
 0ReDk9598b4RGj+zO5ek8dVKNZPL9FbhZ7QnsvY2vquSW7r8xpIME1GbYYhTZDR5rWR2
 lCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeprYNepU9URyyhhAnr+PV7TOuxT2UfpG93w5WEj+Nc=;
 b=NjvLsxh8n1YOEkVOn14HX6gseRPyuU1jwXYAAU6Ww6ACqMUzPUolVoctjCjeNop2cq
 LAInfrihIWRX7RL77PMyJ2DKw6qsuiW9eN7V9FCWqfEWA/54hGO8oUUOgeJ4F1vcPWtt
 HsiT6mcmaeS0oJFD646tu+jFMo/dlTyzIcty98g7n3sqmvNAM0CWNJzc1CBiqswKyNVu
 qEf8kalDjJcTV0CBpvJLPLwXkZMq5qQanxOMFkAjKq1BXwml+Rwr38+N7+rEz+TqzgFZ
 XFuPy8HoMEJP8msfdrmPLB9uB4PJGv5NCOxIcktSzGJdQdFsQTlUgFAwaSPoXfx1n3Qw
 xBfw==
X-Gm-Message-State: AOAM531xA8gKOGuxe+ZkS/1OtGURQMkBbicI4ToN5ZVVZHBplxwEpYt1
 DYq0kY76OFd6N4kpQaVzjsI=
X-Google-Smtp-Source: ABdhPJxrdeKBD9zsCW1NIdPporO/sUqkvf6bm07gbJdnyRyYVqEXMCFDRw+namu6LAJaM2wEGXUKMg==
X-Received: by 2002:a62:d458:: with SMTP id u24mr404252pfl.275.1589490053910; 
 Thu, 14 May 2020 14:00:53 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id p8sm19301719pjd.10.2020.05.14.14.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:00:52 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Fri, 15 May 2020 06:00:17 +0900
Message-Id: <20200514210018.2749462-8-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514210018.2749462-1-shorne@gmail.com>
References: <20200514210018.2749462-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 7/8] or1k: refactor: Rename s to sgot and splt
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

VGhlIHN5bWJvbCBuYW1lIHMgZm9yIHNlY3Rpb24gaXMgdGVyc2UsIHJlcGxhY2luZyB3aXRoIHNn
b3Qgd2hlbiBpdApyZWZlcnMgdG8gdGhlIGdvdCBhbmQgc3BsdCB3aGVuIGl0IHJlZmVycyB0byB0
aGUgcGx0IG1ha2VzIHJlYWRpbmcgY29kZQphIGJpdCBlYXNpZXIuCgpiZmQvQ2hhbmdlTG9nOgoK
eXl5eS1tbS1kZCAgU3RhZmZvcmQgSG9ybmUgIDxzaG9ybmVAZ21haWwuY29tPgoKCSogZWxmMzIt
b3Ixay5jIChhbGxvY2F0ZV9keW5yZWxvY3MpOiBSZW5hbWUgcyB0byBzcGx0IG9yIHNnb3QKCWJh
c2VkIG9uIHVzYWdlLgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCAyMCArKysrKysrKysrLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2JmZC9lbGYzMi1vcjFrLmMgYi9iZmQvZWxmMzItb3Ixay5jCmluZGV4IDIy
YzMxNmQwNDIuLjdhYzM0NzM3YWEgMTAwNjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIv
YmZkL2VsZjMyLW9yMWsuYwpAQCAtMjc4MCwxNCArMjc4MCwxNCBAQCBhbGxvY2F0ZV9keW5yZWxv
Y3MgKHN0cnVjdCBlbGZfbGlua19oYXNoX2VudHJ5ICpoLCB2b2lkICogaW5mKQogCiAgICAgICBp
ZiAoV0lMTF9DQUxMX0ZJTklTSF9EWU5BTUlDX1NZTUJPTCAoMSwgYmZkX2xpbmtfcGljIChpbmZv
KSwgaCkpCiAJewotCSAgYXNlY3Rpb24gKnMgPSBodGFiLT5yb290LnNwbHQ7CisJICBhc2VjdGlv
biAqc3BsdCA9IGh0YWItPnJvb3Quc3BsdDsKIAogCSAgLyogSWYgdGhpcyBpcyB0aGUgZmlyc3Qg
LnBsdCBlbnRyeSwgbWFrZSByb29tIGZvciB0aGUgc3BlY2lhbAogCSAgICAgZmlyc3QgZW50cnku
ICAqLwotCSAgaWYgKHMtPnNpemUgPT0gMCkKLQkgICAgcy0+c2l6ZSA9IFBMVF9FTlRSWV9TSVpF
OworCSAgaWYgKHNwbHQtPnNpemUgPT0gMCkKKwkgICAgc3BsdC0+c2l6ZSA9IFBMVF9FTlRSWV9T
SVpFOwogCi0JICBoLT5wbHQub2Zmc2V0ID0gcy0+c2l6ZTsKKwkgIGgtPnBsdC5vZmZzZXQgPSBz
cGx0LT5zaXplOwogCiAJICAvKiBJZiB0aGlzIHN5bWJvbCBpcyBub3QgZGVmaW5lZCBpbiBhIHJl
Z3VsYXIgZmlsZSwgYW5kIHdlIGFyZQogCSAgICAgbm90IGdlbmVyYXRpbmcgYSBzaGFyZWQgbGli
cmFyeSwgdGhlbiBzZXQgdGhlIHN5bWJvbCB0byB0aGlzCkBAIC0yNzk3LDEyICsyNzk3LDEyIEBA
IGFsbG9jYXRlX2R5bnJlbG9jcyAoc3RydWN0IGVsZl9saW5rX2hhc2hfZW50cnkgKmgsIHZvaWQg
KiBpbmYpCiAJICBpZiAoISBiZmRfbGlua19waWMgKGluZm8pCiAJICAgICAgJiYgIWgtPmRlZl9y
ZWd1bGFyKQogCSAgICB7Ci0JICAgICAgaC0+cm9vdC51LmRlZi5zZWN0aW9uID0gczsKKwkgICAg
ICBoLT5yb290LnUuZGVmLnNlY3Rpb24gPSBzcGx0OwogCSAgICAgIGgtPnJvb3QudS5kZWYudmFs
dWUgPSBoLT5wbHQub2Zmc2V0OwogCSAgICB9CiAKIAkgIC8qIE1ha2Ugcm9vbSBmb3IgdGhpcyBl
bnRyeS4gICovCi0JICBzLT5zaXplICs9IFBMVF9FTlRSWV9TSVpFOworCSAgc3BsdC0+c2l6ZSAr
PSBQTFRfRU5UUllfU0laRTsKIAogCSAgLyogV2UgYWxzbyBuZWVkIHRvIG1ha2UgYW4gZW50cnkg
aW4gdGhlIC5nb3QucGx0IHNlY3Rpb24sIHdoaWNoCiAJICAgICB3aWxsIGJlIHBsYWNlZCBpbiB0
aGUgLmdvdCBzZWN0aW9uIGJ5IHRoZSBsaW5rZXIgc2NyaXB0LiAgKi8KQEAgLTI4MjUsNyArMjgy
NSw3IEBAIGFsbG9jYXRlX2R5bnJlbG9jcyAoc3RydWN0IGVsZl9saW5rX2hhc2hfZW50cnkgKmgs
IHZvaWQgKiBpbmYpCiAKICAgaWYgKGgtPmdvdC5yZWZjb3VudCA+IDApCiAgICAgewotICAgICAg
YXNlY3Rpb24gKnM7CisgICAgICBhc2VjdGlvbiAqc2dvdDsKICAgICAgIGJmZF9ib29sZWFuIGR5
bjsKICAgICAgIHVuc2lnbmVkIGNoYXIgdGxzX3R5cGU7CiAKQEAgLTI4MzgsMTYgKzI4MzgsMTYg
QEAgYWxsb2NhdGVfZHlucmVsb2NzIChzdHJ1Y3QgZWxmX2xpbmtfaGFzaF9lbnRyeSAqaCwgdm9p
ZCAqIGluZikKIAkgICAgcmV0dXJuIEZBTFNFOwogCX0KIAotICAgICAgcyA9IGh0YWItPnJvb3Qu
c2dvdDsKKyAgICAgIHNnb3QgPSBodGFiLT5yb290LnNnb3Q7CiAKLSAgICAgIGgtPmdvdC5vZmZz
ZXQgPSBzLT5zaXplOworICAgICAgaC0+Z290Lm9mZnNldCA9IHNnb3QtPnNpemU7CiAKICAgICAg
IHRsc190eXBlID0gKChzdHJ1Y3QgZWxmX29yMWtfbGlua19oYXNoX2VudHJ5ICopIGgpLT50bHNf
dHlwZTsKIAogICAgICAgZHluID0gaHRhYi0+cm9vdC5keW5hbWljX3NlY3Rpb25zX2NyZWF0ZWQ7
CiAgICAgICBkeW4gPSBXSUxMX0NBTExfRklOSVNIX0RZTkFNSUNfU1lNQk9MIChkeW4sIGJmZF9s
aW5rX3BpYyAoaW5mbyksIGgpOwogICAgICAgb3Ixa19zZXRfZ290X2FuZF9yZWxhX3NpemVzICh0
bHNfdHlwZSwgZHluLAotCQkJCSAgICZzLT5zaXplLCAmaHRhYi0+cm9vdC5zcmVsZ290LT5zaXpl
KTsKKwkJCQkgICAmc2dvdC0+c2l6ZSwgJmh0YWItPnJvb3Quc3JlbGdvdC0+c2l6ZSk7CiAgICAg
fQogICBlbHNlCiAgICAgaC0+Z290Lm9mZnNldCA9IChiZmRfdm1hKSAtMTsKLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
