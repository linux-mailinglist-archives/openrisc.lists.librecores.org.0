Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB951CD306
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4FD6320B71;
	Mon, 11 May 2020 09:41:47 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 605C820B0F
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fx6bBrPOGEjXhNeaz51guyTlixZC0l8IQKU5XAHGw70=; b=VdXdviLyJyWpWRc0iLUjbpAAiT
 6IgZhpMGojIMsz7ZsCzDu4V1w3B9lfosjCLFz07LlOtWg2rgoqcMialU+OSgrMY05gAyqdKiuWqkJ
 r5zvHgHeHt+sDd1mH+1/9hqGLX8fSyUhUEqwkCj5Idqjc7uLLoBqiyyqX2eR1W1kNrYLTklc3ZqMS
 eN8oRNeJZiG/VKXC2qEEIa3AsTWctz4fRspf/uAtCThMecqTWXoQ+3w2w8ekYoi2HA0WWvMQAlQQm
 zDKaX7FQx4uXPm2Rc1hUFvcPNgaBNVXP+G/mWysvyzP3KQWeTdd7jpx7vamt1IiHjUdrs9EJZRMRV
 LzzsE/Cw==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgp9-0001Bf-B4; Sun, 10 May 2020 07:56:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:55:05 +0200
Message-Id: <20200510075510.987823-27-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 26/31] m68k: implement flush_icache_user_range
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

UmVuYW1lIHRoZSBjdXJyZW50IGZsdXNoX2ljYWNoZV9yYW5nZSB0byBmbHVzaF9pY2FjaGVfdXNl
cl9yYW5nZSBhcwpwZXIgY29tbWl0IGFlOTJlZjhhNDQyNCAoIlBBVENIXSBmbHVzaCBpY2FjaGUg
aW4gY29ycmVjdCBjb250ZXh0IikgdGhlcmUKc2VlbXMgdG8gYmUgYW4gYXNzdW1wdGlvbiB0aGF0
IGl0IG9wZXJhdGVzIG9uIHVzZXIgYWRkcmVzc2VzLiAgQWRkIGEKZmx1c2hfaWNhY2hlX3Jhbmdl
IGFyb3VuZCBpdCB0aGF0IGZvciBub3cgaXMgYSBuby1vcC4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoX21tLmggfCAyICsrCiBhcmNoL202OGsvbW0vY2FjaGUuYyAgICAgICAgICAgICAgICAg
IHwgNyArKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX21tLmgg
Yi9hcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVzaF9tbS5oCmluZGV4IDk1Mzc2YmY4NGZh
YTUuLjFhYzU1ZTdiNDdmMDEgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoX21tLmgKKysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hfbW0uaApA
QCAtMjU3LDYgKzI1Nyw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2ZsdXNoX3BhZ2VfdG9fcmFt
KHZvaWQgKnZhZGRyKQogZXh0ZXJuIHZvaWQgZmx1c2hfaWNhY2hlX3VzZXJfcGFnZShzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHBhZ2UgKnBhZ2UsCiAJCQkJICAgIHVuc2lnbmVk
IGxvbmcgYWRkciwgaW50IGxlbik7CiBleHRlcm4gdm9pZCBmbHVzaF9pY2FjaGVfcmFuZ2UodW5z
aWduZWQgbG9uZyBhZGRyZXNzLCB1bnNpZ25lZCBsb25nIGVuZGFkZHIpOworZXh0ZXJuIHZvaWQg
Zmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UodW5zaWduZWQgbG9uZyBhZGRyZXNzLAorCQl1bnNpZ25l
ZCBsb25nIGVuZGFkZHIpOwogCiBzdGF0aWMgaW5saW5lIHZvaWQgY29weV90b191c2VyX3BhZ2Uo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQkJICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSwg
dW5zaWduZWQgbG9uZyB2YWRkciwKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9tbS9jYWNoZS5jIGIv
YXJjaC9tNjhrL21tL2NhY2hlLmMKaW5kZXggOTkwNTdjZDVmZjdmMS4uNzkxNWJlM2EwOTcxMiAx
MDA2NDQKLS0tIGEvYXJjaC9tNjhrL21tL2NhY2hlLmMKKysrIGIvYXJjaC9tNjhrL21tL2NhY2hl
LmMKQEAgLTczLDcgKzczLDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgdmlydF90b19waHlzX3Ns
b3codW5zaWduZWQgbG9uZyB2YWRkcikKIAogLyogUHVzaCBuIHBhZ2VzIGF0IGtlcm5lbCB2aXJ0
dWFsIGFkZHJlc3MgYW5kIGNsZWFyIHRoZSBpY2FjaGUgKi8KIC8qIFJaOiB1c2UgY3B1c2ggJWJj
IGluc3RlYWQgb2YgY3B1c2ggJWRjLCBjaW52ICVpYyAqLwotdm9pZCBmbHVzaF9pY2FjaGVfcmFu
Z2UodW5zaWduZWQgbG9uZyBhZGRyZXNzLCB1bnNpZ25lZCBsb25nIGVuZGFkZHIpCit2b2lkIGZs
dXNoX2ljYWNoZV91c2VyX3JhbmdlKHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgdW5zaWduZWQgbG9u
ZyBlbmRhZGRyKQogewogCWlmIChDUFVfSVNfQ09MREZJUkUpIHsKIAkJdW5zaWduZWQgbG9uZyBz
dGFydCwgZW5kOwpAQCAtMTA0LDYgKzEwNCwxMSBAQCB2b2lkIGZsdXNoX2ljYWNoZV9yYW5nZSh1
bnNpZ25lZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxvbmcgZW5kYWRkcikKIAkJCSAgICAgIDog
ImRpIiAoRkxVU0hfSSkpOwogCX0KIH0KKwordm9pZCBmbHVzaF9pY2FjaGVfcmFuZ2UodW5zaWdu
ZWQgbG9uZyBhZGRyZXNzLCB1bnNpZ25lZCBsb25nIGVuZGFkZHIpCit7CisJZmx1c2hfaWNhY2hl
X3VzZXJfcmFuZ2UoYWRkcmVzcywgZW5kYWRkcik7Cit9CiBFWFBPUlRfU1lNQk9MKGZsdXNoX2lj
YWNoZV9yYW5nZSk7CiAKIHZvaWQgZmx1c2hfaWNhY2hlX3VzZXJfcGFnZShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHBhZ2UgKnBhZ2UsCi0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
