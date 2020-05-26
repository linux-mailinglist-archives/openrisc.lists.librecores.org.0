Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8DF1E5025
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 44EBC20C55;
	Wed, 27 May 2020 23:19:16 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 2A42D20C2B
 for <openrisc@lists.librecores.org>; Tue, 26 May 2020 19:13:47 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9101C55D;
 Tue, 26 May 2020 10:13:45 -0700 (PDT)
Received: from gaia (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C3C03F52E;
 Tue, 26 May 2020 10:13:36 -0700 (PDT)
Date: Tue, 26 May 2020 18:13:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200526171334.GK17051@gaia>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429121126.17989-6-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH v2 05/20] mm: use free_area_init() instead of
 free_area_init_nodes()
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

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MTE6MTFQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9pbml0LmMgYi9hcmNoL2FybTY0L21t
L2luaXQuYwo+IGluZGV4IGU0MjcyN2UzNTY4ZS4uYTY1MGFkYjM1OGVlIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtNjQvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKPiBAQCAt
MjA2LDcgKzIwNiw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCB6b25lX3NpemVzX2luaXQodW5zaWdu
ZWQgbG9uZyBtaW4sIHVuc2lnbmVkIGxvbmcgbWF4KQo+ICAjZW5kaWYKPiAgCW1heF96b25lX3Bm
bnNbWk9ORV9OT1JNQUxdID0gbWF4Owo+ICAKPiAtCWZyZWVfYXJlYV9pbml0X25vZGVzKG1heF96
b25lX3BmbnMpOwo+ICsJZnJlZV9hcmVhX2luaXQobWF4X3pvbmVfcGZucyk7Cj4gIH0KCkFja2Vk
LWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
