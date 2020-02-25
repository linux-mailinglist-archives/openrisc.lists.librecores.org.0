Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5670F171769
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 24AC62013B;
	Thu, 27 Feb 2020 13:35:38 +0100 (CET)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 6E1A82069E
 for <openrisc@lists.librecores.org>; Tue, 25 Feb 2020 11:09:47 +0100 (CET)
Received: by mail-pf1-f196.google.com with SMTP id b185so6920432pfb.7
 for <openrisc@lists.librecores.org>; Tue, 25 Feb 2020 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wh/aV6f8G9P8NFi86qh7LhwbQJ/WhimCuc3W3RTKcZE=;
 b=KFlPaymx0DYUd8m3GIFgxt2xLl5otTfghyORLQBRAKY/JXiEDUAVl14Fq0LOhXd3OP
 BYs0TTqBSzUJQeeX7D3QoHk0dHWQ31xJXe+Yhrn6loPk/pLsuoBW+58LUUXeOXRh5c4w
 kffKXxC0pxA6WaWERdiPRpxhwX4LvfZiHeRe4FHKqZqX9dnUHAkMt105JgVtuxkqstNQ
 vsXEPlFVreZI4LBgeEL7pSmHeS89OnPs9SVG1whCPo0FQwDWSHtqcR46u2munqOjGTcX
 ihNvpq9o2/M6Upu2oD0eRNWLuFAl9lX6S9T4Zfx/vjya35tC5JBP2LWBRFdbbFNtXaRP
 EOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wh/aV6f8G9P8NFi86qh7LhwbQJ/WhimCuc3W3RTKcZE=;
 b=sksz5kt3DZGxXz0aPCnjIQpcmHWqERMGunPcDQ669g4yY5ltmSdLWVhngXNQsdDK8Y
 VSfpaLVL/aqtshy+1oloQPE2BlqY6I4+Z4W/dw7ii6ItuFtNR51dhvaYHea921VDkpxJ
 j/gwWXhDulxrVWFueZBFctlxIFx1qvbZaq5emtcS+G2NKXe0O5A9HoIp+02mCgQyVa+z
 OgqydYAPY0IMRcSuTUblS4Xw2/wtrRbCS/8Fe8C6Jvl05vC/aX5hKSJsxPoziwZcxgKi
 dM+ecGnRMmUZdrjLkRmOhcTFrwYALFiequhv4WHXdPlTKH28z0OZjojMtwzJJhb8HPAC
 zdAw==
X-Gm-Message-State: APjAAAUWgxH9TE1cW6BkpaJz0EyXpdQFu/oDJVLrJl97kNimvb2qodG+
 j8mofnHBArU2/dfqy42Ltr8=
X-Google-Smtp-Source: APXvYqx8Yfc4lFhAWYyQXx8bh8cKTSKSygqvlznUOWE2jNOZJYYzwPYWixn6hqZq7vx8iXGletOiug==
X-Received: by 2002:a63:3c4b:: with SMTP id i11mr58936564pgn.123.1582625385752; 
 Tue, 25 Feb 2020 02:09:45 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id b27sm16151184pgl.77.2020.02.25.02.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 02:09:44 -0800 (PST)
Date: Tue, 25 Feb 2020 19:09:42 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200225100942.GB7926@lianli.shorne-pla.net>
References: <20200224194446.690816-1-hch@lst.de>
 <20200224194446.690816-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224194446.690816-6-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 5/5] openrisc: use the generic in-place
 uncached DMA allocator
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
Cc: Jonas Bonn <jonas@southpole.se>, Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTE6NDQ6NDVBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3dpdGNoIG9wZW5yaXNjIHRvIHVzZSB0aGUgZG1hLWRpcmVjdCBhbGxvY2F0
b3IgYW5kIGp1c3QgcHJvdmlkZSB0aGUKPiBob29rcyBmb3Igc2V0dGluZyBtZW1vcnkgdW5jYWNo
ZWQgb3IgY2FjaGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgoKUmV2aWV3ZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoK
SSBhbHNvIHRlc3QgYm9vdGVkIHRoaXMgc2VyaWVzIHdpdGggbGludXggNS41IG9uIG15IE9wZW5S
SVNDIHRhcmdldC4gIFRoZXJlIGFyZQpubyBpc3N1ZXMuICBOb3RlLCBJIGhhZCBhbiBpc3N1ZSB3
aXRoIHBhdGNoIDMvNSBub3QgY2xlYW5seSBhcHBseWluZyB3aXRoICdnaXQgYW0nCmJ1dCBpdCB3
b3JrZWQgZmluZSB1c2luZyBqdXN0IHBhdGNoLCBJIGRpZG4ndCBnZXQgYW55IG90aGVyIGRldGFp
bHMuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
