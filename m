Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 183C93DCED7
	for <lists+openrisc@lfdr.de>; Mon,  2 Aug 2021 05:02:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BF962211E4;
	Mon,  2 Aug 2021 05:02:41 +0200 (CEST)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mail.librecores.org (Postfix) with ESMTPS id 1A8862120B
 for <openrisc@lists.librecores.org>; Mon,  2 Aug 2021 04:56:39 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdN1V04FQz9sW5;
 Mon,  2 Aug 2021 12:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627872995;
 bh=lgFF44D+VvUgGNOcyjoWgD9ieIKlVa+1W38G93yYucc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mk/OrQNAgyUtJh9QVu/sq6e2cVKMZEuh5t1elkMY1Gr3oABbY0LNl7+izatEJSZYL
 zGYgU92C+VtRG3i2VpinkrgquF7osc3y3sT0rg1Dkyhhq3uC9pQ9Vyxzu9DIdALkJc
 uVe/31b8NqskHAYnC6qUpRqajmu4XqURQ3LIDSg6AKfjRRV0hOE1uY7cgZepVTdX9e
 8HP4jyVzz75vtA5OgyyRq7pJjgDvTYCj/aQ+sFQ1koQ2SqpBgqVF2xnWntozO8y/pw
 uq0H9be0uwkFpXGGeabu1UoeiTG0mQrIQSbO5Gdvb2ehvStkNDQgftwpI5d9vMxe/C
 vq3iTIN0uJtjQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
Date: Mon, 02 Aug 2021 12:56:13 +1000
Message-ID: <87lf5klfle.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 05:02:40 +0200
Subject: Re: [OpenRISC] [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT
 in Kconfig
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, "H. Peter
 Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-parisc@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Frederic Weisbecker <frederic@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-hexagon@vger.kernel.org, Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JpdGVzOgo+IE1ha2UgYXJj
aGl0ZWN0dXJlcyBzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVCBpbnN0ZWFkIG9mCj4gaGF2
aW5nIG1hbnkgZGVmaW5lcy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFz
YWhpcm95QGtlcm5lbC5vcmc+Cj4gLS0tCj4KPiAgYXJjaC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgfCAzICsrKwo+ICBhcmNoL2FyYy9LY29uZmlnICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBh
cmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICB8IDUgKy0tLS0KPiAgYXJjaC9hcm02NC9LY29u
ZmlnICAgICAgICAgICAgfCA0ICstLS0KPiAgYXJjaC9jc2t5L0tjb25maWcgICAgICAgICAgICAg
fCA0ICstLS0KPiAgYXJjaC9oZXhhZ29uL0tjb25maWcgICAgICAgICAgfCA0ICstLS0KPiAgYXJj
aC9taWNyb2JsYXplL0tjb25maWcgICAgICAgfCAxICsKPiAgYXJjaC9taWNyb2JsYXplL0tjb25m
aWcuZGVidWcgfCA1IC0tLS0tCj4gIGFyY2gvbWlwcy9LY29uZmlnICAgICAgICAgICAgIHwgMSAr
Cj4gIGFyY2gvbWlwcy9LY29uZmlnLmRlYnVnICAgICAgIHwgNCAtLS0tCj4gIGFyY2gvbmRzMzIv
S2NvbmZpZyAgICAgICAgICAgIHwgNCArLS0tCj4gIGFyY2gvbmlvczIvS2NvbmZpZyAgICAgICAg
ICAgIHwgMyAtLS0KPiAgYXJjaC9vcGVucmlzYy9LY29uZmlnICAgICAgICAgfCA0ICstLS0KPiAg
YXJjaC9wYXJpc2MvS2NvbmZpZyAgICAgICAgICAgfCAxICsKPiAgYXJjaC9wYXJpc2MvS2NvbmZp
Zy5kZWJ1ZyAgICAgfCAzIC0tLQo+ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICB8IDUg
Ky0tLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgfCA0ICstLS0KPiAgYXJjaC9z
MzkwL0tjb25maWcgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9zMzkwL0tjb25maWcuZGVidWcg
ICAgICAgfCAzIC0tLQo+ICBhcmNoL3NoL0tjb25maWcgICAgICAgICAgICAgICB8IDEgKwo+ICBh
cmNoL3NoL0tjb25maWcuZGVidWcgICAgICAgICB8IDMgLS0tCj4gIGFyY2gvc3BhcmMvS2NvbmZp
ZyAgICAgICAgICAgIHwgMSArCj4gIGFyY2gvc3BhcmMvS2NvbmZpZy5kZWJ1ZyAgICAgIHwgNCAt
LS0tCj4gIGFyY2gvdW0vS2NvbmZpZyAgICAgICAgICAgICAgIHwgNSArLS0tLQo+ICBhcmNoL3g4
Ni9LY29uZmlnICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3g4Ni9LY29uZmlnLmRlYnVnICAg
ICAgICB8IDMgLS0tCj4gIGFyY2gveHRlbnNhL0tjb25maWcgICAgICAgICAgIHwgNCArLS0tCj4g
IDI3IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQoKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+
IGluZGV4IGQwMWUzNDAxNTgxZC4uNzZhMjg0NTJjMDQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9LY29uZmlnCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKPiBAQCAtOTQsMTAgKzk0
LDYgQEAgY29uZmlnIFNUQUNLVFJBQ0VfU1VQUE9SVAo+ICAJYm9vbAo+ICAJZGVmYXVsdCB5Cj4g
IAo+IC1jb25maWcgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAo+IC0JYm9vbAo+IC0JZGVmYXVsdCB5
Cj4gLQo+ICBjb25maWcgTE9DS0RFUF9TVVBQT1JUCj4gIAlib29sCj4gIAlkZWZhdWx0IHkKPiBA
QCAtMjcxLDYgKzI2Nyw3IEBAIGNvbmZpZyBQUEMKPiAgCXNlbGVjdCBTVFJJQ1RfS0VSTkVMX1JX
WCBpZiBTVFJJQ1RfTU9EVUxFX1JXWAo+ICAJc2VsZWN0IFNZU0NUTF9FWENFUFRJT05fVFJBQ0UK
PiAgCXNlbGVjdCBUSFJFQURfSU5GT19JTl9UQVNLCj4gKwlzZWxlY3QgVFJBQ0VfSVJRRkxBR1Nf
U1VQUE9SVAo+ICAJc2VsZWN0IFZJUlRfVE9fQlVTCQkJaWYgIVBQQzY0Cj4gIAkjCj4gIAkjIFBs
ZWFzZSBrZWVwIHRoaXMgbGlzdCBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkuCgpBY2tlZC1ieTogTWlj
aGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiAocG93ZXJwYykKCmNoZWVycwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
