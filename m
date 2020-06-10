Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCE6E1FECB8
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E282620B36;
	Thu, 18 Jun 2020 09:47:12 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by mail.librecores.org (Postfix) with ESMTPS id 6C3C320BD6
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 17:48:30 +0200 (CEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05AFWZNE136637; Wed, 10 Jun 2020 11:48:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31k2800emm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 11:48:18 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05AFX7Rh138244;
 Wed, 10 Jun 2020 11:48:18 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31k2800ekw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 11:48:18 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05AFlSns025914;
 Wed, 10 Jun 2020 15:48:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7yyge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 15:48:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05AFkw2D393944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 15:46:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48E3F52051;
 Wed, 10 Jun 2020 15:48:14 +0000 (GMT)
Received: from thinkpad (unknown [9.171.55.252])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 739E752054;
 Wed, 10 Jun 2020 15:48:13 +0000 (GMT)
Date: Wed, 10 Jun 2020 17:48:11 +0200
From: Gerald Schaefer <gerald.schaefer@de.ibm.com>
To: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <20200610174811.44b94525@thinkpad>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_09:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 cotscore=-2147483648 malwarescore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100115
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: [OpenRISC] Possible duplicate page fault accounting on some archs
 after commit 4064b9827063
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGksCgpTb21lIGFyY2hpdGVjdHVyZXMgaGF2ZSB0aGVpciBwYWdlIGZhdWx0IGFjY291bnRpbmcg
Y29kZSBpbnNpZGUgdGhlIGZhdWx0CnJldHJ5IGxvb3AsIGFuZCByZWx5IG9uIG9ubHkgZ29pbmcg
dGhyb3VnaCB0aGF0IGNvZGUgb25jZS4gQmVmb3JlIGNvbW1pdAo0MDY0Yjk4MjcwNjMgKCJtbTog
YWxsb3cgVk1fRkFVTFRfUkVUUlkgZm9yIG11bHRpcGxlIHRpbWVzIiksIHRoYXQgd2FzCmVuc3Vy
ZWQgYnkgdGVzdGluZyBmb3IgYW5kIGNsZWFyaW5nIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkuCgpU
aGF0IGNvbW1pdCBoYWQgdG8gcmVtb3ZlIHRoZSBjbGVhcmluZyBvZiBGQVVMVF9GTEFHX0FMTE9X
X1JFVFJZIGZvciBhbGwKYXJjaGl0ZWN0dXJlcywgYW5kIGludHJvZHVjZWQgYSBzdWJ0bGUgY2hh
bmdlIHRvIHBhZ2UgZmF1bHQgYWNjb3VudGluZwpsb2dpYyBpbiB0aGUgYWZmZWN0ZWQgYXJjaHMu
IEl0IGlzIG5vdyBwb3NzaWJsZSB0byBnbyB0aHJvdWdoIHRoZSByZXRyeQpsb29wIG11bHRpcGxl
IHRpbWVzLCBhbmQgdGhlIGFmZmVjdGVkIGFyY2hzIHdvdWxkIHRoZW4gYWNjb3VudCBtdWx0aXBs
ZQpwYWdlIGZhdWx0cyBpbnN0ZWFkIG9mIGp1c3Qgb25lLgoKVGhpcyB3YXMgZm91bmQgYnkgY29p
bmNpZGVuY2UgaW4gczM5MCBjb2RlLCBhbmQgYSBxdWljayBjaGVjayBzaG93ZWQgdGhhdAp0aGVy
ZSBhcmUgcXVpdGUgYSBsb3Qgb2Ygb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGF0IHNlZW0gdG8gYmUg
YWZmZWN0ZWQgaW4gYQpzaW1pbGFyIHdheS4gSSdtIHByZXBhcmluZyBhIGZpeCBmb3IgczM5MCwg
YnkgbW92aW5nIHRoZSBhY2NvdW50aW5nIGJlaGluZAp0aGUgcmV0cnkgbG9vcCwgc2ltaWxhciB0
byB4ODYuIEl0IGlzIG5vdCBjb21wbGV0ZWx5IHN0cmFpZ2h0LWZvcndhcmQsIHNvCkkgbGVhdmUg
dGhlIGZpeCBmb3Igb3RoZXIgYXJjaHMgdG8gdGhlIHJlc3BlY3RpdmUgbWFpbnRhaW5lcnMuCgpB
ZGRlZCB0aGUgbGlzdHMgZm9yIHBvc3NpYmx5IGFmZmVjdGVkIGFyY2hzIG9uIGNjLCBidXQgbm8g
Z3VhcmFudGVlIGZvcgpjb21wbGV0ZW5lc3MuCgpSZWdhcmRzLApHZXJhbGQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
