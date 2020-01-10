Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0B413787E
	for <lists+openrisc@lfdr.de>; Fri, 10 Jan 2020 22:29:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E931320894;
	Fri, 10 Jan 2020 22:29:00 +0100 (CET)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id BEDA9205F0
 for <openrisc@lists.librecores.org>; Fri, 10 Jan 2020 22:28:58 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id w62so1727206pfw.8
 for <openrisc@lists.librecores.org>; Fri, 10 Jan 2020 13:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AYg1chBm/3+FdlYUxpXHIjfTe3u4FtxJXy2WDGRSv0=;
 b=oUzRlCcp9bapiiBOvv8ocnZ7YGsSBlylxyyJlqWy1HsDqNyZikoLtMlcC7NFaskXRj
 knq0IiYuXVie7+effr89POiismv9xYptzvDwiDQCqVXiy9M+J/kuz9A0VL42nNtjbWuy
 gBdHXMFOyYiTUMXnaOE5AbAwbRshwSsPxJPJ3SouKfvWJnl4Ch6t2pXDQONiaDK2Tz39
 W8yWFA5qPUC3Pxtuba4t02szOGqBlJmE6k4bMmt05J8rXwo5oRb/u0dWVpFEwvWxijw7
 jVqyiEj5DIqMmpxzWnm62mIGAgBaciI8W1Uma3Mp0StjS8s4AhWfZBBffH2CBgqm4B/L
 AtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AYg1chBm/3+FdlYUxpXHIjfTe3u4FtxJXy2WDGRSv0=;
 b=ZR8eU5iEI5rh4uuvfqzelfY8pLrbxhOxBrVcRJfB3uI11pI6hOmfDymRhs2FAgUA0L
 4DAQKQF+kkiq/mmDa6dEqPqyp9qjiTziZNCZJ32c5NHcGlzaSMwy6FckAkdlQ13d4X+/
 ZcAPNK933sef5ZfKiGRPtPgaChzjQioN+StenWvzUs4GGOhzxSRuV6MOihL3wZSsrm2D
 tacrf2SYf9d9RswWwTHx2NVyVov+t8yjBvdswRhzU+Sg7yGnaP2XNXE7nqJ8LJGHIq7w
 G5PrOG7L8xBAUA1HmvWjCrxyzm3yD0UNmwqKktXoISAn+M2IhvkIWlhH7MOONofZPzJF
 pibg==
X-Gm-Message-State: APjAAAVDg1BDsTRkle9r2Kr1QQPkRBnlZzamS7GhBgA9I/ujZBQJwXEe
 sWH6IkWKt4gw5tUknx3bMnc=
X-Google-Smtp-Source: APXvYqzsmjduJWm5gR220qr+f42GOU9/Q7VRiDq1q8hwPme4QfIqP9EsSg9E5kIyu0XllZpLC1aU0A==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr6659855pgl.371.1578691736954; 
 Fri, 10 Jan 2020 13:28:56 -0800 (PST)
Received: from localhost (g52.222-224-164.ppp.wakwak.ne.jp. [222.224.164.52])
 by smtp.gmail.com with ESMTPSA id
 u1sm3844581pfn.133.2020.01.10.13.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 13:28:56 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: shorne@gmail.com
Date: Sat, 11 Jan 2020 06:28:43 +0900
Message-Id: <20200110212843.27335-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] target/openrisc: Fix FPCSR mask to allow setting
 DZF
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
 QEMU Development <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIG1hc2sgdXNlZCB3aGVuIHNldHRpbmcgRlBDU1IgYWxsb3dzIHNldHRpbmcgYml0cyAxMCB0
byAxLiAgSG93ZXZlciwKT3BlblJJU0MgaGFzIGZsYWdzIGFuZCBjb25maWcgYml0cyBpbiAxMSB0
byAxLCAxMSBiZWluZyBEaXZpZGUgYnkgWmVybwpGbGFnIChEWkYpLiAgVGhpcyBzZWVtcyBsaWtl
IGFuIG9mZi1ieS1vbmUgYnVnLgoKVGhpcyB3YXMgZm91bmQgd2hlbiB0ZXN0aW5nIHRoZSBHTElC
QyB0ZXN0IHN1aXRlIHdoaWNoIGhhcyB0ZXN0IGNhc2VzIHRvCnNldCBhbmQgY2xlYXIgYWxsIGJp
dHMuCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0t
CiB0YXJnZXQvb3BlbnJpc2MvZnB1X2hlbHBlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L29wZW5yaXNj
L2ZwdV9oZWxwZXIuYyBiL3RhcmdldC9vcGVucmlzYy9mcHVfaGVscGVyLmMKaW5kZXggNTllMTQx
MzI3OS4uNmY3NWVhMDUwNSAxMDA2NDQKLS0tIGEvdGFyZ2V0L29wZW5yaXNjL2ZwdV9oZWxwZXIu
YworKysgYi90YXJnZXQvb3BlbnJpc2MvZnB1X2hlbHBlci5jCkBAIC03MCw3ICs3MCw3IEBAIHZv
aWQgY3B1X3NldF9mcGNzcihDUFVPcGVuUklTQ1N0YXRlICplbnYsIHVpbnQzMl90IHZhbCkKICAg
ICAgICAgZmxvYXRfcm91bmRfZG93bgogICAgIH07CiAKLSAgICBlbnYtPmZwY3NyID0gdmFsICYg
MHg3ZmY7CisgICAgZW52LT5mcGNzciA9IHZhbCAmIDB4ZmZmOwogICAgIHNldF9mbG9hdF9yb3Vu
ZGluZ19tb2RlKHJtX3RvX3NmW2V4dHJhY3QzMih2YWwsIDEsIDIpXSwgJmVudi0+ZnBfc3RhdHVz
KTsKIH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
