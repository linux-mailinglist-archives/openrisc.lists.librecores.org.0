Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7544A1CD2E9
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3CF3220B61;
	Mon, 11 May 2020 09:41:28 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by mail.librecores.org (Postfix) with ESMTPS id 9590D202DD
 for <openrisc@lists.librecores.org>; Thu,  7 May 2020 18:13:10 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047G4OvV160549; Thu, 7 May 2020 12:12:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30vmp6jc3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 12:12:41 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 047G5fk6165277;
 Thu, 7 May 2020 12:12:40 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30vmp6jc2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 12:12:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047G9kSs025490;
 Thu, 7 May 2020 16:12:38 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 30s0g5unrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 16:12:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047GCZYR1048834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 May 2020 16:12:35 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA52442041;
 Thu,  7 May 2020 16:12:35 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DFA142047;
 Thu,  7 May 2020 16:12:21 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.201.211])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  7 May 2020 16:12:20 +0000 (GMT)
Date: Thu, 7 May 2020 19:11:55 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20200507161155.GE683243@linux.ibm.com>
References: <20200414153455.21744-1-rppt@kernel.org>
 <20200414153455.21744-3-rppt@kernel.org>
 <CGME20200507121658eucas1p240cf4a3e0fe5c22dda5ec4f72734149f@eucas1p2.samsung.com>
 <39ba8a04-d6b5-649d-c289-0c8b27cb66c5@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39ba8a04-d6b5-649d-c289-0c8b27cb66c5@samsung.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_10:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=1 malwarescore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070125
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: Re: [OpenRISC] [PATCH v4 02/14] arm: add support for folded p4d
 page tables
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, Brian Cain <bcain@codeaurora.org>,
 linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGksCgpPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAwMjoxNjo1NlBNICswMjAwLCBNYXJlayBTenlw
cm93c2tpIHdyb3RlOgo+IEhpCj4gCj4gT24gMTQuMDQuMjAyMCAxNzozNCwgTWlrZSBSYXBvcG9y
dCB3cm90ZToKPiA+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+
Cj4gPiBJbXBsZW1lbnQgcHJpbWl0aXZlcyBuZWNlc3NhcnkgZm9yIHRoZSA0dGggbGV2ZWwgZm9s
ZGluZywgYWRkIHdhbGtzIG9mIHA0ZAo+ID4gbGV2ZWwgd2hlcmUgYXBwcm9wcmlhdGUsIGFuZCBy
ZW1vdmUgX19BUkNIX1VTRV81TEVWRUxfSEFDSy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVG9kYXkgSSd2ZSBub3RpY2VkIHRo
YXQga2V4ZWMgaXMgYnJva2VuIG9uIEFSTSAzMmJpdC4gQmlzZWN0aW5nIGJldHdlZW4gCj4gY3Vy
cmVudCBsaW51eC1uZXh0IGFuZCB2NS43LXJjMSBwb2ludGVkIHRvIHRoaXMgY29tbWl0LiBJJ3Zl
IHRlc3RlZCB0aGlzIAo+IG9uIE9kcm9pZCBYVTQgYW5kIFJhc3BiZXJyeSBQaTQgYm9hcmRzLiBI
ZXJlIGlzIHRoZSByZWxldmFudCBsb2c6Cj4gCj4gIyBrZXhlYyAtLWtleGVjLXN5c2NhbGwgLWwg
ekltYWdlIC0tYXBwZW5kICIkKGNhdCAvcHJvYy9jbWRsaW5lKSIKPiBtZW1vcnlfcmFuZ2VbMF06
MHg0MDAwMDAwMC4uMHhiZTlmZmZmZgo+IG1lbW9yeV9yYW5nZVswXToweDQwMDAwMDAwLi4weGJl
OWZmZmZmCj4gIyBrZXhlYyAtZQo+IGtleGVjX2NvcmU6IFN0YXJ0aW5nIG5ldyBrZXJuZWwKPiA4
PC0tLSBjdXQgaGVyZSAtLS0KPiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVz
dCBhdCB2aXJ0dWFsIGFkZHJlc3MgYzAxMGYxZjQKPiBwZ2QgPSBjNjgxNzc5Mwo+IFtjMDEwZjFm
NF0gKnBnZD00MDAwMDQxZShiYWQpCj4gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDgwZCBbIzFdIFBS
RUVNUFQgQVJNCj4gTW9kdWxlcyBsaW5rZWQgaW46Cj4gQ1BVOiAwIFBJRDogMTMyOSBDb21tOiBr
ZXhlYyBUYWludGVkOiBHwqDCoMKgwqDCoMKgwqAgVyAKPiA1LjcuMC1yYzMtMDAxMjctZzZjYmE4
MWVkMGY2MiAjNjExCj4gSGFyZHdhcmUgbmFtZTogU2Ftc3VuZyBFeHlub3MgKEZsYXR0ZW5lZCBE
ZXZpY2UgVHJlZSkKPiBQQyBpcyBhdCBtYWNoaW5lX2tleGVjKzB4NDAvMHhmYwoKQW55IGNoYW5j
ZSB5b3UgaGF2ZSB0aGUgZGVidWcgaW5mbyBpbiB0aGlzIGtlcm5lbD8Kc2NyaXB0cy9mYWRkcjJs
aW5lIHdvdWxkIGNvbWUgaGFuZHkgaGVyZS4KCj4gTFIgaXMgYXQgMHhmZmZmZmZmZgo+IHBjIDog
WzxjMDEwZjBiND5dwqDCoMKgIGxyIDogWzxmZmZmZmZmZj5dwqDCoMKgIHBzcjogNjAwMDAwMTMK
PiBzcCA6IGViYzEzZTYwwqAgaXAgOiA0MDAwODAwMMKgIGZwIDogMDAwMDAwMDEKPiByMTA6IDAw
MDAwMDU4wqAgcjkgOiBmZWUxZGVhZMKgIHI4IDogMDAwMDAwMDEKPiByNyA6IGMxMjEzODdjwqAg
cjYgOiA2YzIyNDAwMMKgIHI1IDogZWNlNDBjMDDCoCByNCA6IGVjMjIyMDAwCj4gcjMgOiBjMDEw
ZjFmNMKgIHIyIDogYzExMDAwMDDCoCByMSA6IGMxMTAwMDAwwqAgcjAgOiA0MThkMDAwMAo+IEZs
YWdzOiBuWkN2wqAgSVJRcyBvbsKgIEZJUXMgb27CoCBNb2RlIFNWQ18zMsKgIElTQSBBUk3CoCBT
ZWdtZW50IG5vbmUKPiBDb250cm9sOiAxMGM1Mzg3ZMKgIFRhYmxlOiA2YmMxNDA1OcKgIERBQzog
MDAwMDAwNTEKPiBQcm9jZXNzIGtleGVjIChwaWQ6IDEzMjksIHN0YWNrIGxpbWl0ID0gMHgzNjZi
YjRkYykKPiBTdGFjazogKDB4ZWJjMTNlNjAgdG8gMHhlYmMxNDAwMCkKPiAuLi4KPiBbPGMwMTBm
MGI0Pl0gKG1hY2hpbmVfa2V4ZWMpIGZyb20gWzxjMDFjMGQ4ND5dIChrZXJuZWxfa2V4ZWMrMHg3
NC8weDdjKQo+IFs8YzAxYzBkODQ+XSAoa2VybmVsX2tleGVjKSBmcm9tIFs8YzAxNGIxYmM+XSAo
X19kb19zeXNfcmVib290KzB4MWY4LzB4MjEwKQo+IFs8YzAxNGIxYmM+XSAoX19kb19zeXNfcmVi
b290KSBmcm9tIFs8YzAxMDAwNjA+XSAocmV0X2Zhc3Rfc3lzY2FsbCsweDAvMHgyOCkKPiBFeGNl
cHRpb24gc3RhY2soMHhlYmMxM2ZhOCB0byAweGViYzEzZmYwKQo+IC4uLgo+IC0tLVsgZW5kIHRy
YWNlIDNlOGQ2YzgxNzIzYzc3OGQgXS0tLQo+IDEzMjkgU2VnbWVudGF0aW9uIGZhdWx0wqDCoMKg
wqDCoCAuL2tleGVjIC1lCj4gCj4gPiAtLS0KPiA+ICAgYXJjaC9hcm0vaW5jbHVkZS9hc20vcGd0
YWJsZS5oICAgICB8ICAxIC0KPiA+ICAgYXJjaC9hcm0vbGliL3VhY2Nlc3Nfd2l0aF9tZW1jcHku
YyB8ICA3ICsrKysrLQo+ID4gICBhcmNoL2FybS9tYWNoLXNhMTEwMC9hc3NhYmV0LmMgICAgIHwg
IDIgKy0KPiA+ICAgYXJjaC9hcm0vbW0vZHVtcC5jICAgICAgICAgICAgICAgICB8IDI5ICsrKysr
KysrKysrKysrKysrLS0tLS0KPiA+ICAgYXJjaC9hcm0vbW0vZmF1bHQtYXJtdi5jICAgICAgICAg
ICB8ICA3ICsrKysrLQo+ID4gICBhcmNoL2FybS9tbS9mYXVsdC5jICAgICAgICAgICAgICAgIHwg
MjIgKysrKysrKysrKy0tLS0tLQo+ID4gICBhcmNoL2FybS9tbS9pZG1hcC5jICAgICAgICAgICAg
ICAgIHwgIDMgKystCj4gPiAgIGFyY2gvYXJtL21tL2luaXQuYyAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ID4gICBhcmNoL2FybS9tbS9pb3JlbWFwLmMgICAgICAgICAgICAgIHwgMTIgKysrKysr
LS0tCj4gPiAgIGFyY2gvYXJtL21tL21tLmggICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ID4g
ICBhcmNoL2FybS9tbS9tbXUuYyAgICAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysr
KysrKysrLS0tLS0KPiA+ICAgYXJjaC9hcm0vbW0vcGdkLmMgICAgICAgICAgICAgICAgICB8IDQw
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4gICAxMiBmaWxlcyBjaGFuZ2VkLCAx
MjUgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4gPgo+ID4gLi4uCj4gCj4gQmVzdCBy
ZWdhcmRzCj4gLS0gCj4gTWFyZWsgU3p5cHJvd3NraSwgUGhECj4gU2Ftc3VuZyBSJkQgSW5zdGl0
dXRlIFBvbGFuZAo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
