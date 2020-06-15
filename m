Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1901FECBD
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A648F20AF8;
	Thu, 18 Jun 2020 09:47:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 28A7C208C2
 for <openrisc@lists.librecores.org>; Mon, 15 Jun 2020 09:17:54 +0200 (CEST)
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFCCF206D7;
 Mon, 15 Jun 2020 07:17:31 +0000 (UTC)
To: Mike Rapoport <rppt@kernel.org>
References: <20200412194859.12663-5-rppt@kernel.org>
 <f53e68db-ed81-6ef6-5087-c7246d010ea2@linux-m68k.org>
 <20200615062234.GA7882@kernel.org>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <24563231-ed19-6f4f-617e-4d6bfc7553e4@linux-m68k.org>
Date: Mon, 15 Jun 2020 17:17:28 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615062234.GA7882@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] [PATCH 04/21] mm: free_area_init: use maximal zone
 PFNs rather than zone sizes
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 catalin.marinas@arm.com, heiko.carstens@de.ibm.com, x86@kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 jcmvbkbc@gmail.com, guoren@kernel.org, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, bcain@codeaurora.org, corbet@lwn.net,
 mpe@ellerman.id.au, linux-hexagon@vger.kernel.org, deller@gmx.de,
 linux-sh@vger.kernel.org, linux@armlinux.org.uk, ley.foon.tan@intel.com,
 rppt@linux.ibm.com, ysato@users.sourceforge.jp,
 linux-arm-kernel@lists.infradead.org, msalter@redhat.com, mattst88@gmail.com,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, nickhu@andestech.com,
 linux-um@lists.infradead.org, richard@nod.at, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, paul.walmsley@sifive.com,
 mhocko@kernel.org, gxt@pku.edu.cn, Hoan@os.amperecomputing.com,
 monstr@monstr.eu, tony.luck@intel.com, bhe@redhat.com,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, vgupta@synopsys.com,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, tsbogend@alpha.franken.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTWlrZSwKCk9uIDE1LzYvMjAgNDoyMiBwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBPbiBN
b24sIEp1biAxNSwgMjAyMCBhdCAwMTo1Mzo0MlBNICsxMDAwLCBHcmVnIFVuZ2VyZXIgd3JvdGU6
Cj4+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPj4+IEN1cnJlbnRs
eSwgYXJjaGl0ZWN0dXJlcyB0aGF0IHVzZSBmcmVlX2FyZWFfaW5pdCgpIHRvIGluaXRpYWxpemUg
bWVtb3J5IG1hcAo+Pj4gYW5kIG5vZGUgYW5kIHpvbmUgc3RydWN0dXJlcyBuZWVkIHRvIGNhbGN1
bGF0ZSB6b25lIGFuZCBob2xlIHNpemVzLiBXZSBjYW4KPj4+IHVzZSBmcmVlX2FyZWFfaW5pdF9u
b2RlcygpIGluc3RlYWQgYW5kIGxldCBpdCBkZXRlY3QgdGhlIHpvbmUgYm91bmRhcmllcwo+Pj4g
d2hpbGUgdGhlIGFyY2hpdGVjdHVyZXMgd2lsbCBvbmx5IGhhdmUgdG8gc3VwcGx5IHRoZSBwb3Nz
aWJsZSBsaW1pdHMgZm9yCj4+PiB0aGUgem9uZXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWlr
ZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pgo+PiBUaGlzIGlzIGNhdXNpbmcgc29t
ZSBuZXcgd2FybmluZ3MgZm9yIG1lIG9uIGJvb3Qgb24gYXQgbGVhc3Qgb25lIG5vbi1NTVUgbTY4
ayB0YXJnZXQ6Cj4gCj4gVGhlcmUgd2VyZSBhIGNvdXBsZSBvZiBjaGFuZ2VzIHRoYXQgY2F1c2Ug
dGhpcy4gVGhlIGZyZWVfYXJlYV9pbml0KCkKPiBub3cgcmVsaWVzIG9uIG1lbWJsb2NrIGRhdGEg
YW5kIGFyY2hpdGVjdHVyYWwgbGltaXRzIGZvciB6b25lIHNpemVzCj4gcmF0aGVyIHRoYW4gb24g
ZXhwbGlzaXQgcGZucyBjYWxjdWxhdGVkIGJ5IHRoZSBhcmNoIGNvZGUuIEkndmUgdXBkYXRlCj4g
bW90b3JvbGEgdmFyaWFudCBhbmQgbWlzc2VkIGNvbGRmaXJlLiBBbmdlbG8gc2VudCBhIGZpeCBm
b3IgbWNmbW11LmMKPiBbMV0gYW5kIEkndmUgdXBkYXRlZCBpdCB0byBpbmNsdWRlIG5vbW11IGFz
IHdlbGwKPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbTY4ay8yMDIwMDYx
NDIyNTExOS43Nzc3MDItMS1hbmdlbG8uZHVyZWdoZWxsb0B0aW1lc3lzLmNvbQo+IAo+PkZyb20g
NTViODUyM2RmMmE1YzQ1NjViMTMyYzA2OTE5OTBmMDgyMTA0MGZlYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiBGcm9tOiBBbmdlbG8gRHVyZWdoZWxsbyA8YW5nZWxvLmR1cmVnaGVsbG9AdGlt
ZXN5cy5jb20+Cj4gRGF0ZTogTW9uLCAxNSBKdW4gMjAyMCAwMDo1MToxOSArMDIwMAo+IFN1Ympl
Y3Q6IFtQQVRDSF0gbTY4azogZml4IHJlZ2lzdHJhdGlvbiBvZiBtZW1vcnkgcmVnaW9ucyB3aXRo
IG1lbWJsb2NrCj4gCj4gQ29tbWl0IDNmMDhhMzAyZjUzMyAoIm1tOiByZW1vdmUgQ09ORklHX0hB
VkVfTUVNQkxPQ0tfTk9ERV9NQVAgb3B0aW9uIikKPiBpbnRyb2R1Y2VkIGFzc3VtcHRpb24gdGhh
dCBVTUEgc3lzdGVtcyBoYXZlIHRoZWlyIG1lbW9yeSBhdCBub2RlIDAgYW5kCj4gdXBkYXRlZCBt
b3N0IG9mIHRoZW0sIGJ1dCBpdCBmb3Jnb3Qgbm9tbXUgYW5kIGNvbGRmaXJlIHZhcmlhbnRzIG9m
IG02OGsuCj4gCj4gVGhlIGxhdGVyIGNoYW5nZSBpbiBmcmVlIGFyZWEgaW5pdGlhbGl6YXRpb24g
aW4gY29tbWl0IGZhMzM1NGU0ZWEzOSAoIm1tOgo+IGZyZWVfYXJlYV9pbml0OiB1c2UgbWF4aW1h
bCB6b25lIFBGTnMgcmF0aGVyIHRoYW4gem9uZSBzaXplcyIpIGV4cG9zZWQgdGhhdAo+IGFuZCBj
YXVzZWQgYSBsb3Qgb2YgIkJVRzogQmFkIHBhZ2Ugc3RhdGUgaW4gcHJvY2VzcyBzd2FwcGVyIiBy
ZXBvcnRzLgoKRXZlbiB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCBJIGFtIHN0aWxsIHNlZWluZyB0
aGUgc2FtZSBtZXNzYWdlcy4KClJlZ2FyZHMKR3JlZwoKCgo+IFVzaW5nIG1lbWJsb2NrX2FkZF9u
b2RlKCkgd2l0aCBuaWQgPSAwIHRvIHJlZ2lzdGVyIG1lbW9yeSBiYW5rcyBzb2x2ZXMgdGhlCj4g
cHJvYmxlbS4KPiAKPiBGaXhlczogM2YwOGEzMDJmNTMzICgibW06IHJlbW92ZSBDT05GSUdfSEFW
RV9NRU1CTE9DS19OT0RFX01BUCBvcHRpb24iKQo+IEZpeGVzOiBmYTMzNTRlNGVhMzkgKCJtbTog
ZnJlZV9hcmVhX2luaXQ6IHVzZSBtYXhpbWFsIHpvbmUgUEZOcyByYXRoZXIgdGhhbiB6b25lIHNp
emVzIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gRHVyZWdoZWxsbyA8YW5nZWxvLmR1cmVnaGVs
bG9AdGltZXN5cy5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgo+IC0tLQo+ICAgYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jIHwgMiArLQo+ICAg
YXJjaC9tNjhrL21tL21jZm1tdS5jICAgICAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvbTY4
ay9rZXJuZWwvc2V0dXBfbm8uYyBiL2FyY2gvbTY4ay9rZXJuZWwvc2V0dXBfbm8uYwo+IGluZGV4
IGU3NzliMTllMDE5My4uMGM0NTg5YTM5YmE5IDEwMDY0NAo+IC0tLSBhL2FyY2gvbTY4ay9rZXJu
ZWwvc2V0dXBfbm8uYwo+ICsrKyBiL2FyY2gvbTY4ay9rZXJuZWwvc2V0dXBfbm8uYwo+IEBAIC0x
MzgsNyArMTM4LDcgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQo+
ICAgCXByX2RlYnVnKCJNRU1PUlkgLT4gUk9NRlM9MHglcC0weCUwNmx4IE1FTT0weCUwNmx4LTB4
JTA2bHhcbiAiLAo+ICAgCQkgX19ic3Nfc3RvcCwgbWVtb3J5X3N0YXJ0LCBtZW1vcnlfc3RhcnQs
IG1lbW9yeV9lbmQpOwo+ICAgCj4gLQltZW1ibG9ja19hZGQobWVtb3J5X3N0YXJ0LCBtZW1vcnlf
ZW5kIC0gbWVtb3J5X3N0YXJ0KTsKPiArCW1lbWJsb2NrX2FkZF9ub2RlKG1lbW9yeV9zdGFydCwg
bWVtb3J5X2VuZCAtIG1lbW9yeV9zdGFydCwgMCk7Cj4gICAKPiAgIAkvKiBLZWVwIGEgY29weSBv
ZiBjb21tYW5kIGxpbmUgKi8KPiAgIAkqY21kbGluZV9wID0gJmNvbW1hbmRfbGluZVswXTsKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9tNjhrL21tL21jZm1tdS5jIGIvYXJjaC9tNjhrL21tL21jZm1tdS5j
Cj4gaW5kZXggMjlmNDc5MjNhYTQ2Li43ZDA0MjEwZDM0ZjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9t
NjhrL21tL21jZm1tdS5jCj4gKysrIGIvYXJjaC9tNjhrL21tL21jZm1tdS5jCj4gQEAgLTE3NCw3
ICsxNzQsNyBAQCB2b2lkIF9faW5pdCBjZl9ib290bWVtX2FsbG9jKHZvaWQpCj4gICAJbTY4a19t
ZW1vcnlbMF0uYWRkciA9IF9yYW1iYXNlOwo+ICAgCW02OGtfbWVtb3J5WzBdLnNpemUgPSBfcmFt
ZW5kIC0gX3JhbWJhc2U7Cj4gICAKPiAtCW1lbWJsb2NrX2FkZChtNjhrX21lbW9yeVswXS5hZGRy
LCBtNjhrX21lbW9yeVswXS5zaXplKTsKPiArCW1lbWJsb2NrX2FkZF9ub2RlKG02OGtfbWVtb3J5
WzBdLmFkZHIsIG02OGtfbWVtb3J5WzBdLnNpemUsIDApOwo+ICAgCj4gICAJLyogY29tcHV0ZSB0
b3RhbCBwYWdlcyBpbiBzeXN0ZW0gKi8KPiAgIAludW1fcGFnZXMgPSBQRk5fRE9XTihfcmFtZW5k
IC0gX3JhbWJhc2UpOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
