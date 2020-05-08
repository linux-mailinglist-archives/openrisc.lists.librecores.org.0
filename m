Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 501211CD2EB
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A2F1520B65;
	Mon, 11 May 2020 09:41:28 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by mail.librecores.org (Postfix) with ESMTPS id B559920AF2
 for <openrisc@lists.librecores.org>; Fri,  8 May 2020 19:43:13 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 048HZWAC120545; Fri, 8 May 2020 13:42:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30vtveutta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 May 2020 13:42:43 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 048HaDP7122403;
 Fri, 8 May 2020 13:42:42 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30vtveutsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 May 2020 13:42:42 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 048HeoYq020104;
 Fri, 8 May 2020 17:42:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 30s0g5wvbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 May 2020 17:42:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 048HgbZm43712600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 May 2020 17:42:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBCB542041;
 Fri,  8 May 2020 17:42:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EED54203F;
 Fri,  8 May 2020 17:42:34 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.202.219])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 May 2020 17:42:34 +0000 (GMT)
Date: Fri, 8 May 2020 20:42:32 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20200508174232.GA759899@linux.ibm.com>
References: <20200414153455.21744-1-rppt@kernel.org>
 <20200414153455.21744-3-rppt@kernel.org>
 <CGME20200507121658eucas1p240cf4a3e0fe5c22dda5ec4f72734149f@eucas1p2.samsung.com>
 <39ba8a04-d6b5-649d-c289-0c8b27cb66c5@samsung.com>
 <20200507161155.GE683243@linux.ibm.com>
 <98229ab1-fbf8-0a89-c5d6-270c828799e7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98229ab1-fbf8-0a89-c5d6-270c828799e7@samsung.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-08_15:2020-05-08,
 2020-05-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=1 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080144
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

T24gRnJpLCBNYXkgMDgsIDIwMjAgYXQgMDg6NTM6MjdBTSArMDIwMCwgTWFyZWsgU3p5cHJvd3Nr
aSB3cm90ZToKPiBIaSBNaWtlLAo+IAo+IE9uIDA3LjA1LjIwMjAgMTg6MTEsIE1pa2UgUmFwb3Bv
cnQgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAwMjoxNjo1NlBNICswMjAwLCBN
YXJlayBTenlwcm93c2tpIHdyb3RlOgo+ID4+IE9uIDE0LjA0LjIwMjAgMTc6MzQsIE1pa2UgUmFw
b3BvcnQgd3JvdGU6Cj4gPj4+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNv
bT4KPiA+Pj4KPiA+Pj4gSW1wbGVtZW50IHByaW1pdGl2ZXMgbmVjZXNzYXJ5IGZvciB0aGUgNHRo
IGxldmVsIGZvbGRpbmcsIGFkZCB3YWxrcyBvZiBwNGQKPiA+Pj4gbGV2ZWwgd2hlcmUgYXBwcm9w
cmlhdGUsIGFuZCByZW1vdmUgX19BUkNIX1VTRV81TEVWRUxfSEFDSy4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4+IFRvZGF5
IEkndmUgbm90aWNlZCB0aGF0IGtleGVjIGlzIGJyb2tlbiBvbiBBUk0gMzJiaXQuIEJpc2VjdGlu
ZyBiZXR3ZWVuCj4gPj4gY3VycmVudCBsaW51eC1uZXh0IGFuZCB2NS43LXJjMSBwb2ludGVkIHRv
IHRoaXMgY29tbWl0LiBJJ3ZlIHRlc3RlZCB0aGlzCj4gPj4gb24gT2Ryb2lkIFhVNCBhbmQgUmFz
cGJlcnJ5IFBpNCBib2FyZHMuIEhlcmUgaXMgdGhlIHJlbGV2YW50IGxvZzoKPiA+Pgo+ID4+ICMg
a2V4ZWMgLS1rZXhlYy1zeXNjYWxsIC1sIHpJbWFnZSAtLWFwcGVuZCAiJChjYXQgL3Byb2MvY21k
bGluZSkiCj4gPj4gbWVtb3J5X3JhbmdlWzBdOjB4NDAwMDAwMDAuLjB4YmU5ZmZmZmYKPiA+PiBt
ZW1vcnlfcmFuZ2VbMF06MHg0MDAwMDAwMC4uMHhiZTlmZmZmZgo+ID4+ICMga2V4ZWMgLWUKPiA+
PiBrZXhlY19jb3JlOiBTdGFydGluZyBuZXcga2VybmVsCj4gPj4gODwtLS0gY3V0IGhlcmUgLS0t
Cj4gPj4gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBh
ZGRyZXNzIGMwMTBmMWY0Cj4gPj4gcGdkID0gYzY4MTc3OTMKPiA+PiBbYzAxMGYxZjRdICpwZ2Q9
NDAwMDA0MWUoYmFkKQo+ID4+IEludGVybmFsIGVycm9yOiBPb3BzOiA4MGQgWyMxXSBQUkVFTVBU
IEFSTQo+ID4+IE1vZHVsZXMgbGlua2VkIGluOgo+ID4+IENQVTogMCBQSUQ6IDEzMjkgQ29tbTog
a2V4ZWMgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgIFcKPiA+PiA1LjcuMC1yYzMtMDAxMjctZzZj
YmE4MWVkMGY2MiAjNjExCj4gPj4gSGFyZHdhcmUgbmFtZTogU2Ftc3VuZyBFeHlub3MgKEZsYXR0
ZW5lZCBEZXZpY2UgVHJlZSkKPiA+PiBQQyBpcyBhdCBtYWNoaW5lX2tleGVjKzB4NDAvMHhmYwo+
ID4gQW55IGNoYW5jZSB5b3UgaGF2ZSB0aGUgZGVidWcgaW5mbyBpbiB0aGlzIGtlcm5lbD8KPiA+
IHNjcmlwdHMvZmFkZHIybGluZSB3b3VsZCBjb21lIGhhbmR5IGhlcmUuCj4gCj4gIyAuL3Njcmlw
dHMvZmFkZHIybGluZSAtLWxpc3Qgdm1saW51eCBtYWNoaW5lX2tleGVjKzB4NDAKPiBtYWNoaW5l
X2tleGVjKzB4NDAvMHhmODoKPiAKPiBtYWNoaW5lX2tleGVjIGF0IGFyY2gvYXJtL2tlcm5lbC9t
YWNoaW5lX2tleGVjLmM6MTgyCj4gIMKgMTc3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWJvb3Rf
Y29kZV9idWZmZXIgPSAKPiBwYWdlX2FkZHJlc3MoaW1hZ2UtPmNvbnRyb2xfY29kZV9wYWdlKTsK
PiAgwqAxNzgKPiAgwqAxNznCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFByZXBhcmUgcGFyYW1l
dGVycyBmb3IgcmVib290X2NvZGVfYnVmZmVyKi8KPiAgwqAxODDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNldF9rZXJuZWxfdGV4dF9ydygpOwo+ICDCoDE4McKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
a2V4ZWNfc3RhcnRfYWRkcmVzcyA9IGltYWdlLT5zdGFydDsKPiAgPjE4MjzCoMKgwqDCoMKgwqDC
oMKgwqDCoCBrZXhlY19pbmRpcmVjdGlvbl9wYWdlID0gcGFnZV9saXN0Owo+ICDCoDE4M8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAga2V4ZWNfbWFjaF90eXBlID0gbWFjaGluZV9hcmNoX3R5cGU7Cj4g
IMKgMTg0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZXhlY19ib290X2F0YWdzID0gaW1hZ2UtPmFy
Y2gua2VybmVsX3IyOwo+ICDCoDE4NQo+ICDCoDE4NsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
Y29weSBvdXIga2VybmVsIHJlbG9jYXRpb24gY29kZSB0byB0aGUgY29udHJvbCBjb2RlIAo+IHBh
Z2UgKi8KPiAgwqAxODfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYm9vdF9lbnRyeSA9IGZuY3B5
KHJlYm9vdF9jb2RlX2J1ZmZlciwKCkNhbiB5b3UgcGxlYXNlIHRyeSB0aGUgcGF0Y2ggYmVsb3c6
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vaW5pdC5jIGIvYXJjaC9hcm0vbW0vaW5pdC5jCmlu
ZGV4IDk2M2I1Mjg0ZDI4NC4uZjg2YjNkMTc5MjhlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tbS9p
bml0LmMKKysrIGIvYXJjaC9hcm0vbW0vaW5pdC5jCkBAIC01NzEsNyArNTcxLDcgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHNlY3Rpb25fdXBkYXRlKHVuc2lnbmVkIGxvbmcgYWRkciwgcG1kdmFsX3Qg
bWFzaywKIHsKIAlwbWRfdCAqcG1kOwogCi0JcG1kID0gcG1kX29mZl9rKGFkZHIpOworCXBtZCA9
IHBtZF9vZmZzZXQocHVkX29mZnNldChwNGRfb2Zmc2V0KHBnZF9vZmZzZXQobW0sIGFkZHIpLCBh
ZGRyKSwgYWRkciksIGFkZHIpOwogCiAjaWZkZWYgQ09ORklHX0FSTV9MUEFFCiAJcG1kWzBdID0g
X19wbWQoKHBtZF92YWwocG1kWzBdKSAmIG1hc2spIHwgcHJvdCk7Cgo+ICA+IC4uLgo+IAo+IEJl
c3QgcmVnYXJkcwo+IC0tIAo+IE1hcmVrIFN6eXByb3dza2ksIFBoRAo+IFNhbXN1bmcgUiZEIElu
c3RpdHV0ZSBQb2xhbmQKPiAKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
