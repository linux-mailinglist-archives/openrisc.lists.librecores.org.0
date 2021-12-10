Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0F701470ECD
	for <lists+openrisc@lfdr.de>; Sat, 11 Dec 2021 00:35:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E405E242D8;
	Sat, 11 Dec 2021 00:35:46 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id C2207242D5
 for <openrisc@lists.librecores.org>; Sat, 11 Dec 2021 00:35:44 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so9017765pjb.1
 for <openrisc@lists.librecores.org>; Fri, 10 Dec 2021 15:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL8xvf4PJMnuX3zKvr9o0AmwR0tuURHkS4sS/bQB7jY=;
 b=pabW6jvIVEnm8M3fdSg4uPrpdlhG+su5th3iYuCUgmc/bkZdO8hmOM+Ghwkhz2sn/C
 lUcVCAvYDDlF4iLdfhZf0224GeFS+t1V3We5BYrwLscaonZ7U97kcgVjPykx6mFCLjs0
 tu0SbH2tAGir/KejO1wsLWdDYkxLtUZlE6LZZDbXDL/jxZ3YI2FaY+/nMDeE+lH0AOgQ
 ppU/UMT6TeOXzD91ZZEtc/96MiyFRKb5ASkHg3Mn2R15AX1S7F6RJxwfb/m1hlxAWrKs
 VsUqGR8X8RrtjcM4vW65g6TKuCM35WWqx0XQ53Lk8HPFMr+JXBWRu5YOpf1xDH93pMV/
 n/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL8xvf4PJMnuX3zKvr9o0AmwR0tuURHkS4sS/bQB7jY=;
 b=0KAhbRK2kZA7O0g0Q0SnQbTf7a490jG4kYh3CCdVocw4dtTSObqcr66LsinH9zqhvM
 gC+oCXDbcW1uYF38/O6H0nuBgFvSHGLJ7sqlddN4JVOzWPc8BnP8BHtlonkNKMgTWXmn
 qadStDCDD3tizDbL4XfTUkokuUzO4/oJkUu/6meB5MsEBxUjgEhs8ltFPqSKPfo6OVhL
 BasVzD+3VcNfanpE3BD+OpP0Pn8ARd6ovcOdblYa/Z5r/JlNaWlzeYlGmL7xKiM/g/gp
 ZBSawd9tLe+dKxzrc+oHlU4QWviOxypse7GET6Sv643XNDQncfGbjc5kkhc2sQyaF86l
 tZ2w==
X-Gm-Message-State: AOAM532lINgzcMpHa2XIAIyWsrHFWAltn2mY0DaTHpLSkzj6J/otXYdA
 l5jNfKVuochNXL9FS+v7ZFry7iGpypE=
X-Google-Smtp-Source: ABdhPJx9RFMvH1DhxQU/w49ZvzAbG+iuigJOeuVgToTbV/qKZLgFNjn/zO1v+4q3/TUVaNmeE7bHDA==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr27153540pjb.192.1639179343397; 
 Fri, 10 Dec 2021 15:35:43 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id a6sm86114pjd.40.2021.12.10.15.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 15:35:42 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 11 Dec 2021 08:34:56 +0900
Message-Id: <20211210233456.4146479-14-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210233456.4146479-1-shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 13/13] Documentation for OpenRISC port
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

T3BlblJJU0MgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb246CgogaHR0cHM6Ly9yYXcuZ2l0aHVi
dXNlcmNvbnRlbnQuY29tL29wZW5yaXNjL2RvYy9tYXN0ZXIvb3BlbnJpc2MtYXJjaC0xLjMtcmV2
MS5wZGYKCkN1cnJlbnRseSB0aGUgcG9ydCBhcyBvZiB0aGUgMjAyMS0xMi0wNyByZWJhc2luZyBo
YXMgdGhlIGZvbGxvd2luZyB0ZXN0CmZhaWx1cmVzOgoKIEZBSUw6IHRpbWV6b25lL3RzdC10enNl
dCAgICAgIyBOb3QgZW5vdWdoIHNwYWNlIHRvIGNyZWF0ZSA0R2lCIGZpbGUKIEZBSUw6IGVsZi90
c3QtYnoxNTMxMSAgICAgICAgIyBkeW5hbWljIGxkIHNvcnQgb3JkZXIgZGlmZgoKV3JpdGluZyBj
cmVkaXRzIGZvciB0aGUgcG9ydCBhcmU6CgogU3RhZmZvcmQgSG9ybmUgIDxzaG9ybmVAZ21haWwu
Y29tPgogQ2hyaXN0aWFuIFN2ZW5zc29uICA8Ymx1ZUBjbWQubnU+Ci0tLQogTkVXUyAgIHwgNCAr
KysrCiBSRUFETUUgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvTkVXUyBiL05FV1MKaW5kZXggMTM5OGNmMmU4Ny4uZjg5Njc0NjU3NCAxMDA2NDQK
LS0tIGEvTkVXUworKysgYi9ORVdTCkBAIC00ODUsNiArNDg1LDEwIEBAIE1ham9yIG5ldyBmZWF0
dXJlczoKICAgVGhlIGxhdGVzdCBHQ0MgYXZhaWxhYmxlIGF0IHRoaXMgdGltZSAoMTAuMikgZG9l
cyBub3Qgc3VwcG9ydCB0aGlzIGxldmVsIG9mCiAgIGZvcnRpZmljYXRpb24uCiAKKyogU3VwcG9y
dCBmb3IgT3BlblJJU0Mgb24gTGludXggaGFzIGJlZW4gYWRkZWQuCisKKyAgVGhlIE9wZW5SSVND
IHBvcmUgcmVxdWlyZXMgYXQgbGVhc3QgTGludXggNS40LCBHQ0MgMTEgYW5kIGJpbnV0aWxzIDIu
MzUuCisKIERlcHJlY2F0ZWQgYW5kIHJlbW92ZWQgZmVhdHVyZXMsIGFuZCBvdGhlciBjaGFuZ2Vz
IGFmZmVjdGluZyBjb21wYXRpYmlsaXR5OgogCiAqIFRoZSBtYWxsaW5mbyBmdW5jdGlvbiBpcyBt
YXJrZWQgZGVwcmVjYXRlZC4gIENhbGxlcnMgc2hvdWxkIGNhbGwKZGlmZiAtLWdpdCBhL1JFQURN
RSBiL1JFQURNRQppbmRleCBkMGYwZWRiMzkzLi4zZDVhNzhjY2ZmIDEwMDY0NAotLS0gYS9SRUFE
TUUKKysrIGIvUkVBRE1FCkBAIC0zNSw2ICszNSw3IEBAIFRoZSBHTlUgQyBMaWJyYXJ5IHN1cHBv
cnRzIHRoZXNlIGNvbmZpZ3VyYXRpb25zIGZvciB1c2luZyBMaW51eCBrZXJuZWxzOgogCW1pY3Jv
YmxhemUqLSotbGludXgtZ251CiAJbWlwcy0qLWxpbnV4LWdudQogCW1pcHM2NC0qLWxpbnV4LWdu
dQorCW9yMWstKi1saW51eC1nbnUKIAlwb3dlcnBjLSotbGludXgtZ251CUhhcmR3YXJlIG9yIHNv
ZnR3YXJlIGZsb2F0aW5nIHBvaW50LCBCRSBvbmx5LgogCXBvd2VycGM2NCotKi1saW51eC1nbnUJ
QmlnLWVuZGlhbiBhbmQgbGl0dGxlLWVuZGlhbi4KIAlzMzkwLSotbGludXgtZ251Ci0tIAoyLjMx
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
