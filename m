Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A509429C9
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 16:48:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C32B320285;
	Wed, 12 Jun 2019 16:48:01 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by mail.librecores.org (Postfix) with ESMTPS id 2D1E220226
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 16:36:29 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5CEXtwN058488;
 Wed, 12 Jun 2019 14:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=FLquKI4NiwCLRKcDiLEOBvm4CdE15YRYq1CmoImmZGs=;
 b=tuu6GQVFVykyFQrcCmZvUiuhkQQ2+by71yPUAjekZ0DeZ6RiKCNtPhVfppaW6Cze8a6i
 16VDoc6TisLtKkDqE78aj6b9hWGllrZY44RuFl64KbC1FUx14mGNH2JN0Gd/NlsVQE5j
 Cm8MaaqTmED7p9u32p/4iAOBwUA6M5LCGDd72wmDzjd46OTdIPgDZlgKD+M2vOPeTCCF
 FuHsL5DKRFgVjNv12uPyaECFy7KIWVsCn5YacCvisOuWdvSjEjnMMJvsjjjCSeA2u07p
 rW5mlRqm6h0TpDriNNrtsvvnk6Md/OGv5tcx8iMboDUgnD3VJDGWjLWWjwpE4yqJAkbD 8A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2t05nqutnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 14:36:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5CEYosL065630;
 Wed, 12 Jun 2019 14:36:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2t1jpj25wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 14:36:26 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5CEaOiW018898;
 Wed, 12 Jun 2019 14:36:25 GMT
Received: from termi.oracle.com (/10.175.45.94)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 12 Jun 2019 07:36:24 -0700
From: jose.marchesi@oracle.com (Jose E. Marchesi)
To: Stafford Horne <shorne@gmail.com>
References: <20190601072629.4070-1-shorne@gmail.com>
 <20190612131403.GE2358@lianli.shorne-pla.net>
Date: Wed, 12 Jun 2019 16:36:17 +0200
In-Reply-To: <20190612131403.GE2358@lianli.shorne-pla.net> (Stafford Horne's
 message of "Wed, 12 Jun 2019 22:14:03 +0900")
Message-ID: <878su6dg66.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=738
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906120098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=786 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906120098
X-Mailman-Approved-At: Wed, 12 Jun 2019 16:47:59 +0200
Subject: Re: [OpenRISC] [PATCH 0/2] CGEN unordered fpu compares + fixes
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
Cc: cgen@sourceware.org, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

ICAgIAogICAgRGlkIGFueW9uZSBoYXZlIGEgY2hhbmNlIHRvIGxvb2sgYXQgdGhpcz8gIFRoZSBi
aW51dGlscyBwYXRjaGVzIHRoYXQgcmVxdWlyZQogICAgdGhpcyBhcmUgYXBwcm92ZWQsIGJ1dCBJ
IHJhdGhlciBub3QgY29tbWl0IHRoZW0gdW5sZXNzIHRoaXMgSSBnZXQgT0sgb24gdGhlc2UKICAg
IHBhdGNoZXMgYW5kIHB1c2ggdGhlbS4KCkknbSBub3QgYSBDR0VOIG1haW50YWluZXIsIGJ1dCBG
V0lXIGJvdGggcGF0Y2hlcyBsb29rIGdvb2QgdG8gbWUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
