Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AA1DC2E292D
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0BAE720E43;
	Fri, 25 Dec 2020 00:15:27 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 63ED020AB4
 for <openrisc@lists.librecores.org>; Sun, 13 Dec 2020 15:10:32 +0100 (CET)
Date: Sun, 13 Dec 2020 09:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607868630;
 bh=S0NZCKTHXO1/XgTBibTeHKY2NyaV+jWp9oZjgvuSOZg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFttyLKxDFdTzDqG+uV+ZMYwIDraCwmT1csa8RGjNQtB2KNQuC3CWvsr8XvQHFTkX
 bOVfEZ3hZGq/q87besC+Bjzp/UHT9BZ6/avesb9g234GUTyQ6mz9ZdKVWLvvWayKcR
 5IsZC3of1cWOok1XpWOR2jKmC5sWYP7UWQbjwfCJNcyT1mEousS3/8Iz7qmQngrF+E
 UBfwNFX/Xim1w8qNAQxV89tayOf16Xozhta7DOpqMYNyp+n+eIU7Y985xkZoMGJ7UI
 W/Q6SnFz+H4jXIWSjxGFg8FVH/fANHjQkaleEJRhOabM6QD83DoUX7CgAE554wRsQU
 Zom91bCLKheaA==
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20201213141029.GQ643756@sasha-vm>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
 <20201203145442.GC9994@osiris>
 <20201203171015.GN2414@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203171015.GN2414@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:21 +0100
Subject: Re: [OpenRISC] [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix
 arch_cpu_idle() vs tracing
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
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDY6MTA6MTVQTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj5PbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwMzo1NDo0MlBNICswMTAwLCBIZWlrbyBD
YXJzdGVucyB3cm90ZToKPj4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDg6Mjg6MjFBTSAtMDUw
MCwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4+ID4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPgo+PiA+Cj4+ID4gWyBVcHN0cmVhbSBjb21taXQgNThjNjQ0YmE1MTJjZmJj
MmUzOWI3NThkZDk3OWVkZDFkNmQwMGUyNyBdCj4+ID4KPj4gPiBXZSBjYWxsIGFyY2hfY3B1X2lk
bGUoKSB3aXRoIFJDVSBkaXNhYmxlZCwgYnV0IHRoZW4gdXNlCj4+ID4gbG9jYWxfaXJxX3tlbixk
aXN9YWJsZSgpLCB3aGljaCBpbnZva2VzIHRyYWNpbmcsIHdoaWNoIHJlbGllcyBvbiBSQ1UuCj4+
ID4KPj4gPiBTd2l0Y2ggYWxsIGFyY2hfY3B1X2lkbGUoKSBpbXBsZW1lbnRhdGlvbnMgdG8gdXNl
Cj4+ID4gcmF3X2xvY2FsX2lycV97ZW4sZGlzfWFibGUoKSBhbmQgY2FyZWZ1bGx5IG1hbmFnZSB0
aGUKPj4gPiBsb2NrZGVwLHJjdSx0cmFjaW5nIHN0YXRlIGxpa2Ugd2UgZG8gaW4gZW50cnkuCj4+
ID4KPj4gPiAoWFhYOiB3ZSByZWFsbHkgc2hvdWxkIGNoYW5nZSBhcmNoX2NwdV9pZGxlKCkgdG8g
bm90IHJldHVybiB3aXRoCj4+ID4gaW50ZXJydXB0cyBlbmFibGVkKQo+PiA+Cj4+ID4gUmVwb3J0
ZWQtYnk6IFN2ZW4gU2NobmVsbGUgPHN2ZW5zQGxpbnV4LmlibS5jb20+Cj4+ID4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4+ID4g
UmV2aWV3ZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4+ID4gVGVz
dGVkLWJ5OiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgo+PiA+IExpbms6IGh0
dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyMDExMjAxMTQ5MjUuNTk0MTIyNjI2QGluZnJhZGVh
ZC5vcmcKPj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Cj4+Cj4+IFRoaXMgcGF0Y2ggYnJva2UgczM5MCBpcnEgc3RhdGUgdHJhY2luZy4gQSBwYXRjaCB0
byBmaXggdGhpcyBpcwo+PiBzY2hlZHVsZWQgdG8gYmUgbWVyZ2VkIHVwc3RyZWFtIHRvZGF5ICho
b3BlZnVsbHkpLgo+PiBUaGVyZWZvcmUgSSB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBub3QgeWV0
IGdvIGludG8gNS45IHN0YWJsZS4KPgo+QWdyZWVkLgoKSSdsbCBhbHNvIGdyYWIgYjFjYWUxZjg0
YTBmICgiczM5MDogZml4IGlycSBzdGF0ZSB0cmFjaW5nIikuIFRoYW5rcyEKCi0tIApUaGFua3Ms
ClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
