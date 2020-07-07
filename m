Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE7F22B81C
	for <lists+openrisc@lfdr.de>; Thu, 23 Jul 2020 22:49:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3494520899;
	Thu, 23 Jul 2020 22:49:48 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 58F60209DB
 for <openrisc@lists.librecores.org>; Wed,  8 Jul 2020 00:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594162254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2j+0prlu3q0Pnx3SiAUON88ocaozCL3GS+ha/ScH8o=;
 b=iVJuWLS54VtTbYY6bfFfQSVs2CZ+a6tgXWIgJW3v5MRUb8IC6j/NLcHeAGa5E4eh6yn6i1
 qwrB4m9SKz0NNicedzDWWLHwEOGg/Nv3ii7cWUCTTxsF1tfrSFPQ9tS1PhHhEes3lU9mZU
 fJ+oeQu1+Izp5X6vtgsl39r9ywfG73s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-Ul_xiWOFMtmoIzfZraEuVA-1; Tue, 07 Jul 2020 18:50:47 -0400
X-MC-Unique: Ul_xiWOFMtmoIzfZraEuVA-1
Received: by mail-qv1-f69.google.com with SMTP id y36so27986727qvf.21
 for <openrisc@lists.librecores.org>; Tue, 07 Jul 2020 15:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2j+0prlu3q0Pnx3SiAUON88ocaozCL3GS+ha/ScH8o=;
 b=Wivt3cMgT+W/HMmBoBSfdX0LtcMDjbc8xKZ1n2+OX/e1xgeyVIlHo6j28jhL5XABo0
 A6eOMeE/jPKbWAMwc2r2m8vUbDQmABjcHOoA9n+OZCdE8WNMSJ4LaaxRoFOcPG3Jpsnw
 sVrTZ5ipR63qdNwAxJf41uC+s+q3aoOE3vAxlm8C/hLfO6p/45j93Br+lLsn1y5gIY5u
 IocGzu7hlZRvQLpyvpWsGV6syNzqgHWcpnkZgTs1tKuZCV1hCYjgp8gNDCCAfjpll9/T
 Diy6YT4MuL15ZYk+M/6JKngD7Mjjptlc7MINXKVYRdItMbfxdmq7HnjCP2hBVdMlsLdX
 Kjlw==
X-Gm-Message-State: AOAM531/sRDBxXMuZPZndFiDjm4smNBZS+pPQDzhYFS5rGdNr+4mgE9y
 R2u4KDYBEo7IxDglikPOr2Qi8xs0BX4UKOpaEio8WQZDx+clOlo9XL2YkcNbXkrZqlKvjx4Wb+g
 2UIdWDM1DKasRP9N8+t2mp6GG4Q==
X-Received: by 2002:a0c:da04:: with SMTP id x4mr54367817qvj.71.1594162247378; 
 Tue, 07 Jul 2020 15:50:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz91h7dze6hXBpExvldsXu0sEfg+FT9NjBcwqSN/tOXe3f7PIXsIg7+TlKvGVkbKH0rXidC5g==
X-Received: by 2002:a0c:da04:: with SMTP id x4mr54367784qvj.71.1594162247063; 
 Tue, 07 Jul 2020 15:50:47 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 15:50:46 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Date: Tue,  7 Jul 2020 18:50:10 -0400
Message-Id: <20200707225021.200906-15-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 22:49:44 +0200
Subject: [OpenRISC] [PATCH v5 14/25] mm/openrisc: Use general page fault
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
 John Hubbard <jhubbard@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, peterx@redhat.com,
 openrisc@lists.librecores.org, Michael Ellerman <mpe@ellerman.id.au>,
 David Rientjes <rientjes@google.com>,
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
bW0vZmF1bHQuYwppbmRleCAzZGFhNDkxZDFlZGIuLmNhOTdkOWJhYWI1MSAxMDA2NDQKLS0tIGEv
YXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jCisrKyBiL2FyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYwpA
QCAtMTUsNiArMTUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgogI2luY2x1ZGUg
PGxpbnV4L2V4dGFibGUuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC9zaWduYWwuaD4KKyNpbmNs
dWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+CiAKICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAj
aW5jbHVkZSA8YXNtL3NpZ2luZm8uaD4KQEAgLTEwMyw2ICsxMDQsOCBAQCBhc21saW5rYWdlIHZv
aWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRy
ZXNzLAogCWlmIChpbl9pbnRlcnJ1cHQoKSB8fCAhbW0pCiAJCWdvdG8gbm9fY29udGV4dDsKIAor
CXBlcmZfc3dfZXZlbnQoUEVSRl9DT1VOVF9TV19QQUdFX0ZBVUxUUywgMSwgcmVncywgYWRkcmVz
cyk7CisKIHJldHJ5OgogCW1tYXBfcmVhZF9sb2NrKG1tKTsKIAl2bWEgPSBmaW5kX3ZtYShtbSwg
YWRkcmVzcyk7CkBAIC0xNTksNyArMTYyLDcgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1
bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKIAkgKiB0aGUg
ZmF1bHQuCiAJICovCiAKLQlmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHJlc3MsIGZs
YWdzLCBOVUxMKTsKKwlmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHJlc3MsIGZsYWdz
LCByZWdzKTsKIAogCWlmIChmYXVsdF9zaWduYWxfcGVuZGluZyhmYXVsdCwgcmVncykpCiAJCXJl
dHVybjsKQEAgLTE3NiwxMCArMTc5LDYgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKIAogCWlmIChmbGFn
cyAmIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkpIHsKIAkJLypSR0QgbW9kZWxlZCBvbiBDcmlzICov
Ci0JCWlmIChmYXVsdCAmIFZNX0ZBVUxUX01BSk9SKQotCQkJdHNrLT5tYWpfZmx0Kys7Ci0JCWVs
c2UKLQkJCXRzay0+bWluX2ZsdCsrOwogCQlpZiAoZmF1bHQgJiBWTV9GQVVMVF9SRVRSWSkgewog
CQkJZmxhZ3MgfD0gRkFVTFRfRkxBR19UUklFRDsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
