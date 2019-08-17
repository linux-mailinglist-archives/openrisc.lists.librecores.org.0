Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 86DBB97193
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C5625204A9;
	Wed, 21 Aug 2019 07:30:43 +0200 (CEST)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by mail.librecores.org (Postfix) with ESMTPS id 09E2E20305
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 18:01:07 +0200 (CEST)
Received: by mail-lf1-f65.google.com with SMTP id c9so6096431lfh.4
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1+7TiPxmJ3iAAUyU8+nGKfNJ+qg4H69wdJGgYgGKXe4=;
 b=renwLVE4t6MRcP5ZcmILI4AbPfXwqYVjMBTfKIElNDtgfcIFYeU8tIrB/gUAytl6lf
 GUpFHkf80zb+V0K3tM4r1Ot/9rCYkg84zdkCVJdaGdaWLOpozsDhzbvufdrpihHrN3tR
 TMxRzxhlJOIgtqRCrMKBJjP0q/GTzQu3Y+xuowVJpW1Icfg6Gn+WBtpfMuxFGsqNj8oB
 RlW1kLKfSyibvLnhWNBdW0PJ1JnQ35HN0rADSVoKpu7sfG7Xl0X/7sr2FWTSDPYnsGg8
 aLYzSLDdBf8VJM9zqhQZCDbdbFM9CTE+LknLwNOfmvJpyWjg0Gz9hP3js+7ih/iHtfFi
 vrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1+7TiPxmJ3iAAUyU8+nGKfNJ+qg4H69wdJGgYgGKXe4=;
 b=EUlYqRfuLU+CrYSyB0P59b+nOvrDD5lS8K0hiLhKqaK4X5JWq1Bj8gYFHI6Hd7ScqS
 5pAOEI2+ZqP0OWEb0Is9COs40+cKUt4eckM3abc8IS3Co8W8mUm4SgrlJ4rdxXOzH/Vq
 pGh2tqUl2MAogWs/Xbx0SD6Tz7lPKDSR4VQSUkpGsYBV0fGeGKggyXqr3KLmn1a6s5xt
 g5ol3OIjQ5jgfQaXv1vFyrmMck+IQD6L3UofOxCAC7ce1teOdILTIofd0J6eFj4z2r1e
 ucFr0+ROszOhbrPv1othIez0VnsOK9nKD+iZ4OXhLeXXtbbPQVQCrh6tClxL1E06zhNd
 Ry0Q==
X-Gm-Message-State: APjAAAXUoJiZB6EDOdb0c0ausa2BACgwxhC9OfJb/GMK5w4ENQP+D2BA
 HvaCNnP6yH06lTQnIFN7LC6GnA==
X-Google-Smtp-Source: APXvYqzgHOkrd316w+DBxyDOOMOwfJvlMQJHfKxSm3Tpn7OUxlUzLbfoBMdqodlTlf7xRwkY3y0i2g==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr7785781lfm.77.1566057666460; 
 Sat, 17 Aug 2019 09:01:06 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4817:8b14:6cce:9848:7977:d7d5?
 ([2a00:1fa0:4817:8b14:6cce:9848:7977:d7d5])
 by smtp.gmail.com with ESMTPSA id b10sm1517289ljk.79.2019.08.17.09.01.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 09:01:05 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-7-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b19607c1-07aa-e361-3c26-8bcb063ed8c1@cogentembedded.com>
Date: Sat, 17 Aug 2019 19:00:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817073253.27819-7-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 06/26] ia64: rename ioremap_nocache to
 ioremap_uc
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8hCgpPbiAxNy4wOC4yMDE5IDEwOjMyLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKCj4g
T24gaWE2NCBpb3JlbWFwX25vY2FjaGUgZmFpbHMgaWYgYXR0cmlidXRzIGRvbid0IG1hdGNoLiAg
Tm90IG90aGVyCgogICAgQXR0cmlidXRlcy4gOi0pCgo+IGFyY2hpdGVjdHVyZXMgZG9lcyB0aGlz
LCBhbmQgd2UgcGxhbiB0byBnZXQgcmlkIG9mIGlvcmVtYXBfbm9jYWNoZS4KPiBTbyBnZXQgcmlk
IG9mIHRoZSBzcGVjaWFsIHNlbWFudGljcyBhbmQgZGVmaW5lIGlvcmVtYXBfbm9jYWNoZSBpbgo+
IHRlcm1zIG9mIGlvcmVtYXAgYXMgbm8gcG9ydGFibGUgZHJpdmVyIGNvdWxkIHJlbHkgb24gdGhl
IGJlaGF2aW9yCj4gYW55d2F5Lgo+IAo+IEhvd2V2ZXIgeDg2IGltcGxlbWVudHMgaW9yZW1hcF91
YyB3aXRoIGEgaW4gYSBzaW1pbGFyIHdheSBhcyB0aGUgaWE2NAoKICAgICJXaXRoIGEiIG5vdCBy
ZWFsbHkgbmVlZGVkPwoKPiB2ZXJzaW9uIG9mIGlvcmVtYXBfbm9jYWNoZSwgc28gaW1wbGVtZW50
IHRoYXQgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KWy4uLl0KCk1CUiwgU2VyZ2VpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
