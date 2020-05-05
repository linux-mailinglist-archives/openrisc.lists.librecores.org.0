Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 850901CD2E6
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 68B8F20B5B;
	Mon, 11 May 2020 09:41:27 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by mail.librecores.org (Postfix) with ESMTPS id CDB0D2074B
 for <openrisc@lists.librecores.org>; Tue,  5 May 2020 15:45:53 +0200 (CEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045DXHZa093672; Tue, 5 May 2020 09:45:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4xkq6ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 09:45:16 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 045DXe7I096863;
 Tue, 5 May 2020 09:45:15 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4xkq6p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 09:45:15 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 045DeldF015466;
 Tue, 5 May 2020 13:45:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 30s0g62uum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 13:45:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 045Dj81t60293214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 13:45:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D05111C054;
 Tue,  5 May 2020 13:45:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2ECC11C058;
 Tue,  5 May 2020 13:45:03 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.204.113])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  5 May 2020 13:45:03 +0000 (GMT)
Date: Tue, 5 May 2020 16:45:01 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20200505134501.GI342687@linux.ibm.com>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net>
 <20200503184300.GA154219@roeck-us.net>
 <20200504153901.GM14260@kernel.org>
 <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_08:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050105
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: Re: [OpenRISC] [PATCH v2 17/20] mm: free_area_init: allow defining
 max_zone_pfn in descending order
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
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Hoan Tran <Hoan@os.amperecomputing.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Nick Hu <nickhu@andestech.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 Brian Cain <bcain@codeaurora.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMDUsIDIwMjAgYXQgMDY6MTg6MTFBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiBPbiA1LzQvMjAgODozOSBBTSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+IE9uIFN1
biwgTWF5IDAzLCAyMDIwIGF0IDExOjQzOjAwQU0gLTA3MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6
Cj4gPj4gT24gU3VuLCBNYXkgMDMsIDIwMjAgYXQgMTA6NDE6MzhBTSAtMDcwMCwgR3VlbnRlciBS
b2VjayB3cm90ZToKPiA+Pj4gSGksCj4gPj4+Cj4gPj4+IE9uIFdlZCwgQXByIDI5LCAyMDIwIGF0
IDAzOjExOjIzUE0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPj4+PiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPj4+Pgo+ID4+Pj4gU29tZSBhcmNoaXRl
Y3R1cmVzIChlLmcuIEFSQykgaGF2ZSB0aGUgWk9ORV9ISUdITUVNIHpvbmUgYmVsb3cgdGhlCj4g
Pj4+PiBaT05FX05PUk1BTC4gQWxsb3dpbmcgZnJlZV9hcmVhX2luaXQoKSBwYXJzZSBtYXhfem9u
ZV9wZm4gYXJyYXkgZXZlbiBpdCBpcwo+ID4+Pj4gc29ydGVkIGluIGRlc2NlbmRpbmcgb3JkZXIg
YWxsb3dzIHVzaW5nIGZyZWVfYXJlYV9pbml0KCkgb24gc3VjaAo+ID4+Pj4gYXJjaGl0ZWN0dXJl
cy4KPiA+Pj4+Cj4gPj4+PiBBZGQgdG9wIC0+IGRvd24gdHJhdmVyc2FsIG9mIG1heF96b25lX3Bm
biBhcnJheSBpbiBmcmVlX2FyZWFfaW5pdCgpIGFuZCB1c2UKPiA+Pj4+IHRoZSBsYXR0ZXIgaW4g
QVJDIG5vZGUvem9uZSBpbml0aWFsaXphdGlvbi4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPj4+Cj4gPj4+IFRoaXMgcGF0
Y2ggY2F1c2VzIG15IG1pY3JvYmxhemVlbCBxZW11IGJvb3QgdGVzdCBpbiBsaW51eC1uZXh0IHRv
IGZhaWwuCj4gPj4+IFJldmVydGluZyBpdCBmaXhlcyB0aGUgcHJvYmxlbS4KPiA+Pj4KPiA+PiBU
aGUgc2FtZSBwcm9ibGVtIGlzIHNlZW4gd2l0aCBzMzkwIGVtdWxhdGlvbnMuCj4gPiAKPiA+IFll
YWgsIHRoaXMgcGF0Y2ggYnJlYWtzIHNvbWUgb3RoZXJzIGFzIHdlbGwgOigKPiA+IAo+ID4gTXkg
YXNzdW1wdGlvbiB0aGF0IG1heF96b25lX3BmbiBkZWZpbmVzIGFyY2hpdGVjdHVyYWwgbGltaXQg
Zm9yIG1heGltYWwKPiA+IFBGTiB0aGF0IGNhbiBiZWxvbmcgdG8gYSB6b25lIHdhcyBvdmVyLW9w
dGltaXN0aWMuIFNldmVyYWwgYXJjaGVzCj4gPiBhY3R1YWxseSBkbyB0aGF0LCBidXQgb3RoZXJz
IGRvCj4gPiAKPiA+IAltYXhfem9uZV9wZm5bWk9ORV9ETUFdID0gTUFYX0RNQV9QRk47Cj4gPiAJ
bWF4X3pvbmVfcGZuW1pPTkVfTk9STUFMXSA9IG1heF9wZm47Cj4gPiAKPiA+IHdoZXJlIE1BWF9E
TUFfUEZOIGlzIGJ1aWxkLXRpbWUgY29uc3RyYWluIGFuZCBtYXhfcGZuIGlzIHJ1biB0aW1lIGxp
bWl0Cj4gPiBmb3IgdGhlIGN1cnJlbnQgc3lzdGVtLgo+ID4gCj4gPiBTbywgd2hlbiBtYXhfcGZu
IGlzIGxvd2VyIHRoYW4gTUFYX0RNQV9QRk4sIHRoZSBmcmVlX2luaXRfYXJlYSgpIHdpbGwKPiA+
IGNvbnNpZGVyIG1heF96b25lX3BmbiBhcyBkZXNjZW5kaW5nIGFuZCB3aWxsIHdyb25nbHkgY2Fs
Y3VsYXRlIHpvbmUKPiA+IGV4dGVudHMuCj4gPiAKPiA+IFRoYXQgc2FpZCwgaW5zdGVhZCBvZiB0
cnlpbmcgdG8gY3JlYXRlIGEgZ2VuZXJpYyB3YXkgdG8gc3BlY2lhbCBjYXNlCj4gPiBBUkMsIEkg
c3VnZ2VzdCB0byBzaW1wbHkgdXNlIHRoZSBiZWxvdyBwYXRjaCBpbnN0ZWFkLgo+ID4gCj4gCj4g
QXMgYSByZW1pbmRlciwgSSByZXBvcnRlZCB0aGUgcHJvYmxlbSBhZ2FpbnN0IHMzOTAgYW5kIG1p
Y3JvYmxhemVlbAo+IChpbnRlcmVzdGluZ2x5IGVub3VnaCwgbWljcm9ibGF6ZSAoYmlnIGVuZGlh
bikgd29ya3MpLCBub3QgYWdhaW5zdCBhcmMuCgpXaXRoIHRoaXMgZml4IG1pY3JvYmxhemVlbCBh
bmQgczM5MCB3b3JrZWQgZm9yIG1lIGFuZCBhbHNvIENocmlzdGlhbiBoYWQKcmVwb3J0ZWQgdGhh
dCBzMzkwIGlzIGZpeGVkLgoKbWljcm9ibGF6ZSAoYmlnIGVuZGlhbikgd29ya3MgYmVjYXVzZSBp
dHMgZGVmY29uZmlnIGRvZXMgbm90IGVuYWJsZSBISUdITUVNCndoaWxlIGxpdHRsZSBlbmRpYW4g
ZG9lcy4KCkFSQyBpcyBtZW50aW9uZWQgYmVjYXVzZSBpdCBpcyB0aGUgb25seSBhcmNoIHRoYXQg
bWF5IGhhdmUgWk9ORV9ISUdITUVNCmFuZCBaT05FX05PUk1BTCBhbmQgdGhpcyBwYXRjaCB3YXMg
cmVxdWlyZWQgdG8gY29uc29saWRhdGUKZnJlZV9hcmVhX2luaXQqIHZhcmlhbnRzLgoKPiBHdWVu
dGVyCj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMvbW0vaW5pdC5jIGIvYXJjaC9hcmMvbW0v
aW5pdC5jCj4gPiBpbmRleCA0MWViOWJlMTY1M2MuLjM4Njk1OWJhYzNkMiAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvYXJjL21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9hcmMvbW0vaW5pdC5jCj4gPiBA
QCAtNzcsNiArNzcsMTEgQEAgdm9pZCBfX2luaXQgZWFybHlfaW5pdF9kdF9hZGRfbWVtb3J5X2Fy
Y2godTY0IGJhc2UsIHU2NCBzaXplKQo+ID4gIAkJYmFzZSwgVE9fTUIoc2l6ZSksICFpbl91c2Ug
PyAiTm90IHVzZWQiOiIiKTsKPiA+ICB9Cj4gPiAgCj4gPiArYm9vbCBhcmNoX2hhc19kZXNjZW5k
aW5nX21heF96b25lX3BmbnModm9pZCkKPiA+ICt7Cj4gPiArCXJldHVybiB0cnVlOwo+ID4gK30K
PiA+ICsKPiA+ICAvKgo+ID4gICAqIEZpcnN0IG1lbW9yeSBzZXR1cCByb3V0aW5lIGNhbGxlZCBm
cm9tIHNldHVwX2FyY2goKQo+ID4gICAqIDEuIHNldHVwIHN3YXBwZXIncyBtbSBAaW5pdF9tbQo+
ID4gZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwo+ID4gaW5k
ZXggYjk5MGU5NzM0NDc0Li4xMTRmMGUwMjcxNDQgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9wYWdlX2Fs
bG9jLmMKPiA+ICsrKyBiL21tL3BhZ2VfYWxsb2MuYwo+ID4gQEAgLTczMDcsNiArNzMwNywxNSBA
QCBzdGF0aWMgdm9pZCBjaGVja19mb3JfbWVtb3J5KHBnX2RhdGFfdCAqcGdkYXQsIGludCBuaWQp
Cj4gPiAgCX0KPiA+ICB9Cj4gPiAgCj4gPiArLyoKPiA+ICsgKiBTb21lIGFyY2hpdGVjdHVycywg
ZS5nLiBBUkMgbWF5IGhhdmUgWk9ORV9ISUdITUVNIGJlbG93IFpPTkVfTk9STUFMLiBGb3IKPiA+
ICsgKiBzdWNoIGNhc2VzIHdlIGFsbG93IG1heF96b25lX3BmbiBzb3J0ZWQgaW4gdGhlIGRlc2Nl
bmRpbmcgb3JkZXIKPiA+ICsgKi8KPiA+ICtib29sIF9fd2VhayBhcmNoX2hhc19kZXNjZW5kaW5n
X21heF96b25lX3BmbnModm9pZCkKPiA+ICt7Cj4gPiArCXJldHVybiBmYWxzZTsKPiA+ICt9Cj4g
PiArCj4gPiAgLyoqCj4gPiAgICogZnJlZV9hcmVhX2luaXQgLSBJbml0aWFsaXNlIGFsbCBwZ19k
YXRhX3QgYW5kIHpvbmUgZGF0YQo+ID4gICAqIEBtYXhfem9uZV9wZm46IGFuIGFycmF5IG9mIG1h
eCBQRk5zIGZvciBlYWNoIHpvbmUKPiA+IEBAIC03MzI0LDcgKzczMzMsNyBAQCB2b2lkIF9faW5p
dCBmcmVlX2FyZWFfaW5pdCh1bnNpZ25lZCBsb25nICptYXhfem9uZV9wZm4pCj4gPiAgewo+ID4g
IAl1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKPiA+ICAJaW50IGksIG5pZCwgem9u
ZTsKPiA+IC0JYm9vbCBkZXNjZW5kaW5nID0gZmFsc2U7Cj4gPiArCWJvb2wgZGVzY2VuZGluZzsK
PiA+ICAKPiA+ICAJLyogUmVjb3JkIHdoZXJlIHRoZSB6b25lIGJvdW5kYXJpZXMgYXJlICovCj4g
PiAgCW1lbXNldChhcmNoX3pvbmVfbG93ZXN0X3Bvc3NpYmxlX3BmbiwgMCwKPiA+IEBAIC03MzMz
LDE0ICs3MzQyLDcgQEAgdm9pZCBfX2luaXQgZnJlZV9hcmVhX2luaXQodW5zaWduZWQgbG9uZyAq
bWF4X3pvbmVfcGZuKQo+ID4gIAkJCQlzaXplb2YoYXJjaF96b25lX2hpZ2hlc3RfcG9zc2libGVf
cGZuKSk7Cj4gPiAgCj4gPiAgCXN0YXJ0X3BmbiA9IGZpbmRfbWluX3Bmbl93aXRoX2FjdGl2ZV9y
ZWdpb25zKCk7Cj4gPiAtCj4gPiAtCS8qCj4gPiAtCSAqIFNvbWUgYXJjaGl0ZWN0dXJzLCBlLmcu
IEFSQyBtYXkgaGF2ZSBaT05FX0hJR0hNRU0gYmVsb3cKPiA+IC0JICogWk9ORV9OT1JNQUwuIEZv
ciBzdWNoIGNhc2VzIHdlIGFsbG93IG1heF96b25lX3BmbiBzb3J0ZWQgaW4gdGhlCj4gPiAtCSAq
IGRlc2NlbmRpbmcgb3JkZXIKPiA+IC0JICovCj4gPiAtCWlmIChNQVhfTlJfWk9ORVMgPiAxICYm
IG1heF96b25lX3BmblswXSA+IG1heF96b25lX3BmblsxXSkKPiA+IC0JCWRlc2NlbmRpbmcgPSB0
cnVlOwo+ID4gKwlkZXNjZW5kaW5nID0gYXJjaF9oYXNfZGVzY2VuZGluZ19tYXhfem9uZV9wZm5z
KCk7Cj4gPiAgCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBNQVhfTlJfWk9ORVM7IGkrKykgewo+ID4g
IAkJaWYgKGRlc2NlbmRpbmcpCj4gPiAKPiA+PiBHdWVudGVyCj4gPj4KPiA+Pj4gcWVtdSBjb21t
YW5kIGxpbmU6Cj4gPj4+Cj4gPj4+IHFlbXUtc3lzdGVtLW1pY3JvYmxhemVlbCAtTSBwZXRhbG9n
aXgtbWw2MDUgLW0gMjU2IFwKPiA+Pj4gCS1rZXJuZWwgYXJjaC9taWNyb2JsYXplL2Jvb3QvbGlu
dXguYmluIC1uby1yZWJvb3QgXAo+ID4+PiAJLWluaXRyZCByb290ZnMuY3BpbyBcCj4gPj4+IAkt
YXBwZW5kICdwYW5pYz0tMSBzbHViX2RlYnVnPUZaUFVBIHJkaW5pdD0vc2Jpbi9pbml0IGNvbnNv
bGU9dHR5UzAsMTE1MjAwJyBcCj4gPj4+IAktbW9uaXRvciBub25lIC1zZXJpYWwgc3RkaW8gLW5v
Z3JhcGhpYwo+ID4+Pgo+ID4+PiBpbml0cmQ6Cj4gPj4+IAlodHRwczovL2dpdGh1Yi5jb20vZ3Jv
ZWNrL2xpbnV4LWJ1aWxkLXRlc3QvYmxvYi9tYXN0ZXIvcm9vdGZzL21pY3JvYmxhemVlbC9yb290
ZnMuY3Bpby5nego+ID4+PiBjb25maWd1cmF0aW9uOgo+ID4+PiAJaHR0cHM6Ly9naXRodWIuY29t
L2dyb2Vjay9saW51eC1idWlsZC10ZXN0L2Jsb2IvbWFzdGVyL3Jvb3Rmcy9taWNyb2JsYXplZWwv
cWVtdV9taWNyb2JsYXplZWxfbWw2MDVfZGVmY29uZmlnCj4gPj4+Cj4gPj4+IEJpc2VjdCBsb2cg
aXMgYmVsb3cuCj4gPj4+Cj4gPj4+IEd1ZW50ZXIKPiA+Pj4KPiA+Pj4gLS0tCj4gPj4+ICMgYmFk
OiBbZmI5ZDY3MGY1N2UzZjY0Nzg2MDIzMjhiYmJmNzExMzhiZTA2Y2E0Zl0gQWRkIGxpbnV4LW5l
eHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIwMjAwNTAxCj4gPj4+ICMgZ29vZDogWzZhOGI1NWVkNDA1
NmVhNTU1OWViZTRmNmE0YjI0N2Y2Mjc4NzBkNGNdIExpbnV4IDUuNy1yYzMKPiA+Pj4gZ2l0IGJp
c2VjdCBzdGFydCAnSEVBRCcgJ3Y1LjctcmMzJwo+ID4+PiAjIGdvb2Q6IFswNjhiODBiNjhhNjcw
ZjBiMTcyODhjOGEzZDFlZTc1MWYzNTE2MmFiXSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNo
ICdkcm0vZHJtLW5leHQnCj4gPj4+IGdpdCBiaXNlY3QgZ29vZCAwNjhiODBiNjhhNjcwZjBiMTcy
ODhjOGEzZDFlZTc1MWYzNTE2MmFiCj4gPj4+ICMgZ29vZDogWzQ2YzcwZmM2YTNhYzM1Y2Q3MmRk
YWQyNDhkY2JlNGVlZTcxNmQyYTVdIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ2RyaXZl
cnMteDg2L2Zvci1uZXh0Jwo+ID4+PiBnaXQgYmlzZWN0IGdvb2QgNDZjNzBmYzZhM2FjMzVjZDcy
ZGRhZDI0OGRjYmU0ZWVlNzE2ZDJhNQo+ID4+PiAjIGdvb2Q6IFtmMzljNGFkNDc5YTJmMDA1Zjk3
MmEyYjk0MWI0MGVmYTZiOWM5MzQ5XSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdycG1z
Zy9mb3ItbmV4dCcKPiA+Pj4gZ2l0IGJpc2VjdCBnb29kIGYzOWM0YWQ0NzlhMmYwMDVmOTcyYTJi
OTQxYjQwZWZhNmI5YzkzNDkKPiA+Pj4gIyBiYWQ6IFsxNjVkM2VlMDE2MmZlMjhlZmMyYzgxODAx
NzY2MzNlMzM1MTVkZjE1XSBpcGMtY29udmVydC1pcGNzX2lkci10by14YXJyYXktdXBkYXRlCj4g
Pj4+IGdpdCBiaXNlY3QgYmFkIDE2NWQzZWUwMTYyZmUyOGVmYzJjODE4MDE3NjYzM2UzMzUxNWRm
MTUKPiA+Pj4gIyBnb29kOiBbMDAxZjFkMjExZWQyZWQwZjAwNTgzOGRjNDM5MDk5MzkzMGJiYmQ2
OV0gbW06IHJlbW92ZSBlYXJseV9wZm5faW5fbmlkKCkgYW5kIENPTkZJR19OT0RFU19TUEFOX09U
SEVSX05PREVTCj4gPj4+IGdpdCBiaXNlY3QgZ29vZCAwMDFmMWQyMTFlZDJlZDBmMDA1ODM4ZGM0
MzkwOTkzOTMwYmJiZDY5Cj4gPj4+ICMgYmFkOiBbYWFhZDc0MDFiZDMyZjEwYzFkNTkxZGQ4ODZi
M2E5Yjk1OTVjNmQ3N10gbW0vdm1zYW46IGZpeCBzb21lIHR5cG9zIGluIGNvbW1lbnQKPiA+Pj4g
Z2l0IGJpc2VjdCBiYWQgYWFhZDc0MDFiZDMyZjEwYzFkNTkxZGQ4ODZiM2E5Yjk1OTVjNmQ3Nwo+
ID4+PiAjIGJhZDogWzA5ZjlkMGFiMWZiZWQ4NTYyM2IyODM5OTVhYTdhN2Q3OGRhYTE2MTFdIGto
dWdlcGFnZWQ6IGFsbG93IHRvIGNvbGxhcHNlIFBURS1tYXBwZWQgY29tcG91bmQgcGFnZXMKPiA+
Pj4gZ2l0IGJpc2VjdCBiYWQgMDlmOWQwYWIxZmJlZDg1NjIzYjI4Mzk5NWFhN2E3ZDc4ZGFhMTYx
MQo+ID4+PiAjIGJhZDogW2M5NDJmYzhhM2U1MDg4NDA3YmMzMmQ5NGY1NTRiYWIyMDUxNzVmOGFd
IG1tL3Ztc3RhdC5jOiBkbyBub3Qgc2hvdyBsb3dtZW0gcmVzZXJ2ZSBwcm90ZWN0aW9uIGluZm9y
bWF0aW9uIG9mIGVtcHR5IHpvbmUKPiA+Pj4gZ2l0IGJpc2VjdCBiYWQgYzk0MmZjOGEzZTUwODg0
MDdiYzMyZDk0ZjU1NGJhYjIwNTE3NWY4YQo+ID4+PiAjIGJhZDogW2IyOTM1OGQyNjlhY2UzODI2
ZDg1MjFiZWE4NDJmYzI5ODRjZmMxMWJdIG1tL3BhZ2VfYWxsb2MuYzogcmVuYW1lIGZyZWVfcGFn
ZXNfY2hlY2soKSB0byBjaGVja19mcmVlX3BhZ2UoKQo+ID4+PiBnaXQgYmlzZWN0IGJhZCBiMjkz
NThkMjY5YWNlMzgyNmQ4NTIxYmVhODQyZmMyOTg0Y2ZjMTFiCj4gPj4+ICMgYmFkOiBbYmUwZmI1
OTFhMWYxZGYyMGEwMGM4ZjAyM2Y5Y2E0ODkxZjE3N2IwZF0gbW06IHNpbXBsaWZ5IGZpbmRfbWlu
X3Bmbl93aXRoX2FjdGl2ZV9yZWdpb25zKCkKPiA+Pj4gZ2l0IGJpc2VjdCBiYWQgYmUwZmI1OTFh
MWYxZGYyMGEwMGM4ZjAyM2Y5Y2E0ODkxZjE3N2IwZAo+ID4+PiAjIGJhZDogW2MxNzQyMmEwMDhk
MzZkY2YzZTlmNTE0Njk3NThjNTc2MjcxNmNiMGFdIG1tOiByZW5hbWUgZnJlZV9hcmVhX2luaXRf
bm9kZSgpIHRvIGZyZWVfYXJlYV9pbml0X21lbW9yeWxlc3Nfbm9kZSgpCj4gPj4+IGdpdCBiaXNl
Y3QgYmFkIGMxNzQyMmEwMDhkMzZkY2YzZTlmNTE0Njk3NThjNTc2MjcxNmNiMGEKPiA+Pj4gIyBi
YWQ6IFs1MWEyZjY0NGZkMDIwZDVmMDkwMDQ0ODI1YzM4ODQ0NGQxMTAyOWQ1XSBtbTogZnJlZV9h
cmVhX2luaXQ6IGFsbG93IGRlZmluaW5nIG1heF96b25lX3BmbiBpbiBkZXNjZW5kaW5nIG9yZGVy
Cj4gPj4+IGdpdCBiaXNlY3QgYmFkIDUxYTJmNjQ0ZmQwMjBkNWYwOTAwNDQ4MjVjMzg4NDQ0ZDEx
MDI5ZDUKPiA+Pj4gIyBmaXJzdCBiYWQgY29tbWl0OiBbNTFhMmY2NDRmZDAyMGQ1ZjA5MDA0NDgy
NWMzODg0NDRkMTEwMjlkNV0gbW06IGZyZWVfYXJlYV9pbml0OiBhbGxvdyBkZWZpbmluZyBtYXhf
em9uZV9wZm4gaW4gZGVzY2VuZGluZyBvcmRlcgo+ID4gCj4gCgotLSAKU2luY2VyZWx5IHlvdXJz
LApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
