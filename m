Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 64FAE3816AB
	for <lists+openrisc@lfdr.de>; Sat, 15 May 2021 09:58:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0AEFF20D48;
	Sat, 15 May 2021 09:58:20 +0200 (CEST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mail.librecores.org (Postfix) with ESMTPS id 94E592134D
 for <openrisc@lists.librecores.org>; Sat, 15 May 2021 09:58:17 +0200 (CEST)
Received: by mail-pf1-f175.google.com with SMTP id d78so508741pfd.10
 for <openrisc@lists.librecores.org>; Sat, 15 May 2021 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4GpRKqq0Hh8VXNoCmefE6hvFF64AcDKdWMSle7oESs=;
 b=Ssvka/b0GJcG9jPrn2r9Wwt/ENY3htXN1EGBow03T9l47EW+lNGy82T02tiFKoY/1I
 iuGRAP8qBD2VRPZIjyu1j8N9XHRjGx/aVzMexoeghgHShKZ87FVLoemWZx8nkrfGd5ei
 XtLT6qv3DkDBB+LoPytJdw5Rwv8kisDgXxtC85LBd7lDELrjKKnlBCKBazeoHJXHILUt
 04f57/N8K/31FPCDt8Q9jWmhwIkAMKPEDvlljld0Ta8i4VN0NWNcLBZL/H85aztFxKkB
 arXIUSxwwvoTn9+HC6pw2nl6yMObN2BoPDaOv7I1m4cL44MAb1OWL8NQjZNtNvVz+sZS
 cbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4GpRKqq0Hh8VXNoCmefE6hvFF64AcDKdWMSle7oESs=;
 b=Ngc9Buw8toC7FXud+zJYMcBhgyxq+P8bwviDL4uS3ScUJ5c2jkNfU+tcfihhgG94hX
 QTGaKU4oyTfY3oSR9IWpdlY8S4QbNqSeX3Keyb6sH6Mm7/PfcDKtEa2KPVQi3a9vJsdk
 nNE6UbUtur4/j3V1hZuh+OnWmyO5ebmbr5lV8nRattkSvCz6Vjyfiaa7TFz1lRw8U3oj
 a/3kFOjSq45UbE0mqMQ4QW8eUzU6/zlLVDKGLpRQIYMOr6AwewDM4ia2C3t7lhGiEUQo
 gJszSdvir9ngenEJS4IoPjmkx5+LHYaZmDrayJU8UVkf3uaBTKGzC23PVCl2wGoSecij
 vTBw==
X-Gm-Message-State: AOAM53131pvL+KWkv4p620pCC+VqlIuJS1N8M+DR+CKm+JLcTqK1n6FH
 w+o7eQ+T5Q24TMr+xspMEaU=
X-Google-Smtp-Source: ABdhPJxCSeNcHpbwVJefc0+GfVXBi+dCmEwmGQUuiSxdmxwFU6Ojxt1xPilU9mRxJHaerEHIELupNw==
X-Received: by 2002:a05:6a00:84f:b029:2be:3b80:e9eb with SMTP id
 q15-20020a056a00084fb02902be3b80e9ebmr30751843pfk.39.1621065495984; 
 Sat, 15 May 2021 00:58:15 -0700 (PDT)
Received: from localhost (g1.222-224-229.ppp.wakwak.ne.jp. [222.224.229.1])
 by smtp.gmail.com with ESMTPSA id l18sm10350717pjq.33.2021.05.15.00.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 00:58:15 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat, 15 May 2021 16:58:08 +0900
Message-Id: <20210515075810.163206-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Define memory barrier mb
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jonas Bonn <jonas@southpole.se>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKVGhpcyBjYW1lIHVw
IGluIHRoZSBkaXNjdXNzaW9uIG9mIHRoZSByZXF1aXJlbWVudHMgb2YgcXNwaW5sb2NrIG9uIGFu
CmFyY2hpdGVjdHVyZS4gIE9wZW5SSVNDIHVzZXMgcXNwaW5sb2NrLCBidXQgaXQgd2FzIG5vdGlj
ZWQgdGhhdCB0aGUKbWVtbW9yeSBiYXJyaWVyIHdhcyBub3QgZGVmaW5lZC4KClBldGVyIGRlZmlu
ZWQgaXQgaW4gdGhlIG1haWwgdGhyZWFkIHdyaXRpbmc6CgogICAgQXMgbmVhciBhcyBJIGNhbiB0
ZWxsIHRoaXMgc2hvdWxkIGRvLiBUaGUgYXJjaCBzcGVjIG9ubHkgbGlzdHMKICAgIHRoaXMgb25l
IGluc3RydWN0aW9uIGFuZCB0aGUgdGV4dCBtYWtlcyBpdCBzb3VuZCBsaWtlIGEgY29tcGxldGlv
bgogICAgYmFycmllci4KClRoaXMgaXMgY29ycmVjdCBzbyBhcHBseWluZyB0aGlzIHBhdGNoLgoK
U2lnbmVkLW9mZi1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpbc2hv
cm5lQGdtYWlsLmNvbTpUdXJuZWQgdGhlIG1haWwgaW50byBhIHBhdGNoXQpTaWduZWQtb2ZmLWJ5
OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCkkganVzdCBhcHBsaWVkIHRo
ZSBwYXRjaCBwb3N0ZWQgYnkgUGV0ZXIgaW4gdGhlIG1haWwgYXMgaXMgaGVuY2UgaXQgaXMgbGFi
ZWxlZApmcm9tIHBldGVyLiAgVGhpcyBhbHNvIHJlcXVpcmVkIG1lIHRvIHNldCB0aGUgU2lnbmVk
LW9mZi1ieSB0byBQZXRlci4KCklmIHRoZXJlIGlzIGFueSBpc3N1ZSB3aXRoIHRoYXQgbGV0IG1l
IGtub3cuICBJIHRlc3RlZCB0aGlzIG91dCBvbiBteSBzaW5nbGUKcHJvY2Vzc29yIHNldHVwIGFu
ZCBpdCBhbGwgd29ya3MgZmluZSwgaXQgd2lsbCB0YWtlIG1lIHNvbWUgdGltZSB0byBnZXQgbXkg
U01QCnNldHVwIHVwIGFuZCBydW5uaW5nIGFnYWluIHRvIHRlc3QgdGhlIG90aGVyIHBhdGNoZXMs
IGJ1dCBJIGZpZ3VyZWQgSSB3b3VsZCBzZW5kCnRoaXMgcGF0Y2ggZmlyc3QuCgpBbHNvLCBJIGdv
dCBkZWxheWVkIGJlY2F1c2UgSSBoYWQgdG8gcmVidWlsZCBteSBtYWluIHdvcmtzdGF0aW9uIGFm
dGVyIGEKaGFyZHdhcmUgZmFpbHVyZS4KCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2JhcnJp
ZXIuaCB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9iYXJyaWVyLmgKCmRpZmYg
LS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaCBiL2FyY2gvb3BlbnJp
c2MvaW5jbHVkZS9hc20vYmFycmllci5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uNzUzODI5NDcyMWJlCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9iYXJyaWVyLmgKQEAgLTAsMCArMSw5IEBACisvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRlZiBfX0FTTV9CQVJSSUVSX0gKKyNkZWZpbmUgX19B
U01fQkFSUklFUl9ICisKKyNkZWZpbmUgbWIoKSBhc20gdm9sYXRpbGUgKCJsLm1zeW5jIiA6Ojog
Im1lbW9yeSIpCisKKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9iYXJyaWVyLmg+CisKKyNlbmRpZiAv
KiBfX0FTTV9CQVJSSUVSX0ggKi8KLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
