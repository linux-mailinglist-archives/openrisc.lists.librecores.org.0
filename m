Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 980204C9C09
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 04:22:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5453524840;
	Wed,  2 Mar 2022 04:22:28 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id BF7D82483F
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 04:22:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D55FF11FB;
 Tue,  1 Mar 2022 19:22:25 -0800 (PST)
Received: from [10.163.49.202] (unknown [10.163.49.202])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000B23F73D;
 Tue,  1 Mar 2022 19:22:16 -0800 (PST)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
Date: Wed, 2 Mar 2022 08:52:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
Content-Language: en-US
Subject: Re: [OpenRISC] [PATCH V3 09/30] arm/mm: Enable
 ARCH_HAS_VM_GET_PAGE_PROT
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAzLzEvMjIgMTo0NiBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAw
MS8wMy8yMDIyIMOgIDAxOjMxLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgYSDDqWNyaXTCoDoKPj4g
T24gVHVlLCBNYXIgMDEsIDIwMjIgYXQgMDU6MzA6NDFBTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cj4+PiBPbiAyLzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3
cm90ZToKPj4+PiBPbiBNb24sIEZlYiAyOCwgMjAyMiBhdCAwNDoxNzozMlBNICswNTMwLCBBbnNo
dW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Pj4gVGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxh
dGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dldF9wYWdlX3Byb3QoKSB2aWEKPj4+Pj4gc3Vic2Ny
aWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5IGFsbCBfX1NYWFgg
YW5kIF9fUFhYWAo+Pj4+PiBtYWNyb3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdl
ciBuZWVkZWQuCj4+Pj4KPj4+PiBXaGF0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8ga25vdyBpcyB3
aHkgaGF2aW5nIHRvIHJ1biBfY29kZV8gdG8gd29yayBvdXQKPj4+PiB3aGF0IHRoZSBwYWdlIHBy
b3RlY3Rpb25zIG5lZWQgdG8gYmUgaXMgYmV0dGVyIHRoYW4gbG9va2luZyBpdCB1cCBpbiBhCj4+
Pj4gdGFibGUuCj4+Pj4KPj4+PiBOb3Qgb25seSBpcyB0aGlzIG1vcmUgZXhwZW5zaXZlIGluIHRl
cm1zIG9mIENQVSBjeWNsZXMsIGl0IGFsc28gYnJpbmdzCj4+Pj4gYWRkaXRpb25hbCBjb2RlIHNp
emUgd2l0aCBpdC4KPj4+Pgo+Pj4+IEknbSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aGF0IHRoZSBiZW5l
Zml0IGlzLgo+Pj4KPj4+IEN1cnJlbnRseSB2bV9nZXRfcGFnZV9wcm90KCkgaXMgYWxzbyBiZWlu
ZyBfcnVuXyB0byBmZXRjaCByZXF1aXJlZCBwYWdlCj4+PiBwcm90ZWN0aW9uIHZhbHVlcy4gQWx0
aG91Z2ggdGhhdCBpcyBiZWluZyBydW4gaW4gdGhlIGNvcmUgTU0gYW5kIGZyb20gYQo+Pj4gcGxh
dGZvcm0gcGVyc3BlY3RpdmUgX19TWFhYLCBfX1BYWFggYXJlIGp1c3QgYmVpbmcgZXhwb3J0ZWQg
Zm9yIGEgdGFibGUuCj4+PiBMb29raW5nIGl0IHVwIGluIGEgdGFibGUgKGFuZCBhcHBseWluZyBt
b3JlIGNvbnN0cnVjdHMgdGhlcmUgYWZ0ZXIpIGlzCj4+PiBub3QgbXVjaCBkaWZmZXJlbnQgdGhh
biBhIGNsZWFuIHN3aXRjaCBjYXNlIHN0YXRlbWVudCBpbiB0ZXJtcyBvZiBDUFUKPj4+IHVzYWdl
LiBTbyB0aGlzIGlzIG5vdCBtb3JlIGV4cGVuc2l2ZSBpbiB0ZXJtcyBvZiBDUFUgY3ljbGVzLgo+
Pgo+PiBJIGRpc2FncmVlLgo+IAo+IFNvIGRvIEkuCj4gCj4+Cj4+IEhvd2V2ZXIsIGxldCdzIGJh
c2UgdGhpcyBkaXNhZ3JlZW1lbnQgb24gc29tZSBldmlkZW5jZS4gSGVyZSBpcyB0aGUKPj4gcHJl
c2VudCAzMi1iaXQgQVJNIGltcGxlbWVudGF0aW9uOgo+Pgo+PiAwMDAwMDA0OCA8dm1fZ2V0X3Bh
Z2VfcHJvdD46Cj4+ICAgICAgICA0ODogICAgICAgZTIwMDAwMGYgICAgICAgIGFuZCAgICAgcjAs
IHIwLCAjMTUKPj4gICAgICAgIDRjOiAgICAgICBlMzAwMzAwMCAgICAgICAgbW92dyAgICByMywg
IzAKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIDRjOiBSX0FSTV9NT1ZXX0FCU19OQyAgIC5M
QU5DSE9SMQo+PiAgICAgICAgNTA6ICAgICAgIGUzNDAzMDAwICAgICAgICBtb3Z0ICAgIHIzLCAj
MAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgNTA6IFJfQVJNX01PVlRfQUJTICAgICAgLkxB
TkNIT1IxCj4+ICAgICAgICA1NDogICAgICAgZTc5MzAxMDAgICAgICAgIGxkciAgICAgcjAsIFty
MywgcjAsIGxzbCAjMl0KPj4gICAgICAgIDU4OiAgICAgICBlMTJmZmYxZSAgICAgICAgYnggICAg
ICBscgo+Pgo+PiBUaGF0IGlzIGZpdmUgaW5zdHJ1Y3Rpb25zIGxvbmcuCj4gCj4gT24gcHBjMzIg
SSBnZXQ6Cj4gCj4gMDAwMDAwOTQgPHZtX2dldF9wYWdlX3Byb3Q+Ogo+ICAgICAgICA5NDoJM2Qg
MjAgMDAgMDAgCWxpcyAgICAgcjksMAo+IAkJCTk2OiBSX1BQQ19BRERSMTZfSEEJLmRhdGEuLnJv
X2FmdGVyX2luaXQKPiAgICAgICAgOTg6CTU0IDg0IDE2IGJhIAlybHdpbm0gIHI0LHI0LDIsMjYs
MjkKPiAgICAgICAgOWM6CTM5IDI5IDAwIDAwIAlhZGRpICAgIHI5LHI5LDAKPiAJCQk5ZTogUl9Q
UENfQUREUjE2X0xPCS5kYXRhLi5yb19hZnRlcl9pbml0Cj4gICAgICAgIGEwOgk3ZCAyOSAyMCAy
ZSAJbHd6eCAgICByOSxyOSxyNAo+ICAgICAgICBhNDoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjks
MChyMykKPiAgICAgICAgYTg6CTRlIDgwIDAwIDIwIAlibHIKPiAKPiAKPj4KPj4gUGxlYXNlIHNo
b3cgdGhhdCB5b3VyIG5ldyBpbXBsZW1lbnRhdGlvbiBpcyBub3QgbW9yZSBleHBlbnNpdmUgb24K
Pj4gMzItYml0IEFSTS4gUGxlYXNlIGRvIHNvIGJ5IGJ1aWxkaW5nIGEgMzItYml0IGtlcm5lbCwg
YW5kIHByb3ZpZGluZwo+PiB0aGUgZGlzYXNzZW1ibHkuCj4gCj4gV2l0aCB5b3VyIHNlcmllcyBJ
IGdldDoKPiAKPiAwMDAwMDAwMCA8dm1fZ2V0X3BhZ2VfcHJvdD46Cj4gICAgIDA6CTNkIDIwIDAw
IDAwIAlsaXMgICAgIHI5LDAKPiAJCQkyOiBSX1BQQ19BRERSMTZfSEEJLnJvZGF0YQo+ICAgICA0
OgkzOSAyOSAwMCAwMCAJYWRkaSAgICByOSxyOSwwCj4gCQkJNjogUl9QUENfQUREUjE2X0xPCS5y
b2RhdGEKPiAgICAgODoJNTQgODQgMTYgYmEgCXJsd2lubSAgcjQscjQsMiwyNiwyOQo+ICAgICBj
Ogk3ZCA0OSAyMCAyZSAJbHd6eCAgICByMTAscjkscjQKPiAgICAxMDoJN2QgNGEgNGEgMTQgCWFk
ZCAgICAgcjEwLHIxMCxyOQo+ICAgIDE0Ogk3ZCA0OSAwMyBhNiAJbXRjdHIgICByMTAKPiAgICAx
ODoJNGUgODAgMDQgMjAgCWJjdHIKPiAgICAxYzoJMzkgMjAgMDMgMTUgCWxpICAgICAgcjksNzg5
Cj4gICAgMjA6CTkxIDIzIDAwIDAwIAlzdHcgICAgIHI5LDAocjMpCj4gICAgMjQ6CTRlIDgwIDAw
IDIwIAlibHIKPiAgICAyODoJMzkgMjAgMDEgMTUgCWxpICAgICAgcjksMjc3Cj4gICAgMmM6CTkx
IDIzIDAwIDAwIAlzdHcgICAgIHI5LDAocjMpCj4gICAgMzA6CTRlIDgwIDAwIDIwIAlibHIKPiAg
ICAzNDoJMzkgMjAgMDcgMTUgCWxpICAgICAgcjksMTgxMwo+ICAgIDM4Ogk5MSAyMyAwMCAwMCAJ
c3R3ICAgICByOSwwKHIzKQo+ICAgIDNjOgk0ZSA4MCAwMCAyMCAJYmxyCj4gICAgNDA6CTM5IDIw
IDA1IDE1IAlsaSAgICAgIHI5LDEzMDEKPiAgICA0NDoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjks
MChyMykKPiAgICA0ODoJNGUgODAgMDAgMjAgCWJscgo+ICAgIDRjOgkzOSAyMCAwMSAxMSAJbGkg
ICAgICByOSwyNzMKPiAgICA1MDoJNGIgZmYgZmYgZDAgCWIgICAgICAgMjAgPHZtX2dldF9wYWdl
X3Byb3QrMHgyMD4KPiAKPiAKPiBUaGF0IGlzIGRlZmluaXRlbHkgbW9yZSBleHBlbnNpdmUsIGl0
IGltcGxlbWVudHMgYSB0YWJsZSBvZiBicmFuY2hlcy4KCk9rYXksIHdpbGwgc3BsaXQgb3V0IHRo
ZSBQUEMzMiBpbXBsZW1lbnRhdGlvbiB0aGF0IHJldGFpbnMgZXhpc3RpbmcKdGFibGUgbG9vayB1
cCBtZXRob2QuIEFsc28gcGxhbm5pbmcgdG8ga2VlcCB0aGF0IGluc2lkZSBzYW1lIGZpbGUKKGFy
Y2gvcG93ZXJwYy9tbS9tbWFwLmMpLCB1bmxlc3MgeW91IGhhdmUgYSBkaWZmZXJlbmNlIHByZWZl
cmVuY2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
