Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5405291FC0
	for <lists+openrisc@lfdr.de>; Sun, 18 Oct 2020 22:17:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3F4CD20C55;
	Sun, 18 Oct 2020 22:17:05 +0200 (CEST)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 5235620C44
 for <openrisc@lists.librecores.org>; Sun, 18 Oct 2020 22:17:03 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id p3so2465688pjd.0
 for <openrisc@lists.librecores.org>; Sun, 18 Oct 2020 13:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCahzXhRp0T35kK4yYVBbfx2/6V7LwCq+Y8reDypZ9E=;
 b=HItaadbbAOjIYm4N4oT/VkrcCSWKuP6hpPdsMBWDMXKfoB2JQAfCfd4nmt/JPB9TEI
 MpnQVCOgrUfQQ36KbjGG0kEzANsMmnC+I7sDgOgzz+cYifq/OJN4RMFoJnSdVKCzCTzx
 /4ISFVRIwgx+tt4m69YcqWixP9VRiqHl28xYAeMLHpl60lkl37AoZ+teav9u3vtq8k5n
 doPb11CKmyPJxX9+/cyOqASuI7HbVjGawwgDJZHRB3eCgHvxFZW+9TjAPpSvY+MHrZGM
 wRNTBHO/rLlDlqRmyEBClWLpTmPFZjXuPtv0Dacd9FeqzPMqVtKMPWXwFJ8AMIyxz56B
 XKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCahzXhRp0T35kK4yYVBbfx2/6V7LwCq+Y8reDypZ9E=;
 b=pq9Ya+RXJtdLW5eJWuvBXIRbVc1EuW3tunMUSDeqeA7xI2B7F6ripcIzP2Ew4Nggbz
 2RqY3ZWPOKkiJ5bFNAxAR+xKqKWsMhAziDHIS8+Z+txXTLkXAMs+HMuLcTWlpsbVfbk6
 ii36oTkuBJ8o76E5AtnmTh8LXNhUx/kCRCiEqJ6O7Ie/QOmJUnZ7Xhh2jOB9FPWtbavp
 3X2ZIvGhtbblsNOxAP39K8ySPHYTHxmHFQ7cc07gGCA0OdBazMbDoz8P8kA1pyovFc7c
 tfVQalJxDtxJXBHg1dXXb9m1NxKFyWR5AyuJGQ6xYXWt+NVb0w6NlP+dW/Xb47BfeKQL
 /F3w==
X-Gm-Message-State: AOAM5308JfxjKxAeY546nzOCEXqQ5rGHEvC2vbgLXaYuABbC+kQctu9Y
 H7mWAm+/guMybMsoEEHs0kA=
X-Google-Smtp-Source: ABdhPJzvN9B0oUIf+/kf2ww9jcR0Q2jLN67CFJFRTePRJYP5dz2QNLgXcnvuUrDjn/QR69fV7xktXw==
X-Received: by 2002:a17:90a:8c02:: with SMTP id
 a2mr14590600pjo.186.1603052221319; 
 Sun, 18 Oct 2020 13:17:01 -0700 (PDT)
Received: from localhost (g167.58-98-146.ppp.wakwak.ne.jp. [58.98.146.167])
 by smtp.gmail.com with ESMTPSA id q21sm9270516pgg.45.2020.10.18.13.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:17:00 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: stable@vger.kernel.org
Date: Mon, 19 Oct 2020 05:16:50 +0900
Message-Id: <20201018201651.2604140-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/1] OpenRISC binder.c compiler failure fix for
 stable
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

VGhpcyBpcyBhIGJhY2twb3J0ZWQgdmVyc2lvbiBvZiB0aGUgdjUuOSBwYXRjaCB0byBmaXggaXNz
dWVzIG9uIE9wZW5SSVNDIHVzaW5nCmdldF91c2VyIHdpdGggNjQtYml0IHZhbHVlcy4gIFRoaXMg
YWxzbyBmaXhlcyBjb21waWxhdGlvbiBmYWlsdXJlcyB3aGVuCmNvbXBpbGluZyBiaW5kZXIuYy4K
CkRpc2N1c3Npb246IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzEwLzE2LzE5OAoKU3RhZmZv
cmQgSG9ybmUgKDEpOgogIG9wZW5yaXNjOiBGaXggaXNzdWUgd2l0aCBnZXRfdXNlciBmb3IgNjQt
Yml0IHZhbHVlcwoKIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMzUgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
