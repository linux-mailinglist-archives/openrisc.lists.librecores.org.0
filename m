Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 635D3EAEA5
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9979620761;
	Thu, 31 Oct 2019 12:21:20 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 330F1201D2
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:48:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kvC81MLJ/qmd5AYuvebxpfEasbMc4g+6Jnsgdy2EELA=; b=t6NZJy/IMV5UPsFQNtfhwUj8F
 8Q4nhTVw4pCbXJchYaUZbNMx/7XoXiFNcH3MfSe37YfdiS7CV3nVelwKOyhyBpGP/G7VPMfnUJ/Yu
 M07Gr4NAg/tt8UJEX+wUXB4PfEjTcMpNpfGunJA/FmdfiA83RYCAXeKi1isD1X/c2fFB3L/M8Awfo
 +b4OWtqfeh9MJBwpCROvrTh2onnJKDk+ErnD8Q8KIh3IQMRVEpkBCvEo1Bru+W05+tCttQ9DxH5Dq
 q/irlXlhdaNYgTMeBhtFkthBc7UTXMdD1fYSwUdtTxpSe1p954StmN62lCC8Dfc5teOMVvx5dtJfH
 NB62onpNA==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLIz-0003J0-DZ; Tue, 29 Oct 2019 06:48:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:13 +0100
Message-Id: <20191029064834.23438-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] generic ioremap (and lots of cleanups) v3
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

SGkgYWxsLAoKdGhlIGxhc3QgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBhZGQgYSBnZW5lcmljIGlv
cmVtYXAgaW1wbGVtZW50YXRpb24sCmFuZCBzd2l0Y2ggb3VyIDMgbW9zdCByZWNlbnQgYW5kIHRo
dXMgbW9zdCB0aWR5IGFyY2hpdGV0dXJlIHBvcnRzIG92ZXIKdG8gdXNlIGl0LiAgV2l0aCBhIGxp
dHRsZSB3b3JrIGFuZCBhbiBhZGRpdGlvbmFsIGFyY2ggaG9vayBvciB0d28gdGhlCmltcGxlbWVu
dGF0aW9uIHNob3VsZCBiZSBhYmxlIHRvIGV2ZW50dWFsbHkgY292ZXIgbW9yZSB0aGFuIGhhbGYg
b2YKb3VyIHBvcnRzLgoKVGhlIHBhdGNoZXMgYmVmb3JlIHRoYXQgY2xlYW4gdXAgdmFyaW91cyBs
b3NlIGVuZHMgaW4gdGhlIGlvcmVtYXAKYW5kIGlvdW5tYXAgaW1wbGVtZW50YXRpb25zLgoKTm90
ZSB0aGF0IHRoZXJlIGlzIG5vIGdvb2QgdHJlZSB0aGlzIHdvdWxkIGZpdCwgd2hpY2ggbWVhbnMg
SSdkIHNldCB1cAphIHRyZWUgdG8gaXQgdG8gTGludXMgdW5sZXNzIHNvbWVvbmUgaGFzIGEgYmV0
dGVyIGlkZWEuCgpBIGdpdCB0cmVlIGlzIGFsc28gYXZhaWxhYmxlIGhlcmU6CgogICAgZ2l0Oi8v
Z2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGdlbmVyaWMtaW9yZW1hcAoKR2l0
d2ViOgoKICAgIGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQvc2hv
cnRsb2cvcmVmcy9oZWFkcy9nZW5lcmljLWlvcmVtYXAKCkNoYW5nZXMgc2luY2UgdjI6CiAtIGZp
eCB2YXJpb3VzIHR5cG9zCiAtIG1vdmUgdGhlIG02OGsgX19mcmVlX2lvX2FyZWEgYXJvdW5kIGlu
c3RlYWQgb2YgaW50cm9kdWNpbmcgYSBmb3J3YXJkCiAgIGRlY2xhcmF0aW9uCgpDaGFuZ2VzIHNp
bmNlIHYxOgogLSBkcm9wcGVkIHZhcmlvdXMgcGF0Y2hlcyBhbHJlYWR5IG1lcmdlZAogLSBrZWVw
IHRoZSBwYXJ0cyBvZiB0aGUgcGFyaXNjIEVJU0EgaGFjayB0aGF0IGFyZSBzdGlsbCBuZWVkZWQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
