Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6374B5F35
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 01:38:10 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DDCDC242E8;
	Tue, 15 Feb 2022 01:38:09 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id E5D1F23E0C
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:38:08 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJlqf-001pf0-Dy; Tue, 15 Feb 2022 00:37:41 +0000
Date: Tue, 15 Feb 2022 00:37:41 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-10-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 09/14] m68k: drop custom __access_ok()
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDdQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFdoaWxlIG1v
c3QgbTY4ayBwbGF0Zm9ybXMgdXNlIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2VzIGZvciB1c2VyCj4g
YW5kIGtlcm5lbCBzcGFjZSwgYXQgbGVhc3QgY29sZGZpcmUgZG9lcyBub3QsIGFuZCB0aGUgb3Ro
ZXIKPiBvbmVzIGhhdmUgYSBUQVNLX1NJWkUgdGhhdCBpcyBsZXNzIHRoYW4gdGhlIGVudGlyZSA0
R0IgYWRkcmVzcwo+IHJhbmdlLgo+IAo+IFVzaW5nIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9u
IG9mIF9fYWNjZXNzX29rKCkgc3RvcHMgY29sZGZpcmUKPiB1c2VyIHNwYWNlIGZyb20gdHJpdmlh
bGx5IGFjY2Vzc2luZyBrZXJuZWwgbWVtb3J5LCBhbmQgaXMgcHJvYmFibHkKPiB0aGUgcmlnaHQg
dGhpbmcgZWxzZXdoZXJlIGZvciBjb25zaXN0ZW5jeSBhcyB3ZWxsLgoKUGVyaGFwcyBzaW1wbHkg
d3JhcCB0aGF0IHN1Y2tlciBpbnRvICNpZmRlZiBDT05GSUdfQ1BVX0hBU19BRERSRVNTX1NQQUNF
UwooYW5kIHRyaW0gdGhlIGNvbW1lbnQgZG93biB0byAiY29sZGZpcmUgYW5kIDY4MDAwIHdpbGwg
cGljayBnZW5lcmljCnZhcmlhbnQiKT8KCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8
IDEzIC0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IGluZGV4IGQ2YmI1NzIwMzY1YS4uNjQ5MTQ4NzJhNWM5
IDEwMDY0NAo+IC0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9h
cmNoL202OGsvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTEwLDE5ICsxMCw2IEBACj4gICNp
bmNsdWRlIDxsaW51eC9jb21waWxlci5oPgo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAg
I2luY2x1ZGUgPGFzbS9leHRhYmxlLmg+Cj4gLQo+IC0vKiBXZSBsZXQgdGhlIE1NVSBkbyBhbGwg
Y2hlY2tpbmcgKi8KPiAtc3RhdGljIGlubGluZSBpbnQgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBf
X3VzZXIgKmFkZHIsCj4gLQkJCSAgICB1bnNpZ25lZCBsb25nIHNpemUpCj4gLXsKPiAtCS8qCj4g
LQkgKiBYWFg6IGZvciAhQ09ORklHX0NQVV9IQVNfQUREUkVTU19TUEFDRVMgdGhpcyByZWFsbHkg
bmVlZHMgdG8gY2hlY2sKPiAtCSAqIGZvciBUQVNLX1NJWkUhCj4gLQkgKiBSZW1vdmluZyB0aGlz
IGhlbHBlciBpcyBwcm9iYWJseSBzdWZmaWNpZW50Lgo+IC0JICovCj4gLQlyZXR1cm4gMTsKPiAt
fQo+IC0jZGVmaW5lIF9fYWNjZXNzX29rIF9fYWNjZXNzX29rCj4gICNpbmNsdWRlIDxhc20tZ2Vu
ZXJpYy9hY2Nlc3Nfb2suaD4KPiAgCj4gIC8qCj4gLS0gCj4gMi4yOS4yCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
