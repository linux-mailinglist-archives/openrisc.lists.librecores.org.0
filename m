Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 395C51E501D
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D9E5A20B15;
	Wed, 27 May 2020 23:19:09 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 8F61B20B0D
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=nX/OxofzDc3fd8yYsXOf0skifLYVUPlkWiksPKDCM7I=; b=FXLIDS/DY4Fj1boiW2rPFwTzrf
 TLYCawH6OO9WWcT32gM3EgdCV7jiRmXxHZgB1iFLz68wxD0wObOuUUchLBpN59Pj6xGTTlvy9JaYf
 6GSInclud5EUw6NHZ5sybEVriC4nvVAcCGj48E/rkyJkybkGvFvh9o8wyRMidHYBKQBNgfqs51bPu
 EG/JDYZ57S+4srwVZVTRC+dD5olxYQmWSpOqbb8IbN/2GOpLiSsjn0wknhezyt80x+IvF214YlG6b
 h/73p9ZozmTVnJtX3b0NmkHzH2hfZ1s4lYMlQA6L05L7znOxrIASs48wi0vK64ZyNtNM2S1FXw4uT
 xGmnSTIw==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSW-00041m-AW; Fri, 15 May 2020 14:37:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:24 +0200
Message-Id: <20200515143646.3857579-8-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 07/29] asm-generic: improve the flush_dcache_page
 stub
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

VGhlcmUgaXMgYSBtYWdpYyBBUkNIX0lNUExFTUVOVFNfRkxVU0hfRENBQ0hFX1BBR0UgY3BwIHN5
bWJvbCB0aGF0Cmd1YXJkcyBub24tc3R1YiBhdmFpbGFiaWxpdHkgb2YgZmx1c2hfZGNhY2hlX3Bh
Z2dlLiAgVXNlIHRoYXQgdG8KY2hlY2sgaWYgZmx1c2hfZGNhY2hlX3BhZ2cgaXMgaW1wbGVtZW50
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBp
bmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1c2guaCB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
YXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9jYWNoZWZsdXNo
LmgKaW5kZXggYmY5YmI4M2U5ZmM4ZC4uYmJiYjRkNGVmNjUxNiAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmgKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9jYWNo
ZWZsdXNoLmgKQEAgLTIsOCArMiw2IEBACiAjaWZuZGVmIF9BU01fR0VORVJJQ19DQUNIRUZMVVNI
X0gKICNkZWZpbmUgX0FTTV9HRU5FUklDX0NBQ0hFRkxVU0hfSAogCi0jZGVmaW5lIEFSQ0hfSU1Q
TEVNRU5UU19GTFVTSF9EQ0FDSEVfUEFHRSAwCi0KIC8qCiAgKiBUaGUgY2FjaGUgZG9lc24ndCBu
ZWVkIHRvIGJlIGZsdXNoZWQgd2hlbiBUTEIgZW50cmllcyBjaGFuZ2Ugd2hlbgogICogdGhlIGNh
Y2hlIGlzIG1hcHBlZCB0byBwaHlzaWNhbCBtZW1vcnksIG5vdCB2aXJ0dWFsIG1lbW9yeQpAQCAt
NDIsMTIgKzQwLDE0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV9wYWdlKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogfQogI2VuZGlmCiAKLSNpZm5kZWYgZmx1c2hfZGNhY2hl
X3BhZ2UKKyNpZm5kZWYgQVJDSF9JTVBMRU1FTlRTX0ZMVVNIX0RDQUNIRV9QQUdFCiBzdGF0aWMg
aW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7CiB9Cisj
ZGVmaW5lIEFSQ0hfSU1QTEVNRU5UU19GTFVTSF9EQ0FDSEVfUEFHRSAwCiAjZW5kaWYKIAorCiAj
aWZuZGVmIGZsdXNoX2RjYWNoZV9tbWFwX2xvY2sKIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9k
Y2FjaGVfbW1hcF9sb2NrKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nKQogewotLSAKMi4y
Ni4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
