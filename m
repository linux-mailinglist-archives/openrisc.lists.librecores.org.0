Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 869462FF975
	for <lists+openrisc@lfdr.de>; Fri, 22 Jan 2021 01:29:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0E9A6210CF;
	Fri, 22 Jan 2021 01:29:09 +0100 (CET)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mail.librecores.org (Postfix) with ESMTPS id EAEAC20E48
 for <openrisc@lists.librecores.org>; Fri, 22 Jan 2021 01:29:06 +0100 (CET)
Received: by mail-pl1-f175.google.com with SMTP id x18so2261634pln.6
 for <openrisc@lists.librecores.org>; Thu, 21 Jan 2021 16:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=iF694mVegDqKfi3Z26c6YspuPq0RpCL5dkGRinSRl7U=;
 b=iHXjhXwd1W/PjBrrNlHlmRkUkqpaq06V+dHYJ/WoIz0hqRJo4+YsRnv1zwlR+f4CIg
 2fgXBDsf8cIp19rTIUAh74GLorCBgFMOOehO8JePoOj4n+mrDueSQNxp6tXj1jROAC74
 Q3rK1OTEmMQSaJSI/NwQqLAumus6YpNVX2SBEsIdZlJW0hsUKfuP/KNEXNchIlvgAF6a
 RbQsjv9Re274vGgT+mKvB3xeIQ0B6JohjXEPTcPu9XCQTk3mz/vqFF/GOsQn0yYPaaLB
 ENvI/TdnPSH18xAwo8mby4pSVYNMWALpM8Sr6Mqv1aXDEv4YIctYAEmDR2W5WXUi1lLT
 ynJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=iF694mVegDqKfi3Z26c6YspuPq0RpCL5dkGRinSRl7U=;
 b=NI+7LTPcXwrzwGKEEZh/BuJGjVTOnf4ES4Ld2xbipD6R4/5dIZLibic9jK2J1aLnWM
 +5HOjkEvu6o9Nirw7eNTMx3rfgnI8NYKzld2GHI/pSnO3D2WcAaQlDJaRFDLcibX9wA0
 CpJEQTy3W1BmDb6bilqRTp4FtQ5juAGCha4pOsa+6rLo4gEoL0OmqqMjxDD/5DLFsQpr
 nT5jRma/WkaQoPwP0Cqv6Tg9387VF13CbLyCbaoWpPnPu8cUtgHxINQRxWtRWbYdZRgE
 2BIAs/uOG8a/WJ+wau+hAX6kTeQ6ia9x9u22GlLW/C/n5sBWg8engdZe6NwsdToXBCwj
 vlcQ==
X-Gm-Message-State: AOAM531/OReg8ooX8mprBKzqHiT0FBc4kNjwsjmdhkK87CzJMEWeyqZ1
 csqbAPcFpqcahgbwAHwUOm8=
X-Google-Smtp-Source: ABdhPJydUoeN926duEX55yDN9jyHJOwRkUb6/kNss+rGisAc71AkIgSRV77sGpdGZZcLClXK78gW+g==
X-Received: by 2002:a17:90a:bb81:: with SMTP id
 v1mr2231270pjr.119.1611275345221; 
 Thu, 21 Jan 2021 16:29:05 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 c11sm6195952pfl.185.2021.01.21.16.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:29:04 -0800 (PST)
Date: Fri, 22 Jan 2021 09:29:02 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210122002902.GP2002709@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC fixes for 5.11
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

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGw6CgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDdjNTNmNmI2NzFmNGFiYTcwZmYxNWUxYjA1MTQ4YjEwZDU4YzI4Mzc6
CgogIExpbnV4IDUuMTEtcmMzICgyMDIxLTAxLTEwIDE0OjM0OjUwIC0wODAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdGh1Yi5jb20vb3BlbnJp
c2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gMDMxYzdhOGNkNmZjNTY1ZTkwMzIwYmYwOGYyMmVlNmU3MGY5ZDk2OToKCiAgb3BlbnJpc2M6
IGlvOiBBZGQgbWlzc2luZyBfX2lvbWVtIGFubm90YXRpb24gdG8gaW91bm1hcCgpICgyMDIxLTAx
LTIwIDA2OjE0OjI2ICswOTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpPcGVuUklTQyBmaXhlcyBmb3IgNS4xMQoKRml4
ZXMgaW5jbHVkZToKICogQ29tcGlsZXIgd2FybmluZyBmaXh1cCBmb3IgbmV3IExpdGV4IFNvQyBk
cml2ZXIKICogU3BhcnNlIHdhcm5pbmcgZml4dXAgZm9yIGlvdW5tYXAKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR2VlcnQg
VXl0dGVyaG9ldmVuICgxKToKICAgICAgb3BlbnJpc2M6IGlvOiBBZGQgbWlzc2luZyBfX2lvbWVt
IGFubm90YXRpb24gdG8gaW91bm1hcCgpCgpTdGFmZm9yZCBIb3JuZSAoMSk6CiAgICAgIHNvYzog
bGl0ZXg6IEZpeCBjb21waWxlIHdhcm5pbmcgd2hlbiBkZXZpY2UgdHJlZSBpcyBub3QgY29uZmln
dXJlZAoKIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8uaCAgICAgfCAyICstCiBhcmNoL29w
ZW5yaXNjL21tL2lvcmVtYXAuYyAgICAgICAgIHwgMiArLQogZHJpdmVycy9zb2MvbGl0ZXgvbGl0
ZXhfc29jX2N0cmwuYyB8IDMgKystCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
