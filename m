Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7952E292C
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 29CB4200E4;
	Fri, 25 Dec 2020 00:15:26 +0100 (CET)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mail.librecores.org (Postfix) with ESMTPS id 149E620C94
 for <openrisc@lists.librecores.org>; Thu,  3 Dec 2020 23:36:48 +0100 (CET)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A638F2204;
 Thu,  3 Dec 2020 22:36:43 +0000 (UTC)
Date: Thu, 3 Dec 2020 15:36:42 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20201203153642.594afd85@lwn.net>
In-Reply-To: <cover.1606748711.git.mchehab+huawei@kernel.org>
References: <cover.1606748711.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH 0/6] Add documentation for
 Documentation/features at the built docs
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
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCAzMCBOb3YgMjAyMCAxNjozNjoyOSArMDEwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBUaGlzIHNlcmllcyBnb3QgYWxy
ZWFkeSBzdWJtaXR0ZWQgbGFzdCB5ZWFyOgo+IAo+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvY292ZXIuMTU2MTIyMjc4NC5naXQubWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmcvCj4g
Cj4gWWV0LCBvbiB0aGF0IHRpbWUsIHRoZXJlIHdlcmUgdG9vIG1hbnkgb3RoZXIgcGF0Y2hlcyBy
ZWxhdGVkIHRvIFJlU1QKPiBjb252ZXJzaW9uIGZsb2F0aW5nIGFyb3VuZC4gU28sIGF0IHRoZSBl
bmQsIEkgZ3Vlc3MgdGhpcyBvbmUgZ290IG1pc3NlZC4KPiAKPiBTbywgSSBkaWQgYSByZWJhc2Ug
b24gdGhlIHRvcCBvZiB1cHN0cmVhbSwgYW5kIGFkZGVkIGEgZmV3IG5ldyBjaGFuZ2VzLgoKT0ss
IEkndmUgZ29uZSBhaGVhZCBhbmQgYXBwbGllZCB0aGVzZTsgaXQgZ2FpbnMgbWUgYSBuZXcgdHJp
dmlhbCBjb25mbGljdAp3aXRoIHg4NiwgYnV0IHNvIGJlIGl0Li4uCgpUaGF0IHNhaWQsIEkgdGhp
bmsgdGhhdCB0aGUgUlNUIHRhYmxlIGZvcm1hdHRpbmcgY291bGQgYmUgKndheSogaW1wcm92ZWQu
ClRoZSBjdXJyZW50IHRhYmxlcyBhcmUgYWxsIHdoaXRlIHNwYWNlIGFuZCBoYXJkIHRvIG1ha2Ug
c2Vuc2Ugb2YuICBXaGF0IGlmCndlIGNvbmRlbnNlZCB0aGUgaW5mb3JtYXRpb24/ICBKdXN0IGxv
b2tpbmcgYXQgdGhlIGZpcnN0IGVudHJ5IGluCkRvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZmVh
dHVyZXMuaHRtbCwgcGVyaGFwcyBpdCBjb3VsZCBsb29rIGxpa2U6CgogICAgRkVBVFVSRQlLQ09O
RklHL0RFU0NSSVBUSU9OCQlTVEFUVVMKCiAgICBjQlBGLUpJVAlIQVZFX0NCUEZfSklUCQkJVE9E
TzogYWxwaGEsIGFyYywgYXJtLi4uCiAgICAJCQkJCQlvazogbWlwcywgcG93ZXJwYywgLi4uCgkJ
YXJjaCBzdXBwb3J0cyBjQlBGIEpJVAoJCW9wdGltaXphdGlvbnMKClRoZSByZXN1bHQgd291bGQg
YmUgZmFyIG1vcmUgY29tcGFjdCBhbmQgZWFzeSB0byByZWFkLCBJTU8uICBJIG1heSBnZXQKYXJv
dW5kIHRvIGdpdmluZyB0aGlzIGEgdHJ5IGlmIChoaW50IDopIG5vYm9keSBlbHNlIGdldHMgdGhl
cmUgZmlyc3QuCgpUaGFua3MsCgpqb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
