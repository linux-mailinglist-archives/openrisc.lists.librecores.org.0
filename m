Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B4FB51E5024
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6743320CA4;
	Wed, 27 May 2020 23:19:15 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id C3D9B20C28
 for <openrisc@lists.librecores.org>; Tue, 26 May 2020 19:12:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5431FB;
 Tue, 26 May 2020 10:12:09 -0700 (PDT)
Received: from gaia (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05C163F52E;
 Tue, 26 May 2020 10:12:01 -0700 (PDT)
Date: Tue, 26 May 2020 18:11:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200526171159.GJ17051@gaia>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429121126.17989-4-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH v2 03/20] mm: remove
 CONFIG_HAVE_MEMBLOCK_NODE_MAP option
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
 linux-doc@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MTE6MDlQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhl
IENPTkZJR19IQVZFX01FTUJMT0NLX05PREVfTUFQIGlzIHVzZWQgdG8gZGlmZmVyZW50aWF0ZSBp
bml0aWFsaXphdGlvbgo+IG9mIG5vZGVzIGFuZCB6b25lcyBzdHJ1Y3R1cmVzIGJldHdlZW4gdGhl
IHN5c3RlbXMgdGhhdCBoYXZlIHJlZ2lvbiB0byBub2RlCj4gbWFwcGluZyBpbiBtZW1ibG9jayBh
bmQgdGhvc2UgdGhhdCBkb24ndC4KPiAKPiBDdXJyZW50bHkgYWxsIHRoZSBOVU1BIGFyY2hpdGVj
dHVyZXMgZW5hYmxlIHRoaXMgb3B0aW9uIGFuZCBmb3IgdGhlCj4gbm9uLU5VTUEgc3lzdGVtcyB3
ZSBjYW4gcHJlc3VtZSB0aGF0IGFsbCB0aGUgbWVtb3J5IGJlbG9uZ3MgdG8gbm9kZSAwIGFuZAo+
IHRoZXJlZm9yZSB0aGUgY29tcGlsZSB0aW1lIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGlzIG5vdCBy
ZXF1aXJlZC4KPiAKPiBUaGUgcmVtYWluaW5nIGZldyBhcmNoaXRlY3R1cmVzIHRoYXQgdXNlIERJ
U0NPTlRJR01FTSB3aXRob3V0IE5VTUEgYXJlCj4gZWFzaWx5IHVwZGF0ZWQgdG8gdXNlIG1lbWJs
b2NrX2FkZF9ub2RlKCkgaW5zdGVhZCBvZiBtZW1ibG9ja19hZGQoKSBhbmQKPiB0aHVzIGhhdmUg
cHJvcGVyIGNvcnJlc3BvbmRlbmNlIG9mIG1lbWJsb2NrIHJlZ2lvbnMgdG8gTlVNQSBub2Rlcy4K
PiAKPiBTdGlsbCwgZnJlZV9hcmVhX2luaXRfbm9kZSgpIG11c3QgaGF2ZSBhIGJhY2t3YXJkIGNv
bXBhdGlibGUgdmVyc2lvbgo+IGJlY2F1c2UgaXRzIHNlbWFudGljcyB3aXRoIGFuZCB3aXRob3V0
IENPTkZJR19IQVZFX01FTUJMT0NLX05PREVfTUFQIGlzCj4gZGlmZmVyZW50LiBPbmNlIGFsbCB0
aGUgYXJjaGl0ZWN0dXJlcyB3aWxsIHVzZSB0aGUgbmV3IHNlbWFudGljcywgdGhlCj4gZW50aXJl
IGNvbXBhdGliaWxpdHkgbGF5ZXIgY2FuIGJlIGRyb3BwZWQuCj4gCj4gVG8gYXZvaWQgYWRkaXRp
b24gb2YgZXh0cmEgcnVuIHRpbWUgbWVtb3J5IHRvIHN0b3JlIG5vZGUgaWQgZm9yCj4gYXJjaGl0
ZWN0dXJlcyB0aGF0IGtlZXAgbWVtYmxvY2sgYnV0IGhhdmUgb25seSBhIHNpbmdsZSBub2RlLCB0
aGUgbm9kZSBpZAo+IGZpZWxkIG9mIHRoZSBtZW1ibG9ja19yZWdpb24gaXMgZ3VhcmRlZCBieSBD
T05GSUdfTkVFRF9NVUxUSVBMRV9OT0RFUyBhbmQKPiB0aGUgY29ycmVzcG9uZGluZyBhY2Nlc3Nv
cnMgcHJlc3VtZSB0aGF0IGluIHRob3NlIGNhc2VzIGl0IGlzIGFsd2F5cyAwLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiAtLS0KPiAgLi4u
L3ZtL251bWEtbWVtYmxvY2svYXJjaC1zdXBwb3J0LnR4dCAgICAgICAgIHwgIDM0IC0tLS0tLQo+
ICBhcmNoL2FscGhhL21tL251bWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0K
PiAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0K
CkZvciBhcm02NDoKCkFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bh
cm0uY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
