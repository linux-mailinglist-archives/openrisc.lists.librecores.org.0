Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2B926394B1F
	for <lists+openrisc@lfdr.de>; Sat, 29 May 2021 10:44:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B817C23CBB;
	Sat, 29 May 2021 10:44:36 +0200 (CEST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mail.librecores.org (Postfix) with ESMTPS id 5B0A120417
 for <openrisc@lists.librecores.org>; Sat, 29 May 2021 10:44:34 +0200 (CEST)
Received: by mail-ej1-f49.google.com with SMTP id qq22so541762ejb.9
 for <openrisc@lists.librecores.org>; Sat, 29 May 2021 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dqhR9TT3agcHDn/yrPpammOIgh5GTTwrC68Eqh/qcaI=;
 b=TNmE9+lbpr8MnD0ple7U3Dazj6SgOfx7NjnsE1fQMsHKm3fK2mB/dAylJNnsm5Bbm4
 o94Mk3zJnl5zTuBA49zw/DjZQ2vI1IR4wLdX0mPLJD0hkTDQXaqfmZxXyUCGVJl64Ldp
 bOI4mt7u3h1sdJ7t9VdIdajPe6mgMwyOF4Y34Xz6u60EXPAQ+QR4nAQ2yYUdye4o4h1f
 ayKMlhmB+zogAn1jF+sfE2+GF/1QhdAtrYgJA/xwhiYXKE34gVYo6BP268UiI8HEVK1J
 Dkj0vjZ6eCG7ObhCt2LPuk7bSvfOF0PFddEPoBmecmJnTLwOxO4DnGmCDdwDv49oLuyf
 1Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dqhR9TT3agcHDn/yrPpammOIgh5GTTwrC68Eqh/qcaI=;
 b=F03Gr4Rc0ErHa6qg4w5OadiEmqHhsKfBMzTu1OlcVZB2OOj9KMgPrmQwbwMQKlGi7A
 xrwDMY1QThP7b27id38D5mUADTHy/cxeRP19e5PEbOwSAI+O/o2Ftvm7XQcY4NkZMca2
 7kUiZsZpg9qn9gmtLOcMQkkswCNyFZO/bSx4YaHYNvhZbsaXErWHRTbOghf5ltzUh8+F
 9AL3GKDnwPMxbNuB18JPdmZScUXnCT+R4JyJoNBnZe3AvnZbKW0j3QpYMEKyuJh0yL+G
 wFyuBfzV07doqHPhUxYL3dliGCjuSc3/Oa5fPjZF8rPyeA8SAoJeJAr1FrRdOYcNdHrU
 UG/Q==
X-Gm-Message-State: AOAM533oXP3A5rMToj3c2P3u6LRJlu2WOhSYHdDBHoHfvmSHIHLtAw4e
 yZQwgRCkKio1tRN4oMF1ELdpJGQkYVbmd+yV+ezPAnL0waw=
X-Google-Smtp-Source: ABdhPJz9ilm6+/6xuF66e85ItdE2d3j34g+LZHikoOgrOyv4Uh/9sw+IOo9qYYEc8KzkRB4NMk4QkLbIZg/d9lCbdFA=
X-Received: by 2002:a17:907:927:: with SMTP id
 au7mr13298368ejc.267.1622277873826; 
 Sat, 29 May 2021 01:44:33 -0700 (PDT)
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
Date: Sat, 29 May 2021 17:44:22 +0900
Message-ID: <CAAfxs756Fyh-zU+6Sy5+DK9MoYqAAHRrd3xnR6Yq-iqx7SNSnw@mail.gmail.com>
To: Openrisc <openrisc@lists.librecores.org>
Subject: [OpenRISC] Welcome Harshita to Gsoc 2021
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
Cc: Harshitha S <harshithasridhar172000@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQWxsLAoKWW91IG1heSBoYXZlIHNlZW4gc29tZSBtYWlscyBwb3N0ZWQgZnJvbSBIYXJzaGl0
YSBhbHJlYWR5LgoKUGxlYXNlIGhlbHAgdG8gd2VsY29tZSBIYXJzaGl0YSB3aG8gd2lsbCBiZSBj
b250cmlidXRpbmcgdG8gT3BlblJJU0MKdW5kZXIgRm9zc2kgZm91bmRhdGlvbiBmb3IgR1NvQyAy
MDIxLgoKSGFyc2hpdGEgd2lsbCBiZSB3b3JraW5nIHRvIGZvcm1hbGx5IHZlcmlmeSB0aGUgbW9y
MWt4IHVzaW5nIHlvc3lzCmZvcm1hbCB2ZXJpZmljYXRpb24gdG9vbHMuCgpOZXdzOiBodHRwczov
L29wZW5yaXNjLmlvL2dzb2MvMjAyMS8wNS8yOC9nc29jCk9uIFR3aXR0ZXI6IGh0dHBzOi8vdHdp
dHRlci5jb20vSGFyc2hpdDQ5Njc4ODIyCkJsb2c6IGh0dHBzOi8vaGFyc2hpdGhhMTcyMDAwLmdp
dGh1Yi5pby8KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
