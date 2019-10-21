Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 68775E2A5F
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 08:24:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1C10020725;
	Thu, 24 Oct 2019 08:24:20 +0200 (CEST)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by mail.librecores.org (Postfix) with ESMTPS id 2A32C20101
 for <openrisc@lists.librecores.org>; Mon, 21 Oct 2019 10:23:17 +0200 (CEST)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iMSy0-0004QQ-CI; Mon, 21 Oct 2019 10:23:04 +0200
Date: Mon, 21 Oct 2019 10:23:03 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20191017174554.29840-9-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1910211019540.1904@nanos.tec.linutronix.de>
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-9-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Oct 2019 08:24:18 +0200
Subject: Re: [OpenRISC] [PATCH 08/21] x86: clean up ioremap
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCAxNyBPY3QgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6CgpQbGVhc2UgY2hh
bmdlIHRoZSBzdWJqZWN0IHRvOgoKICAgICAgIHg4Ni9tbTogQ2xlYW51cCBpb3JlbWFwKCkKCj4g
VXNlIGlvcmVtYXAgYXMgdGhlIG1haW4gaW1wbGVtZW50ZWQgZnVuY3Rpb24sIGFuZCBkZWZpbmVk
Cgppb3JlbWFwKCkgcGxlYXNlCgpzL2RlZmluZWQvZGVmaW5lLwoKPiBpb3JlbWFwX25vY2FjaGUg
dG8gaXQgYXMgYSBkZXByZWNhdGVkIGFsaWFzLgoKaW9yZW1hcF9ub2NhY2hlKCkgYXMgYSBkZXBy
ZWNhdGVkIGFsaWFzIG9mIGlvcmVtYXAoKS4KCkFzaWRlIG9mIHRoYXQgdGhpcyBsYWNrcyBhbnkg
Zm9ybSBvZiByYXRpb25hbGUuIFBsZWFzZSBhZGQgc29tZSBXSFkgdG8gaXQuCgpTaG91bGQgdGhp
cyBnbyB3aXRoIHlvdXIgbGFyZ2VyIHNlcmllcyBvciBjYW4gdGhpcyBiZSBwaWNrZWQgdXAKaW5k
ZXBlbmRlbnRseT8KClRoYW5rcywKCgl0Z2x4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
