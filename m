Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C25274C7EF8
	for <lists+openrisc@lfdr.de>; Tue,  1 Mar 2022 01:00:55 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 245E7247FE;
	Tue,  1 Mar 2022 01:00:53 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 60344242D7
 for <openrisc@lists.librecores.org>; Tue,  1 Mar 2022 01:00:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9BAD6E;
 Mon, 28 Feb 2022 16:00:50 -0800 (PST)
Received: from [10.163.50.231] (unknown [10.163.50.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52833F66F;
 Mon, 28 Feb 2022 16:00:43 -0800 (PST)
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
Date: Tue, 1 Mar 2022 05:30:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
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

CgpPbiAyLzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiBPbiBN
b24sIEZlYiAyOCwgMjAyMiBhdCAwNDoxNzozMlBNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3
cm90ZToKPj4gVGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgY3Vz
dG9tIHZtX2dldF9wYWdlX3Byb3QoKSB2aWEKPj4gc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VU
X1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9fUFhYWAo+PiBtYWNyb3Mg
Y2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCj4gCj4gV2hhdCBJIHdv
dWxkIHJlYWxseSBsaWtlIHRvIGtub3cgaXMgd2h5IGhhdmluZyB0byBydW4gX2NvZGVfIHRvIHdv
cmsgb3V0Cj4gd2hhdCB0aGUgcGFnZSBwcm90ZWN0aW9ucyBuZWVkIHRvIGJlIGlzIGJldHRlciB0
aGFuIGxvb2tpbmcgaXQgdXAgaW4gYQo+IHRhYmxlLgo+IAo+IE5vdCBvbmx5IGlzIHRoaXMgbW9y
ZSBleHBlbnNpdmUgaW4gdGVybXMgb2YgQ1BVIGN5Y2xlcywgaXQgYWxzbyBicmluZ3MKPiBhZGRp
dGlvbmFsIGNvZGUgc2l6ZSB3aXRoIGl0Lgo+IAo+IEknbSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aGF0
IHRoZSBiZW5lZml0IGlzLgo+IAoKQ3VycmVudGx5IHZtX2dldF9wYWdlX3Byb3QoKSBpcyBhbHNv
IGJlaW5nIF9ydW5fIHRvIGZldGNoIHJlcXVpcmVkIHBhZ2UKcHJvdGVjdGlvbiB2YWx1ZXMuIEFs
dGhvdWdoIHRoYXQgaXMgYmVpbmcgcnVuIGluIHRoZSBjb3JlIE1NIGFuZCBmcm9tIGEKcGxhdGZv
cm0gcGVyc3BlY3RpdmUgX19TWFhYLCBfX1BYWFggYXJlIGp1c3QgYmVpbmcgZXhwb3J0ZWQgZm9y
IGEgdGFibGUuCkxvb2tpbmcgaXQgdXAgaW4gYSB0YWJsZSAoYW5kIGFwcGx5aW5nIG1vcmUgY29u
c3RydWN0cyB0aGVyZSBhZnRlcikgaXMKbm90IG11Y2ggZGlmZmVyZW50IHRoYW4gYSBjbGVhbiBz
d2l0Y2ggY2FzZSBzdGF0ZW1lbnQgaW4gdGVybXMgb2YgQ1BVCnVzYWdlLiBTbyB0aGlzIGlzIG5v
dCBtb3JlIGV4cGVuc2l2ZSBpbiB0ZXJtcyBvZiBDUFUgY3ljbGVzLgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9fcm9fYWZ0ZXJfaW5pdCA9
IHsKICAgICAgICBfX1AwMDAsIF9fUDAwMSwgX19QMDEwLCBfX1AwMTEsIF9fUDEwMCwgX19QMTAx
LCBfX1AxMTAsIF9fUDExMSwKICAgICAgICBfX1MwMDAsIF9fUzAwMSwgX19TMDEwLCBfX1MwMTEs
IF9fUzEwMCwgX19TMTAxLCBfX1MxMTAsIF9fUzExMQp9OwoKI2lmbmRlZiBDT05GSUdfQVJDSF9I
QVNfRklMVEVSX1BHUFJPVApzdGF0aWMgaW5saW5lIHBncHJvdF90IGFyY2hfZmlsdGVyX3BncHJv
dChwZ3Byb3RfdCBwcm90KQp7CiAgICAgICAgcmV0dXJuIHByb3Q7Cn0KI2VuZGlmCgpwZ3Byb3Rf
dCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpCnsKICAgICAgICBwZ3By
b3RfdCByZXQgPSBfX3BncHJvdChwZ3Byb3RfdmFsKHByb3RlY3Rpb25fbWFwW3ZtX2ZsYWdzICYK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoVk1fUkVBRHxWTV9XUklURXxWTV9FWEVD
fFZNX1NIQVJFRCldKSB8CiAgICAgICAgICAgICAgICAgICAgICAgIHBncHJvdF92YWwoYXJjaF92
bV9nZXRfcGFnZV9wcm90KHZtX2ZsYWdzKSkpOwoKICAgICAgICByZXR1cm4gYXJjaF9maWx0ZXJf
cGdwcm90KHJldCk7Cn0KRVhQT1JUX1NZTUJPTCh2bV9nZXRfcGFnZV9wcm90KQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCgpUaGVyZSB3aWxsIGJlIGEgc2luZ2xlIHZtX2dldF9wYWdlX3By
b3QoKSBpbnN0YW5jZSBvbiBhIGdpdmVuIHBsYXRmb3JtCmp1c3QgbGlrZSBiZWZvcmUuIFNvIHRo
aXMgYWxzbyBkb2VzIG5vdCBicmluZyBhbnkgYWRkaXRpb25hbCBjb2RlIHNpemUKd2l0aCBpdC4K
CkFzIG1lbnRpb25lZCBlYXJsaWVyIG9uIGEgcHJldmlvdXMgdmVyc2lvbi4KClJlbW92ZSBtdWx0
aXBsZSAnY29yZSBNTSA8LS0+IHBsYXRmb3JtJyBhYnN0cmFjdGlvbiBsYXllcnMgdG8gbWFwCnZt
X2ZsYWdzIGFjY2VzcyBwZXJtaXNzaW9uIGNvbWJpbmF0aW9uIGludG8gcGFnZSBwcm90ZWN0aW9u
LgoKRnJvbSB0aGUgY292ZXIgbGV0dGVyIC4uLi4uLgoKLS0tLS0tLS0tLQpDdXJyZW50bHkgdGhl
cmUgYXJlIG11bHRpcGxlIGxheWVycyBvZiBhYnN0cmFjdGlvbiBpLmUgX19TWFhYL19fUFhYWCBt
YWNyb3MKLCBwcm90ZWN0aW9uX21hcFtdLCBhcmNoX3ZtX2dldF9wYWdlX3Byb3QoKSBhbmQgYXJj
aF9maWx0ZXJfcGdwcm90KCkgYnVpbHQKYmV0d2VlbiB0aGUgcGxhdGZvcm0gYW5kIGdlbmVyaWMg
TU0sIGZpbmFsbHkgZGVmaW5pbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgoKSGVuY2UgdGhpcyBzZXJp
ZXMgcHJvcG9zZXMgdG8gZHJvcCBhbGwgdGhlc2UgYWJzdHJhY3Rpb24gbGV2ZWxzIGFuZCBpbnN0
ZWFkCmp1c3QgbW92ZSB0aGUgcmVzcG9uc2liaWxpdHkgb2YgZGVmaW5pbmcgdm1fZ2V0X3BhZ2Vf
cHJvdCgpIHRvIHRoZSBwbGF0Zm9ybQppdHNlbGYgbWFraW5nIGl0IGNsZWFuIGFuZCBzaW1wbGUu
Ci0tLS0tLS0tLS0KCkJlbmVmaXRzCgoxLiBGb3IgcGxhdGZvcm1zIHVzaW5nIGFyY2hfdm1fZ2V0
X3BhZ2VfcHJvdCgpIGFuZC9vciBhcmNoX2ZpbHRlcl9wZ3Byb3QoKQoKCS0gQSBzaW1wbGlmaWVk
IHZtX2dldF9wYWdlX3Byb3QoKQoJLSBEcm9wcGVkIGFyY2hfdm1fZ2V0X3BhZ2VfcHJvdCgpIGFu
ZCBhcmNoX2ZpbHRlcl9wZ3Byb3QoKQoJLSBEcm9wcGVkIF9fU1hYWCwgX19QWFhYIG1hY3JvcwoK
Mi4gRm9yIHBsYXRmb3JtcyB3aGljaCBqdXN0IGV4cG9ydGVkIF9fU1hYWCwgX19QWFhYCgoJLSBB
IHNpbXBsaWZpZWQgdm1fZ2V0X3BhZ2VfcHJvdCgpCgktIERyb3BwZWQgX19TWFhYLCBfX1BYWFgg
bWFjcm9zCgozLiBGb3IgY29yZSBNTQoKCS0gRHJvcHBlZCBhIGNvbXBsZXggdm1fZ2V0X3BhZ2Vf
cHJvdCgpIHdpdGggbXVsdGlwbGUgbGF5ZXJzCiAJICBvZiBhYnN0cmFjdGlvbiBpLmUgX19TWFhY
L19fUFhYWCBtYWNyb3MsIHByb3RlY3Rpb25fbWFwW10sCgkgIGFyY2hfdm1fZ2V0X3BhZ2VfcHJv
dCgpLCBhcmNoX2ZpbHRlcl9wZ3Byb3QoKSBldGMuCgotIEFuc2h1bWFuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
