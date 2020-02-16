Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D260C163135
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8F095206A4;
	Tue, 18 Feb 2020 21:00:34 +0100 (CET)
Received: from pandora.armlinux.org.uk (unknown [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 0531620988
 for <openrisc@lists.librecores.org>; Sun, 16 Feb 2020 09:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8Uhu2wgUq8Ulq+yn7pGlyiEpl5L2cWMg1W6oSitXX8=; b=eZ+pxZ5QnjK4dWUII5qW9jbf8
 eHQaXZHQb+St/fNO4odIF1+oXNFmG9JyWOQyfNVp/YnjMm8+v9aiI+5lsbrKHrZZMx/nek8Kqd5TP
 2W8OtU17ICPE2UgLtdc9R5GSAIEv8D7oLBooYFlzt/1m+U1xt3Lrzg8xA2WrwUIRgXUZkmT5OSjiz
 v4iLBDbN3Jl9AzWwjfvTWiezYEvzjfDwRTq0N3FjcotV54dXrt1kPyxekt0I2b9RcgIp0XHoHzce1
 5fM/0Ipqg2sO442zcz74Ifmz05LfxOSewibl5FPqzdimV68xwJR331lGU1QToFVHsC5S11UIPKhv/
 xpuaPP69A==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41020)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j3FCS-0001uE-Q8; Sun, 16 Feb 2020 08:22:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j3FCA-0005C0-Sx; Sun, 16 Feb 2020 08:22:30 +0000
Date: Sun, 16 Feb 2020 08:22:30 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200216082230.GV25745@shell.armlinux.org.uk>
References: <20200216081843.28670-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216081843.28670-1-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:14 +0100
Subject: Re: [OpenRISC] [PATCH v2 00/13] mm: remove __ARCH_HAS_5LEVEL_HACK
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Marc Zyngier <maz@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBGZWIgMTYsIDIwMjAgYXQgMTA6MTg6MzBBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gSGks
Cj4gCj4gVGhlc2UgcGF0Y2hlcyBjb252ZXJ0IHNldmVyYWwgYXJjaGl0ZWN0dXJlcyB0byB1c2Ug
cGFnZSB0YWJsZSBmb2xkaW5nIGFuZAo+IHJlbW92ZSBfX0FSQ0hfSEFTXzVMRVZFTF9IQUNLIGFs
b25nIHdpdGggaW5jbHVkZS9hc20tZ2VuZXJpYy81bGV2ZWwtZml4dXAuaC4KPiAKPiBUaGUgY2hh
bmdlcyBhcmUgbW9zdGx5IGFib3V0IG1lY2hhbmljYWwgcmVwbGFjZW1lbnQgb2YgcGdkIGFjY2Vz
c29ycyB3aXRoIHA0ZAo+IG9uZXMgYW5kIHRoZSBhZGRpdGlvbiBvZiBoaWdoZXIgbGV2ZWxzIHRv
IHBhZ2UgdGFibGUgdHJhdmVyc2Fscy4KPiAKPiBBbGwgdGhlIHBhdGNoZXMgd2VyZSBzZW50IHNl
cGFyYXRlbHkgdG8gdGhlIHJlc3BlY3RpdmUgYXJjaCBsaXN0cyBhbmQKPiBtYWludGFpbmVycyBo
ZW5jZSB0aGUgInYyIiBwcmVmaXguCgpZb3UgZmFpbCB0byBleHBsYWluIHdoeSB0aGlzIGNoYW5n
ZSB3aGljaCBhZGRzIDQ4OCBhZGRpdGlvbmFsIGxpbmVzIG9mCmNvZGUgaXMgZGVzaXJhYmxlLgoK
LS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVs
b3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlh
OiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0
Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
