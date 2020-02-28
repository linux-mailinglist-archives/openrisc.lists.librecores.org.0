Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 75E761739E9
	for <lists+openrisc@lfdr.de>; Fri, 28 Feb 2020 15:34:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2DCC7207EE;
	Fri, 28 Feb 2020 15:34:30 +0100 (CET)
Received: from openrisc.vrnet (ppp78-37-224-198.pppoe.avangarddsl.ru
 [78.37.224.198])
 by mail.librecores.org (Postfix) with ESMTP id BE9C22035D
 for <openrisc@lists.librecores.org>; Fri, 28 Feb 2020 15:34:27 +0100 (CET)
Received: from localhost.localdomain ([10.0.0.15])
 by openrisc.vrnet (8.14.7/8.14.4) with ESMTP id 01SEYKK0001803
 for <openrisc@lists.librecores.org>; Fri, 28 Feb 2020 14:34:21 GMT
To: openrisc@lists.librecores.org
From: Vad Rulezz <vad@vr5.epicgamer.org>
Message-ID: <47bb03c5-85bc-c8a2-6b16-c07ff692f174@vr5.epicgamer.org>
Date: Fri, 28 Feb 2020 17:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [OpenRISC] [PATCH] openrisc: fix syscalls table initialization
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U29tZSBlbnRyaWVzIGluIHN5c2NhbGxzIHRhYmxlIGNvdWxkIGJlIGxlZnQgdW5pbml0aWFsaXpl
ZCwgdGhpcyBwYXRjaApmaXhlcyB0aGF0LgoKVmFkIFJ1bGV6egoKLS0tIGEvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc3lzX2NhbGxfdGFibGUuYwkyMDIwLTAyLTI0IDAzOjE3OjQyLjAwMDAwMDAwMCAr
MDMwMAorKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zeXNfY2FsbF90YWJsZS5jCTIwMjAtMDIt
MjggMTc6MDg6NTcuOTkwOTMxODQ2ICswMzAwCkBAIC0yMCw1ICsyMCw2IEBACiAgI2RlZmluZSBf
X1NZU0NBTEwobnIsIGNhbGwpIFtucl0gPSAoY2FsbCksCgogIHZvaWQgKnN5c19jYWxsX3RhYmxl
W19fTlJfc3lzY2FsbHNdID0geworCVswIC4uLiBfX05SX3N5c2NhbGxzLTFdID0gJnN5c19uaV9z
eXNjYWxsLAogICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+CiAgfTsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
