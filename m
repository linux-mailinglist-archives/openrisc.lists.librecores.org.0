Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C4DF11E504A
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8135420CC9;
	Wed, 27 May 2020 23:19:40 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 49DE120B21
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OHvjr8r1KhMcd+S1XqK4FPd5dKfKqhNjgzj94rkBC/s=; b=hpUzTvBsq4vpy1elAkl1mw6FHf
 ubJgC5vxQtcJOayMkdq554ViwyiWPCUTwet2YV9Q2J++ssaYd8BSdQzKy6GK2PSq3jWKk5s5x3Izc
 2Kin6963rmuYrLo4TBx+Y63gokwXQGbrKKxrfmmNUiqMO6yNEI89Nky7+qugD8CIiXjgmeJM4zFm/
 CS7fc1kZph5dFEd33G1oyyGQ1cQLqiEBOzkijVFNt6hdcjRpqFBG6oGwAX+vWlaW4GQkqGDQWWqP6
 BmUdTn4oIL3jnqZ2HzQNem8gIxxjHcgR3+9EnmzG4z0Elcnl32jkX27nSL9PJdgETwYDxCfP+L4Sm
 hcHw+eRA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTb-0005KV-FH; Fri, 15 May 2020 14:38:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:46 +0200
Message-Id: <20200515143646.3857579-30-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 29/29] module: move the set_fs hack for
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

Zmx1c2hfaWNhY2hlX3JhbmdlIGdlbmVyYWxseSBvcGVyYXRlcyBvbiBrZXJuZWwgYWRkcmVzc2Vz
LCBidXQgZm9yIHNvbWUKcmVhc29uIG02OGsgbmVlZGVkIGEgc2V0X2ZzIG92ZXJyaWRlLiAgTW92
ZSB0aGF0IGludG8gdGhlIG02OGsgY29kZQppbnN0ZWQgb2Yga2VlcGluZyBpdCBpbiB0aGUgbW9k
dWxlIGxvYWRlci4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4K
QWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Ci0tLQog
YXJjaC9tNjhrL21tL2NhY2hlLmMgfCA0ICsrKysKIGtlcm5lbC9tb2R1bGUuYyAgICAgIHwgOCAt
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL21tL2NhY2hlLmMgYi9hcmNoL202OGsvbW0vY2FjaGUu
YwppbmRleCA3OTE1YmUzYTA5NzEyLi41ZWNiMzMxMGU4NzQ1IDEwMDY0NAotLS0gYS9hcmNoL202
OGsvbW0vY2FjaGUuYworKysgYi9hcmNoL202OGsvbW0vY2FjaGUuYwpAQCAtMTA3LDcgKzEwNywx
MSBAQCB2b2lkIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKHVuc2lnbmVkIGxvbmcgYWRkcmVzcywg
dW5zaWduZWQgbG9uZyBlbmRhZGRyKQogCiB2b2lkIGZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25l
ZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxvbmcgZW5kYWRkcikKIHsKKwltbV9zZWdtZW50X3Qg
b2xkX2ZzID0gZ2V0X2ZzKCk7CisKKwlzZXRfZnMoS0VSTkVMX0RTKTsKIAlmbHVzaF9pY2FjaGVf
dXNlcl9yYW5nZShhZGRyZXNzLCBlbmRhZGRyKTsKKwlzZXRfZnMob2xkX2ZzKTsKIH0KIEVYUE9S
VF9TWU1CT0woZmx1c2hfaWNhY2hlX3JhbmdlKTsKIApkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVs
ZS5jIGIva2VybmVsL21vZHVsZS5jCmluZGV4IDY0NmYxZTIzMzBkMmIuLmIxNjczZWQ0OTU5NGYg
MTAwNjQ0Ci0tLSBhL2tlcm5lbC9tb2R1bGUuYworKysgYi9rZXJuZWwvbW9kdWxlLmMKQEAgLTMz
MTIsMTIgKzMzMTIsNiBAQCBzdGF0aWMgaW50IGNoZWNrX21vZHVsZV9saWNlbnNlX2FuZF92ZXJz
aW9ucyhzdHJ1Y3QgbW9kdWxlICptb2QpCiAKIHN0YXRpYyB2b2lkIGZsdXNoX21vZHVsZV9pY2Fj
aGUoY29uc3Qgc3RydWN0IG1vZHVsZSAqbW9kKQogewotCW1tX3NlZ21lbnRfdCBvbGRfZnM7Ci0K
LQkvKiBmbHVzaCB0aGUgaWNhY2hlIGluIGNvcnJlY3QgY29udGV4dCAqLwotCW9sZF9mcyA9IGdl
dF9mcygpOwotCXNldF9mcyhLRVJORUxfRFMpOwotCiAJLyoKIAkgKiBGbHVzaCB0aGUgaW5zdHJ1
Y3Rpb24gY2FjaGUsIHNpbmNlIHdlJ3ZlIHBsYXllZCB3aXRoIHRleHQuCiAJICogRG8gaXQgYmVm
b3JlIHByb2Nlc3Npbmcgb2YgbW9kdWxlIHBhcmFtZXRlcnMsIHNvIHRoZSBtb2R1bGUKQEAgLTMz
MjksOCArMzMyMyw2IEBAIHN0YXRpYyB2b2lkIGZsdXNoX21vZHVsZV9pY2FjaGUoY29uc3Qgc3Ry
dWN0IG1vZHVsZSAqbW9kKQogCQkJCSAgICsgbW9kLT5pbml0X2xheW91dC5zaXplKTsKIAlmbHVz
aF9pY2FjaGVfcmFuZ2UoKHVuc2lnbmVkIGxvbmcpbW9kLT5jb3JlX2xheW91dC5iYXNlLAogCQkJ
ICAgKHVuc2lnbmVkIGxvbmcpbW9kLT5jb3JlX2xheW91dC5iYXNlICsgbW9kLT5jb3JlX2xheW91
dC5zaXplKTsKLQotCXNldF9mcyhvbGRfZnMpOwogfQogCiBpbnQgX193ZWFrIG1vZHVsZV9mcm9i
X2FyY2hfc2VjdGlvbnMoRWxmX0VoZHIgKmhkciwKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
