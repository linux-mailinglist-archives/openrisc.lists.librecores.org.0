Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4482E1D1FF5
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 425FA20AC5;
	Wed, 13 May 2020 22:17:34 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id E976520225
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 13:00:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD751FB;
 Mon, 11 May 2020 04:00:24 -0700 (PDT)
Received: from gaia (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC143F305;
 Mon, 11 May 2020 04:00:20 -0700 (PDT)
Date: Mon, 11 May 2020 12:00:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Message-ID: <20200511110014.GA19176@gaia>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-3-hch@lst.de>
 <20200511075115.GA16134@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511075115.GA16134@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 02/31] arm64: fix the flush_icache_range
 arguments in machine_kexec
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
 Roman Zippel <zippel@linux-m68k.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
 james.morse@arm.com, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDg6NTE6MTVBTSArMDEwMCwgV2lsbCBEZWFjb24gd3Jv
dGU6Cj4gT24gU3VuLCBNYXkgMTAsIDIwMjAgYXQgMDk6NTQ6NDFBTSArMDIwMCwgQ2hyaXN0b3Bo
IEhlbGx3aWcgd3JvdGU6Cj4gPiBUaGUgc2Vjb25kIGFyZ3VtZW50IGlzIHRoZSBlbmQgInBvaW50
ZXIiLCBub3QgdGhlIGxlbmd0aC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5l
X2tleGVjLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWMuYyBiL2FyY2gv
YXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+ID4gaW5kZXggOGU5YzkyNDQyM2I0ZS4uYTBi
MTQ0Y2ZhZWE3MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4
ZWMuYwo+ID4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlYy5jCj4gPiBAQCAt
MTc3LDYgKzE3Nyw3IEBAIHZvaWQgbWFjaGluZV9rZXhlYyhzdHJ1Y3Qga2ltYWdlICpraW1hZ2Up
Cj4gPiAgCSAqIHRoZSBvZmZsaW5lIENQVXMuIFRoZXJlZm9yZSwgd2UgbXVzdCB1c2UgdGhlIF9f
KiB2YXJpYW50IGhlcmUuCj4gPiAgCSAqLwo+ID4gIAlfX2ZsdXNoX2ljYWNoZV9yYW5nZSgodWlu
dHB0cl90KXJlYm9vdF9jb2RlX2J1ZmZlciwKPiA+ICsJCQkgICAgICh1aW50cHRyX3QpcmVib290
X2NvZGVfYnVmZmVyICsKPiA+ICAJCQkgICAgIGFybTY0X3JlbG9jYXRlX25ld19rZXJuZWxfc2l6
ZSk7Cj4gCj4gVXJnaCwgd2VsbCBzcG90dGVkLiBJdCdzIGFubm95aW5nbHkgZGlmZmVyZW50IGZy
b20gX19mbHVzaF9kY2FjaGVfYXJlYSgpLgo+IAo+IEJ1dCBub3cgSSdtIHdvbmRlcmluZyB3aGF0
IHRoaXMgY29kZSBhY3R1YWxseSBkb2VzLi4uIHRoZSBsb29wIGNvbmRpdGlvbgo+IGluIGludmFs
aWRhdGVfaWNhY2hlX2J5X2xpbmUgd29ya3Mgd2l0aCA2NC1iaXQgYXJpdGhtZXRpYywgc28gd2Ug
Y291bGQKPiBzcGVuZCBhIC92ZXJ5LyBsb25nIHRpbWUgaGVyZSBhZmFpY3QuCgpJIHRoaW5rIGl0
IGdvZXMgdGhyb3VnaCB0aGUgbG9vcCBvbmx5IG9uY2UuIFRoZSAnYi5sbycgc2F2ZXMgdXMgaGVy
ZS4KT1RPSCwgdGhlcmUgaXMgbm8gSS1jYWNoZSBtYWludGVuYW5jZSBkb25lLgoKPiBJdCdzIGFs
c28gYSBiaXQgYW5ub3lpbmcgdGhhdCB3ZSBkbyBhIGJ1bmNoIG9mIHJlZHVuZGFudCBELWNhY2hl
Cj4gbWFpbnRlbmFuY2UgdG9vLiBTaG91bGQgd2UgdXNlIGludmFsaWRhdGVfaWNhY2hlX3Jhbmdl
KCkgaGVyZSBpbnN0ZWFkPwoKU2luY2Ugd2UgaGF2ZSB0aGUgX19mbHVzaF9kY2FjaGVfYXJlYSgp
IGFib3ZlIGl0IGZvciBjbGVhbmluZyB0byBQb0MsIHdlCmNvdWxkIHVzZSBpbnZhbGlkYXRlX2lj
YWNoZV9yYW5nZSgpIGhlcmUuIFdlIHByb2JhYmx5IGRpZG4ndCBoYXZlIHRoaXMKZnVuY3Rpb24g
YXQgdGhlIHRpbWUsIGl0IHdhcyBhZGRlZCBmb3IgS1ZNIChjb21taXQgNGZlZTk0NzM2NjAzY2Q2
KS4KCj4gKGFuZCB3aHkgZG9lcyB0aGF0IHRoaW5nIG5lZWQgdG8gdG9nZ2xlIHVhY2Nlc3MpPwoK
aW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2UoKSBkb2Vzbid0IG5lZWQgdG8sIGl0IHdvcmtzIG9uIHRo
ZSBrZXJuZWwgbGluZWFyCm1hcC4KCl9fZmx1c2hfaWNhY2hlX3JhbmdlKCkgZG9lc24ndCBuZWVk
IHRvIGVpdGhlciwgdGhhdCdzIGEgc2lkZS1lZmZlY3Qgb2YKdGhlIGZhbGwtdGhyb3VnaCBpbXBs
ZW1lbnRhdGlvbi4KCkFueXdheSwgSSB0aGluayBDaHJpc3RvcGgncyBwYXRjaCBuZWVkcyB0byBn
byBpbiB3aXRoIGEgZml4ZXMgdGFnOgoKRml4ZXM6IGQyOGY2ZGYxMzA1YSAoImFybTY0L2tleGVj
OiBBZGQgY29yZSBrZXhlYyBzdXBwb3J0IikKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAj
IDQuOC54LQoKYW5kIHdlJ2xsIGNoYW5nZSB0aGVzZSBmdW5jdGlvbnMvaGVscGVycyBnb2luZyBm
b3J3YXJkIGZvciBhcm02NC4KCkhhcHB5IHRvIHBpY2sgdGhpcyB1cCB2aWEgdGhlIGFybTY0IGZv
ci1uZXh0L2ZpeGVzIGJyYW5jaC4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
