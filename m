Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3F23098A9
	for <lists+openrisc@lfdr.de>; Sat, 30 Jan 2021 23:44:55 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E635D208C2;
	Sat, 30 Jan 2021 23:44:54 +0100 (CET)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mail.librecores.org (Postfix) with ESMTPS id 4ABA520E48
 for <openrisc@lists.librecores.org>; Sat, 30 Jan 2021 23:44:52 +0100 (CET)
Received: by mail-pf1-f181.google.com with SMTP id q20so8987681pfu.8
 for <openrisc@lists.librecores.org>; Sat, 30 Jan 2021 14:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=boqyiloEprNh8Qrr948kOJQFE8uQrpTMdyDEzc69iG4=;
 b=r4vOtqnNHsIJU7+Y8Zb0TCOlVmmLKA8CsyvN1rjmX/BHqcTDRgOZJi0gChMIdZtS1U
 th9R8qljlUH+aBJ5Q5JvR4LTDYHJGKyf7EFHZcVluyDfUWi9B1SGj7aVPNDLuSCxxX2g
 Lb+2fcBpZU/JPhBZZTur7H08/NM3ffLKhWNqGPbfGcgVIoPv+5xRwefgWXUhJ9aAeRm0
 D9V2c9gtp1WVgaSsBsOtW/VqTTBffaBqXeTCmeM94Se4092oiW6Byp3b7Givv7qH6Gfw
 nrXqMXQbZyKyNCChkt3YRnBR54nTKL5dNr70fmCGmb3OvsPFfaujDeGJi0Ii/XR0HFXf
 Se5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=boqyiloEprNh8Qrr948kOJQFE8uQrpTMdyDEzc69iG4=;
 b=Z+Od8/X94ZK0A2AMHjDItWKPqJmZCgl6kNjIzvlDpuHKFxyNNjNYI+qJSm5EDbEFyE
 pi91WuAiqzlV8389RqpI+DTsFvHVf5nRShmC9D54VEsZNXrItxQ0/j2mLQcB4HmFEbJZ
 SSLZmMbEgii35CQn63ygiqBK/U2Ty17bKjRCkjGZYrA1MUczeCD4vbVbF3/c0f9PmDQz
 3VUWnqsAQB+2we8knzeggr+YU1Y+akfcmVxAHspcC8YpWAeiQgIEm06qyaw/t5hlRkfh
 3F8kVJ5YCZ1BBqdMNHAXmekGrSjE+9YMrwzBr8uAtypjfPz6vxzyfzqO/47t/vJHj2r4
 6YnQ==
X-Gm-Message-State: AOAM533T7lsHaFY+EuW3pNsskPbHKvnEQKuGty9B/JwRP5CZOLCqn+Vr
 P4yYCd8CMVT/BQtDWPqbfxk=
X-Google-Smtp-Source: ABdhPJzHNy7XsIPlrR5wO5jc7E1umqa/1b/UhExqbBel39l1T4l6Q3P46HKbukwW3qKRCldxTtpM1A==
X-Received: by 2002:a63:7748:: with SMTP id s69mr10480105pgc.81.1612046690685; 
 Sat, 30 Jan 2021 14:44:50 -0800 (PST)
Received: from localhost (g54.222-224-210.ppp.wakwak.ne.jp. [222.224.210.54])
 by smtp.gmail.com with ESMTPSA id
 j5sm11023218pjf.47.2021.01.30.14.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 14:44:49 -0800 (PST)
Date: Sun, 31 Jan 2021 07:44:42 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210130224442.GB2002709@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC fixes for 5.11-rc6
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
ZXMgc2luY2UgY29tbWl0IDZlZTFkNzQ1YjdjOWZkNTczZmJhMTQyYTJlZmRhZDc2YTlmMWNiMDQ6
CgogIExpbnV4IDUuMTEtcmM1ICgyMDIxLTAxLTI0IDE2OjQ3OjE0IC0wODAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdGh1Yi5jb20vb3BlbnJp
c2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gMWJlYTJhOTM3ZGFkZDE4OGRlNzAxOThiMGNmMzkxNWUwNWE1MDZlNDoKCiAgc29jOiBsaXRl
eDogUHJvcGVybHkgZGVwZW5kIG9uIEhBU19JT01FTSAoMjAyMS0wMS0zMCAwNjozNjoxMCArMDkw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KT3BlblJJU0MgZml4ZXMgZm9yIDUuMTEtcmM2CgpGaXhlcyBpbmNsdWRlOgog
KiBGaXggY29uZmlnIGRlcGVuZGVuY2llcyBmb3IgTGl0ZXggU09DIGRyaXZlciBjYXVzaW5nIGlz
c3VlcyBvbiB1bQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpEYXZpZCBHb3cgKDEpOgogICAgICBzb2M6IGxpdGV4OiBQcm9w
ZXJseSBkZXBlbmQgb24gSEFTX0lPTUVNCgogZHJpdmVycy9zb2MvbGl0ZXgvS2NvbmZpZyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgotU3RhZmZvcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
