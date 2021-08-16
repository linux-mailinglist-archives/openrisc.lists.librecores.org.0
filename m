Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0699C3EF4F8
	for <lists+openrisc@lfdr.de>; Tue, 17 Aug 2021 23:29:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6EF1124046;
	Tue, 17 Aug 2021 23:29:23 +0200 (CEST)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mail.librecores.org (Postfix) with ESMTPS id BA5AF23FA3
 for <openrisc@lists.librecores.org>; Mon, 16 Aug 2021 19:12:11 +0200 (CEST)
IronPort-SDR: yNTuWr7E5AHtNA4QLtqSOnVt/nvL1twtxuXdvdahZdKcI2unC7UqdX/F3YR1HDBY93viGymNyb
 cLjPa6omvNQoXeePbkZJQW2kMmUxBZBvn4BFg7wwqkZ6H6BhhWRd8U/qqbGviRhydLKsAgG8ES
 MYbHi4YhhNfX2JyBdl4ITNjilIMQT1AZUjbBaiGshDn0/fUgm+a+SjcVrmNNexbeAH7hOshQFy
 OtSaQNP8VT8AuFylzmS/uZJSvqUnVbQjqzhF3FcUOq/IzsiH54e2jg+sMxKJioX5z/0meDsSR6
 QeH0CNTy1gLDclrEflD+6Qp8
X-IronPort-AV: E=Sophos;i="5.84,326,1620720000"; d="scan'208";a="64754054"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2021 09:12:09 -0800
IronPort-SDR: KU59F6wOocA52p2Yua9RNjxezIXPHHWqGV1p4/J5b61mGPrhPBYN7ms0Ii//sMh8yI6jvOw5j4
 301hec+xp61Zjk95s+ULIMX9AGHpjj5KR2vuZxKckfAaftc7QnHtYYy6/ezb9xxL5WLJySrLiA
 4kmOnfwXOMddwfsn5CnXoaPL0TBKRMX1K1nSf0CQqVKlJEqjAmo0zQxSkcOQ61Vs7jvLyXXrdB
 nNi6zL6o4A268gJvSm5AHNlTG3dNHZRt8QT0E8vSInyDFumapICHdkTHsgnCG4ZtbEbq6fv3MB
 pmI=
Date: Mon, 16 Aug 2021 17:12:04 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <YRhCqNWB1MC++TAO@antec>
Message-ID: <alpine.DEB.2.22.394.2108161710590.136350@digraph.polyomino.org.uk>
References: <20210806094217.3227877-1-shorne@gmail.com>
 <0f577bc8-bef8-6c06-aaa9-57bf16d8443b@linaro.org> <YRhCqNWB1MC++TAO@antec>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-Mailman-Approved-At: Tue, 17 Aug 2021 23:29:22 +0200
Subject: Re: [OpenRISC] [PATCH v2] time: Fix overflow itimer tests on 32-bit
 systems
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SSdtIHNlZWluZyBhIGJ1aWxkIGZhaWx1cmUgaW4gdGhlIGdsaWJjIHRlc3RzdWl0ZSBmb3IgaTY4
Ni1nbnU6Cgp0c3QtaXRpbWVyLmM6IEluIGZ1bmN0aW9uICdkb190ZXN0JzoKdHN0LWl0aW1lci5j
OjEwMzoxMTogZXJyb3I6ICdfX0tFUk5FTF9PTERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2NCcg
dW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCiAgMTAzIHwgICAgICAgaWYg
KF9fS0VSTkVMX09MRF9USU1FVkFMX01BVENIRVNfVElNRVZBTDY0KQogICAgICB8ICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp0c3QtaXRpbWVyLmM6MTAz
OjExOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9u
Y2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgoKaHR0cHM6Ly9zb3VyY2V3YXJlLm9y
Zy9waXBlcm1haWwvbGliYy10ZXN0cmVzdWx0cy8yMDIxcTMvMDA4NDEyLmh0bWwKCi0tIApKb3Nl
cGggUy4gTXllcnMKam9zZXBoQGNvZGVzb3VyY2VyeS5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
