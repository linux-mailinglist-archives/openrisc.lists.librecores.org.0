Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 11E41477C81
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 20:26:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B256A242EA;
	Thu, 16 Dec 2021 20:26:19 +0100 (CET)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mail.librecores.org (Postfix) with ESMTPS id 33540242E3
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 20:26:18 +0100 (CET)
IronPort-SDR: SFClaQFHyFRlLJ3YSx86VREDVtB3sHJIrj1MMd2QYFfatnwSKW9ovXHx8f9OB/Ho71LIYalZsm
 68MTpudurohN8T4ux3TMgTWom73FgKzzVP/8h+vT2+bIUSnFvF5ED+h+2RZVf+a9o+kp2ApOjB
 aozO92nCVq0iEj/sI1kvGLgGnuUOZfdF7niR/xXg+4KH2wuwd+DnOTlD4WIOyKxzUb90hFYke5
 hyBicFBnw5aIqdoipz/D6U7yPRUOgm+Nlfk49iXMOGcyyTfKMWh13bQAYdOs/lJCbfYF4U/maL
 +J/2gwCEwsINiI1L6QhgA8Ev
X-IronPort-AV: E=Sophos;i="5.88,212,1635235200"; d="scan'208";a="69649300"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 16 Dec 2021 11:26:17 -0800
IronPort-SDR: XpeDFTe17Kf6xs/2+TbASEdTL/AO+5kbbBiLJUYetDkz8h4Qx2GFav2sweCaWXzxgiMK5alYXD
 ORps1hwm65P9JL31UzBUa/4tQ8CL7ri4XOnEb6cA3PlNYBJGWm3xZV6cH40ZhrqSUfmNeCJeCY
 EFqwmJjthTN3FEQK5Rg1sJ3k+iRlFyYX33kZf0LaijcYLrSi5s7MjoUQ4kdDCLV+Nf++3CheCc
 q6UxO08frS3pubKzfE0rp02b0QN/pCLEWW+4oSl5eyGqlzrAsAsNC9FsT75/Ps4EfjkjzpLhrB
 SRs=
Date: Thu, 16 Dec 2021 19:26:11 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <2e024bfa-b5c2-2444-1b64-ca8f63e932b6@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2112161921110.1715763@digraph.polyomino.org.uk>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-6-shorne@gmail.com>
 <2e024bfa-b5c2-2444-1b64-ca8f63e932b6@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v3 05/13] or1k: Thread Local Storage support
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCAxNiBEZWMgMjAyMSwgQWRoZW1lcnZhbCBaYW5lbGxhIHZpYSBMaWJjLWFscGhhIHdy
b3RlOgoKPiA+ICsvKiBEZWZhdWx0IHRvIGFuIGV4ZWN1dGFibGUgc3RhY2suICBQRl9YIGNhbiBi
ZSBvdmVycmlkZGVuIGlmIFBUX0dOVV9TVEFDSyBpcwo+ID4gKyAgIHByZXNlbnQsIGJ1dCBpdCBp
cyBwcmVzdW1lZCBhYnNlbnQuICAqLwo+ID4gKyNkZWZpbmUgREVGQVVMVF9TVEFDS19QRVJNUyAo
UEZfUiB8IFBGX1cgfCBQRl9YKQo+IAo+IERvIHlvdSByZWFsbHkgYSBkZWZhdWx0IHN0YWNrIGV4
ZWN1dGFibGU/IEl0IGlzIG9ubHkgZG9uZSBmb3Igb2xkZXIgQUJJcyAKPiBhbmQgdGhhdCdzIHdo
eSBQVF9HTlVfU1RBQ0sgd2FzIGNyZWF0ZWQuIE5ld2VyIHBvcnRzLCBsaWtlIGFyYyBhbmQgY3Nr
eSAKPiBhc3N1bWVzIG90aGVyd2lzZS4KCkkgdGhpbmsgdGhpcyByZWZsZWN0cyB3aGF0IHRoZSBr
ZXJuZWwgZG9lcyAodGhlIHJlbGV2YW50IGRlZmluaXRpb25zIGJlaW5nIAplbGZfcmVhZF9pbXBs
aWVzX2V4ZWMgYW5kIFZNX1NUQUNLX0RFRkFVTFRfRkxBR1MgLyBWTV9EQVRBX0RFRkFVTFRfRkxB
R1MsIApub25lIG9mIHdoaWNoIGFyZSBvdmVycmlkZGVuIGZvciBvcGVucmlzYywgc28gdGhlIGRl
ZmF1bHQgClZNX0RBVEFfREVGQVVMVF9GTEFHUyBkZWZpbml0aW9uIG9mIFZNX0RBVEFfRkxBR1Nf
RVhFQyBhcHBsaWVzKS4KCi0tIApKb3NlcGggUy4gTXllcnMKam9zZXBoQGNvZGVzb3VyY2VyeS5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
