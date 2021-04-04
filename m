Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5651635396C
	for <lists+openrisc@lfdr.de>; Sun,  4 Apr 2021 20:46:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A46C5212FB;
	Sun,  4 Apr 2021 20:46:09 +0200 (CEST)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mail.librecores.org (Postfix) with ESMTPS id E354421098
 for <openrisc@lists.librecores.org>; Sun,  4 Apr 2021 20:46:07 +0200 (CEST)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lT7l9-0003vt-1S; Sun, 04 Apr 2021 20:46:07 +0200
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20210304210747.3679483-1-shorne@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <bd106f14-c773-a4a8-2f43-2e269f4f04e4@pengutronix.de>
Date: Sun, 4 Apr 2021 20:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304210747.3679483-1-shorne@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openrisc@lists.librecores.org
Subject: Re: [OpenRISC] [PATCH] Documentation: Add qemu instructions for
 OpenRISC
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
Cc: Barebox <barebox@lists.infradead.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gU2FzY2hhLAoKT24gMDQuMDMuMjEgMjI6MDcsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+
IE1vc3QgZGV2ZWxvcGVycyBoYXZlIHFlbXUgYW5kIHJhdGhlciBub3QgZG93bmxvYWQgYW5kIGlu
c3RhbGwgdGhlCj4gb3Ixa3NpbS4gIEFsc28sIHRoaXMgYWRkcyBkZXRhaWxzIG9uIGhvdyB0byBn
ZXQgYSBvcGVucmlzYyB0b29sY2hhaW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9y
bmUgPHNob3JuZUBnbWFpbC5jb20+CgpJIGRvbid0IHNlZSB0aGlzIGluIG5leHQuCgo+IC0tLQo+
ICBEb2N1bWVudGF0aW9uL2JvYXJkcy9vcGVucmlzYy5yc3QgfCA2OCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdCBiL0RvY3VtZW50
YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+IGluZGV4IGY5ZDY3Zjk2NS4uMzQ1ODZiNGE3IDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+IEBAIC0xLDYgKzEsNzQgQEAKPiAgT3Bl
blJJU0MKPiAgPT09PT09PT0KPiAgCj4gK09wdGFpbmluZyBhbiBPcGVuUklTQyB0b29sY2hhaW4K
CkNvdWxkIHlvdSBmaXggdXAgcy9PcHRhaW5pbmcvT2J0YWluaW5nLyB3aGlsZSBhdCBpdD8KCkNo
ZWVycywKCkFobWFkCgoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIx
ICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMx
MTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEy
MS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAg
ICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
