Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 31191355DA7
	for <lists+openrisc@lfdr.de>; Tue,  6 Apr 2021 23:08:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 14D6521306;
	Tue,  6 Apr 2021 23:08:38 +0200 (CEST)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mail.librecores.org (Postfix) with ESMTPS id 9810221085
 for <openrisc@lists.librecores.org>; Tue,  6 Apr 2021 19:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1449; q=dns/txt; s=iport;
 t=1617730721; x=1618940321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wHC75exw7z/XvWxaqurh75hAcW+P/hc1Ce2AN8KLAVE=;
 b=G8CemyZRO1sUomjCmS+YE/C6uWze7voF3/OnkJPzCjlApsHtQw/NACu6
 IbzaOOj9YEiobtqOgYiAKbgbugARDCXIRPa+ZrNQSpdtmv1Zjt672WTLx
 0k1ILORDVGZtFP7Z+NpOxvDGSwgPkZcfBivMfAolYWZryTkHbcjWyFPfw w=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ad70PFKyAZuY1VAyfgTLAKrPwkb1zdoIgy1?=
 =?us-ascii?q?knxilNYDZeG/b2q+mFmvMH2RjozBsQQmgng9CcOK+GKEmskKJdy48XILukQU?=
 =?us-ascii?q?3aqHKlRbsSj7fK7jX8F0TFnNJ1+rxnd8FFZeHYLV8/tsri5Rn9LtBI+qjizI?=
 =?us-ascii?q?mNpcPzi0hgVhtrbaYI1XYbNi++HldtTAdLQboVfaD82uN9qzCteWsaY62Abx?=
 =?us-ascii?q?FvY8H5q9LGj57gaxIdbiRG1CC1kTiq5LTmeiL34j4iVVp0rYsKwCzijxHz4L?=
 =?us-ascii?q?mlvrWdzBLRvlWjiah+qZ/G1sZJAtCKh4wuDgjUziysZIhnRtS5zVcInN0=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AGAAAsnGxg/4YNJK1aGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE+BQEBAQELAYIqgU0BOY0XiTGQDYpcgXw?=
 =?us-ascii?q?LAQEBDQEBNAQBAYRQAoF2AiU0CQ4CAwEBDAEBBQEBAQIBBgRxE4VdhkUBBTo?=
 =?us-ascii?q?6BRALGC48GwaGDKtXdYE0gQGIH4FEIoEXAY1MJxyBSUKBE4MiPoo5BIJHghe?=
 =?us-ascii?q?gOZwpgxWBJptHMhCkYS24EQIEBgUCFoFUOoFZMxoIGxWDJU8ZDo4rFo5HIQN?=
 =?us-ascii?q?nAgYKAQEDCYw0XQEB?=
X-IronPort-AV: E=Sophos;i="5.82,201,1613433600"; d="scan'208";a="611888528"
Received: from alln-core-12.cisco.com ([173.36.13.134])
 by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 06 Apr 2021 17:38:39 +0000
Received: from zorba ([10.24.14.212])
 by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 136HcajD016593
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 17:38:37 GMT
Date: Tue, 6 Apr 2021 10:38:36 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20210406173836.GW2469518@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-12.cisco.com
X-Mailman-Approved-At: Tue, 06 Apr 2021 23:08:34 +0200
Subject: Re: [OpenRISC] [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org,
 akpm@linux-foundation.org, will@kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBcHIgMDIsIDIwMjEgYXQgMDM6MTg6MjFQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAtY29uZmlnIENNRExJTkVfQk9PTAo+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVs
IGNvbW1hbmQgbGluZSIKPiAtCWhlbHAKPiAtCSAgRm9yIG1vc3Qgc3lzdGVtcywgaXQgaXMgZmly
bXdhcmUgb3Igc2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIgdGhhdAo+IC0JICBieSBkZWZhdWx0IHNw
ZWNpZmllcyB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb25zLiAgSG93ZXZlciwKPiAtCSAg
aXQgbWlnaHQgYmUgbmVjZXNzYXJ5IG9yIGFkdmFudGFnZW91cyB0byBlaXRoZXIgb3ZlcnJpZGUg
dGhlCj4gLQkgIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgbGluZSBvciBhZGQgYSBmZXcgZXh0cmEg
b3B0aW9ucyB0byBpdC4KPiAtCSAgRm9yIHN1Y2ggY2FzZXMsIHRoaXMgb3B0aW9uIGFsbG93cyB5
b3UgdG8gaGFyZGNvZGUgeW91ciBvd24KPiAtCSAgY29tbWFuZCBsaW5lIG9wdGlvbnMgZGlyZWN0
bHkgaW50byB0aGUga2VybmVsLiAgRm9yIHRoYXQsIHlvdQo+IC0JICBzaG91bGQgY2hvb3NlICdZ
JyBoZXJlLCBhbmQgZmlsbCBpbiB0aGUgZXh0cmEgYm9vdCBhcmd1bWVudHMKPiAtCSAgaW4gQ09O
RklHX0NNRExJTkUuCj4gLQo+IC0JICBUaGUgYnVpbHQtaW4gb3B0aW9ucyB3aWxsIGJlIGNvbmNh
dGVuYXRlZCB0byB0aGUgZGVmYXVsdCBjb21tYW5kCj4gLQkgIGxpbmUgaWYgQ01ETElORV9PVkVS
UklERSBpcyBzZXQgdG8gJ04nLiBPdGhlcndpc2UsIHRoZSBkZWZhdWx0Cj4gLQkgIGNvbW1hbmQg
bGluZSB3aWxsIGJlIGlnbm9yZWQgYW5kIHJlcGxhY2VkIGJ5IHRoZSBidWlsdC1pbiBzdHJpbmcu
Cj4gLQo+IC0JICBNb3N0IE1JUFMgc3lzdGVtcyB3aWxsIG5vcm1hbGx5IGV4cGVjdCAnTicgaGVy
ZSBhbmQgcmVseSB1cG9uCj4gLQkgIHRoZSBjb21tYW5kIGxpbmUgZnJvbSB0aGUgZmlybXdhcmUg
b3IgdGhlIHNlY29uZC1zdGFnZSBib290bG9hZGVyLgo+IC0KCgpTZWUgaG93IHlvdSBjb21wbGFp
bmVkIHRoYXQgSSBoYXZlIENNRExJTkVfQk9PTCBpbiBteSBjaGFuZ2VkLCBhbmQgeW91IHRoaW5r
IGl0CnNob3VsZG4ndCBleGlzdC4KCllldCBoZXJlIG1pcHMgaGFzIGl0LCBhbmQgeW91IGp1c3Qg
ZGVsZXRlZCBpdCB3aXRoIG5vIGZlYXR1cmUgcGFyaXR5IGluIHlvdXIKY2hhbmdlcyBmb3IgdGhp
cy4KCkluIG15IGNoYW5nZXMgSSB0cmllZCB0byBtYWludGFpbiBhcyBtdWNoIGZlYXR1cmUgcGFy
aXR5IGFzIEkgY291bGQgd2l0aCB0aGUKYXJjaGl0ZWN0dXJlcy4gSSBkaWQgdGhlIHNhbWUgaHVn
ZSBjb252ZXJzaW9uIGEgbG9uZyB0aW1lIGFnbyB5b3UndmUgZG9uZSBoZXJlIHRvIGJlIHN1cmUg
YWxsCnBsYXRmb3JtcyBoYXZlIHRoZSBmZWF0dXJlcyBuZWVkZWQuCgpEYW5pZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
