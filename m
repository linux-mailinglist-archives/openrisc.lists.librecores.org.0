Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD1C2F554A
	for <lists+openrisc@lfdr.de>; Thu, 14 Jan 2021 00:51:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DC583210A9;
	Thu, 14 Jan 2021 00:51:01 +0100 (CET)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mail.librecores.org (Postfix) with ESMTPS id 8107C210A8
 for <openrisc@lists.librecores.org>; Thu, 14 Jan 2021 00:51:00 +0100 (CET)
Received: by mail-pj1-f41.google.com with SMTP id m5so2173695pjv.5
 for <openrisc@lists.librecores.org>; Wed, 13 Jan 2021 15:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GO6Ac7+UaCP5Bm3MzT3HEPuzvh9uCVimcQ27TxJ0BBk=;
 b=qpav4saxNlDlKmKC6fyhstCpL6pT525Wm8MT8GHJepQm25O6GIkal9hIl1A/orfAx2
 VYRlc3SfqtgIx4y62wnj9cPm4XpGKNO6pL4aFIPgjKoKYo0/sNMe8z/sYX5z5f1j1pXd
 cEn+NP66dISGD+DDrFOMruQStK/wiLEqTNWVvU8e85YQLO2zVM4KFt+1VZrZi/u2WbVR
 TOjMLxThj/tQ/3UponHT5GaiIKBs9hmmwpQ9XVSjXm5cPsESWiTGsgFM1Ji2Io4w2E27
 iZocdjIHOmRGzq3cNgBq86fUo89r6CvsAhr8mh7qiNEY+6TFgbwWvhcotj5XWgylqs2H
 IAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GO6Ac7+UaCP5Bm3MzT3HEPuzvh9uCVimcQ27TxJ0BBk=;
 b=HusgKCoGJa8/5b44ZEw+rJOxFlBjIHBGfdixHqDEjugG3uPixJY4GPz7e/TVnBBVbV
 hFhZu36U46NY0Y+8+NGF373Lrs39HBLaY6HSbliWwYOVMao9reftoCmaO/ghDsLtsKdC
 hJ3GoqaDseg6a9+BHWsj9yFQK7Yd5NhssFlXp4tBW5GUV/VvizVfGLxizOvqHBFToGAZ
 PWBlTIUsor3+s9FNT5dWaLGy5Ci9gwPhJtRVmfOUONxcezEaLHPXVfE9LlT0b/V+z1Lu
 zwvkasMRqi2pr1yA0JFQCFf13b2++tfHAdbhiRB8ABy0+s4ldzHxPT+SMuAcDQeu480d
 Sxbw==
X-Gm-Message-State: AOAM530rMS67tR/JfPQc5UoHBkUeSrL1kL4wFESAEu+aVM12jSA34/Y4
 w4lcxzE+VRmdiAJwNBajg7Wc/Wx66fE=
X-Google-Smtp-Source: ABdhPJyYeXYt6jUUHJdZsmgeJ8HLQBjsv4MKLfwxNZnLfqD41rrFBw6iK47jloy22Dcw5xSuKw4SMw==
X-Received: by 2002:a17:90b:204:: with SMTP id
 fy4mr1838111pjb.57.1610581859134; 
 Wed, 13 Jan 2021 15:50:59 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 5sm3568733pff.125.2021.01.13.15.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 15:50:58 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 14 Jan 2021 08:50:32 +0900
Message-Id: <20210113235032.2821155-6-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113235032.2821155-1-shorne@gmail.com>
References: <20210113235032.2821155-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 5/5] or1k: Fixup exception header data
 encodings
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

V2hpbGUgcnVubmluZyBnbGliYyB0ZXN0cyBzZXZlcmFsICotdGV4dHJlbCB0ZXN0cyBmYWlsZWQg
c2hvd2luZyB0aGF0CnJlbG9jYXRpb25zIHJlbWFpbmVkIGFnYWluc3QgcmVhZCBvbmx5IHNlY3Rp
b25zLiAgSXQgdHVybmVkIG91dCB0aGlzIHdhcwpyZWxhdGVkIHRvIGV4Y2VwdGlvbiBoZWFkZXJz
IGRhdGEgZW5jb2RpbmcgYmVpbmcgd3JvbmcuCgpCeSBkZWZhdWx0IHBvaW50ZXIgZW5jb2Rpbmcg
d2lsbCBhbHdheXMgdXNlIHRoZSBEV19FSF9QRV9hYnNwdHIgZm9ybWF0LgoKVGhpcyBwYXRjaCB1
c2VzIGZvcm1hdCBEV19FSF9QRV9wY3JlbCBhbmQgRFdfRUhfUEVfc2RhdGE0LiAgT3B0aW9uYWxs
eQpEV19FSF9QRV9pbmRpcmVjdCBpcyBpbmNsdWRlZCBmb3IgZ2xvYmFsIHN5bWJvbHMuICBUaGlz
IGVsaW1pbmF0ZXMgdGhlCnJlbG9jYXRpb25zLgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9v
cjFrL29yMWsuaCAoQVNNX1BSRUZFUlJFRF9FSF9EQVRBX0ZPUk1BVCk6IE5ldyBtYWNyby4KLS0t
CiBnY2MvY29uZmlnL29yMWsvb3Ixay5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCBiL2djYy9jb25m
aWcvb3Ixay9vcjFrLmgKaW5kZXggYjY4NmYxYmQxNTkuLmZlMDFhYjgxZWFkIDEwMDY0NAotLS0g
YS9nY2MvY29uZmlnL29yMWsvb3Ixay5oCisrKyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmgKQEAg
LTQwOCw0ICs0MDgsOCBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICAoKE4pIDwgNCA/IEhXX1RPX0dDQ19SRUdOTyAoMjUpICsg
KE4pIDogSU5WQUxJRF9SRUdOVU0pCiAjZGVmaW5lIEVIX1JFVFVSTl9TVEFDS0FESl9SVFggZ2Vu
X3J0eF9SRUcgKFBtb2RlLCBFSF9SRVRVUk5fUkVHTlVNKQogCisvKiBTZWxlY3QgYSBmb3JtYXQg
dG8gZW5jb2RlIHBvaW50ZXJzIGluIGV4Y2VwdGlvbiBoYW5kbGluZyBkYXRhLiAgKi8KKyNkZWZp
bmUgQVNNX1BSRUZFUlJFRF9FSF9EQVRBX0ZPUk1BVChDT0RFLCBHTE9CQUwpIFwKKyAgKCgoR0xP
QkFMKSA/IERXX0VIX1BFX2luZGlyZWN0IDogMCkgfCBEV19FSF9QRV9wY3JlbCB8IERXX0VIX1BF
X3NkYXRhNCkKKwogI2VuZGlmIC8qIEdDQ19PUjFLX0ggKi8KLS0gCjIuMjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
