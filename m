Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A77551FECBF
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7D57D20B6B;
	Thu, 18 Jun 2020 09:47:17 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mail.librecores.org (Postfix) with ESMTP id 7B8F620C6F
 for <openrisc@lists.librecores.org>; Tue, 16 Jun 2020 00:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592259398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGLIpLum9/bkEKfHV3oPe4nmlL39+Vf3k9heSN4qJAU=;
 b=b/RfJshVIfD+8zHTkrHyJqz/k+i17FlrFj0d+35rjthvTQePvWsq+7E37YpU6pOA/BUwT+
 OEH3Q1YXajqdztZHzSDMq0pQm+P2dABM7ys0lXa22fmxyPaXLA6uBz4xs3VLdn8RPZD9r5
 7jiE0j7gWBkwYWYQEHtNTPLtkvc5zH4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-k_lO-R_VO3CW8WRytT1YIw-1; Mon, 15 Jun 2020 18:16:36 -0400
X-MC-Unique: k_lO-R_VO3CW8WRytT1YIw-1
Received: by mail-qk1-f197.google.com with SMTP id m29so15363670qkm.17
 for <openrisc@lists.librecores.org>; Mon, 15 Jun 2020 15:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGLIpLum9/bkEKfHV3oPe4nmlL39+Vf3k9heSN4qJAU=;
 b=ZloIWjGsAiyFlRsL7FDdWE/eIKfNHs0vXBWe7OlChN3S+3egLJ93ddGftOD6CHE4tT
 GoWlPLj/mM+8hWmixp2Dowg0A1nCLcp9CcqPBWvPJ+63EFQonWu5iwwdPocmylbKcIa8
 Yjx0Xu8aErFzCgTG024qOBGQe6mCeuIUDqphD/74flzypE2jdu27TrMkAIYDWULttRTe
 XsQElogu+XvfgcAsl7gn5bvvYsb0ZVsFpTJeGoYkAw9jI40iZoTEhMUP0+dQrdiPZ85C
 YbhBRHxzsRET5zsgCuWb8CAymfe8EgLIPXsWfmfm/r/VjSOTh5/eNKpxXzXS9e2SYkty
 KMkw==
X-Gm-Message-State: AOAM533qUOIOJJyxFaXxMjUbqasTaAV5F92d/dH0F1kHFnXXB73di6Nm
 vZjKjBup+jG627jqZZcioWrg3xKnsxWYPP9jkrc5/yo8b7KbdlFtbxlvOiXuUe+0pT66u4iJ2c8
 DbyWKbct3do3slk5gLsDC0MmTQg==
X-Received: by 2002:ac8:551a:: with SMTP id j26mr18359207qtq.237.1592259396147; 
 Mon, 15 Jun 2020 15:16:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxognUmvVGeEJ3EpmiYCZAJK+S5RL79DtNWeRBIkUTKhLGqRsPOXXqxVvDHrT9aEIO3O5lmRA==
X-Received: by 2002:ac8:551a:: with SMTP id j26mr18359173qtq.237.1592259395830; 
 Mon, 15 Jun 2020 15:16:35 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 15:16:35 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 15 Jun 2020 18:15:57 -0400
Message-Id: <20200615221607.7764-16-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: [OpenRISC] [PATCH 15/25] mm/openrisc: Use mm_fault_accounting()
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
 peterx@redhat.com, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VXNlIHRoZSBuZXcgbW1fZmF1bHRfYWNjb3VudGluZygpIGhlbHBlciBmb3IgcGFnZSBmYXVsdCBh
Y2NvdW50aW5nLgoKQXZvaWQgZG9pbmcgcGFnZSBmYXVsdCBhY2NvdW50aW5nIG11bHRpcGxlIHRp
bWVzIGlmIHRoZSBwYWdlIGZhdWx0IGlzIHJldHJpZWQuCkFsc28sIHRoZSBwZXJmIGV2ZW50cyBm
b3IgcGFnZSBmYXVsdHMgd2lsbCBiZSBhY2NvdW50ZWQgdG9vIHdoZW4gdGhlIGNvbmZpZyBoYXMK
Q09ORklHX1BFUkZfRVZFTlRTIGRlZmluZWQuCgpDQzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhw
b2xlLnNlPgpDQzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVu
YWxhaHRpLmZpPgpDQzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CkNDOiBvcGVu
cmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwpTaWduZWQtb2ZmLWJ5OiBQZXRlciBYdSA8cGV0ZXJ4
QHJlZGhhdC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jIHwgOCArKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL29wZW5yaXNjL21tL2ZhdWx0LmMgYi9hcmNoL29wZW5yaXNjL21tL2ZhdWx0LmMK
aW5kZXggOGFmMWNjNzhjNGZiLi41OTQxOTVhZThjZGIgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJp
c2MvbW0vZmF1bHQuYworKysgYi9hcmNoL29wZW5yaXNjL21tL2ZhdWx0LmMKQEAgLTQ5LDcgKzQ5
LDcgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKIAlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKIAlzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYTsKIAlpbnQgc2lfY29kZTsKLQl2bV9mYXVsdF90IGZhdWx0Owor
CXZtX2ZhdWx0X3QgZmF1bHQsIG1ham9yID0gMDsKIAl1bnNpZ25lZCBpbnQgZmxhZ3MgPSBGQVVM
VF9GTEFHX0RFRkFVTFQ7CiAKIAl0c2sgPSBjdXJyZW50OwpAQCAtMTYwLDYgKzE2MCw3IEBAIGFz
bWxpbmthZ2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25l
ZCBsb25nIGFkZHJlc3MsCiAJICovCiAKIAlmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFk
ZHJlc3MsIGZsYWdzKTsKKwltYWpvciB8PSBmYXVsdCAmIFZNX0ZBVUxUX01BSk9SOwogCiAJaWYg
KGZhdWx0X3NpZ25hbF9wZW5kaW5nKGZhdWx0LCByZWdzKSkKIAkJcmV0dXJuOwpAQCAtMTc2LDEw
ICsxNzcsNiBAQCBhc21saW5rYWdlIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAq
cmVncywgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAogCiAJaWYgKGZsYWdzICYgRkFVTFRfRkxBR19B
TExPV19SRVRSWSkgewogCQkvKlJHRCBtb2RlbGVkIG9uIENyaXMgKi8KLQkJaWYgKGZhdWx0ICYg
Vk1fRkFVTFRfTUFKT1IpCi0JCQl0c2stPm1hal9mbHQrKzsKLQkJZWxzZQotCQkJdHNrLT5taW5f
Zmx0Kys7CiAJCWlmIChmYXVsdCAmIFZNX0ZBVUxUX1JFVFJZKSB7CiAJCQlmbGFncyB8PSBGQVVM
VF9GTEFHX1RSSUVEOwogCkBAIC0xOTMsNiArMTkwLDcgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3Bh
Z2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKIAl9
CiAKIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOworCW1tX2ZhdWx0X2FjY291bnRpbmcodHNrLCBy
ZWdzLCBhZGRyZXNzLCBtYWpvcik7CiAJcmV0dXJuOwogCiAJLyoKLS0gCjIuMjYuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
