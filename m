Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A2A961D2013
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8BCD220B5A;
	Wed, 13 May 2020 22:17:54 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 7219720AF3
 for <openrisc@lists.librecores.org>; Tue, 12 May 2020 21:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=06WzxohBOlYteWluUWbzGc3WgzLIDbwGVNVvQcF5qCk=; b=sJyhohILZprUtzM2NgAProlR7c
 zZGgbqKxc7w7t+9FtmATcgZNUvJTN/gK8i+l9b5MPrPlaA1RFtypN9JoPCyDlZEr3G9Xsm8VmVyCQ
 tOSsTqVFrxqsaWLVbuZ0bUZclljtFDVD6povqnn4xGjaaNhIofu9suSIOrYpMo4ftp68MLc9Sd2bc
 vxD9VyWFnO/YaA8fl5eUTL3ZhWmPL2e07Kus5ZjHu6mWQoMxCbJB4KW2brZlpgT+PiPBMUzkloWzm
 Cg9r30QOhnsQCOObYkzCKrq1ar9XbN/fzuEMVAfcXm83/SVzTli9B4At8cdP2CMmvMqoqbzW5NQqX
 5hcO9i8w==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jYaW9-00026f-44; Tue, 12 May 2020 19:24:41 +0000
Date: Tue, 12 May 2020 12:24:41 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200512192441.GZ16070@bombadil.infradead.org>
References: <20200512184422.12418-1-rppt@kernel.org>
 <20200512184422.12418-9-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512184422.12418-9-rppt@kernel.org>
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 08/12] mm: pgtable: add shortcuts for
 accessing kernel PMD and PTE
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
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMDk6NDQ6MThQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiArKysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+IEBAIC0yOCw2ICsyOCwyNCBA
QAo+ICAjZGVmaW5lIFVTRVJfUEdUQUJMRVNfQ0VJTElORwkwVUwKPiAgI2VuZGlmCj4gIAo+ICsv
KiBGSVhNRTogKi8KCkZpeCB5b3Ugd2hhdD8gIEFkZCBkb2N1bWVudGF0aW9uPwoKPiArc3RhdGlj
IGlubGluZSBwbWRfdCAqcG1kX29mZihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyB2YSkKPiArewo+ICsJcmV0dXJuIHBtZF9vZmZzZXQocHVkX29mZnNldChwNGRfb2Zmc2V0KHBn
ZF9vZmZzZXQobW0sIHZhKSwgdmEpLCB2YSksIHZhKTsKPiArfQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
