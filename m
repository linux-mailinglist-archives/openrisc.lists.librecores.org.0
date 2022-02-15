Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C29434B6B78
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 12:48:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1EB0224831;
	Tue, 15 Feb 2022 12:48:14 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id E85D124825
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 11:37:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31BC21063;
 Tue, 15 Feb 2022 02:37:29 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CBA53F66F;
 Tue, 15 Feb 2022 02:37:22 -0800 (PST)
Date: Tue, 15 Feb 2022 10:37:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <YguB5BeLoRc4dL7P@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 15 Feb 2022 12:48:13 +0100
Subject: Re: [OpenRISC] [PATCH 08/14] arm64: simplify access_ok()
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MjE6MTZBTSArMDEwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gVHVlLCAxNSBGZWIgMjAyMiBhdCAxMDoxMywgQXJuZCBCZXJnbWFubiA8YXJu
ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCA5OjE3
IEFNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBNb24s
IDE0IEZlYiAyMDIyIGF0IDE3OjM3LCBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiA+ID4K
PiA+ID4KPiA+ID4gV2l0aCBzZXRfZnMoKSBvdXQgb2YgdGhlIHBpY3R1cmUsIHdvdWxkbid0IGl0
IGJlIHN1ZmZpY2llbnQgdG8gY2hlY2sKPiA+ID4gdGhhdCBiaXQgIzU1IGlzIGNsZWFyPyAodGhl
IGJpdCB0aGF0IHNlbGVjdHMgYmV0d2VlbiBUVEJSMCBhbmQgVFRCUjEpCj4gPiA+IFRoYXQgd291
bGQgYWxzbyByZW1vdmUgdGhlIG5lZWQgdG8gc3RyaXAgdGhlIHRhZyBmcm9tIHRoZSBhZGRyZXNz
Lgo+ID4gPgo+ID4gPiBTb21ldGhpbmcgbGlrZQo+ID4gPgo+ID4gPiAgICAgYXNtIGdvdG8oInRi
bnogICUwLCAjNTUsICUyICAgICBcbiIKPiA+ID4gICAgICAgICAgICAgICJ0Ym56ICAlMSwgIzU1
LCAlMiAgICAgXG4iCj4gPiA+ICAgICAgICAgICAgICA6OiAiciIoYWRkciksICJyIihhZGRyICsg
c2l6ZSAtIDEpIDo6IG5vdG9rKTsKPiA+ID4gICAgIHJldHVybiAxOwo+ID4gPiBub3RvazoKPiA+
ID4gICAgIHJldHVybiAwOwo+ID4gPgo+ID4gPiB3aXRoIGFuIGFkZGl0aW9uYWwgc2FuaXR5IGNo
ZWNrIG9uIHRoZSBzaXplIHdoaWNoIHRoZSBjb21waWxlciBjb3VsZAo+ID4gPiBlbGltaW5hdGUg
Zm9yIGNvbXBpbGUtdGltZSBjb25zdGFudCB2YWx1ZXMuCj4gPgo+ID4gVGhhdCBzaG91bGQgd29y
aywgYnV0IEkgZG9uJ3Qgc2VlIGl0IGFzIGEgY2xlYXIgZW5vdWdoIGFkdmFudGFnZSB0bwo+ID4g
aGF2ZSBhIGN1c3RvbSBpbXBsZW1lbnRhdGlvbi4gRm9yIHRoZSBjb25zdGFudC1zaXplIGNhc2Us
IGl0IHByb2JhYmx5Cj4gPiBpc24ndCBiZXR0ZXIgdGhhbiBhIGNvbXBpbGVyLXNjaGVkdWxlZCBj
b21wYXJpc29uIGFnYWluc3QgYQo+ID4gY29uc3RhbnQgbGltaXQsIGJ1dCBpdCBkb2VzIGh1cnQg
bWFpbnRhaW5hYmlsaXR5IHdoZW4gdGhlIG5leHQgcGVyc29uCj4gPiB3YW50cyB0byBjaGFuZ2Ug
dGhlIGJlaGF2aW9yIG9mIGFjY2Vzc19vaygpIGdsb2JhbGx5Lgo+ID4KPiAKPiBhcm02NCBhbHNv
IGhhcyB0aGlzIGxlYWRpbmcgdXAgdG8gdGhlIHJhbmdlIGNoZWNrLCBhbmQgSSB0aGluayB3ZSdk
IG5vCj4gbG9uZ2VyIG5lZWQgaXQ6Cj4gCj4gICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19BUk02
NF9UQUdHRURfQUREUl9BQkkpICYmCj4gICAgICAgICAoY3VycmVudC0+ZmxhZ3MgJiBQRl9LVEhS
RUFEIHx8IHRlc3RfdGhyZWFkX2ZsYWcoVElGX1RBR0dFRF9BRERSKSkpCj4gICAgICAgICAgICAg
YWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4gCgpBQkktd2lzZSwgd2UgYWltIHRvICpyZWpl
Y3QqIHRhZ2dlZCBwb2ludGVycyB1bmxlc3MgdGhlIHRhc2sgaXMgdXNpbmcgdGhlCnRhZ2dlZCBh
ZGRyIEFCSSwgc28gd2UgbmVlZCB0byByZXRhaW4gYm90aCB0aGUgdW50YWdnaW5nIGxvZ2ljIGFu
ZCB0aGUgZnVsbApwb2ludGVyIGNoZWNrICh0byBhY3R1YWxseSBjaGVjayB0aGUgdGFnIGJpdHMp
IHVubGVzcyB3ZSByZWxheCB0aGF0IEFCSQpkZWNpc2lvbiBnZW5lcmFsbHkgKG9yIGdvIGNvbnRl
eHQtc3dpdGNoIHRoZSBUQ1JfRUwxLlRCSSogYml0cykuCgpTaW5jZSB0aGF0IGhhcyBzdWJ0bGUg
QUJJIGltcGxpY2F0aW9ucywgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgY2hhbmdlIHRoYXQKd2l0
aGluIHRoaXMgc2VyaWVzLgoKSWYgd2UgKmRpZCogcmVsYXggdGhpbmdzLCB3ZSBjb3VsZCBqdXN0
IGNoZWNrIGJpdCA1NSBoZXJlLCBhbmQgdW5jb25kaXRpb25hbGx5CmNsZWFyIHRoYXQgaW4gdWFj
Y2Vzc19tYXNrX3B0cigpLCBzaW5jZSBMRFRSL1NUVFIgc2hvdWxkIGZhdWx0IG9uIGtlcm5lbCBt
ZW1vcnkuCk9uIHBhcnRzIHdpdGggbWVsdGRvd24gdGhvc2UgbWlnaHQgbm90IGZhdWx0IHVudGls
IGNvbW1pdHRlZCwgYW5kIHNvIHdlIG5lZWQKbWFza2luZyB0byBhdm9pZCBzcGVjdWxhdGl2ZSBh
Y2Nlc3MgdG8gYSBrZXJuZWwgcG9pbnRlciwgYW5kIHRoYXQgcmVxdWlyZXMgdGhlCnByaW9yIGV4
cGxjaWl0IGNoZWNrLgoKVGhhbmtzLApNYXJrLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
