Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 545061D2000
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 087AC20594;
	Wed, 13 May 2020 22:17:39 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 50CA1202F5
 for <openrisc@lists.librecores.org>; Tue, 12 May 2020 16:47:08 +0200 (CEST)
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5779E206A3;
 Tue, 12 May 2020 14:46:58 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-30-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <484af2c0-2450-b40a-8322-e691495c45aa@linux-m68k.org>
Date: Wed, 13 May 2020 00:46:55 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510075510.987823-30-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 29/31] binfmt_flat: use
 flush_icache_user_range
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gMTAvNS8yMCA1OjU1IHBtLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBsb2FkX2ZsYXRfZmlsZSB3b3JrcyBvbiB1c2VyIGFkZHJlc3Nlcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCkFja2VkLWJ5OiBHcmVnIFVu
Z2VyZXIgPGdlcmdAbGludXgtbTY4ay5vcmc+CgpSZWdhcmRzCkdyZWcKCgoKPiAtLS0KPiAgIGZz
L2JpbmZtdF9mbGF0LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvYmluZm10X2ZsYXQuYyBiL2ZzL2Jp
bmZtdF9mbGF0LmMKPiBpbmRleCA4MzFhMmIyNWJhNzlmLi42ZjBhY2E1Mzc5ZGEyIDEwMDY0NAo+
IC0tLSBhL2ZzL2JpbmZtdF9mbGF0LmMKPiArKysgYi9mcy9iaW5mbXRfZmxhdC5jCj4gQEAgLTg1
NCw3ICs4NTQsNyBAQCBzdGF0aWMgaW50IGxvYWRfZmxhdF9maWxlKHN0cnVjdCBsaW51eF9iaW5w
cm0gKmJwcm0sCj4gICAjZW5kaWYgLyogQ09ORklHX0JJTkZNVF9GTEFUX09MRCAqLwo+ICAgCX0K
PiAgIAo+IC0JZmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0X2NvZGUsIGVuZF9jb2RlKTsKPiArCWZs
dXNoX2ljYWNoZV91c2VyX3JhbmdlKHN0YXJ0X2NvZGUsIGVuZF9jb2RlKTsKPiAgIAo+ICAgCS8q
IHplcm8gdGhlIEJTUywgIEJSSyBhbmQgc3RhY2sgYXJlYXMgKi8KPiAgIAlpZiAoY2xlYXJfdXNl
cigodm9pZCBfX3VzZXIgKikoZGF0YXBvcyArIGRhdGFfbGVuKSwgYnNzX2xlbiArCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
