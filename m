Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 72F1F5591D
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1114E202EF;
	Tue, 25 Jun 2019 22:41:46 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 3E12B20288
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 16:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gc779D5myAKPsSuqw4+NRIl28cUlcRu7tNhq+zRZKgI=; b=qQtAGKQlN2ng22ft9to7mr8IN
 QfvqOVt+lf871hiViIsORHRqNbzfic95Bg4xrBEGTbmJQo+lzijFeBl54HcsFkXKekELmZ4+FU7mI
 zn521NSvWZ+TrjrMRlwzs/TgYfQzo8YchyTjEwP7ZBtg+7TnJ1a8zu3tOghcAZjQH6Cs3i4Q0PdVH
 T5izGhMoXafR+ZzHsn39ZVY2VdW1aWBrAWKRE0E1QH1Ek75OP5agoHdsOj9QbeHgyKRllM8aTe2GM
 121pmf1WOvB4uQrdVQQBoof5Kqf4AxAgYtIgzDmEhOKAtoFUo5eeNXFu5scMqW4STadNi6vevVupQ
 L5e+8415A==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbnRU-0005pD-SO; Fri, 14 Jun 2019 14:44:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 14 Jun 2019 16:44:24 +0200
Message-Id: <20190614144431.21760-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: [OpenRISC] handle "special" dma allocation in common code
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
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgYWxsLCwKCnRoaXMgc2VyaWVzIGVuc3VyZXMgdGhhdCB0aGUgY29tbW9uIGRtYS1kaXJlY3Qg
Y29kZSBoYW5kbGVzIHRoZSBzb21ld2hhdApzcGVjaWFsIGFsbG9jYXRpb24gdHlwZXMgcmVxdWVz
dGVkIGJ5IHRoZSBETUFfQVRUUl9OT05fQ09OU0lTVEVOVCBhbmQKRE1BX0FUVFJfTk9fS0VSTkVM
X01BUFBJTkcgZmxhZ3MgZGlyZWN0bHkuICBUbyBkbyBzbyBpdCBhbHNvIHJlbW92ZXMgdGhyZWUK
cGFydGlhbCBhbmQgdGh1cyBicm9rZW4gaW1wbGVtZW50YXRpb25zIG9mIERNQV9BVFRSX05PTl9D
T05TSVNURU5ULiAgTGFzdApidXQgbm90IGxlYXN0IGl0IHN3aXRjaGVzIGFyYyB0byB1c2UgdGhl
IGdlbmVyaWMgZG1hIHJlbWFwcGluZyBjb2RlIG5vdwp0aGF0IGFyYyBkb2Vzbid0IGltcGxlbWVu
dCBhbnkgc3BlY2lhbCBiZWhhdmlvci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
