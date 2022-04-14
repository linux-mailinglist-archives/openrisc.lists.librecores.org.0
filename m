Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 64703501DEE
	for <lists+openrisc@lfdr.de>; Fri, 15 Apr 2022 00:05:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C1A2B24860;
	Fri, 15 Apr 2022 00:05:17 +0200 (CEST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mail.librecores.org (Postfix) with ESMTPS id D21642481B
 for <openrisc@lists.librecores.org>; Fri, 15 Apr 2022 00:05:15 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id 125so5919292pgc.11
 for <openrisc@lists.librecores.org>; Thu, 14 Apr 2022 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=kj79e2RofkdZtpcV4cuOdSuq76rCoCCYoAotU+R/caE=;
 b=Mub7+Xk9wwSBUzXegquRSmLHR9ZMLVl+1ewzq5ugAx4HR1GhjoZLMMFmESOz5cYpd4
 IUiDTMhYid2V2PzT+m554J80jj/yd0Smc/vEc8jxPkbRHFPCLa6XsvbMaUwGDVx5GqRk
 Sd5V0dPiRN96hXapmj2tjFQuC0Qh4YXAbNDqG/xgOYl1dzeFH2v0VX3nBxxyFb+9Nern
 2NFcsL/GBKleI6+/AFI5moGEf64wKIr1pufuCE/CAFm5t1MNIgwqoSnpO8NCH6LeTttu
 n9q0DFM8C/BW8GyewTYnqBCX5uc2Bm0yPLTCVweVHMFgSjYiAOq98kz9s95A+ZT8PL5J
 SbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=kj79e2RofkdZtpcV4cuOdSuq76rCoCCYoAotU+R/caE=;
 b=mlfl9YOU6pIlhxQf6hhCryAe2zTofIXb7RK19G9XugD0AXxXZalX6S4NyLJ7IKLUM0
 3AK11EczJy8DdXLHEQCzGBPFHpO8pHEZKyMCksn2y7aN0WfbJzAoGJTNsZ2kAJARH3Z1
 mzVvBKNbzZ81Q9YRuE5Odbc2+a+cnTDYwQTZxwJD8cFeH7vJDPw87HB2MxtcGWzwmwcm
 KnWZpSZgVBgLxsYZLN/k7ektmlDdptLgVLnocm8hq9mhBNnx/P7+FT2LwtgAlpAo4YP1
 TZeXWdi0fnAUKLJaewVYzTWKxSaMx1fXXdr/WnLFTSenUCWJX53BIxcJwueMLEuFNlHV
 de+w==
X-Gm-Message-State: AOAM532hldP/17J52jR3Q3SEtRXZgjGHRtFCujlbxlhKH5e2y5zr6RMy
 c1Wt13Zm+/nk6tzWgZyB+ROl+g==
X-Google-Smtp-Source: ABdhPJwjtqU6AWYAwYXufYTV42SdwmS0JH8rrNmXsZg+uKyEV95T0qFTo4wyvCTdhcUWt5XoHP3CIg==
X-Received: by 2002:a63:780f:0:b0:386:5d6f:2153 with SMTP id
 t15-20020a63780f000000b003865d6f2153mr3792784pgc.555.1649973914297; 
 Thu, 14 Apr 2022 15:05:14 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm836244pfv.69.2022.04.14.15.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:13 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:02:07 -0700
Message-Id: <20220414220214.24556-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
Subject: [OpenRISC] [PATCH v3 0/7] Generic Ticket Spinlocks
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
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 sudipm.mukherjee@gmail.com, openrisc@lists.librecores.org, macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TG9va3MgbGlrZSBmZWVkYmFjayBoYXMgYmVlbiBsYXJnZWx5IHBvc2l0aXZlIG9uIHRoaXMgb25l
LiAgSSB0aGluayBJCmdvdCBldmVyeXRoaW5nIGZyb20gdGhlIHYxIGFuZCB2MiwgYnV0IGl0IHdh
cyBhIGJpdCBtaXhlZCB1cCBzbyBzb3JyeSBpZgpJIG1pc3NlZCBzb21ldGhpbmcuICBJJ20gZ2Vu
ZXJhbGx5IGJlaW5nIGNvbnNlcnZhdGl2ZSBvbiB0aGUgdGFncyBoZXJlLAphcyB0aGluZ3MgaGF2
ZSBkcmlmdGVkIGFyb3VuZCBhIGJpdC4gIFNwZWNpZmljYWxseSBJIGRyb3BwZWQgdGhlClRlc3Rl
ZC1ieXMsIGFzIHRoaXMgaXMgYWxsIGJhc2VkIG9uIDUuMTgtcmMxIG5vdyBhbmQgdGhlcmUncyBi
ZWVuIGEKdG91Y2ggb2YgZGlmZi4KCkkndmUgcHV0IHRoaXMgYXQgcGFsbWVyL3RzcGlubG9jay12
MywgaW4gY2FzZSB0aGF0IGhlbHBzIGFueW9uZS4gIFRoaXMKZ2VuZXJhbGx5IGxvb2tzIGdvb2Qg
dG8gbWUsIGJ1dCBJJ2xsIHdhaXQgZm9yIGZlZWRiYWNrIGJlZm9yZSBwdXR0aW5nIGl0CmFueXdo
ZXJlIGVsc2UuICBJJ2QgZGVmYXVsdCB0byBkb2luZyBhIHNoYXJlZCB0YWcgZm9yIHRoZSBhc20t
Z2VuZXJpYwpzdHVmZiBhbmQgdGhlbiBsZXQgb3RoZXIgYXJjaCBmb2xrcyBwdWxsIGluIHRoYXQg
KHdpdGggdGhlaXIgYXJjaApzdXBwb3J0KSwgYnV0IGlmIHlvdSB3YW50IG1lIHRvIHRha2UgaXQg
dmlhIG15IHRyZWUgdGhlbiBmZWVsIGZyZWUgdG8KanVzdCBzYXkgc28gZXhwbGljaXRseS4gIFdo
YXQncyBvbiB0aGF0IGJyYW5jaCByaWdodCBub3cgZGVmaW5hdGVseQpzaG91bGRuJ3QgYmUgdHJl
YXRlZCBhcyBzdGFibGUsIHRob3VnaCwgYXMgSSdsbCB3YWl0IGZvciBhdCBsZWFzdCBhbgpvZmZp
Y2lhbCBBY2svUmV2aWV3IGZyb20gdGhlIGFzbS1nZW5lcmljIGZvbGtzIChhbmQgb2YgY291cnNl
IHRoZXJlIG1heQpiZSBtb3JlIGZlZWRiYWNrKS4KClRoaXMgcGFzc2VzIG15IHN0YW5kYXJkIHRl
c3RzLCBib3RoIGFzIHRoZSB3aG9sZSB0aGluZyBhbmQgYXMganVzdCB0aGUKUklTQy1WIHNwaW5s
b2NrIGNoYW5nZS4gIFRoYXQncyBqdXN0IFFFTVUsIHRob3VnaCwgc28gaXQncyBub3QgYWxsIHRo
YXQKZXhjaXRpbmcuCgpDaGFuZ2VzIHNpbmNlIHYyIDwyMDIyMDMxOTAzNTQ1Ny4yMjE0OTc5LTEt
Z3VvcmVuQGtlcm5lbC5vcmc+OgoqIFBpY2tlZCB1cCBQZXRlcidzIFNPQnMsIHdoaWNoIHdlcmUg
cG9zdGVkIG9uIHRoZSB2MS4KKiBSZS1vcmRlcmVkIHRoZSBmaXJzdCB0d28gcGF0Y2hlcywgYXMg
dGhleQoqIFJlLXdvcmRlZCB0aGUgUklTQy1WIHFyd2xvY2sgcGF0Y2gsIGFzIGl0IHdhcyBhIGJp
dCBtdXNoeS4gIEkgYWxzbwogIGFkZGVkIGEgYmx1cmIgaW4gdGhlIHFyd2xvY2sncyB0b3AgY29t
bWVudCBhYm91dCB0aGlzIGRlcGVuZGVuY3kuCiogUGlja2VkIHVwIFN0YWZmb3JkJ3MgZml4IGZv
ciBiaWctZW5kaWFuIHN5c3RlbXMsIHdoaWNoIEkgaGF2ZSBub3QKICB0ZXN0ZWQgYXMgSSBkb24n
dCBoYXZlIG9uZSAoYXQgbGVhc3QgZWFzaWx5IGF2YWlsaWFibGUsIEkgdGhpbmsgdGhlIEJFCiAg
TUlQUyBzeXN0ZW1zIGFyZSBzdGlsbCBpbiB0aGF0IHBpbGUgaW4gbXkgZ2FyYWdlKS4KKiBDYWxs
IHRoZSBnZW5lcmljIHZlcnNpb24gPGFzbS1nZW5lbmljL3NwaW5sb2Nre190eXBlc30uaD4sIGFz
IHRoZXJlJ3MKICByZWFsbHkgbm8gdXRpbGl0eSB0byB0aGUgdmVyc2lvbiB0aGF0IG9ubHkgZXJy
b3JzIG91dC4KCkNoYW5nZXMgc2luY2UgdjEgPDIwMjIwMzE2MjMyNjAwLjIwNDE5LTEtcGFsbWVy
QHJpdm9zaW5jLmNvbT46CiogRm9sbG93IEFybmQgc3VnZ2VzdGlvbiB0byBtYWtlIHRoZSBwYXRj
aCBzZXJpZXMgbW9yZSBnZW5lcmljLgoqIEFkZCBjc2t5IGluIHRoZSBzZXJpZXMuCiogQ29tYmlu
ZSBSSVNDLVYncyB0d28gcGF0Y2hlcyBpbnRvIG9uZS4KKiBNb2RpZnkgb3BlbnJpc2MncyBwYXRj
aCB0byBzdWl0IHRoZSBuZXcgZ2VuZXJpYyB2ZXJzaW9uLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
