Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C204C4440CF
	for <lists+openrisc@lfdr.de>; Wed,  3 Nov 2021 12:50:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AAF8424257;
	Wed,  3 Nov 2021 12:50:41 +0100 (CET)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id 0247A23F8E
 for <openrisc@lists.librecores.org>; Wed,  3 Nov 2021 12:50:40 +0100 (CET)
Received: by mail-pl1-f182.google.com with SMTP id n8so2314998plf.4
 for <openrisc@lists.librecores.org>; Wed, 03 Nov 2021 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7WTRWE2Tx5rUYcgUyt1HD8zRPERENbRuNdBuXXDi2wA=;
 b=S2IijSX0oEbq28PNJ7sscwPJlTX8Sp9Dqz1T3E131g5SWFvStknnwiBvn8DNaye+5G
 5I/iYKbhh0shIRisK9Fhljb9VnBb5OUrSSTrsD10OGSb2imcnMPztyzggd/EuF7Z6BhA
 EaY52eu05YF78nIfL5QrUs1HanDAqxvJ4cW3+Gel4LKHzjvZWyW1mqLTr615yGOBvn5M
 hEjQEnsBb6hJmCP5CSqKXOJCrG/rFzH7Xs2KJBJ7eEeJSM1AUPz9gSTyeHQ8r76WVhtM
 4uSqNqK7jzG9bakj32avDGAntYAN+IiPEu5OngWa5IOIGSWwZZ3vKpSmGjk3i7nfGnzN
 K+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7WTRWE2Tx5rUYcgUyt1HD8zRPERENbRuNdBuXXDi2wA=;
 b=5V7bTd7DJtsRbM/gGZEF89qshqnpcTogUYEYwFkLrovCqgUilhHdEGdZnjefhbm6Qr
 5MagYfFB+erCYhgQBq5iwGYxIlsVD9PfZ6MhqqrEdtInqFJEdlb2KS5oXD+tip+w683o
 Fr4J/sG6e5RT9a9J/P4cegXXJq9eaOFz4+j+9RkFyuE5cr6cDE2nKXrNUq/inp7UuD8o
 +hKdQCRzyAUyHmVBTksn41pu6BUUFjpiG8Yw4epTy35Vt0B23GjSdEuWwugBSLLduWOJ
 4v9GINMRVhcFBqsphMOFOdnL/vZbJ8QPVcBzFM2nqlLTsAJFkVcysDpyEoHLgVO2BJ2L
 Eu8Q==
X-Gm-Message-State: AOAM5305RMB2pNBoGyBvMW60h5fmylO/hcNW2jcA1NmYyziMct/GTVF8
 0NlksSs52o6oHZFCT2EbxAo=
X-Google-Smtp-Source: ABdhPJyD1OZmjdcpH7CwX0ShazGT6wIn1YSDudlQlWHYR+LiRAoUv0cQM9hL4et5QV9daNHCG0PqRg==
X-Received: by 2002:a17:90b:4b01:: with SMTP id
 lx1mr1763752pjb.38.1635940239343; 
 Wed, 03 Nov 2021 04:50:39 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id z24sm1896529pgu.54.2021.11.03.04.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 04:50:38 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed,  3 Nov 2021 20:50:15 +0900
Message-Id: <20211103115016.318043-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: fix SMP tlb flush NULL pointer
 dereference
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
Cc: Jonas Bonn <jonas@southpole.se>, Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>, openrisc@lists.librecores.org,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhyb3VnaG91dCB0aGUgT3BlblJJU0Mga2VybmVsIHBvcnQgVk1BIGlzIHBhc3NlZCBhcyBOVUxM
IHdoZW4gZmx1c2hpbmcKa2VybmVsIHRsYiBlbnRyaWVzLiAgU29tZWhvdyB0aGlzIHdhcyBtaXNz
ZWQgd2hlbiBJIHdhcyB0ZXN0aW5nCmMyOGIyNzQxNmRhOSAoIm9wZW5yaXNjOiBJbXBsZW1lbnQg
cHJvcGVyIFNNUCB0bGIgZmx1c2hpbmciKSBhbmQgbm93IHRoZQpTTVAga2VybmVsIGZhaWxzIHRv
IGNvbXBsZXRlbHkgYm9vdC4KCkluIE9wZW5SSVNDIFZNQSBpcyB1c2VkIG9ubHkgdG8gZGV0ZXJt
aW5lIHdoaWNoIGNvcmVzIG5lZWQgdG8gaGF2ZSB0aGVpcgpUTEIgZW50cmllcyBmbHVzaGVkLgoK
VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBsb2dpYyB0byBmbHVzaCB0bGJzIG9uIGFsbCBjb3JlcyB3
aGVuIHRoZSBWTUEgaXMKcGFzc2VkIGFzIE5VTEwuICBBbHNvLCB3ZSB1cGRhdGUgcGxhY2VzIFZN
QSBpcyBwYXNzZWQgYXMgTlVMTCB0byB1c2UKZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSBpbnN0ZWFk
LiAgTm93LCB0aGUgb25seSBwbGFjZSBWTUEgaXMgcGFzc2VkIGFzCk5VTEwgaXMgaW4gdGhlIGlt
cGxlbWVudGF0aW9uIG9mIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UuCgpGaXhlczogYzI4YjI3NDE2
ZGE5ICgib3BlbnJpc2M6IEltcGxlbWVudCBwcm9wZXIgU01QIHRsYiBmbHVzaGluZyIpClJlcG9y
dGVkLWJ5OiBKYW4gSGVucmlrIFdlaW5zdG9jayA8amFuLndlaW5zdG9ja0Byd3RoLWFhY2hlbi5k
ZT4KU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQog
YXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMgfCA0ICsrLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVs
L3NtcC5jIHwgNiArKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL2RtYS5jIGIvYXJj
aC9vcGVucmlzYy9rZXJuZWwvZG1hLmMKaW5kZXggMWIxNmQ5N2U3ZGE3Li5hODJiMmNhYWE1NjAg
MTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL2RtYS5jCisrKyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL2RtYS5jCkBAIC0zMyw3ICszMyw3IEBAIHBhZ2Vfc2V0X25vY2FjaGUocHRlX3Qg
KnB0ZSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCSAqIEZsdXNoIHRoZSBwYWdlIG91dCBvZiB0aGUg
VExCIHNvIHRoYXQgdGhlIG5ldyBwYWdlIGZsYWdzIGdldAogCSAqIHBpY2tlZCB1cCBuZXh0IHRp
bWUgdGhlcmUncyBhbiBhY2Nlc3MKIAkgKi8KLQlmbHVzaF90bGJfcGFnZShOVUxMLCBhZGRyKTsK
KwlmbHVzaF90bGJfa2VybmVsX3JhbmdlKGFkZHIsIGFkZHIgKyBQQUdFX1NJWkUpOwogCiAJLyog
Rmx1c2ggcGFnZSBvdXQgb2YgZGNhY2hlICovCiAJZm9yIChjbCA9IF9fcGEoYWRkcik7IGNsIDwg
X19wYShuZXh0KTsgY2wgKz0gY3B1aW5mby0+ZGNhY2hlX2Jsb2NrX3NpemUpCkBAIC01Niw3ICs1
Niw3IEBAIHBhZ2VfY2xlYXJfbm9jYWNoZShwdGVfdCAqcHRlLCB1bnNpZ25lZCBsb25nIGFkZHIs
CiAJICogRmx1c2ggdGhlIHBhZ2Ugb3V0IG9mIHRoZSBUTEIgc28gdGhhdCB0aGUgbmV3IHBhZ2Ug
ZmxhZ3MgZ2V0CiAJICogcGlja2VkIHVwIG5leHQgdGltZSB0aGVyZSdzIGFuIGFjY2VzcwogCSAq
LwotCWZsdXNoX3RsYl9wYWdlKE5VTEwsIGFkZHIpOworCWZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uo
YWRkciwgYWRkciArIFBBR0VfU0laRSk7CiAKIAlyZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKaW5k
ZXggNDE1ZTIwOTczMmEzLi5iYTc4NzY2Y2YwMGIgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3NtcC5jCisrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCkBAIC0yNzIsNyAr
MjcyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGlwaV9mbHVzaF90bGJfcmFuZ2Uodm9pZCAqaW5m
bykKIAlsb2NhbF9mbHVzaF90bGJfcmFuZ2UoTlVMTCwgZmQtPmFkZHIxLCBmZC0+YWRkcjIpOwog
fQogCi1zdGF0aWMgdm9pZCBzbXBfZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBjcHVtYXNrICpjbWFz
aywgdW5zaWduZWQgbG9uZyBzdGFydCwKK3N0YXRpYyB2b2lkIHNtcF9mbHVzaF90bGJfcmFuZ2Uo
Y29uc3Qgc3RydWN0IGNwdW1hc2sgKmNtYXNrLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAogCQkJCXVu
c2lnbmVkIGxvbmcgZW5kKQogewogCXVuc2lnbmVkIGludCBjcHVpZDsKQEAgLTMyMCw3ICszMjAs
OSBAQCB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNp
Z25lZCBsb25nIHVhZGRyKQogdm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsCiAJCSAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQp
CiB7Ci0Jc21wX2ZsdXNoX3RsYl9yYW5nZShtbV9jcHVtYXNrKHZtYS0+dm1fbW0pLCBzdGFydCwg
ZW5kKTsKKwljb25zdCBzdHJ1Y3QgY3B1bWFzayAqY21hc2sgPSB2bWEgPyBtbV9jcHVtYXNrKHZt
YS0+dm1fbW0pCisJCQkJCSAgOiBjcHVfb25saW5lX21hc2s7CisJc21wX2ZsdXNoX3RsYl9yYW5n
ZShjbWFzaywgc3RhcnQsIGVuZCk7CiB9CiAKIC8qIEluc3RydWN0aW9uIGNhY2hlIGludmFsaWRh
dGUgLSBwZXJmb3JtZWQgb24gZWFjaCBjcHUgKi8KLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
