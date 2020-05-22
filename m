Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E92CC1E5052
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 988EA20CD3;
	Wed, 27 May 2020 23:19:46 +0200 (CEST)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mail.librecores.org (Postfix) with ESMTPS id 8CEB920B84
 for <openrisc@lists.librecores.org>; Fri, 22 May 2020 20:52:27 +0200 (CEST)
IronPort-SDR: RCBZoiTAfTdJVE5xTapsA0J+jrGdesetm41uTV8a+twI9ktOOMaWyJh+Cv7+dZUHq6nxXlqs5J
 DT4295JfwK3IglSXTYnKwBrWvFMubYGsNXRNkSeBIywzPazwRZH/bBTK6YJ6Rqr0H3JuD/tpV9
 oXYGq1mytzUVSw9fqg4YrRp9PMGzmb1H/PLSSJ3hOvtxbj+l1LI7Ou9/LQEv0APIzHQQFE3lxy
 vabQR9pn3EknWdo5wxHiZzowZURzogXJkndmD72tRCKtths39CxsQHEBmMMQLDmHt3dtmsQQaY
 +Aw=
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; d="scan'208";a="49186224"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 22 May 2020 10:52:25 -0800
IronPort-SDR: aesRT8uOQ47+raXA96RhmMF6QzTGYYNn6KhB9ahjlNnT9e3lXHrsmtAzYpF1gQghFH7wTj0bAn
 Prs20HHYS1pjyM+n15VaMMEsqNmvQ2/y/f5Q2u1lACq4kVYHVj5Y0c9ZqafRU4ueA9aHsXjczG
 MafowzdK7f8UNxhhMMJI8DtS1DQEKnE3oWTswccZKwwY8rh7GNr6H3py3Hu1/+DlePCrBYTIuD
 s0WFTL8dTmq3hblwusWim3R9Kg7Qwi487kq6H9BU5U5k+q8TMkqqlshIlbAwD5J5yGxfOxZi/m
 q2o=
Date: Fri, 22 May 2020 18:52:20 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20200522113633.209664-1-shorne@gmail.com>
Message-ID: <alpine.DEB.2.21.2005221846590.10437@digraph.polyomino.org.uk>
References: <20200522113633.209664-1-shorne@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH 0/1] OpenRISC port
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

T24gRnJpLCAyMiBNYXkgMjAyMCwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cgo+IEhpIEFsbCwKPiAKPiBUaGlzIGlzIHRoZSBwYXRjaCBmb3IgdGhlIE9wZW5SSVNDIHBvcnQg
b2YgZ2xpYmMuCgpQbGVhc2Ugc2VlIDxodHRwczovL3NvdXJjZXdhcmUub3JnL2dsaWJjL3dpa2kv
TmV3UG9ydHM+IGZvciBpbmZvcm1hdGlvbiB0byAKaW5jbHVkZSBpbiBhIG5ldyBwb3J0IHN1Ym1p
c3Npb24uICBUaGF0IGluY2x1ZGVzIHBvaW50aW5nIHRvIGFyY2hpdGVjdHVyZSAKYW5kIEFCSSBt
YW51YWxzLgoKPiBUaGUgb3JpZ2luYWwgcGF0Y2ggd2FzIHB1dCB0b2dldGhlciBieSBDaHJpc3Rp
YW4gU2NlbnNzb24gYSBmZXcgeWVhcnMgYWdvLiAgSQo+IGhhdmUgdGFrZW4gdGhlIHBhdGNoIGFu
ZCBmaW5pc2hlZCBhbGwgb2YgdGhlIFRPRE8gaXRlbXMgYW5kIHJ1biBhbmQgZml4ZWQgYWxsIG9m
Cj4gdGhlIHRlc3QgZmFpbHVyZXMuCgpEbyB5b3UgbWVhbiBDaHJpc3RpYW4gU3ZlbnNzb24/ICAo
VGhlcmUncyBhIGNvcHlyaWdodCBhc3NpZ25tZW50IGZyb20gCkNocmlzdGlhbiBTdmVuc3NvbiBm
b3IgR0NDIEdMSUJDIEJJTlVUSUxTIGZyb20gMjAxNC4pCgo+IFRFU1QgUkVTVUxUUwo+IAo+IFBy
ZXR0eSBtdWNoIGFsbCB0ZXN0cyBhcmUgcGFzc2luZyBob3dldmVyIHRoZXJlIGFyZSBzZXZlcmFs
IG1hdGggKGZwdSkgdGVzdHMKPiB3aGljaCBhcmUgZmFpbGluZyBkdWUgdG8gaXNzdWVzIHdpdGgg
c2V0dGluZyB1bmRlcmZsb3cvb3ZlcmZsb3cgZmxhZ3MuICBUaGVzZQoKVGhlcmUgc2hvdWxkIG5v
dCBiZSBhbnkgc3VjaCBmYWlsdXJlcyB3aXRoIGEgY29ycmVjdCBwb3J0IGFuZCBhcmNoaXRlY3R1
cmUgCmltcGxlbWVudGF0aW9uLgoKPiBJIGNhbiBwcm92aWRlIG1vcmUgZGV0YWlscy4KCkZ1bGwg
dGVzdCByZXN1bHRzIHNob3VsZCBiZSBwcm92aWRlZCAoc2VlIHRoZSBhYm92ZSBtZW50aW9uZWQg
d2lraSBwYWdlKS4KCi0tIApKb3NlcGggUy4gTXllcnMKam9zZXBoQGNvZGVzb3VyY2VyeS5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
