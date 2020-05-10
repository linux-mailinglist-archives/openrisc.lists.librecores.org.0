Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 956721CD30B
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 760D320B7B;
	Mon, 11 May 2020 09:41:49 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 85C8620B18
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gbS3mnDejF/vbSIU5cFMJ7gbJPhVms+ouuUae9XApr4=; b=Jeef/M6wRiQsyUU6ARprddeFuW
 Ih3QL7O0SFvbRRu8d9DBgFL0JfqU6LDoAq0ftGNMQ+HpMiy87MHTfwgYDMrMHa1QK6oTbqTUmomeS
 4Xci1co32+BUzy12zKd4SHNSBbsG5vmZ/syewkkPZgcwUxVKWSK7oro2yZKpxtN3HkNt+4dKT5Xw3
 31qRqq9wSzv6I5a23Wt/9IX/GozigKBBtCvioHR8DpuHVpWbCyIPgWxsqtXtv82dBjJVCJkvjPaBY
 b8KPnCXNq8XtRWDr8/HSFCirxUDoAJl2NAcgiGp3HJ00NuMrZfS+7sRc/linPe+sVj5kQYB/rO2WU
 2zABr8zA==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgpO-0001Pa-9R; Sun, 10 May 2020 07:56:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:55:10 +0200
Message-Id: <20200510075510.987823-32-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: [OpenRISC] [PATCH 31/31] module: move the set_fs hack for
 flush_icache_range to m68k
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

Zmx1c2hfaWNhY2hlX3JhbmdlIGdlbmVyYWxseSBvcGVyYXRlcyBvbiBrZXJuZWwgYWRkcmVzc2Vz
LCBidXQgZm9yIHNvbWUKcmVhc29uIG02OGsgbmVlZGVkIGEgc2V0X2ZzIG92ZXJyaWRlLiAgTW92
ZSB0aGF0IGludG8gdGhlIG02OGsgY29kZQppbnN0ZWQgb2Yga2VlcGluZyBpdCBpbiB0aGUgbW9k
dWxlIGxvYWRlci4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgotLS0KIGFyY2gvbTY4ay9tbS9jYWNoZS5jIHwgNCArKysrCiBrZXJuZWwvbW9kdWxlLmMgICAg
ICB8IDggLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9tbS9jYWNoZS5jIGIvYXJjaC9tNjhrL21t
L2NhY2hlLmMKaW5kZXggNzkxNWJlM2EwOTcxMi4uNWVjYjMzMTBlODc0NSAxMDA2NDQKLS0tIGEv
YXJjaC9tNjhrL21tL2NhY2hlLmMKKysrIGIvYXJjaC9tNjhrL21tL2NhY2hlLmMKQEAgLTEwNyw3
ICsxMDcsMTEgQEAgdm9pZCBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIGFk
ZHJlc3MsIHVuc2lnbmVkIGxvbmcgZW5kYWRkcikKIAogdm9pZCBmbHVzaF9pY2FjaGVfcmFuZ2Uo
dW5zaWduZWQgbG9uZyBhZGRyZXNzLCB1bnNpZ25lZCBsb25nIGVuZGFkZHIpCiB7CisJbW1fc2Vn
bWVudF90IG9sZF9mcyA9IGdldF9mcygpOworCisJc2V0X2ZzKEtFUk5FTF9EUyk7CiAJZmx1c2hf
aWNhY2hlX3VzZXJfcmFuZ2UoYWRkcmVzcywgZW5kYWRkcik7CisJc2V0X2ZzKG9sZF9mcyk7CiB9
CiBFWFBPUlRfU1lNQk9MKGZsdXNoX2ljYWNoZV9yYW5nZSk7CiAKZGlmZiAtLWdpdCBhL2tlcm5l
bC9tb2R1bGUuYyBiL2tlcm5lbC9tb2R1bGUuYwppbmRleCA2NDZmMWUyMzMwZDJiLi5iMTY3M2Vk
NDk1OTRmIDEwMDY0NAotLS0gYS9rZXJuZWwvbW9kdWxlLmMKKysrIGIva2VybmVsL21vZHVsZS5j
CkBAIC0zMzEyLDEyICszMzEyLDYgQEAgc3RhdGljIGludCBjaGVja19tb2R1bGVfbGljZW5zZV9h
bmRfdmVyc2lvbnMoc3RydWN0IG1vZHVsZSAqbW9kKQogCiBzdGF0aWMgdm9pZCBmbHVzaF9tb2R1
bGVfaWNhY2hlKGNvbnN0IHN0cnVjdCBtb2R1bGUgKm1vZCkKIHsKLQltbV9zZWdtZW50X3Qgb2xk
X2ZzOwotCi0JLyogZmx1c2ggdGhlIGljYWNoZSBpbiBjb3JyZWN0IGNvbnRleHQgKi8KLQlvbGRf
ZnMgPSBnZXRfZnMoKTsKLQlzZXRfZnMoS0VSTkVMX0RTKTsKLQogCS8qCiAJICogRmx1c2ggdGhl
IGluc3RydWN0aW9uIGNhY2hlLCBzaW5jZSB3ZSd2ZSBwbGF5ZWQgd2l0aCB0ZXh0LgogCSAqIERv
IGl0IGJlZm9yZSBwcm9jZXNzaW5nIG9mIG1vZHVsZSBwYXJhbWV0ZXJzLCBzbyB0aGUgbW9kdWxl
CkBAIC0zMzI5LDggKzMzMjMsNiBAQCBzdGF0aWMgdm9pZCBmbHVzaF9tb2R1bGVfaWNhY2hlKGNv
bnN0IHN0cnVjdCBtb2R1bGUgKm1vZCkKIAkJCQkgICArIG1vZC0+aW5pdF9sYXlvdXQuc2l6ZSk7
CiAJZmx1c2hfaWNhY2hlX3JhbmdlKCh1bnNpZ25lZCBsb25nKW1vZC0+Y29yZV9sYXlvdXQuYmFz
ZSwKIAkJCSAgICh1bnNpZ25lZCBsb25nKW1vZC0+Y29yZV9sYXlvdXQuYmFzZSArIG1vZC0+Y29y
ZV9sYXlvdXQuc2l6ZSk7Ci0KLQlzZXRfZnMob2xkX2ZzKTsKIH0KIAogaW50IF9fd2VhayBtb2R1
bGVfZnJvYl9hcmNoX3NlY3Rpb25zKEVsZl9FaGRyICpoZHIsCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
