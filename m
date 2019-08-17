Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B8AC097199
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2439F20184;
	Wed, 21 Aug 2019 07:30:45 +0200 (CEST)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by mail.librecores.org (Postfix) with ESMTPS id A7F3520332
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 23:27:04 +0200 (CEST)
Received: by mail-io1-f68.google.com with SMTP id 18so13267508ioe.10
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 14:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=RWNnky4tg4pNafhn5H03aH8PwpXjgmBSavfJgIeX0Ak=;
 b=hov3AcxQ6M0mcpBwyir6wMfwuFoM/2pj4MlCmv+T09knj2Mmqt8UJz4bLEelDU0dEY
 q35RSput0GqdXzjDl39iW6e96fi6ZvYG7hVSedcruoQ/r2si3vSEQf+S3NbKo/JWKMFz
 l1Pncvs1WA7x9utXPIZU7hNH8C4hBPXAZA2OymhT4WgZagRVCnEht474gNpFzrJa6Xjg
 FvMhl4KIMbZ3FFtCmeGSVrAzUl96LhDRs8lD2zGj/KFGyr4hodIlFUOwRQsA6Da7S+zZ
 ouRU8O2CZBVhaSm1B4pGrx6QOwfw1b8VOQgHVh5JaC0Jm1cxHTFnZdggwnO1D5Ig+YJ1
 Lkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=RWNnky4tg4pNafhn5H03aH8PwpXjgmBSavfJgIeX0Ak=;
 b=Fm4Mm3X92AVPtInNxxraLoqzKaGDQpJy7ko26vDbS78wQAlujm0htgKVPcSZbUyj+V
 0Tv/iyIYZs+tE5TFdAOSLRYQPAXqHw0ueZoUqtIVnoXkPM0dIJhB3hteSuFFekrxQVcE
 8ZAWHkCod8FX/KmiFyKFNNuUbL58AGAbUk+f4alMX+zZWckMrXxYpBEOKWVENUAzQPKL
 R6B+s1MSbPnbfWkvt6Sejh2DHmRnS4iDrNVAWApvYQOVRRvfktGtRfHTdmk910ehT7os
 PU8u3X0g5IwS52rBtiQ6U+pllUkxX8zMNPzAX16zyQSGlv+CnvoDBX/UXqzeh5DGYkJi
 lu8g==
X-Gm-Message-State: APjAAAVMqC5MXiP+IegrDKB7SiZl5nwAeJEkYKo15SE13EkGxitYF6a2
 BMvbOCUXqX5oCOmtNw5XhLbwCw==
X-Google-Smtp-Source: APXvYqwKE/3SM/rVpl4teujkfN9+UilDZaKhxrZT/14FwdMPovoCNf3aYcPot40i7G8y5JQK54ukCg==
X-Received: by 2002:a6b:b9c2:: with SMTP id
 j185mr15509819iof.148.1566077223658; 
 Sat, 17 Aug 2019 14:27:03 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 v23sm11488293ioh.58.2019.08.17.14.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:27:03 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:27:02 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1908171426390.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-15-hch@lst.de>
 <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 14/26] asm-generic: don't provide __ioremap
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCAxNyBBdWcgMjAxOSwgUGF1bCBXYWxtc2xleSB3cm90ZToKCj4gQWNrZWQtYnk6IFBh
dWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4gIyBhcmNoL3Jpc2N2CgpUaGlz
IGFjayBpcyBzdXBlcmZsdW91cyBzaW5jZSB0aGUgcGF0Y2ggZG9lc24ndCB0b3VjaCBhcmNoL3Jp
c2N2OyBmZWVsIApmcmVlIHRvIGRyb3AgaXQKCgotIFBhdWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
