Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 289521A0D66
	for <lists+openrisc@lfdr.de>; Tue,  7 Apr 2020 14:16:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A84D120493;
	Tue,  7 Apr 2020 14:16:35 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 8EB42206A2
 for <openrisc@lists.librecores.org>; Tue,  7 Apr 2020 14:16:33 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id t4so1171457plq.12
 for <openrisc@lists.librecores.org>; Tue, 07 Apr 2020 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=1WqirDYwLo94Wc4sxZtJg3i9WYW0Oz0X084NUnMMCRs=;
 b=KDpjtwbIHVmYqWEu82aR5iIWPNorzGB5GHPagUhMgH423PH1n351g0e2qjUmagji6b
 c5sMZV1HzSY0Cnp0n2S0I1QlwYA6vgjcDGvuvUTUXyRX7Rxmvry0p6wHiJLHdQhz0UrT
 b68uvrptGu5fP2tKo0aZpD/A8taX/TPuIY9H1xiGAXgAFsm59O4wa5pgXH7zLK0t+bxY
 xQ1QiOSA7uE+JaW0kSfpuQT7GNChYLsqDGNifRTbs0xKpdO0RIIBXiFuhTXGvWdFBMJ3
 iiX6U/vVGB75LEbyWTE9i9S8Sk+bD1ayLrHbc87C2n/4ASKHt07dNYSBYLO8v2E740l9
 LXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=1WqirDYwLo94Wc4sxZtJg3i9WYW0Oz0X084NUnMMCRs=;
 b=binId9Rm6Q8jONUYX6fJUsV0KQveOx22TnSc/Kn4nngwD5P8+EMaeHvOBdQ7Y1yCwK
 YZ2hNOhT3vKq7nqruRAEna7s0WPDYmD1UiZM21D6JClCtpZx39KJ6FDMJXZ8x241JAiF
 ODjSL8hVcOvW9CvnccHiBjpFoS9yP94M5XbSTBvlNdzr5LYxN2bGjASoMapseBWbB2I2
 Ye20eqO9hmEq9uB9ldeAFOUiypo5WW0TaBKgZcfpDk/hvykJABV2ObOTrQxvZxfwqPBO
 wie67o/O5rE1vrzdbeO8mzyCEFaFAvXtR8AkLY60KZfpSN985N3+FhgdsPSHB5rmDbVi
 Eipw==
X-Gm-Message-State: AGi0Pub8J8BNgngFeERrWtXuM4ihC/cdIAKjfUoSjwizjhYzQ9vRYJNC
 CXJ+SGzqCDQ7XlFdzWdz+Sk=
X-Google-Smtp-Source: APiQypKBRRAUfzgAqy/QuXoSSuJbdovo8/J5FmU1+moBUCW3bjwTMqGAq9HJANpg9Tt4pNz49L5+UA==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr2501211pjb.101.1586261791768; 
 Tue, 07 Apr 2020 05:16:31 -0700 (PDT)
Received: from localhost (g54.222-224-167.ppp.wakwak.ne.jp. [222.224.167.54])
 by smtp.gmail.com with ESMTPSA id
 e187sm13517135pfe.143.2020.04.07.05.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 05:16:30 -0700 (PDT)
Date: Tue, 7 Apr 2020 21:16:28 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200407121628.GP7926@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for v5.6
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

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgcHVsbGluZy4uLgoKVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCBkNTIyNmZhNmRiYWUwNTY5ZWU0M2VjZmMwOGJkY2Q2NzcwZmM0NzU1
OgoKICBMaW51eCA1LjUgKDIwMjAtMDEtMjYgMTY6MjM6MDMgLTA4MDApCgphcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0aHViLmNvbS9vcGVucmlzYy9s
aW51eC5naXQgdGFncy9mb3ItbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5
NzM3ZTJjNWYwYmM3NjhiNTg0MTZlYzA3MGJkOTZjOTFjNTJhMTUzOgoKICBvcGVucmlzYzogUmVt
b3ZlIG9ic29sZXRlIHNob3dfdHJhY2VfdGFzayBmdW5jdGlvbiAoMjAyMC0wMy0xOCAyMjoxMDo0
NCArMDkwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KT3BlblJJU0MgdXBkYXRlcyBmb3IgNS42CgpBIGZldyBjbGVhbnVw
cyBhbGwgb3ZlciB0aGUgcGxhY2UsIHRoaW5ncyBvZiBub3RlOgogLSBFbmFibGUgdGhlIGNsb25l
MyBzeXNjYWxsCiAtIFJlbW92ZSBDT05GSUdfQ1JPU1NfQ09NUElMRSBmcm9tIEtyenlzenRvZiBL
b3psb3dza2kKIC0gVXBkYXRlIHRvIHVzZSBtbWdyYWIgZnJvbSBKdWxpYSBMYXdhbGwKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KSnVsaWEgTGF3YWxsICgxKToKICAgICAgb3BlbnJpc2M6IHVzZSBtbWdyYWIKCktyenlzenRv
ZiBLb3psb3dza2kgKDEpOgogICAgICBvcGVucmlzYzogY29uZmlnczogQ2xlYW51cCBDT05GSUdf
Q1JPU1NfQ09NUElMRQoKU3RhZmZvcmQgSG9ybmUgKDQpOgogICAgICBvcGVucmlzYzogQ29udmVy
dCBjb3B5X3RocmVhZCB0byBjb3B5X3RocmVhZF90bHMKICAgICAgb3BlbnJpc2M6IEVuYWJsZSB0
aGUgY2xvbmUzIHN5c2NhbGwKICAgICAgb3BlbnJpc2M6IENsZWFudXAgY29weV90aHJlYWRfdGxz
IGRvY3MgYW5kIGNvbW1lbnRzCiAgICAgIG9wZW5yaXNjOiBSZW1vdmUgb2Jzb2xldGUgc2hvd190
cmFjZV90YXNrIGZ1bmN0aW9uCgogRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9vcGVucmlzY19wb3J0
LnJzdCAgIHwgIDQgKystLQogYXJjaC9vcGVucmlzYy9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVmY29uZmlnICAgIHwg
IDEgLQogYXJjaC9vcGVucmlzYy9jb25maWdzL3NpbXBsZV9zbXBfZGVmY29uZmlnIHwgIDEgLQog
YXJjaC9vcGVucmlzYy9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oICAgIHwgIDEgKwogYXJjaC9v
cGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgICAgIHwgMTggKysrKysrLS0tLS0tLS0t
LS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYyAgICAgICAgICAgICAgICAgfCAgMyArKy0K
IGFyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICB8ICA3IC0tLS0tLS0K
IDggZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
