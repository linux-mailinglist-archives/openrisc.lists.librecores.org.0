Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7553F88F5
	for <lists+openrisc@lfdr.de>; Thu, 26 Aug 2021 15:29:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BD469240C6;
	Thu, 26 Aug 2021 15:29:56 +0200 (CEST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mail.librecores.org (Postfix) with ESMTPS id E58822012B
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 15:29:55 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id a21so2782278pfh.5
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o7mbhfLOAXvYyxdq8BjU71uPFdXWXrwGMZ1rikOJA54=;
 b=ADkVwjd0EglO5ubUi6W+EKavDbzb7iMnEr4q+I4AjeqcVoOuhUVdQl7FMFwp+uaPSM
 iKfPQ6cj8mUbOgMq6cV6fJcVL//eLPolwEn5I0C5KpbBlFg+qPvKYh9lyRenHE93lRqm
 pCbU3gxeIOfHpDO/FmfyaZxdGHEYQWNKZZkmdjJ2DeE+gD5aXeTwSS8SYGJjGJy8lTgu
 uHJXXuHpixix/YZN0s6FjuoxY3Uc9HwyflVBRYKsV8WdJHMNWJMiPYVjnBsHaFaJzSQz
 KuZFTWrsFPacs1QETBOXPKmgdqVNjs+TSyMLOCbHjjSwsAWigVbszNrYO0SXAIU3S9I1
 DEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=o7mbhfLOAXvYyxdq8BjU71uPFdXWXrwGMZ1rikOJA54=;
 b=WPBMqM4cLisM+u8VsD0YJi3hUPV9I69LCNPJ2f9LerlzcGKg95DJgaY6oH+DKq6Lvx
 WAgaITrX/vOWp9hBrhEXryhT91xca2SQH/Cm8EshuSqHas3ZtvnLBPsqRSYtdHq2s/n+
 5Advb1EvI0MvrQXf15iM0Tr0xMlDpeWzHCsVsbcdFoBrrYVpfkC7ssMAeWvpa74iJGwJ
 DiNJqt4bhONYMEKrSldwX81gXazHb2lvO7WQf8CsftxXC02BMOQuU4P8wpEwpw43FJ05
 iA5n0h7Eh+15OFstf1dIWTjD3LoyqnaVbJs1qZMhhtIbpVi1fM2DaCI5rZru2+DEibJL
 IP+g==
X-Gm-Message-State: AOAM530pKa1XZzL7dzHOndgFbPQIXyDP5STHi4nckljLFgDR4MzqTdYa
 XWAWQxsG+aH8AAuKs4pkWrY=
X-Google-Smtp-Source: ABdhPJwrLueRWj30jqW87Ll3BnY9kEUGZkKkOToiqI6g/PSfvOdCfpAIcVvAtmAmBF9KSO6H0U2Lpg==
X-Received: by 2002:a05:6a00:2142:b029:3b9:e5df:77ab with SMTP id
 o2-20020a056a002142b02903b9e5df77abmr3951650pfk.52.1629984594401; 
 Thu, 26 Aug 2021 06:29:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w186sm3359693pfw.78.2021.08.26.06.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:29:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stafford Horne <shorne@gmail.com>
Date: Thu, 26 Aug 2021 22:59:43 +0930
Message-Id: <20210826132946.3324593-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/3] openrisc/litex: Add liteeth support
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gU3RhZmZvcmQsCgpIZXJlIGFyZSBzb21lIGNoYW5nZXMgc28gdGhhdCB0aGUgb3BlbnJp
c2Mga2VybmVsIGNhbiBib290IHdpdGggZXRoZXJuZXQKc3VwcG9ydCB3aXRoIHRoZSBpbi10cmVl
IGRldmljZSB0cmVlLgoKSSBoYXZlIGFsc28gdXBkYXRlZCB0aGUgYWRkcmVzcyBvZiB0aGUgc2Vy
aWFsIGRldmljZSB0byBtYXRjaCByZWNlbnQKbGl0ZXguIEkgcmVhbGlzZSB0aGlzIG1heSBrZWVw
IGNoYW5naW5nLCBidXQgaXQgZG9lcyBtYWtlIGl0IGVhc2llciB0bwp0ZXN0IHVwc3RyZWFtIGtl
cm5lbHMgaWYgdGhlIGJhc2ljcyB3b3JrLgoKSm9lbCBTdGFubGV5ICgzKToKICBvcGVucmlzYy9s
aXRleDogVXBkYXRlIHVhcnQgYWRkcmVzcwogIG9wZW5yaXNjL2xpdGV4OiBBZGQgZXRoZXJuZXQg
ZGV2aWNlCiAgb3BlbnJpc2MvbGl0ZXg6IFVwZGF0ZSBkZWZjb25maWcKCiBhcmNoL29wZW5yaXNj
L2Jvb3QvZHRzL29yMWtsaXRleC5kdHMgICAgICB8IDEzICsrKysrKysrKystLQogYXJjaC9vcGVu
cmlzYy9jb25maWdzL29yMWtsaXRleF9kZWZjb25maWcgfCAyNiArKysrKysrKysrKysrKy0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
Ci0tIAoyLjMzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
