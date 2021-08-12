Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDDF3EA4CF
	for <lists+openrisc@lfdr.de>; Thu, 12 Aug 2021 14:42:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 012B424086;
	Thu, 12 Aug 2021 14:42:16 +0200 (CEST)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 9700423FD6
 for <openrisc@lists.librecores.org>; Thu, 12 Aug 2021 14:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xC/TZD3ZIXMs1cMiTUUAC6x6j656qE6poOPOz0bbgp4=; b=BIIYYrXJ3Ew+Z1Zm5diqSi/De
 z9wV3zfjmSLaZp7CLzV+GZVzZq7gHn4aYTS+otHAxBF57P3sG+08JwSPBCdCFZWJ+W/a7Uq2nG6dR
 Ha2YFBjZclMZJYIiXKlQ1gLB8ZCdS8B9uEW3WbpCbGK0H/IdQLdkF8gVEx0au/w4sNkwsnJxOlaJN
 3F0T/x1fYsMd3E4PDbHDx53iR0C3e0RKKbXsP6YegqA39Ad4vclW52rD2Iu/mHbjVJqRpkjlhVtux
 jBq7gk1O4Rj655JZe+cFH0MNa946zYFR94AnA24dA5R1E6RDmcUCiw2sBMgZdt0NLZen6d2vGXuXM
 pATOPCJUw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47224)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mEA24-0002Bw-KA; Thu, 12 Aug 2021 13:42:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mEA1l-00049N-O0; Thu, 12 Aug 2021 13:41:41 +0100
Date: Thu, 12 Aug 2021 13:41:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <20210812124141.GY22278@shell.armlinux.org.uk>
References: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [OpenRISC] [PATCH -next] trap: Cleanup trap_init()
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Walmsley <palmerdabbelt@google.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMTIsIDIwMjEgYXQgMDg6MzY6MDJQTSArMDgwMCwgS2VmZW5nIFdhbmcgd3Jv
dGU6Cj4gVGhlcmUgYXJlIHNvbWUgZW1wdHkgdHJhcF9pbml0KCkgaW4gZGlmZmVyZW50IEFSQ0hz
LCBpbnRyb2R1Y2UKPiBhIG5ldyB3ZWFrIHRyYXBfaW5pdCgpIGZ1bmN0aW9uIHRvIGNsZWFudXAg
dGhlbS4KPiAKPiBDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAa2VybmVsLm9yZz4KPiBDYzogUnVz
c2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gQ2M6IFlvc2hpbm9yaSBTYXRvIDx5
c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4KPiBDYzogTGV5IEZvb24gVGFuIDxsZXkuZm9vbi50
YW5AaW50ZWwuY29tPgo+IENjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+Cj4gQ2M6
IFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4K
PiBDYzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gQ2M6IEphbWVzIEUuSi4g
Qm90dG9tbGV5IDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgo+IENjOiBI
ZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+Cj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBl
bGxlcm1hbi5pZC5hdT4KPiBDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwu
Y3Jhc2hpbmcub3JnPgo+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiBD
YzogUGF1bCBXYWxtc2xleSA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+IENjOiBKZWZmIERp
a2UgPGpkaWtlQGFkZHRvaXQuY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0Pgo+IENjOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5j
b20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKRm9y
IDMyLWJpdCBhcm06CgpBY2tlZC1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVs
QGFybWxpbnV4Lm9yZy51az4KClRoYW5rcyEKCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBz
Oi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA0
ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
