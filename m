Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA741D3F74
	for <lists+openrisc@lfdr.de>; Thu, 14 May 2020 23:00:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0801020AF2;
	Thu, 14 May 2020 23:00:40 +0200 (CEST)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mail.librecores.org (Postfix) with ESMTPS id DF7E420A79
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 23:00:38 +0200 (CEST)
Received: by mail-pf1-f182.google.com with SMTP id z1so1923864pfn.3
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjwYZEBD4dLQZtYkMS0VskGY7+obUaPOSff+m9F9MuQ=;
 b=Ol+DGyK3LfJ07nkffAFtA/YvpKxfDdBaWxcp46fsm37Mexw1ER/cu4JkDiZZt4n0t3
 DCdM2bDLBHlkx94nZfzQZGKAe5XjCm+abx1/cnymiK72wZpyOKbSQwxLz31MXU6en8U8
 KRdepx8HyzPs5y4S2OoLy9zcldB4LHTSziz3QjbM5lLV7nJHHtgjvrufb5IZUHf7OlPc
 lwbQg3wvUZdYDas7gTMPP6aHjSUnz0ZoBS0FVS6uOFIyLu2oz7qir0FiW2Lg5kn4AJEV
 qHvpy5qzUpD5uF45Jm9GpQ8oZy9qLkgM7hQNt7P3+m1QJTOk106YaCSjZ6wm69v9Op3g
 ss9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjwYZEBD4dLQZtYkMS0VskGY7+obUaPOSff+m9F9MuQ=;
 b=ifOypQ12b57V/zC6He4CJ70/XSlnl0h9E4aT0c7ZFn/jDMKboYRj34v10tSrq5FN4G
 xg/wsLUAfd07bejzU6+n6KB9y+CycwVOzf9URQvs3ZFZFEGgySmxDkHdiyWcs/Fg+ws/
 ktt5zbkeANwuAoRV3qAdXguGh286OrrvCAB5RwJFgPl7LUTN2bGecmc2AGPKyFCrkxeL
 49xrc8U+FTk/QU9d8zmuWL5eTtpLjWM9Z6PgR4a1uMbA56tB6IJErpYQ5k3wOSRwjPnV
 Mlr/z8yEi+stSCe0yIL2Zvplx8xzNuXVv3FqhIMZhkCHOg2qQB7CRXUzGRugDh3ddhGB
 POFQ==
X-Gm-Message-State: AOAM5314THJZ7V8kAXfmBeFfL/Z7oC2EVRLAM6nxiS393Ln14gjSmgBz
 7GzOmqjSwQI2ZSiZBY6ZmzU=
X-Google-Smtp-Source: ABdhPJx2QnFP5oa9rO09Epd1duZ1709ILaEF5jWSme18aPAF6c9KaZejs13HdfJUMUYjEw7V6/iWMg==
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr448886pfs.104.1589490037525; 
 Thu, 14 May 2020 14:00:37 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id e21sm100815pga.71.2020.05.14.14.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:00:36 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Fri, 15 May 2020 06:00:12 +0900
Message-Id: <20200514210018.2749462-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514210018.2749462-1-shorne@gmail.com>
References: <20200514210018.2749462-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/8] or1k: Fix dynamic TLS symbol flag
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

VGhlIGR5bmFtaWMgZmxhZyB1c2VkIGZvciBUTFMgcmVsb2NhdGlvbnMgd2FzIG5vdCBwcm9wZXJs
eSBiZWluZyBzZXQKZm9yIHNvbWUgY2FzZXMgY2F1c2luZyBsaW5rIGZhaWx1cmUuICBUaGUgZml4
IGhlcmUgd2FzIG1vc3RseSBjb3BpZWQKZnJvbSBvdGhlciBCRkQgaW1wbGVtZW50YXRpb25zLgoK
YmZkL0NoYW5nZUxvZzoKCnl5eXktbW0tZGQgIFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWls
LmNvbT4KCgkqIGJmZC9lbGYzMi1vcjFrLmMgKG9yMWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24pOiBG
aXh1cCBkeW5hbWljCglzeW1ib2wgZGV0ZWN0aW9uLgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCAx
OSArKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9iZmQvZWxmMzItb3Ixay5jIGIvYmZkL2VsZjMy
LW9yMWsuYwppbmRleCAyMjFhMTRjNWIxLi45OWEzNmM3ZjA0IDEwMDY0NAotLS0gYS9iZmQvZWxm
MzItb3Ixay5jCisrKyBiL2JmZC9lbGYzMi1vcjFrLmMKQEAgLTE1OTIsNiArMTU5Miw3IEBAIG9y
MWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24gKGJmZCAqb3V0cHV0X2JmZCwKIAkgICAgYXNlY3Rpb24g
KnNyZWxnb3Q7CiAJICAgIGJmZF9ieXRlICpsb2M7CiAJICAgIGludCBkeW5hbWljOworCSAgICBp
bnQgaW5keCA9IDA7CiAKIAkgICAgc3JlbGdvdCA9IGh0YWItPnJvb3Quc3JlbGdvdDsKIApAQCAt
MTYxOCwxMyArMTYxOSwyMyBAQCBvcjFrX2VsZl9yZWxvY2F0ZV9zZWN0aW9uIChiZmQgKm91dHB1
dF9iZmQsCiAJICAgIEJGRF9BU1NFUlQgKGVsZl9oYXNoX3RhYmxlIChpbmZvKS0+aGdvdCA9PSBO
VUxMCiAJCQl8fCBlbGZfaGFzaF90YWJsZSAoaW5mbyktPmhnb3QtPnJvb3QudS5kZWYudmFsdWUg
PT0gMCk7CiAKKwkgICAgaWYgKGggIT0gTlVMTCkKKwkgICAgICB7CisJCWJmZF9ib29sZWFuIGR5
biA9IGh0YWItPnJvb3QuZHluYW1pY19zZWN0aW9uc19jcmVhdGVkOworCQliZmRfYm9vbGVhbiBw
aWMgPSBiZmRfbGlua19waWMgKGluZm8pOworCisJCWlmIChXSUxMX0NBTExfRklOSVNIX0RZTkFN
SUNfU1lNQk9MIChkeW4sIHBpYywgaCkKKwkJICAgICYmICghcGljIHx8ICFTWU1CT0xfUkVGRVJF
TkNFU19MT0NBTCAoaW5mbywgaCkpKQorCQkgIGluZHggPSBoLT5keW5pbmR4OworCSAgICAgIH0K
KwogCSAgICAvKiBEeW5hbWljIGVudHJpZXMgd2lsbCByZXF1aXJlIHJlbG9jYXRpb25zLiAgSWYg
d2UgZG8gbm90IG5lZWQKIAkgICAgICAgdGhlbSB3ZSB3aWxsIGp1c3QgdXNlIHRoZSBkZWZhdWx0
IFJfT1IxS19OT05FIGFuZAogCSAgICAgICBub3Qgc2V0IGFueXRoaW5nLiAgKi8KLQkgICAgZHlu
YW1pYyA9IGJmZF9saW5rX3BpYyAoaW5mbykKLQkgICAgICB8fCAoc2VjICYmIChzZWMtPmZsYWdz
ICYgU0VDX0FMTE9DKSAhPSAwCi0JCSAgJiYgaCAhPSBOVUxMCi0JCSAgJiYgKGgtPnJvb3QudHlw
ZSA9PSBiZmRfbGlua19oYXNoX2RlZndlYWsgfHwgIWgtPmRlZl9yZWd1bGFyKSk7CisJICAgIGR5
bmFtaWMgPSAoYmZkX2xpbmtfcGljIChpbmZvKSB8fCBpbmR4ICE9IDApCisJCSAgICAgICAmJiAo
aCA9PSBOVUxMCisJCQkgICB8fCBFTEZfU1RfVklTSUJJTElUWSAoaC0+b3RoZXIpID09IFNUVl9E
RUZBVUxUCisJCQkgICB8fCBoLT5yb290LnR5cGUgIT0gYmZkX2xpbmtfaGFzaF91bmRlZndlYWsp
OwogCiAJICAgIC8qIFNoYXJlZCBHRC4gICovCiAJICAgIGlmIChkeW5hbWljCi0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
