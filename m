Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 519772F469F
	for <lists+openrisc@lfdr.de>; Wed, 13 Jan 2021 09:39:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DDC1720E5C;
	Wed, 13 Jan 2021 09:39:04 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id AB3FF208C2
 for <openrisc@lists.librecores.org>; Tue, 12 Jan 2021 15:05:12 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A42AE22CE3;
 Tue, 12 Jan 2021 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610460310;
 bh=YIZSFd4ngdBu3d+V+tCrhUDlUF7epBaWbFsCZCkzGJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+ljzYYL3QMPhhApX5VwhFNyceVrA27EHM0FStNvwzUR1cQ7GFOIPOcEYTO0fdDaA
 Kj7O7lmy0yWuWK+AZisJL2LrmlkoM/j63MxdM7S787vyvaT4LD71jTgKDStmGrzxuQ
 L0/NqqEzqp6wU8ndgl0gsmTuxMJL2Vz98cUyPebone1iHGoyH3HLXEv/yY8kVzE9/C
 3JxXpkug6tFhHh2/KJ9Ii5coAgelm+gr542ObqppAE3GEOphOgXDNiAJFxaofg4s3u
 N68pjfATVrUXDVMPlwIcydiug5iK5JLd2AIK2alwIqlmLf7Si7Qy4TLd2kqk9nbCgG
 c2IYKYoLXP3bw==
Date: Tue, 12 Jan 2021 14:05:00 +0000
From: Will Deacon <will@kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <20210112140459.GC9277@willie-the-truck>
References: <20201227140129.19932-1-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201227140129.19932-1-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 Jan 2021 09:39:03 +0100
Subject: Re: [OpenRISC] [PATCH v2] arch: consolidate pm_power_off callback
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 benh@kernel.crashing.org, linux-mips@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, paulus@samba.org,
 linux-csky@vger.kernel.org, hpa@zytor.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, jonas@southpole.se, linux-s390@vger.kernel.org,
 sstabellini@kernel.org, linux-c6x-dev@linux-c6x.org,
 ysato@users.sourceforge.jp, linux-hexagon@vger.kernel.org, deller@gmx.de,
 x86@kernel.org, ley.foon.tan@intel.com, mingo@redhat.com,
 catalin.marinas@arm.com, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-pm@vger.kernel.org, msalter@redhat.com,
 jacquiot.aurelien@gmail.com, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, bp@alien8.de, christian@brauner.io,
 chris@zankel.net, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBEZWMgMjcsIDIwMjAgYXQgMDM6MDE6MjhQTSArMDEwMCwgRW5yaWNvIFdlaWdlbHQs
IG1ldHV4IElUIGNvbnN1bHQgd3JvdGU6Cj4gTW92ZSB0aGUgcG1fcG93ZXJfb2ZmIGNhbGxiYWNr
IGludG8gb25lIGdsb2JhbCBwbGFjZSBhbmQgYWxzbyBhZGQgYW4KPiBmdW5jdGlvbiBmb3IgY29u
ZGl0aW9uYWxseSBjYWxsaW5nIGl0ICh3aGVuIG5vdCBOVUxMKSwgaW4gb3JkZXIgdG8gcmVtb3Zl
Cj4gY29kZSBkdXBsaWNhdGlvbiBpbiBhbGwgaW5kaXZpZHVhbCBhcmNocy4KPiAKPiBSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
RW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQgPGluZm9AbWV0dXgubmV0PgoKWy4uLl0K
Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9yZWJvb3QuYyBiL2tlcm5lbC9yZWJvb3QuYwo+IGluZGV4
IGViMWIxNTg1MDc2MS4uZWM0Y2Q2NmRkMWFlIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9yZWJvb3Qu
Ywo+ICsrKyBiL2tlcm5lbC9yZWJvb3QuYwo+IEBAIC01Myw2ICs1MywxNiBAQCBpbnQgcmVib290
X2ZvcmNlOwo+ICB2b2lkICgqcG1fcG93ZXJfb2ZmX3ByZXBhcmUpKHZvaWQpOwo+ICBFWFBPUlRf
U1lNQk9MX0dQTChwbV9wb3dlcl9vZmZfcHJlcGFyZSk7Cj4gIAo+ICt2b2lkICgqcG1fcG93ZXJf
b2ZmKSh2b2lkKTsKPiArRVhQT1JUX1NZTUJPTF9HUEwocG1fcG93ZXJfb2ZmKTsKPiArCj4gK3Zv
aWQgZG9fcG93ZXJfb2ZmKHZvaWQpCj4gK3sKPiArCWlmIChwbV9wb3dlcl9vZmYpCj4gKwkJcG1f
cG93ZXJfb2ZmKCk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZG9fcG93ZXJfb2ZmKTsKCkNv
dWxkIHRoaXMganVzdCBsaXZlIGFzIGEgc3RhdGljIGlubGluZSBpbiBwbS5oIHRvIGF2b2lkIGhh
dmluZyB0byBleHBvcnQKdGhlIGV4dHJhIHN5bWJvbD8KCldpbGwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
