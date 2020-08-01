Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA1F2460A1
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D4D9D20E2D;
	Mon, 17 Aug 2020 10:45:49 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by mail.librecores.org (Postfix) with ESMTPS id 83F4F20CEE
 for <openrisc@lists.librecores.org>; Sat,  1 Aug 2020 12:54:23 +0200 (CEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 071AWipj009926; Sat, 1 Aug 2020 06:53:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32n4j1tj4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 06:53:31 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 071AineF032275;
 Sat, 1 Aug 2020 06:53:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32n4j1tj43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 06:53:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 071AoAw0031317;
 Sat, 1 Aug 2020 10:53:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32n01809gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 10:53:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 071ArONv53215310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 Aug 2020 10:53:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E75411C04A;
 Sat,  1 Aug 2020 10:53:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5269A11C04C;
 Sat,  1 Aug 2020 10:53:16 +0000 (GMT)
Received: from [9.102.1.22] (unknown [9.102.1.22])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  1 Aug 2020 10:53:16 +0000 (GMT)
To: Mike Rapoport <rppt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org> <87d04d5hda.fsf@mpe.ellerman.id.au>
 <20200801101854.GD534153@kernel.org>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <bb86fb93-4d52-6b58-0914-eab45b74c028@linux.ibm.com>
Date: Sat, 1 Aug 2020 16:23:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801101854.GD534153@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-01_07:2020-07-31,
 2020-08-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008010079
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-mm@kvack.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAwMS8wOC8yMCAzOjQ4IHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+IE9uIFRodSwgSnVs
IDMwLCAyMDIwIGF0IDEwOjE1OjEzUE0gKzEwMDAsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6Cj4+
IE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3JpdGVzOgo+Pj4gRnJvbTogTWlrZSBS
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pj4KPj4+IGZhZHVtcF9yZXNlcnZlX2NyYXNo
X2FyZWEoKSByZXNlcnZlcyBtZW1vcnkgZnJvbSBhIHNwZWNpZmllZCBiYXNlIGFkZHJlc3MKPj4+
IHRpbGwgdGhlIGVuZCBvZiB0aGUgUkFNLgo+Pj4KPj4+IFJlcGxhY2UgaXRlcmF0aW9uIHRocm91
Z2ggdGhlIG1lbWJsb2NrLm1lbW9yeSB3aXRoIGEgc2luZ2xlIGNhbGwgdG8KPj4+IG1lbWJsb2Nr
X3Jlc2VydmUoKSB3aXRoIGFwcHJvcHJpYXRlICB0aGF0IHdpbGwgdGFrZSBjYXJlIG9mIHByb3Bl
ciBtZW1vcnkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW1ldGVycz8KPj4+IHJlc2Vy
dmF0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXgu
aWJtLmNvbT4KPj4+IC0tLQo+Pj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2ZhZHVtcC5jIHwgMjAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxOSBkZWxldGlvbnMoLSkKPj4KPj4gSSB0aGluayB0aGlzIGxvb2tzIE9LIHRvIG1lLCBidXQg
SSBkb24ndCBoYXZlIGEgc2V0dXAgdG8gdGVzdCBpdCBlYXNpbHkuCj4+IEkndmUgYWRkZWQgSGFy
aSB0byBDYyB3aG8gbWlnaHQgYmUgYWJsZSB0by4KPj4KPj4gQnV0IEknbGwgZ2l2ZSB5b3UgYW4g
YWNrIGluIHRoZSBob3BlIHRoYXQgaXQgd29ya3MgOikKPiAKPiBBY3R1YWxseSwgSSBkaWQgc29t
ZSBkaWdnaW5nIGluIHRoZSBnaXQgbG9nIGFuZCB0aGUgdHJhdmVyc2FsIHdhcyBhZGRlZAo+IHRo
ZXJlIG9uIHB1cnBvc2UgYnkgdGhlIGNvbW1pdCBiNzFhNjkzZDNkYjMgKCJwb3dlcnBjL2ZhZHVt
cDogZXhjbHVkZQo+IG1lbW9yeSBob2xlcyB3aGlsZSByZXNlcnZpbmcgbWVtb3J5IGluIHNlY29u
ZCBrZXJuZWwiKQoKSSB3YXMgYWJvdXQgdG8gY29tbWVudCBvbiB0aGUgc2FtZSA6KQptZW1ibG9j
a19yZXNlcnZlKCkgd2FzIGJlaW5nIHVzZWQgdW50aWwgd2UgcmFuIGludG8gdGhlIGlzc3VlIHRh
bGtlZCAKYWJvdXQgaW4gdGhlIGFib3ZlIGNvbW1pdC4uLgoKPiBQcmVzdW1pbmcgdGhpcyBpcyBz
dGlsbCByZXFydWlyZWQgSSdtIGdvaW5nIHRvIGRyb3AgdGhpcyBwYXRjaCBhbmQgd2lsbAoKWWVh
aCwgaXQgaXMgc3RpbGwgcmVxdWlyZWQuLgoKPiBzaW1wbHkgcmVwbGFjZSBmb3JfZWFjaF9tZW1i
bG9jaygpIHdpdGggZm9yX2VhY2hfbWVtX3JhbmdlKCkgaW4gdjIuCgpTb3VuZHMgcmlnaHQuCgo+
ICAgCj4+IEFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4+
Cj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvZmFkdW1wLmMKPj4+IGluZGV4IDc4YWI5YTZlZTZhYy4uMjQ0NmE2MWUz
YzI1IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYwo+Pj4gKysr
IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYwo+Pj4gQEAgLTE2NTgsMjUgKzE2NTgsNyBA
QCBpbnQgX19pbml0IGZhZHVtcF9yZXNlcnZlX21lbSh2b2lkKQo+Pj4gICAvKiBQcmVzZXJ2ZSBl
dmVyeXRoaW5nIGFib3ZlIHRoZSBiYXNlIGFkZHJlc3MgKi8KPj4+ICAgc3RhdGljIHZvaWQgX19p
bml0IGZhZHVtcF9yZXNlcnZlX2NyYXNoX2FyZWEodTY0IGJhc2UpCj4+PiAgIHsKPj4+IC0Jc3Ry
dWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOwo+Pj4gLQl1NjQgbXN0YXJ0LCBtc2l6ZTsKPj4+IC0K
Pj4+IC0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsKPj4+IC0JCW1zdGFydCA9IHJl
Zy0+YmFzZTsKPj4+IC0JCW1zaXplICA9IHJlZy0+c2l6ZTsKPj4+IC0KPj4+IC0JCWlmICgobXN0
YXJ0ICsgbXNpemUpIDwgYmFzZSkKPj4+IC0JCQljb250aW51ZTsKPj4+IC0KPj4+IC0JCWlmICht
c3RhcnQgPCBiYXNlKSB7Cj4+PiAtCQkJbXNpemUgLT0gKGJhc2UgLSBtc3RhcnQpOwo+Pj4gLQkJ
CW1zdGFydCA9IGJhc2U7Cj4+PiAtCQl9Cj4+PiAtCj4+PiAtCQlwcl9pbmZvKCJSZXNlcnZpbmcg
JWxsdU1CIG9mIG1lbW9yeSBhdCAlIzAxNmxseCBmb3IgcHJlc2VydmluZyBjcmFzaCBkYXRhIiwK
Pj4+IC0JCQkobXNpemUgPj4gMjApLCBtc3RhcnQpOwo+Pj4gLQkJbWVtYmxvY2tfcmVzZXJ2ZSht
c3RhcnQsIG1zaXplKTsKPj4+IC0JfQo+Pj4gKwltZW1ibG9ja19yZXNlcnZlKGJhc2UsIG1lbWJs
b2NrX2VuZF9vZl9EUkFNKCkgLSBiYXNlKTsKPj4+ICAgfQo+Pj4gICAKPj4+ICAgdW5zaWduZWQg
bG9uZyBfX2luaXQgYXJjaF9yZXNlcnZlZF9rZXJuZWxfcGFnZXModm9pZCkKPj4+IC0tIAo+Pj4g
Mi4yNi4yCj4gCgpUaGFua3MKSGFyaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
