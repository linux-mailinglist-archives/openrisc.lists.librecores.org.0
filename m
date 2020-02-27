Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 510F117176E
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C83C82096E;
	Thu, 27 Feb 2020 13:35:41 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by mail.librecores.org (Postfix) with ESMTPS id F3F7E20671
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 13:21:48 +0100 (CET)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j7IAm-0004Mu-6u; Thu, 27 Feb 2020 12:21:48 +0000
Date: Thu, 27 Feb 2020 13:21:47 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200227122147.rnpzcy7rjexgy6yx@wittgenstein>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200226225625.28935-3-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226225625.28935-3-shorne@gmail.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 2/3] openrisc: Enable the clone3 syscall
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
Cc: Jonas Bonn <jonas@southpole.se>, Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjRBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gRW5hYmxlIHRoZSBjbG9uZTMgc3lzY2FsbCBmb3IgT3BlblJJU0MuICBXZSB1c2Ug
dGhlIGdlbmVyaWMgdmVyc2lvbi4KPiAKPiBUaGlzIHdhcyB0ZXN0ZWQgd2l0aCB0aGUgY2xvbmUz
IHRlc3QgZnJvbSBzZWxmdGVzdHMuICBOb3RlLCBmb3IgYWxsCj4gdGVzdHMgdG8gcGFzcyBpdCBy
ZXF1aXJlZCBlbmFibGluZyBDT05GSUdfTkFNRVNQQUNFUyB3aGljaCBpcyBub3QKPiBlbmFibGVk
IGluIHRoZSBkZWZhdWx0IGtlcm5lbCBjb25maWcuCgpGb3IgT3BlblJJU0MsIEkgYXNzdW1lLiBI
bSwgbWF5YmUgd2Ugc2hvdWxkIGZpeCB0aGUgdGVzdHMgdG8gc2tpcCB3aGVuCkNPTkZJR19OQU1F
U1BBQ0VTIGlzIG5vdCBlbmFibGVkLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3Ju
ZSA8c2hvcm5lQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0
aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
