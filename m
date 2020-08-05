Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0AECB2460A8
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A017820AB6;
	Mon, 17 Aug 2020 10:45:55 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 4AF9620CF2
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 06:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596601237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twertatwzUrM7ldiTnLyq8dIY3NouOKQbE23vgZibYc=;
 b=RhB7tJrWsV46yFoehAYmxLRKZCWlHdsxIYJKxQV1BjXImPnPGbcPU6V368xtzPpT8l+y2N
 KOIzb3ETxq+JUYWFHDfnWn7ZFyX7kyfYNAjP/tGJCSGm5VxuDZQnRtGjoaDq+EoKLy2dTo
 aEXBlqjVykf8BUIRQmUAnBKVDoaGdv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-pdUQtGUaN4iDPq52ne80Vw-1; Wed, 05 Aug 2020 00:20:34 -0400
X-MC-Unique: pdUQtGUaN4iDPq52ne80Vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26651009600;
 Wed,  5 Aug 2020 04:20:29 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C71071765;
 Wed,  5 Aug 2020 04:20:27 +0000 (UTC)
Date: Wed, 5 Aug 2020 12:20:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805042024.GT10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-14-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-14-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 13/17] x86/setup: simplify initrd
 relocation and reservation
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDgvMDIvMjAgYXQgMDc6MzVwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gQ3VycmVudGx5LCBpbml0cmQgaW1h
Z2UgaXMgcmVzZXJ2ZWQgdmVyeSBlYXJseSBkdXJpbmcgc2V0dXAgYW5kIHRoZW4gaXQKPiBtaWdo
dCBiZSByZWxvY2F0ZWQgYW5kIHJlLXJlc2VydmVkIGFmdGVyIHRoZSBpbml0aWFsIHBoeXNpY2Fs
IG1lbW9yeQo+IG1hcHBpbmcgaXMgY3JlYXRlZC4gVGhlICJsYXRlIiByZXNlcnZhdGlvbiBvZiBt
ZW1ibG9jayB2ZXJpZmllcyB0aGF0IG1hcHBlZAo+IG1lbW9yeSBzaXplIGV4Y2VlZHMgdGhlIHNp
emUgb2YgaW5pdHJkLCB0aGUgY2hlY2tzIHdoZXRoZXIgdGhlIHJlbG9jYXRpb24KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfiB0aGVuPwo+IHJlcXVpcmVkIGFuZCwg
aWYgeWVzLCByZWxvY2F0ZXMgaW5pcnRkIHRvIGEgbmV3IG1lbW9yeSBhbGxvY2F0ZWQgZnJvbQo+
IG1lbWJsb2NrIGFuZCBmcmVlcyB0aGUgb2xkIGxvY2F0aW9uLgo+IAo+IFRoZSBjaGVjayBmb3Ig
bWVtb3J5IHNpemUgaXMgZXhjZXNzaXZlIGFzIG1lbWJsb2NrIGFsbG9jYXRpb24gd2lsbCBhbnl3
YXkKPiBmYWlsIGlmIHRoZXJlIGlzIG5vdCBlbm91Z2ggbWVtb3J5LiBCZXNpZGVzLCB0aGVyZSBp
cyBubyBwb2ludCB0byBhbGxvY2F0ZQo+IG1lbW9yeSBmcm9tIG1lbWJsb2NrIHVzaW5nIG1lbWJs
b2NrX2ZpbmRfaW5fcmFuZ2UoKSArIG1lbWJsb2NrX3Jlc2VydmUoKQo+IHdoZW4gdGhlcmUgZXhp
c3RzIG1lbWJsb2NrX3BoeXNfYWxsb2NfcmFuZ2UoKSB3aXRoIHJlcXVpcmVkIGZ1bmN0aW9uYWxp
dHkuCj4gCj4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgY2hlY2sgYW5kIHNpbXBsaWZ5IG1lbWJsb2Nr
IGFsbG9jYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyB8IDE2ICsrKy0tLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC94ODYv
a2VybmVsL3NldHVwLmMKPiBpbmRleCBhMzc2N2U3NGM3NTguLmQ4ZGU0MDUzYzVlOCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9z
ZXR1cC5jCj4gQEAgLTI2MiwxNiArMjYyLDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZWxvY2F0
ZV9pbml0cmQodm9pZCkKPiAgCXU2NCBhcmVhX3NpemUgICAgID0gUEFHRV9BTElHTihyYW1kaXNr
X3NpemUpOwo+ICAKPiAgCS8qIFdlIG5lZWQgdG8gbW92ZSB0aGUgaW5pdHJkIGRvd24gaW50byBk
aXJlY3RseSBtYXBwZWQgbWVtICovCj4gLQlyZWxvY2F0ZWRfcmFtZGlzayA9IG1lbWJsb2NrX2Zp
bmRfaW5fcmFuZ2UoMCwgUEZOX1BIWVMobWF4X3Bmbl9tYXBwZWQpLAo+IC0JCQkJCQkgICBhcmVh
X3NpemUsIFBBR0VfU0laRSk7Cj4gLQo+ICsJcmVsb2NhdGVkX3JhbWRpc2sgPSBtZW1ibG9ja19w
aHlzX2FsbG9jX3JhbmdlKGFyZWFfc2l6ZSwgUEFHRV9TSVpFLCAwLAo+ICsJCQkJCQkgICAgICBQ
Rk5fUEhZUyhtYXhfcGZuX21hcHBlZCkpOwo+ICAJaWYgKCFyZWxvY2F0ZWRfcmFtZGlzaykKPiAg
CQlwYW5pYygiQ2Fubm90IGZpbmQgcGxhY2UgZm9yIG5ldyBSQU1ESVNLIG9mIHNpemUgJWxsZFxu
IiwKPiAgCQkgICAgICByYW1kaXNrX3NpemUpOwo+ICAKPiAtCS8qIE5vdGU6IHRoaXMgaW5jbHVk
ZXMgYWxsIHRoZSBtZW0gY3VycmVudGx5IG9jY3VwaWVkIGJ5Cj4gLQkgICB0aGUgaW5pdHJkLCB3
ZSByZWx5IG9uIHRoYXQgZmFjdCB0byBrZWVwIHRoZSBkYXRhIGludGFjdC4gKi8KPiAtCW1lbWJs
b2NrX3Jlc2VydmUocmVsb2NhdGVkX3JhbWRpc2ssIGFyZWFfc2l6ZSk7Cj4gIAlpbml0cmRfc3Rh
cnQgPSByZWxvY2F0ZWRfcmFtZGlzayArIFBBR0VfT0ZGU0VUOwo+ICAJaW5pdHJkX2VuZCAgID0g
aW5pdHJkX3N0YXJ0ICsgcmFtZGlza19zaXplOwo+ICAJcHJpbnRrKEtFUk5fSU5GTyAiQWxsb2Nh
dGVkIG5ldyBSQU1ESVNLOiBbbWVtICUjMDEwbGx4LSUjMDEwbGx4XVxuIiwKPiBAQCAtMjk4LDEz
ICsyOTQsMTMgQEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3Jlc2VydmVfaW5pdHJkKHZvaWQp
Cj4gIAo+ICAJbWVtYmxvY2tfcmVzZXJ2ZShyYW1kaXNrX2ltYWdlLCByYW1kaXNrX2VuZCAtIHJh
bWRpc2tfaW1hZ2UpOwo+ICB9Cj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgcmVzZXJ2ZV9pbml0
cmQodm9pZCkKPiAgewo+ICAJLyogQXNzdW1lIG9ubHkgZW5kIGlzIG5vdCBwYWdlIGFsaWduZWQg
Ki8KPiAgCXU2NCByYW1kaXNrX2ltYWdlID0gZ2V0X3JhbWRpc2tfaW1hZ2UoKTsKPiAgCXU2NCBy
YW1kaXNrX3NpemUgID0gZ2V0X3JhbWRpc2tfc2l6ZSgpOwo+ICAJdTY0IHJhbWRpc2tfZW5kICAg
PSBQQUdFX0FMSUdOKHJhbWRpc2tfaW1hZ2UgKyByYW1kaXNrX3NpemUpOwo+IC0JdTY0IG1hcHBl
ZF9zaXplOwo+ICAKPiAgCWlmICghYm9vdF9wYXJhbXMuaGRyLnR5cGVfb2ZfbG9hZGVyIHx8Cj4g
IAkgICAgIXJhbWRpc2tfaW1hZ2UgfHwgIXJhbWRpc2tfc2l6ZSkKPiBAQCAtMzEyLDEyICszMDgs
NiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmVzZXJ2ZV9pbml0cmQodm9pZCkKPiAgCj4gIAlpbml0
cmRfc3RhcnQgPSAwOwo+ICAKPiAtCW1hcHBlZF9zaXplID0gbWVtYmxvY2tfbWVtX3NpemUobWF4
X3Bmbl9tYXBwZWQpOwo+IC0JaWYgKHJhbWRpc2tfc2l6ZSA+PSAobWFwcGVkX3NpemU+PjEpKQo+
IC0JCXBhbmljKCJpbml0cmQgdG9vIGxhcmdlIHRvIGhhbmRsZSwgIgo+IC0JCSAgICAgICAiZGlz
YWJsaW5nIGluaXRyZCAoJWxsZCBuZWVkZWQsICVsbGQgYXZhaWxhYmxlKVxuIiwKPiAtCQkgICAg
ICAgcmFtZGlza19zaXplLCBtYXBwZWRfc2l6ZT4+MSk7CgpSZXZpZXdlZC1ieTogQmFvcXVhbiBI
ZSA8YmhlQHJlZGhhdC5jb20+Cgo+IC0KPiAgCXByaW50ayhLRVJOX0lORk8gIlJBTURJU0s6IFtt
ZW0gJSMwMTBsbHgtJSMwMTBsbHhdXG4iLCByYW1kaXNrX2ltYWdlLAo+ICAJCQlyYW1kaXNrX2Vu
ZCAtIDEpOwo+ICAKPiAtLSAKPiAyLjI2LjIKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
