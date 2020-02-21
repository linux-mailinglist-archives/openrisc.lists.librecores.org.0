Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 09F4917175E
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3C5DE207EE;
	Thu, 27 Feb 2020 13:35:30 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id D29872013B
 for <openrisc@lists.librecores.org>; Fri, 21 Feb 2020 23:14:52 +0100 (CET)
Received: by mail-pg1-f193.google.com with SMTP id j15so1684865pgm.6
 for <openrisc@lists.librecores.org>; Fri, 21 Feb 2020 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W8KaZGmDosurwlNJD9BGtUyzNAa4jQOZ04o70/FjZgc=;
 b=kGkAs4Nbpvsh0LSiFUur6Wb/TbQ7PlbWJAOcbz65Qdv1Uw+Vl3ItNQQMcq77KAYZtJ
 m2urSGoIRXXmBgm7E9zWqbYRJ+5nnXrjCjuYwEMSV5irgIy80/nbHWZ2XU6OXDiBPYJv
 szqdDyeVflofbn6119zAg2Af45wfFrvegUCV58BoK/8EFrO8aWmVrRGB0AEm3jHvnZwq
 g1wiEIh+kkSJDiHR4tM7g/to6tuY6/ds7sh5OENeLGPrw7vXXN0mSnsFAVAAIUn5CXPR
 b8xb4ji8dTq0+IsQw7wVgeeGwqWP+aZc8EV+CmH2yRI8/SyKIhiNvK3/B5nUMCwO2jKu
 gxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W8KaZGmDosurwlNJD9BGtUyzNAa4jQOZ04o70/FjZgc=;
 b=RFH9SaaJAitjkWYBwjkEYa9+4LNa5hg4yPX+J6e1HCDCNa8SGo/bv1zwpyKy8skbzB
 F1ymf+2WKhKf8KxPgD7i+bEsOyT9DgDKA3ybz6+Oid0fMPHn5CnSCj+qFjfpDP3U5IHS
 P1X6to7Nk//pq8McTvhRyuPJUC7BffhJUUSnK+a6u/zTimUrnyTlv+hsyuiqxQuF6Cxl
 9Xc5Y/Hq24KfAgzeH/NgjpH96/KkpEUirf8pT0KT5vu9cQEa6zPZ0p7jg07m/2RWgcCd
 4wZGKpfs/k/TF59X2ZHe7oqID5/nW5RInYCH++0k1S/W9g8v3iymGkXVSBP4ZLcHTCni
 XJxw==
X-Gm-Message-State: APjAAAVBMtfaz2vBpqZHaNUjfMkYbWfaF14dmcI+TEggqgCYeIn6rCyk
 MdTwy4WEG+7MsY6KlhFLI+8=
X-Google-Smtp-Source: APXvYqzuFzGOe6xFIcYN9MIIJZs1pHKUSIf83YFRjQMgSwSuWxPGqeqGheyj2Ocv0clngLUDLTvy9A==
X-Received: by 2002:aa7:8805:: with SMTP id c5mr17210828pfo.142.1582323291138; 
 Fri, 21 Feb 2020 14:14:51 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id h3sm4051033pfr.15.2020.02.21.14.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 14:14:50 -0800 (PST)
Date: Sat, 22 Feb 2020 07:14:47 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200221221447.GA7926@lianli.shorne-pla.net>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220170139.387354-3-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 2/2] openrisc: use the generic in-place
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

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDk6MDE6MzlBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3dpdGNoIG9wZW5yaXNjIHRvIHVzZSB0aGUgZG1hLWRpcmVjdCBhbGxvY2F0
b3IgYW5kIGp1c3QgcHJvdmlkZSB0aGUKPiBob29rcyBmb3Igc2V0dGluZyBtZW1vcnkgdW5jYWNo
ZWQgb3IgY2FjaGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgoKUmV2aWV3ZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoK
QWxzbywgSSB0ZXN0IGJvb3RlZCBvcGVucmlzYyB3aXRoIGxpbnV4IDUuNSArIHRoZXNlIHBhdGNo
ZXMuICBUaGFua3MgZm9yCmNvbnRpbnVpbmcgdG8gc2hyaW5rIG15IGNvZGUgYmFzZS4KIApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
