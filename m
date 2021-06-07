Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DA20239D8CE
	for <lists+openrisc@lfdr.de>; Mon,  7 Jun 2021 11:31:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 18AE623E0C;
	Mon,  7 Jun 2021 11:31:41 +0200 (CEST)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 44CB720CDA
 for <openrisc@lists.librecores.org>; Mon,  7 Jun 2021 11:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MlvkgxFcyawWgLbaD1anFAhejhA4mPswAd0WEOPLbd0=; b=cetr6/k8ZHIlURSNkBDEkxOd3
 puNo+HwooQUeJn9AaPBl4regJ9NkcXwohGBb5OPUoX7XTTODh5d6IsuhC8Hnw3taLmVn0F8+4hF1o
 ArioCmyKCJRUZ5c5W9Ct8Cw0Zpb4xNWdK87xHBWnc3daFNyrTg9aLL7A/E6TbbFPNgdTXMtoLpPh1
 VNTboFgYQtPgYxGziLgboqSm+C9rc0zETM+h5ZE5kg+2kGPOkoZAIe8MZfd5JZNTDNazJFXr/S6Gm
 YDi+dqX3d1L4b71QKMOqk7jvcXPp8QSgQdX3C28GtCjdiTWKtuBWWAYuFwAi7GnVSCXRZB8Zx7iVW
 ALDutps2w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44784)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lqBbS-0000Eu-Fv; Mon, 07 Jun 2021 10:31:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lqBbN-0005oE-UB; Mon, 07 Jun 2021 10:31:21 +0100
Date: Mon, 7 Jun 2021 10:31:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20210607093121.GC22278@shell.armlinux.org.uk>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
 <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
 <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [OpenRISC] [PATCH v2 00/15] init_mm: cleanup ARCH's
 text/data/brk setup code
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdW4gMDcsIDIwMjEgYXQgMDc6NDg6NTRBTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiBIaSBLZWZlbmcsCj4gCj4gV2hhdCB5b3UgY291bGQgZG8gaXMgdG8gZGVmaW5l
IGEgX193ZWFrIGZ1bmN0aW9uIHRoYXQgYXJjaGl0ZWN0dXJlcyBjYW4KPiBvdmVycmlkZSBhbmQg
Y2FsbCB0aGF0IGZ1bmN0aW9uIGZyb20gbW1faW5pdCgpIGFzIHN1Z2dlc3RlZCBieSBNaWtlLAoK
VGhlIHByb2JsZW0gd2l0aCB3ZWFrIGZ1bmN0aW9ucyBpcyB0aGF0IHRoZXkgYmxvYXQgdGhlIGtl
cm5lbC4gRWFjaAp0aW1lIGEgd2VhayBmdW5jdGlvbiBpcyBvdmVycmlkZW4sIGl0IGJlY29tZXMg
ZGVhZCB1bnJlYWNoYWJsZSBjb2RlCndpdGhpbiB0aGUga2VybmVsIGltYWdlLgoKQXQgc29tZSBw
b2ludCB3ZSdyZSBwcm9iYWJpbHkgZ29pbmcgdG8gaGF2ZSB0byBlbmFibGUgLWZmdW5jdGlvbi1z
ZWN0aW9ucwp0byAoaG9wZWZ1bGx5KSBhbGxvdyB0aGUgZGVhZCBjb2RlIHRvIGJlIGRpc2NhcmRl
ZC4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9k
ZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA0ME1icHMgZG93biAxME1icHMgdXAuIERl
Y2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
