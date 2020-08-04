Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EDB6923B3D5
	for <lists+openrisc@lfdr.de>; Tue,  4 Aug 2020 06:24:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6C3D320D91;
	Tue,  4 Aug 2020 06:24:15 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id 6BA5120CB1
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 06:24:13 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id lx9so1302625pjb.2
 for <openrisc@lists.librecores.org>; Mon, 03 Aug 2020 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDmLjdzKLB0Osgf6ewGVRDSUgUng436lOPq0tCkDdNg=;
 b=D3fJQVeIEd4R3yAQ6SOOh0aLBpHPeIFCZeNxoOPkIaX0RJKnnfwsRTsaYh7jV4wB1F
 67tpd6pr/2lzwWZCHHGe4k4eUb+nm3LqgfNtBb8tYIz0K1rVdCeoZvlbbG+8u5D1XLkL
 iUwGfQscXVDJB+xXV84kZrlcOneyVn3Q/x21khruEzeGQt2D1sJGP5UuYDyjXDhO2BIc
 4Hr1NunmBuWXSgqQab2vKyFwuB9T6aY0RfZzKl3SoIjpLefYmqJWQOZG98kocG+BTV0K
 1aNkqCbBKj8OvQViPyPSg3DlR7CVizuJjrTSoStfwQWlQDKj7fBY/hsAE/3AQPbzbH5u
 hgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDmLjdzKLB0Osgf6ewGVRDSUgUng436lOPq0tCkDdNg=;
 b=NEk4Drk7rtjy7KS18KuBc3/WML8gr+rw4YYrxLMqt4BTAQ643cnBtOpJXts7azChOw
 uPRiTmUwDCbE1MO3tINHuSpHMpgTsPclLsHDRs7B8xvTJoQ+wqeFHyNm9Ymp9x4etBqj
 u5vpG5eTs8cqosOFvJ/CbgQjhyUXSSyQA+TMTFVi7gaM6rUGpzno5me6T23ej0ANnXa8
 X/Tbgwz23aSi/v+Gx9ZrHH5+WhRTpSWIcqMZC0BYUdhHkAiJs+BDMVI9fl5EYSx+hy4L
 THQXgMFhSjoUbQsyPnTDEu4wH7bcpQ5RN2BgMq9eg8yvoKrSlHDpTXvHR5R7G/h/h0gt
 9gFg==
X-Gm-Message-State: AOAM5335E2LdQGRDuxGZhdjzcggdbD42rWZZ4M75Akd6eXlvT+s0ZLTK
 dVS771SyCQgfHHzuocFDJi0=
X-Google-Smtp-Source: ABdhPJwQwPhaJgeJn3Mb0+uHOLC5qvkBw7E1WqGqJCFpWn9QFgWarPSt6bLN5/8hkZBlFHHGzb4vYw==
X-Received: by 2002:a17:90a:d78f:: with SMTP id
 z15mr2570512pju.9.1596515051456; 
 Mon, 03 Aug 2020 21:24:11 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id w64sm4864734pfw.18.2020.08.03.21.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 21:24:10 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  4 Aug 2020 13:23:49 +0900
Message-Id: <20200804042354.3930694-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804042354.3930694-1-shorne@gmail.com>
References: <20200804042354.3930694-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/6] openrisc: io: Fixup defines and move include
 to the end
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBkaWRuJ3Qgc2VlbSB0byBjYXVzZSBhbnkgaXNzdWVzLCBidXQgd2hpbGUgd29ya2luZyBv
biBmaXhpbmcgdXAKc3BhcnNlIGFubm90YXRpb25zIGZvciBPcGVuUklTQyBJIG5vdGljZWQgdGhp
cy4gIFRoaXMgcGF0Y2ggbW92ZXMgdGhlCmluY2x1ZGUgb2YgYXNtLWdlbmVyaWMvaW8uaCB0byB0
aGUgZW5kIG9mIHRoZSBmaWxlLiAgQWxzbywgd2UgYWRkCmRlZmluZXMgb2YgaW9yZW1hcCBhbmQg
aW91bm1hcCwgdGhhdCB3YXkgd2UgZG9uJ3QgZ2V0IGR1cGxpY2F0ZQpkZWZpbml0aW9ucyBmcm9t
IGFzbS1nZW5lcmljL2lvLmguCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5l
QGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2lvLmggfCA3ICsrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9pby5oCmluZGV4IGRiMDJmYjIwNzdkOS4uZWY5ODU1NDBiNjc0IDEwMDY0NAot
LS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2lvLmgKKysrIGIvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9pby5oCkBAIC0yNSw5ICsyNSwxMiBAQAogI2RlZmluZSBQSU9fT0ZGU0VUCQkw
CiAjZGVmaW5lIFBJT19NQVNLCQkwCiAKLSNpbmNsdWRlIDxhc20tZ2VuZXJpYy9pby5oPgotCisj
ZGVmaW5lIGlvcmVtYXAgaW9yZW1hcAogdm9pZCBfX2lvbWVtICppb3JlbWFwKHBoeXNfYWRkcl90
IG9mZnNldCwgdW5zaWduZWQgbG9uZyBzaXplKTsKKworI2RlZmluZSBpb3VubWFwIGlvdW5tYXAK
IGV4dGVybiB2b2lkIGlvdW5tYXAodm9pZCAqYWRkcik7CiAKKyNpbmNsdWRlIDxhc20tZ2VuZXJp
Yy9pby5oPgorCiAjZW5kaWYKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
