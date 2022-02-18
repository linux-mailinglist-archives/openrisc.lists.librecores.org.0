Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DB13D4BAF81
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 03:21:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 816A52484D;
	Fri, 18 Feb 2022 03:21:22 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id 13C1D2483A
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 03:21:21 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nKstJ-002dCt-8P; Fri, 18 Feb 2022 02:21:01 +0000
Date: Fri, 18 Feb 2022 02:21:01 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Yg8CjZwjWYIibrsd@zeniv-ca.linux.org.uk>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
 <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v2 00/18] clean up asm/uaccess.h,
 kill set_fs for good
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "green.hu@gmail.com" <green.hu@gmail.com>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMDg6NDk6NTlBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKCj4gU2FtZSBoZXJlOiBhcmNoaXRlY3R1cmVzIGNhbiBhbHJlYWR5IHByb3ZpZGUgYSBf
X3B1dF91c2VyX2ZuKCkKPiBhbmQgX19nZXRfdXNlcl9mbigpLCB0byBnZXQgdGhlIGdlbmVyaWMg
dmVyc2lvbnMgb2YgdGhlIGludGVyZmFjZSwKPiBidXQgZmV3IGFyY2hpdGVjdHVyZXMgdXNlIHRo
YXQuIFlvdSBjYW4gYWN0dWFsbHkgZ2V0IGFsbCB0aGUgaW50ZXJmYWNlcwo+IGJ5IGp1c3QgcHJv
dmlkaW5nIHJhd19jb3B5X2Zyb21fdXNlcigpIGFuZCByYXdfY29weV90b191c2VyKCksCj4gYnV0
IHRoZSBnZXRfdXNlci9wdXRfdXNlciB2ZXJzaW9ucyB5b3UgZ2V0IGZyb20gdGhhdCBhcmUgZmFp
cmx5Cj4gaW5lZmZpY2llbnQuCgpGV0lXLCBfX3tnZXQscHV0fV91c2VyX3s4LDE2LDMyLDY0fSB3
b3VsZCBwcm9iYWJseSBtYWtlIGl0IGVhc2llciB0bwp1bmlmeS4gIFRoYXQncyB3aGVyZSB0aGUg
cmVhbGx5IHZhcmlhYmxlIHBhcnQgdGVuZHMgdG8gYmUsIGFueXdheS4KSU1PIF9fZ2V0X3VzZXJf
Zm4oKSBoYWQgYmVlbiBhIG1pc3Rha2UuCgpPbmUgdGhpbmcgSSBzb21ld2hhdCBkaXNsaWtlIGFi
b3V0IHRoZSBzZXJpZXMgaXMgdGhlIGJvaWxlcnBsYXRlIGluCmFzbS91YWNjZXNzLmggaW5zdGFu
Y2VzIC0gI2luY2x1ZGUgPGFzbS1nZW5lcmljL2FjY2Vzcy1vay5oPiBpbgphIGxvdCBvZiB0aGVt
IG1pZ2h0IG1ha2Ugc2Vuc2UgYXMgYSB0cmFuc2l0b3J5IHN0YXRlLCBidXQgZ2V0dGluZwpzdHVj
ayB3aXRoIHRob3NlIGluZGVmaW5pdGVseS4uLgoKCUJUVywgZG8gd2UgbmVlZCB1c2VyX2FkZHJf
bWF4KCkgYW55bW9yZT8gIFRoZSBkZWZpbml0aW9uIGluCmFzbS1nZW5lcmljL2FjY2Vzcy1vay5o
IGlzIHRoZSBvbmx5IG9uZSwgc28gaWZuZGVmIGFyb3VuZCBpdCBpcyBwb2ludGxlc3MuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
