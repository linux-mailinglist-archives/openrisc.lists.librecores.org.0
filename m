Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DF5224CA2CF
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 12:07:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 97D8F24853;
	Wed,  2 Mar 2022 12:07:05 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id D017924813
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 12:07:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAE8C106F;
 Wed,  2 Mar 2022 03:07:02 -0800 (PST)
Received: from [10.163.49.202] (unknown [10.163.49.202])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417BC3F70D;
 Wed,  2 Mar 2022 03:06:55 -0800 (PST)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
 <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
 <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
Date: Wed, 2 Mar 2022 16:36:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
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
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
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

CgpPbiAzLzIvMjIgMzozNSBQTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEFuc2h1
bWFuLAo+IAo+IE9uIFdlZCwgTWFyIDIsIDIwMjIgYXQgMTA6NTEgQU0gQW5zaHVtYW4gS2hhbmR1
YWwKPiA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDMvMi8yMiAxMjoz
NSBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+IExlIDAyLzAzLzIwMjIgw6AgMDQ6MjIs
IEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0IDoKPj4+PiBPbiAzLzEvMjIgMTo0NiBQTSwgQ2hy
aXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Pj4gTGUgMDEvMDMvMjAyMiDDoCAwMTozMSwgUnVzc2Vs
bCBLaW5nIChPcmFjbGUpIGEgw6ljcml0IDoKPj4+Pj4+IE9uIFR1ZSwgTWFyIDAxLCAyMDIyIGF0
IDA1OjMwOjQxQU0gKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4+Pj4+IE9uIDIv
MjgvMjIgNDoyNyBQTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+Pj4+Pj4+PiBPbiBN
b24sIEZlYiAyOCwgMjAyMiBhdCAwNDoxNzozMlBNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3
cm90ZToKPj4+Pj4+Pj4+IFRoaXMgZGVmaW5lcyBhbmQgZXhwb3J0cyBhIHBsYXRmb3JtIHNwZWNp
ZmljIGN1c3RvbSB2bV9nZXRfcGFnZV9wcm90KCkgdmlhCj4+Pj4+Pj4+PiBzdWJzY3JpYmluZyBB
UkNIX0hBU19WTV9HRVRfUEFHRV9QUk9ULiBTdWJzZXF1ZW50bHkgYWxsIF9fU1hYWCBhbmQgX19Q
WFhYCj4+Pj4+Pj4+PiBtYWNyb3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdlciBu
ZWVkZWQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdoYXQgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBrbm93
IGlzIHdoeSBoYXZpbmcgdG8gcnVuIF9jb2RlXyB0byB3b3JrIG91dAo+Pj4+Pj4+PiB3aGF0IHRo
ZSBwYWdlIHByb3RlY3Rpb25zIG5lZWQgdG8gYmUgaXMgYmV0dGVyIHRoYW4gbG9va2luZyBpdCB1
cCBpbiBhCj4+Pj4+Pj4+IHRhYmxlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBOb3Qgb25seSBpcyB0aGlz
IG1vcmUgZXhwZW5zaXZlIGluIHRlcm1zIG9mIENQVSBjeWNsZXMsIGl0IGFsc28gYnJpbmdzCj4+
Pj4+Pj4+IGFkZGl0aW9uYWwgY29kZSBzaXplIHdpdGggaXQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkn
bSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aGF0IHRoZSBiZW5lZml0IGlzLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
Q3VycmVudGx5IHZtX2dldF9wYWdlX3Byb3QoKSBpcyBhbHNvIGJlaW5nIF9ydW5fIHRvIGZldGNo
IHJlcXVpcmVkIHBhZ2UKPj4+Pj4+PiBwcm90ZWN0aW9uIHZhbHVlcy4gQWx0aG91Z2ggdGhhdCBp
cyBiZWluZyBydW4gaW4gdGhlIGNvcmUgTU0gYW5kIGZyb20gYQo+Pj4+Pj4+IHBsYXRmb3JtIHBl
cnNwZWN0aXZlIF9fU1hYWCwgX19QWFhYIGFyZSBqdXN0IGJlaW5nIGV4cG9ydGVkIGZvciBhIHRh
YmxlLgo+Pj4+Pj4+IExvb2tpbmcgaXQgdXAgaW4gYSB0YWJsZSAoYW5kIGFwcGx5aW5nIG1vcmUg
Y29uc3RydWN0cyB0aGVyZSBhZnRlcikgaXMKPj4+Pj4+PiBub3QgbXVjaCBkaWZmZXJlbnQgdGhh
biBhIGNsZWFuIHN3aXRjaCBjYXNlIHN0YXRlbWVudCBpbiB0ZXJtcyBvZiBDUFUKPj4+Pj4+PiB1
c2FnZS4gU28gdGhpcyBpcyBub3QgbW9yZSBleHBlbnNpdmUgaW4gdGVybXMgb2YgQ1BVIGN5Y2xl
cy4KPj4+Pj4+Cj4+Pj4+PiBJIGRpc2FncmVlLgo+Pj4+Pgo+Pj4+PiBTbyBkbyBJLgo+Pj4+Pgo+
Pj4+Pj4KPj4+Pj4+IEhvd2V2ZXIsIGxldCdzIGJhc2UgdGhpcyBkaXNhZ3JlZW1lbnQgb24gc29t
ZSBldmlkZW5jZS4gSGVyZSBpcyB0aGUKPj4+Pj4+IHByZXNlbnQgMzItYml0IEFSTSBpbXBsZW1l
bnRhdGlvbjoKPj4+Pj4+Cj4+Pj4+PiAwMDAwMDA0OCA8dm1fZ2V0X3BhZ2VfcHJvdD46Cj4+Pj4+
PiAgICAgICAgIDQ4OiAgICAgICBlMjAwMDAwZiAgICAgICAgYW5kICAgICByMCwgcjAsICMxNQo+
Pj4+Pj4gICAgICAgICA0YzogICAgICAgZTMwMDMwMDAgICAgICAgIG1vdncgICAgcjMsICMwCj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIDRjOiBSX0FSTV9NT1ZXX0FCU19OQyAgIC5M
QU5DSE9SMQo+Pj4+Pj4gICAgICAgICA1MDogICAgICAgZTM0MDMwMDAgICAgICAgIG1vdnQgICAg
cjMsICMwCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIDUwOiBSX0FSTV9NT1ZUX0FC
UyAgICAgIC5MQU5DSE9SMQo+Pj4+Pj4gICAgICAgICA1NDogICAgICAgZTc5MzAxMDAgICAgICAg
IGxkciAgICAgcjAsIFtyMywgcjAsIGxzbCAjMl0KPj4+Pj4+ICAgICAgICAgNTg6ICAgICAgIGUx
MmZmZjFlICAgICAgICBieCAgICAgIGxyCj4+Pj4+Pgo+Pj4+Pj4gVGhhdCBpcyBmaXZlIGluc3Ry
dWN0aW9ucyBsb25nLgo+Pj4+Pgo+Pj4+PiBPbiBwcGMzMiBJIGdldDoKPj4+Pj4KPj4+Pj4gMDAw
MDAwOTQgPHZtX2dldF9wYWdlX3Byb3Q+Ogo+Pj4+PiAgICAgICAgIDk0OiAzZCAyMCAwMCAwMCAg
ICAgbGlzICAgICByOSwwCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgOTY6IFJfUFBDX0FERFIx
Nl9IQSAgICAgLmRhdGEuLnJvX2FmdGVyX2luaXQKPj4+Pj4gICAgICAgICA5ODogNTQgODQgMTYg
YmEgICAgIHJsd2lubSAgcjQscjQsMiwyNiwyOQo+Pj4+PiAgICAgICAgIDljOiAzOSAyOSAwMCAw
MCAgICAgYWRkaSAgICByOSxyOSwwCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgOWU6IFJfUFBD
X0FERFIxNl9MTyAgICAgLmRhdGEuLnJvX2FmdGVyX2luaXQKPj4+Pj4gICAgICAgICBhMDogN2Qg
MjkgMjAgMmUgICAgIGx3enggICAgcjkscjkscjQKPj4+Pj4gICAgICAgICBhNDogOTEgMjMgMDAg
MDAgICAgIHN0dyAgICAgcjksMChyMykKPj4+Pj4gICAgICAgICBhODogNGUgODAgMDAgMjAgICAg
IGJscgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFBsZWFzZSBzaG93IHRoYXQgeW91ciBuZXcg
aW1wbGVtZW50YXRpb24gaXMgbm90IG1vcmUgZXhwZW5zaXZlIG9uCj4+Pj4+PiAzMi1iaXQgQVJN
LiBQbGVhc2UgZG8gc28gYnkgYnVpbGRpbmcgYSAzMi1iaXQga2VybmVsLCBhbmQgcHJvdmlkaW5n
Cj4+Pj4+PiB0aGUgZGlzYXNzZW1ibHkuCj4+Pj4+Cj4+Pj4+IFdpdGggeW91ciBzZXJpZXMgSSBn
ZXQ6Cj4+Pj4+Cj4+Pj4+IDAwMDAwMDAwIDx2bV9nZXRfcGFnZV9wcm90PjoKPj4+Pj4gICAgICAw
OiAgICAgM2QgMjAgMDAgMDAgICAgIGxpcyAgICAgcjksMAo+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgIDI6IFJfUFBDX0FERFIxNl9IQSAgICAgIC5yb2RhdGEKPj4+Pj4gICAgICA0OiAgICAgMzkg
MjkgMDAgMDAgICAgIGFkZGkgICAgcjkscjksMAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgIDY6
IFJfUFBDX0FERFIxNl9MTyAgICAgIC5yb2RhdGEKPj4+Pj4gICAgICA4OiAgICAgNTQgODQgMTYg
YmEgICAgIHJsd2lubSAgcjQscjQsMiwyNiwyOQo+Pj4+PiAgICAgIGM6ICAgICA3ZCA0OSAyMCAy
ZSAgICAgbHd6eCAgICByMTAscjkscjQKPj4+Pj4gICAgIDEwOiAgICAgN2QgNGEgNGEgMTQgICAg
IGFkZCAgICAgcjEwLHIxMCxyOQo+Pj4+PiAgICAgMTQ6ICAgICA3ZCA0OSAwMyBhNiAgICAgbXRj
dHIgICByMTAKPj4+Pj4gICAgIDE4OiAgICAgNGUgODAgMDQgMjAgICAgIGJjdHIKPj4+Pj4gICAg
IDFjOiAgICAgMzkgMjAgMDMgMTUgICAgIGxpICAgICAgcjksNzg5Cj4+Pj4+ICAgICAyMDogICAg
IDkxIDIzIDAwIDAwICAgICBzdHcgICAgIHI5LDAocjMpCj4+Pj4+ICAgICAyNDogICAgIDRlIDgw
IDAwIDIwICAgICBibHIKPj4+Pj4gICAgIDI4OiAgICAgMzkgMjAgMDEgMTUgICAgIGxpICAgICAg
cjksMjc3Cj4+Pj4+ICAgICAyYzogICAgIDkxIDIzIDAwIDAwICAgICBzdHcgICAgIHI5LDAocjMp
Cj4+Pj4+ICAgICAzMDogICAgIDRlIDgwIDAwIDIwICAgICBibHIKPj4+Pj4gICAgIDM0OiAgICAg
MzkgMjAgMDcgMTUgICAgIGxpICAgICAgcjksMTgxMwo+Pj4+PiAgICAgMzg6ICAgICA5MSAyMyAw
MCAwMCAgICAgc3R3ICAgICByOSwwKHIzKQo+Pj4+PiAgICAgM2M6ICAgICA0ZSA4MCAwMCAyMCAg
ICAgYmxyCj4+Pj4+ICAgICA0MDogICAgIDM5IDIwIDA1IDE1ICAgICBsaSAgICAgIHI5LDEzMDEK
Pj4+Pj4gICAgIDQ0OiAgICAgOTEgMjMgMDAgMDAgICAgIHN0dyAgICAgcjksMChyMykKPj4+Pj4g
ICAgIDQ4OiAgICAgNGUgODAgMDAgMjAgICAgIGJscgo+Pj4+PiAgICAgNGM6ICAgICAzOSAyMCAw
MSAxMSAgICAgbGkgICAgICByOSwyNzMKPj4+Pj4gICAgIDUwOiAgICAgNGIgZmYgZmYgZDAgICAg
IGIgICAgICAgMjAgPHZtX2dldF9wYWdlX3Byb3QrMHgyMD4KPj4+Pj4KPj4+Pj4KPj4+Pj4gVGhh
dCBpcyBkZWZpbml0ZWx5IG1vcmUgZXhwZW5zaXZlLCBpdCBpbXBsZW1lbnRzIGEgdGFibGUgb2Yg
YnJhbmNoZXMuCj4+Pj4KPj4+PiBPa2F5LCB3aWxsIHNwbGl0IG91dCB0aGUgUFBDMzIgaW1wbGVt
ZW50YXRpb24gdGhhdCByZXRhaW5zIGV4aXN0aW5nCj4+Pj4gdGFibGUgbG9vayB1cCBtZXRob2Qu
IEFsc28gcGxhbm5pbmcgdG8ga2VlcCB0aGF0IGluc2lkZSBzYW1lIGZpbGUKPj4+PiAoYXJjaC9w
b3dlcnBjL21tL21tYXAuYyksIHVubGVzcyB5b3UgaGF2ZSBhIGRpZmZlcmVuY2UgcHJlZmVyZW5j
ZS4KPj4+Cj4+PiBNeSBwb2ludCB3YXMgbm90IHRvIGdldCBzb21ldGhpbmcgc3BlY2lmaWMgZm9y
IFBQQzMyLCBidXQgdG8gYW1wbGlmeSBvbgo+Pj4gUnVzc2VsbCdzIG9iamVjdGlvbi4KPj4+Cj4+
PiBBcyB0aGlzIGlzIGJhZCBmb3IgQVJNIGFuZCBiYWQgZm9yIFBQQzMyLCBkbyB3ZSBoYXZlIGFu
eSBldmlkZW5jZSB0aGF0Cj4+PiB5b3VyIGNoYW5nZSBpcyBnb29kIGZvciBhbnkgb3RoZXIgYXJj
aGl0ZWN0dXJlID8KPj4+Cj4+PiBJIGNoZWNrZWQgUFBDNjQgYW5kIHRoZXJlIGlzIGV4YWN0bHkg
dGhlIHNhbWUgZHJhd2JhY2suIFdpdGggdGhlIGN1cnJlbnQKPj4+IGltcGxlbWVudGF0aW9uIGl0
IGlzIGEgc21hbGwgZnVuY3Rpb24gcGVyZm9ybWluZyB0YWJsZSByZWFkIHRoZW4gYSBmZXcKPj4+
IGFkanVzdG1lbnQuIEFmdGVyIHlvdXIgY2hhbmdlIGl0IGlzIGEgYmlnZ2VyIGZ1bmN0aW9uIGlt
cGxlbWVudGluZyBhCj4+PiB0YWJsZSBvZiBicmFuY2hlcy4KPj4KPj4gSSBhbSB3b25kZXJpbmcg
aWYgdGhpcyB3b3VsZCBub3QgYmUgdGhlIGNhc2UgZm9yIGFueSBvdGhlciBzd2l0Y2ggY2FzZQo+
PiBzdGF0ZW1lbnQgb24gdGhlIHBsYXRmb3JtID8gSXMgdGhlcmUgc29tZXRoaW5nIHNwZWNpZmlj
L2RpZmZlcmVudCBqdXN0Cj4+IG9uIHZtX2dldF9wYWdlX3Byb3QoKSBpbXBsZW1lbnRhdGlvbiA/
IEFyZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IHN3aXRjaAo+PiBjYXNlIHN0YXRlbWVudHMgc2hvdWxk
IGp1c3QgYmUgYXZvaWRlZCBpbnN0ZWFkID8KPj4KPj4+Cj4+PiBTbywgYXMgcmVxdWVzdGVkIGJ5
IFJ1c3NlbGwsIGNvdWxkIHlvdSBsb29rIGF0IHRoZSBkaXNhc3NlbWJseSBmb3Igb3RoZXIKPj4+
IGFyY2hpdGVjdHVyZXMgYW5kIHNob3cgdXMgdGhhdCBBUk0gYW5kIFBPV0VSUEMgYXJlIHRoZSBv
bmx5IG9uZXMgZm9yCj4+PiB3aGljaCB5b3VyIGNoYW5nZSBpcyBub3Qgb3B0aW1hbCA/Cj4+Cj4+
IEJ1dCB0aGUgcHJpbWFyeSBwdXJwb3NlIG9mIHRoaXMgc2VyaWVzIGlzIG5vdCB0byBndWFyYW50
ZWUgb3B0aW1pemVkCj4+IGNvZGUgb24gcGxhdGZvcm0gYnkgcGxhdGZvcm0gYmFzaXMsIHdoaWxl
IG1pZ3JhdGluZyBmcm9tIGEgdGFibGUgYmFzZWQKPj4gbG9vayB1cCBtZXRob2QgaW50byBhIHN3
aXRjaCBjYXNlIHN0YXRlbWVudC4KPj4KPj4gQnV0IGluc3RlYWQsIHRoZSBwdXJwb3NlcyBpcyB0
byByZW1vdmUgY3VycmVudCBsZXZlbHMgb2YgdW5uZWNlc3NhcnkKPj4gYWJzdHJhY3Rpb24gd2hp
bGUgY29udmVydGluZyBhIHZtX2ZsYWdzIGFjY2VzcyBjb21iaW5hdGlvbiBpbnRvIHBhZ2UKPj4g
cHJvdGVjdGlvbi4gVGhlIHN3aXRjaCBjYXNlIHN0YXRlbWVudCBmb3IgcGxhdGZvcm0gaW1wbGVt
ZW50YXRpb24gb2YKPj4gdm1fZ2V0X3BhZ2VfcHJvdCgpIGp1c3Qgc2VlbWVkIGxvZ2ljYWwgZW5v
dWdoLiBDaHJpc3RvcGgncyBvcmlnaW5hbAo+PiBzdWdnZXN0aW9uIHBhdGNoIGZvciB4ODYgaGFk
IHRoZSBzYW1lIGltcGxlbWVudGF0aW9uIGFzIHdlbGwuCj4+Cj4+IEJ1dCBpZiB0aGUgdGFibGUg
bG9vayB1cCBpcyBzdGlsbCBiZXR0ZXIvcHJlZmVycmVkIG1ldGhvZCBvbiBjZXJ0YWluCj4+IHBs
YXRmb3JtcyBsaWtlIGFybSBvciBwcGMzMiwgd2lsbCBiZSBoYXBweSB0byBwcmVzZXJ2ZSB0aGF0
Lgo+IAo+IEkgZG91YnQgdGhlIHN3aXRjaCgpIHZhcmlhbnQgd291bGQgZ2l2ZSBiZXR0ZXIgY29k
ZSBvbiBhbnkgcGxhdGZvcm0uCj4gCj4gV2hhdCBhYm91dCB1c2luZyB0YWJsZXMgZXZlcnl3aGVy
ZSwgdXNpbmcgZGVzaWduYXRlZCBpbml0aWFsaXplcnMKPiB0byBpbXByb3ZlIHJlYWRhYmlsaXR5
PwoKRGVzaWduYXRlZCBpbml0aWFsaXplcnMgPyBDb3VsZCB5b3UgcGxlYXNlIGJlIG1vcmUgc3Bl
Y2lmaWMuIEEgdGFibGUgbG9vawp1cCBvbiBhcm0gcGxhdGZvcm0gd291bGQgYmUgc29tZXRoaW5n
IGxpa2UgdGhpcyBhbmQgYXJtX3Byb3RlY3Rpb25fbWFwW10KbmVlZHMgdG8gYmUgdXBkYXRlZCB3
aXRoIHVzZXJfcGdwcm90IGxpa2UgYmVmb3JlLiBKdXN0IHdvbmRlcmluZyBob3cgYQpkZXNpZ25h
dGVkIGluaXRpYWxpemVyIHdpbGwgaGVscCBoZXJlLgoKc3RhdGljIHBncHJvdF90IGFybV9wcm90
ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0ID0gewogICAgICAgW1ZNX05PTkVdICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBfX1BBR0VfTk9ORSwKICAgICAgIFtW
TV9SRUFEXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gX19QQUdFX1JF
QURPTkxZLAogICAgICAgW1ZNX1dSSVRFXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPSBfX1BBR0VfQ09QWSwKICAgICAgIFtWTV9XUklURSB8IFZNX1JFQURdICAgICAgICAg
ICAgICAgICAgICAgICAgICAgID0gX19QQUdFX0NPUFksCiAgICAgICBbVk1fRVhFQ10gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IF9fUEFHRV9SRUFET05MWV9FWEVDLAog
ICAgICAgW1ZNX0VYRUMgfCBWTV9SRUFEXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBf
X1BBR0VfUkVBRE9OTFlfRVhFQywKICAgICAgIFtWTV9FWEVDIHwgVk1fV1JJVEVdICAgICAgICAg
ICAgICAgICAgICAgICAgICAgID0gX19QQUdFX0NPUFlfRVhFQywKICAgICAgIFtWTV9FWEVDIHwg
Vk1fV1JJVEUgfCBWTV9SRUFEXSAgICAgICAgICAgICAgICAgID0gX19QQUdFX0NPUFlfRVhFQywK
ICAgICAgIFtWTV9TSEFSRURdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0g
X19QQUdFX05PTkUsCiAgICAgICBbVk1fU0hBUkVEIHwgVk1fUkVBRF0gICAgICAgICAgICAgICAg
ICAgICAgICAgICA9IF9fUEFHRV9SRUFET05MWSwKICAgICAgIFtWTV9TSEFSRUQgfCBWTV9XUklU
RV0gICAgICAgICAgICAgICAgICAgICAgICAgID0gX19QQUdFX1NIQVJFRCwKICAgICAgIFtWTV9T
SEFSRUQgfCBWTV9XUklURSB8IFZNX1JFQURdICAgICAgICAgICAgICAgID0gX19QQUdFX1NIQVJF
RCwKICAgICAgIFtWTV9TSEFSRUQgfCBWTV9FWEVDXSAgICAgICAgICAgICAgICAgICAgICAgICAg
ID0gX19QQUdFX1JFQURPTkxZX0VYRUMsCiAgICAgICBbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZN
X1JFQURdICAgICAgICAgICAgICAgICA9IF9fUEFHRV9SRUFET05MWV9FWEVDLAogICAgICAgW1ZN
X1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURV0gICAgICAgICAgICAgICAgPSBfX1BBR0VfU0hB
UkVEX0VYRUMsCiAgICAgICBbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVB
RF0gICAgICA9IF9fUEFHRV9TSEFSRURfRVhFQwp9OwoKcGdwcm90X3Qgdm1fZ2V0X3BhZ2VfcHJv
dCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQp7CiAgICAgICByZXR1cm4gX19wZ3Byb3QocGdwcm90
X3ZhbChhcm1fcHJvdGVjdGlvbl9tYXBbdm1fZmxhZ3MgJgogICAgICAgICAgICAgICAgICAgICAg
KFZNX1JFQUR8Vk1fV1JJVEV8Vk1fRVhFQ3xWTV9TSEFSRUQpXSkpOwp9CkVYUE9SVF9TWU1CT0wo
dm1fZ2V0X3BhZ2VfcHJvdCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
