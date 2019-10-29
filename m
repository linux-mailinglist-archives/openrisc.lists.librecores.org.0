Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 41E4FEAEAF
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DF6A220734;
	Thu, 31 Oct 2019 12:21:26 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 73A9F20739
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mUh9IJAtF893lJPSE9FNWl8JOGrC9DM2GbUNi0MOrgM=; b=Bcl34FqVmaBqqVI+du9/t1WBwh
 CnzH8QBgZg43YRJX6SYMEy0FbuLTrJ8+3/NWvTgMupUaIuJ7P3zNGWWQ4bSlbjIwYDvIWCqNMpGof
 uZZtftxof58J8BHmIqNYRqTaUBbNEVKZoAqXwqOjzDto9U1RdvbBJij24rkM/WXwtFX3QDXyo4Fgj
 ncAWjftWy4PevCZOGMl30oVTtmLj1G9OghB/uVP53D05WZNSyYbLeWmjUS4gYeoJ0XHCvfX2KtDEu
 BzYR5CBRz3VW76BOSgo/3DULK/PzlAzGELewEKvcNCXMckmOoUylJMTMwelypG2aE5icqyYG6Q/aG
 Rkiziyag==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJQ-0003jA-B4; Tue, 29 Oct 2019 06:49:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:22 +0100
Message-Id: <20191029064834.23438-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] [PATCH 09/21] xtensa: clean up ioremap
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

VXNlIGlvcmVtYXAgYXMgdGhlIG1haW4gaW1wbGVtZW50ZWQgZnVuY3Rpb24sIGFuZCBkZWZpbmVk
CmlvcmVtYXBfbm9jYWNoZSB0byBpdCBhcyBhIGRlcHJlY2F0ZWQgYWxpYXMuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL3h0ZW5zYS9pbmNs
dWRlL2FzbS9pby5oIHwgMTQgKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveHRlbnNhL2luY2x1
ZGUvYXNtL2lvLmggYi9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9pby5oCmluZGV4IDk4OGUwODUz
MGE1Yy4uNDQxZmI1NjkyNmE3IDEwMDY0NAotLS0gYS9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9p
by5oCisrKyBiL2FyY2gveHRlbnNhL2luY2x1ZGUvYXNtL2lvLmgKQEAgLTMyLDggKzMyLDcgQEAg
dm9pZCB4dGVuc2FfaW91bm1hcCh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpOwogLyoKICAq
IFJldHVybiB0aGUgdmlydHVhbCBhZGRyZXNzIGZvciB0aGUgc3BlY2lmaWVkIGJ1cyBtZW1vcnku
CiAgKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3JlbWFwX25vY2FjaGUodW5zaWdu
ZWQgbG9uZyBvZmZzZXQsCi0JCXVuc2lnbmVkIGxvbmcgc2l6ZSkKK3N0YXRpYyBpbmxpbmUgdm9p
ZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNp
emUpCiB7CiAJaWYgKG9mZnNldCA+PSBYQ0hBTF9LSU9fUEFERFIKIAkgICAgJiYgb2Zmc2V0IC0g
WENIQUxfS0lPX1BBRERSIDwgWENIQUxfS0lPX1NJWkUpCkBAIC01MiwxNSArNTEsMTAgQEAgc3Rh
dGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfY2FjaGUodW5zaWduZWQgbG9uZyBvZmZz
ZXQsCiAJCXJldHVybiB4dGVuc2FfaW9yZW1hcF9jYWNoZShvZmZzZXQsIHNpemUpOwogfQogI2Rl
ZmluZSBpb3JlbWFwX2NhY2hlIGlvcmVtYXBfY2FjaGUKLSNkZWZpbmUgaW9yZW1hcF9ub2NhY2hl
IGlvcmVtYXBfbm9jYWNoZQotCi0jZGVmaW5lIGlvcmVtYXBfd2MgaW9yZW1hcF9ub2NhY2hlCi0j
ZGVmaW5lIGlvcmVtYXBfd3QgaW9yZW1hcF9ub2NhY2hlCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBf
X2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUp
Ci17Ci0JcmV0dXJuIGlvcmVtYXBfbm9jYWNoZShvZmZzZXQsIHNpemUpOwotfQorI2RlZmluZSBp
b3JlbWFwX25vY2FjaGUgaW9yZW1hcAorI2RlZmluZSBpb3JlbWFwX3djIGlvcmVtYXAKKyNkZWZp
bmUgaW9yZW1hcF93dCBpb3JlbWFwCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBpb3VubWFwKHZvbGF0
aWxlIHZvaWQgX19pb21lbSAqYWRkcikKIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
