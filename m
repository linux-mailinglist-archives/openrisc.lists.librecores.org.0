Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 04D0B4BED46
	for <lists+openrisc@lfdr.de>; Mon, 21 Feb 2022 23:36:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7C5EB247DD;
	Mon, 21 Feb 2022 23:36:35 +0100 (CET)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id 557B0246C7
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 14:25:48 +0100 (CET)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nM8h9-0001Eo-00; Mon, 21 Feb 2022 14:25:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id E4525C25DD; Mon, 21 Feb 2022 14:24:56 +0100 (CET)
Date: Mon, 21 Feb 2022 14:24:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220221132456.GA7139@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-10-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 21 Feb 2022 23:36:34 +0100
Subject: Re: [OpenRISC] [PATCH v2 09/18] mips: use simpler access_ok()
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
 viro@zeniv.linux.org.uk, monstr@monstr.eu, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, jcmvbkbc@gmail.com, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDI6MTM6MjNQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBi
L2FyY2gvbWlwcy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCBkYjlhOGUwMDJiNjIuLmQ3
Yzg5ZGMzNDI2YyAxMDA2NDQKPiAtLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
Cj4gKysrIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC0xOSw2ICsxOSw3
IEBACj4gICNpZmRlZiBDT05GSUdfMzJCSVQKPiAgCj4gICNkZWZpbmUgX19VQV9MSU1JVCAweDgw
MDAwMDAwVUwKPiArI2RlZmluZSBUQVNLX1NJWkVfTUFYCV9fVUFfTElNSVQKPiAgCj4gICNkZWZp
bmUgX19VQV9BRERSCSIud29yZCIKPiAgI2RlZmluZSBfX1VBX0xBCQkibGEiCj4gQEAgLTMzLDYg
KzM0LDcgQEAKPiAgZXh0ZXJuIHU2NCBfX3VhX2xpbWl0Owo+ICAKPiAgI2RlZmluZSBfX1VBX0xJ
TUlUCV9fdWFfbGltaXQKPiArI2RlZmluZSBUQVNLX1NJWkVfTUFYCVhLU1NFRwoKdGhpcyBkb2Vz
bid0IHdvcmsuIEZvciBldmVyeSBhY2Nlc3MgYWJvdmUgbWF4aW11bSBpbXBsZW1lbnRlZCB2aXJ0
dWFsIGFkZHJlc3MKc3BhY2Ugb2YgdGhlIENQVSBhbiBhZGRyZXNzIGVycm9yIHdpbGwgYmUgaXNz
dWVkLCBidXQgbm90IGEgVExCIG1pc3MuCkFuZCBhZGRyZXNzIGVycm9yIGlzbid0IGFibGUgdG8g
aGFuZGxlIHRoaXMgc2l0dWF0aW9uLgoKV2l0aCB0aGlzIHBhdGNoCgpkaWZmIC0tZ2l0IGEvYXJj
aC9taXBzL2tlcm5lbC91bmFsaWduZWQuYyBiL2FyY2gvbWlwcy9rZXJuZWwvdW5hbGlnbmVkLmMK
aW5kZXggZGY0YjcwOGMwNGE5Li4zOTExZjE0ODFmM2QgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9r
ZXJuZWwvdW5hbGlnbmVkLmMKKysrIGIvYXJjaC9taXBzL2tlcm5lbC91bmFsaWduZWQuYwpAQCAt
MTQ4MCw2ICsxNDgwLDEzIEBAIGFzbWxpbmthZ2Ugdm9pZCBkb19hZGUoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCiAJcHJldl9zdGF0ZSA9IGV4Y2VwdGlvbl9lbnRlcigpOwogCXBlcmZfc3dfZXZlbnQo
UEVSRl9DT1VOVF9TV19BTElHTk1FTlRfRkFVTFRTLAogCQkJMSwgcmVncywgcmVncy0+Y3AwX2Jh
ZHZhZGRyKTsKKworCS8qIEFyZSB3ZSBwcmVwYXJlZCB0byBoYW5kbGUgdGhpcyBrZXJuZWwgZmF1
bHQ/CSAqLworCWlmIChmaXh1cF9leGNlcHRpb24ocmVncykpIHsKKwkJY3VycmVudC0+dGhyZWFk
LmNwMF9iYWR1YWRkciA9IHJlZ3MtPmNwMF9iYWR2YWRkcjsKKwkJcmV0dXJuOworCX0KKwogCS8q
CiAJICogRGlkIHdlIGNhdGNoIGEgZmF1bHQgdHJ5aW5nIHRvIGxvYWQgYW4gaW5zdHJ1Y3Rpb24/
CiAJICovCgpJIGF0IGxlYXN0IGdldCBteSBzaW1wbGUgdGVzdCBjYXNlcyBmaXhlZCwgYnV0IEkn
bSBub3Qgc3VyZSB0aGlzIGlzCmNvcnJlY3QuCgpJcyB0aGVyZSBhIHJlYXNvbiB0byBub3QgYWxz
byAjZGVmaW5lIFRBU0tfU0laRV9NQVggICBfX1VBX0xJTUlUIGxpa2UKZm9yIHRoZSAzMmJpdCBj
YXNlID8KClRob21hcy4KCi0tIApDcmFwIGNhbiB3b3JrLiBHaXZlbiBlbm91Z2ggdGhydXN0IHBp
Z3Mgd2lsbCBmbHksIGJ1dCBpdCdzIG5vdCBuZWNlc3NhcmlseSBhCmdvb2QgaWRlYS4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIFJGQzE5MjUsIDIuMyBd
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
