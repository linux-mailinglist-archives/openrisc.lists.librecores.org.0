Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B7AF422B818
	for <lists+openrisc@lfdr.de>; Thu, 23 Jul 2020 22:49:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E0865207E4;
	Thu, 23 Jul 2020 22:49:45 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 0948320CCC
 for <openrisc@lists.librecores.org>; Tue, 30 Jun 2020 22:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593549948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C2j+0prlu3q0Pnx3SiAUON88ocaozCL3GS+ha/ScH8o=;
 b=au9DgJdddAkVBR8A934YbMFfawg4mDtFC/moL//wneMFoeYA7nPv0GGCNEj73Nqs+PAxGX
 bhOgfEZPb8Sf4/KO6s1BNA+9Oppmfsv9v4np9ob0eSuqKDpODUGzQtxxBA8d4Tbsu711tW
 2+qv53Q6b/g9AInVOeZ2y7Y7gNOQmKI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-ShjyzMcfOxezzsIGGLyb2Q-1; Tue, 30 Jun 2020 16:45:41 -0400
X-MC-Unique: ShjyzMcfOxezzsIGGLyb2Q-1
Received: by mail-qk1-f200.google.com with SMTP id v16so5292004qka.18
 for <openrisc@lists.librecores.org>; Tue, 30 Jun 2020 13:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C2j+0prlu3q0Pnx3SiAUON88ocaozCL3GS+ha/ScH8o=;
 b=QGzu716SGAbyui2aA1sQMfSUvMglwHhws/12qYRkqMHxy2WHERXg1rDgF9A4o6b7PP
 i6IPPWSt4Ea2QcAOD5VplSE3e5nr+qBC7FRh7G2itSzgCGOf0u92s1ij1vcYtXpTVm9G
 gPywJhIKLmWuBJ/NprYLk8hk14E9z1F12TcXBJ4hlsRtqHXD1qllu8cIZYnudTFe11w3
 pPHAgK/Ze9DkuQ/71ms8hJMoEyJm9EcMsr+IEh/Kh249uY1gpaOiPEdMDfBBr5USxRiS
 +VG4VotONQKAAz5AqZjXFdnmd/lssiQ+boUOwEpXlTeHFhR/zDPqRVDPXkNnMY7qmkHl
 K/Vw==
X-Gm-Message-State: AOAM530Hq11tNx0Aq5jNS8kVTeLtB7v4sHGKeOcRv1cvc+QxDaxUBoHN
 zeeJJOxn0SoAefgFEqW0MmdeN8F8dvHYnoyDKamoIHldPDw15NFoP8objfuXrQjYb60/VLhIcIe
 Obx1DecK0IUPXpaDzF4gJz09YkA==
X-Received: by 2002:a37:af82:: with SMTP id
 y124mr21944091qke.254.1593549940800; 
 Tue, 30 Jun 2020 13:45:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/HYIsMAbxeYN3zSZX+wIPNCjUoMjnq6Rwg1C2jh93RywEtUABz6jJyXvLDQO0NcHZL2Cmkg==
X-Received: by 2002:a37:af82:: with SMTP id
 y124mr21944054qke.254.1593549940427; 
 Tue, 30 Jun 2020 13:45:40 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id 142sm3880877qki.35.2020.06.30.13.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:45:39 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Date: Tue, 30 Jun 2020 16:45:38 -0400
Message-Id: <20200630204538.39149-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 22:49:44 +0200
Subject: [OpenRISC] [PATCH v4 14/26] mm/openrisc: Use general page fault
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
 Will Deacon <will@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 peterx@redhat.com, openrisc@lists.librecores.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
