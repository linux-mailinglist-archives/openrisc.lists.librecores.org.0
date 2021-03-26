Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A355534B0DF
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 45DE220D49;
	Fri, 26 Mar 2021 21:52:19 +0100 (CET)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mail.librecores.org (Postfix) with ESMTPS id EBE842129C
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 15:08:29 +0100 (CET)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F6P2d6PvWz1ryY1;
 Fri, 26 Mar 2021 15:08:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F6P2d4qBqz1qqwS;
 Fri, 26 Mar 2021 15:08:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id onoyYkV_BZHU; Fri, 26 Mar 2021 15:08:24 +0100 (CET)
X-Auth-Info: OEvAU2bUcvvTBFMfvWGLhYIW4WQnHRDFk1cZLlSNZz300DmBDLQfVXreztynDrlR
Received: from igel.home (ppp-46-244-160-134.dynamic.mnet-online.de
 [46.244.160.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 26 Mar 2021 15:08:24 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 998042C35E3; Fri, 26 Mar 2021 15:08:22 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
X-Yow: I'd like some JUNK FOOD...  and then I want to be ALONE --
Date: Fri, 26 Mar 2021 15:08:22 +0100
In-Reply-To: <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Fri, 26 Mar 2021 13:44:58 +0000
 (UTC)")
Message-ID: <87zgyqdn3d.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: Re: [OpenRISC] [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, danielwa@cisco.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTcOkciAyNiAyMDIxLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiBp
bmRleCBmOGYxNTMzMmNhYTIuLmU3YzkxZWU0NzhkMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IEBAIC0y
MCw2ICsyMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9zbXAuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2VmaS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
Y21kbGluZS5oPgo+ICAKPiAgI2luY2x1ZGUgPGFzbS9jcHVfb3BzLmg+Cj4gICNpbmNsdWRlIDxh
c20vZWFybHlfaW9yZW1hcC5oPgo+IEBAIC0yMjgsMTAgKzIyOSw4IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBwYXJzZV9kdGIodm9pZCkKPiAgCX0KPiAgCj4gIAlwcl9lcnIoIk5vIERUQiBwYXNzZWQg
dG8gdGhlIGtlcm5lbFxuIik7Cj4gLSNpZmRlZiBDT05GSUdfQ01ETElORV9GT1JDRQo+IC0Jc3Ry
bGNweShib290X2NvbW1hbmRfbGluZSwgQ09ORklHX0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpF
KTsKPiArCWNtZGxpbmVfYnVpbGQoYm9vdF9jb21tYW5kX2xpbmUsIE5VTEwsIENPTU1BTkRfTElO
RV9TSVpFKTsKPiAgCXByX2luZm8oIkZvcmNpbmcga2VybmVsIGNvbW1hbmQgbGluZSB0bzogJXNc
biIsIGJvb3RfY29tbWFuZF9saW5lKTsKClNob3VsZG4ndCB0aGF0IG1lc3NhZ2UgYmVjb21lIGNv
bmRpdGlvbmFsIGluIHNvbWUgd2F5PwoKQW5kcmVhcy4KCi0tIApBbmRyZWFzIFNjaHdhYiwgc2No
d2FiQGxpbnV4LW02OGsub3JnCkdQRyBLZXkgZmluZ2VycHJpbnQgPSA3NTc4IEVCNDcgRDRFNSA0
RDY5IDI1MTAgIDI1NTIgREY3MyBFNzgwIEE5REEgQUVDMQoiQW5kIG5vdyBmb3Igc29tZXRoaW5n
IGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
