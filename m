Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DF1421D1FF6
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 899E8202FD;
	Wed, 13 May 2020 22:17:34 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by mail.librecores.org (Postfix) with ESMTPS id 11190202DD
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 16:15:58 +0200 (CEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDXD0a161500; Mon, 11 May 2020 10:15:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wrvrxy12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 10:15:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04BEB2Gc003182;
 Mon, 11 May 2020 14:15:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 30wm55mhcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 14:15:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04BEFg6J62193780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 14:15:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E49024204B;
 Mon, 11 May 2020 14:15:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C160C42045;
 Mon, 11 May 2020 14:15:38 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.203.187])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 11 May 2020 14:15:38 +0000 (GMT)
Date: Mon, 11 May 2020 17:15:36 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200511141536.GB983798@linux.ibm.com>
References: <20200414153455.21744-1-rppt@kernel.org>
 <20200414153455.21744-3-rppt@kernel.org>
 <CGME20200507121658eucas1p240cf4a3e0fe5c22dda5ec4f72734149f@eucas1p2.samsung.com>
 <39ba8a04-d6b5-649d-c289-0c8b27cb66c5@samsung.com>
 <20200507161155.GE683243@linux.ibm.com>
 <98229ab1-fbf8-0a89-c5d6-270c828799e7@samsung.com>
 <20200508174232.GA759899@linux.ibm.com>
 <665dade8-727a-3318-6779-3998080da18f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <665dade8-727a-3318-6779-3998080da18f@samsung.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_05:2020-05-11,
 2020-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=1 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110112
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
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
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTWFyZWssCgpPbiBNb24sIE1heSAxMSwgMjAyMCBhdCAwODozNjo0MUFNICswMjAwLCBNYXJl
ayBTenlwcm93c2tpIHdyb3RlOgo+IEhpIE1pa2UsCj4gCj4gT24gMDguMDUuMjAyMCAxOTo0Miwg
TWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDA4LCAyMDIwIGF0IDA4OjUzOjI3
QU0gKzAyMDAsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4gPj4gT24gMDcuMDUuMjAyMCAxODox
MSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+Pj4gT24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMDI6
MTY6NTZQTSArMDIwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiA+Pj4+IE9uIDE0LjA0LjIw
MjAgMTc6MzQsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPj4+Pj4gRnJvbTogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4+Pj4+Cj4gPj4+Pj4gSW1wbGVtZW50IHByaW1pdGl2
ZXMgbmVjZXNzYXJ5IGZvciB0aGUgNHRoIGxldmVsIGZvbGRpbmcsIGFkZCB3YWxrcyBvZiBwNGQK
PiA+Pj4+PiBsZXZlbCB3aGVyZSBhcHByb3ByaWF0ZSwgYW5kIHJlbW92ZSBfX0FSQ0hfVVNFXzVM
RVZFTF9IQUNLLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8
cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gQ2FuIHlvdSBwbGVhc2UgdHJ5IHRoZSBwYXRjaCBiZWxv
dzoKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vaW5pdC5jIGIvYXJjaC9hcm0vbW0v
aW5pdC5jCj4gPiBpbmRleCA5NjNiNTI4NGQyODQuLmY4NmIzZDE3OTI4ZSAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvYXJtL21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9hcm0vbW0vaW5pdC5jCj4gPiBA
QCAtNTcxLDcgKzU3MSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZWN0aW9uX3VwZGF0ZSh1bnNp
Z25lZCBsb25nIGFkZHIsIHBtZHZhbF90IG1hc2ssCj4gPiAgIHsKPiA+ICAgCXBtZF90ICpwbWQ7
Cj4gPiAgIAo+ID4gLQlwbWQgPSBwbWRfb2ZmX2soYWRkcik7Cj4gPiArCXBtZCA9IHBtZF9vZmZz
ZXQocHVkX29mZnNldChwNGRfb2Zmc2V0KHBnZF9vZmZzZXQobW0sIGFkZHIpLCBhZGRyKSwgYWRk
ciksIGFkZHIpOwo+ID4gICAKPiA+ICAgI2lmZGVmIENPTkZJR19BUk1fTFBBRQo+ID4gICAJcG1k
WzBdID0gX19wbWQoKHBtZF92YWwocG1kWzBdKSAmIG1hc2spIHwgcHJvdCk7Cj4gVGhpcyBmaXhl
cyBrZXhlYyBpc3N1ZSEgVGhhbmtzIQo+IAo+IAo+IEZlZWwgZnJlZSB0byBhZGQ6Cj4gCj4gUmVw
b3J0ZWQtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiBG
aXhlczogMjE4ZjFjMzkwNTU3ICgiYXJtOiBhZGQgc3VwcG9ydCBmb3IgZm9sZGVkIHA0ZCBwYWdl
IHRhYmxlcyIpCj4gVGVzdGVkLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+CgpUaGFua3MgZm9yIHRlc3RpbmchCgpUaGUgcGF0Y2ggaXMgc3RpbGwgaW4gbW1v
dG0gdHJlZSwgc28gSSBkb24ndCB0aGluayAiRml4ZXMiIGFwcGx5LgoKQW5kcmV3LCB3b3VsZCB5
b3UgbGlrZSBtZSB0byBzZW5kIHRoZSBmaXggYXMgYSBmb3JtYWwgcGF0Y2ggb3Igd2lsbCBwaWNr
Cml0IHVwIGFzIGEgZml4dXA/Cgo+IEJlc3QgcmVnYXJkcwo+IC0tIAo+IE1hcmVrIFN6eXByb3dz
a2ksIFBoRAo+IFNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKPiAKCi0tIApTaW5jZXJlbHkg
eW91cnMsCk1pa2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
