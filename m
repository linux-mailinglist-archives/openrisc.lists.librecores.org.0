Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 342902460E8
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 06B6520EC4;
	Mon, 17 Aug 2020 10:46:53 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id 9861820DB1
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 01:07:01 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id d19so2863980pgl.10
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 16:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emiTgggaIF+BQrqHX2Ti87z5PsPZiDji49xQXoUlCVA=;
 b=LoE/fjBSi9f+qG08SnhKBMIqj5SRCNf06QZHLO8LAHjwjeV3QfzjitC8SoIve96p8d
 9mpz5ZfGO2qcYXm0rAMBYSJECHZcVksa+xs6tHM4l04EFKO/0BDSzScMxeygHhqnHzbX
 AXEwTvbdhNHHopLBXpgWeTRBFOSUP0uh2DQiUUgSjKMhl0syXgVvxkcYoTfjzoEKE2NK
 DXxtv/TjtV7FUCeGThWxxq1pA/eIMCNScbcwvxup1Y9MCUa8GnRcA+8IRufBSf9PlCrZ
 Xd38U0VJCb4hvZQXSwU2DOysRVfA6547D3G7t/QWwvHoJgwwisS1JgqF6mHYOSew7A0X
 aJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emiTgggaIF+BQrqHX2Ti87z5PsPZiDji49xQXoUlCVA=;
 b=CrGNrssbb+YNvas2yH/CguQGjsBaVYsRLmv6FTwFGdNUr6RY2I9lGfnJOHKAw2Bx1t
 eETYV5gCf5GC6X2qkZabMcIlkiAO49LkRvMZqDfvUqmKKHfI4FnEe6/N0cbUhcpTpn64
 nnyUcLp2Nyd+7YzMioCbf3PU6qxMJLYj/NUZNbTdm1jNP+0meN56N5OH2hS+8gLSWtnr
 I4cgSmLMWa0GIaqv/0MlMkOYMzyo521fen3nF3nkiAJ33PU3gTqY7vHTvuSP+Cw7mcA1
 RaWKAeXz/vwXC3UvCWJJQ4eNxPO5WgXaCNzBDTgZyUY6X7HzsbF/jaORi3bBTvhBxuMT
 CAeA==
X-Gm-Message-State: AOAM532mCnFgu4sD51Pd/j6VPQ2abhzoqqRxuhcAZUp1g9gLyBybU+mF
 pIaF4lo+NsjnnVjGfUYnZYE=
X-Google-Smtp-Source: ABdhPJwc8Q9LMIsXZW8Gug+sjrx5goq3Q3xh0H9aatHbSvWaZlDxI8HC7TJrpGzpLUj0+DZqeIopIA==
X-Received: by 2002:a63:b709:: with SMTP id t9mr16476983pgf.376.1596928020053; 
 Sat, 08 Aug 2020 16:07:00 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id d24sm19470570pfq.72.2020.08.08.16.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 16:06:59 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  9 Aug 2020 08:06:42 +0900
Message-Id: <20200808230647.833047-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808230647.833047-1-shorne@gmail.com>
References: <20200808230647.833047-1-shorne@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH v3 1/6] openrisc: io: Fixup defines and move
 include to the end
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
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
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
QGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIG5vbmUKQ2hhbmdlcyBzaW5jZSB2
MToKIC0gQWRkIGxpbnV4L3R5cGVzLmggaW5jbHVkZSBmb2xsb3dpbmcgcmVwb3J0IGZyb20ga2J1
aWxkCgogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oIHwgOSArKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2Fz
bS9pby5oCmluZGV4IGRiMDJmYjIwNzdkOS4uN2Q2YjRhNzdiMzc5IDEwMDY0NAotLS0gYS9hcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL2lvLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2Fz
bS9pby5oCkBAIC0xNCw2ICsxNCw4IEBACiAjaWZuZGVmIF9fQVNNX09QRU5SSVNDX0lPX0gKICNk
ZWZpbmUgX19BU01fT1BFTlJJU0NfSU9fSAogCisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KKwog
LyoKICAqIFBDSTogY2FuIHdlIHJlYWxseSBkbyAwIGhlcmUgaWYgd2UgaGF2ZSBubyBwb3J0IElP
PwogICovCkBAIC0yNSw5ICsyNywxMiBAQAogI2RlZmluZSBQSU9fT0ZGU0VUCQkwCiAjZGVmaW5l
IFBJT19NQVNLCQkwCiAKLSNpbmNsdWRlIDxhc20tZ2VuZXJpYy9pby5oPgotCisjZGVmaW5lIGlv
cmVtYXAgaW9yZW1hcAogdm9pZCBfX2lvbWVtICppb3JlbWFwKHBoeXNfYWRkcl90IG9mZnNldCwg
dW5zaWduZWQgbG9uZyBzaXplKTsKKworI2RlZmluZSBpb3VubWFwIGlvdW5tYXAKIGV4dGVybiB2
b2lkIGlvdW5tYXAodm9pZCAqYWRkcik7CiAKKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9pby5oPgor
CiAjZW5kaWYKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
