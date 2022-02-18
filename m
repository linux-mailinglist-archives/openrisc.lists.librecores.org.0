Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D095D4BC2AF
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 23:52:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7596E24882;
	Fri, 18 Feb 2022 23:52:52 +0100 (CET)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mail.librecores.org (Postfix) with ESMTPS id 2B74A2487A
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 11:18:06 +0100 (CET)
Received: by mail-lj1-f179.google.com with SMTP id bx31so3654706ljb.0
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ZwRbT+1qqEejXkPLNRT0P8U1UfOqBbbk2S+jBiDX7w=;
 b=HwIPNQm6bvP1qyt1DqVyrK6i1IxYBe3pF4kvKD1l9aL3skpcmD5TAiFiTR6vJgOz7B
 t0z9AUGb6zG6pfmU+9BHmWZjjYP8p3JYLtLTfoKdh3BnjyAxS8kyH7aEYnXi01jFZIzF
 573soHdCsmr3/P5ZM1x4mLpZvC48QquGUZEsW8SQQoM18/kWlPpgaxZHrqDS4b16t7Hk
 CPrKR07D3pDZ+6DpMa26njx9Ou6mX/WqALsfbj1Nd6drypXMoKGnpqS7eLYJp4gC/zQZ
 HSj8/Kstfvi7dLE4U0H5uDSTCcko9eMQl/aHEl20oLYR3YeK8yM1gI0YoPwa5+wSkB+m
 kvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ZwRbT+1qqEejXkPLNRT0P8U1UfOqBbbk2S+jBiDX7w=;
 b=gLP/06WhLsv36aehecasBeXUgJqmIhMVw3B5BV5Er9GKKhxp89rLTIhP4KEUwiyQv/
 xPNIlKdy1U+C2rfOZdqmtJiRLpQ0WQ1NqaaQ8hk1IVYOBY03ucvSuYeXEk4Xovxw2Y7f
 Gi2OHvu2pJXWMwiuTaePZP3CKGU9DORiaHH+XsgSlDSI0yyiUbws6yYE+Axr6VtxiyDm
 EszQtRKFtX53LDDJuh3KKIwhDI+pXV2Nf7rGsweFa5noNIXMvY8nfdLP+BZ8ii0R9r9k
 TX9giB0AGv27rlZkPb6AfhG0wdKbwlWJlWH6CulU3z+VA/ZH6OcpL8a3rRG1aqhclmU5
 nGsA==
X-Gm-Message-State: AOAM531WGvFnCtjh/m79BqWFns/BrrLyLVoFDWmXjaXcn1CR/I7zJ4ZF
 X9reQHvZ9nnnZTv/8yV7Kvs=
X-Google-Smtp-Source: ABdhPJzoG5dWVDHzQOQKtFLm+HFsVZSdj/YZ6lPLZtzc83WeDz9kMHzkcgdFaN0a4Fhn9IjcgX1EIQ==
X-Received: by 2002:a05:651c:1594:b0:244:d406:5224 with SMTP id
 h20-20020a05651c159400b00244d4065224mr5639426ljq.130.1645179485463; 
 Fri, 18 Feb 2022 02:18:05 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id k18sm207268lfg.217.2022.02.18.02.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:18:04 -0800 (PST)
Date: Fri, 18 Feb 2022 13:18:03 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Yg9yWxqD4RO7jI2g@curiosity>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
X-Mailman-Approved-At: Fri, 18 Feb 2022 23:52:50 +0100
Subject: Re: [OpenRISC] [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS
 users
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBUaGVy
ZSBhcmUgbm8gcmVtYWluaW5nIGNhbGxlcnMgb2Ygc2V0X2ZzKCksIHNvIENPTkZJR19TRVRfRlMK
PiBjYW4gYmUgcmVtb3ZlZCBnbG9iYWxseSwgYWxvbmcgd2l0aCB0aGUgdGhyZWFkX2luZm8gZmll
bGQgYW5kCj4gYW55IHJlZmVyZW5jZXMgdG8gaXQuCj4gCj4gVGhpcyB0dXJucyBhY2Nlc3Nfb2so
KSBpbnRvIGEgY2hlYXBlciBjaGVjayBhZ2FpbnN0IFRBU0tfU0laRV9NQVguCj4gCj4gV2l0aCBD
T05GSUdfU0VUX0ZTIGdvbmUsIHNvIGRyb3AgYWxsIHJlbWFpbmluZyByZWZlcmVuY2VzIHRvCj4g
c2V0X2ZzKCkvZ2V0X2ZzKCksIG1tX3NlZ21lbnRfdCBhbmQgdWFjY2Vzc19rZXJuZWwoKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKVGVzdGVkLWJ5
OiBTZXJnZXkgTWF0eXVrZXZpY2ggPHNlcmdleS5tYXR5dWtldmljaEBzeW5vcHN5cy5jb20+ICMg
Zm9yIGFyYyBjaGFuZ2VzCgpSZWdhcmRzLApTZXJnZXkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
