Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 614E81E5048
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 425EE20CC5;
	Wed, 27 May 2020 23:19:39 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 8DEDE20B31
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XpvCeNn0rBV1Tz4g/advg3nbVNkYMm0bwJy/BOtFfCE=; b=mtp2SQYqjnEmMsyJlzBFS9n1tO
 6Bl1A5NTaayU0SwfeVu7fiCn92pQRa2E+OLCPhCkR7c5UWIzpZFiBa/dSxGInoZExvSnyGthPcZBO
 4JmER5OOqQAEca1lNYqFdhQKnYAq52Oa3T/ybKmBuXma9oE3cv8ISqIgbHoeO0JFW7AxZruDDmnEx
 PsNPpIvdhjc8ZYElf/hwKhfqzMUjILcxmjAe1lWljjV6CRjNEZRCfEjWwF1P4xSWOyvp1uPqh9qFT
 ozrQp+DdkT23TxKpXfqKlVPXUZtc7dHO5N14Ysz4RNkBdl9wU1JUDcc5eYOoIfKyan459Q4GR6E7w
 uWqmDTlg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTN-000582-8B; Fri, 15 May 2020 14:38:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:41 +0200
Message-Id: <20200515143646.3857579-25-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 24/29] m68k: implement flush_icache_user_range
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmVuYW1lIHRoZSBjdXJyZW50IGZsdXNoX2ljYWNoZV9yYW5nZSB0byBmbHVzaF9pY2FjaGVfdXNl
cl9yYW5nZSBhcwpwZXIgY29tbWl0IGFlOTJlZjhhNDQyNCAoIlBBVENIXSBmbHVzaCBpY2FjaGUg
aW4gY29ycmVjdCBjb250ZXh0IikgdGhlcmUKc2VlbXMgdG8gYmUgYW4gYXNzdW1wdGlvbiB0aGF0
IGl0IG9wZXJhdGVzIG9uIHVzZXIgYWRkcmVzc2VzLiAgQWRkIGEKZmx1c2hfaWNhY2hlX3Jhbmdl
IGFyb3VuZCBpdCB0aGF0IGZvciBub3cgaXMgYSBuby1vcC4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KLS0tCiBhcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVz
aF9tbS5oIHwgMiArKwogYXJjaC9tNjhrL21tL2NhY2hlLmMgICAgICAgICAgICAgICAgICB8IDcg
KysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVzaF9tbS5oIGIvYXJj
aC9tNjhrL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hfbW0uaAppbmRleCA5NTM3NmJmODRmYWE1Li4x
YWM1NWU3YjQ3ZjAxIDEwMDY0NAotLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVz
aF9tbS5oCisrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX21tLmgKQEAgLTI1
Nyw2ICsyNTcsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19mbHVzaF9wYWdlX3RvX3JhbSh2b2lk
ICp2YWRkcikKIGV4dGVybiB2b2lkIGZsdXNoX2ljYWNoZV91c2VyX3BhZ2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBwYWdlICpwYWdlLAogCQkJCSAgICB1bnNpZ25lZCBsb25n
IGFkZHIsIGludCBsZW4pOwogZXh0ZXJuIHZvaWQgZmx1c2hfaWNhY2hlX3JhbmdlKHVuc2lnbmVk
IGxvbmcgYWRkcmVzcywgdW5zaWduZWQgbG9uZyBlbmRhZGRyKTsKK2V4dGVybiB2b2lkIGZsdXNo
X2ljYWNoZV91c2VyX3JhbmdlKHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKKwkJdW5zaWduZWQgbG9u
ZyBlbmRhZGRyKTsKIAogc3RhdGljIGlubGluZSB2b2lkIGNvcHlfdG9fdXNlcl9wYWdlKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQkJCSAgICAgc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2ln
bmVkIGxvbmcgdmFkZHIsCmRpZmYgLS1naXQgYS9hcmNoL202OGsvbW0vY2FjaGUuYyBiL2FyY2gv
bTY4ay9tbS9jYWNoZS5jCmluZGV4IDk5MDU3Y2Q1ZmY3ZjEuLjc5MTViZTNhMDk3MTIgMTAwNjQ0
Ci0tLSBhL2FyY2gvbTY4ay9tbS9jYWNoZS5jCisrKyBiL2FyY2gvbTY4ay9tbS9jYWNoZS5jCkBA
IC03Myw3ICs3Myw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHZpcnRfdG9fcGh5c19zbG93KHVu
c2lnbmVkIGxvbmcgdmFkZHIpCiAKIC8qIFB1c2ggbiBwYWdlcyBhdCBrZXJuZWwgdmlydHVhbCBh
ZGRyZXNzIGFuZCBjbGVhciB0aGUgaWNhY2hlICovCiAvKiBSWjogdXNlIGNwdXNoICViYyBpbnN0
ZWFkIG9mIGNwdXNoICVkYywgY2ludiAlaWMgKi8KLXZvaWQgZmx1c2hfaWNhY2hlX3JhbmdlKHVu
c2lnbmVkIGxvbmcgYWRkcmVzcywgdW5zaWduZWQgbG9uZyBlbmRhZGRyKQordm9pZCBmbHVzaF9p
Y2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxvbmcgZW5k
YWRkcikKIHsKIAlpZiAoQ1BVX0lTX0NPTERGSVJFKSB7CiAJCXVuc2lnbmVkIGxvbmcgc3RhcnQs
IGVuZDsKQEAgLTEwNCw2ICsxMDQsMTEgQEAgdm9pZCBmbHVzaF9pY2FjaGVfcmFuZ2UodW5zaWdu
ZWQgbG9uZyBhZGRyZXNzLCB1bnNpZ25lZCBsb25nIGVuZGFkZHIpCiAJCQkgICAgICA6ICJkaSIg
KEZMVVNIX0kpKTsKIAl9CiB9CisKK3ZvaWQgZmx1c2hfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxv
bmcgYWRkcmVzcywgdW5zaWduZWQgbG9uZyBlbmRhZGRyKQoreworCWZsdXNoX2ljYWNoZV91c2Vy
X3JhbmdlKGFkZHJlc3MsIGVuZGFkZHIpOworfQogRVhQT1JUX1NZTUJPTChmbHVzaF9pY2FjaGVf
cmFuZ2UpOwogCiB2b2lkIGZsdXNoX2ljYWNoZV91c2VyX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsIHN0cnVjdCBwYWdlICpwYWdlLAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
