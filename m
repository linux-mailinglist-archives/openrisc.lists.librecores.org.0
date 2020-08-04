Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ECB0223B3D8
	for <lists+openrisc@lfdr.de>; Tue,  4 Aug 2020 06:24:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C6EA520D98;
	Tue,  4 Aug 2020 06:24:21 +0200 (CEST)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mail.librecores.org (Postfix) with ESMTPS id 9ECCD20D96
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 06:24:20 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id t6so1315324pjr.0
 for <openrisc@lists.librecores.org>; Mon, 03 Aug 2020 21:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6FQQh9grVE9WmqeYXdehIdQwW9U/dAMb893sRAt75ZM=;
 b=uBZEqpykqt1c/NtoFtFkiYRPjXq/DjkOC0dqEIKQYgA2z0nQlsMOqtZvNnnfjhBavS
 yxgafmW7t7eLvEI95aD4U3Q++5esqlDcoAha32yxun7dmQcnCodO7Q26e6yB+zvXjHBR
 Ptg2VdD7gcpq05vmN5IaF6kFxdeSiV2kgF40qS2kmBwEBqyL6K9GGSl+TqoKva7HX8YS
 EhM27dQ1eauN2I4rZh7uozUGDyngS1OqWLpLzpTqNugz+hLtY//Oz3TST/Zh+K/fnNwx
 WVygcl1Sxfi7L++kT6MTKKOgHiHPQ2YIxyNddZR+FC+URSgoATOvCJiiQ+bNWWdcYyjA
 dpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FQQh9grVE9WmqeYXdehIdQwW9U/dAMb893sRAt75ZM=;
 b=mrLU45J3g0U98Xig7yiTMUZnWglyxPngKIWKGX9X1BBy8TlP7MiObQyPUz+aYjM2tr
 ZPzRI8J2I8ofFWerm8NXUHvF28rnYTB55zDOLXus63G97favKexQnKcyML6JrBSyykLR
 O04cfFEzDoQTl53Qdk4CXE6yU/qb8CDeUDxkc7134E6GuihdiNJuJwsvmUaw6JLAvwlr
 hNYGZJcL/9E1FHUmkpL3JnhIH2SQvGIkWv7Kexz8img5U7eT3ktTTteKw8mm8TMaED0T
 PHH/TNzARrF76diF9uvxSYoZvyqGgrT9jImr5RQlRaDJjmnc31vUz5hO2N3zTeaF1Yd9
 PcAQ==
X-Gm-Message-State: AOAM533oAxjuXiCG9h4SoDYayOlGFYDkR8XaYCyEksvC0GcPiUW5a4+j
 Ik9vsOH0utYmnQB++EAjRsY=
X-Google-Smtp-Source: ABdhPJw6I1I1rhc5642O2n0pcD89AvC3Qz39sDbhZYqzI6laUlHGgX4EZG7iZEJLlzdMM+3COArm+g==
X-Received: by 2002:a17:902:9349:: with SMTP id
 g9mr17504812plp.313.1596515059299; 
 Mon, 03 Aug 2020 21:24:19 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id r15sm12279933pfq.189.2020.08.03.21.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 21:24:18 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  4 Aug 2020 13:23:51 +0900
Message-Id: <20200804042354.3930694-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804042354.3930694-1-shorne@gmail.com>
References: <20200804042354.3930694-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 3/6] openrisc: uaccess: Use static inline
 function in access_ok
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QXMgc3VnZ2VzdGVkIGJ5IExpbnVzIHdoZW4gcmV2aWV3aW5nIGNvbW1pdCA5Y2IyZmViNGQyMWQK
KCJhcmNoL29wZW5yaXNjOiBGaXggaXNzdWVzIHdpdGggYWNjZXNzX29rKCkiKSBsYXN0IHllYXI7
IG1ha2luZwpfX3JhbmdlX29rIGFuIGlubGluZSBmdW5jdGlvbiBhbHNvIGZpeGVzIHRoZSB1c2Vk
IHR3aWNlIGlzc3VlIHRoYXQgdGhlCmNvbW1pdCB3YXMgZml4aW5nLiAgSSBhZ3JlZSBpdCdzIGEg
Z29vZCBjbGVhbnVwLiAgVGhpcyBwYXRjaCBhZGRyZXNzZXMKdGhhdCBhcyBJIGFtIGN1cnJlbnRs
eSB3b3JraW5nIG9uIHRoZSBhY2Nlc3Nfb2sgbWFjcm8gdG8gZml4dXAgc3BhcnNlCmFubm90YXRp
b25zIGluIE9wZW5SSVNDLgoKU3VnZ2VzdGVkLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9y
bmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwg
MTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgg
Yi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBmMmZjNWM0Yjg4YzMu
LjRiNTlkYzlhZDMwMCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNj
ZXNzLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTQ4LDE2
ICs0OCwxOSBAQAogLyogRW5zdXJlIHRoYXQgdGhlIHJhbmdlIGZyb20gYWRkciB0byBhZGRyK3Np
emUgaXMgYWxsIHdpdGhpbiB0aGUgcHJvY2VzcycKICAqIGFkZHJlc3Mgc3BhY2UKICAqLwotI2Rl
ZmluZSBfX3JhbmdlX29rKGFkZHIsIHNpemUpIChzaXplIDw9IGdldF9mcygpICYmIGFkZHIgPD0g
KGdldF9mcygpLXNpemUpKQorc3RhdGljIGlubGluZSBpbnQgX19yYW5nZV9vayh1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKK3sKKwljb25zdCBtbV9zZWdtZW50X3QgZnMg
PSBnZXRfZnMoKTsKKworCXJldHVybiBzaXplIDw9IGZzICYmIGFkZHIgPD0gKGZzIC0gc2l6ZSk7
Cit9CiAKIC8qIEVuc3VyZSB0aGF0IGFkZHIgaXMgYmVsb3cgdGFzaydzIGFkZHJfbGltaXQgKi8K
ICNkZWZpbmUgX19hZGRyX29rKGFkZHIpICgodW5zaWduZWQgbG9uZykgYWRkciA8IGdldF9mcygp
KQogCiAjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQkJCQkJCVwKICh7IAkJCQkJCQkJCVwK
LQl1bnNpZ25lZCBsb25nIF9fYW9fYWRkciA9ICh1bnNpZ25lZCBsb25nKShhZGRyKTsJCVwKLQl1
bnNpZ25lZCBsb25nIF9fYW9fc2l6ZSA9ICh1bnNpZ25lZCBsb25nKShzaXplKTsJCVwKLQlfX3Jh
bmdlX29rKF9fYW9fYWRkciwgX19hb19zaXplKTsJCQkJXAorCV9fcmFuZ2Vfb2soKHVuc2lnbmVk
IGxvbmcpKGFkZHIpLCAoc2l6ZSkpOwkJCVwKIH0pCiAKIC8qCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
