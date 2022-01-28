Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9114A043B
	for <lists+openrisc@lfdr.de>; Sat, 29 Jan 2022 00:29:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D5807247D2;
	Sat, 29 Jan 2022 00:29:01 +0100 (CET)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mail.librecores.org (Postfix) with ESMTPS id DDACC20B5D
 for <openrisc@lists.librecores.org>; Sat, 29 Jan 2022 00:29:00 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id e6so7556518pfc.7
 for <openrisc@lists.librecores.org>; Fri, 28 Jan 2022 15:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=okVLYY5tudmPxE4wvziU7S4Bp1GOjUxdrMHwz4V8Tew=;
 b=A8vXPaYZny5uQ251IvXKSvg+OLz2iGoY329a2OFiigo15P4s4BSrlTCCGR2b/GyO2a
 QXwrcP3h0TOIYZwvzMsQzyjb7kGn4N1OKo7zWL6Ot4VM6HfLDfYC/miPEOqIGo2NcU24
 PJX6syd9JskRqk8VKqekG6D+TkKKAaeTK9F2J0zWU3kr28/w+un5S5pdETIGJpB+712g
 ngV/RfUjS9hiiMe+s/i8Vf1FUnSNOOR8Z9jBYb4PR8Asmznp49h/eIdll8ZyQfP77iYi
 FzpVAI2ej3PNj6at7CkW0kC+v18Pc/IlW57iB9C4WdxpHJbYOyxDaB3VbgS42C4HeQpZ
 shjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=okVLYY5tudmPxE4wvziU7S4Bp1GOjUxdrMHwz4V8Tew=;
 b=VNsoSo1lsR8GzHIYVDJKrbLp6qEb9M4LnLDgdK3PVQWVFXTawv1AhfV9+JUsr88WUr
 M+73r6VUnO5LAxzMcEjX/b9cdw/qT+tYBMIkdzrD8dIb4xOgQ2cEvmUDZ9mHF87Ti+Oy
 6XjIAgPD/x5Ow8ttoauBUFmHzvzCGgkr3pqRtYHlFXZ4muuLbn0LmbA1VyzexMTkC2o7
 DrpBo/nPVFtieF2QHkupt3rt2GaW2QWsCXUgolbr+0rK9WHTjgGUuvDN/tOYllx+YEki
 loSxMkcwseaSxsi87dp/d0HwDCyteEL3GH3r/SddnjTZR1CvTWBWCHuD9kiHwxaYj+RH
 2wKw==
X-Gm-Message-State: AOAM532GTacQvDToBUJMwsu5Bmu/V7NpQWjgJSHOOPPoRx+YcuTdz7XQ
 VwJMN6irPwvh2p3QzOlq33k=
X-Google-Smtp-Source: ABdhPJwkw49XfwF4E+HxgnVyBvkgA7s+Hhyh4ZI6a37RXiO7f655A1p+tplzo9L+3WpyHAp3DG6IvQ==
X-Received: by 2002:a05:6a00:1345:: with SMTP id
 k5mr10540800pfu.37.1643412539375; 
 Fri, 28 Jan 2022 15:28:59 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id k5sm11134652pfc.85.2022.01.28.15.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:58 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 29 Jan 2022 08:28:42 +0900
Message-Id: <20220128232842.3329969-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] or1k: Define PI_STATIC_AND_HIDDEN
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UElfU1RBVElDX0FORF9ISURERU4gbWVhbnMgdGhhdCByZWZlcmVuY2VzIHRvIHN0YXRpYyBmdW5j
dGlvbnMsIGRhdGEKYW5kIHN5bWJvbHMgd2l0aCBoaWRkZW4gdmlzaWJpbGl0eSBkbyBub3QgbmVl
ZCBhbnkgcnVuLXRpbWUgcmVsb2NhdGlvbnMKYWZ0ZXIgdGhlIGZpbmFsIGxpbmssIHdpdGggdGhl
IGJ1aWxkIGZsYWdzIHVzZWQgYnkgZ2xpYmMuCgpPcGVuUklTQyBmb2xsb3dzIHRoaXMgc28gZW5h
YmxlZCBQSV9TVEFUSUNfQU5EX0hJRERFTiBieSBhZGRpbmcKY29uZmlndXJlLmFjIGFuZCBnZW5l
cmF0aW5nIGNvbmZpZ3VyZS4KClN1Z2dlc3RlZC1ieTogRmxvcmlhbiBXZWltZXIgPGZ3ZWltZXJA
cmVkaGF0LmNvbT4KLS0tClRoaXMgd2FzIGRpc2N1c3NlZCBvbiB0aGUgbWFpbGluZyBsaXN0Ogog
IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2xpYmMtYWxwaGEvMjAyMi1KYW51YXJ5
LzEzNTYyMC5odG1sCgpJIHRob3VnaHQgdG8gZ2V0IHRoaXMgb3V0IGFzIEkgc3RhcnQgdG8gdGVz
dCAyLjM1IHdlIHdhbnQgdGhpcyBjaGFuZ2UgaW4uCgogc3lzZGVwcy9vcjFrL2NvbmZpZ3VyZSAg
ICB8IDUgKysrKysKIHN5c2RlcHMvb3Ixay9jb25maWd1cmUuYWMgfCA0ICsrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFr
L2NvbmZpZ3VyZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ixay9jb25maWd1cmUuYWMK
CmRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvY29uZmlndXJlIGIvc3lzZGVwcy9vcjFrL2NvbmZp
Z3VyZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kNzNkYjRkZGJlCi0t
LSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFrL2NvbmZpZ3VyZQpAQCAtMCwwICsxLDUgQEAK
KyMgVGhpcyBmaWxlIGlzIGdlbmVyYXRlZCBmcm9tIGNvbmZpZ3VyZS5hYyBieSBBdXRvY29uZi4g
IERPIE5PVCBFRElUIQorICMgTG9jYWwgY29uZmlndXJlIGZyYWdtZW50IGZvciBzeXNkZXBzL29y
MWsvZWxmLgorCiskYXNfZWNobyAiI2RlZmluZSBQSV9TVEFUSUNfQU5EX0hJRERFTiAxIiA+PmNv
bmZkZWZzLmgKKwpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL2NvbmZpZ3VyZS5hYyBiL3N5c2Rl
cHMvb3Ixay9jb25maWd1cmUuYWMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uZGI2YTYwODdlMQotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9jb25maWd1cmUu
YWMKQEAgLTAsMCArMSw0IEBACitHTElCQ19QUk9WSURFUyBkbmwgU2VlIGFjbG9jYWwubTQgaW4g
dGhlIHRvcCBsZXZlbCBzb3VyY2UgZGlyZWN0b3J5LgorIyBMb2NhbCBjb25maWd1cmUgZnJhZ21l
bnQgZm9yIHN5c2RlcHMvb3Ixay9lbGYuCisKK0FDX0RFRklORShQSV9TVEFUSUNfQU5EX0hJRERF
TikKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
