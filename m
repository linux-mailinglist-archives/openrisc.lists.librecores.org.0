Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C89CCE2A60
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 08:24:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6106520727;
	Thu, 24 Oct 2019 08:24:20 +0200 (CEST)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by mail.librecores.org (Postfix) with ESMTPS id 303D720140
 for <openrisc@lists.librecores.org>; Mon, 21 Oct 2019 10:47:37 +0200 (CEST)
Received: by mail-lf1-f66.google.com with SMTP id 21so426101lft.10
 for <openrisc@lists.librecores.org>; Mon, 21 Oct 2019 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QXiJynjMNN+K0FoWykKekuEj/OBAnoR2FAHWqATIrfA=;
 b=1m2lTqA9g8pR+gNDKI38Hf1YD7AHOVMKSH+qSD61rfazdteezEy9qc5uu2ptisQ9la
 2LtDIJrwJ7X1O01IGsFjD9Q/tJKUKXCVjQmfmnHyU1gdA5IsuEbNn8xmSiwXeHIxvmk/
 6pVLd5kq52suDJKdMlVESukd4NeWOaLnxEtoHQCsXi6XdP7Fg9uthetLEeVehsgGmwkk
 ja7ACVppObMYfmKfim6MGSHkS3TgOluieW1CYSonwzhW9/htLzCwwZtSsHf1htBxQR70
 GPCtExDc04v5gmZKf1XkxxBDsYhoYYnWBWz0PP+O7PTGn50JCdZZF3jn0h256hnPJzT7
 KjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QXiJynjMNN+K0FoWykKekuEj/OBAnoR2FAHWqATIrfA=;
 b=kgyj9NjCEySYDFj/POnjm8uife0VU0bZttLo6WO53sKabMvL4ug6SGcgZ7YDwii93W
 +n7kW1tNYRjyxtvbtvzR538aXHn5O7mpjlIIRj8U5b5P4j3te7OoO87ndq95zvX226ao
 wPZdao74iIGDHRmk00mZ+qwF7+cDMHZ0zeAP/m6vewT1PmhSc2MUf8Sgzl+X2ndrGenm
 bvPN84oUFdiO5GdLlb8EwPc+Rp/my+MTKKgkFcPs1gvnLYr6xbmAW6kjJ6KhhzRwdu99
 JjxQ0FnqP44pyYe2kDWIvFsXsU77Z7Oa29WCqmtj9wBogR2yu6tUv9fVNFXyWgIZ5fb1
 r5Fw==
X-Gm-Message-State: APjAAAVPkQGfpqj1Cga9kEwclLJIGlF8Yfay5MKYuZoKD+B5jawV++lb
 j6CLZeEox21X44Mu5pNmFNO3tw==
X-Google-Smtp-Source: APXvYqylsk8yws60VuLL0ozqdrRuKOuNEAm0brGxK1g45riofpGFYvmXbrn9qDfFdvJfYm2OEK4gUA==
X-Received: by 2002:ac2:4283:: with SMTP id m3mr14587900lfh.41.1571647656443; 
 Mon, 21 Oct 2019 01:47:36 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2d0:74aa:edd9:b20e:81b0:5b8f?
 ([2a00:1fa0:2d0:74aa:edd9:b20e:81b0:5b8f])
 by smtp.gmail.com with ESMTPSA id x76sm12649907ljb.81.2019.10.21.01.47.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:47:35 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-4-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <915c9aaa-ea20-7c29-7ee8-5c5f68f7d123@cogentembedded.com>
Date: Mon, 21 Oct 2019 11:47:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017174554.29840-4-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 24 Oct 2019 08:24:18 +0200
Subject: Re: [OpenRISC] [PATCH 03/21] ia64: rename ioremap_nocache to
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

SGVsbG8hCgpPbiAxNy4xMC4yMDE5IDIwOjQ1LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKCj4g
T24gaWE2NCBpb3JlbWFwX25vY2FjaGUgZmFpbHMgaWYgYXR0cmlidXRzIGRvbid0IG1hdGNoLiAg
Tm90IG90aGVyCgogICBBdHRyaWJ1dGVzPwoKPiBhcmNoaXRlY3R1cmVzIGRvZXMgdGhpcywgYW5k
IHdlIHBsYW4gdG8gZ2V0IHJpZCBvZiBpb3JlbWFwX25vY2FjaGUuCj4gU28gZ2V0IHJpZCBvZiB0
aGUgc3BlY2lhbCBzZW1hbnRpY3MgYW5kIGRlZmluZSBpb3JlbWFwX25vY2FjaGUgaW4KPiB0ZXJt
cyBvZiBpb3JlbWFwIGFzIG5vIHBvcnRhYmxlIGRyaXZlciBjb3VsZCByZWx5IG9uIHRoZSBiZWhh
dmlvcgo+IGFueXdheS4KPiAKPiBIb3dldmVyIHg4NiBpbXBsZW1lbnRzIGlvcmVtYXBfdWMgd2l0
aCBhIGluIGEgc2ltaWxhciB3YXkgYXMgdGhlIGlhNjQKCiAgICBXaXRoIGEgd2hhdD8KCj4gdmVy
c2lvbiBvZiBpb3JlbWFwX25vY2FjaGUsIHNvIGltcGxlbWVudCB0aGF0IGluc3RlYWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBh
cmNoL2lhNjQvaW5jbHVkZS9hc20vaW8uaCB8IDYgKysrLS0tCj4gICBhcmNoL2lhNjQvbW0vaW9y
ZW1hcC5jICAgICB8IDQgKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9p
by5oIGIvYXJjaC9pYTY0L2luY2x1ZGUvYXNtL2lvLmgKPiBpbmRleCA1NGU3MGMyMTM1MmEuLmZl
YzlkZjk2MDllZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2lhNjQvaW5jbHVkZS9hc20vaW8uaAo+ICsr
KyBiL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9pby5oClsuLi5dCgpNQlIsIFNlcmdlaQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
