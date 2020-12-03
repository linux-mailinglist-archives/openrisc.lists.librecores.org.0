Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 918492E292A
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C34E120E78;
	Fri, 25 Dec 2020 00:15:24 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by mail.librecores.org (Postfix) with ESMTPS id 674E920C63
 for <openrisc@lists.librecores.org>; Thu,  3 Dec 2020 15:55:01 +0100 (CET)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3Eexhl182531; Thu, 3 Dec 2020 09:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=aTanWXDu6GDQOgBiwV6VCa4+Gz8xmuiEnuHmxtcgxPE=;
 b=JqgdPm8hiRdcgHmP2Asq50K14PiR4++DD5Vd+nt7oiR5rd0dVWxNV+CyaTMf2v55XBpe
 s+gVM1OtIwF2Xnm6yZRH5aEnHoH29g2Yy8k/Ydrh+57AZhG9ihxP6O/ACCzsKz7KkpOm
 9uS4eAhzbs0Rj2Rj4AMToilq6M0k4MDriKFj72s90FNSX+Q9/pCO+3fSr2ZGQr23vN8l
 GYsZ4WHeDjYTuCodVhHapE4fIyykKImPmGci1Z/T4XpayaYDLVLAdQj2574h9vrX3CRA
 fq8QCuZA7L9FqVJdEZDAIvcQsl+YOkjb9kuPNJCT0dbuGMlFlnmoHAfQVay2BAazStvv tQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3571nssyg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 09:54:49 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B3EppGY020571;
 Thu, 3 Dec 2020 14:54:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35693xh8ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 14:54:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B3EsjwT26083698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 14:54:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDC8C11C054;
 Thu,  3 Dec 2020 14:54:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F8A611C058;
 Thu,  3 Dec 2020 14:54:44 +0000 (GMT)
Received: from osiris (unknown [9.171.50.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Dec 2020 14:54:43 +0000 (GMT)
Date: Thu, 3 Dec 2020 15:54:42 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20201203145442.GC9994@osiris>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203132834.930999-27-sashal@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1031 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030085
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix
 arch_cpu_idle() vs tracing
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
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDg6Mjg6MjFBTSAtMDUwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IAo+IFsg
VXBzdHJlYW0gY29tbWl0IDU4YzY0NGJhNTEyY2ZiYzJlMzliNzU4ZGQ5NzllZGQxZDZkMDBlMjcg
XQo+IAo+IFdlIGNhbGwgYXJjaF9jcHVfaWRsZSgpIHdpdGggUkNVIGRpc2FibGVkLCBidXQgdGhl
biB1c2UKPiBsb2NhbF9pcnFfe2VuLGRpc31hYmxlKCksIHdoaWNoIGludm9rZXMgdHJhY2luZywg
d2hpY2ggcmVsaWVzIG9uIFJDVS4KPiAKPiBTd2l0Y2ggYWxsIGFyY2hfY3B1X2lkbGUoKSBpbXBs
ZW1lbnRhdGlvbnMgdG8gdXNlCj4gcmF3X2xvY2FsX2lycV97ZW4sZGlzfWFibGUoKSBhbmQgY2Fy
ZWZ1bGx5IG1hbmFnZSB0aGUKPiBsb2NrZGVwLHJjdSx0cmFjaW5nIHN0YXRlIGxpa2Ugd2UgZG8g
aW4gZW50cnkuCj4gCj4gKFhYWDogd2UgcmVhbGx5IHNob3VsZCBjaGFuZ2UgYXJjaF9jcHVfaWRs
ZSgpIHRvIG5vdCByZXR1cm4gd2l0aAo+IGludGVycnVwdHMgZW5hYmxlZCkKPiAKPiBSZXBvcnRl
ZC1ieTogU3ZlbiBTY2huZWxsZSA8c3ZlbnNAbGludXguaWJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBaaWpsc3RyYSAoSW50ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBSZXZpZXdl
ZC1ieTogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KPiBUZXN0ZWQtYnk6IE1h
cmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gTGluazogaHR0cHM6Ly9sa21sLmtl
cm5lbC5vcmcvci8yMDIwMTEyMDExNDkyNS41OTQxMjI2MjZAaW5mcmFkZWFkLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KClRoaXMgcGF0Y2ggYnJv
a2UgczM5MCBpcnEgc3RhdGUgdHJhY2luZy4gQSBwYXRjaCB0byBmaXggdGhpcyBpcwpzY2hlZHVs
ZWQgdG8gYmUgbWVyZ2VkIHVwc3RyZWFtIHRvZGF5IChob3BlZnVsbHkpLgpUaGVyZWZvcmUgSSB0
aGluayB0aGlzIHBhdGNoIHNob3VsZCBub3QgeWV0IGdvIGludG8gNS45IHN0YWJsZS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
