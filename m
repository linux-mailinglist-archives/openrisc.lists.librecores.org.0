Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A37E9501DF1
	for <lists+openrisc@lfdr.de>; Fri, 15 Apr 2022 00:05:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 475782480E;
	Fri, 15 Apr 2022 00:05:22 +0200 (CEST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mail.librecores.org (Postfix) with ESMTPS id D078B24851
 for <openrisc@lists.librecores.org>; Fri, 15 Apr 2022 00:05:19 +0200 (CEST)
Received: by mail-pj1-f49.google.com with SMTP id bg24so6311967pjb.1
 for <openrisc@lists.librecores.org>; Thu, 14 Apr 2022 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=CnWghtB/dN2XPpzq+zptNtM2MAL+NMPVHYsMQgwsTW7iLpCdsO92al51pP1s30INYy
 rwF44VxtoSsNlb8TLR6+PvivGyCZ5apI54By81gsXp8b4zJytpT14My0wRS1/XqlEqjn
 9c60+wgJ448Ym18jElwrZxwugKHQ2CLL8h38oEC7pO1P/00c1v34g1qQ6JgcV2POF6XJ
 qT35OQ8QyKY5rNXOS1abuXba/eh8yrBZrITli2mG/rjIegR5xxQLu6j+6zg8d/wJOC96
 t/JZMK7hUZ/uW4d5apxoZB276EgBxBgsh8TDMlVDZJzUdBERoLCAWxBKRYX15Cr0EDe1
 B80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=1SF8+dtNTWe4FiaxGqMfsWYUCnxztcjvnwVmSBQapg1jtQsDdKGcQFFpWrBv2MK54O
 HcStZpeOmGnJkeb6A43ptIlizGNlc26Z7Wi82pF4YjwLwtBrEd8Q4yDjNtuLcc41v+n8
 x7Uf8foDDyCYGaB7p8F8+1zGA0Qo7HPUkayx2o8QXYNkryyGPIkeLGnbz4VzNEFyobpT
 Wil9ag7slaiLCwrtXm9OuxQeDhfRq88wzLh8gfnIPdjQNYBzdUMSz37e12i3JH7oLaem
 tplOH64yzrQBwy/E3pDREfm7VF3uo8QQ1T0zRatjlI9fWbz+9zNjL1KSmQVOe3Bafa1p
 CVgg==
X-Gm-Message-State: AOAM533ChwRoN7Q5HAeVk931SxXBtBKftW8KAP5+0pUsT2wZwMs6itmd
 WI4clx8QmNhHRzBiOBnT0KXv0A==
X-Google-Smtp-Source: ABdhPJyLfdcVDkvOFuUrfAfCBiI+o5Yu4ll2mvpNoDdi2mqGNotIaUVXICITBKPJFNtsKr9Rm/qRqw==
X-Received: by 2002:a17:902:eb82:b0:158:8feb:86d6 with SMTP id
 q2-20020a170902eb8200b001588feb86d6mr13587063plg.26.1649973918225; 
 Thu, 14 Apr 2022 15:05:18 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm2715141pjj.20.2022.04.14.15.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:17 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:02:10 -0700
Message-Id: <20220414220214.24556-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
Subject: [OpenRISC] [PATCH v3 3/7] asm-generic: qrwlock: Document the
 spinlock fairness requirements
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
Cc: wangkefeng.wang@huawei.com, peterz@infradead.org,
 Palmer Dabbelt <palmer@rivosinc.com>, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 jonas@southpole.se, linux-csky@vger.kernel.org, mingo@redhat.com,
 longman@redhat.com, linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpJIGNvdWxkIG9ubHkg
ZmluZCB0aGUgZmFpcm5lc3MgcmVxdWlyZW1lbnRzIGRvY3VtZW50ZWQgYXMgdGhlIEMgY29kZSwK
dGhpcyBjYWxscyB0aGVtIG91dCBpbiBhIGNvbW1lbnQganVzdCB0byBiZSBhIGJpdCBtb3JlIGV4
cGxpY2l0LgoKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5j
b20+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9xcndsb2NrLmggfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmlj
L3Fyd2xvY2suaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvcXJ3bG9jay5oCmluZGV4IDdhZTBlY2Uw
N2I0ZS4uMjRhZTA5YzFkYjlmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Fyd2xv
Y2suaAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Fyd2xvY2suaApAQCAtMiw2ICsyLDEwIEBA
CiAvKgogICogUXVldWUgcmVhZC93cml0ZSBsb2NrCiAgKgorICogVGhlc2UgdXNlIGdlbmVyaWMg
YXRvbWljIGFuZCBsb2NraW5nIHJvdXRpbmVzLCBidXQgZGVwZW5kIG9uIGEgZmFpciBzcGlubG9j
aworICogaW1wbGVtZW50YXRpb24gaW4gb3JkZXIgdG8gYmUgZmFpciB0aGVtc2VsdmVzLiAgVGhl
IGltcGxlbWVudGF0aW9uIGluCisgKiBhc20tZ2VuZXJpYy9zcGlubG9jay5oIG1lZXRzIHRoZXNl
IHJlcXVpcmVtZW50cy4KKyAqCiAgKiAoQykgQ29weXJpZ2h0IDIwMTMtMjAxNCBIZXdsZXR0LVBh
Y2thcmQgRGV2ZWxvcG1lbnQgQ29tcGFueSwgTC5QLgogICoKICAqIEF1dGhvcnM6IFdhaW1hbiBM
b25nIDx3YWltYW4ubG9uZ0BocC5jb20+Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
