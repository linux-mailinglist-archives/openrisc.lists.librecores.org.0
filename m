Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0902C204C12
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 168C920BCF;
	Tue, 23 Jun 2020 10:19:06 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id C030F209DF
 for <openrisc@lists.librecores.org>; Fri, 19 Jun 2020 18:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592583177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEacpwhabx4oqP5P1sDsSQYEJDVmYeAmQf6kbwzkxic=;
 b=MxSPlfUsgtuY2cyHYlwAVmMfYAi+5/TRhWytRSWxFXx4r9z0OrXvnRPd0EwkriTDMrly+d
 Q3NUWa6vI5d+gffeytJNhfUwy8vv0ZPNp5mMucsQCZNMzxosje19Y/f7QEuySOyWQZwMNg
 6G9LD1Hqi7dY+dEOUxBSClF++srW0BM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-rGUkWZMLPc2ZALPkJhnmIA-1; Fri, 19 Jun 2020 12:12:53 -0400
X-MC-Unique: rGUkWZMLPc2ZALPkJhnmIA-1
Received: by mail-qk1-f199.google.com with SMTP id t22so6830238qkg.3
 for <openrisc@lists.librecores.org>; Fri, 19 Jun 2020 09:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEacpwhabx4oqP5P1sDsSQYEJDVmYeAmQf6kbwzkxic=;
 b=PPxjziY7zLUhDeobX8TCR/7pPZ0TRElInKLjvl05Cd4iLGQyEGR2Pj1oVLJ5ooUFBx
 aJ3SzGzQiJSKP1Q4sp6sbZNLY4EcOyY8MMOCGL65fR61BTXddr34RNXp9Wo+/zkBSy1/
 5x9qM901ypYOFl9An1Qc39MxLJmps9z6mwuhIXSSSSUyE/NOEkf+C+G+5n225YewKwLS
 CftaKOP1NTVRlp4TbRWi1O3vHHKC6VxuktSOR580gliNPHgEJcYw4JYTF9Nbp8UgGCBr
 MRr1h/AKZd9cAO2JB/aq47VUl5AuSuQ6KwFKrZ3fvnOCMkFXkXOlG30Q9X15Ixlf1vg+
 vbDQ==
X-Gm-Message-State: AOAM531tlQ1Uc+g3R/r8AM7eTyaknSizoj45u+b4AsXtVFty6d1dhjaq
 EFCJTch/gc/7Y3DmKD8Sjvxz106xGidCEQdfI7gc50DDrnDGSWLaIrN7kmhpOf2x4i//g7GsBau
 HdAwtGNfldBPVdzqOxST+ewJ1dQ==
X-Received: by 2002:a0c:ea4a:: with SMTP id u10mr9341645qvp.225.1592583173102; 
 Fri, 19 Jun 2020 09:12:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/KbzvQf8GbrVk0E0Lv5jPmHcSh5JxBeheLHw2C8ZFelbbsjI3LhaiwkF4VxKMOl5dF8XE/g==
X-Received: by 2002:a0c:ea4a:: with SMTP id u10mr9341584qvp.225.1592583172386; 
 Fri, 19 Jun 2020 09:12:52 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id f203sm499961qke.135.2020.06.19.09.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 09:12:51 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Date: Fri, 19 Jun 2020 12:12:50 -0400
Message-Id: <20200619161250.9443-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
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
 Michael Ellerman <mpe@ellerman.id.au>, Peter Xu <peterx@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, openrisc@lists.librecores.org,
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
