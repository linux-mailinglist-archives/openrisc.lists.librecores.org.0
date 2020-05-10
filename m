Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A13ED1CD2F2
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4270E205D4;
	Mon, 11 May 2020 09:41:36 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 9E44B20AD7
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=nlhENnOEhFNbEFUndyREOb6FGEq18FGbNW1JKWIMMLQ=; b=i1x1Ss6rIc4xzNUDXo+FvRpYHu
 82lL8kLQuanx4yVq+U1KkNB54lkslveAIWBaF+MTputzPzOFWndXQQnXvyD7+FR+cqMFLp/pP55/1
 JJ1pgO5gGrfYSFIUciLqyV93Z0Ro6GYZ1Y2psM6c/Tk9M9xNEjj3wwc0P80q5dfa02Mhfzfk8J1rq
 WZkBh9V+FcI+fFWoRlojFUob83e57Ewrm3Nz0A9dnifpN+kou+fNnBsyHvGFkSFgYUsaPq4o4wj6C
 nBGWsukawde3e9GvXnOH1VVzVXmsV4EctOI+UKlFdhH6DokZwsMxvU22j+6HxfvOXf+1azU3aVXpn
 her/Gw8Q==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgo6-000830-Qo; Sun, 10 May 2020 07:55:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:45 +0200
Message-Id: <20200510075510.987823-7-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 06/31] unicore32: remove flush_cache_user_range
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

Zmx1c2hfY2FjaGVfdXNlcl9yYW5nZSBpcyBhbiBBUk1pc20gbm90IHVzZWQgYnkgYW55IGdlbmVy
aWMgb3IgdW5pY29yZTMyCnNwZWNpZmljIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmggfCA4IC0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNo
L3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggZGM4YzBiNDE1MzhmOC4u
OTM5M2NhNDA0N2U5MyAxMDA2NDQKLS0tIGEvYXJjaC91bmljb3JlMzIvaW5jbHVkZS9hc20vY2Fj
aGVmbHVzaC5oCisrKyBiL2FyY2gvdW5pY29yZTMyL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApA
QCAtMTMyLDE0ICsxMzIsNiBAQCBleHRlcm4gdm9pZCBmbHVzaF9jYWNoZV9wYWdlKHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLAogCiAjZGVmaW5lIGZsdXNoX2NhY2hlX2R1cF9tbShtbSkgZmx1
c2hfY2FjaGVfbW0obW0pCiAKLS8qCi0gKiBmbHVzaF9jYWNoZV91c2VyX3JhbmdlIGlzIHVzZWQg
d2hlbiB3ZSB3YW50IHRvIGVuc3VyZSB0aGF0IHRoZQotICogSGFydmFyZCBjYWNoZXMgYXJlIHN5
bmNocm9uaXNlZCBmb3IgdGhlIHVzZXIgc3BhY2UgYWRkcmVzcyByYW5nZS4KLSAqIFRoaXMgaXMg
dXNlZCBmb3IgdGhlIFVuaUNvcmUgcHJpdmF0ZSBzeXNfY2FjaGVmbHVzaCBzeXN0ZW0gY2FsbC4K
LSAqLwotI2RlZmluZSBmbHVzaF9jYWNoZV91c2VyX3JhbmdlKHZtYSwgc3RhcnQsIGVuZCkgXAot
CV9fY3B1Y19jb2hlcmVudF91c2VyX3JhbmdlKChzdGFydCkgJiBQQUdFX01BU0ssIFBBR0VfQUxJ
R04oZW5kKSkKLQogLyoKICAqIFBlcmZvcm0gbmVjZXNzYXJ5IGNhY2hlIG9wZXJhdGlvbnMgdG8g
ZW5zdXJlIHRoYXQgZGF0YSBwcmV2aW91c2x5CiAgKiBzdG9yZWQgd2l0aGluIHRoaXMgcmFuZ2Ug
b2YgYWRkcmVzc2VzIGNhbiBiZSBleGVjdXRlZCBieSB0aGUgQ1BVLgotLSAKMi4yNi4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
