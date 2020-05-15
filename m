Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 827951E5045
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 47F6420CBF;
	Wed, 27 May 2020 23:19:37 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 0B7B520B1B
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=b/AKrpkhJpxezrTGvPZBC9SW3CgmeEDvWHVUmiGEvwM=; b=qAhrFRCGcIQb9NDVcbKnnI87MO
 rAFmmbjM2sLu6e+feJPc3c5I4D7qGwprfGKsIR8476ANnfS/yu+Lwia+kMttqQbXC0L114HXUN3Zx
 /rZuenpggIX5ieHsOhX9HaVYQzc60QnpIUS1gFYUdtvTNzlWDdgHKpgNbNOzKmviizUSkBt4JEYbf
 bnHS19xdmEcmi4mAmx1qWzsIQQu+OMiLEWB/1RWRZwrkJeYHKqw6O3F0JT5GZFxCOTQT37/cwdPJq
 iO2aQzvkIHxDSKKgPu2mIE1NMibz1IIqvSU5BNlDIGKCAv1NeWRgcfGBjQ7o90LDDCdUWVzlGDBAd
 GiLHjF/Q==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTK-00054u-7X; Fri, 15 May 2020 14:37:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:40 +0200
Message-Id: <20200515143646.3857579-24-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 23/29] arm: rename flush_cache_user_range to
 flush_icache_user_range
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Zmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2Ugd2lsbCBiZSB0aGUgbmFtZSBmb3IgYSBnZW5lcmljIHBy
aW1pdGl2ZS4KTW92ZSB0aGUgYXJtIG5hbWUgc28gdGhhdCBhcm0gYWxyZWFkeSBoYXMgYW4gaW1w
bGVtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBhcmNoL2FybS9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCA0ICsrLS0KIGFyY2gv
YXJtL2tlcm5lbC90cmFwcy5jICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApp
bmRleCBjNzhlMTRmY2ZiNWRmLi4yZTI0ZTc2NWU2ZDNhIDEwMDY0NAotLS0gYS9hcmNoL2FybS9p
bmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vY2FjaGVm
bHVzaC5oCkBAIC0yNTgsMTEgKzI1OCwxMSBAQCBleHRlcm4gdm9pZCBmbHVzaF9jYWNoZV9wYWdl
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHVzZXJfYWRkcgogI2Rl
ZmluZSBmbHVzaF9jYWNoZV9kdXBfbW0obW0pIGZsdXNoX2NhY2hlX21tKG1tKQogCiAvKgotICog
Zmx1c2hfY2FjaGVfdXNlcl9yYW5nZSBpcyB1c2VkIHdoZW4gd2Ugd2FudCB0byBlbnN1cmUgdGhh
dCB0aGUKKyAqIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlIGlzIHVzZWQgd2hlbiB3ZSB3YW50IHRv
IGVuc3VyZSB0aGF0IHRoZQogICogSGFydmFyZCBjYWNoZXMgYXJlIHN5bmNocm9uaXNlZCBmb3Ig
dGhlIHVzZXIgc3BhY2UgYWRkcmVzcyByYW5nZS4KICAqIFRoaXMgaXMgdXNlZCBmb3IgdGhlIEFS
TSBwcml2YXRlIHN5c19jYWNoZWZsdXNoIHN5c3RlbSBjYWxsLgogICovCi0jZGVmaW5lIGZsdXNo
X2NhY2hlX3VzZXJfcmFuZ2UocyxlKQlfX2NwdWNfY29oZXJlbnRfdXNlcl9yYW5nZShzLGUpCisj
ZGVmaW5lIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKHMsZSkJX19jcHVjX2NvaGVyZW50X3VzZXJf
cmFuZ2UocyxlKQogCiAvKgogICogUGVyZm9ybSBuZWNlc3NhcnkgY2FjaGUgb3BlcmF0aW9ucyB0
byBlbnN1cmUgdGhhdCBkYXRhIHByZXZpb3VzbHkKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2tlcm5l
bC90cmFwcy5jIGIvYXJjaC9hcm0va2VybmVsL3RyYXBzLmMKaW5kZXggMWU3MGU3MjI3ZjBmZi4u
MzE2YTc2ODdmODEzMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0va2VybmVsL3RyYXBzLmMKKysrIGIv
YXJjaC9hcm0va2VybmVsL3RyYXBzLmMKQEAgLTU2Niw3ICs1NjYsNyBAQCBfX2RvX2NhY2hlX29w
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQogCQlpZiAoZmF0YWxfc2ln
bmFsX3BlbmRpbmcoY3VycmVudCkpCiAJCQlyZXR1cm4gMDsKIAotCQlyZXQgPSBmbHVzaF9jYWNo
ZV91c2VyX3JhbmdlKHN0YXJ0LCBzdGFydCArIGNodW5rKTsKKwkJcmV0ID0gZmx1c2hfaWNhY2hl
X3VzZXJfcmFuZ2Uoc3RhcnQsIHN0YXJ0ICsgY2h1bmspOwogCQlpZiAocmV0KQogCQkJcmV0dXJu
IHJldDsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
