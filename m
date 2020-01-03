Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D28EF130A0D
	for <lists+openrisc@lfdr.de>; Sun,  5 Jan 2020 22:53:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 62F6D2085F;
	Sun,  5 Jan 2020 22:53:38 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by mail.librecores.org (Postfix) with ESMTPS id D097020974
 for <openrisc@lists.librecores.org>; Fri,  3 Jan 2020 13:31:18 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 003CSxKW111446;
 Fri, 3 Jan 2020 12:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=b3uRmQvNfEosDDjOkW8sRh5UcyCobfd0n7/rf6Tc50w=;
 b=L6k+3As/gutJ1nFXFNf51TfYYr4/IWOK5zSdB/AtXuvzPsMXxeoUeZUwxuKC8APMBDav
 XkNZMhBqMaeqiODQS0N6h19Lp+Y/bwD12NCwSREB3PLJgCS5iOndUcNJGMxC4itHIPHO
 pqEIp1vAPFlDyx3cLAupwZ3OxkuPTR8GtCSSFp2lKcnyE7l2sK8T2823+1e7WSupgIkD
 ExSJOHcwC3FxuqUwhcggphRSRu7JRhxTJd/jm4N8qe5OQ2+2FkQiltqAj+kE8A2gMtmG
 6Oi48LSuDov6CCqf/MX5cOkDd/I8fNHEKKOMCZ61d8588vB0XPFmwjC7NjhPmobl7ofP pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2x5xftv8k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jan 2020 12:31:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 003CS2BE076479;
 Fri, 3 Jan 2020 12:31:13 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2xa5fg8es7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jan 2020 12:31:13 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 003CV7mt008844;
 Fri, 3 Jan 2020 12:31:08 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 03 Jan 2020 04:31:06 -0800
Date: Fri, 3 Jan 2020 15:31:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Message-ID: <20200103123059.GI3911@kadam>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9488
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=698
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001030119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9488
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=761 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001030119
X-Mailman-Approved-At: Sun, 05 Jan 2020 22:53:35 +0100
Subject: Re: [OpenRISC] [PATCH 0/4] use mmgrab
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
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBEZWMgMjksIDIwMTkgYXQgMDQ6NDI6NTRQTSArMDEwMCwgSnVsaWEgTGF3YWxsIHdy
b3RlOgo+IE1tZ3JhYiB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgZjFmMTAwNzY0NGZmICgibW06
IGFkZCBuZXcgbW1ncmFiKCkKPiBoZWxwZXIiKSBhbmQgbW9zdCBvZiB0aGUga2VybmVsIHdhcyB1
cGRhdGVkIHRvIHVzZSBpdC4gVXBkYXRlIGEgZmV3Cj4gcmVtYWluaW5nIGZpbGVzLgoKSSB3b25k
ZXIgaWYgdGhlcmUgaXMgYW4gYXV0b21hdGljIHdheSB0byBnZW5lcmF0ZSB0aGVzZSBraW5kIG9m
CkNvY2NpbmVsbGUgc2NyaXB0cyB3aGljaCB1c2UgaW5saW5lcyBpbnN0ZWFkIG9mIG9wZW4gY29k
aW5nLiAgTGlrZSBtYXliZQptYWtlIGEgbGlzdCBvZiBvbmUgbGluZSBmdW5jdGlvbnMsIGFuZCB0
aGVuIGF1dG8gZ2VuZXJhdGUgYSByZWNpcGUuICBPcgp0aGUgbW1ncmFiKCkgZnVuY3Rpb24gY291
bGQgaGF2ZSBtdWx0aXBsZSBsaW5lcyBpZiB0aGUgZmlyc3QgZmV3IHdlcmUKanVzdCBzYW5pdHkg
Y2hlY2tzIGZvciBOVUxMIG9yIHNvbWV0aGluZy4uLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
