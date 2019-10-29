Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E0B9BEAEAD
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C17DF206A4;
	Thu, 31 Oct 2019 12:21:25 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 9704720727
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDkiVa9XfDEYoXi86SjDwlUudDUOj4qX+V5wMq0LvTM=; b=QdX7V0wI1wCk3U+IvqIUmq3iOW
 qQo/B59j9KTfTxV3N1MOAQ0S5ZKkcn7U6tt0luoPVih7dGd1L8JIPNCNrTN6hCLuFmjPoYeViMDDY
 mgFFh0WtbA+wv5cVIDeT3e0LdryWYc6xnWK3f16vPlo/4GEEmaaeXNfrIi7cYdOUxduvFfPBcWLk+
 w8DmRID6giepNvI/Tpg1AV9rv9PuykgdKGh7jfNq8+KYe7f56Y9JZZb0lTCe95kIe006DUFRbenM5
 jn8HlThD/NNXnz/8+HZJzAXkd1bOsdGvPcsy4xP+9VSR+TPkS/y+lnhzVoXCTwJ8oLJk+X9fJIRGb
 4JBZdEgQ==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJJ-0003WJ-Mb; Tue, 29 Oct 2019 06:48:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:20 +0100
Message-Id: <20191029064834.23438-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] [PATCH 07/21] parisc: remove __ioremap
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

X19pb3JlbWFwIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCB0aGUgX1BBR0VfTk9fQ0FDSEUsIHNvIGZv
bGQgdGhlIHdob2xlCnRoaW5nIGFuZCByZW5hbWUgaXQgdG8gaW9yZW1hcC4gIFRoaXMgYWxzbyBh
bGxvd3MgdG8gcmVtb3ZlIHRoZSBzcGVjaWFsCkVJU0EgcXVpcmsgdG8gZm9yY2UgX1BBR0VfTk9f
Q0FDSEUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0t
CiBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9pby5oIHwgMTEgKy0tLS0tLS0tLS0KIGFyY2gvcGFy
aXNjL21tL2lvcmVtYXAuYyAgICAgfCAxMCArKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wYXJpc2Mv
aW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2lvLmgKaW5kZXggOTNk
MzcwMTBiMzc1Li40NjIxMmI1MmMyM2UgMTAwNjQ0Ci0tLSBhL2FyY2gvcGFyaXNjL2luY2x1ZGUv
YXNtL2lvLmgKKysrIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vaW8uaApAQCAtMTI3LDE2ICsx
MjcsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ3NjX3dyaXRlcSh1bnNpZ25lZCBsb25nIGxvbmcg
dmFsLCB1bnNpZ25lZCBsb25nIGFkZHIpCiAvKgogICogVGhlIHN0YW5kYXJkIFBDSSBpb3JlbWFw
IGludGVyZmFjZXMKICAqLwotCi1leHRlcm4gdm9pZCBfX2lvbWVtICogX19pb3JlbWFwKHVuc2ln
bmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgZmxhZ3Mp
OwotCi0vKiBNb3N0IG1hY2hpbmVzIHJlYWN0IHBvb3JseSB0byBJL08tc3BhY2UgYmVpbmcgY2Fj
aGVhYmxlLi4uIEluc3RlYWQgbGV0J3MKLSAqIGRlZmluZSBpb3JlbWFwKCkgaW4gdGVybXMgb2Yg
aW9yZW1hcF9ub2NhY2hlKCkuCi0gKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICogaW9y
ZW1hcCh1bnNpZ25lZCBsb25nIG9mZnNldCwgdW5zaWduZWQgbG9uZyBzaXplKQotewotCXJldHVy
biBfX2lvcmVtYXAob2Zmc2V0LCBzaXplLCBfUEFHRV9OT19DQUNIRSk7Ci19Cit2b2lkIF9faW9t
ZW0gKmlvcmVtYXAodW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7CiAj
ZGVmaW5lIGlvcmVtYXBfbm9jYWNoZShvZmYsIHN6KQlpb3JlbWFwKChvZmYpLCAoc3opKQogI2Rl
ZmluZSBpb3JlbWFwX3djCQkJaW9yZW1hcF9ub2NhY2hlCiAjZGVmaW5lIGlvcmVtYXBfdWMJCQlp
b3JlbWFwX25vY2FjaGUKZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL21tL2lvcmVtYXAuYyBiL2Fy
Y2gvcGFyaXNjL21tL2lvcmVtYXAuYwppbmRleCBmMjlmNjgyMzUyZjAuLjZlN2MwMDVhYTA5YiAx
MDA2NDQKLS0tIGEvYXJjaC9wYXJpc2MvbW0vaW9yZW1hcC5jCisrKyBiL2FyY2gvcGFyaXNjL21t
L2lvcmVtYXAuYwpAQCAtMjUsNyArMjUsNyBAQAogICogaGF2ZSB0byBjb252ZXJ0IHRoZW0gaW50
byBhbiBvZmZzZXQgaW4gYSBwYWdlLWFsaWduZWQgbWFwcGluZywgYnV0IHRoZQogICogY2FsbGVy
IHNob3VsZG4ndCBuZWVkIHRvIGtub3cgdGhhdCBzbWFsbCBkZXRhaWwuCiAgKi8KLXZvaWQgX19p
b21lbSAqIF9faW9yZW1hcCh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBz
aXplLCB1bnNpZ25lZCBsb25nIGZsYWdzKQordm9pZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVk
IGxvbmcgcGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiB7CiAJdm9pZCBfX2lvbWVtICph
ZGRyOwogCXN0cnVjdCB2bV9zdHJ1Y3QgKmFyZWE7CkBAIC0zNiwxMCArMzYsOCBAQCB2b2lkIF9f
aW9tZW0gKiBfX2lvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcg
c2l6ZSwgdW5zaWduZWQgbAogCXVuc2lnbmVkIGxvbmcgZW5kID0gcGh5c19hZGRyICsgc2l6ZSAt
IDE7CiAJLyogU3VwcG9ydCBFSVNBIGFkZHJlc3NlcyAqLwogCWlmICgocGh5c19hZGRyID49IDB4
MDAwODAwMDAgJiYgZW5kIDwgMHgwMDBmZmZmZikgfHwKLQkgICAgKHBoeXNfYWRkciA+PSAweDAw
NTAwMDAwICYmIGVuZCA8IDB4MDNiZmZmZmYpKSB7CisJICAgIChwaHlzX2FkZHIgPj0gMHgwMDUw
MDAwMCAmJiBlbmQgPCAweDAzYmZmZmZmKSkKIAkJcGh5c19hZGRyIHw9IEZfRVhURU5EKDB4ZmMw
MDAwMDApOwotCQlmbGFncyB8PSBfUEFHRV9OT19DQUNIRTsKLQl9CiAjZW5kaWYKIAogCS8qIERv
bid0IGFsbG93IHdyYXBhcm91bmQgb3IgemVybyBzaXplICovCkBAIC02NSw3ICs2Myw3IEBAIHZv
aWQgX19pb21lbSAqIF9faW9yZW1hcCh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwgdW5zaWduZWQg
bG9uZyBzaXplLCB1bnNpZ25lZCBsCiAJfQogCiAJcGdwcm90ID0gX19wZ3Byb3QoX1BBR0VfUFJF
U0VOVCB8IF9QQUdFX1JXIHwgX1BBR0VfRElSVFkgfAotCQkJICBfUEFHRV9BQ0NFU1NFRCB8IGZs
YWdzKTsKKwkJCSAgX1BBR0VfQUNDRVNTRUQgfCBfUEFHRV9OT19DQUNIRSk7CiAKIAkvKgogCSAq
IE1hcHBpbmdzIGhhdmUgdG8gYmUgcGFnZS1hbGlnbmVkCkBAIC05MCw3ICs4OCw3IEBAIHZvaWQg
X19pb21lbSAqIF9faW9yZW1hcCh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwgdW5zaWduZWQgbG9u
ZyBzaXplLCB1bnNpZ25lZCBsCiAKIAlyZXR1cm4gKHZvaWQgX19pb21lbSAqKSAob2Zmc2V0ICsg
KGNoYXIgX19pb21lbSAqKWFkZHIpOwogfQotRVhQT1JUX1NZTUJPTChfX2lvcmVtYXApOworRVhQ
T1JUX1NZTUJPTChpb3JlbWFwKTsKIAogdm9pZCBpb3VubWFwKGNvbnN0IHZvbGF0aWxlIHZvaWQg
X19pb21lbSAqaW9fYWRkcikKIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
