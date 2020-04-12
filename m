Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0220E1B20B0
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 928F820AFB;
	Tue, 21 Apr 2020 10:01:53 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1C71C20A4B
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:54:29 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2DF521569;
 Sun, 12 Apr 2020 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721267;
 bh=1RVcfnAVVy1AOFZedJzROhTSSnKRoGcShhyioeaCXqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u+cDL9Ay57g0t0AmxzSf1s9ge6PHXPdoiABBA+FnntFugxZQ3ay62Fn/wxvhA46ys
 LvgHJZQQQMChrWXoV7Loga6rBUNnWEZZY/bl8oZkZda++jqcfs7SGJJqgA6ZnwPRPa
 Szh9qdEAYeTz2OcNdts2q+xOIGjdhJ6Uok1Jog6A=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:59 +0300
Message-Id: <20200412194859.12663-22-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 21/21] docs/vm: update memory-models documentation
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
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKdG8gcmVmbGVjdCB0aGUg
dXBkYXRlcyB0byBmcmVlX2FyZWFfaW5pdCgpIGZhbWlseSBvZiBmdW5jdGlvbnMuCgpTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogRG9jdW1lbnRh
dGlvbi92bS9tZW1vcnktbW9kZWwucnN0IHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi92bS9tZW1vcnktbW9kZWwucnN0IGIvRG9jdW1lbnRhdGlvbi92bS9tZW1vcnktbW9kZWwucnN0
CmluZGV4IDU4YTEyMzc2YjdkZi4uOTEyMjgwNDRlZDE2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL3ZtL21lbW9yeS1tb2RlbC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92bS9tZW1vcnktbW9k
ZWwucnN0CkBAIC00NiwxMSArNDYsMTAgQEAgbWFwcyB0aGUgZW50aXJlIHBoeXNpY2FsIG1lbW9y
eS4gRm9yIG1vc3QgYXJjaGl0ZWN0dXJlcywgdGhlIGhvbGVzCiBoYXZlIGVudHJpZXMgaW4gdGhl
IGBtZW1fbWFwYCBhcnJheS4gVGhlIGBzdHJ1Y3QgcGFnZWAgb2JqZWN0cwogY29ycmVzcG9uZGlu
ZyB0byB0aGUgaG9sZXMgYXJlIG5ldmVyIGZ1bGx5IGluaXRpYWxpemVkLgogCi1UbyBhbGxvY2F0
ZSB0aGUgYG1lbV9tYXBgIGFycmF5LCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgc2V0dXAgY29kZQot
c2hvdWxkIGNhbGwgOmM6ZnVuYzpgZnJlZV9hcmVhX2luaXRfbm9kZWAgZnVuY3Rpb24gb3IgaXRz
IGNvbnZlbmllbmNlCi13cmFwcGVyIDpjOmZ1bmM6YGZyZWVfYXJlYV9pbml0YC4gWWV0LCB0aGUg
bWFwcGluZ3MgYXJyYXkgaXMgbm90Ci11c2FibGUgdW50aWwgdGhlIGNhbGwgdG8gOmM6ZnVuYzpg
bWVtYmxvY2tfZnJlZV9hbGxgIHRoYXQgaGFuZHMgYWxsCi10aGUgbWVtb3J5IHRvIHRoZSBwYWdl
IGFsbG9jYXRvci4KK1RvIGFsbG9jYXRlIHRoZSBgbWVtX21hcGAgYXJyYXksIGFyY2hpdGVjdHVy
ZSBzcGVjaWZpYyBzZXR1cCBjb2RlIHNob3VsZAorY2FsbCA6YzpmdW5jOmBmcmVlX2FyZWFfaW5p
dGAgZnVuY3Rpb24uIFlldCwgdGhlIG1hcHBpbmdzIGFycmF5IGlzIG5vdAordXNhYmxlIHVudGls
IHRoZSBjYWxsIHRvIDpjOmZ1bmM6YG1lbWJsb2NrX2ZyZWVfYWxsYCB0aGF0IGhhbmRzIGFsbCB0
aGUKK21lbW9yeSB0byB0aGUgcGFnZSBhbGxvY2F0b3IuCiAKIElmIGFuIGFyY2hpdGVjdHVyZSBl
bmFibGVzIGBDT05GSUdfQVJDSF9IQVNfSE9MRVNfTUVNT1JZTU9ERUxgIG9wdGlvbiwKIGl0IG1h
eSBmcmVlIHBhcnRzIG9mIHRoZSBgbWVtX21hcGAgYXJyYXkgdGhhdCBkbyBub3QgY292ZXIgdGhl
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
