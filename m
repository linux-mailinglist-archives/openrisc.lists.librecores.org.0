Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E924E4BB55F
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 10:21:10 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 61F9C24879;
	Fri, 18 Feb 2022 10:21:10 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 5E88324875
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 10:21:09 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF20FB825BC
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 09:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877F8C340E9
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645176067;
 bh=iKhg0GBIaPe+CQxdRyb4Yd6fYvnOL1KGipyOpowy2ho=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DmbaoareYIPQkNt+b/AN2U0NjEhsMDKKRruLucQdcBry6eIICKEBMgIvHsTNVvogX
 u+Q2/B5R0tkq+nlwYFLIiasYko9lTGpQrIiHeMYsxW8kAeSELi+UAbzulx9VBCHoGN
 7CV4UziAHiKx6szWru1ivMaRsx9gsQ8tRtuPAxrdxSp66apVQ8u22SUbjnHbDlA9vo
 NDG6ARcES/HkdxSSMW9kzaPTaxC65bBv91VHhLy/5Xxz85Lc5oypyhwwX+a1HwqOUx
 7lAqQBRyOPfmz7oSmzgtkelYwdjkRfwXp0Z6p8lrrsNUi9NEMrNSeeVRCzIAVEpsVq
 eq+1D9WpAvL2Q==
Received: by mail-ed1-f47.google.com with SMTP id i11so12695155eda.9
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 01:21:07 -0800 (PST)
X-Gm-Message-State: AOAM530JaJKlfhxJBhMPasGfEYIimPnZFaPzMZL3D8uzkKa3JWQyN5By
 lV/7x4EZHPlyvqXXpyRp5taHqyplQTOa418SQvs=
X-Google-Smtp-Source: ABdhPJyGR3PQRCwNo0b6q27n8W/CBFQ1qGTyO2eZuzZDzHloL87fpnteJNso35Jub1TB9UHbj8TuXAAIoiRTkKAAdXc=
X-Received: by 2002:a5d:59a3:0:b0:1e9:542d:1a35 with SMTP id
 p3-20020a5d59a3000000b001e9542d1a35mr816366wrr.192.1645176055050; Fri, 18 Feb
 2022 01:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
 <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
 <Yg8CjZwjWYIibrsd@zeniv-ca.linux.org.uk>
In-Reply-To: <Yg8CjZwjWYIibrsd@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 10:20:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0_uJQXshn5N0o4J_8dVPNCw885xGHqnKj3i5kYB+GtBg@mail.gmail.com>
Message-ID: <CAK8P3a0_uJQXshn5N0o4J_8dVPNCw885xGHqnKj3i5kYB+GtBg@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
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

biBGcmksIEZlYiAxOCwgMjAyMiBhdCAzOjIxIEFNIEFsIFZpcm8gPHZpcm9AemVuaXYubGludXgu
b3JnLnVrPiB3cm90ZToKPgo+IE9uIFRodSwgRmViIDE3LCAyMDIyIGF0IDA4OjQ5OjU5QU0gKzAx
MDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4KPiA+IFNhbWUgaGVyZTogYXJjaGl0ZWN0dXJlcyBj
YW4gYWxyZWFkeSBwcm92aWRlIGEgX19wdXRfdXNlcl9mbigpCj4gPiBhbmQgX19nZXRfdXNlcl9m
bigpLCB0byBnZXQgdGhlIGdlbmVyaWMgdmVyc2lvbnMgb2YgdGhlIGludGVyZmFjZSwKPiA+IGJ1
dCBmZXcgYXJjaGl0ZWN0dXJlcyB1c2UgdGhhdC4gWW91IGNhbiBhY3R1YWxseSBnZXQgYWxsIHRo
ZSBpbnRlcmZhY2VzCj4gPiBieSBqdXN0IHByb3ZpZGluZyByYXdfY29weV9mcm9tX3VzZXIoKSBh
bmQgcmF3X2NvcHlfdG9fdXNlcigpLAo+ID4gYnV0IHRoZSBnZXRfdXNlci9wdXRfdXNlciB2ZXJz
aW9ucyB5b3UgZ2V0IGZyb20gdGhhdCBhcmUgZmFpcmx5Cj4gPiBpbmVmZmljaWVudC4KPgo+IEZX
SVcsIF9fe2dldCxwdXR9X3VzZXJfezgsMTYsMzIsNjR9IHdvdWxkIHByb2JhYmx5IG1ha2UgaXQg
ZWFzaWVyIHRvCj4gdW5pZnkuICBUaGF0J3Mgd2hlcmUgdGhlIHJlYWxseSB2YXJpYWJsZSBwYXJ0
IHRlbmRzIHRvIGJlLCBhbnl3YXkuCj4gSU1PIF9fZ2V0X3VzZXJfZm4oKSBoYWQgYmVlbiBhIG1p
c3Rha2UuCgpJJ3ZlIHByb3RvdHlwZWQgdGhpcyBub3csIHRvIHNlZSB3aGF0IHRoaXMgbWlnaHQg
bG9vayBsaWtlLCBzZWUKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYXJuZC9wbGF5Z3JvdW5kLmdpdC9jb21taXQvP2g9Z2VuZXJpYy1nZXRfdXNlci1wcm90
b3R5cGUKClRoaXMgYWRkcyBnZW5lcmljIGlubGluZSB2ZXJzaW9uIG9mIHtfX2dldCxnZXQsX19w
dXQscHV0fV91c2VyKCkKYW5kIGNvbnZlcnRzIHg4NiB0byAob3B0aW9uYWxseSkgdXNlIGl0LiBU
aGlzIGJ1aWxkcyB3aXRoIGdjYy01CnRocm91Z2ggZ2NjLTExIG9uIDMyLWJpdCBhbmQgNjQtYml0
IHg4NiwgdXNpbmcgYXNtLWdvdG8gd2l0aApvdXRwdXRzIHdoZXJlIHBvc3NpYmxlLCBhbmQgcmVx
dWlyaW5nIGEgbWluaW11bSBzZXQgb2YgbWFjcm8KZGVmaW5pdGlvbnMgZnJvbSB0aGUgYXJjaGl0
ZWN0dXJlLiBDb21waWxpbmcgd2l0aCBjbGFuZyBwcm9kdWNlcwpubyB3YXJuaW5ncyBidXQgZG9l
cyBjYXVzZSBhIGxpbmtlciBpc3N1ZSBhdCB0aGUgbW9tZW50LCBzbwp0aGVyZSBpcyBwcm9iYWJs
eSBhdCBsZWFzdCBvbmUgYnVnIGluIGl0LgoKQXNpZGUgZnJvbSBjb21waWxlLXRlc3RpbmcsIEkg
aGF2ZSBub3QgdHJpZWQgdG8gdmVyaWZ5IGlmIHRoaXMKaXMgY29ycmVjdCBvciBlZmZpY2llbnQs
IGJ1dCBsZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgdGhpcyBpcyBoZWFkZWQKaW4gdGhlIHJpZ2h0
IGRpcmVjdGlvbi4KCj4gT25lIHRoaW5nIEkgc29tZXdoYXQgZGlzbGlrZSBhYm91dCB0aGUgc2Vy
aWVzIGlzIHRoZSBib2lsZXJwbGF0ZSBpbgo+IGFzbS91YWNjZXNzLmggaW5zdGFuY2VzIC0gI2lu
Y2x1ZGUgPGFzbS1nZW5lcmljL2FjY2Vzcy1vay5oPiBpbgo+IGEgbG90IG9mIHRoZW0gbWlnaHQg
bWFrZSBzZW5zZSBhcyBhIHRyYW5zaXRvcnkgc3RhdGUsIGJ1dCBnZXR0aW5nCj4gc3R1Y2sgd2l0
aCB0aG9zZSBpbmRlZmluaXRlbHkuLi4KCkNocmlzdG9waCBhbHNvIGNvbXBsYWluZWQgYWJvdXQg
aXQsIHRoZSBwcm9ibGVtIGZvciBub3cgaXMgdGhhdAphc20tZ2VuZXJpYy9hY2Nlc3Nfb2suaCBt
dXN0IGZpcnN0IHNlZSB0aGUgbWFjcm8gZGVmaW5pdGlvbnMgZm9yCmFyY2hpdGVjdHVyZXMgdGhh
dCBvdmVycmlkZSBhbnkgb2YgdGhlIGNvbnRlbnRzLCBidXQgYWNjZXNzX29rKCkKaXRzZWxmIGlz
IHVzZWQgYXQgbGVhc3QgaW4gc29tZSBvZiB0aGUgYXNtL3VhY2Nlc3MuaCBmaWxlcyBhcyB3ZWxs
LApzbyBpdCBtdXN0IGJlIGluY2x1ZGVkIGluIHRoZSBtaWRkbGUgb2YgaXQsIHVudGlsIG1vcmUg
b2YgdGhlIHVhY2Nlc3MuaAppbXBsZW1lbnRhdGlvbiBpcyBtb3ZlZCB0byBsaW51eC91YWNjZXNz
LmggaW4gYW4gYXJjaGl0ZWN0dXJlCmluZGVwZW5kZW50IHdheS4KCldvdWxkIHlvdSBwcmVmZXIg
aGF2aW5nIGFuIGFzbS9hY2Nlc3Nfb2suaCB0aGF0IGZhbGxzIGJhY2sgdG8KdGhlIGFzbS1nZW5l
cmljIHZlcnNpb24gYnV0IGNhbiBoYXZlIGFuIGFyY2hpdGVjdHVyZSBzcGVjaWZpYwpvdmVycmlk
ZSB3aGVuIG5lZWRlZCAoaWE2NCwgYXJtNjQsIHg4NiwgdW0pPwoKPiAgICAgICAgIEJUVywgZG8g
d2UgbmVlZCB1c2VyX2FkZHJfbWF4KCkgYW55bW9yZT8gIFRoZSBkZWZpbml0aW9uIGluCj4gYXNt
LWdlbmVyaWMvYWNjZXNzLW9rLmggaXMgdGhlIG9ubHkgb25lLCBzbyBpZm5kZWYgYXJvdW5kIGl0
IGlzIHBvaW50bGVzcy4KClJpZ2h0LCB0aGUgdjIgY2hhbmdlcyBnb3QgcmlkIG9mIHRoZSBsYXN0
IG92ZXJyaWRlLCBzbyBpdCBjb3VsZCBnZXQKaGFyZGNvZGVkIHRvIFRBU0tfU0laRV9NQVgsIG9y
IHdlIGNhbiBjb252ZXJ0IHRoZSBmaXZlCnJlZmVyZW5jZXMgdG8ganVzdCB1c2UgdGhhdCBpbnN0
ZWFkIGFuZCByZW1vdmUgaXQgYWx0b2dldGhlcjoKCmFyY2gvYXJtNjQva2VybmVsL3RyYXBzLmM6
ICAgICAgaWYgKGFkZHJlc3MgPj0gdXNlcl9hZGRyX21heCgpKSB7CiAgICAgICAgICAgICAgICAg
XAphcmNoL3BhcmlzYy9rZXJuZWwvc2lnbmFsLmM6ICAgIGlmIChzdGFydCA+PSB1c2VyX2FkZHJf
bWF4KCkgLSBzaWdmcmFtZV9zaXplKQphcmNoL3BhcmlzYy9rZXJuZWwvc2lnbmFsLmM6ICAgICAg
ICAgICAgaWYgKEEoJnVzcFswXSkgPj0KdXNlcl9hZGRyX21heCgpIC0gNSAqIHNpemVvZihpbnQp
KQpsaWIvc3RybmNweV9mcm9tX3VzZXIuYzogICAgICAgIG1heF9hZGRyID0gdXNlcl9hZGRyX21h
eCgpOwpsaWIvc3Rybmxlbl91c2VyLmM6ICAgICBtYXhfYWRkciA9IHVzZXJfYWRkcl9tYXgoKTsK
CnVzZXJfYWRkcl9tYXgoKSBmaXJzdCBzaG93ZWQgdXAgaW4gYXJjaGl0ZWN0dXJlLWluZGVwZW5k
ZW50IGNvZGUgaW4KYzUzODk4MzFjZGEzICgic3BhcmM6IEZpeCB1c2VyX2FkZHJfbWF4KCkgZGVm
aW5pdGlvbi4iKSwgYW5kIGZyb20gdGhhdApJIHRoaW5rIHRoZSBvcmlnaW5hbCBpbnRlbnQgaXMg
bm8gbG9uZ2VyIHVzZWZ1bC4KCiAgICAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
