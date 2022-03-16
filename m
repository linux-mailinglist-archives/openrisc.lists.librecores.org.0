Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6488F4DBBCF
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 01:34:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E21AA20D4A;
	Thu, 17 Mar 2022 01:34:50 +0100 (CET)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mail.librecores.org (Postfix) with ESMTPS id D5888248A2
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 00:28:25 +0100 (CET)
Received: by mail-pl1-f175.google.com with SMTP id p17so3039152plo.9
 for <openrisc@lists.librecores.org>; Wed, 16 Mar 2022 16:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=G2OlpynL+svPG/qBCVApCbgh8fee1f/XrsL4DL/Bf0Q=;
 b=OtaZ9yqhWB4tye3HNb/4HSG53Ngt9PyiVKbt4tKiDRePwVvwEya9svqm2s5w3VOs8/
 yc5YXBiYJ5lI37j7IwRDhHc86YnavSlVsh0QAtvZb4djSLS4+IhqRPG1UroOa6lAYHr2
 MmdFeBcb5MqiiXN9c0cZAnTi3wMI/B1Z3iSzCUEZVZYrwPOrXxRi/ycPnKNM2hdrjT1d
 ie9NE6P8P/kdLZ/hzrBMaChScpMTxQMof4mqs0RbevtIK7WFu960AcDmPUpRF2qSwADe
 J1d0UjMM8OCE0iWgumuCsMKONO032+3frQbABHiQ0inzP7hO/d2ZcCst7FmOhhFQK3zm
 GXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=G2OlpynL+svPG/qBCVApCbgh8fee1f/XrsL4DL/Bf0Q=;
 b=S134sW8keDnFCQR/G031YFFd/3K4iHW1On9jQOclF1evx8pBKRTkaogsn+n2f3ocit
 GXIjlWlCin2GeW41JiUKAmSaUUoFJZ1qQtZ/iP1HNIae/ODIOur8ZHjEzXNTpHgU6lQm
 otKHi2nSF8QaijIWHmA5FEPcSz4uFqWQiQjBcfpAmoup26FElwmeufTbtQWQ4PGwgi/N
 s4+dgw42h8/j/uIBBgzJwQE9uKjHMmf99iC490pASDkdXkG0X8eC1vK0449ITJWsdKms
 SCWMVRHMelnWLifYgrbnjB2+m5g6Dxb3VnLhGp6dbIDCKrRLgChQPInC16hZu9uIQzCj
 oFrg==
X-Gm-Message-State: AOAM533MhLsLez0tgqq7j0SihvChtvov31R+A3iA2IDeI/R1muv/hzv+
 5OIKFhCKPKM5KufTMnUvmaop2g==
X-Google-Smtp-Source: ABdhPJwvtB81UtChoOLXVE+LBbgrtmta/Nk4/MhmrLCtsDTPfNUpp+6kUErqrPWaxRw1IuW1/C269Q==
X-Received: by 2002:a17:90a:4306:b0:1b9:80b3:7a3d with SMTP id
 q6-20020a17090a430600b001b980b37a3dmr12666080pjg.66.1647473304308; 
 Wed, 16 Mar 2022 16:28:24 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 i187-20020a626dc4000000b004f6e0f346e7sm4189585pfc.39.2022.03.16.16.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:23 -0700 (PDT)
Date: Wed, 16 Mar 2022 16:25:55 -0700
Message-Id: <20220316232600.20419-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-Mailman-Approved-At: Thu, 17 Mar 2022 01:34:48 +0100
Subject: [OpenRISC] [PATCH 0/5] Generic Ticket Spinlocks
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UGV0ZXIgc2VudCBhbiBSRkMgb3V0IGFib3V0IGEgeWVhciBhZ28KPGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvWUhiQkJ1VkZObkk0a2pqM0BoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3Mu
bmV0Lz4sCmJ1dCBhZnRlciBhIHNwaXJpdGVkIGRpc2N1c3Npb24gaXQgbG9va3MgbGlrZSB3ZSBs
b3N0IHRyYWNrIG9mIHRoaW5ncy4KSUlSQyB0aGVyZSB3YXMgYnJvYWQgY29uc2Vuc3VzIG9uIHRo
aXMgYmVpbmcgdGhlIHdheSB0byBnbywgYnV0IHRoZXJlCndhcyBhIGxvdCBvZiBkaXNjdXNzaW9u
IHNvIEkgd2Fzbid0IHN1cmUuICBHaXZlbiB0aGF0IGl0J3MgYmVlbiBhIHllYXIsCkkgZmlndXJl
ZCBpdCdkIGJlIGJlc3QgdG8ganVzdCBzZW5kIHRoaXMgb3V0IGFnYWluIGZvcm1hdHRlZCBhIGJp
dCBtb3JlCmV4cGxpY2l0bHkgYXMgYSBwYXRjaC4KClRoaXMgaGFzIGhhZCBhbG1vc3Qgbm8gdGVz
dGluZyAoanVzdCBhIGJ1aWxkIHRlc3Qgb24gUklTQy1WIGRlZmNvbmZpZyksCmJ1dCBJIHdhbnRl
ZCB0byBzZW5kIGl0IG91dCBsYXJnZWx5IGFzLWlzIGJlY2F1c2UgSSBkaWRuJ3QgaGF2ZSBhIFNP
Qgpmcm9tIFBldGVyIG9uIHRoZSBjb2RlLiAgSSBoYWQgc2VudCBhcm91bmQgc29tZXRoaW5nIHNv
cnQgb2Ygc2ltaWxhciBpbgpzcGlyaXQsIGJ1dCB0aGlzIGxvb2tzIGNvbXBsZXRlbHkgcmUtd3Jp
dHRlbi4gIEp1c3QgdG8gcGxheSBpdCBzYWZlIEkKd2FudGVkIHRvIHNlbmQgb3V0IGFsbW9zdCBl
eGFjdGx5IGFzIGl0IHdhcyBwb3N0ZWQuICBJJ2QgcHJvYmFibHkgcmVuYW1lCnRoaXMgdHNwaW5s
b2NrIGFuZCB0c3BpbmxvY2tfdHlwZXMsIGFzIHRoZSBtaXMtbWF0Y2gga2luZCBvZiBtYWtlcyBt
eQpleWVzIGdvIGZ1bm55LCBidXQgSSBkb24ndCByZWFsbHkgY2FyZSB0aGF0IG11Y2guICBJJ2xs
IGFsc28gZ28gdGhyb3VnaAp0aGUgb3RoZXIgcG9ydHMgYW5kIHNlZSBpZiB0aGVyZSdzIGFueSBt
b3JlIGNhbmRpZGF0ZXMsIEkgc2VlbSB0bwpyZW1lbWJlciB0aGVyZSBoYXZpbmcgYmVlbiBtb3Jl
IHRoYW4ganVzdCBPcGVuUklTQyBidXQgaXQncyBiZWVuIGEKd2hpbGUuCgpJJ20gaW4gbm8gYmln
IHJ1c2ggZm9yIHRoaXMgYW5kIGdpdmVuIHRoZSBjb21wbGV4IEhXIGRlcGVuZGVuY2llcyBJCnRo
aW5rIGl0J3MgYmVzdCB0byB0YXJnZXQgaXQgZm9yIDUuMTksIHRoYXQnZCBnaXZlIHVzIGEgZnVs
bCBtZXJnZQp3aW5kb3cgZm9yIGZvbGtzIHRvIHRlc3QvYmVuY2htYXJrIGl0IG9uIHRoZWlyIHN5
c3RlbXMgdG8gbWFrZSBzdXJlIGl0J3MKT0suICBSSVNDLVYgaGFzIGEgZm9yd2FyZCBwcm9ncmVz
cyBndWFyYW50ZWUgc28gd2Ugc2hvdWxkIGJlIHNhZmUsIGJ1dAp0aGVzZSBjYW4gYWx3YXlzIHRy
aXAgdGhpbmdzIHVwLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
