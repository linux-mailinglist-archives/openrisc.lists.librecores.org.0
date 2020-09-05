Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B432D25E7D2
	for <lists+openrisc@lfdr.de>; Sat,  5 Sep 2020 15:20:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 88D8B20C82;
	Sat,  5 Sep 2020 15:20:16 +0200 (CEST)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 32FE520C82
 for <openrisc@lists.librecores.org>; Sat,  5 Sep 2020 15:20:15 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id z19so3978393pfn.8
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3M12r6RBsgDh9Kn7e4dzNB2fHG/fqe+ly7p4h+ugstE=;
 b=dL62SZE+PPlLRxt+Ptikpj96vd99o31DUJX7SKAqCdm5ULXLVFP40N4tHovLGVMN4T
 QLb2gpOqckjeMjbpyq1LcyjW/Z+zquvGapHE3dy5BqGLR3/D0nlqW2gRagGhXBMz497C
 /n4/Aclo4uUuAQDXn4I9PwbAKfKRhOqXDYYXeyqb2HGez5LHAHMHVPURC8PovEBCV2KA
 xd2hPsm9KSlkNddthIlp2mAKVVULCOsM45jnMrNuHQl/MZxBlk5yaF0vmE2kRwwdTRok
 zyXHsA7A0Qh6rFxF10/vvp882dhW8C/0Ilh6mgsB6GTQAygkTv7y1+aD/F8YVy/eMF6f
 sKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3M12r6RBsgDh9Kn7e4dzNB2fHG/fqe+ly7p4h+ugstE=;
 b=iG88lgpAsIKFAoIjgNUxZf4ywCYvZODfodLWlouUmYFSVpSNMLfXJBxUYNI8IOaMVR
 Na60tdEQKIxRlS3op4yODevHe0XyIZty9V/+4yjOx+H1xtuudOQmhLMT8XRuHiAvDk3j
 OMBlU1AkOt6JaGkAJo5hRcLmvFXVq4vZfSpP5HNH0dxMaRvtDlV3A5+slty+HOenLtl9
 ke4nq+uV9QLQY5lQTOg69hRobDcO7sAC1SG2LEXK/tz3I5uDz98Ysx0Z3V17ZgICe+AD
 CsuZBG6548ysiI9zBx2C+5h998a9G6Fau5wgbjnwX04m8q7wedNnJj73F3VYJvDODtxY
 uKdg==
X-Gm-Message-State: AOAM533wWyoWJ1/4jqG9kfbQZ9Snrg2cEu7FTNiXKIAUTTcwyfSG3oFb
 SX3pkHOLP2bXlEHpyQgidv4=
X-Google-Smtp-Source: ABdhPJxWO+qkptDPOMTPwZRyc53hCMYBkR2mBSoOwsoH3PZwxA8AzWoAuXHU0Dko62LsE0nD812dqA==
X-Received: by 2002:a63:f752:: with SMTP id f18mr10350651pgk.94.1599312013624; 
 Sat, 05 Sep 2020 06:20:13 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id j18sm8478509pgm.30.2020.09.05.06.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 06:20:12 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  5 Sep 2020 22:19:34 +0900
Message-Id: <20200905131935.972386-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905131935.972386-1-shorne@gmail.com>
References: <20200905131935.972386-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 2/3] openrisc: Fix cache API compile issue
 when not inlining
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SSBmb3VuZCB0aGlzIHdoZW4gY29tcGlsaW5nIGEga2J1aWxkIHJhbmRvbSBjb25maWcgd2l0aCBH
Q0MgMTEuICBUaGUKY29uZmlnIGVuYWJsZXMgQ09ORklHX0RFQlVHX1NFQ1RJT05fTUlTTUFUQ0gs
IHdoaWNoIHNldHMgQ0ZMQUdTCi1mbm8taW5saW5lLWZ1bmN0aW9ucy1jYWxsZWQtb25jZS4gVGhp
cyBjYXVzZXMgdGhlIGNhbGwgdG8gY2FjaGVfbG9vcCBpbgpjYWNoZS5jIHRvIG5vdCBiZSBpbmxp
bmVkIGNhdXNpbmcgdGhlIGJlbG93IGNvbXBpbGUgZXJyb3IuCgogICAgSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIGFyY2gvb3BlbnJpc2MvbW0vY2FjaGUuYzoxMzoKICAgIGFyY2gvb3BlbnJpc2MvbW0v
Y2FjaGUuYzogSW4gZnVuY3Rpb24gJ2NhY2hlX2xvb3AnOgogICAgLi9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL3Nwci5oOjE2OjI3OiB3YXJuaW5nOiAnYXNtJyBvcGVyYW5kIDAgcHJvYmFibHkg
ZG9lcyBub3QgbWF0Y2ggY29uc3RyYWludHMKICAgICAgIDE2IHwgI2RlZmluZSBtdHNwcihfc3By
LCBfdmFsKSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICBcCgkgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+CiAgICBhcmNoL29wZW5yaXNjL21tL2NhY2hlLmM6MjU6Mzogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvICdtdHNwcicKICAgICAgIDI1IHwgICBtdHNwcihyZWcsIGxp
bmUpOwoJICB8ICAgXn5+fn4KICAgIC4vYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcHIuaDox
NjoyNzogZXJyb3I6IGltcG9zc2libGUgY29uc3RyYWludCBpbiAnYXNtJwogICAgICAgMTYgfCAj
ZGVmaW5lIG10c3ByKF9zcHIsIF92YWwpIF9fYXNtX18gX192b2xhdGlsZV9fICggIFwKCSAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KICAgIGFyY2gvb3BlbnJpc2MvbW0vY2Fj
aGUuYzoyNTozOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ210c3ByJwogICAgICAgMjUg
fCAgIG10c3ByKHJlZywgbGluZSk7CgkgIHwgICBefn5+fgogICAgbWFrZVsxXTogKioqIFtzY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkOjI4MzogYXJjaC9vcGVucmlzYy9tbS9jYWNoZS5vXSBFcnJvciAx
CgpUaGUgYXNtIGNvbnN0cmFpbnQgIksiIHJlcXVpcmVzIGEgaW1tZWRpYXRlIGNvbnN0YW50IGFy
Z3VtZW50IHRvIG10c3ByLApob3dldmVyIGJlY2F1c2Ugb2Ygbm8gaW5saW5pbmcgYSByZWdpc3Rl
ciBhcmd1bWVudCBpcyBwYXNzZWQgY2F1c2luZyBhCmZhaWx1cmUuICBGaXggdGhpcyBieSB1c2lu
ZyBfX2Fsd2F5c19pbmxpbmUuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjAwODIwMDQ1My5vaG5ocWtqUSUyNWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvbW0vY2FjaGUu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0vY2FjaGUuYyBiL2FyY2gvb3BlbnJpc2MvbW0v
Y2FjaGUuYwppbmRleCAwOGY1NmFmMzg3YWMuLjUzNGE1MmVjNWU2NiAxMDA2NDQKLS0tIGEvYXJj
aC9vcGVucmlzYy9tbS9jYWNoZS5jCisrKyBiL2FyY2gvb3BlbnJpc2MvbW0vY2FjaGUuYwpAQCAt
MTYsNyArMTYsNyBAQAogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAjaW5jbHVkZSA8YXNt
L3RsYmZsdXNoLmg+CiAKLXN0YXRpYyB2b2lkIGNhY2hlX2xvb3Aoc3RydWN0IHBhZ2UgKnBhZ2Us
IGNvbnN0IHVuc2lnbmVkIGludCByZWcpCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgY2Fj
aGVfbG9vcChzdHJ1Y3QgcGFnZSAqcGFnZSwgY29uc3QgdW5zaWduZWQgaW50IHJlZykKIHsKIAl1
bnNpZ25lZCBsb25nIHBhZGRyID0gcGFnZV90b19wZm4ocGFnZSkgPDwgUEFHRV9TSElGVDsKIAl1
bnNpZ25lZCBsb25nIGxpbmUgPSBwYWRkciAmIH4oTDFfQ0FDSEVfQllURVMgLSAxKTsKLS0gCjIu
MjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
