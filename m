Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 92FF2424913
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 23:39:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3FF4D21123;
	Wed,  6 Oct 2021 23:39:18 +0200 (CEST)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTP id 9606020A41
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 23:39:16 +0200 (CEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 196LRU0O007032;
 Wed, 6 Oct 2021 16:27:30 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 196LRS4V007029;
 Wed, 6 Oct 2021 16:27:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 6 Oct 2021 16:27:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20211006212728.GM10333@gate.crashing.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV4KkAC2p9D4yCnH@antec>
User-Agent: Mutt/1.4.2.3i
Subject: Re: [OpenRISC] [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, James Morse <james.morse@arm.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Yoshinori Sato <ysato@users.osdn.me>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBPY3QgMDcsIDIwMjEgYXQgMDU6NDQ6MDBBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gWW91IGhhdmUgZGVmaW5lZCBvZl9nZXRfY3B1X2h3aWQgdG8gcmV0dXJuIHU2NCwg
d2lsbCB0aGlzIGNyZWF0ZSBjb21waWxlcgo+IHdhcm5pbmdzIHdoZW4gc2luY2Ugd2UgYXJlIHN0
b3JpbmcgYSB1NjQgaW50byBhIHUzMj8KPiAKPiBJdCBzZWVtcyBvbmx5IGlmIHdlIG1ha2Ugd2l0
aCBXPTMuCgpZZXMuICBUaGlzIGlzIGRvbmUgYnkgLVdjb252ZXJzaW9uLCAiV2FybiBmb3IgaW1w
bGljaXQgY29udmVyc2lvbnMgdGhhdAptYXkgYWx0ZXIgYSB2YWx1ZS4iCgo+IEkgdGhvdWdodCB3
ZSB1c3VhbGx5IHdhcm5lZCBvbiB0aGlzLgoKVGhpcyB3YXJuaW5nIGlzIG5vdCBpbiAtV2FsbCBv
ciAtV2V4dHJhIGVpdGhlciwgaXQgc3VmZmVycyB0b28gbXVjaCBmcm9tCmZhbHNlIHBvc2l0aXZl
cy4gIEl0IGlzIHZlcnkgbmF0dXJhbCB0byBqdXN0IGlnbm9yZSB0aGUgaGlnaCBiaXRzIG9mCm1v
ZHVsbyB0eXBlcyAod2hpY2ggaXMgd2hhdCAidW5zaWduZWQiIHR5cGVzICphcmUqKS4gIE9yIHRo
ZSBiaXRzIHRoYXQKImZhbGwgb2ZmIiBvbiBhIGNvbnZlcnNpb24uICBUaGUgQyBzdGFuZGFyZCBt
YWtlcyB0aGlzIHJlcXVpcmVkCmJlaGF2aW91ciwgaXQgaXMgdXNlZnVsLCBhbmQgaXQgaXMgdGhl
IG9ubHkgY29udmVuaWVudCB3YXkgb2YgZ2V0dGluZwp0aGlzIQoKClNlZ2hlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
