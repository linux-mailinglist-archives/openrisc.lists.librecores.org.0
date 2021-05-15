Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A38A3818E0
	for <lists+openrisc@lfdr.de>; Sat, 15 May 2021 14:51:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D0AF12136D;
	Sat, 15 May 2021 14:51:42 +0200 (CEST)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id 91FB420132
 for <openrisc@lists.librecores.org>; Sat, 15 May 2021 14:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DtXt01q/DleMBxjMxb+DNNjDdJ1wlgZKFyJsF3PwjU0=; b=NMoMd915B4XGX8F1Qe0bNahNDn
 Q3v6tqHHln/XFJnAhmhuRH4TwVVoVEz+xuUArTVUak1W3FowlZv6Q0JJ7GbxBuXatdc+k+HxuchiQ
 F7xld4H881lCr8ElRk9gIyrom6wND12JcBIpkxKnLD23jNMe8qA32v2Nl4TkpuLsighCopLsvY9oW
 tBxvYR6fYt5cZYSjFMhsN/Q7GjLp2azc9Ny3MsPg4iBkrWUcAYIY7+YXk6jogXZi6x1nqQ6dpQtdt
 Bm9u1khah4V1p3iBQ1YFl3Jkbui6/YP6mH5HQ1wVM+V5B8LBFcfCqMfTAWVDrnVxKT/l6Pzw6lwsO
 KYLKxMKA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lhtlb-00AJr5-CE; Sat, 15 May 2021 12:51:39 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id EFCC8986476; Sat, 15 May 2021 14:51:36 +0200 (CEST)
Date: Sat, 15 May 2021 14:51:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20210515125136.GF5618@worktop.programming.kicks-ass.net>
References: <20210515075810.163206-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515075810.163206-1-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: Define memory barrier mb
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
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBNYXkgMTUsIDIwMjEgYXQgMDQ6NTg6MDhQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IAo+
IFRoaXMgY2FtZSB1cCBpbiB0aGUgZGlzY3Vzc2lvbiBvZiB0aGUgcmVxdWlyZW1lbnRzIG9mIHFz
cGlubG9jayBvbiBhbgo+IGFyY2hpdGVjdHVyZS4gIE9wZW5SSVNDIHVzZXMgcXNwaW5sb2NrLCBi
dXQgaXQgd2FzIG5vdGljZWQgdGhhdCB0aGUKPiBtZW1tb3J5IGJhcnJpZXIgd2FzIG5vdCBkZWZp
bmVkLgo+IAo+IFBldGVyIGRlZmluZWQgaXQgaW4gdGhlIG1haWwgdGhyZWFkIHdyaXRpbmc6Cj4g
Cj4gICAgIEFzIG5lYXIgYXMgSSBjYW4gdGVsbCB0aGlzIHNob3VsZCBkby4gVGhlIGFyY2ggc3Bl
YyBvbmx5IGxpc3RzCj4gICAgIHRoaXMgb25lIGluc3RydWN0aW9uIGFuZCB0aGUgdGV4dCBtYWtl
cyBpdCBzb3VuZCBsaWtlIGEgY29tcGxldGlvbgo+ICAgICBiYXJyaWVyLgo+IAo+IFRoaXMgaXMg
Y29ycmVjdCBzbyBhcHBseWluZyB0aGlzIHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBbc2hvcm5lQGdtYWlsLmNvbTpUdXJu
ZWQgdGhlIG1haWwgaW50byBhIHBhdGNoXQo+IFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5l
IDxzaG9ybmVAZ21haWwuY29tPgo+IC0tLQo+IEkganVzdCBhcHBsaWVkIHRoZSBwYXRjaCBwb3N0
ZWQgYnkgUGV0ZXIgaW4gdGhlIG1haWwgYXMgaXMgaGVuY2UgaXQgaXMgbGFiZWxlZAo+IGZyb20g
cGV0ZXIuICBUaGlzIGFsc28gcmVxdWlyZWQgbWUgdG8gc2V0IHRoZSBTaWduZWQtb2ZmLWJ5IHRv
IFBldGVyLgo+IAo+IElmIHRoZXJlIGlzIGFueSBpc3N1ZSB3aXRoIHRoYXQgbGV0IG1lIGtub3cu
ICBJIHRlc3RlZCB0aGlzIG91dCBvbiBteSBzaW5nbGUKPiBwcm9jZXNzb3Igc2V0dXAgYW5kIGl0
IGFsbCB3b3JrcyBmaW5lLCBpdCB3aWxsIHRha2UgbWUgc29tZSB0aW1lIHRvIGdldCBteSBTTVAK
PiBzZXR1cCB1cCBhbmQgcnVubmluZyBhZ2FpbiB0byB0ZXN0IHRoZSBvdGhlciBwYXRjaGVzLCBi
dXQgSSBmaWd1cmVkIEkgd291bGQgc2VuZAo+IHRoaXMgcGF0Y2ggZmlyc3QuCgpXb3JrcyBmb3Ig
bWU7IHRoYW5rcyBmb3Igbm90IGxvb3NpbmcgaXQgOy0pCgo+IEFsc28sIEkgZ290IGRlbGF5ZWQg
YmVjYXVzZSBJIGhhZCB0byByZWJ1aWxkIG15IG1haW4gd29ya3N0YXRpb24gYWZ0ZXIgYQo+IGhh
cmR3YXJlIGZhaWx1cmUuCgoqb3VjaCosIGhhdGUgaXQgd2hlbiB0aGF0IGhhcHBlbnMuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
