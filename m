Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 39B5C1CD2ED
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7775720594;
	Mon, 11 May 2020 09:41:29 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 326E820AD3
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7/gXVwxfQCALl/htOL9nGBBdk9CR2DqbWyS3c9DzJzg=; b=TvxbsuwUX/hm6+Z8fi/17h3sCr
 V6hTHGgSMnPIXClp9WBd4xHpkact4TdSPlY40kgpTlFrc4X0TcbVrodeZch2eF33X40QtPmPFET1U
 Tys5kVImtNbCnWZn12idX8lvZh32iDnfxIDeXhSFPGHn0PMIm30TD0pbjnUShEADOadDDfLCmcKnm
 wKfgOhNBY1n/ICaPIfQgdGgBtYZHWT6fzJbX2O0Ol1Icyt3JJoleMMbRsBA4C7Ht6DLkc7DlYLbcX
 cjmyou6JXKISuiamP88TvDgJ4S2xixwnMizgAVSPuwNbaVDo6GTG7tK/YFq90voaly/1rUW1zB1cS
 ecEzX6Qw==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgno-0007lE-9T; Sun, 10 May 2020 07:55:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:39 +0200
Message-Id: <20200510075510.987823-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] sort out the flush_icache_range mess
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

SGkgYWxsLAoKZmx1c2hfaWNhY2hlX3JhbmdlIGlzIG1vc3RseSB1c2VkIGZvciBrZXJuZWwgYWRk
cmVzcywgZXhjZXB0IGZvciB0aGUgZm9sbG93aW5nCmNhc2VzOgoKIC0gdGhlIG5vbW11IGJyayBh
bmQgbW1hcCBpbXBsZW1lbnRhdGlvbnMsCiAtIHRoZSByZWFkX2NvZGUgaGVscGVyIHRoYXQgaXMg
b25seSB1c2VkIGZvciBiaW5mbXRfZmxhdCwgYmluZm10X2VsZl9mZHBpYywKICAgYW5kIGJpbmZt
dF9hb3V0IGluY2x1ZGluZyB0aGUgYnJva2VuIGlhMzIgY29tcGF0IHZlcnNpb24KIC0gYmluZm10
X2ZsYXQgaXRzZWxmLAoKbm9uZSBvZiB3aGljaCByZWFsbHkgYXJlIHVzZWQgYnkgYSB0eXBpY2Fs
IE1NVSBlbmFibGVkIGtlcm5lbCwgYXMgYS5vdXQgY2FuCm9ubHkgYmUgYnVpbGQgZm9yIGFscGhh
IGFuZCBtNjhrIHRvIHN0YXJ0IHdpdGguCgpCdXQgc3RyYW5nZWx5IGVub3VnaCBjb21taXQgYWU5
MmVmOGE0NDI0ICgiUEFUQ0hdIGZsdXNoIGljYWNoZSBpbiBjb3JyZWN0CmNvbnRleHQiKSBhZGRl
ZCBhICJzZXRfZnMoS0VSTkVMX0RTKSIgYXJvdW5kIHRoZSBmbHVzaF9pY2FjaGVfcmFuZ2UgY2Fs
bAppbiB0aGUgbW9kdWxlIGxvYWRlciwgYmVjYXVzZSBhcHBhcmVudGx5IG02OGsgYXNzdW1lZCB1
c2VyIHBvaW50ZXJzLgoKVGhpcyBzZXJpZXMgZmlyc3QgY2xlYW5zIHVwIHRoZSBjYWNoZWZsdXNo
IGltcGxlbWVudGF0aW9ucywgbGFyZ2VseSBieQpzd2l0Y2hpbmcgYXMgbXVjaCBhcyBwb3NzaWJs
ZSB0byB0aGUgYXNtLWdlbmVyaWMgdmVyc2lvbiBhZnRlciBhIGZldwpwcmVwYXJhdGlvbnMsIHRo
ZW4gbW92ZXMgdGhlIG1pc25hbWVkIGN1cnJlbnQgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgdG8K
YSBuZXcgbmFtZSwgdG8gZmluYWxseSBpbnRyb2R1Y2UgYSByZWFsIGZsdXNoX2ljYWNoZV91c2Vy
X3JhbmdlIHRvIGJlIHVzZWQKZm9yIHRoZSBhYm92ZSB1c2UgY2FzZXMgdG8gZmx1c2ggdGhlIGlu
c3RydWN0aW9uIGNhY2hlIGZvciBhIHVzZXJzcGFjZQphZGRyZXNzIHJhbmdlLiAgVGhlIGxhc3Qg
cGF0Y2ggdGhlbiBkcm9wcyB0aGUgc2V0X2ZzIGluIHRoZSBtb2R1bGUgY29kZQphbmQgbW92ZXMg
aXQgaW50byB0aGUgbTY4ayBpbXBsZW1lbnRhdGlvbi4KCkEgZ2l0IHRyZWUgaXMgYXZhaWxhYmxl
IGhlcmU6CgogICAgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGZs
dXNoX2ljYWNoZV9yYW5nZQoKR2l0d2ViOgoKICAgIGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91
c2Vycy9oY2gvbWlzYy5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9mbHVzaF9pY2FjaGVfcmFuZ2UK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
