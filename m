Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9CD7BEF3
	for <lists+openrisc@lfdr.de>; Wed, 31 Jul 2019 13:09:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 66380203C3;
	Wed, 31 Jul 2019 13:09:08 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 8666D2019D
 for <openrisc@lists.librecores.org>; Fri, 26 Jul 2019 15:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v25fSyTOpn+HLVJ1/RYUYjo/p2HKkKXuypllJV6JuFU=; b=FGTl2rF5Ekw99U5eWA0qO4ViY
 ezxgPoNckrfd02rKeR5DfhI5n58vJTcEz7aQ3diHZkRmGndI5Rrlekc33Ay4TibbLOwpG1XKCSloG
 82pJRxtCcnQvPslNG7xO/8DHeER9qlTWSUhlaF/iNE0YUnkdxnIGvBgg9Brpdp4iVK9JkJjbm0TvY
 TcCvfrG3NaxcqzRwVsiX1+l5U3fjf1yQEEnGnZRs2iZazrP26MkKBj4gTVChmnzy3Hz3krFh/Kx2g
 S6dj3Qi5GKN2Rfpl0jR+wq9OXeL8jT6dpW75i/Mr7cpWYS51GnMWuFS7A6xMmFALsHG7f3ly85U0p
 sDY3Ty9HA==;
Received: from [179.95.31.157] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqzun-0004Yn-F9; Fri, 26 Jul 2019 13:05:42 +0000
Date: Fri, 26 Jul 2019 10:05:33 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20190726100521.5d379300@coco.lan>
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 13:09:05 +0200
Subject: Re: [OpenRISC] [PATCH v2 00/26] ReST conversion of text files
 without .txt extension
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
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-i2c@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, devel@lists.orangefs.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, rcu@vger.kernel.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RW0gRnJpLCAyNiBKdWwgMjAxOSAwOTo1MToxMCAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiBlc2NyZXZldToKCj4gVGhpcyBzZXJpZXMgY29u
dmVydHMgdGhlIHRleHQgZmlsZXMgdW5kZXIgRG9jdW1lbnRhdGlvbiB3aXRoIGRvZXNuJ3QgZW5k
Cj4gbmVpdGhlciAudHh0IG9yIC5yc3QgYW5kIGFyZSBub3QgcGFydCBvZiBBQkkgb3IgZmVhdHVy
ZXMuCj4gCj4gVGhpcyBzZXJpZXMgaXMgYXQ6Cj4gCWh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL21j
aGVoYWIvZXhwZXJpbWVudGFsLmdpdC9sb2cvP2g9cnN0X2Zvcl81XzRfdjMKPiAKPiBBbmQgaXQg
aXMgYmFzZWQgb24geWVzdGVyZGF5J3MgdXBzdHJlYW0gdHJlZS4KPiAKPiBBZnRlciB0aGlzIHNl
cmllcywgd2UgaGF2ZSB+MzIwIGZpbGVzIGxlZnQgdG8gYmUgY29udmVydGVkIHRvIFJlU1QuCj4g
Cj4gdjI6Cj4gICAtIEFkZGVkIDMgZmlsZXMgc3VibWl0dGVkIGZvciB2NS4zIHRoYXQgd2VyZW4n
dCBtZXJnZWQgeWV0Owo+ICAgLSBtYXJrZG93biBwYXRjaCBicm9rZW4gaW50byB0d28sIHBlciBS
b2IncyByZXF1ZXN0Owo+ICAgLSByZWJhc2VkIG9uIHRoZSB0b3Agb2YgdXBzdHJlYW0gbWFzdGVy
IGJyYW5jaAo+IAo+IE1hdXJvIENhcnZhbGhvIENoZWhhYiAoMjYpOgoKPiAgIGRvY3M6IEFCSTog
cmVtb3ZlIGV4dGVuc2lvbiBmcm9tIHN5c2ZzLWNsYXNzLW1pYy50eHQKCiAgICBeIEluIHRpbWU6
IHRoaXMgb25lIHdhcyBhbHJlYWR5IG1lcmdlZC4KClRoYW5rcywKTWF1cm8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
