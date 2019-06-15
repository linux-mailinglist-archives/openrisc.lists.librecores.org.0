Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9785155928
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 79B19202B5;
	Tue, 25 Jun 2019 22:41:51 +0200 (CEST)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id DEAB62010C
 for <openrisc@lists.librecores.org>; Sat, 15 Jun 2019 10:36:22 +0200 (CEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id A382E68AFE; Sat, 15 Jun 2019 10:35:54 +0200 (CEST)
Date: Sat, 15 Jun 2019 10:35:54 +0200
From: "hch@lst.de" <hch@lst.de>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Message-ID: <20190615083554.GC23406@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-8-hch@lst.de>
 <78ac563f2815a9a14bfab6076d0ef948497f5b9f.camel@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78ac563f2815a9a14bfab6076d0ef948497f5b9f.camel@synopsys.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: Re: [OpenRISC] [PATCH 7/7] arc: use the generic remapping allocator
 for coherent DMA allocations
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
Cc: "jonas@southpole.se" <jonas@southpole.se>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDY6MDU6MDFQTSArMDAwMCwgRXVnZW5peSBQYWx0c2V2
IHdyb3RlOgo+IEhpIENocmlzdG9waCwKPiAKPiBSZWd1bGFyIHF1ZXN0aW9uIC0gZG8geW91IGhh
dmUgYW55IHB1YmxpYyBnaXQgcmVwb3NpdG9yeSB3aXRoIGFsbCB0aGlzIGRtYSBjaGFuZ2VzPwo+
IEkgd2FudCB0byB0ZXN0IGl0IGZvciBBUkMuCj4gCj4gUHJldHR5IHN1cmUgdGhlCj4gIFtQQVRD
SCAyLzddIGFyYzogcmVtb3ZlIHRoZSBwYXJ0aWFsIERNQV9BVFRSX05PTl9DT05TSVNURU5UIHN1
cHBvcnQKPiBpcyBmaW5lLgo+IAo+IE5vdCBzbyBzdXJlIGFib3V0Cj4gIFtQQVRDSCA3LzddIGFy
YzogdXNlIHRoZSBnZW5lcmljIHJlbWFwcGluZyBhbGxvY2F0b3IgZm9yIGNvaGVyZW50IERNQSBh
bGxvY2F0aW9ucwo+IDopCgogICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlz
Yy5naXQgZG1hLW5vdC1jb25zaXN0ZW50LWNsZWFudXAKCkdpdHdlYjoKCiAgIGh0dHA6Ly9naXQu
aW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9kbWEt
bm90LWNvbnNpc3RlbnQtY2xlYW51cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
