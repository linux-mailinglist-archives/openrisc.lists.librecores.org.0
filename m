Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3F416408B4E
	for <lists+openrisc@lfdr.de>; Mon, 13 Sep 2021 14:48:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 20EE82414A;
	Mon, 13 Sep 2021 14:48:32 +0200 (CEST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mail.librecores.org (Postfix) with ESMTPS id A47CF21016
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 14:48:30 +0200 (CEST)
Received: by mail-pj1-f41.google.com with SMTP id k23so6237406pji.0
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BV7gD2kzfv2KUk221Rhnowd/IEEKYROz7IWt5yMJ5lI=;
 b=oUaiSvgsR2qsGXRJdneIFr1UM8y0Y0gMfsnHOdY8c41hz9GrpKeM1gWn1oWdrc4jvv
 bqkz01Uu5oFPpv958sQHLcipBahOQTKufdpni3ZpePMCsBVtYNFPfmp9JP/5mW/skyel
 Uxi0292nRS275P8h2wAdOkQfLmcbzVYZmzuZPAJv5PAiW3/ghscBSWFcrZmNwd96VOKp
 TZ58fGWMAYrk0f9CAUW7Dm2lThRzY8sdkbKYe5pmNFI6HpYM1SdyCdaxaEVqLhhE/iXO
 qtFsw1wqL1LRjVRs60pQRo/TxFqgUCPtUXXoBRE3daqz3hTxRW+jF7xm345p2VLlRjLv
 V/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BV7gD2kzfv2KUk221Rhnowd/IEEKYROz7IWt5yMJ5lI=;
 b=ShMXHnbOX2F/HvgxvzMtIth2LCtOP+BQ7fLrc/vTItQwbcwnReUnjWyBeVvaaKCrKb
 DX7OFb2BLn7kEmAx4T+GjUZANLs34/aqhHkydYgzXafpGIR1hx1pbBdk0O+Yo4ehTgNN
 pdQq7oew8pH9U4p7Vkx//fcKVDDvO0UxjESAq4/psIMnNU2OT2XOFcWhZSqyHgqajb0n
 nbWU3MYwXpiwwty8IO8+hvU/SaURlFJcrA8Mas3ITOn+qWaoyamzD+v4AOxX5KjCQIeA
 oV/mT5d+/wCJptP89pX5YTC5607Wadj8CTjgRIKvE3img1L45I6Xm5AHwraj9QXfaMrO
 HB8w==
X-Gm-Message-State: AOAM533oxDV45AEhbQ2ZrpYaJL9HUHuEnQbmgoPl3pBuNNjMfMF+5p7s
 TbAjrQGV8l0UeHxcxb1DTtM=
X-Google-Smtp-Source: ABdhPJy/QXmL8wH0ZebhWBhgShNSMmUqDWJpgseVpkz3vxUlg/kskFLS+Zv7CnYcxmSC8pdxyelqdw==
X-Received: by 2002:a17:902:8b83:b029:12c:cbce:a52f with SMTP id
 ay3-20020a1709028b83b029012ccbcea52fmr10198366plb.9.1631537309227; 
 Mon, 13 Sep 2021 05:48:29 -0700 (PDT)
Received: from localhost (g245.61-45-50.ppp.wakwak.ne.jp. [61.45.50.245])
 by smtp.gmail.com with ESMTPSA id x9sm6974717pjf.52.2021.09.13.05.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:48:28 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>
Date: Mon, 13 Sep 2021 21:47:57 +0900
Message-Id: <20210913124800.471680-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913124800.471680-1-shorne@gmail.com>
References: <20210913124800.471680-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/5] gdb: or1k: fixup linux regcache comment
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

VGhlIG9sZCBjb21tZW50IHdhcyBub3QgcHJvcGVybHkgdXBkYXRlZCBmcm9tIHRoZSBSSVNDLVYg
ZXhhbXBsZSB1c2VkLgpVcGRhdGUgaXQgdG8gbWF0Y2ggT3BlblJJU0MuCi0tLQogZ2RiL29yMWst
bGludXgtdGRlcC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2dkYi9vcjFrLWxpbnV4LXRkZXAuYyBiL2dk
Yi9vcjFrLWxpbnV4LXRkZXAuYwppbmRleCAyYWQ1NWYwZDllYy4uMmVmYjRkMGIwZjkgMTAwNjQ0
Ci0tLSBhL2dkYi9vcjFrLWxpbnV4LXRkZXAuYworKysgYi9nZGIvb3Ixay1saW51eC10ZGVwLmMK
QEAgLTI3LDkgKzI3LDEwIEBACiAjaW5jbHVkZSAidHJhZC1mcmFtZS5oIgogI2luY2x1ZGUgImdk
YmFyY2guaCIKIAotLyogRGVmaW5lIHRoZSBnZW5lcmFsIHJlZ2lzdGVyIG1hcHBpbmcuICBUaGUg
a2VybmVsIHB1dHMgdGhlIFBDIGF0IG9mZnNldCAwLAotICAgZ2RiIHB1dHMgaXQgYXQgb2Zmc2V0
IDMyLiAgUmVnaXN0ZXIgeDAgaXMgYWx3YXlzIDAgYW5kIGNhbiBiZSBpZ25vcmVkLgotICAgUmVn
aXN0ZXJzIHgxIHRvIHgzMSBhcmUgaW4gdGhlIHNhbWUgcGxhY2UuICAqLworLyogRGVmaW5lIHRo
ZSBnZW5lcmFsIHJlZ2lzdGVyIG1hcHBpbmcuICBUaGUga2VybmVsIGFuZCBHREIgcHV0IHJlZ2lz
dGVycworICAgcjEgdG8gcjMxIGluIHRoZSBzYW1lIHBsYWNlLiAgVGhlIE5QQyByZWdpc3RlciBp
cyBzdG9yZWQgYXQgaW5kZXggMzIgaW4KKyAgIGxpbnV4IGFuZCAzMyBpbiBHREIsIGluIEdEQiAz
MiBpcyBmb3IgUFBDIHdoaWNoIGlzIG5vdCBwb3B1cGF0ZWQgZnJvbSBsaW51eC4KKyAgIFJlZ2lz
dGVyIHIwIGlzIGFsd2F5cyAwIGFuZCBjYW4gYmUgaWdub3JlZC4gICovCiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcmVnY2FjaGVfbWFwX2VudHJ5IG9yMWtfbGludXhfZ3JlZ21hcFtdID0KIHsKLS0g
CjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
