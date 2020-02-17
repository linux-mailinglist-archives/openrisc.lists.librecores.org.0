Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE81163139
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1C3FC20993;
	Tue, 18 Feb 2020 21:00:37 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 8CF8B207F7
 for <openrisc@lists.librecores.org>; Mon, 17 Feb 2020 07:24:00 +0100 (CET)
Received: from hump (unknown [87.71.56.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A24120718;
 Mon, 17 Feb 2020 06:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581920638;
 bh=/x16WuB9ipweEdbRODxI3vPb27s/qMR9LxZj9eSXNFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJdZTvPNP7YeXjSuzPzV/mVObPxfKwGHjQ8p+ZHMpTmRtHHC4KJ+V+9rVhTjyc//R
 yxkqqla61U/GzHYInQ60SIgL3AIru2SOxlhJ63F/uuX7uFtPbBAVrgP2PtOiwMtu2+
 8lDq6YKKg11ilpAZTu8jTZrVhQnL/nAs55Me23Y8=
Date: Mon, 17 Feb 2020 08:23:44 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Message-ID: <20200217062344.GA4729@hump>
References: <20200216081843.28670-1-rppt@kernel.org>
 <20200216082230.GV25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216082230.GV25745@shell.armlinux.org.uk>
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:15 +0100
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

T24gU3VuLCBGZWIgMTYsIDIwMjAgYXQgMDg6MjI6MzBBTSArMDAwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFN1biwgRmViIDE2LCAyMDIwIGF0IDEwOjE4OjMw
QU0gKzAyMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxy
cHB0QGxpbnV4LmlibS5jb20+Cj4gPiAKPiA+IEhpLAo+ID4gCj4gPiBUaGVzZSBwYXRjaGVzIGNv
bnZlcnQgc2V2ZXJhbCBhcmNoaXRlY3R1cmVzIHRvIHVzZSBwYWdlIHRhYmxlIGZvbGRpbmcgYW5k
Cj4gPiByZW1vdmUgX19BUkNIX0hBU181TEVWRUxfSEFDSyBhbG9uZyB3aXRoIGluY2x1ZGUvYXNt
LWdlbmVyaWMvNWxldmVsLWZpeHVwLmguCj4gPiAKPiA+IFRoZSBjaGFuZ2VzIGFyZSBtb3N0bHkg
YWJvdXQgbWVjaGFuaWNhbCByZXBsYWNlbWVudCBvZiBwZ2QgYWNjZXNzb3JzIHdpdGggcDRkCj4g
PiBvbmVzIGFuZCB0aGUgYWRkaXRpb24gb2YgaGlnaGVyIGxldmVscyB0byBwYWdlIHRhYmxlIHRy
YXZlcnNhbHMuCj4gPiAKPiA+IEFsbCB0aGUgcGF0Y2hlcyB3ZXJlIHNlbnQgc2VwYXJhdGVseSB0
byB0aGUgcmVzcGVjdGl2ZSBhcmNoIGxpc3RzIGFuZAo+ID4gbWFpbnRhaW5lcnMgaGVuY2UgdGhl
ICJ2MiIgcHJlZml4Lgo+IAo+IFlvdSBmYWlsIHRvIGV4cGxhaW4gd2h5IHRoaXMgY2hhbmdlIHdo
aWNoIGFkZHMgNDg4IGFkZGl0aW9uYWwgbGluZXMgb2YKPiBjb2RlIGlzIGRlc2lyYWJsZS4KClJp
Z2h0LCBJIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBleHBsaWNpdCBhYm91dCBpdC4KCkFzIENocmlz
dG9waGUgbWVudGlvbmVkIGluIGhpcyByZXBseSwgcmVtb3ZpbmcgJ0hBQ0snIGFuZCAnZml4dXAn
IGlzIGFuCmltcHJvdmVtZW50LgpBbm90aGVyIHRoaW5nIGlzIHRoYXQgd2hlbiBhbGwgYXJjaGl0
ZWN0dXJlcyBiZWhhdmUgdGhlIHNhbWUgaXQgb3BlbnMKb3Bwb3J0dW5pdGllcyBmb3IgY2xlYW5p
bmcgdXAgcmVwZWF0aW5nIGRlZmluaXRpb25zIG9mIHBhZ2UgdGFibGUKbWFuaXB1bGF0aW9uIHBy
aW1pdGl2ZXMuCgogCj4gLS0gCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1s
aW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1p
bGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKPiBB
Y2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCgotLSAK
U2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
