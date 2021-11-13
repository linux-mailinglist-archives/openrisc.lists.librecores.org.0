Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA8144F0F2
	for <lists+openrisc@lfdr.de>; Sat, 13 Nov 2021 04:16:50 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2FB0E24276;
	Sat, 13 Nov 2021 04:16:50 +0100 (CET)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mail.librecores.org (Postfix) with ESMTPS id 9053124040
 for <openrisc@lists.librecores.org>; Sat, 13 Nov 2021 04:16:48 +0100 (CET)
Received: by mail-pj1-f46.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so7930729pjb.5
 for <openrisc@lists.librecores.org>; Fri, 12 Nov 2021 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7y+3y+PLSo4tTmym9D41kGjuebb2KIezuKwi/la110=;
 b=CDktl1ZifUhkc0r7T1OIQhdlpsC58BUzO7OEwP8jBuWzuYVKIV3O1zSO5j/vGsmo8v
 VLaa/asuC/xxjb+AJd+Yq4jkNSOX0VPnywuj79xnnBMTkM43xj1WFiRsSry2hjwKEwKM
 ocCxgYtbGWJYENV0UXIgLpnaB4O+58SuSJCbpZxf3BXxjRQFTzmku8D6WchwNUl2KU8R
 g4uvhOxOa6qoOVRiLEQVNaiMe4wXgqdWu8PnW4cyoKae3kZdmjLw8IAwfUlxLWBp3qk0
 obHRpiLQ1QFPEQlzrqG6cFzgHBjzI3vq1jufOH3nHko94EJ6+UAwSU3McfmknS39yQSV
 BJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7y+3y+PLSo4tTmym9D41kGjuebb2KIezuKwi/la110=;
 b=Y06qh3knhv5s+AMGPE0GUzaVJPIUl9KB5xC7DfpSBYmE1ewtKTPbChu651/bHq1S4P
 dHh7vwLyXwX7vF3dk1fHEHjLWMAvobQ9jhsdMKqEEdp7BazYIYwipkrldmp3w35aQLHE
 lPSmcEtlxG2p36Kg6BpnQP10COo7DRlyeC0a4Mg3194uVZ86KNpoKu5PFHl9utkbcPhL
 F9+TSxNTfAIQR8Z/q3w8UTaxe1cfcJTa6AfSSV/M1bAxFib4uMv6dbWPEGpJlKtBvRES
 DSey65hcJTfCVC7ilAaYEtXAEyFd9kFZiDDcqMf1Y8mAR0sGCcgbHgjpqPJnAL4P2KtU
 yRuQ==
X-Gm-Message-State: AOAM530mO8Q6cJmRoCtv9ZkuHFyDBvyTh9pn36sJUg+KMfr7eWNxP3go
 zhIqrIt0wzW0mQDacuIYtxg=
X-Google-Smtp-Source: ABdhPJx0kMRMo5M9uW9p8TMnEOhbZcLEitTq4sxDRIC+zFp9uVuMNH1/c3FqBMQ3vraHkczOpoICNg==
X-Received: by 2002:a17:90b:4b90:: with SMTP id
 lr16mr42332602pjb.57.1636773407243; 
 Fri, 12 Nov 2021 19:16:47 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id gc22sm11874003pjb.57.2021.11.12.19.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 19:16:46 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 13 Nov 2021 12:16:27 +0900
Message-Id: <20211113031639.2402161-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113031639.2402161-1-shorne@gmail.com>
References: <20211113031639.2402161-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 01/13] elf: Add reloc for OpenRISC
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

LS0tCiBlbGYvZWxmLmggfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2VsZi9lbGYu
aCBiL2VsZi9lbGYuaAppbmRleCA1MGY4N2JhY2ViLi40Y2JhY2Q0Nzk0IDEwMDY0NAotLS0gYS9l
bGYvZWxmLmgKKysrIGIvZWxmL2VsZi5oCkBAIC00MTE5LDQgKzQxMTksNDEgQEAgZW51bQogI2Rl
ZmluZSBSX0FSQ19UTFNfTEVfUzkJCTB4NGEKICNkZWZpbmUgUl9BUkNfVExTX0xFXzMyCQkweDRi
CiAKKy8qIE9wZW5SSVNDIDEwMDAgc3BlY2lmaWMgcmVsb2NzLiAgKi8KKyNkZWZpbmUgUl9PUjFL
X05PTkUJCTAKKyNkZWZpbmUgUl9PUjFLXzMyCQkxCisjZGVmaW5lIFJfT1IxS18xNgkJMgorI2Rl
ZmluZSBSX09SMUtfOAkJMworI2RlZmluZSBSX09SMUtfTE9fMTZfSU5fSU5TTgk0CisjZGVmaW5l
IFJfT1IxS19ISV8xNl9JTl9JTlNOCTUKKyNkZWZpbmUgUl9PUjFLX0lOU05fUkVMXzI2CTYKKyNk
ZWZpbmUgUl9PUjFLX0dOVV9WVEVOVFJZCTcKKyNkZWZpbmUgUl9PUjFLX0dOVV9WVElOSEVSSVQJ
OAorI2RlZmluZSBSX09SMUtfMzJfUENSRUwJCTkKKyNkZWZpbmUgUl9PUjFLXzE2X1BDUkVMCQkx
MAorI2RlZmluZSBSX09SMUtfOF9QQ1JFTAkJMTEKKyNkZWZpbmUgUl9PUjFLX0dPVFBDX0hJMTYJ
MTIKKyNkZWZpbmUgUl9PUjFLX0dPVFBDX0xPMTYJMTMKKyNkZWZpbmUgUl9PUjFLX0dPVDE2CQkx
NAorI2RlZmluZSBSX09SMUtfUExUMjYJCTE1CisjZGVmaW5lIFJfT1IxS19HT1RPRkZfSEkxNgkx
NgorI2RlZmluZSBSX09SMUtfR09UT0ZGX0xPMTYJMTcKKyNkZWZpbmUgUl9PUjFLX0NPUFkJCTE4
CisjZGVmaW5lIFJfT1IxS19HTE9CX0RBVAkJMTkKKyNkZWZpbmUgUl9PUjFLX0pNUF9TTE9UCQky
MAorI2RlZmluZSBSX09SMUtfUkVMQVRJVkUJCTIxCisjZGVmaW5lIFJfT1IxS19UTFNfR0RfSEkx
NgkyMgorI2RlZmluZSBSX09SMUtfVExTX0dEX0xPMTYJMjMKKyNkZWZpbmUgUl9PUjFLX1RMU19M
RE1fSEkxNgkyNAorI2RlZmluZSBSX09SMUtfVExTX0xETV9MTzE2CTI1CisjZGVmaW5lIFJfT1Ix
S19UTFNfTERPX0hJMTYJMjYKKyNkZWZpbmUgUl9PUjFLX1RMU19MRE9fTE8xNgkyNworI2RlZmlu
ZSBSX09SMUtfVExTX0lFX0hJMTYJMjgKKyNkZWZpbmUgUl9PUjFLX1RMU19JRV9MTzE2CTI5Cisj
ZGVmaW5lIFJfT1IxS19UTFNfTEVfSEkxNgkzMAorI2RlZmluZSBSX09SMUtfVExTX0xFX0xPMTYJ
MzEKKyNkZWZpbmUgUl9PUjFLX1RMU19UUE9GRgkzMgorI2RlZmluZSBSX09SMUtfVExTX0RUUE9G
RgkzMworI2RlZmluZSBSX09SMUtfVExTX0RUUE1PRAkzNAorCiAjZW5kaWYJLyogZWxmLmggKi8K
LS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
