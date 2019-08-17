Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5EB97194
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0CD06204B9;
	Wed, 21 Aug 2019 07:30:44 +0200 (CEST)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by mail.librecores.org (Postfix) with ESMTPS id 980A020199
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 22:58:19 +0200 (CEST)
Received: by mail-io1-f68.google.com with SMTP id j6so13175500ioa.5
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NuXJCtDYAF42ezbdDjEFYfu2iBTjQndKb/Edf61OrOk=;
 b=PCXESTLeUcBNUWogs1gHv/iSg/bRj7rmybc37GwKrHxDe7CTeYQGPE82FFro2CLT61
 8Q4IgUqoS7Jmsm9wuhAF9CCdJ8jA631YD8dGqkPPvzXyvuP2itYPnDRcHbp+2vkqaUSt
 u4rxsZS9lGz/LPzZ8kGOEVrnbFqSW3syoXedbPJGimP78UP/Tg6J92XflG29pM3lwatF
 OjAvDNX5+3tv2rh85pO4hmLeTRsEGL0KJ9d8KAbhP2qYNSdGVQpqF+mf38a8oxmStDJ9
 9nvCgcj7mRwE6p6VKc6zn+f1lPTm2K1/WP8Olg56A4X8/QbiEq8e7laZGSLETkAb5Egu
 FN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NuXJCtDYAF42ezbdDjEFYfu2iBTjQndKb/Edf61OrOk=;
 b=fgoMIqdBE78jBz0koRpddrwcCbOHcJQkOkOLTImF7ezyY4lD66P+K/O8ZEuJL62Rpr
 HzutefSvOwRVuZgycjI4IuRBE6XAt4nayvRKCaGeQIbahLdOT2BzaO+JqjahrQU2eRS/
 tkLspP2H3MdXI3umBEPQRvsvot1gjI762yDo0vlUqp8ROCGOi5ausPf4R9+2JELOqhr/
 Nlh5bDWtbMWl6IuAQbxaY3qeYzqlFRN3AQ0LOAjYufbhZd9GDhIF7f438YpntL7C6Heo
 ayjjtdoTaXULEv3zrca9XlCVQvnOWbCFooHfspDveNh6rBz5Exbj+bMpbrH+MFIiQZjW
 m3JA==
X-Gm-Message-State: APjAAAW4RjFvfUi6kG2qiGYqV6trqS08RafN83IxrWgvvNj2jWOqu9XF
 dPII/999m8Z9xSqt05I2Uxd9Kg==
X-Google-Smtp-Source: APXvYqyKpLbmhNe3o5mV41HWvHYU+SiPLQTRVuTNOtg0cL831wKHUivDHHya6XYWHKa9ZnFnQ2CM9Q==
X-Received: by 2002:a6b:8f0d:: with SMTP id r13mr15237433iod.121.1566075498344; 
 Sat, 17 Aug 2019 13:58:18 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 6sm9905577iog.40.2019.08.17.13.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 13:58:17 -0700 (PDT)
Date: Sat, 17 Aug 2019 13:58:16 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190817073253.27819-15-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-15-hch@lst.de>
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

T24gU2F0LCAxNyBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IF9faW9yZW1h
cCBpcyBub3QgYSBrZXJuZWwgQVBJLCBidXQgdXNlZCBmb3IgaGVscGVycyB3aXRoIGRpZmZlcmlu
Zwo+IHNlbWFudGljcyBpbiBhcmNoIGNvZGUuICBXZSBzaG91bGQgbm90IHByb3ZpZGUgaXQgaW4g
YXMtZ2VuZXJpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KClJldmlld2VkLWJ5OiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5j
b20+ClRlc3RlZC1ieTogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiAj
IHJ2MzIsIHJ2NjQgYm9vdApBY2tlZC1ieTogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBz
aWZpdmUuY29tPiAjIGFyY2gvcmlzY3YKCgotIFBhdWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
