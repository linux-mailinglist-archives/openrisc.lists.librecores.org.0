Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 17D084C9BE7
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 04:16:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BA49424841;
	Wed,  2 Mar 2022 04:16:03 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 2710024834
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 04:16:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C1C9113E;
 Tue,  1 Mar 2022 19:16:02 -0800 (PST)
Received: from [10.163.49.202] (unknown [10.163.49.202])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 091233F73D;
 Tue,  1 Mar 2022 19:15:54 -0800 (PST)
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2f995e2a-c00f-bc9c-6ac6-c783a21b007e@arm.com>
Date: Wed, 2 Mar 2022 08:45:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAzLzEvMjIgNjowMSBBTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+IE9uIFR1
ZSwgTWFyIDAxLCAyMDIyIGF0IDA1OjMwOjQxQU0gKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdy
b3RlOgo+PiBPbiAyLzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToK
Pj4+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDA0OjE3OjMyUE0gKzA1MzAsIEFuc2h1bWFuIEto
YW5kdWFsIHdyb3RlOgo+Pj4+IFRoaXMgZGVmaW5lcyBhbmQgZXhwb3J0cyBhIHBsYXRmb3JtIHNw
ZWNpZmljIGN1c3RvbSB2bV9nZXRfcGFnZV9wcm90KCkgdmlhCj4+Pj4gc3Vic2NyaWJpbmcgQVJD
SF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9fUFhY
WAo+Pj4+IG1hY3JvcyBjYW4gYmUgZHJvcHBlZCB3aGljaCBhcmUgbm8gbG9uZ2VyIG5lZWRlZC4K
Pj4+IFdoYXQgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBrbm93IGlzIHdoeSBoYXZpbmcgdG8gcnVu
IF9jb2RlXyB0byB3b3JrIG91dAo+Pj4gd2hhdCB0aGUgcGFnZSBwcm90ZWN0aW9ucyBuZWVkIHRv
IGJlIGlzIGJldHRlciB0aGFuIGxvb2tpbmcgaXQgdXAgaW4gYQo+Pj4gdGFibGUuCj4+Pgo+Pj4g
Tm90IG9ubHkgaXMgdGhpcyBtb3JlIGV4cGVuc2l2ZSBpbiB0ZXJtcyBvZiBDUFUgY3ljbGVzLCBp
dCBhbHNvIGJyaW5ncwo+Pj4gYWRkaXRpb25hbCBjb2RlIHNpemUgd2l0aCBpdC4KPj4+Cj4+PiBJ
J20gc3RydWdnbGluZyB0byBzZWUgd2hhdCB0aGUgYmVuZWZpdCBpcy4KPj4gQ3VycmVudGx5IHZt
X2dldF9wYWdlX3Byb3QoKSBpcyBhbHNvIGJlaW5nIF9ydW5fIHRvIGZldGNoIHJlcXVpcmVkIHBh
Z2UKPj4gcHJvdGVjdGlvbiB2YWx1ZXMuIEFsdGhvdWdoIHRoYXQgaXMgYmVpbmcgcnVuIGluIHRo
ZSBjb3JlIE1NIGFuZCBmcm9tIGEKPj4gcGxhdGZvcm0gcGVyc3BlY3RpdmUgX19TWFhYLCBfX1BY
WFggYXJlIGp1c3QgYmVpbmcgZXhwb3J0ZWQgZm9yIGEgdGFibGUuCj4+IExvb2tpbmcgaXQgdXAg
aW4gYSB0YWJsZSAoYW5kIGFwcGx5aW5nIG1vcmUgY29uc3RydWN0cyB0aGVyZSBhZnRlcikgaXMK
Pj4gbm90IG11Y2ggZGlmZmVyZW50IHRoYW4gYSBjbGVhbiBzd2l0Y2ggY2FzZSBzdGF0ZW1lbnQg
aW4gdGVybXMgb2YgQ1BVCj4+IHVzYWdlLiBTbyB0aGlzIGlzIG5vdCBtb3JlIGV4cGVuc2l2ZSBp
biB0ZXJtcyBvZiBDUFUgY3ljbGVzLgo+IEkgZGlzYWdyZWUuCj4gCj4gSG93ZXZlciwgbGV0J3Mg
YmFzZSB0aGlzIGRpc2FncmVlbWVudCBvbiBzb21lIGV2aWRlbmNlLiBIZXJlIGlzIHRoZQo+IHBy
ZXNlbnQgMzItYml0IEFSTSBpbXBsZW1lbnRhdGlvbjoKPiAKPiAwMDAwMDA0OCA8dm1fZ2V0X3Bh
Z2VfcHJvdD46Cj4gICAgICAgNDg6ICAgICAgIGUyMDAwMDBmICAgICAgICBhbmQgICAgIHIwLCBy
MCwgIzE1Cj4gICAgICAgNGM6ICAgICAgIGUzMDAzMDAwICAgICAgICBtb3Z3ICAgIHIzLCAjMAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIDRjOiBSX0FSTV9NT1ZXX0FCU19OQyAgIC5MQU5DSE9S
MQo+ICAgICAgIDUwOiAgICAgICBlMzQwMzAwMCAgICAgICAgbW92dCAgICByMywgIzAKPiAgICAg
ICAgICAgICAgICAgICAgICAgICA1MDogUl9BUk1fTU9WVF9BQlMgICAgICAuTEFOQ0hPUjEKPiAg
ICAgICA1NDogICAgICAgZTc5MzAxMDAgICAgICAgIGxkciAgICAgcjAsIFtyMywgcjAsIGxzbCAj
Ml0KPiAgICAgICA1ODogICAgICAgZTEyZmZmMWUgICAgICAgIGJ4ICAgICAgbHIKPiAKPiBUaGF0
IGlzIGZpdmUgaW5zdHJ1Y3Rpb25zIGxvbmcuCj4gCj4gUGxlYXNlIHNob3cgdGhhdCB5b3VyIG5l
dyBpbXBsZW1lbnRhdGlvbiBpcyBub3QgbW9yZSBleHBlbnNpdmUgb24KPiAzMi1iaXQgQVJNLiBQ
bGVhc2UgZG8gc28gYnkgYnVpbGRpbmcgYSAzMi1iaXQga2VybmVsLCBhbmQgcHJvdmlkaW5nCj4g
dGhlIGRpc2Fzc2VtYmx5Lgo+IAo+IEkgdGhpbmsgeW91IHdpbGwgZmluZCB3YXkgbW9yZSB0aGFu
IGZpdmUgaW5zdHJ1Y3Rpb25zIGluIHlvdXIgdmVyc2lvbiAtCj4gdGhlIGNvbXBpbGVyIHdpbGwg
aGF2ZSB0byBpc3N1ZSBjb2RlIHRvIGRlY29kZSB0aGUgcHJvdGVjdGlvbiBiaXRzLAo+IHByb2Jh
Ymx5IHVzaW5nIGEgdGFibGUgb2YgYnJhbmNoZXMgb3IgYWJzb2x1dGUgUEMgdmFsdWVzLCBvciBw
b3NzaWJseQo+IHRoZSB3b3JzdCBjYXNlIG9mIHVzaW5nIG11bHRpcGxlIGNvbXBhcmlzb25zIGFu
ZCBicmFuY2hlcy4gSXQgdGhlbiBoYXMKPiB0byBsb2FkIGNvbnN0YW50cyB0aGF0IG1heSBiZSBt
b3ZlZCB1c2luZyBtb3Z3IG9uIEFSTXY3LCBidXQgb24KPiBvbGRlciBhcmNoaXRlY3R1cmVzIHdv
dWxkIGhhdmUgdG8gYmUgY3JlYXRlZCBmcm9tIG11bHRpcGxlIGluc3RydWN0aW9ucwo+IG9yIGxv
YWRlZCBmcm9tIHRoZSBsaXRlcmFsIHBvb2wuIFRoZW4gdGhlcmUnbGwgYmUgaW5zdHJ1Y3Rpb25z
IHRvIGxvYWQKPiB0aGUgYWRkcmVzcyBvZiAidXNlcl9wZ3Byb3QiLCByZXRyaWV2ZSBpdHMgdmFs
dWUsIGFuZCBiaXR3aXNlIG9yIHRoYXQuCj4gCj4gVGhlcmVmb3JlLCBJIGZhaWwgdG8gc2VlIGhv
dyB5b3VyIGFwcHJvYWNoIG9mIGdldHRpbmcgcmlkIG9mIHRoZSB0YWJsZQo+IGlzIHNvbWVob3cg
ImJldHRlciIgdGhhbiB3aGF0IHdlIGN1cnJlbnRseSBoYXZlIGluIHRlcm1zIG9mIHRoZSBlZmZl
Y3QKPiBvbiB0aGUgcmVzdWx0aW5nIGNvZGUuCj4gCj4gSWYgeW91IGRvbid0IGxpa2UgdGhlIF9f
UCBhbmQgX19TIHN0dWZmIGFuZCB0d28gYXJjaF8qIGhvb2tzLCB5b3UgY291bGQKPiBtb3ZlIHRo
ZSB0YWJsZSBpbnRvIGFyY2ggY29kZSBhbG9uZyB3aXRoIHZtX2dldF9wYWdlX3Byb3QoKSB3aXRo
b3V0IHRoZQo+IGFkZGl0aW9uYWwgdW5uZWNlc3NhcnkgaG9va3MsIHdoaWxlIGtlZXBpbmcgYWxs
IHRoZSBiZW5lZml0cyBvZiB0aGUKPiB0YWJsZSBsb29rdXAuCgpPa2F5LCB3aWxsIGNoYW5nZSB0
aGUgYXJtJ3Mgdm1fZ2V0X3BhZ2VfcHJvdCgpIGltcGxlbWVudGF0aW9uIGFzIHN1Z2dlc3RlZC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
