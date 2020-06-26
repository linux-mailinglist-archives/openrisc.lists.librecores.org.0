Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DA90220DCD9
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:44:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DDBC120372;
	Mon, 29 Jun 2020 22:44:56 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 3BD9C20C5F
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 00:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593210983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEacpwhabx4oqP5P1sDsSQYEJDVmYeAmQf6kbwzkxic=;
 b=Q+jkI5c4V4Xz2IWF1EAc4MrS7HpCIaZuJYwn8iPbZMEjajSVZHyKhXXT3ZuDSRWZtiClcw
 IZHtltQ4tqt1TDrUEJb8eVWIxxXp0pW22vskc/jbsLrtQQcTVhEinh/2NPFnMcoxYMm0xz
 ZvYuHE5TVRF5fnrlulfyO38G61xZYzg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-22XLnsqnPUW7u-vjwCWa5A-1; Fri, 26 Jun 2020 18:36:20 -0400
X-MC-Unique: 22XLnsqnPUW7u-vjwCWa5A-1
Received: by mail-qv1-f70.google.com with SMTP id da10so7406090qvb.2
 for <openrisc@lists.librecores.org>; Fri, 26 Jun 2020 15:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEacpwhabx4oqP5P1sDsSQYEJDVmYeAmQf6kbwzkxic=;
 b=ZT31wybTq5EyUVjxrwwcByiKSBmwrDjjYHe9hTXlujqiNIa3WJM4g4ws4W3QY9J6VF
 UZwExu2shrp7RQ8iUH9Kv6/sAB/NOYetPtvjw8vjGGwNBo6/llazS2h/n6Ma60S07VnR
 UcKExYG3uZs1KgApEIvgYy2xVFrJPMtLetkLvt7POTSy/aL26g3l8uvksLjsHmvesMXz
 ycD8D0RMLdL+rtloZBoZh6SQetILAY3SsVe3c3e140WBJX2g2phH7I1t5QYUSoSQw3iX
 3xKvNlFGdKiK/NZgvE/sWxRJIw2aodhattpb57+zYAHII5Aus/6hWy1gbw9qOsdInCCW
 3XAw==
X-Gm-Message-State: AOAM531MB1sCNlJnoCpIVQb95zRmMwAUM5aySIjE1VyZap1Ct/2RRAzC
 HpXZKFjaVdXVE8vuww28K2gtEN83r7bzgI14Rb4SESeYf0+b//kXRUczSLKLIxMSsQkJ/CKPiOB
 xTeRbAu4uhs/ZX70lbaVKbwqhBw==
X-Received: by 2002:a0c:da04:: with SMTP id x4mr5373461qvj.71.1593210979895;
 Fri, 26 Jun 2020 15:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBZJGvl8YZD3UD74l3WAMRy83bIKViLR3O57/9pXVwl73+z2DH1H0MK6MkNpbyIvHsKU6sUg==
X-Received: by 2002:a0c:da04:: with SMTP id x4mr5373440qvj.71.1593210979588;
 Fri, 26 Jun 2020 15:36:19 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id x26sm9633604qtr.4.2020.06.26.15.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 15:36:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Date: Fri, 26 Jun 2020 18:36:17 -0400
Message-Id: <20200626223617.199669-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: [OpenRISC] [PATCH 14/26] mm/openrisc: Use general page fault
 accounting
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Jonas Bonn <jonas@southpole.se>,
 Linus Torvalds <torvalds@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 openrisc@lists.librecores.org, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VXNlIHRoZSBnZW5lcmFsIHBhZ2UgZmF1bHQgYWNjb3VudGluZyBieSBwYXNzaW5nIHJlZ3MgaW50
byBoYW5kbGVfbW1fZmF1bHQoKS4KSXQgbmF0dXJhbGx5IHNvbHZlIHRoZSBpc3N1ZSBvZiBtdWx0
aXBsZSBwYWdlIGZhdWx0IGFjY291bnRpbmcgd2hlbiBwYWdlIGZhdWx0CnJldHJ5IGhhcHBlbmVk
LgoKQWRkIHRoZSBtaXNzaW5nIFBFUkZfQ09VTlRfU1dfUEFHRV9GQVVMVFMgcGVyZiBldmVudHMg
dG9vLiAgTm90ZSwgdGhlIG90aGVyIHR3bwpwZXJmIGV2ZW50cyAoUEVSRl9DT1VOVF9TV19QQUdF
X0ZBVUxUU19bTUFKfE1JTl0pIHdlcmUgZG9uZSBpbiBoYW5kbGVfbW1fZmF1bHQoKS4KCkNDOiBK
b25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+CkNDOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxz
dGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+CkNDOiBTdGFmZm9yZCBIb3JuZSA8c2hv
cm5lQGdtYWlsLmNvbT4KQ0M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCkFja2VkLWJ5
OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogUGV0ZXIg
WHUgPHBldGVyeEByZWRoYXQuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYyB8IDkg
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYyBiL2FyY2gvb3BlbnJpc2Mv
bW0vZmF1bHQuYwppbmRleCA0NWFlZGM1NzIzNjEuLjUyNTVkNzNjZTE4MCAxMDA2NDQKLS0tIGEv
YXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jCisrKyBiL2FyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYwpA
QCAtMTUsNiArMTUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgogI2luY2x1ZGUg
PGxpbnV4L2V4dGFibGUuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC9zaWduYWwuaD4KKyNpbmNs
dWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+CiAKICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAj
aW5jbHVkZSA8YXNtL3NpZ2luZm8uaD4KQEAgLTEwMyw2ICsxMDQsOCBAQCBhc21saW5rYWdlIHZv
aWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRy
ZXNzLAogCWlmIChpbl9pbnRlcnJ1cHQoKSB8fCAhbW0pCiAJCWdvdG8gbm9fY29udGV4dDsKIAor
CXBlcmZfc3dfZXZlbnQoUEVSRl9DT1VOVF9TV19QQUdFX0ZBVUxUUywgMSwgcmVncywgYWRkcmVz
cyk7CisKIHJldHJ5OgogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAl2bWEgPSBmaW5kX3Zt
YShtbSwgYWRkcmVzcyk7CkBAIC0xNTksNyArMTYyLDcgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3Bh
Z2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKIAkg
KiB0aGUgZmF1bHQuCiAJICovCiAKLQlmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHJl
c3MsIGZsYWdzLCBOVUxMKTsKKwlmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHJlc3Ms
IGZsYWdzLCByZWdzKTsKIAogCWlmIChmYXVsdF9zaWduYWxfcGVuZGluZyhmYXVsdCwgcmVncykp
CiAJCXJldHVybjsKQEAgLTE3NiwxMCArMTc5LDYgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2Vf
ZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKIAogCWlm
IChmbGFncyAmIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkpIHsKIAkJLypSR0QgbW9kZWxlZCBvbiBD
cmlzICovCi0JCWlmIChmYXVsdCAmIFZNX0ZBVUxUX01BSk9SKQotCQkJdHNrLT5tYWpfZmx0Kys7
Ci0JCWVsc2UKLQkJCXRzay0+bWluX2ZsdCsrOwogCQlpZiAoZmF1bHQgJiBWTV9GQVVMVF9SRVRS
WSkgewogCQkJZmxhZ3MgfD0gRkFVTFRfRkxBR19UUklFRDsKIAotLSAKMi4yNi4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
