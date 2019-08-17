Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 65B5397196
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4BB68204BD;
	Wed, 21 Aug 2019 07:30:44 +0200 (CEST)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by mail.librecores.org (Postfix) with ESMTPS id CB68E200E6
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 23:13:32 +0200 (CEST)
Received: by mail-io1-f65.google.com with SMTP id 18so13236793ioe.10
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=AL7Xo7O/pQKUNo42UZGV/pFyRrG+zXus+zNwtHz5W9I=;
 b=deCansAVyhf6TTfeW7XM1FrkPiKpOaNXepy8EGROiXSzE+3idZaMvhF5loMAvVUBWX
 8qQ/Du7og2kbtPPvNhwLzZWiLrJ6qrhbn+d5EChT/4JvkGHH56R9YNddG7eJVGTYNEBI
 QoW6LnQrYgb2yLLTPECkaOYkSk37tjvRRkXYTyrjo+mx8C8Hjp4wFkBmcQM76Qw2K1Eg
 ffQxDHpTJlgpIZyGleaux3hEVOCiLhnzK0XmbrN4f55/9P1fEgrVr+DnimObxh+7zRlK
 4Yo+DuQEB/pAtSat0tnGiWfIUMs/ueCHA8h7mqK5WJbFPHuU46Zze5HXtHZ3DWU/vE+t
 EMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=AL7Xo7O/pQKUNo42UZGV/pFyRrG+zXus+zNwtHz5W9I=;
 b=hg9rbeYx9mTDX2ef2lTwmAago2SYjVSjAjCukYsY1yhuE7zhxVZHuBK4Bbs810Eg8t
 n8tc4+ochPSlZJMhX5xQtgpumc+ummgP7dwcWvHMwxbjA9kIrBqBwn80qVkem4uitN7k
 wv9AdknR/rQxo3m1GTs25vucPTX8pfZ1K+q/QmJNBDaL3H3yt8TS9wLV5zfcrk5xJiH7
 UD4QMEZhds0bQOBafyuMhGEfqBMCMLdbimKfktFZ3A7hdrnDpMB2oS7gr0uZ9s7A2UXz
 uuIdfLJ/leoULJZ/+84HOUSmQ+O4oZZXEab2w3qiujS6tgDblADFcRF4Qad3wZYSll9F
 an2A==
X-Gm-Message-State: APjAAAXiDy8tt4YVa7aI7QRqFMbEyH4UeleaXSF7ugsmorzXt5Fsde32
 v5aYX0YYrshTfA+Sp1mwpxigdg==
X-Google-Smtp-Source: APXvYqxnIBRMl9c73z9hygAzKDBeii4Mh/dKY7KAWMtxtYJjPF4p6Ki6tTxIg+HAQN4yYW8gNJPyfw==
X-Received: by 2002:a02:a492:: with SMTP id d18mr19165200jam.27.1566076411809; 
 Sat, 17 Aug 2019 14:13:31 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 i9sm6980372ioe.35.2019.08.17.14.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:13:31 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:13:30 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190817073253.27819-18-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171412560.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-18-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 17/26] arch: rely on asm-generic/io.h for
 default ioremap_* definitions
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

T24gU2F0LCAxNyBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IFZhcmlvdXMg
YXJjaGl0ZWN0dXJlcyB0aGF0IHVzZSBhc20tZ2VuZXJpYy9pby5oIHN0aWxsIGRlZmluZWQgdGhl
aXIKPiBvd24gZGVmYXVsdCB2ZXJzaW9ucyBvZiBpb3JlbWFwX25vY2FjaGUsIGlvcmVtYXBfd3Qg
YW5kIGlvcmVtYXBfd2MKPiB0aGF0IHBvaW50IGJhY2sgdG8gcGxhaW4gaW9yZW1hcCBkaXJlY3Rs
eSBvciBpbmRpcmVjdGx5LiAgUmVtb3ZlIHRoZXNlCj4gZGVmaW5pdGlvbnMgYW5kIHJlbHkgb24g
YXNtLWdlbmVyaWMvaW8uaCBpbnN0ZWFkLiAgRm9yIHRoaXMgdG8gd29yawo+IHRoZSBiYWNrdXAg
aW9yZW1hcF8qIGRlZmludGlvbnMgbmVlZHMgdG8gYmUgY2hhbmdlZCB0byBwdXJlbHkgY3BwCj4g
bWFjcm9zIGluc3RlYSBvZiBpbmxpbmVzIHRvIGNvdmVyIGZvciBhcmNoaXRlY3R1cmVzIGxpa2Ug
b3BlbnJpc2MKPiB0aGF0IG9ubHkgZGVmaW5lIGlvcmVtYXAgYWZ0ZXIgaW5jbHVkaW5nIDxhc20t
Z2VuZXJpYy9pby5oPi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KClJldmlld2VkLWJ5OiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2
ZS5jb20+ClRlc3RlZC1ieTogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29t
PiAjIHJ2MzIsIHJ2NjQgYm9vdApBY2tlZC1ieTogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xl
eUBzaWZpdmUuY29tPiAjIGFyY2gvcmlzY3YKCgotIFBhdWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
