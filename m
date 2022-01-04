Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 17BAB483AD8
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 04:14:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 02A9C2432C;
	Tue,  4 Jan 2022 04:14:26 +0100 (CET)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mail.librecores.org (Postfix) with ESMTPS id B38922432B
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 04:14:24 +0100 (CET)
Received: by mail-pj1-f42.google.com with SMTP id v16so30247206pjn.1
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 19:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJAWs4PwYNN1qCvTg7EwSfBc2wZ2Z/liewIqyDwRYmU=;
 b=LX2BfRIIGxGsmgMrW85CqfBUBs++REHaJEGmCs7BZgW2fC/F2jw2hNhh5/QqOM3ToR
 udqQVUSvbiu2u297cUbeZT9/Re1H8j3OAv65tuU902kPCPRQo4rDvQr+vIXXSIZzybG3
 2IKSNaC1lj0Z9TsKkl379dZu7GlxUpQGJwwJ5mqofuWq2kcVJEpX1ixCuc3dc0+AaZAL
 Uf3kNLZnfcCX9ieBOXFSQDYM9ot6jk1rso7j4BzyyBRApuflVctUltK9SgDMZ6gxiEIk
 7rW9ddTDg1ze9iuWttTSBvK4pjwSYumMXMYsHXhs30UDSn5FJIb7mR6QAlbBffoOFadl
 bkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJAWs4PwYNN1qCvTg7EwSfBc2wZ2Z/liewIqyDwRYmU=;
 b=CqRVIDP1eR8VGM/H5NyYZmkIyYST4Iiqf4tv18rkV49ScKfFbI6z0CK9uZ8zRJGe+y
 gl6ys+weBZ/3ALqu9rsGVMa0JYKWfwflnrEjRnm1JeD2ePwUL4svWQ+Nwj+V+HgYYNby
 P7J60z/dzeQjM4DzJcSp1aigNNw2DziPcaRYse1NiLIPdpi272noua5ABchyUorXCX3M
 FaTsGJJevCM38jd4Nlbdq88mbjnyhD426Mr+shsAI7KHDYMhxdpAFJIe6eKWKZvWEupp
 +TXSuHGzRI9GbnOLF1wPuVU8OuH33xlz5N7TY7cnC3k28lxeL7dDOYQk5dSoQV/eNLo1
 NGHQ==
X-Gm-Message-State: AOAM530oDAjUPoqnPRCRjnHR+K926AZjO7LxBvy+7OA4RjkRI0Ioz+kl
 pE5OdhhXu6pUmwZN+qmbnYJ6scduWD8=
X-Google-Smtp-Source: ABdhPJzG7zBgUurxpVDwidwymzLpfkTRSAWXBRPcpErvwdTCwJV/q4qlkobFMBp2lSJCqeQV0yospw==
X-Received: by 2002:a17:90b:3716:: with SMTP id
 mg22mr58795210pjb.173.1641266063367; 
 Mon, 03 Jan 2022 19:14:23 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id l12sm24964525pfc.181.2022.01.03.19.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 19:14:22 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Tue,  4 Jan 2022 12:14:03 +0900
Message-Id: <20220104031414.2416928-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104031414.2416928-1-shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v5 02/13] linux/syscalls: Add or1k_atomic syscall
 for OpenRISC
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
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmV2aWV3ZWQtYnk6IEFkaGVtZXJ2YWwgWmFuZWxsYSAgPGFkaGVtZXJ2YWwuemFuZWxsYUBsaW5h
cm8ub3JnPgotLS0KIHN5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdCB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvc3lzY2FsbC1uYW1lcy5saXN0IGIvc3lzZGVwcy91bml4L3N5c3Yv
bGludXgvc3lzY2FsbC1uYW1lcy5saXN0CmluZGV4IDQyNzAxY2U1ODMuLmM4MGE5YTU5Y2IgMTAw
NjQ0Ci0tLSBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdAorKysg
Yi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QKQEAgLTMwNCw2ICsz
MDQsNyBAQCBvcGVuX2J5X2hhbmRsZV9hdAogb3Blbl90cmVlCiBvcGVuYXQKIG9wZW5hdDIKK29y
MWtfYXRvbWljCiBvc2ZfYWRqdGltZQogb3NmX2Fmc19zeXNjYWxsCiBvc2ZfYWx0X3Bsb2NrCi0t
IAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
