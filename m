Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A25381CD2EE
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9B1262088E;
	Mon, 11 May 2020 09:41:30 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 039EF20A39
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3tS2yoYzMrg0UOZvWJ9XhJh/dvXLnNSqXxggBe17EKo=; b=WXL6M2CDigCoTrrOTQbYj3cAL8
 E3deOWdrOEf/MvabJAGLRmta3cWNWwpUQLs9O9xPQTtKR/zny74Qqodf5q0i+dtZQurd7PprMP02Z
 zCH+GTfTy8/EdSdq0QXQphF2VrBTPB2QC+j/W5SBqTyJfjF4Ir7yViug7OoflVJe01E5mkja6Zolt
 CDsmE1SOYiKE5y3yZTdhBjekedUaYvAaMvsWqPMmtfn/Rk0vH+dbLKa5ocleIqEB79TyGBfS64OjP
 bRL1ISrh+zpzxAAawzcuf8lAmCNy3FMHgbJZrBMAp7jiYeGkwYsrNMVSSM7ORDs4kqkCf9ABdjlfh
 PSvEFN7g==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgnv-0007po-1j; Sun, 10 May 2020 07:55:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:41 +0200
Message-Id: <20200510075510.987823-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 02/31] arm64: fix the flush_icache_range
 arguments in machine_kexec
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

VGhlIHNlY29uZCBhcmd1bWVudCBpcyB0aGUgZW5kICJwb2ludGVyIiwgbm90IHRoZSBsZW5ndGgu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNo
L2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWMu
YyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWMuYwppbmRleCA4ZTljOTI0NDIzYjRl
Li5hMGIxNDRjZmFlYTcxIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tl
eGVjLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlYy5jCkBAIC0xNzcsNiAr
MTc3LDcgQEAgdm9pZCBtYWNoaW5lX2tleGVjKHN0cnVjdCBraW1hZ2UgKmtpbWFnZSkKIAkgKiB0
aGUgb2ZmbGluZSBDUFVzLiBUaGVyZWZvcmUsIHdlIG11c3QgdXNlIHRoZSBfXyogdmFyaWFudCBo
ZXJlLgogCSAqLwogCV9fZmx1c2hfaWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpcmVib290X2NvZGVf
YnVmZmVyLAorCQkJICAgICAodWludHB0cl90KXJlYm9vdF9jb2RlX2J1ZmZlciArCiAJCQkgICAg
IGFybTY0X3JlbG9jYXRlX25ld19rZXJuZWxfc2l6ZSk7CiAKIAkvKiBGbHVzaCB0aGUga2ltYWdl
IGxpc3QgYW5kIGl0cyBidWZmZXJzLiAqLwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
