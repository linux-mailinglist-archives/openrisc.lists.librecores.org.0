Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B99CC2499BF
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1BAFC20CBE;
	Wed, 19 Aug 2020 11:55:54 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id D980520CD0
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:19:12 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5F202080C;
 Tue, 18 Aug 2020 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763951;
 bh=xdLje+Wq+Qqc9RqjhZLPYalhD3lsz2kBtQOX3rvPlas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sECSrz89dq6Asy9v/j+zcAAnyasqeJ2/ZC5nuINkm3twrHsAG81JUnPqiu8OKZxqF
 C/B27cV4JLldeBaMM3hOhZqwU5M2rMEw7W4NlqWhNnSs+dTca6wI56Kb6BFIQMMk9j
 ZW1Zp3BkrlgAEgNsK4vPqNBOErn9MxV1511OomEk=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:30 +0300
Message-Id: <20200818151634.14343-14-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 13/17] x86/setup: simplify initrd relocation
 and reservation
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKQ3VycmVudGx5LCBpbml0
cmQgaW1hZ2UgaXMgcmVzZXJ2ZWQgdmVyeSBlYXJseSBkdXJpbmcgc2V0dXAgYW5kIHRoZW4gaXQK
bWlnaHQgYmUgcmVsb2NhdGVkIGFuZCByZS1yZXNlcnZlZCBhZnRlciB0aGUgaW5pdGlhbCBwaHlz
aWNhbCBtZW1vcnkKbWFwcGluZyBpcyBjcmVhdGVkLiBUaGUgImxhdGUiIHJlc2VydmF0aW9uIG9m
IG1lbWJsb2NrIHZlcmlmaWVzIHRoYXQgbWFwcGVkCm1lbW9yeSBzaXplIGV4Y2VlZHMgdGhlIHNp
emUgb2YgaW5pdHJkLCB0aGVuIGNoZWNrcyB3aGV0aGVyIHRoZSByZWxvY2F0aW9uCnJlcXVpcmVk
IGFuZCwgaWYgeWVzLCByZWxvY2F0ZXMgaW5pcnRkIHRvIGEgbmV3IG1lbW9yeSBhbGxvY2F0ZWQg
ZnJvbQptZW1ibG9jayBhbmQgZnJlZXMgdGhlIG9sZCBsb2NhdGlvbi4KClRoZSBjaGVjayBmb3Ig
bWVtb3J5IHNpemUgaXMgZXhjZXNzaXZlIGFzIG1lbWJsb2NrIGFsbG9jYXRpb24gd2lsbCBhbnl3
YXkKZmFpbCBpZiB0aGVyZSBpcyBub3QgZW5vdWdoIG1lbW9yeS4gQmVzaWRlcywgdGhlcmUgaXMg
bm8gcG9pbnQgdG8gYWxsb2NhdGUKbWVtb3J5IGZyb20gbWVtYmxvY2sgdXNpbmcgbWVtYmxvY2tf
ZmluZF9pbl9yYW5nZSgpICsgbWVtYmxvY2tfcmVzZXJ2ZSgpCndoZW4gdGhlcmUgZXhpc3RzIG1l
bWJsb2NrX3BoeXNfYWxsb2NfcmFuZ2UoKSB3aXRoIHJlcXVpcmVkIGZ1bmN0aW9uYWxpdHkuCgpS
ZW1vdmUgdGhlIHJlZHVuZGFudCBjaGVjayBhbmQgc2ltcGxpZnkgbWVtYmxvY2sgYWxsb2NhdGlv
bi4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KQWNr
ZWQtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQmFvcXVh
biBIZSA8YmhlQHJlZGhhdC5jb20+Ci0tLQogYXJjaC94ODYva2VybmVsL3NldHVwLmMgfCAxNiAr
KystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyBiL2FyY2gveDg2
L2tlcm5lbC9zZXR1cC5jCmluZGV4IDM1MTE3MzZmYmM3NC4uMmNhYzM5YWRlMmUzIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAu
YwpAQCAtMjYzLDE2ICsyNjMsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IHJlbG9jYXRlX2luaXRy
ZCh2b2lkKQogCXU2NCBhcmVhX3NpemUgICAgID0gUEFHRV9BTElHTihyYW1kaXNrX3NpemUpOwog
CiAJLyogV2UgbmVlZCB0byBtb3ZlIHRoZSBpbml0cmQgZG93biBpbnRvIGRpcmVjdGx5IG1hcHBl
ZCBtZW0gKi8KLQlyZWxvY2F0ZWRfcmFtZGlzayA9IG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2UoMCwg
UEZOX1BIWVMobWF4X3Bmbl9tYXBwZWQpLAotCQkJCQkJICAgYXJlYV9zaXplLCBQQUdFX1NJWkUp
OwotCisJcmVsb2NhdGVkX3JhbWRpc2sgPSBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKGFyZWFf
c2l6ZSwgUEFHRV9TSVpFLCAwLAorCQkJCQkJICAgICAgUEZOX1BIWVMobWF4X3Bmbl9tYXBwZWQp
KTsKIAlpZiAoIXJlbG9jYXRlZF9yYW1kaXNrKQogCQlwYW5pYygiQ2Fubm90IGZpbmQgcGxhY2Ug
Zm9yIG5ldyBSQU1ESVNLIG9mIHNpemUgJWxsZFxuIiwKIAkJICAgICAgcmFtZGlza19zaXplKTsK
IAotCS8qIE5vdGU6IHRoaXMgaW5jbHVkZXMgYWxsIHRoZSBtZW0gY3VycmVudGx5IG9jY3VwaWVk
IGJ5Ci0JICAgdGhlIGluaXRyZCwgd2UgcmVseSBvbiB0aGF0IGZhY3QgdG8ga2VlcCB0aGUgZGF0
YSBpbnRhY3QuICovCi0JbWVtYmxvY2tfcmVzZXJ2ZShyZWxvY2F0ZWRfcmFtZGlzaywgYXJlYV9z
aXplKTsKIAlpbml0cmRfc3RhcnQgPSByZWxvY2F0ZWRfcmFtZGlzayArIFBBR0VfT0ZGU0VUOwog
CWluaXRyZF9lbmQgICA9IGluaXRyZF9zdGFydCArIHJhbWRpc2tfc2l6ZTsKIAlwcmludGsoS0VS
Tl9JTkZPICJBbGxvY2F0ZWQgbmV3IFJBTURJU0s6IFttZW0gJSMwMTBsbHgtJSMwMTBsbHhdXG4i
LApAQCAtMjk5LDEzICsyOTUsMTMgQEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3Jlc2VydmVf
aW5pdHJkKHZvaWQpCiAKIAltZW1ibG9ja19yZXNlcnZlKHJhbWRpc2tfaW1hZ2UsIHJhbWRpc2tf
ZW5kIC0gcmFtZGlza19pbWFnZSk7CiB9CisKIHN0YXRpYyB2b2lkIF9faW5pdCByZXNlcnZlX2lu
aXRyZCh2b2lkKQogewogCS8qIEFzc3VtZSBvbmx5IGVuZCBpcyBub3QgcGFnZSBhbGlnbmVkICov
CiAJdTY0IHJhbWRpc2tfaW1hZ2UgPSBnZXRfcmFtZGlza19pbWFnZSgpOwogCXU2NCByYW1kaXNr
X3NpemUgID0gZ2V0X3JhbWRpc2tfc2l6ZSgpOwogCXU2NCByYW1kaXNrX2VuZCAgID0gUEFHRV9B
TElHTihyYW1kaXNrX2ltYWdlICsgcmFtZGlza19zaXplKTsKLQl1NjQgbWFwcGVkX3NpemU7CiAK
IAlpZiAoIWJvb3RfcGFyYW1zLmhkci50eXBlX29mX2xvYWRlciB8fAogCSAgICAhcmFtZGlza19p
bWFnZSB8fCAhcmFtZGlza19zaXplKQpAQCAtMzEzLDEyICszMDksNiBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgcmVzZXJ2ZV9pbml0cmQodm9pZCkKIAogCWluaXRyZF9zdGFydCA9IDA7CiAKLQltYXBw
ZWRfc2l6ZSA9IG1lbWJsb2NrX21lbV9zaXplKG1heF9wZm5fbWFwcGVkKTsKLQlpZiAocmFtZGlz
a19zaXplID49IChtYXBwZWRfc2l6ZT4+MSkpCi0JCXBhbmljKCJpbml0cmQgdG9vIGxhcmdlIHRv
IGhhbmRsZSwgIgotCQkgICAgICAgImRpc2FibGluZyBpbml0cmQgKCVsbGQgbmVlZGVkLCAlbGxk
IGF2YWlsYWJsZSlcbiIsCi0JCSAgICAgICByYW1kaXNrX3NpemUsIG1hcHBlZF9zaXplPj4xKTsK
LQogCXByaW50ayhLRVJOX0lORk8gIlJBTURJU0s6IFttZW0gJSMwMTBsbHgtJSMwMTBsbHhdXG4i
LCByYW1kaXNrX2ltYWdlLAogCQkJcmFtZGlza19lbmQgLSAxKTsKIAotLSAKMi4yNi4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
