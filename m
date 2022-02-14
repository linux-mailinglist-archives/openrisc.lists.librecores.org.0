Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 216624B5C00
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 22:09:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B9D7124042;
	Mon, 14 Feb 2022 22:09:39 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id EEC5B23FA6
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 18:16:41 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJewf-001kzp-JJ; Mon, 14 Feb 2022 17:15:25 +0000
Date: Mon, 14 Feb 2022 17:15:25 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-8-arnd@kernel.org>
X-Mailman-Approved-At: Mon, 14 Feb 2022 22:09:38 +0100
Subject: Re: [OpenRISC] [PATCH 07/14] uaccess: generalize access_ok()
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

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDVQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKCj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL2Nz
a3kva2VybmVsL3NpZ25hbC5jCj4gaW5kZXggYzdiNzYzZDJmNTI2Li44ODY3ZGRmM2U2YzcgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9jc2t5L2tlcm5lbC9zaWduYWwuYwo+ICsrKyBiL2FyY2gvY3NreS9r
ZXJuZWwvc2lnbmFsLmMKPiBAQCAtMTM2LDcgKzEzNiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X3VzZXIgKmdldF9zaWdmcmFtZShzdHJ1Y3Qga3NpZ25hbCAqa3NpZywKPiAgc3RhdGljIGludAo+
ICBzZXR1cF9ydF9mcmFtZShzdHJ1Y3Qga3NpZ25hbCAqa3NpZywgc2lnc2V0X3QgKnNldCwgc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiAtCXN0cnVjdCBydF9zaWdmcmFtZSAqZnJhbWU7Cj4g
KwlzdHJ1Y3QgcnRfc2lnZnJhbWUgX191c2VyICpmcmFtZTsKPiAgCWludCBlcnIgPSAwOwo+ICAK
PiAgCWZyYW1lID0gZ2V0X3NpZ2ZyYW1lKGtzaWcsIHJlZ3MsIHNpemVvZigqZnJhbWUpKTsKCk1p
bm9yIG5pdDogbWlnaHQgbWFrZSBzZW5zZSB0byBzZXBhcmF0ZSBhbm5vdGF0aW9ucyAoaGVyZSwg
b24gbmlvczIsIGV0Yy4pIGZyb20gdGhlIHJlc3QuLi4KClRoaXMsIE9UT0gsCgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaCBiL2FyY2gvc3BhcmMvaW5j
bHVkZS9hc20vdWFjY2Vzc182NC5oCj4gaW5kZXggNWMxMmZiNDZiYzYxLi4wMDBiYWM2N2NmMzEg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS91YWNjZXNzXzY0LmgKPiArKysg
Yi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaAouLi4KPiAtc3RhdGljIGlubGlu
ZSBib29sIF9fY2hrX3JhbmdlX25vdF9vayh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxv
bmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBsaW1pdCkKPiAtewo+IC0JaWYgKF9fYnVpbHRpbl9jb25z
dGFudF9wKHNpemUpKQo+IC0JCXJldHVybiBhZGRyID4gbGltaXQgLSBzaXplOwo+IC0KPiAtCWFk
ZHIgKz0gc2l6ZTsKPiAtCWlmIChhZGRyIDwgc2l6ZSkKPiAtCQlyZXR1cm4gdHJ1ZTsKPiAtCj4g
LQlyZXR1cm4gYWRkciA+IGxpbWl0Owo+IC19Cj4gLQo+IC0jZGVmaW5lIF9fcmFuZ2Vfbm90X29r
KGFkZHIsIHNpemUsIGxpbWl0KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAtCV9fY2hrX3VzZXJfcHRyKGFkZHIpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLQlfX2Noa19yYW5nZV9ub3Rfb2soKHVuc2ln
bmVkIGxvbmcgX19mb3JjZSkoYWRkciksIHNpemUsIGxpbWl0KTsgXAo+IC19KQo+IC0KPiAtc3Rh
dGljIGlubGluZSBpbnQgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKiBhZGRyLCB1bnNp
Z25lZCBsb25nIHNpemUpCj4gLXsKPiAtCXJldHVybiAxOwo+IC19Cj4gLQo+IC1zdGF0aWMgaW5s
aW5lIGludCBhY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKiBhZGRyLCB1bnNpZ25lZCBsb25n
IHNpemUpCj4gLXsKPiAtCXJldHVybiAxOwo+IC19Cj4gKyNkZWZpbmUgX19yYW5nZV9ub3Rfb2so
YWRkciwgc2l6ZSwgbGltaXQpICghX19hY2Nlc3Nfb2soYWRkciwgc2l6ZSkpCgppcyByZWFsbHkg
d3JvbmcuICBGb3Igc3BhcmM2NCwgYWNjZXNzX29rKCkgc2hvdWxkIGFsd2F5cyBiZSB0cnVlLgpU
aGlzIF9fcmFuZ2Vfbm90X29rKCkgdGhpbmcgaXMgdXNlZCAqb25seSogZm9yIHZhbGlkX3VzZXJf
ZnJhbWUoKSBpbgphcmNoL3NwYXJjL2tlcm5lbC9wZXJmX2V2ZW50LmMgLSBpdCdzIG5vdCBhIHBh
cnQgb2Ygbm9ybWFsIGFjY2Vzc19vaygpCnRoZXJlLgoKc3BhcmM2NCBoYXMgc2VwYXJhdGUgYWRk
cmVzcyBzcGFjZXMgZm9yIGtlcm5lbCBhbmQgZm9yIHVzZXJsYW5kOyBhY2Nlc3Nfb2soKQpoYWQg
bmV2ZXIgYmVlbiB1c2VmdWwgdGhlcmUuICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
