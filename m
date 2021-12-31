Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B14DF4823A2
	for <lists+openrisc@lfdr.de>; Fri, 31 Dec 2021 12:29:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3B4BA24313;
	Fri, 31 Dec 2021 12:29:22 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by mail.librecores.org (Postfix) with ESMTPS id EF0AA240FC
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 12:29:19 +0100 (CET)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BV6teKp016507; 
 Fri, 31 Dec 2021 11:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=pzUt4LgyPXDJP5o63yyZnj398P6Tb55t1EAvGioG3k8=;
 b=g160z1MzL7ZaBJP0PCFl8WM+/oaNldyPX5T/b2OeqniIg6zpoJJ47PVZUowg0MtVBM+b
 75D8w5J5YM6d+KsITNJ6SyAPHmjNd4qzLkRKe2Aa5iqaRILDTl8nTunlrD/V/PWQopyi
 ffu+DrDe3G3FsNW8naQ0Vs9Jme2ccq8/xhb9T75Om2b3Ho14lej524nWlJSXlp9TAAz1
 NyTMooQ1KiqpJr+uzRKwIcFVyCGx228US4hJSEC5MwRoddDO03iAEPHtx6Mul7n9ZuAB
 j9Zbs6TrzO/vN/WHJf/odeWes281S8+pAqE18r2f1uyR1y9UGT7YCQUk3l3U7i4EttAT XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d9qyvfxnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 11:28:34 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BVBRr2I030593;
 Fri, 31 Dec 2021 11:28:33 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d9qyvfxms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 11:28:33 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BVBO64f003482;
 Fri, 31 Dec 2021 11:28:30 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3d5txa0f1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 11:28:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BVBSRO447514016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Dec 2021 11:28:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7DF04203F;
 Fri, 31 Dec 2021 11:28:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2638942047;
 Fri, 31 Dec 2021 11:28:24 +0000 (GMT)
Received: from sig-9-145-181-202.de.ibm.com (unknown [9.145.181.202])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Dec 2021 11:28:24 +0000 (GMT)
Message-ID: <072b9080be4a408052bf2c2cc1a9be0089cce5cc.camel@linux.ibm.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Date: Fri, 31 Dec 2021 12:28:23 +0100
In-Reply-To: <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
 <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d7GAvK0BVAwkfUmW9z0Tnb-kHBnvpkJi
X-Proofpoint-ORIG-GUID: nVApRVBnj1QdMi6qsc--MaC8MDeDduB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_04,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310050
Subject: Re: [OpenRISC] [RFC 02/32] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
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
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>,
 John Garry <john.garry@huawei.com>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCAyMDIxLTEyLTMwIGF0IDE2OjQ0ICsxMzAwLCBNaWNoYWVsIFNjaG1pdHogd3JvdGU6
Cj4gSGkgQXJuZCwKPiAKPiBBbSAzMC4xMi4yMDIxIHVtIDE0OjQ4IHNjaHJpZWIgQXJuZCBCZXJn
bWFubjoKPiA+IE9uIFR1ZSwgRGVjIDI4LCAyMDIxIGF0IDExOjE1IFBNIE1pY2hhZWwgU2NobWl0
eiA8c2NobWl0em1pY0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBBbSAyOS4xMi4yMDIxIHVtIDE2
OjQxIHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPiA+ID4gPiBPbiBUdWUsIERlYyAyOCwgMjAyMSBh
dCA4OjIwIFBNIE1pY2hhZWwgU2NobWl0eiA8c2NobWl0em1pY0BnbWFpbC5jb20+IHdyb3RlOgot
LS04PC0tLQo+IAo+ID4gV2hhdCBzb21lIG90aGVyIGFyY2hpdGVjdHVyZXMgZG8gaXMgdG8gcmVs
eSBvbiBpbmIoKS9vdXRiKCkgdG8gaGF2ZSBhCj4gPiB6ZXJvLWJhc2VkIG9mZnNldCwgYW5kIHVz
ZSBhbiBpb19vZmZzZXQgaW4gUENJIGJ1c2VzIHRvIGVuc3VyZSB0aGF0IGEKPiA+IGxvdyBwb3J0
IG51bWJlciBvbiB0aGUgYnVzIGdldHMgdHJhbnNsYXRlZCBpbnRvIGEgcG9pbnRlciB2YWx1ZSBm
b3IgdGhlCj4gPiB2aXJ0dWFsIG1hcHBpbmcgaW4gdGhlIGtlcm5lbCwgd2hpY2ggaXMgdGhlbiBy
ZXByZXNlbnRlZCBhcyBhbiB1bnNpZ25lZAo+ID4gaW50Lgo+IAo+IE01NHh4IGRvZXMganVzdCB0
aGF0IGZvciBDb2xkZmlyZToKPiAKPiBhcmNoL202OGsvaW5jbHVkZS9hc20vaW9fbm8uaDoKPiAj
ZGVmaW5lIFBDSV9JT19QQQkweGY4MDAwMDAwCQkvKiBIb3N0IHBoeXNpY2FsIGFkZHJlc3MgKi8K
PiAKPiAodXNlZCB0byBzZXQgUENJIEJBUiBtYXBwaW5ncywgc28gbWF0Y2hlcyB5b3VyIGRlZmlu
aXRpb24gYWJvdmUpLgo+IAo+IEFsbCBvdGhlciAoTU1VKSBtNjhrIHVzZXJzIG9mIGluYigpL291
dGIoKSBhcHBseSBhbiBpb19vZmZzZXQgaW4gdGhlIAo+IHBsYXRmb3JtIHNwZWNpZmljIGFkZHJl
c3MgdHJhbnNsYXRpb246Cj4gCj4gCi0tLTg8LS0tCj4gU28gYXMgbG9uZyBhcyBzdXBwb3J0IGZv
ciBhbnkgb2YgdGhlIG02OGsgUENJIG9yIElTQSBicmlkZ2VzIGlzIHNlbGVjdGVkIAo+IGluIHRo
ZSBrZXJuZWwgY29uZmlnLCB0aGUgYXBwcm9wcmlhdGUgSU8gc3BhY2UgbWFwcGluZyBpcyBhcHBs
aWVkLiBJZiBubyAKPiBzdXBwb3J0IGZvciBQQ0kgb3IgSVNBIGJyaWRnZXMgaXMgc2VsZWN0ZWQs
IHdlIGFscmVhZHkgZmFsbCBiYWNrIHRvIHplcm8gCj4gb2Zmc2V0IG1hcHBpbmcgKGJ1dCBhcyBm
YXIgYXMgSSBjYW4gdGVsbCwgaXQgc2hvdWxkbid0IGJlIHBvc3NpYmxlIHRvIAo+IGJ1aWxkIGEg
a2VybmVsIHdpdGhvdXQgYnJpZGdlIHN1cHBvcnQgYnV0IGRyaXZlcnMgdGhhdCByZXF1aXJlIGl0
KS4KPiAKPiA+IEFzIHRoaXMgaXMgaW5kaXN0aW5ndWlzaGFibGUgZnJvbSBhcmNoaXRlY3R1cmVz
IHRoYXQganVzdCBkb24ndCBoYXZlCj4gPiBhIGJhc2UgYWRkcmVzcyBmb3IgSS9PIHBvcnRzICh3
ZSB1bmZvcnR1bmF0ZWx5IHBpY2tlZCAwIGFzIHRoZSBkZWZhdWx0Cj4gPiBQQ0lfSU9CQVNFIHZh
bHVlKSwgbXkgc3VnZ2VzdGlvbiB3YXMgdG8gc3RhcnQgbWFya2luZyBhcmNoaXRlY3R1cmVzCj4g
PiB0aGF0IG1heSBoYXZlIHRoaXMgcHJvYmxlbSBhcyB1c2luZyBIQVNfSU9QT1JUIGluIG9yZGVy
IHRvIGtlZXAKPiA+IHRoZSBleGlzdGluZyBiZWhhdmlvciB1bmNoYW5nZWQuIElmIG02OGsgZG9l
cyBub3Qgc3VmZmVyIGZyb20gdGhpcywKPiA+IG1ha2luZyBIQVNfSU9QT1JUIGNvbmRpdGlvbmFs
IG9uIHRob3NlIGNvbmZpZyBvcHRpb25zIHRoYXQgYWN0dWFsbHkKPiA+IG5lZWQgaXQgd291bGQg
b2YgY291cnNlIGJlIGJlc3QuCj4gCj4gRm9sbG93aW5nIHlvdXIgZGVzY3JpcHRpb24sIEhBU19J
T1BPUlQgd291bGQgYmUgcmVxdWlyZWQgZm9yIG5laXRoZXIgb2YgCj4gUENJLCBJU0Egb3IgQVRB
UklfUk9NX0lTQSA/Pwo+IAoKTm8sIEhBU19JT1BPUlQgYmVpbmcgc2V0IGp1c3QgbWVhbnMgdGhh
dCBpbmIoKSBldGMuIGV4aXN0IGFuZCBhcmUKZnVuY3Rpb25hbCBiZSBpdCBhcyBzcGVjaWFsIGlu
c3RydWN0aW9ucyBsaWtlIG9uIHg4NiBvciB2aWEgYW4gSS9PCmFkZHJlc3Mgb2Zmc2V0LiBBcyBJ
IHVuZGVyc3RhbmQgaXQgaWYgeW91IGRvIGhhdmUgUENJLCBJU0Egb3IKQVRBUklfUk9NX0lTQSB0
aGV5IGFyZSBmdW5jdGlvbmFsLiBJZiBub25lIG9mIHRoZW0gYXJlIHNldCBhbmQgeW91cgp6ZXJv
IG9mZnNldCBtYXBwaW5nIG1lYW5zIHRoZXNlIGFjY2Vzc29ycyBjYW4ndCBhY3R1YWxseSBiZSB1
c2VkIHlvdQpjb3VsZCBtYWtlIHRoZSBkZWNsZXJhdGlvbnMgaWZkZWZmZWQgb24gQ09ORklHX0hB
U19JT1BPUlQgdG8gZGV0ZWN0IHRoZQpjYXNlcyB3aGVyZSBzb21vbmUgbWFuYWdlZCB0byBidWls
ZCBkcml2ZXJzIHRoYXQgcmVxdWlyZSB0aGVtIGFuZCB0aGF0CndvdWxkIHJlc3VsdCBpbiBhIGNv
bXBpbGUgdGltZSBlcnJvciBpbnN0ZWFkIG9mIHNpbGVudGx5LCBvciB3aXRoIGEKTlVMTCBwb2lu
dGVyIHdhcm5pbmcsIGNvbXBpbGluZyBjb2RlIHRoYXQgd29uJ3Qgd29yay4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
