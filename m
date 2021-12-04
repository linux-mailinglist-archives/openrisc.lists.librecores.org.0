Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 544844681EE
	for <lists+openrisc@lfdr.de>; Sat,  4 Dec 2021 03:19:11 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3F80724284;
	Sat,  4 Dec 2021 03:19:11 +0100 (CET)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id C4CD324257
 for <openrisc@lists.librecores.org>; Sat,  4 Dec 2021 03:19:09 +0100 (CET)
Received: by mail-pj1-f47.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso4019299pjb.0
 for <openrisc@lists.librecores.org>; Fri, 03 Dec 2021 18:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kp6JhYL+Z3ZfrtYFfZ5FODVyqreKCCwC0m5TFZk89LA=;
 b=F8qKo9szMxHOXTPS0meragjB5M2kuUMwFpJDkCy8U5TLqzkZGu+cEGaNoO3FMBlzpA
 1LmMpesyGXbwBJFY9pqhJwadvG8BN6gLxbfPcpA1NKGq41zBfXoPtOCdnBZO2IWTENGR
 8mnc+Fb47DDvvEqAbRFq092jziqEuv+WgxVNXCn3Kwed+lVLSbBIYfU2KEz48r/KOyIJ
 7irzQazIj6uddz+/y/z4WfQRCurp8KeadEu68FT02AD9AkjRuon19MEcLsKTKvpodP+j
 VPo+ZpXTaM4rFibL3x/G6f/NJM8/vQkFOClzaRa2CSf5ovQWikSstMRnV7TaviZZJ7yX
 ln1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kp6JhYL+Z3ZfrtYFfZ5FODVyqreKCCwC0m5TFZk89LA=;
 b=jNRHqdit6a1rTf/+aL0+aOg2cRb84Qjrf7F640BVg9/DtNwdzXnyITXu8G30KdOUI1
 bFW/bt8Pxv8PYJO8pTCQ+h/4Z1oF4OoOfy9q2wlPC/3XQKXPQA9j2wh+dyY8/y2TAyCx
 iF1lYGTWMV+eEjWDfE326gI8ZgmhTcNiC1hsFz3YDZhRf0/peiX+3xwlAAlIgG+Axbv4
 huWQTWSVRjDIUE34wWIXQzaQtEe1LNdZRTDu9YnshztgEK4dNt2UwWIpgX+DEvx20mQn
 crc8V9g2c4Yqn2DSKgL7BrdL4/PPpPEjAb7Zzox56RNcDexqB0WuQuociyICT8+2kLP2
 jB5A==
X-Gm-Message-State: AOAM530WLfghkuH95rjvk2du59KZKcQEr/wIDKeOGvvpwhNLDzuqu/e4
 qRd3Av8yMXEcaR3Q1NQahnY=
X-Google-Smtp-Source: ABdhPJwVQYFabKTToF80XLT85Ns5lteAmFJwIiYzK6nRHC7DnPk0uKUHCwqDt4dprLlWwedWrrBYFg==
X-Received: by 2002:a17:90a:f481:: with SMTP id
 bx1mr18949125pjb.117.1638584348435; 
 Fri, 03 Dec 2021 18:19:08 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id r6sm6147647pjz.56.2021.12.03.18.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 18:19:08 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  4 Dec 2021 11:18:41 +0900
Message-Id: <20211204021842.1853549-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211204021842.1853549-1-shorne@gmail.com>
References: <20211204021842.1853549-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/3] openrisc: Use delay slot for clone and fork
 wrappers
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Chris Down <chris@chrisdown.name>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBzYXZlcyBvbmUgaW5zdHJ1Y3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3Ju
ZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TIHwg
NiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL2VudHJ5LlMKaW5kZXggYzYwOGY3NmU1NzUzLi44Y2QyMTEzMDU3YzUgMTAwNjQ0
Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMKKysrIGIvYXJjaC9vcGVucmlzYy9r
ZXJuZWwvZW50cnkuUwpAQCAtMTE2MiwxNSArMTE2MiwxMyBAQCBfZm9ya19zYXZlX2V4dHJhX3Jl
Z3NfYW5kX2NhbGw6CiAKIEVOVFJZKF9fc3lzX2Nsb25lKQogCWwubW92aGkJcjI5LGhpKHN5c19j
bG9uZSkKLQlsLm9yaQlyMjkscjI5LGxvKHN5c19jbG9uZSkKIAlsLmoJX2Zvcmtfc2F2ZV9leHRy
YV9yZWdzX2FuZF9jYWxsCi0JIGwubm9wCisJIGwub3JpCXIyOSxyMjksbG8oc3lzX2Nsb25lKQog
CiBFTlRSWShfX3N5c19mb3JrKQogCWwubW92aGkJcjI5LGhpKHN5c19mb3JrKQotCWwub3JpCXIy
OSxyMjksbG8oc3lzX2ZvcmspCiAJbC5qCV9mb3JrX3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbAot
CSBsLm5vcAorCSBsLm9yaQlyMjkscjI5LGxvKHN5c19mb3JrKQogCiBFTlRSWShzeXNfcnRfc2ln
cmV0dXJuKQogCWwuamFsCV9zeXNfcnRfc2lncmV0dXJuCi0tIAoyLjMxLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
