Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFC148A5FC
	for <lists+openrisc@lfdr.de>; Tue, 11 Jan 2022 04:01:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DD60224785;
	Tue, 11 Jan 2022 04:01:33 +0100 (CET)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id 967CC24777
 for <openrisc@lists.librecores.org>; Tue, 11 Jan 2022 04:01:32 +0100 (CET)
Received: by mail-pj1-f50.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso2369098pjm.4
 for <openrisc@lists.librecores.org>; Mon, 10 Jan 2022 19:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOBQRy/88gLq1oZJIE5ZrO/xHrvt7W0czi8f7RbBxVk=;
 b=lWvS7xbypXrkh1JtDO38Ck/LHec3D/7OgBk2Sc1UBgTGrsIhekup6X/VcbBeo4qYI6
 7T9iJ4gtMuYWZGx6WvCuCGmpYPIi33YiYgcL5j9qTsxRMBv0Wq48blEOguPeRMtO7gQx
 N3VsWqsaXRjTx+i5xSsw/WReuBAykoeLScv9sGygAh6zdm+Lu00/SY61zhJLjk1T/sTZ
 Fx4pdOkX4qeQTI+YyVsBBTnOd2PclCgLcafwkYl+8avQt8YL3UAM5JtY63IS/3JgX5HK
 ytjCrmlzkBS3iFQFYxMa88vN7s4KxK6ABke8zQaPxsl8IOpdQzU1tJXFd01Z26DPVTaa
 Ye4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOBQRy/88gLq1oZJIE5ZrO/xHrvt7W0czi8f7RbBxVk=;
 b=msP/fwAfd5JmyCadJG3d+EYRf1YlC02xeIq4WNfiZF5gQzR7nidTEgb03Yxncqm7wM
 goDCdsl2zyZ5jgVet2S5JXa97PNpKszdKUxCEIdfD6cm2PpMKDMKQsA8fzFGgN8RtkKM
 1w4tKpmkohh3ZcoDPXZJPMbueTcikGLbQANLhfRK5bHjS91jp6fwqwO5aURfyn+rNPOb
 cZTqyAShxEw3H6P4JKJZnZK9sImUbYjoABdHR13ZwZXUSsXzQpOvppq/glFxL7Ex96I7
 Zv87AeqqXnZaU6OqtDXV+wsDPDHYDeiFhS/tbHMpG1NNTxCRPovqcdC/kZSb3iS5HhP9
 UfJw==
X-Gm-Message-State: AOAM532B7QYXmuN6eB4Rtf2HGC5KUHPyawQGc7UUKiwzL3USR8UdY+ap
 L/rozfZKqpd7QWeODNrFY5I=
X-Google-Smtp-Source: ABdhPJwtMTflS/meiKWegPwN2yR+R7g7HsqX03ppmS205L91ZnCXf2Z+xcucTYPEua7QpAGcnsZ+sQ==
X-Received: by 2002:a17:902:d2c8:b0:14a:419c:7c46 with SMTP id
 n8-20020a170902d2c800b0014a419c7c46mr2582454plc.7.1641870091008; 
 Mon, 10 Jan 2022 19:01:31 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id y79sm418851pfb.116.2022.01.10.19.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 19:01:29 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue, 11 Jan 2022 12:00:54 +0900
Message-Id: <20220111030055.2043568-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: init: Add support for common clk
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
Cc: Jonas Bonn <jonas@southpole.se>, Randy Dunlap <rdunlap@infradead.org>,
 Gabriel Somlo <gsomlo@gmail.com>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

V2hlbiB0ZXN0aW5nIHRoZSBuZXcgbGl0ZXhfbW1jIGRyaXZlciBpdCB3YXMgZm91bmQgdG8gbm90
IHdvcmsgb24KT3BlblJJU0MgZHVlIHRvIG1pc3Npbmcgc3VwcG9ydCBmb3IgY29tbW9uIGNsay4g
IFRoaXMgcGF0Y2ggZG9lcyB0aGUKYmFzaWMgaW5pdGlhbGl6YXRpb24gdG8gYWxsb3cgT3BlblJJ
U0MgdG8gdXNlIHRoZSBjb21tb24gY2xrIGZyYW1ld29yay4KClNpZ25lZC1vZmYtYnk6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAg
ICAgICB8IDEgKwogYXJjaC9vcGVucmlzYy9rZXJuZWwvdGltZS5jIHwgNCArKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvS2Nv
bmZpZyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwppbmRleCBjMjQ5MWIyOTVkNjAuLmY3MjRiM2Yx
YWVlZCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9LY29uZmlnCisrKyBiL2FyY2gvb3BlbnJp
c2MvS2NvbmZpZwpAQCAtMTAsNiArMTAsNyBAQCBjb25maWcgT1BFTlJJU0MKIAlzZWxlY3QgQVJD
SF9IQVNfRE1BX1NFVF9VTkNBQ0hFRAogCXNlbGVjdCBBUkNIX0hBU19ETUFfQ0xFQVJfVU5DQUNI
RUQKIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0RFVklDRQorCXNlbGVjdCBDT01NT05f
Q0xLCiAJc2VsZWN0IE9GCiAJc2VsZWN0IE9GX0VBUkxZX0ZMQVRUUkVFCiAJc2VsZWN0IElSUV9E
T01BSU4KZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RpbWUuYyBiL2FyY2gvb3Bl
bnJpc2Mva2VybmVsL3RpbWUuYwppbmRleCBhNmU2OTM4NmY4MmEuLjZkMTg5ODlkNjNkMCAxMDA2
NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvdGltZS5jCisrKyBiL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3RpbWUuYwpAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsb2NrY2hp
cHMuaD4KICNpbmNsdWRlIDxsaW51eC9pcnEuaD4KICNpbmNsdWRlIDxsaW51eC9pby5oPgorI2lu
Y2x1ZGUgPGxpbnV4L29mX2Nsay5oPgogCiAjaW5jbHVkZSA8YXNtL2NwdWluZm8uaD4KIApAQCAt
MTY5LDQgKzE3MCw3IEBAIHZvaWQgX19pbml0IHRpbWVfaW5pdCh2b2lkKQogCiAJb3BlbnJpc2Nf
dGltZXJfaW5pdCgpOwogCW9wZW5yaXNjX2Nsb2NrZXZlbnRfaW5pdCgpOworCisJb2ZfY2xrX2lu
aXQoTlVMTCk7CisJdGltZXJfcHJvYmUoKTsKIH0KLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
