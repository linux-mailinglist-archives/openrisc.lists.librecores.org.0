Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D6C5C17D60B
	for <lists+openrisc@lfdr.de>; Sun,  8 Mar 2020 21:11:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F3076207EA;
	Sun,  8 Mar 2020 21:11:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id 40A1C2097A
 for <openrisc@lists.librecores.org>; Tue,  3 Mar 2020 18:25:22 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BED26ACB8;
 Tue,  3 Mar 2020 17:25:16 +0000 (UTC)
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <b243be54-7b5e-c6e9-fb68-46369d7d7aa4@suse.cz>
Date: Tue, 3 Mar 2020 18:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 08 Mar 2020 21:11:35 +0100
Subject: Re: [OpenRISC] [RFC 1/3] mm/vma: Define a default value for
 VM_DATA_DEFAULT_FLAGS
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
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Paul Burton <paulburton@kernel.org>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMy8yLzIwIDc6NDcgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IFRoZXJlIGFyZSBt
YW55IHBsYXRmb3JtcyB3aXRoIGV4YWN0IHNhbWUgdmFsdWUgZm9yIFZNX0RBVEFfREVGQVVMVF9G
TEFHUwo+IFRoaXMgY3JlYXRlcyBhIGRlZmF1bHQgdmFsdWUgZm9yIFZNX0RBVEFfREVGQVVMVF9G
TEFHUyBpbiBsaW5lIHdpdGggdGhlCj4gZXhpc3RpbmcgVk1fU1RBQ0tfREVGQVVMVF9GTEFHUy4g
V2hpbGUgaGVyZSwgYWxzbyBkZWZpbmUgc29tZSBtb3JlIG1hY3Jvcwo+IHdpdGggc3RhbmRhcmQg
Vk1BIGFjY2VzcyBmbGFnIGNvbWJpbmF0aW9ucyB0aGF0IGFyZSB1c2VkIGZyZXF1ZW50bHkgYWNy
b3NzCj4gbWFueSBwbGF0Zm9ybXMuIEFwYXJ0IGZyb20gc2ltcGxpZmljYXRpb24sIHRoaXMgcmVk
dWNlcyBjb2RlIGR1cGxpY2F0aW9uCj4gYXMgd2VsbC4KPiAKPiBDYzogUmljaGFyZCBIZW5kZXJz
b24gPHJ0aEB0d2lkZGxlLm5ldD4KPiBDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMu
Y29tPgo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiBDYzogQ2F0
YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBDYzogTWFyayBTYWx0ZXIg
PG1zYWx0ZXJAcmVkaGF0LmNvbT4KPiBDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4g
Q2M6IFlvc2hpbm9yaSBTYXRvIDx5c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4KPiBDYzogQnJp
YW4gQ2FpbiA8YmNhaW5AY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFRvbnkgTHVjayA8dG9ueS5sdWNr
QGludGVsLmNvbT4KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KPiBDYzogTWljaGFsIFNpbWVrIDxtb25zdHJAbW9uc3RyLmV1Pgo+IENjOiBSYWxmIEJhZWNo
bGUgPHJhbGZAbGludXgtbWlwcy5vcmc+Cj4gQ2M6IFBhdWwgQnVydG9uIDxwYXVsYnVydG9uQGtl
cm5lbC5vcmc+Cj4gQ2M6IE5pY2sgSHUgPG5pY2todUBhbmRlc3RlY2guY29tPgo+IENjOiBMZXkg
Rm9vbiBUYW4gPGxleS5mb29uLnRhbkBpbnRlbC5jb20+Cj4gQ2M6IEpvbmFzIEJvbm4gPGpvbmFz
QHNvdXRocG9sZS5zZT4KPiBDYzogIkphbWVzIEUuSi4gQm90dG9tbGV5IiA8SmFtZXMuQm90dG9t
bGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4KPiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVs
bGVybWFuLmlkLmF1Pgo+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5j
b20+Cj4gQ2M6IEhlaWtvIENhcnN0ZW5zIDxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgo+IENj
OiBSaWNoIEZlbGtlciA8ZGFsaWFzQGxpYmMub3JnPgo+IENjOiAiRGF2aWQgUy4gTWlsbGVyIiA8
ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBDYzogR3VhbiBYdWV0YW8gPGd4dEBwa3UuZWR1LmNuPgo+
IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogSmVmZiBEaWtl
IDxqZGlrZUBhZGR0b2l0LmNvbT4KPiBDYzogQ2hyaXMgWmFua2VsIDxjaHJpc0B6YW5rZWwubmV0
Pgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBs
aW51eC1hbHBoYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwo+IENjOiBsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1jNngtZGV2QGxpbnV4
LWM2eC5vcmcKPiBDYzogdWNsaW51eC1oOC1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5qcAo+IENj
OiBsaW51eC1oZXhhZ29uQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1pYTY0QHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW51eC1tNjhrQGxpc3RzLmxpbnV4LW02OGsub3JnCj4gQ2M6IGxpbnV4
LW1pcHNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IG5pb3MyLWRldkBsaXN0cy5yb2NrZXRib2FyZHMu
b3JnCj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCj4gQ2M6IGxpbnV4LXBhcmlz
Y0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPiBD
YzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zMzkwQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBsaW51eC1zaEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogc3BhcmNsaW51
eEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtdW1AbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC14dGVuc2FAbGludXgteHRlbnNhLm9yZwo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJt
LmNvbQpSZXZpZXdlZC1ieTogVmxhc3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4KCk5pdDoK
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+
IGluZGV4IGIwZTUzZWYxM2ZmMS4uN2E3NjRhZTZhYjY4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvbW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC0zNDIsNiArMzQyLDIx
IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQga29ianNpemUoY29uc3Qgdm9pZCAqb2JqcCk7Cj4gIC8q
IEJpdHMgc2V0IGluIHRoZSBWTUEgdW50aWwgdGhlIHN0YWNrIGlzIGluIGl0cyBmaW5hbCBsb2Nh
dGlvbiAqLwo+ICAjZGVmaW5lIFZNX1NUQUNLX0lOQ09NUExFVEVfU0VUVVAJKFZNX1JBTkRfUkVB
RCB8IFZNX1NFUV9SRUFEKQo+ICAKPiArI2RlZmluZSBUQVNLX0VYRUMgKChjdXJyZW50LT5wZXJz
b25hbGl0eSAmIFJFQURfSU1QTElFU19FWEVDKSA/IFZNX0VYRUMgOiAwKQo+ICsKPiArLyogQ29t
bW9uIGRhdGEgZmxhZyBjb21iaW5hdGlvbnMgKi8KPiArI2RlZmluZSBWTV9EQVRBX0ZMQUdTX1RT
S19FWEVDCShWTV9SRUFEIHwgVk1fV1JJVEUgfCBUQVNLX0VYRUMgfCBcCj4gKwkJCQkgVk1fTUFZ
UkVBRCB8IFZNX01BWVdSSVRFIHwgVk1fTUFZRVhFQykKPiArI2RlZmluZSBWTV9EQVRBX0ZMQUdT
X05PTl9FWEVDCShWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9NQVlSRUFEIHwgXAo+ICsJCQkJIFZN
X01BWVdSSVRFIHwgVk1fTUFZRVhFQykKPiArI2RlZmluZSBWTV9EQVRBX0ZMQUdTX0VYRUMJKFZN
X1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMgfCBcCj4gKwkJCQkgVk1fTUFZUkVBRCB8IFZNX01B
WVdSSVRFIHwgVk1fTUFZRVhFQykKPiArCj4gKyNpZm5kZWYgVk1fREFUQV9ERUZBVUxUX0ZMQUdT
CQkvKiBhcmNoIGNhbiBvdmVycmlkZSB0aGlzICovCj4gKyNkZWZpbmUgVk1fREFUQV9ERUZBVUxU
X0ZMQUdTCShWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVDIHwgXAo+ICsJCQkJIFZNX01BWVJF
QUQgfCBWTV9NQVlXUklURSB8IFZNX01BWUVYRUMpCgpTaG91bGQgeW91IHVzZSBWTV9EQVRBX0ZM
QUdTX0VYRUMgaGVyZT8gWWVhaCBvbmUgbW9yZSBtYWNybyB0byBleHBhbmQsIGJ1dCBpdCdzCnJp
Z2h0IGFib3ZlIHRoaXMuCgo+ICsjZW5kaWYKPiArCj4gICNpZm5kZWYgVk1fU1RBQ0tfREVGQVVM
VF9GTEFHUwkJLyogYXJjaCBjYW4gb3ZlcnJpZGUgdGhpcyAqLwo+ICAjZGVmaW5lIFZNX1NUQUNL
X0RFRkFVTFRfRkxBR1MgVk1fREFUQV9ERUZBVUxUX0ZMQUdTCj4gICNlbmRpZgo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
