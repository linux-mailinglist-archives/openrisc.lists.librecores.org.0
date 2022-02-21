Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 709AA4BED47
	for <lists+openrisc@lfdr.de>; Mon, 21 Feb 2022 23:36:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 16D36247FD;
	Mon, 21 Feb 2022 23:36:36 +0100 (CET)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id E2007247C8
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 16:23:08 +0100 (CET)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nMAWk-00025w-00; Mon, 21 Feb 2022 16:23:02 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 22D4EC25F8; Mon, 21 Feb 2022 16:21:30 +0100 (CET)
Date: Mon, 21 Feb 2022 16:21:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220221152130.GA17373@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
 <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgMDM6MzE6MjNQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBNb24sIEZlYiAyMSwgMjAyMiBhdCAyOjI0IFBNIFRob21hcyBCb2dlbmRvZXJm
ZXIKPiA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAx
NiwgMjAyMiBhdCAwMjoxMzoyM1BNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gv
bWlwcy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiA+ID4gaW5kZXggZGI5YThlMDAyYjYyLi5kN2M4
OWRjMzQyNmMgMTAwNjQ0Cj4gPgo+ID4gdGhpcyBkb2Vzbid0IHdvcmsuIEZvciBldmVyeSBhY2Nl
c3MgYWJvdmUgbWF4aW11bSBpbXBsZW1lbnRlZCB2aXJ0dWFsIGFkZHJlc3MKPiA+IHNwYWNlIG9m
IHRoZSBDUFUgYW4gYWRkcmVzcyBlcnJvciB3aWxsIGJlIGlzc3VlZCwgYnV0IG5vdCBhIFRMQiBt
aXNzLgo+ID4gQW5kIGFkZHJlc3MgZXJyb3IgaXNuJ3QgYWJsZSB0byBoYW5kbGUgdGhpcyBzaXR1
YXRpb24uCj4gCj4gQWgsIHNvIHRoZSBfX2V4X3RhYmxlIGVudHJ5IG9ubHkgY2F0Y2hlcyBUTEIg
bWlzc2VzPwoKbm8sIGJ1dCB0aGVyZSBpcyBubyBfX2V4X3RhYmxlIGhhbmRsaW5nIGluIGFkZHJl
c3MgZXJyb3IgaGFubGRlciAoeWV0KS4KCj4gRG9lcyB0aGlzIG1lYW4gaXQgYWxzbyB0cmFwcyBm
b3Iga2VybmVsIG1lbW9yeSBhY2Nlc3Nlcywgb3IgZG8gdGhvc2UKPiB3b3JrIGFnYWluPwoKaXQg
d2lsbCB0cmFwIGZvciBldmVyeSBhY2Nlc3MuCgoKPiBJZiB0aGUgYWRkcmVzc2VzIG9uIG1pcHM2
NCBhcmUgc2VwYXJhdGUgbGlrZSBvbgo+IHNwYXJjNjQgb3IgczM5MCwgdGhlIGVudGlyZSBhY2Nl
c3Nfb2soKSBzdGVwIGNvdWxkIGJlIHJlcGxhY2VkCj4gYnkgYSBmaXh1cCBjb2RlIGluIHRoZSBl
eGNlcHRpb24gaGFuZGxlci4gSSBzdXBwb3NlIHRoaXMgZGVwZW5kcyBvbgo+IENPTkZJR19FVkEg
YW5kIHlvdSBzdGlsbCBuZWVkIGEgbGltaXQgY2hlY2sgYXQgbGVhc3Qgd2hlbiBFVkEgaXMKPiBk
aXNhYmxlZC4KCm9ubHkgRVZBIGhhcyBzZXBlcmF0ZSBhZGRyZXNzIHNwYWNlcyBmb3Iga2VybmVs
L3VzZXIuCgo+ID4gSXMgdGhlcmUgYSByZWFzb24gdG8gbm90IGFsc28gI2RlZmluZSBUQVNLX1NJ
WkVfTUFYICAgX19VQV9MSU1JVCBsaWtlCj4gPiBmb3IgdGhlIDMyYml0IGNhc2UgPwo+ID4KPiAK
PiBGb3IgMzItYml0LCB0aGUgX19VQV9MSU1JVCBpcyBhIGNvbXBpbGUtdGltZSBjb25zdGFudCwg
c28gdGhlIGNoZWNrCj4gZW5kcyB1cCBiZWluZyB0cml2aWFsLiBPbiBhbGwgb3RoZXIgYXJjaGl0
ZWN0dXJlcywgdGhlIHNhbWUgdGhpbmcgY2FuCj4gYmUgZG9uZSBhZnRlciB0aGUgc2V0X2ZzIHJl
bW92YWwsIHNvIEkgd2FzIGhvcGluZyBpdCB3b3VsZCB3b3JrIGhlcmUKPiBhcyB3ZWxsLgoKaWMK
Cj4gSSBzdXNwZWN0IGRvaW5nIHRoZSBnZW5lcmljIChzaXplIDw9IGxpbWl0KSAmJiAoYWRkciA8
PSAobGltaXQgLSBzaXplKSkKPiBjaGVjayBvbiBtaXBzNjQgd2l0aCB0aGUgcnVudGltZSBsaW1p
dCBlbmRzIHVwIHNsaWdodGx5IHNsb3dlcgo+IHRoYW4gdGhlIGN1cnJlbnQgY29kZSB0aGF0IGNo
ZWNrcyBhIGJpdCBtYXNrIGluc3RlYWQuIElmIHlvdSBsaWtlLAo+IEknbGwgdXBkYXRlIGl0IHRo
aXMgd2F5LCBvdGhlcndpc2UgSSdkIG5lZWQgaGVscCBpbiBmb3JtIG9mIGEgcGF0Y2gKPiB0aGF0
IGNoYW5nZXMgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBzbyBfX2dldF91c2VyL19fcHV0X3VzZXIK
PiBhbHNvIHJldHVybiAtRUZBVUxUIGZvciBhbiBhZGRyZXNzIGVycm9yLgoKdGhhdCdzIHdoYXQg
dGhlIHBhdGNoIGRvZXMuIEZvciBhbGlnbmVkIGFjY2Vzc2VzIHRoZSBwYXRjaCBzaG91bGQKZG8g
dGhlIHJpZ2h0IHRoaW5nLCBidXQgaXQgYnJlYWtzIHVuYWxpZ25lZCBnZXRfdXNlci9wdXRfdXNl
ci4KQ2hlY2tpbmcgaWYgdGhlIHRyYXBwaW5nIHZhZGRyIGlzIGJldHdlZW4gZW5kIG9mIENQVSBW
TSBzcGFjZSBhbmQKVEFTS19NQVhfU0laRSBiZWZvcmUgZXhjZXB0aW9uIGhhbmRsaW5nIHNob3Vs
ZCBkbyB0aGUgdHJpY2suIEknbGwKc2VuZCBhIHBhdGNoLCBpZiB0aGlzIHdvcmtzLgoKVGhvbWFz
LgoKLS0gCkNyYXAgY2FuIHdvcmsuIEdpdmVuIGVub3VnaCB0aHJ1c3QgcGlncyB3aWxsIGZseSwg
YnV0IGl0J3Mgbm90IG5lY2Vzc2FyaWx5IGEKZ29vZCBpZGVhLiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgUkZDMTkyNSwgMi4zIF0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
