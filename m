Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 34FE355929
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 09E24202FF;
	Tue, 25 Jun 2019 22:41:52 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id C18F320132
 for <openrisc@lists.librecores.org>; Sun, 16 Jun 2019 11:17:30 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id p10so4094886pgn.1
 for <openrisc@lists.librecores.org>; Sun, 16 Jun 2019 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WsOS9W6MkxWVUF6PRCv1rpiLrmIxWx7oq/nfwUHXQV4=;
 b=bhZZN4ZoB10Na0Ic8RGp22L9+faJUjyGlbtTqC3QZGcBGJuewiHIW8tipif4QS7JJa
 1nrwmgqclU0DIUK1lkjTTcUGhz54dyjqnkBu47eV2Gqxs1j6CHp1U+YLu4EAfw/CAjF1
 N4Mx0ailxADXlnEYbdKSlfJzz1zls4lLkPIdBQJTSClQ4r1iGVc+xfs0MQuBRfpvwO9k
 gu8vFQfMyie1SGDmstzys5iH9BtPM5Bh+9RYlpG24Inaj/skYMoNRLkXj6mCNXw8w51x
 eAcug1S/tqUfOOwe3BZd+VoHBqNwLp+FIOwyB1hK2SzoGYVonIeSrUcHAXxJsyxiRCAl
 RVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WsOS9W6MkxWVUF6PRCv1rpiLrmIxWx7oq/nfwUHXQV4=;
 b=bEIqVWl2njb1PN0sJYfsYe+spdYfv3Lll8QFO08lLPkfM5vbl+tRbxZ9az9gB0wvsa
 Hp5jRkZ3krdt5zFa7ivxS1bRBT8foUpP4JkLgtjexpDRDLhr0E+6QF6jc7//t4jGxQJX
 pOF2tq8jy+2l3G54GyEqeWNz326KyeWvZznx4riYeIUjfQhgcuJxHcO5mxPStYu65lmc
 FgBXytsXK/UTdJ9EMD3mtsV+mfD7cAF1nQzkqtMyF/64bvE4exiO3CeObSMqCMzMBEEo
 EAUV/2ALYvZ8VXfekUw/hxBdlyDFxUM6SCzowitHw3vClZNFF1zHSQ2i2ZGQzu1u7pOd
 ZCDQ==
X-Gm-Message-State: APjAAAXuqcfsZgvyBYj6GB0kNDigiYKhnZ0AUCJqhZx9yhcCOZeqjLSI
 fS03I16COTFT3NansoWVTdg=
X-Google-Smtp-Source: APXvYqzC4p9c3ZsPQStMlz2hbBAY7Gw8pOpqyBR6LQ5uQv6ZdwfBVqV2rU83/Y0doH7WTm6gXf728g==
X-Received: by 2002:a65:56c5:: with SMTP id w5mr43407043pgs.434.1560676649025; 
 Sun, 16 Jun 2019 02:17:29 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id q144sm10986713pfc.103.2019.06.16.02.17.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 02:17:28 -0700 (PDT)
Date: Sun, 16 Jun 2019 18:17:24 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190616091724.GL2358@lianli.shorne-pla.net>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614144431.21760-4-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: Re: [OpenRISC] [PATCH 3/7] openrisc: remove the partial
 DMA_ATTR_NON_CONSISTENT support
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

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6NDQ6MjdQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIG9wZW5yaXNjIERNQSBjb2RlIHN1cHBvcnRzIERNQV9BVFRSX05PTl9D
T05TSVNURU5UIGFsbG9jYXRpb25zLCBidXQKPiBkb2VzIG5vdCBwcm92aWRlIGEgY2FjaGVfc3lu
YyBvcGVyYXRpb24uICBUaGlzIG1lYW5zIGFueSB1c2VyIG9mIGl0Cj4gd2lsbCBuZXZlciBiZSBh
YmxlIHRvIGFjdHVhbGx5IHRyYW5zZmVyIGNhY2hlIG93bmVyc2hpcCBhbmQgdGh1cyBjYXVzZQo+
IGNvaGVyZW5jeSBidWdzLgoKVGhlIGJlbG93IGxvb2tzIGdvb2QuICBJIGFtIGFsd2F5cyBoYXBw
eSB0byB3aGF0IGxvb2tzIGxpa2UgbGVnYWN5IGNvcHkgJiBwYXN0ZQpjcnVmdC4KCkFja2VkLWJ5
OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVs
L2RtYS5jIHwgMjIgKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvZG1hLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9kbWEuYwo+IGluZGV4IGY3
OTQ1N2NiMzc0MS4uOWYyNWZkMGZiYjVkIDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2Vy
bmVsL2RtYS5jCj4gKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMKPiBAQCAtOTgsMTUg
Kzk4LDEzIEBAIGFyY2hfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUs
IGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsCj4gIAo+ICAJdmEgPSAodW5zaWduZWQgbG9uZylwYWdl
Owo+ICAKPiAtCWlmICgoYXR0cnMgJiBETUFfQVRUUl9OT05fQ09OU0lTVEVOVCkgPT0gMCkgewo+
IC0JCS8qCj4gLQkJICogV2UgbmVlZCB0byBpdGVyYXRlIHRocm91Z2ggdGhlIHBhZ2VzLCBjbGVh
cmluZyB0aGUgZGNhY2hlIGZvcgo+IC0JCSAqIHRoZW0gYW5kIHNldHRpbmcgdGhlIGNhY2hlLWlu
aGliaXQgYml0Lgo+IC0JCSAqLwo+IC0JCWlmICh3YWxrX3BhZ2VfcmFuZ2UodmEsIHZhICsgc2l6
ZSwgJndhbGspKSB7Cj4gLQkJCWZyZWVfcGFnZXNfZXhhY3QocGFnZSwgc2l6ZSk7Cj4gLQkJCXJl
dHVybiBOVUxMOwo+IC0JCX0KPiArCS8qCj4gKwkgKiBXZSBuZWVkIHRvIGl0ZXJhdGUgdGhyb3Vn
aCB0aGUgcGFnZXMsIGNsZWFyaW5nIHRoZSBkY2FjaGUgZm9yCj4gKwkgKiB0aGVtIGFuZCBzZXR0
aW5nIHRoZSBjYWNoZS1pbmhpYml0IGJpdC4KPiArCSAqLwo+ICsJaWYgKHdhbGtfcGFnZV9yYW5n
ZSh2YSwgdmEgKyBzaXplLCAmd2FsaykpIHsKPiArCQlmcmVlX3BhZ2VzX2V4YWN0KHBhZ2UsIHNp
emUpOwo+ICsJCXJldHVybiBOVUxMOwo+ICAJfQo+ICAKPiAgCXJldHVybiAodm9pZCAqKXZhOwo+
IEBAIC0xMjIsMTAgKzEyMCw4IEBAIGFyY2hfZG1hX2ZyZWUoc3RydWN0IGRldmljZSAqZGV2LCBz
aXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCj4gIAkJLm1tID0gJmluaXRfbW0KPiAgCX07Cj4gIAo+
IC0JaWYgKChhdHRycyAmIERNQV9BVFRSX05PTl9DT05TSVNURU5UKSA9PSAwKSB7Cj4gLQkJLyog
d2Fsa19wYWdlX3JhbmdlIHNob3VsZG4ndCBiZSBhYmxlIHRvIGZhaWwgaGVyZSAqLwo+IC0JCVdB
Uk5fT04od2Fsa19wYWdlX3JhbmdlKHZhLCB2YSArIHNpemUsICZ3YWxrKSk7Cj4gLQl9Cj4gKwkv
KiB3YWxrX3BhZ2VfcmFuZ2Ugc2hvdWxkbid0IGJlIGFibGUgdG8gZmFpbCBoZXJlICovCj4gKwlX
QVJOX09OKHdhbGtfcGFnZV9yYW5nZSh2YSwgdmEgKyBzaXplLCAmd2FsaykpOwo+ICAKPiAgCWZy
ZWVfcGFnZXNfZXhhY3QodmFkZHIsIHNpemUpOwo+ICB9Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
