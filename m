Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EC0BD43CC2A
	for <lists+openrisc@lfdr.de>; Wed, 27 Oct 2021 16:27:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 963B224226;
	Wed, 27 Oct 2021 16:27:03 +0200 (CEST)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 by mail.librecores.org (Postfix) with ESMTPS id 2896220E4D
 for <openrisc@lists.librecores.org>; Wed, 27 Oct 2021 16:27:00 +0200 (CEST)
Date: Wed, 27 Oct 2021 10:26:54 -0400
From: Rich Felker <dalias@libc.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20211027142651.GW7074@brightrain.aerifal.cx>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-10-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-10-robh@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [OpenRISC] [PATCH 09/12] sh: Use of_get_cpu_hwid()
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMDYsIDIwMjEgYXQgMTE6NDM6MjlBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gUmVwbGFjZSBvcGVuIGNvZGVkIHBhcnNpbmcgb2YgQ1BVIG5vZGVzJyAncmVnJyBwcm9w
ZXJ0eSB3aXRoCj4gb2ZfZ2V0X2NwdV9od2lkKCkuCj4gCj4gQ2M6IFlvc2hpbm9yaSBTYXRvIDx5
c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4KPiBDYzogUmljaCBGZWxrZXIgPGRhbGlhc0BsaWJj
Lm9yZz4KPiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9zaC9ib2FyZHMvb2YtZ2Vu
ZXJpYy5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3NoL2JvYXJkcy9vZi1nZW5lcmljLmMg
Yi9hcmNoL3NoL2JvYXJkcy9vZi1nZW5lcmljLmMKPiBpbmRleCA5MjFkNzZmYzMzNTguLmY3ZjNl
NjE4ZTg1YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3NoL2JvYXJkcy9vZi1nZW5lcmljLmMKPiArKysg
Yi9hcmNoL3NoL2JvYXJkcy9vZi1nZW5lcmljLmMKPiBAQCAtNjIsOSArNjIsOCBAQCBzdGF0aWMg
dm9pZCBzaF9vZl9zbXBfcHJvYmUodm9pZCkKPiAgCWluaXRfY3B1X3Bvc3NpYmxlKGNwdW1hc2tf
b2YoMCkpOwo+ICAKPiAgCWZvcl9lYWNoX29mX2NwdV9ub2RlKG5wKSB7Cj4gLQkJY29uc3QgX19i
ZTMyICpjZWxsID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAicmVnIiwgTlVMTCk7Cj4gLQkJdTY0IGlk
ID0gLTE7Cj4gLQkJaWYgKGNlbGwpIGlkID0gb2ZfcmVhZF9udW1iZXIoY2VsbCwgb2Zfbl9hZGRy
X2NlbGxzKG5wKSk7Cj4gKwkJdTY0IGlkID0gb2ZfZ2V0X2NwdV9od2lkKG5wLCAwKTsKPiArCj4g
IAkJaWYgKGlkIDwgTlJfQ1BVUykgewo+ICAJCQlpZiAoIW1ldGhvZCkKPiAgCQkJCW9mX3Byb3Bl
cnR5X3JlYWRfc3RyaW5nKG5wLCAiZW5hYmxlLW1ldGhvZCIsICZtZXRob2QpOwo+IC0tIAo+IDIu
MzAuMgoKQWNrZWQtYnk6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
