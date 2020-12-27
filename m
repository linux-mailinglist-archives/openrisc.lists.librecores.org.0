Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BAAA12E308D
	for <lists+openrisc@lfdr.de>; Sun, 27 Dec 2020 10:15:08 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1553620FC8;
	Sun, 27 Dec 2020 10:15:08 +0100 (CET)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mail.librecores.org (Postfix) with ESMTPS id 9EF0320A73
 for <openrisc@lists.librecores.org>; Sun, 27 Dec 2020 10:15:06 +0100 (CET)
Received: by mail-pj1-f45.google.com with SMTP id iq13so4401324pjb.3
 for <openrisc@lists.librecores.org>; Sun, 27 Dec 2020 01:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIgha9GtBqOktnyqlkwbboJhrovQmVp7OgpmsYVIqBc=;
 b=Z+4xUjgs1ofeqmMmyzvrMlrkz4NeS7Y1e7KpOKp+8MNUgyxrCgUPrZjPlnd3x11Nzk
 lKfOGq1wRbqSqUDnF+gU/UUGWS009MMkSHboVcLf62WR3FTOI8EJ1JqZLKwSCpZRO14z
 23XnCrdTB+cMLWajgYmUE+A7fwF7QI0DWSnnauAx+fDXy5T9yc3bCrotTrlmVAjEByfk
 BRX6auABVNHdJKBUdp1xDRUFPncl0JgeEt3vS92saWCmtwFQ4cempY75vfYVKx1UQg7g
 Slb3237+A/pNQICLdE4qMwq1GYGGfjip1iRu2PweVKZAVmcDpOAt13lx4DnOBq2Z554d
 hY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wIgha9GtBqOktnyqlkwbboJhrovQmVp7OgpmsYVIqBc=;
 b=gzN/fDOkYKNU7EGTXeQ53Fljs3cvv6UrEPOrJyhKDWSVjU2CgSyfp1zHWpL/SebRQx
 9WnmLX1U6EhVmgoNPEToVfqIcetbNdK4w0bhArw/iuHwBC6aKBlsxS5ZX23VCsEwRaf3
 b4VA+g9fmgRQmsoYUJJ6c0ttgiXrt1vviZtBXRypkKwJKPam+opFaSpkq3R560rdwQV+
 iQy4g3H81qJ9UuE4kGzDt7om4tOADT7Y4J48Af/ZWDSI1xpxorUXSfHb5NGkQVCenxnt
 tVe+TMdVh23n3eI3vFQyvhIvdowb7ZImUBq9HE/bW3PRKntEzidKgM+MZdyhwIl8ry7N
 K0Tg==
X-Gm-Message-State: AOAM532N9pUAV15KURRfKMPd8ejxyMzmR6U4TeAYN+pWYjPx1QGgSpWo
 E2G7YhDogPHAs3CQ03Ev0qM=
X-Google-Smtp-Source: ABdhPJzpTSlUqZlKpbJegbLFz0pjPycQkTclmti+hIxyQ3+FkXf8QXQL9mwZ0CkxHpcHaNEWDgbHCQ==
X-Received: by 2002:a17:902:9f97:b029:da:357b:22b0 with SMTP id
 g23-20020a1709029f97b02900da357b22b0mr18499215plq.73.1609060504688; 
 Sun, 27 Dec 2020 01:15:04 -0800 (PST)
Received: from voyager.ozlabs.ibm.com (region97.lnk.telstra.net.
 [110.143.27.102])
 by smtp.gmail.com with ESMTPSA id q70sm10860236pja.39.2020.12.27.01.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 01:15:03 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Dec 2020 19:44:46 +1030
Message-Id: <20201227091446.118437-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: restart: Call common handlers before
 hanging
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q3VycmVudGx5IG9wZW5yaXNjIHdpbGwgcHJpbnQgYSBtZXNzYWdlIGFuZCB0aGVuIGhhbmcgaW4g
YW4gaW5maW5pdGUKbG9vcCB3aGVuIHJlYm9vdGluZy4KClRoaXMgcGF0Y2ggYWRvcHRzIHNvbWUg
Y29kZSBmcm9tIEFSTSwgd2hpY2ggY2FsbHMgdGhlIGNvbW1vbiByZXN0YXJ0CmluZnJhc3RydWN0
dXJlIGFuZCBoYW5ncyBhZnRlciBhIHNtYWxsIGRlbGF5IGlmIHRoZSByZXN0YXJ0IGluZnJhCmRv
ZXNuJ3QgZG8gYW55dGhpbmcuCgpTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PgotLS0KR2VlcnQgaGFzIGEgcGF0Y2hbMV0gZm9yIHRoZSBsaXRleCBzb2MgY29kZSB0
aGF0IGFkZHMgYSByZXN0YXJ0IGhhbmRlci4KT3BlbnJpc2MgZG9lc24ndCBoaXQgdGhhdCBjb2Rl
IHBhdGgsIHRoaXMgcGF0Y2ggZml4ZXMgdGhhdC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vZ2Vl
cnR1L2xpbnV4L2NvbW1pdC83ZDA5ZGMwNzk3YTgyMDhhMTFlYjdjMGMyMTU2YzFhNGMxMjAxODBm
CgogYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jIHwgMTMgKysrKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
cHJvY2Vzcy5jCmluZGV4IDNjOTg3MjhjY2UyNC4uMTgxNDQ4Zjc0MzE2IDEwMDY0NAotLS0gYS9h
cmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
cHJvY2Vzcy5jCkBAIC0zNCw2ICszNCw3IEBACiAjaW5jbHVkZSA8bGludXgvaW5pdF90YXNrLmg+
CiAjaW5jbHVkZSA8bGludXgvbXF1ZXVlLmg+CiAjaW5jbHVkZSA8bGludXgvZnMuaD4KKyNpbmNs
dWRlIDxsaW51eC9yZWJvb3QuaD4KIAogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNs
dWRlIDxhc20vaW8uaD4KQEAgLTQ5LDEwICs1MCwxNiBAQAogICovCiBzdHJ1Y3QgdGhyZWFkX2lu
Zm8gKmN1cnJlbnRfdGhyZWFkX2luZm9fc2V0W05SX0NQVVNdID0geyAmaW5pdF90aHJlYWRfaW5m
bywgfTsKIAotdm9pZCBtYWNoaW5lX3Jlc3RhcnQodm9pZCkKK3ZvaWQgbWFjaGluZV9yZXN0YXJ0
KGNoYXIgKmNtZCkKIHsKLQlwcmludGsoS0VSTl9JTkZPICIqKiogTUFDSElORSBSRVNUQVJUICoq
KlxuIik7Ci0JX19hc21fXygibC5ub3AgMSIpOworCWRvX2tlcm5lbF9yZXN0YXJ0KGNtZCk7CisK
KwkvKiBHaXZlIGEgZ3JhY2UgcGVyaW9kIGZvciBmYWlsdXJlIHRvIHJlc3RhcnQgb2YgMXMgKi8K
KwltZGVsYXkoMTAwMCk7CisKKwkvKiBXaG9vcHMgLSB0aGUgcGxhdGZvcm0gd2FzIHVuYWJsZSB0
byByZWJvb3QuIFRlbGwgdGhlIHVzZXIhICovCisJcHJfZW1lcmcoIlJlYm9vdCBmYWlsZWQgLS0g
U3lzdGVtIGhhbHRlZFxuIik7CisJd2hpbGUgKDEpOwogfQogCiAvKgotLSAKMi4yOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
