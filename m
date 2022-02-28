Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B69384C690B
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:57:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D55E24898;
	Mon, 28 Feb 2022 11:57:48 +0100 (CET)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 6676024849
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DM3iere1mz4IiAwYCVyOTU3E+xuCTYR85Md0nHyvzDc=; b=QSz7tR2zlZoaBSWZGCaio7Oilq
 VwpNbxcqDPOH5Kt8OjbQhKwhks/heDAW4JFpmDfExgUTPmIf+TJ10GIXRaXS+m7eIwuh+Zrmg7ard
 JKb4cBAyp9suGksD5aOyDCbwX+GG/5CmBp/gJRuLB3YTEup0rKS6dKesQIWN1THmbCdg+fDs9npwW
 3G62kcQtbbdR93/Yp8xWQeqnioTzargs6Wc3dgV6A9bObOsm+8HNJnnVTRueD5kTaHC4WKRDrKhk3
 sYEtwY/WuFW1YR5ryQKZcakT/DA1fRo7nFdF8mglYtoE5o2X2pzfPHjvtIcfU/vD9UYjeVFBIOfpb
 OWrBs5aQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57554)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nOdiU-00087R-Ua; Mon, 28 Feb 2022 10:57:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nOdiQ-00064t-9z; Mon, 28 Feb 2022 10:57:18 +0000
Date: Mon, 28 Feb 2022 10:57:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
Subject: Re: [OpenRISC] [PATCH V3 09/30] arm/mm: Enable
 ARCH_HAS_VM_GET_PAGE_PROT
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
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMDQ6MTc6MzJQTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cj4gVGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMg
Y3VzdG9tIHZtX2dldF9wYWdlX3Byb3QoKSB2aWEKPiBzdWJzY3JpYmluZyBBUkNIX0hBU19WTV9H
RVRfUEFHRV9QUk9ULiBTdWJzZXF1ZW50bHkgYWxsIF9fU1hYWCBhbmQgX19QWFhYCj4gbWFjcm9z
IGNhbiBiZSBkcm9wcGVkIHdoaWNoIGFyZSBubyBsb25nZXIgbmVlZGVkLgoKV2hhdCBJIHdvdWxk
IHJlYWxseSBsaWtlIHRvIGtub3cgaXMgd2h5IGhhdmluZyB0byBydW4gX2NvZGVfIHRvIHdvcmsg
b3V0CndoYXQgdGhlIHBhZ2UgcHJvdGVjdGlvbnMgbmVlZCB0byBiZSBpcyBiZXR0ZXIgdGhhbiBs
b29raW5nIGl0IHVwIGluIGEKdGFibGUuCgpOb3Qgb25seSBpcyB0aGlzIG1vcmUgZXhwZW5zaXZl
IGluIHRlcm1zIG9mIENQVSBjeWNsZXMsIGl0IGFsc28gYnJpbmdzCmFkZGl0aW9uYWwgY29kZSBz
aXplIHdpdGggaXQuCgpJJ20gc3RydWdnbGluZyB0byBzZWUgd2hhdCB0aGUgYmVuZWZpdCBpcy4K
Ci0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZl
bG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA0ME1icHMgZG93biAxME1icHMgdXAuIERlY2Vu
dCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
