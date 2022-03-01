Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 62CEE4C7F41
	for <lists+openrisc@lfdr.de>; Tue,  1 Mar 2022 01:31:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1ED5324812;
	Tue,  1 Mar 2022 01:31:49 +0100 (CET)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id E091223F5C
 for <openrisc@lists.librecores.org>; Tue,  1 Mar 2022 01:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ulo3aKo1xFoE/cfpZL+xmuPztKVuMRRxvY14DLWAKfs=; b=TZ2cQwur5niBWVC6LB4QbXcHpv
 yGq5XkdOUsSWNRkxXZ+xUu5Ne0aoSxjd3EFSlTw//uzlshcrTXL1WSIBeOMG//K6E9//LBKJUF9Lp
 d7Y8pI7iUxxk/8UV8I9dwPeOHRQJrBUaCR39kXJqEljuLwSEl4MHOJijW5OikAy/N25r3lTVtf1Ag
 oIBnjedmBuxSvxg8dfoYm9DWWD+PZV27EI5OegTGUF4/hMMKXqnxVwYbdXI8kc3CAp+2jMU4yuwUe
 xKeSe/NHCpEfdBmuKjHRWnZEZR6+VRP60/U5O3k1v3b2eE1uOwifrodWENU1y4R33yD4snwtAShBo
 RlwlILPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57570)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nOqQP-0000ag-Kh; Tue, 01 Mar 2022 00:31:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nOqQK-0006cw-KE; Tue, 01 Mar 2022 00:31:28 +0000
Date: Tue, 1 Mar 2022 00:31:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
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

T24gVHVlLCBNYXIgMDEsIDIwMjIgYXQgMDU6MzA6NDFBTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cj4gT24gMi8yOC8yMiA0OjI3IFBNLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3Jv
dGU6Cj4gPiBPbiBNb24sIEZlYiAyOCwgMjAyMiBhdCAwNDoxNzozMlBNICswNTMwLCBBbnNodW1h
biBLaGFuZHVhbCB3cm90ZToKPiA+PiBUaGlzIGRlZmluZXMgYW5kIGV4cG9ydHMgYSBwbGF0Zm9y
bSBzcGVjaWZpYyBjdXN0b20gdm1fZ2V0X3BhZ2VfcHJvdCgpIHZpYQo+ID4+IHN1YnNjcmliaW5n
IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QuIFN1YnNlcXVlbnRseSBhbGwgX19TWFhYIGFuZCBf
X1BYWFgKPiA+PiBtYWNyb3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdlciBuZWVk
ZWQuCj4gPiAKPiA+IFdoYXQgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBrbm93IGlzIHdoeSBoYXZp
bmcgdG8gcnVuIF9jb2RlXyB0byB3b3JrIG91dAo+ID4gd2hhdCB0aGUgcGFnZSBwcm90ZWN0aW9u
cyBuZWVkIHRvIGJlIGlzIGJldHRlciB0aGFuIGxvb2tpbmcgaXQgdXAgaW4gYQo+ID4gdGFibGUu
Cj4gPiAKPiA+IE5vdCBvbmx5IGlzIHRoaXMgbW9yZSBleHBlbnNpdmUgaW4gdGVybXMgb2YgQ1BV
IGN5Y2xlcywgaXQgYWxzbyBicmluZ3MKPiA+IGFkZGl0aW9uYWwgY29kZSBzaXplIHdpdGggaXQu
Cj4gPiAKPiA+IEknbSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aGF0IHRoZSBiZW5lZml0IGlzLgo+IAo+
IEN1cnJlbnRseSB2bV9nZXRfcGFnZV9wcm90KCkgaXMgYWxzbyBiZWluZyBfcnVuXyB0byBmZXRj
aCByZXF1aXJlZCBwYWdlCj4gcHJvdGVjdGlvbiB2YWx1ZXMuIEFsdGhvdWdoIHRoYXQgaXMgYmVp
bmcgcnVuIGluIHRoZSBjb3JlIE1NIGFuZCBmcm9tIGEKPiBwbGF0Zm9ybSBwZXJzcGVjdGl2ZSBf
X1NYWFgsIF9fUFhYWCBhcmUganVzdCBiZWluZyBleHBvcnRlZCBmb3IgYSB0YWJsZS4KPiBMb29r
aW5nIGl0IHVwIGluIGEgdGFibGUgKGFuZCBhcHBseWluZyBtb3JlIGNvbnN0cnVjdHMgdGhlcmUg
YWZ0ZXIpIGlzCj4gbm90IG11Y2ggZGlmZmVyZW50IHRoYW4gYSBjbGVhbiBzd2l0Y2ggY2FzZSBz
dGF0ZW1lbnQgaW4gdGVybXMgb2YgQ1BVCj4gdXNhZ2UuIFNvIHRoaXMgaXMgbm90IG1vcmUgZXhw
ZW5zaXZlIGluIHRlcm1zIG9mIENQVSBjeWNsZXMuCgpJIGRpc2FncmVlLgoKSG93ZXZlciwgbGV0
J3MgYmFzZSB0aGlzIGRpc2FncmVlbWVudCBvbiBzb21lIGV2aWRlbmNlLiBIZXJlIGlzIHRoZQpw
cmVzZW50IDMyLWJpdCBBUk0gaW1wbGVtZW50YXRpb246CgowMDAwMDA0OCA8dm1fZ2V0X3BhZ2Vf
cHJvdD46CiAgICAgIDQ4OiAgICAgICBlMjAwMDAwZiAgICAgICAgYW5kICAgICByMCwgcjAsICMx
NQogICAgICA0YzogICAgICAgZTMwMDMwMDAgICAgICAgIG1vdncgICAgcjMsICMwCiAgICAgICAg
ICAgICAgICAgICAgICAgIDRjOiBSX0FSTV9NT1ZXX0FCU19OQyAgIC5MQU5DSE9SMQogICAgICA1
MDogICAgICAgZTM0MDMwMDAgICAgICAgIG1vdnQgICAgcjMsICMwCiAgICAgICAgICAgICAgICAg
ICAgICAgIDUwOiBSX0FSTV9NT1ZUX0FCUyAgICAgIC5MQU5DSE9SMQogICAgICA1NDogICAgICAg
ZTc5MzAxMDAgICAgICAgIGxkciAgICAgcjAsIFtyMywgcjAsIGxzbCAjMl0KICAgICAgNTg6ICAg
ICAgIGUxMmZmZjFlICAgICAgICBieCAgICAgIGxyCgpUaGF0IGlzIGZpdmUgaW5zdHJ1Y3Rpb25z
IGxvbmcuCgpQbGVhc2Ugc2hvdyB0aGF0IHlvdXIgbmV3IGltcGxlbWVudGF0aW9uIGlzIG5vdCBt
b3JlIGV4cGVuc2l2ZSBvbgozMi1iaXQgQVJNLiBQbGVhc2UgZG8gc28gYnkgYnVpbGRpbmcgYSAz
Mi1iaXQga2VybmVsLCBhbmQgcHJvdmlkaW5nCnRoZSBkaXNhc3NlbWJseS4KCkkgdGhpbmsgeW91
IHdpbGwgZmluZCB3YXkgbW9yZSB0aGFuIGZpdmUgaW5zdHJ1Y3Rpb25zIGluIHlvdXIgdmVyc2lv
biAtCnRoZSBjb21waWxlciB3aWxsIGhhdmUgdG8gaXNzdWUgY29kZSB0byBkZWNvZGUgdGhlIHBy
b3RlY3Rpb24gYml0cywKcHJvYmFibHkgdXNpbmcgYSB0YWJsZSBvZiBicmFuY2hlcyBvciBhYnNv
bHV0ZSBQQyB2YWx1ZXMsIG9yIHBvc3NpYmx5CnRoZSB3b3JzdCBjYXNlIG9mIHVzaW5nIG11bHRp
cGxlIGNvbXBhcmlzb25zIGFuZCBicmFuY2hlcy4gSXQgdGhlbiBoYXMKdG8gbG9hZCBjb25zdGFu
dHMgdGhhdCBtYXkgYmUgbW92ZWQgdXNpbmcgbW92dyBvbiBBUk12NywgYnV0IG9uCm9sZGVyIGFy
Y2hpdGVjdHVyZXMgd291bGQgaGF2ZSB0byBiZSBjcmVhdGVkIGZyb20gbXVsdGlwbGUgaW5zdHJ1
Y3Rpb25zCm9yIGxvYWRlZCBmcm9tIHRoZSBsaXRlcmFsIHBvb2wuIFRoZW4gdGhlcmUnbGwgYmUg
aW5zdHJ1Y3Rpb25zIHRvIGxvYWQKdGhlIGFkZHJlc3Mgb2YgInVzZXJfcGdwcm90IiwgcmV0cmll
dmUgaXRzIHZhbHVlLCBhbmQgYml0d2lzZSBvciB0aGF0LgoKVGhlcmVmb3JlLCBJIGZhaWwgdG8g
c2VlIGhvdyB5b3VyIGFwcHJvYWNoIG9mIGdldHRpbmcgcmlkIG9mIHRoZSB0YWJsZQppcyBzb21l
aG93ICJiZXR0ZXIiIHRoYW4gd2hhdCB3ZSBjdXJyZW50bHkgaGF2ZSBpbiB0ZXJtcyBvZiB0aGUg
ZWZmZWN0Cm9uIHRoZSByZXN1bHRpbmcgY29kZS4KCklmIHlvdSBkb24ndCBsaWtlIHRoZSBfX1Ag
YW5kIF9fUyBzdHVmZiBhbmQgdHdvIGFyY2hfKiBob29rcywgeW91IGNvdWxkCm1vdmUgdGhlIHRh
YmxlIGludG8gYXJjaCBjb2RlIGFsb25nIHdpdGggdm1fZ2V0X3BhZ2VfcHJvdCgpIHdpdGhvdXQg
dGhlCmFkZGl0aW9uYWwgdW5uZWNlc3NhcnkgaG9va3MsIHdoaWxlIGtlZXBpbmcgYWxsIHRoZSBi
ZW5lZml0cyBvZiB0aGUKdGFibGUgbG9va3VwLgoKVGhhbmtzLgoKLS0gClJNSydzIFBhdGNoIHN5
c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQ
IGlzIGhlcmUhIDQwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBs
YXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
