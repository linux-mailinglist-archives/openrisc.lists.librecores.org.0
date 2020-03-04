Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D746617D60C
	for <lists+openrisc@lfdr.de>; Sun,  8 Mar 2020 21:11:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 30D1020A2E;
	Sun,  8 Mar 2020 21:11:37 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id E9994208BD
 for <openrisc@lists.librecores.org>; Wed,  4 Mar 2020 06:19:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE0E31B;
 Tue,  3 Mar 2020 21:19:31 -0800 (PST)
Received: from [10.163.1.88] (unknown [10.163.1.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDBA3F6CF;
 Tue,  3 Mar 2020 21:19:16 -0800 (PST)
To: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
 <b243be54-7b5e-c6e9-fb68-46369d7d7aa4@suse.cz>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <8b0f4c1b-f693-e139-4f66-ee4e1e88b95c@arm.com>
Date: Wed, 4 Mar 2020 10:49:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b243be54-7b5e-c6e9-fb68-46369d7d7aa4@suse.cz>
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

CgpPbiAwMy8wMy8yMDIwIDEwOjU1IFBNLCBWbGFzdGltaWwgQmFia2Egd3JvdGU6Cj4gT24gMy8y
LzIwIDc6NDcgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+PiBUaGVyZSBhcmUgbWFueSBw
bGF0Zm9ybXMgd2l0aCBleGFjdCBzYW1lIHZhbHVlIGZvciBWTV9EQVRBX0RFRkFVTFRfRkxBR1MK
Pj4gVGhpcyBjcmVhdGVzIGEgZGVmYXVsdCB2YWx1ZSBmb3IgVk1fREFUQV9ERUZBVUxUX0ZMQUdT
IGluIGxpbmUgd2l0aCB0aGUKPj4gZXhpc3RpbmcgVk1fU1RBQ0tfREVGQVVMVF9GTEFHUy4gV2hp
bGUgaGVyZSwgYWxzbyBkZWZpbmUgc29tZSBtb3JlIG1hY3Jvcwo+PiB3aXRoIHN0YW5kYXJkIFZN
QSBhY2Nlc3MgZmxhZyBjb21iaW5hdGlvbnMgdGhhdCBhcmUgdXNlZCBmcmVxdWVudGx5IGFjcm9z
cwo+PiBtYW55IHBsYXRmb3Jtcy4gQXBhcnQgZnJvbSBzaW1wbGlmaWNhdGlvbiwgdGhpcyByZWR1
Y2VzIGNvZGUgZHVwbGljYXRpb24KPj4gYXMgd2VsbC4KPj4KPj4gQ2M6IFJpY2hhcmQgSGVuZGVy
c29uIDxydGhAdHdpZGRsZS5uZXQ+Cj4+IENjOiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5
cy5jb20+Cj4+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPj4gQ2M6
IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4+IENjOiBNYXJrIFNh
bHRlciA8bXNhbHRlckByZWRoYXQuY29tPgo+PiBDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+Cj4+IENjOiBZb3NoaW5vcmkgU2F0byA8eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+Cj4+
IENjOiBCcmlhbiBDYWluIDxiY2FpbkBjb2RlYXVyb3JhLm9yZz4KPj4gQ2M6IFRvbnkgTHVjayA8
dG9ueS5sdWNrQGludGVsLmNvbT4KPj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+Cj4+IENjOiBNaWNoYWwgU2ltZWsgPG1vbnN0ckBtb25zdHIuZXU+Cj4+IENj
OiBSYWxmIEJhZWNobGUgPHJhbGZAbGludXgtbWlwcy5vcmc+Cj4+IENjOiBQYXVsIEJ1cnRvbiA8
cGF1bGJ1cnRvbkBrZXJuZWwub3JnPgo+PiBDYzogTmljayBIdSA8bmlja2h1QGFuZGVzdGVjaC5j
b20+Cj4+IENjOiBMZXkgRm9vbiBUYW4gPGxleS5mb29uLnRhbkBpbnRlbC5jb20+Cj4+IENjOiBK
b25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+Cj4+IENjOiAiSmFtZXMgRS5KLiBCb3R0b21s
ZXkiIDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgo+PiBDYzogTWljaGFl
bCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+PiBDYzogUGF1bCBXYWxtc2xleSA8cGF1
bC53YWxtc2xleUBzaWZpdmUuY29tPgo+PiBDYzogSGVpa28gQ2Fyc3RlbnMgPGhlaWtvLmNhcnN0
ZW5zQGRlLmlibS5jb20+Cj4+IENjOiBSaWNoIEZlbGtlciA8ZGFsaWFzQGxpYmMub3JnPgo+PiBD
YzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4+IENjOiBHdWFuIFh1
ZXRhbyA8Z3h0QHBrdS5lZHUuY24+Cj4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4KPj4gQ2M6IEplZmYgRGlrZSA8amRpa2VAYWRkdG9pdC5jb20+Cj4+IENjOiBDaHJp
cyBaYW5rZWwgPGNocmlzQHphbmtlbC5uZXQ+Cj4+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgo+PiBDYzogbGludXgtYWxwaGFAdmdlci5rZXJuZWwub3JnCj4+
IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4gQ2M6IGxpbnV4LWM2eC1kZXZAbGludXgtYzZ4Lm9yZwo+PiBDYzogdWNsaW51eC1o
OC1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5qcAo+PiBDYzogbGludXgtaGV4YWdvbkB2Z2VyLmtl
cm5lbC5vcmcKPj4gQ2M6IGxpbnV4LWlhNjRAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1t
NjhrQGxpc3RzLmxpbnV4LW02OGsub3JnCj4+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9y
Zwo+PiBDYzogbmlvczItZGV2QGxpc3RzLnJvY2tldGJvYXJkcy5vcmcKPj4gQ2M6IG9wZW5yaXNj
QGxpc3RzLmxpYnJlY29yZXMub3JnCj4+IENjOiBsaW51eC1wYXJpc2NAdmdlci5rZXJuZWwub3Jn
Cj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+PiBDYzogbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPj4g
Q2M6IGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZwo+PiBDYzogc3BhcmNsaW51eEB2Z2VyLmtlcm5l
bC5vcmcKPj4gQ2M6IGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LXh0
ZW5zYUBsaW51eC14dGVuc2Eub3JnCj4+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPj4gU2lnbmVk
LW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20KPiBS
ZXZpZXdlZC1ieTogVmxhc3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4KPiAKPiBOaXQ6Cj4g
Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgK
Pj4gaW5kZXggYjBlNTNlZjEzZmYxLi43YTc2NGFlNmFiNjggMTAwNjQ0Cj4+IC0tLSBhL2luY2x1
ZGUvbGludXgvbW0uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4gQEAgLTM0Miw2ICsz
NDIsMjEgQEAgZXh0ZXJuIHVuc2lnbmVkIGludCBrb2Jqc2l6ZShjb25zdCB2b2lkICpvYmpwKTsK
Pj4gIC8qIEJpdHMgc2V0IGluIHRoZSBWTUEgdW50aWwgdGhlIHN0YWNrIGlzIGluIGl0cyBmaW5h
bCBsb2NhdGlvbiAqLwo+PiAgI2RlZmluZSBWTV9TVEFDS19JTkNPTVBMRVRFX1NFVFVQCShWTV9S
QU5EX1JFQUQgfCBWTV9TRVFfUkVBRCkKPj4gIAo+PiArI2RlZmluZSBUQVNLX0VYRUMgKChjdXJy
ZW50LT5wZXJzb25hbGl0eSAmIFJFQURfSU1QTElFU19FWEVDKSA/IFZNX0VYRUMgOiAwKQo+PiAr
Cj4+ICsvKiBDb21tb24gZGF0YSBmbGFnIGNvbWJpbmF0aW9ucyAqLwo+PiArI2RlZmluZSBWTV9E
QVRBX0ZMQUdTX1RTS19FWEVDCShWTV9SRUFEIHwgVk1fV1JJVEUgfCBUQVNLX0VYRUMgfCBcCj4+
ICsJCQkJIFZNX01BWVJFQUQgfCBWTV9NQVlXUklURSB8IFZNX01BWUVYRUMpCj4+ICsjZGVmaW5l
IFZNX0RBVEFfRkxBR1NfTk9OX0VYRUMJKFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX01BWVJFQUQg
fCBcCj4+ICsJCQkJIFZNX01BWVdSSVRFIHwgVk1fTUFZRVhFQykKPj4gKyNkZWZpbmUgVk1fREFU
QV9GTEFHU19FWEVDCShWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVDIHwgXAo+PiArCQkJCSBW
TV9NQVlSRUFEIHwgVk1fTUFZV1JJVEUgfCBWTV9NQVlFWEVDKQo+PiArCj4+ICsjaWZuZGVmIFZN
X0RBVEFfREVGQVVMVF9GTEFHUwkJLyogYXJjaCBjYW4gb3ZlcnJpZGUgdGhpcyAqLwo+PiArI2Rl
ZmluZSBWTV9EQVRBX0RFRkFVTFRfRkxBR1MJKFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMg
fCBcCj4+ICsJCQkJIFZNX01BWVJFQUQgfCBWTV9NQVlXUklURSB8IFZNX01BWUVYRUMpCj4gCj4g
U2hvdWxkIHlvdSB1c2UgVk1fREFUQV9GTEFHU19FWEVDIGhlcmU/IFllYWggb25lIG1vcmUgbWFj
cm8gdG8gZXhwYW5kLCBidXQgaXQncwo+IHJpZ2h0IGFib3ZlIHRoaXMuCgpTdXJlLCBjYW4gZG8g
dGhhdC4KCj4gCj4+ICsjZW5kaWYKPj4gKwo+PiAgI2lmbmRlZiBWTV9TVEFDS19ERUZBVUxUX0ZM
QUdTCQkvKiBhcmNoIGNhbiBvdmVycmlkZSB0aGlzICovCj4+ICAjZGVmaW5lIFZNX1NUQUNLX0RF
RkFVTFRfRkxBR1MgVk1fREFUQV9ERUZBVUxUX0ZMQUdTCj4+ICAjZW5kaWYKPj4KPiAKPiAKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
