Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 762804CA14D
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 10:51:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3A71A242C3;
	Wed,  2 Mar 2022 10:51:35 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 012BE2475A
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 10:51:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 146371042;
 Wed,  2 Mar 2022 01:51:32 -0800 (PST)
Received: from [10.163.49.202] (unknown [10.163.49.202])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE96F3F66F;
 Wed,  2 Mar 2022 01:51:24 -0800 (PST)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
Date: Wed, 2 Mar 2022 15:21:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
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

CgpPbiAzLzIvMjIgMTI6MzUgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUg
MDIvMDMvMjAyMiDDoCAwNDoyMiwgQW5zaHVtYW4gS2hhbmR1YWwgYSDDqWNyaXTCoDoKPj4KPj4K
Pj4gT24gMy8xLzIyIDE6NDYgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4KPj4+
IExlIDAxLzAzLzIwMjIgw6AgMDE6MzEsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSBhIMOpY3JpdMKg
Ogo+Pj4+IE9uIFR1ZSwgTWFyIDAxLCAyMDIyIGF0IDA1OjMwOjQxQU0gKzA1MzAsIEFuc2h1bWFu
IEtoYW5kdWFsIHdyb3RlOgo+Pj4+PiBPbiAyLzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAo
T3JhY2xlKSB3cm90ZToKPj4+Pj4+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDA0OjE3OjMyUE0g
KzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4+Pj4+IFRoaXMgZGVmaW5lcyBhbmQg
ZXhwb3J0cyBhIHBsYXRmb3JtIHNwZWNpZmljIGN1c3RvbSB2bV9nZXRfcGFnZV9wcm90KCkgdmlh
Cj4+Pj4+Pj4gc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVu
dGx5IGFsbCBfX1NYWFggYW5kIF9fUFhYWAo+Pj4+Pj4+IG1hY3JvcyBjYW4gYmUgZHJvcHBlZCB3
aGljaCBhcmUgbm8gbG9uZ2VyIG5lZWRlZC4KPj4+Pj4+Cj4+Pj4+PiBXaGF0IEkgd291bGQgcmVh
bGx5IGxpa2UgdG8ga25vdyBpcyB3aHkgaGF2aW5nIHRvIHJ1biBfY29kZV8gdG8gd29yayBvdXQK
Pj4+Pj4+IHdoYXQgdGhlIHBhZ2UgcHJvdGVjdGlvbnMgbmVlZCB0byBiZSBpcyBiZXR0ZXIgdGhh
biBsb29raW5nIGl0IHVwIGluIGEKPj4+Pj4+IHRhYmxlLgo+Pj4+Pj4KPj4+Pj4+IE5vdCBvbmx5
IGlzIHRoaXMgbW9yZSBleHBlbnNpdmUgaW4gdGVybXMgb2YgQ1BVIGN5Y2xlcywgaXQgYWxzbyBi
cmluZ3MKPj4+Pj4+IGFkZGl0aW9uYWwgY29kZSBzaXplIHdpdGggaXQuCj4+Pj4+Pgo+Pj4+Pj4g
SSdtIHN0cnVnZ2xpbmcgdG8gc2VlIHdoYXQgdGhlIGJlbmVmaXQgaXMuCj4+Pj4+Cj4+Pj4+IEN1
cnJlbnRseSB2bV9nZXRfcGFnZV9wcm90KCkgaXMgYWxzbyBiZWluZyBfcnVuXyB0byBmZXRjaCBy
ZXF1aXJlZCBwYWdlCj4+Pj4+IHByb3RlY3Rpb24gdmFsdWVzLiBBbHRob3VnaCB0aGF0IGlzIGJl
aW5nIHJ1biBpbiB0aGUgY29yZSBNTSBhbmQgZnJvbSBhCj4+Pj4+IHBsYXRmb3JtIHBlcnNwZWN0
aXZlIF9fU1hYWCwgX19QWFhYIGFyZSBqdXN0IGJlaW5nIGV4cG9ydGVkIGZvciBhIHRhYmxlLgo+
Pj4+PiBMb29raW5nIGl0IHVwIGluIGEgdGFibGUgKGFuZCBhcHBseWluZyBtb3JlIGNvbnN0cnVj
dHMgdGhlcmUgYWZ0ZXIpIGlzCj4+Pj4+IG5vdCBtdWNoIGRpZmZlcmVudCB0aGFuIGEgY2xlYW4g
c3dpdGNoIGNhc2Ugc3RhdGVtZW50IGluIHRlcm1zIG9mIENQVQo+Pj4+PiB1c2FnZS4gU28gdGhp
cyBpcyBub3QgbW9yZSBleHBlbnNpdmUgaW4gdGVybXMgb2YgQ1BVIGN5Y2xlcy4KPj4+Pgo+Pj4+
IEkgZGlzYWdyZWUuCj4+Pgo+Pj4gU28gZG8gSS4KPj4+Cj4+Pj4KPj4+PiBIb3dldmVyLCBsZXQn
cyBiYXNlIHRoaXMgZGlzYWdyZWVtZW50IG9uIHNvbWUgZXZpZGVuY2UuIEhlcmUgaXMgdGhlCj4+
Pj4gcHJlc2VudCAzMi1iaXQgQVJNIGltcGxlbWVudGF0aW9uOgo+Pj4+Cj4+Pj4gMDAwMDAwNDgg
PHZtX2dldF9wYWdlX3Byb3Q+Ogo+Pj4+ICAgICAgICAgNDg6ICAgICAgIGUyMDAwMDBmICAgICAg
ICBhbmQgICAgIHIwLCByMCwgIzE1Cj4+Pj4gICAgICAgICA0YzogICAgICAgZTMwMDMwMDAgICAg
ICAgIG1vdncgICAgcjMsICMwCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICA0YzogUl9B
Uk1fTU9WV19BQlNfTkMgICAuTEFOQ0hPUjEKPj4+PiAgICAgICAgIDUwOiAgICAgICBlMzQwMzAw
MCAgICAgICAgbW92dCAgICByMywgIzAKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIDUw
OiBSX0FSTV9NT1ZUX0FCUyAgICAgIC5MQU5DSE9SMQo+Pj4+ICAgICAgICAgNTQ6ICAgICAgIGU3
OTMwMTAwICAgICAgICBsZHIgICAgIHIwLCBbcjMsIHIwLCBsc2wgIzJdCj4+Pj4gICAgICAgICA1
ODogICAgICAgZTEyZmZmMWUgICAgICAgIGJ4ICAgICAgbHIKPj4+Pgo+Pj4+IFRoYXQgaXMgZml2
ZSBpbnN0cnVjdGlvbnMgbG9uZy4KPj4+Cj4+PiBPbiBwcGMzMiBJIGdldDoKPj4+Cj4+PiAwMDAw
MDA5NCA8dm1fZ2V0X3BhZ2VfcHJvdD46Cj4+PiAgICAgICAgIDk0OgkzZCAyMCAwMCAwMCAJbGlz
ICAgICByOSwwCj4+PiAJCQk5NjogUl9QUENfQUREUjE2X0hBCS5kYXRhLi5yb19hZnRlcl9pbml0
Cj4+PiAgICAgICAgIDk4Ogk1NCA4NCAxNiBiYSAJcmx3aW5tICByNCxyNCwyLDI2LDI5Cj4+PiAg
ICAgICAgIDljOgkzOSAyOSAwMCAwMCAJYWRkaSAgICByOSxyOSwwCj4+PiAJCQk5ZTogUl9QUENf
QUREUjE2X0xPCS5kYXRhLi5yb19hZnRlcl9pbml0Cj4+PiAgICAgICAgIGEwOgk3ZCAyOSAyMCAy
ZSAJbHd6eCAgICByOSxyOSxyNAo+Pj4gICAgICAgICBhNDoJOTEgMjMgMDAgMDAgCXN0dyAgICAg
cjksMChyMykKPj4+ICAgICAgICAgYTg6CTRlIDgwIDAwIDIwIAlibHIKPj4+Cj4+Pgo+Pj4+Cj4+
Pj4gUGxlYXNlIHNob3cgdGhhdCB5b3VyIG5ldyBpbXBsZW1lbnRhdGlvbiBpcyBub3QgbW9yZSBl
eHBlbnNpdmUgb24KPj4+PiAzMi1iaXQgQVJNLiBQbGVhc2UgZG8gc28gYnkgYnVpbGRpbmcgYSAz
Mi1iaXQga2VybmVsLCBhbmQgcHJvdmlkaW5nCj4+Pj4gdGhlIGRpc2Fzc2VtYmx5Lgo+Pj4KPj4+
IFdpdGggeW91ciBzZXJpZXMgSSBnZXQ6Cj4+Pgo+Pj4gMDAwMDAwMDAgPHZtX2dldF9wYWdlX3By
b3Q+Ogo+Pj4gICAgICAwOgkzZCAyMCAwMCAwMCAJbGlzICAgICByOSwwCj4+PiAJCQkyOiBSX1BQ
Q19BRERSMTZfSEEJLnJvZGF0YQo+Pj4gICAgICA0OgkzOSAyOSAwMCAwMCAJYWRkaSAgICByOSxy
OSwwCj4+PiAJCQk2OiBSX1BQQ19BRERSMTZfTE8JLnJvZGF0YQo+Pj4gICAgICA4Ogk1NCA4NCAx
NiBiYSAJcmx3aW5tICByNCxyNCwyLDI2LDI5Cj4+PiAgICAgIGM6CTdkIDQ5IDIwIDJlIAlsd3p4
ICAgIHIxMCxyOSxyNAo+Pj4gICAgIDEwOgk3ZCA0YSA0YSAxNCAJYWRkICAgICByMTAscjEwLHI5
Cj4+PiAgICAgMTQ6CTdkIDQ5IDAzIGE2IAltdGN0ciAgIHIxMAo+Pj4gICAgIDE4Ogk0ZSA4MCAw
NCAyMCAJYmN0cgo+Pj4gICAgIDFjOgkzOSAyMCAwMyAxNSAJbGkgICAgICByOSw3ODkKPj4+ICAg
ICAyMDoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjksMChyMykKPj4+ICAgICAyNDoJNGUgODAgMDAg
MjAgCWJscgo+Pj4gICAgIDI4OgkzOSAyMCAwMSAxNSAJbGkgICAgICByOSwyNzcKPj4+ICAgICAy
YzoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjksMChyMykKPj4+ICAgICAzMDoJNGUgODAgMDAgMjAg
CWJscgo+Pj4gICAgIDM0OgkzOSAyMCAwNyAxNSAJbGkgICAgICByOSwxODEzCj4+PiAgICAgMzg6
CTkxIDIzIDAwIDAwIAlzdHcgICAgIHI5LDAocjMpCj4+PiAgICAgM2M6CTRlIDgwIDAwIDIwIAli
bHIKPj4+ICAgICA0MDoJMzkgMjAgMDUgMTUgCWxpICAgICAgcjksMTMwMQo+Pj4gICAgIDQ0Ogk5
MSAyMyAwMCAwMCAJc3R3ICAgICByOSwwKHIzKQo+Pj4gICAgIDQ4Ogk0ZSA4MCAwMCAyMCAJYmxy
Cj4+PiAgICAgNGM6CTM5IDIwIDAxIDExIAlsaSAgICAgIHI5LDI3Mwo+Pj4gICAgIDUwOgk0YiBm
ZiBmZiBkMCAJYiAgICAgICAyMCA8dm1fZ2V0X3BhZ2VfcHJvdCsweDIwPgo+Pj4KPj4+Cj4+PiBU
aGF0IGlzIGRlZmluaXRlbHkgbW9yZSBleHBlbnNpdmUsIGl0IGltcGxlbWVudHMgYSB0YWJsZSBv
ZiBicmFuY2hlcy4KPj4KPj4gT2theSwgd2lsbCBzcGxpdCBvdXQgdGhlIFBQQzMyIGltcGxlbWVu
dGF0aW9uIHRoYXQgcmV0YWlucyBleGlzdGluZwo+PiB0YWJsZSBsb29rIHVwIG1ldGhvZC4gQWxz
byBwbGFubmluZyB0byBrZWVwIHRoYXQgaW5zaWRlIHNhbWUgZmlsZQo+PiAoYXJjaC9wb3dlcnBj
L21tL21tYXAuYyksIHVubGVzcyB5b3UgaGF2ZSBhIGRpZmZlcmVuY2UgcHJlZmVyZW5jZS4KPiAK
PiBNeSBwb2ludCB3YXMgbm90IHRvIGdldCBzb21ldGhpbmcgc3BlY2lmaWMgZm9yIFBQQzMyLCBi
dXQgdG8gYW1wbGlmeSBvbiAKPiBSdXNzZWxsJ3Mgb2JqZWN0aW9uLgo+IAo+IEFzIHRoaXMgaXMg
YmFkIGZvciBBUk0gYW5kIGJhZCBmb3IgUFBDMzIsIGRvIHdlIGhhdmUgYW55IGV2aWRlbmNlIHRo
YXQgCj4geW91ciBjaGFuZ2UgaXMgZ29vZCBmb3IgYW55IG90aGVyIGFyY2hpdGVjdHVyZSA/Cj4g
Cj4gSSBjaGVja2VkIFBQQzY0IGFuZCB0aGVyZSBpcyBleGFjdGx5IHRoZSBzYW1lIGRyYXdiYWNr
LiBXaXRoIHRoZSBjdXJyZW50IAo+IGltcGxlbWVudGF0aW9uIGl0IGlzIGEgc21hbGwgZnVuY3Rp
b24gcGVyZm9ybWluZyB0YWJsZSByZWFkIHRoZW4gYSBmZXcgCj4gYWRqdXN0bWVudC4gQWZ0ZXIg
eW91ciBjaGFuZ2UgaXQgaXMgYSBiaWdnZXIgZnVuY3Rpb24gaW1wbGVtZW50aW5nIGEgCj4gdGFi
bGUgb2YgYnJhbmNoZXMuCgpJIGFtIHdvbmRlcmluZyBpZiB0aGlzIHdvdWxkIG5vdCBiZSB0aGUg
Y2FzZSBmb3IgYW55IG90aGVyIHN3aXRjaCBjYXNlCnN0YXRlbWVudCBvbiB0aGUgcGxhdGZvcm0g
PyBJcyB0aGVyZSBzb21ldGhpbmcgc3BlY2lmaWMvZGlmZmVyZW50IGp1c3QKb24gdm1fZ2V0X3Bh
Z2VfcHJvdCgpIGltcGxlbWVudGF0aW9uID8gQXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgc3dpdGNo
CmNhc2Ugc3RhdGVtZW50cyBzaG91bGQganVzdCBiZSBhdm9pZGVkIGluc3RlYWQgPwoKPiAKPiBT
bywgYXMgcmVxdWVzdGVkIGJ5IFJ1c3NlbGwsIGNvdWxkIHlvdSBsb29rIGF0IHRoZSBkaXNhc3Nl
bWJseSBmb3Igb3RoZXIgCj4gYXJjaGl0ZWN0dXJlcyBhbmQgc2hvdyB1cyB0aGF0IEFSTSBhbmQg
UE9XRVJQQyBhcmUgdGhlIG9ubHkgb25lcyBmb3IgCj4gd2hpY2ggeW91ciBjaGFuZ2UgaXMgbm90
IG9wdGltYWwgPwoKQnV0IHRoZSBwcmltYXJ5IHB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMgbm90
IHRvIGd1YXJhbnRlZSBvcHRpbWl6ZWQKY29kZSBvbiBwbGF0Zm9ybSBieSBwbGF0Zm9ybSBiYXNp
cywgd2hpbGUgbWlncmF0aW5nIGZyb20gYSB0YWJsZSBiYXNlZApsb29rIHVwIG1ldGhvZCBpbnRv
IGEgc3dpdGNoIGNhc2Ugc3RhdGVtZW50LgoKQnV0IGluc3RlYWQsIHRoZSBwdXJwb3NlcyBpcyB0
byByZW1vdmUgY3VycmVudCBsZXZlbHMgb2YgdW5uZWNlc3NhcnkKYWJzdHJhY3Rpb24gd2hpbGUg
Y29udmVydGluZyBhIHZtX2ZsYWdzIGFjY2VzcyBjb21iaW5hdGlvbiBpbnRvIHBhZ2UKcHJvdGVj
dGlvbi4gVGhlIHN3aXRjaCBjYXNlIHN0YXRlbWVudCBmb3IgcGxhdGZvcm0gaW1wbGVtZW50YXRp
b24gb2YKdm1fZ2V0X3BhZ2VfcHJvdCgpIGp1c3Qgc2VlbWVkIGxvZ2ljYWwgZW5vdWdoLiBDaHJp
c3RvcGgncyBvcmlnaW5hbApzdWdnZXN0aW9uIHBhdGNoIGZvciB4ODYgaGFkIHRoZSBzYW1lIGlt
cGxlbWVudGF0aW9uIGFzIHdlbGwuCgpCdXQgaWYgdGhlIHRhYmxlIGxvb2sgdXAgaXMgc3RpbGwg
YmV0dGVyL3ByZWZlcnJlZCBtZXRob2Qgb24gY2VydGFpbgpwbGF0Zm9ybXMgbGlrZSBhcm0gb3Ig
cHBjMzIsIHdpbGwgYmUgaGFwcHkgdG8gcHJlc2VydmUgdGhhdC4KCi0gQW5zaHVtYW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
