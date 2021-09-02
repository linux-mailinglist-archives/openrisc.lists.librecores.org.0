Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D035A3FF565
	for <lists+openrisc@lfdr.de>; Thu,  2 Sep 2021 23:12:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6C71823F9E;
	Thu,  2 Sep 2021 23:12:06 +0200 (CEST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id 9426D21D0C
 for <openrisc@lists.librecores.org>; Thu,  2 Sep 2021 23:12:05 +0200 (CEST)
Received: by mail-pf1-f173.google.com with SMTP id j16so1906773pfc.2
 for <openrisc@lists.librecores.org>; Thu, 02 Sep 2021 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Txn1oZJ1MZmkpCJOG+Tm0yfaGtr1VC7mq6fqUTut+Ko=;
 b=GzTMiuL+QmxK8UlAEtb5m0CQN4bpLtZ+YfESXJlbQLFjU2t4LBatxhmSW/Y7VD3ylz
 SWAygdhOpOAFGtZsrbnwqN6GH6SYeNqlsURavQ5x65++g35n1JCeieHNKrt43GKvCvlJ
 fRhNt6kQR4V2pNYDSxSsY8VrW1i3J4xvLtGwpDmSWTJVFfoJ6mdxgMprX367btnKM0Ga
 AEfSBmGSV+w7mQ0NiPJRGGBcMChjGT+ylgMYaFBguoFN+DYj4ZRTVlMosyjOOLN20rMW
 Omn9kI3btvQjQaiXOZDpltOjkMoSyX0xfXJujbQp1uLKw0+5oHWfvpIIKFQ8g4QqYcgs
 WLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Txn1oZJ1MZmkpCJOG+Tm0yfaGtr1VC7mq6fqUTut+Ko=;
 b=AL9VdPxAkqrQKZkPiQKCzgo8EcmPkvQAxlFPvh4JrwsMkzMeEC6wM93VBv62hWAgbl
 4UyBzRk9gCxLsx5InTQZIpj2kVOBUPdlt9hY1vcvQIo9xb3PaRI3EnAIvYVh/U89dET4
 4qw9yHujqCyrT2jVtlF1AKwxyGQ9ZZyy/TMSdR/lTw2K281Q8lEAVjYHf28wKQh+zhgc
 1WipPxYTCCoG7Uu4X80wivCoXT+Cn9P15F+++WNhea2heui+tjEPrGLnB8TzXrXkahZl
 0H6/lBRbofSi4JN5egGB0/riQbE4MeSVbR4oDoZSCnGXmxvkHazTb9LI1MHNPyB5LE1v
 bIZw==
X-Gm-Message-State: AOAM530ldyP0luoCF195f777C5eS8kk57Uh8kwK33MBI52Kxr8T0oHlM
 gw175CNjaDJeYk78KMJhBe0=
X-Google-Smtp-Source: ABdhPJxK59ChOqIb0khEwblgYuzFbJIGr60dbANf2fvPMx8FE5HinOdOVMXWTzJ+JfAqaIiZ0AIWfw==
X-Received: by 2002:a63:4e45:: with SMTP id o5mr315096pgl.191.1630617124011;
 Thu, 02 Sep 2021 14:12:04 -0700 (PDT)
Received: from localhost (g163.222-224-165.ppp.wakwak.ne.jp. [222.224.165.163])
 by smtp.gmail.com with ESMTPSA id z17sm3111442pfa.125.2021.09.02.14.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 14:12:03 -0700 (PDT)
Date: Fri, 3 Sep 2021 06:12:01 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YTE+IdUiJ+k+bpDR@antec>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for 5.15
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGw6CgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGM1MDBiZWUxYzViMmYxZDU5YjEwODFhYzg3OWQ3MzI2OGFiMGZmMTc6
CgogIExpbnV4IDUuMTQtcmM0ICgyMDIxLTA4LTAxIDE3OjA0OjE3IC0wNzAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdGh1Yi5jb20vb3BlbnJp
c2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gMTk1NWQ4NDNlZmMzYjVjZjNhYjQ4Nzg5ODZhODdhZDQ5NzJmZjRlMToKCiAgb3BlbnJpc2Mv
bGl0ZXg6IFVwZGF0ZSBkZWZjb25maWcgKDIwMjEtMDgtMzEgMjI6NDE6NDYgKzA5MDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCk9wZW5SSVNDIHVwZGF0ZXMgZm9yIDUuMTUKCkEgZmV3IGNsZWFudXBzIGFuZCBjb21waWxl
ciB3YXJuaW5nIGZpeGVzIGZvciBPcGVuUklTQy4gIEFsc28sIHRoaXMKaW5jbHVkZXMgZHRzIGFu
ZCBkZWZjb25maWcgdXBkYXRlcyB0byBlbmFibGUgRXRoZXJuZXQgb24gT3BlblJJU0MvTGl0ZXgK
RlBHQSBTb0MncyBub3cgdGhhdCB0aGUgTGl0ZUV0aCBkcml2ZXIgaGFzIGdvbmUgdXBzdHJlYW0u
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkpvZWwgU3RhbmxleSAoMyk6CiAgICAgIG9wZW5yaXNjL2xpdGV4OiBVcGRhdGUg
dWFydCBhZGRyZXNzCiAgICAgIG9wZW5yaXNjL2xpdGV4OiBBZGQgZXRoZXJuZXQgZGV2aWNlCiAg
ICAgIG9wZW5yaXNjL2xpdGV4OiBVcGRhdGUgZGVmY29uZmlnCgpSYW5keSBEdW5sYXAgKDIpOgog
ICAgICBvcGVucmlzYzogZG9uJ3QgcHJpbnRrKCkgdW5jb25kaXRpb25hbGx5CiAgICAgIG9wZW5y
aXNjOiByZW5hbWUgb3IzMiBjb2RlICYgY29tbWVudHMgdG8gb3IxawoKU3RhZmZvcmQgSG9ybmUg
KDEpOgogICAgICBvcGVucmlzYzogRml4IGNvbXBpbGVyIHdhcm5pbmdzIGluIHNldHVwCgogYXJj
aC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0ZXguZHRzICAgICAgfCAxMyArKysrKysrKysrKy0t
CiBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa2xpdGV4X2RlZmNvbmZpZyB8IDI2ICsrKysrKysr
KysrKysrKystLS0tLS0tLS0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAg
ICAgICB8ICA2ICsrKy0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAg
ICAgfCAxNSArKysrKysrKysrKysrKysKIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGhyZWFk
X2luZm8uaCAgIHwgIDIgKy0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMgICAgICAgICAg
ICAgIHwgIDYgKysrKy0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9oZWFkLlMgICAgICAgICAgICAg
ICB8ICA2ICsrKy0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAg
fCAyMCArKystLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9vcGVucmlzYy9saWIvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgfCAgMiArLQogYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNDAgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9z
ZXR1cC5oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
