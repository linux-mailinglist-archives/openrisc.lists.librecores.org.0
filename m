Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCA605AD5F
	for <lists+openrisc@lfdr.de>; Sat, 29 Jun 2019 22:39:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8169D200E2;
	Sat, 29 Jun 2019 22:39:28 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id DE92F200FC
 for <openrisc@lists.librecores.org>; Sat, 29 Jun 2019 17:09:18 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id w10so3910981pgj.7
 for <openrisc@lists.librecores.org>; Sat, 29 Jun 2019 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4PDRDSdPlik/3Dz2WUeVgJcUfwA9IGRhonB1MM/wefg=;
 b=G57SADTMggL8n0pIpOEwPt5rucFLcFzaP0n3oeowJewkuuCijNkliMNKU+dGOlJ2fq
 EgAKCtiA3mOadRCmiaX8mEmLoId9NM33CuXBJlIVjavZ/WnnrRH6vZHvEDKKT/5R/aNr
 Y5VefnWEapcSksrsGqA6l2yPB2FUYnOh6Vi+ec1DRkT7wk27vt4ez6cL1TsEWp+WmJJD
 9czSVDIssaRJU7VtpsTT4SisHJVQZCK2gJ5Zlmlmi/1yGLJ9FoIo0IwwGlCR0OXlLBsy
 u8gp3kAJF4pXyVF54QHX3ujHIFjdgstGjSggr8TMM7tCgzpMymyRIkW7A3k/oUiZp/ow
 4BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4PDRDSdPlik/3Dz2WUeVgJcUfwA9IGRhonB1MM/wefg=;
 b=s1WrPah0YwbZ70xap+qK6wxh6LRv7XAukDzQFTsGuFaR8JZZ1e+PWd9oeQQu+aSs5r
 sxEi4zIAqXIZEiC5gSd4HsSI5Dawh93c5WS44MUiUixPcmXIQGsC/Urrbs08jHAuE0Ab
 RBicnxpASChIG1B7372VuYl7pOBtr3NO8nB6ZmyagTwLfHUUxa7LOchNMhNlL5Zn1aJD
 ZyBu4cyI2fcFAsI3IaH/FUsm4yZGzTtu63zI96OHgDmZMfTuBFv4i85zj50ix0pijFgm
 4hmE7Wb/XiH95ShDeC5STgkOFROtZQNrXrlIxYVfNYspW2Lqn5P/Vc3Or0QjXIC+6RrE
 JKRg==
X-Gm-Message-State: APjAAAVD8SHp/QYYaFAPSNulgCoIVV+mOMIwTdgSAwxsRXHnvGYvx7NZ
 81OTVpFRL4ZORfrpIy62kZk=
X-Google-Smtp-Source: APXvYqyDBBSk+rR6gLpGBEL0OVOHp9fl5zjs/iRj+V1a6MYIR50eUUkJF3Dx9enR+JvisdUNTLheWg==
X-Received: by 2002:a17:90a:634a:: with SMTP id
 v10mr20203751pjs.16.1561820957173; 
 Sat, 29 Jun 2019 08:09:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b3sm10519235pfp.65.2019.06.29.08.09.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Jun 2019 08:09:16 -0700 (PDT)
Date: Sat, 29 Jun 2019 08:09:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190629150915.GA817@roeck-us.net>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614144431.21760-7-hch@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sat, 29 Jun 2019 22:39:26 +0200
Subject: Re: [OpenRISC] [PATCH 6/7] dma-direct: handle
 DMA_ATTR_NO_KERNEL_MAPPING in common code
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-xtensa@linux-xtensa.org,
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6NDQ6MzBQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gRE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcgaXMgZ2VuZXJhbGx5IGltcGxl
bWVudGVkIGJ5IGFsbG9jYXRpbmcKPiBub3JtYWwgY2FjaGVhYmxlIHBhZ2VzIG9yIENNQSBtZW1v
cnksIGFuZCB0aGVuIHJldHVybmluZyB0aGUgcGFnZQo+IHBvaW50ZXIgYXMgdGhlIG9wYXF1ZSBo
YW5kbGUuICBMaWZ0IHRoYXQgY29kZSBmcm9tIHRoZSB4dGVuc2EgYW5kCj4gZ2VuZXJpYyBkbWEg
cmVtYXBwaW5nIGltcGxlbWVudGF0aW9ucyBpbnRvIHRoZSBnZW5lcmljIGRtYS1kaXJlY3QKPiBj
b2RlIHNvIHRoYXQgd2UgZG9uJ3QgZXZlbiBjYWxsIGFyY2hfZG1hX2FsbG9jIGZvciB0aGVzZSBh
bGxvY2F0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KClRoaXMgcGF0Y2ggcmVzdWx0cyBpbiBidWlsZCBmYWlsdXJlcyBmb3IgbWlwczpubG1f
eGxwX2RlZmNvbmZpZyBhbmQKbWlwczpjYXZpdW1fb2N0ZW9uX2RlZmNvbmZpZy4KCmtlcm5lbC9k
bWEvZGlyZWN0LmM6MTQ0OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhcmNoX2RtYV9wcmVwX2Nv
aGVyZW50JwoKUmV2ZXJ0aW5nIHRoZSBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbS4KCkd1ZW50ZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
