Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5D6348EA5A
	for <lists+openrisc@lfdr.de>; Fri, 14 Jan 2022 14:07:26 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ACD1B240F6;
	Fri, 14 Jan 2022 14:07:25 +0100 (CET)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mail.librecores.org (Postfix) with ESMTPS id 2326F23F8D
 for <openrisc@lists.librecores.org>; Fri, 14 Jan 2022 14:07:23 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id h1so13193410pls.11
 for <openrisc@lists.librecores.org>; Fri, 14 Jan 2022 05:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Z0NkaBOzgvDQnSJ4jvXCY6LqU2hqhhzJbfXjrrmCm7I=;
 b=Bs7JM1wXbxZXSJm1Za1YpzTj04UZSBvKBqwe2MMoc7NUszFU2lijGEA9CeAGY8jvVW
 d04UnJO7PFtef2HhvxtRsfLCunCjllWSLnr3uoBJ8DL8lHbK6rjNaDDUYi5nD/3CvAEG
 kXtVZRLAauLokmtsuNEBA3Q3TwjCPlZVztzVmD0/PhYiSCBy/2eS8FCnXsd4Po94zllL
 Uy4AVIhv9Hn9/YwNJS1CzQrTa1zwvu2muyTTR50+oAn6G3bjrloLQnVhJUh0SF1vZ/Mj
 Tyj0hHAA8m8t3yqX/Wq/sgO8WrDLoU3NvEFuO+Hp+Vxfo/chWLMDSrEWk7tKmsoc4kzO
 VLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Z0NkaBOzgvDQnSJ4jvXCY6LqU2hqhhzJbfXjrrmCm7I=;
 b=fPpUTDVKoPABRSbbETgJI7S5HgLCSvMIZagxG8PcFTgmALjhLpa45KksZVnwbRbbkz
 W788fGtQ47CVXtxLS+3O94HxiHmOc5RmGnuHi32Vt1E1evTT46D76CAYBpWV5eVk1em4
 k89UWP3q/gWIWO4h5HQK6Rns/v9i233kZL+0ma5ZGcUw9k4wRSnRAVVSqDUS9A7d1DgO
 V1q6FZ3uGfKxgcbOglx7u8vwwOi/YiyngZ8C/PE0DWOpR3GzizTgxGN7jXNkKUOh6w/l
 dGh6LGdRCob1C1WezMYvOIoqcBnO7bcM524KEHBmrsUf3kMv7EmGrKQLiPjpD86tE/50
 ou3Q==
X-Gm-Message-State: AOAM530RGq5cQVpb4y2VUn6IuzaBhrgVlzXnE5jaqDMlptg/zyQrZgl2
 5q53Lyq74qNsdARgJYjNJUA=
X-Google-Smtp-Source: ABdhPJxxlA3aDrBFKZJFxZgX5wfwIud8+NsPYnBGeVnW6zBJKbIAVc6Ra7EQLoh8lylW7+sppnDR6w==
X-Received: by 2002:a17:90b:3510:: with SMTP id
 ls16mr4112981pjb.50.1642165641375; 
 Fri, 14 Jan 2022 05:07:21 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id p64sm1591669pfg.41.2022.01.14.05.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 05:07:20 -0800 (PST)
Date: Fri, 14 Jan 2022 22:07:18 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YeF1hpMbYo5PMmkD@antec>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for 5.17
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGwKClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgZDU4MDcxYThhNzZkNzc5ZWVkYWIzODAzM2FlNGM4MjFjMzAyOTVhNToK
CiAgTGludXggNS4xNi1yYzMgKDIwMjEtMTEtMjggMTQ6MDk6MTkgLTA4MDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0aHViLmNvbS9vcGVucmlz
Yy9saW51eC5naXQgdGFncy9mb3ItbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byA3ZjQzNWU0MmZkNmI2NWZkODc1OTk2MzE1NmUxZWYwZmI3ZDIxM2Y4OgoKICBvcGVucmlzYzog
aW5pdDogQWRkIHN1cHBvcnQgZm9yIGNvbW1vbiBjbGsgKDIwMjItMDEtMTIgMDY6MTM6MjIgKzA5
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCk9wZW5SSVNDIHVwZGF0ZXMgZm9yIDUuMTcKCkEgZmV3IGZpeHVwcyBhbmQg
ZW5oYW5jZW1lbnRzIGZvciBPcGVuUklTQzoKIC0gRml4IHRvIGFkZCBwcm9wZXIgd3JhcHBlciBm
b3IgY2xvbmUzIHRvIHNhdmUgY2FsbGVlIHNhdmVkIHJlZ3MKIC0gQ2xlYW51cHMgZm9yIGNsb25l
LCBmb3JrIGFuZCBzd2l0Y2gKIC0gQWRkIHN1cHBvcnQgZm9yIGNvbW1vbiBjbGsgc28gT3BlblJJ
U0MgYW5kIHVzZSBtb3JlIGRyaXZlcnMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU3RhZmZvcmQgSG9ybmUgKDQpOgogICAg
ICBvcGVucmlzYzogQ2xlYW51cCBzd2l0Y2ggY29kZSBhbmQgY29tbWVudHMKICAgICAgb3BlbnJp
c2M6IFVzZSBkZWxheSBzbG90IGZvciBjbG9uZSBhbmQgZm9yayB3cmFwcGVycwogICAgICBvcGVu
cmlzYzogQWRkIGNsb25lMyBBQkkgd3JhcHBlcgogICAgICBvcGVucmlzYzogaW5pdDogQWRkIHN1
cHBvcnQgZm9yIGNvbW1vbiBjbGsKCiBhcmNoL29wZW5yaXNjL0tjb25maWcgICAgICAgICAgICAg
ICAgfCAgMSArCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3N5c2NhbGxzLmggfCAgMiArKwog
YXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUyAgICAgICAgIHwgMjcgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC90aW1lLmMgICAgICAgICAgfCAgNCAr
KysrCiA0IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
