Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A11BC3708F9
	for <lists+openrisc@lfdr.de>; Sat,  1 May 2021 23:02:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 79A2820162;
	Sat,  1 May 2021 23:02:37 +0200 (CEST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mail.librecores.org (Postfix) with ESMTPS id 1C75720162
 for <openrisc@lists.librecores.org>; Sat,  1 May 2021 23:02:36 +0200 (CEST)
Received: by mail-pj1-f48.google.com with SMTP id lp8so892890pjb.1
 for <openrisc@lists.librecores.org>; Sat, 01 May 2021 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LxT/xk3MPCrck93gZToy9MdlkNQbkk6rM7l5v7DG3OY=;
 b=dWCb50bqIHmX/e5Bq0wtyblD0Ee7l4OtZThtX0g7DiNMdU2iFfjnNAcorfL+NnlRVH
 7CwT0dJ5P2ZYaQEidCjSuxMDzv9DxImbBGKO1iL3QCZSy9W4DApfZhyshVXDSgWyWI4F
 CvYuuTYLk8svLiRSyVCDn0nn5XKPuPRPP5NTxn/1lLBmhIlbuRl7vvQt8RzL0dOzXzjM
 SJhP/d6iPHTY9yrf0xfG8NTWqFAAc77in+UWgBXZR3gTrmbLlmk8svyqbjEiimaSMdYO
 +FfR30eUwEx3fG02gSnmLmf46lnV3WyArtQEMfSVqbGE0pDS7qWY8s5d+2ceABKlxgFU
 cEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LxT/xk3MPCrck93gZToy9MdlkNQbkk6rM7l5v7DG3OY=;
 b=n9oNhZ1tZ/7O8woACT5VezACX6l2L+Aen8rYgrP2sxXAgZxgezJbybYLvBSN4JVERb
 X2zskMAjDh/cU9Y6uiUkkpzi++ppvmf2iCEtcZAUJzrSqajNeBCsGO/8DiHQhkqd59QP
 UwF7pvhOP1JjbTIWj228yH3SpRxqIyd8dV98mf/wDgUnuwNTfsKQ+nnbecLexmmgyeLp
 uyv9tD+HkjToOOLn1Qd1McuYHZZrbYoaY8uKcbjC95JJNJAPXP+9UcH+IsGZ15/JXohh
 HVTUhtpS1Js8pjGhkk92elvlclTGOMW1EZxB8Hdjbh8YIPBKkV/fr2M7fyc7by84QGXx
 DKhQ==
X-Gm-Message-State: AOAM531dRfB0gWSpIPCWfIWKoIgFSVl+xYLlJTadqcMUXSLppWItQ9F9
 l+ix3fH/ueXLMMjPsnOSLfI=
X-Google-Smtp-Source: ABdhPJxMFyTiuK4xuCgzp5IV9ftYFx/Y2N504+q1HLC4cInyb/oMVHvG22RuGPfryK13NsW71wjLoA==
X-Received: by 2002:a17:90b:d81:: with SMTP id
 bg1mr12189639pjb.179.1619902953417; 
 Sat, 01 May 2021 14:02:33 -0700 (PDT)
Received: from localhost (g17.222-224-135.ppp.wakwak.ne.jp. [222.224.135.17])
 by smtp.gmail.com with ESMTPSA id
 33sm6000727pgq.21.2021.05.01.14.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 14:02:32 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Sun,  2 May 2021 06:02:14 +0900
Message-Id: <20210501210217.2975268-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210501210217.2975268-1-shorne@gmail.com>
References: <20210501210217.2975268-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 1/4] or1k: Fix issue with plt link failure for
 local calls
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

V2hlbiBidWlsZGluZyBwcm90b2J1ZiB3ZSB3ZXJlIHNlZWluZyB0aGUgYXNzZXJ0IGZhaWx1cmU6
CgogICAgL2hvbWUvZ2l1bGlvYmVuZXR0aS9naXQvdXBzdHJlYW0vb3Ixay1iaW51dGlscy0yLjM2
LjEvaG9zdC9saWIvZ2NjL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8u
Li8uLi9vcjFrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOgogICAgQkZEIChHTlUgQmlu
dXRpbHMpIDIuMzYuMSBhc3NlcnRpb24gZmFpbCBlbGYzMi1vcjFrLmM6MjM3NwogICAgL2hvbWUv
Z2l1bGlvYmVuZXR0aS9naXQvdXBzdHJlYW0vb3Ixay1iaW51dGlscy0yLjM2LjEvaG9zdC9saWIv
Z2NjL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8uLi8uLi9vcjFrLWJ1
aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOgogICAgQkZEIChHTlUgQmludXRpbHMpIDIuMzYu
MSBhc3NlcnRpb24gZmFpbCBlbGYzMi1vcjFrLmM6MjM3NwogICAgL2hvbWUvZ2l1bGlvYmVuZXR0
aS9naXQvdXBzdHJlYW0vb3Ixay1iaW51dGlscy0yLjM2LjEvaG9zdC9saWIvZ2NjL29yMWstYnVp
bGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8uLi8uLi9vcjFrLWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMvYmluL2xkOgogICAgQkZEIChHTlUgQmludXRpbHMpIDIuMzYuMSBhc3NlcnRpb24g
ZmFpbCBlbGYzMi1vcjFrLmM6MjM3NwogICAgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAx
IGV4aXQgc3RhdHVzCgpUaGlzIGZhaWx1cmUgaGFwcGVucyB3aGlsZSB3cml0aW5nIG91dCBQTFQg
ZW50cmllcywgdGhlcmUgaXMgYSBjaGVjawoiQkZEX0FTU0VSVCAoaC0+ZHluaW5keCAhPSAtMSki
IHRvIGNvbmZpcm0gYWxsIHBsdCBlbnRyaWVzIGhhdmUgZHluYW1pYwpzeW1ib2wgYXR0cmlidXRl
cy4gIFRoaXMgd2FzIGZhaWxpbmcgZm9yIHN5bWJvbHMgdGhhdCB3ZXJlCiJmb3JjZWRfbG9jYWwi
IGluIHByZXZpb3VzIGxpbmtpbmcgY29kZS4KClRoZSBmaXggYWRkcyBsb2dpYyB0byBvcjFrX2Vs
Zl9hZGp1c3RfZHluYW1pY19zeW1ib2wgdG8gaWRlbnRpZnkKImZvcmNlZF9sb2NhbCIgc3ltYm9s
cyBhbmQgZXhjbHVkZSB0aGVtIGZyb20gdGhlIHRoZSBQTFQuCgpiZmQvQ2hhbmdlTG9nOgoKCVBS
IDI3NjI0CgkqIGVsZjMyLW9yMWsuYyAob3Ixa19lbGZfYWRqdXN0X2R5bmFtaWNfc3ltYm9sKTog
Q2hhbmdlCgljb25kaXRpb24gdXNlZCB0byBjbGVhbnVwIHBsdCBlbnRyaWVzIHRvIGNsZWFudXAg
Zm9yY2VkIGxvY2FsCgllbnRyaWVzLgoKQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCA5ICsrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9iZmQvZWxmMzItb3Ixay5jIGIvYmZkL2VsZjMyLW9yMWsuYwppbmRleCAwMTNk
ZWI0MDZmOC4uY2M2YzUxMjIwZTUgMTAwNjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIv
YmZkL2VsZjMyLW9yMWsuYwpAQCAtMjU2NiwxMSArMjU2NiwxMCBAQCBvcjFrX2VsZl9hZGp1c3Rf
ZHluYW1pY19zeW1ib2wgKHN0cnVjdCBiZmRfbGlua19pbmZvICppbmZvLAogICBpZiAoaC0+dHlw
ZSA9PSBTVFRfRlVOQwogICAgICAgfHwgaC0+bmVlZHNfcGx0KQogICAgIHsKLSAgICAgIGlmICgh
IGJmZF9saW5rX3BpYyAoaW5mbykKLQkgICYmICFoLT5kZWZfZHluYW1pYwotCSAgJiYgIWgtPnJl
Zl9keW5hbWljCi0JICAmJiBoLT5yb290LnR5cGUgIT0gYmZkX2xpbmtfaGFzaF91bmRlZndlYWsK
LQkgICYmIGgtPnJvb3QudHlwZSAhPSBiZmRfbGlua19oYXNoX3VuZGVmaW5lZCkKKyAgICAgIGlm
IChoLT5wbHQucmVmY291bnQgPD0gMAorCSAgfHwgKFNZTUJPTF9DQUxMU19MT0NBTCAoaW5mbywg
aCkKKwkgIHx8IChFTEZfU1RfVklTSUJJTElUWSAoaC0+b3RoZXIpICE9IFNUVl9ERUZBVUxUCisJ
ICAgICAgJiYgaC0+cm9vdC50eXBlID09IGJmZF9saW5rX2hhc2hfdW5kZWZ3ZWFrKSkpCiAJewog
CSAgLyogVGhpcyBjYXNlIGNhbiBvY2N1ciBpZiB3ZSBzYXcgYSBQTFQgcmVsb2MgaW4gYW4gaW5w
dXQKIAkgICAgIGZpbGUsIGJ1dCB0aGUgc3ltYm9sIHdhcyBuZXZlciByZWZlcnJlZCB0byBieSBh
IGR5bmFtaWMKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
