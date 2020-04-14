Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 143991B20BD
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D781720AE3;
	Tue, 21 Apr 2020 10:02:02 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CCB4920A76
 for <openrisc@lists.librecores.org>; Tue, 14 Apr 2020 17:36:47 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B6B42076D;
 Tue, 14 Apr 2020 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878606;
 bh=fvLukdwkQTHO+51q3DGLoikuRIRMlioJ2DyvNE+LsyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EsjR1/Yifkflit9+eKwFZLCCJFB8DergOAGiV4wfeGmM/V7L4EnrXxVxok0npwk6h
 WiBKvp5y1ti7RWPhFlbhCg0/KvxW5loI8ag/8FCL6WW1nK8DMZtzMhuoVRHVMUmF6W
 Av3cMdSJVEJr8PZ+JmDhYERiuyxHsfJxjLsfIVRk=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 18:34:51 +0300
Message-Id: <20200414153455.21744-11-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH v4 10/14] sh: drop __pXd_offset() macros that
 duplicate pXd_index() ones
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIF9fcFhkX29mZnNl
dCgpIG1hY3JvcyBhcmUgaWRlbnRpY2FsIHRvIHRoZSBwWGRfaW5kZXgoKSBtYWNyb3MgYW5kIHRo
ZXJlCmlzIG5vIHBvaW50IHRvIGtlZXAgYm90aCBvZiB0aGVtLiBBbGwgYXJjaGl0ZWN0dXJlcyBk
ZWZpbmUgYW5kIHVzZQpwWGRfaW5kZXgoKSBzbyBsZXQncyBrZWVwIG9ubHkgdGhvc2UgdG8gbWFr
ZSBtaXBzIGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdApvZiB0aGUga2VybmVsLgoKU2lnbmVkLW9m
Zi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gvc2gvaW5j
bHVkZS9hc20vcGd0YWJsZV8zMi5oIHwgNSArKy0tLQogYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3Rh
YmxlXzY0LmggfCA1ICsrLS0tCiBhcmNoL3NoL21tL2luaXQuYyAgICAgICAgICAgICAgICB8IDYg
KysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3NoL2luY2x1ZGUvYXNtL3BndGFibGVfMzIuaCBiL2FyY2gvc2gv
aW5jbHVkZS9hc20vcGd0YWJsZV8zMi5oCmluZGV4IDI5Mjc0ZjBlNDI4ZS4uNGFjY2U1ZjJjYmY5
IDEwMDY0NAotLS0gYS9hcmNoL3NoL2luY2x1ZGUvYXNtL3BndGFibGVfMzIuaAorKysgYi9hcmNo
L3NoL2luY2x1ZGUvYXNtL3BndGFibGVfMzIuaApAQCAtNDA3LDEzICs0MDcsMTIgQEAgc3RhdGlj
IGlubGluZSBwdGVfdCBwdGVfbW9kaWZ5KHB0ZV90IHB0ZSwgcGdwcm90X3QgbmV3cHJvdCkKIC8q
IHRvIGZpbmQgYW4gZW50cnkgaW4gYSBwYWdlLXRhYmxlLWRpcmVjdG9yeS4gKi8KICNkZWZpbmUg
cGdkX2luZGV4KGFkZHJlc3MpCSgoKGFkZHJlc3MpID4+IFBHRElSX1NISUZUKSAmIChQVFJTX1BF
Ul9QR0QtMSkpCiAjZGVmaW5lIHBnZF9vZmZzZXQobW0sIGFkZHJlc3MpCSgobW0pLT5wZ2QgKyBw
Z2RfaW5kZXgoYWRkcmVzcykpCi0jZGVmaW5lIF9fcGdkX29mZnNldChhZGRyZXNzKQlwZ2RfaW5k
ZXgoYWRkcmVzcykKIAogLyogdG8gZmluZCBhbiBlbnRyeSBpbiBhIGtlcm5lbCBwYWdlLXRhYmxl
LWRpcmVjdG9yeSAqLwogI2RlZmluZSBwZ2Rfb2Zmc2V0X2soYWRkcmVzcykJcGdkX29mZnNldCgm
aW5pdF9tbSwgYWRkcmVzcykKIAotI2RlZmluZSBfX3B1ZF9vZmZzZXQoYWRkcmVzcykJKCgoYWRk
cmVzcykgPj4gUFVEX1NISUZUKSAmIChQVFJTX1BFUl9QVUQtMSkpCi0jZGVmaW5lIF9fcG1kX29m
ZnNldChhZGRyZXNzKQkoKChhZGRyZXNzKSA+PiBQTURfU0hJRlQpICYgKFBUUlNfUEVSX1BNRC0x
KSkKKyNkZWZpbmUgcHVkX2luZGV4KGFkZHJlc3MpCSgoKGFkZHJlc3MpID4+IFBVRF9TSElGVCkg
JiAoUFRSU19QRVJfUFVELTEpKQorI2RlZmluZSBwbWRfaW5kZXgoYWRkcmVzcykJKCgoYWRkcmVz
cykgPj4gUE1EX1NISUZUKSAmIChQVFJTX1BFUl9QTUQtMSkpCiAKIC8qIEZpbmQgYW4gZW50cnkg
aW4gdGhlIHRoaXJkLWxldmVsIHBhZ2UgdGFibGUuLiAqLwogI2RlZmluZSBwdGVfaW5kZXgoYWRk
cmVzcykJKChhZGRyZXNzID4+IFBBR0VfU0hJRlQpICYgKFBUUlNfUEVSX1BURSAtIDEpKQpkaWZm
IC0tZ2l0IGEvYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3RhYmxlXzY0LmggYi9hcmNoL3NoL2luY2x1
ZGUvYXNtL3BndGFibGVfNjQuaAppbmRleCAxNzc4YmM1OTcxZTcuLjI3Y2MyODJlYzZjMCAxMDA2
NDQKLS0tIGEvYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3RhYmxlXzY0LmgKKysrIGIvYXJjaC9zaC9p
bmNsdWRlL2FzbS9wZ3RhYmxlXzY0LmgKQEAgLTQ2LDE0ICs0NiwxMyBAQCBzdGF0aWMgX19pbmxp
bmVfXyB2b2lkIHNldF9wdGUocHRlX3QgKnB0ZXB0ciwgcHRlX3QgcHRldmFsKQogCiAvKiBUbyBm
aW5kIGFuIGVudHJ5IGluIGEgZ2VuZXJpYyBQR0QuICovCiAjZGVmaW5lIHBnZF9pbmRleChhZGRy
ZXNzKSAoKChhZGRyZXNzKSA+PiBQR0RJUl9TSElGVCkgJiAoUFRSU19QRVJfUEdELTEpKQotI2Rl
ZmluZSBfX3BnZF9vZmZzZXQoYWRkcmVzcykgcGdkX2luZGV4KGFkZHJlc3MpCiAjZGVmaW5lIHBn
ZF9vZmZzZXQobW0sIGFkZHJlc3MpICgobW0pLT5wZ2QrcGdkX2luZGV4KGFkZHJlc3MpKQogCiAv
KiBUbyBmaW5kIGFuIGVudHJ5IGluIGEga2VybmVsIFBHRC4gKi8KICNkZWZpbmUgcGdkX29mZnNl
dF9rKGFkZHJlc3MpIHBnZF9vZmZzZXQoJmluaXRfbW0sIGFkZHJlc3MpCiAKLSNkZWZpbmUgX19w
dWRfb2Zmc2V0KGFkZHJlc3MpCSgoKGFkZHJlc3MpID4+IFBVRF9TSElGVCkgJiAoUFRSU19QRVJf
UFVELTEpKQotI2RlZmluZSBfX3BtZF9vZmZzZXQoYWRkcmVzcykJKCgoYWRkcmVzcykgPj4gUE1E
X1NISUZUKSAmIChQVFJTX1BFUl9QTUQtMSkpCisjZGVmaW5lIHB1ZF9pbmRleChhZGRyZXNzKQko
KChhZGRyZXNzKSA+PiBQVURfU0hJRlQpICYgKFBUUlNfUEVSX1BVRC0xKSkKKy8qICNkZWZpbmUg
cG1kX2luZGV4KGFkZHJlc3MpCSgoKGFkZHJlc3MpID4+IFBNRF9TSElGVCkgJiAoUFRSU19QRVJf
UE1ELTEpKSAqLwogCiAvKgogICogUE1EIGxldmVsIGFjY2VzcyByb3V0aW5lcy4gU2FtZSBub3Rl
cyBhcyBhYm92ZS4KZGlmZiAtLWdpdCBhL2FyY2gvc2gvbW0vaW5pdC5jIGIvYXJjaC9zaC9tbS9p
bml0LmMKaW5kZXggYjlkZTJkNGZhNTdlLi5mNDQ1YmE2MzA3OTAgMTAwNjQ0Ci0tLSBhL2FyY2gv
c2gvbW0vaW5pdC5jCisrKyBiL2FyY2gvc2gvbW0vaW5pdC5jCkBAIC0xNzIsOSArMTcyLDkgQEAg
dm9pZCBfX2luaXQgcGFnZV90YWJsZV9yYW5nZV9pbml0KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgZW5kLAogCXVuc2lnbmVkIGxvbmcgdmFkZHI7CiAKIAl2YWRkciA9IHN0YXJ0
OwotCWkgPSBfX3BnZF9vZmZzZXQodmFkZHIpOwotCWogPSBfX3B1ZF9vZmZzZXQodmFkZHIpOwot
CWsgPSBfX3BtZF9vZmZzZXQodmFkZHIpOworCWkgPSBwZ2RfaW5kZXgodmFkZHIpOworCWogPSBw
dWRfaW5kZXgodmFkZHIpOworCWsgPSBwbWRfaW5kZXgodmFkZHIpOwogCXBnZCA9IHBnZF9iYXNl
ICsgaTsKIAogCWZvciAoIDsgKGkgPCBQVFJTX1BFUl9QR0QpICYmICh2YWRkciAhPSBlbmQpOyBw
Z2QrKywgaSsrKSB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
