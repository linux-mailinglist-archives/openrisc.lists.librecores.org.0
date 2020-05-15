Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3D11E503A
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3B9A020B6D;
	Wed, 27 May 2020 23:19:30 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2C15420B27
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=k6GtIYshQkzMKbjHn89HEgO/LyVVB61BpvX4N4bhIRg=; b=Z7u5T16oWlOT/9Iev8rQYxD8W/
 /9yBGyGeS+MvTGoamw7v3lUDy94JUDJw3KUm4iPonlQetJDBWIjD85m/EaBqmKGRaEsdX/uoA+xCZ
 /VN8LbxQ3vebJPxVwJJV5pmq1LijPBZDH0sK4h0ZLm3eNBf4RM/KxMhkDbCnabHiuOOcTKlCnZjuW
 Jb7lcqQDFItvKzlzkdNF/9ZFudDU5np1Q0avEFrvoQaIz97kqk1SEHuQ2WjdAufe1pfUSAjeAtDy6
 Y2icQP2EHvHf/7BJYI85Td0BuAv0FLlHc/FJOrN6RPtc9yVh1CE5wZpUSKIs9UOmEM/RNx65VJU25
 +l7Sw3SA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSx-0004j0-Pp; Fri, 15 May 2020 14:37:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:33 +0200
Message-Id: <20200515143646.3857579-17-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 16/29] powerpc: use asm-generic/cacheflush.h
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UG93ZXIgbmVlZHMgYWxtb3N0IG5vIGNhY2hlIGZsdXNoaW5nIHJvdXRpbmVzIG9mIGl0cyBvd24u
ICBSZWx5IG9uCmFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBmb3IgdGhlIGRlZmF1bHRzLgoKQWxz
byByZW1vdmUgdGhlIHBvaW50bGVzcyBfX0tFUk5FTF9fIGlmZGVmIHdoaWxlIHdlJ3JlIGF0IGl0
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDQyICsrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCmluZGV4IGU5MjE5MWIzOTBm
MzEuLmU2ODJjOGUxMGU5MDMgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9j
YWNoZWZsdXNoLmgKKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApA
QCAtNCwyMyArNCw5IEBACiAjaWZuZGVmIF9BU01fUE9XRVJQQ19DQUNIRUZMVVNIX0gKICNkZWZp
bmUgX0FTTV9QT1dFUlBDX0NBQ0hFRkxVU0hfSAogCi0jaWZkZWYgX19LRVJORUxfXwotCiAjaW5j
bHVkZSA8bGludXgvbW0uaD4KICNpbmNsdWRlIDxhc20vY3B1dGFibGUuaD4KIAotLyoKLSAqIE5v
IGNhY2hlIGZsdXNoaW5nIGlzIHJlcXVpcmVkIHdoZW4gYWRkcmVzcyBtYXBwaW5ncyBhcmUgY2hh
bmdlZCwKLSAqIGJlY2F1c2UgdGhlIGNhY2hlcyBvbiBQb3dlclBDcyBhcmUgcGh5c2ljYWxseSBh
ZGRyZXNzZWQuCi0gKi8KLSNkZWZpbmUgZmx1c2hfY2FjaGVfYWxsKCkJCQlkbyB7IH0gd2hpbGUg
KDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX21tKG1tKQkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZp
bmUgZmx1c2hfY2FjaGVfZHVwX21tKG1tKQkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1
c2hfY2FjaGVfcmFuZ2Uodm1hLCBzdGFydCwgZW5kKQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5l
IGZsdXNoX2NhY2hlX3BhZ2Uodm1hLCB2bWFkZHIsIHBmbikJZG8geyB9IHdoaWxlICgwKQotI2Rl
ZmluZSBmbHVzaF9pY2FjaGVfcGFnZSh2bWEsIHBhZ2UpCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVm
aW5lIGZsdXNoX2NhY2hlX3Z1bm1hcChzdGFydCwgZW5kKQkJZG8geyB9IHdoaWxlICgwKQotCiAj
aWZkZWYgQ09ORklHX1BQQ19CT09LM1NfNjQKIC8qCiAgKiBCb29rM3MgaGFzIG5vIHB0ZXN5bmMg
YWZ0ZXIgc2V0dGluZyBhIHB0ZSwgc28gd2l0aG91dCB0aGlzIHB0ZXN5bmMgaXQncwpAQCAtMzMs
MjAgKzE5LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92bWFwKHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQogewogCWFzbSB2b2xhdGlsZSgicHRlc3lu
YyIgOjo6ICJtZW1vcnkiKTsKIH0KLSNlbHNlCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2Fj
aGVfdm1hcCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkgeyB9Ci0jZW5k
aWYKKyNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcCBmbHVzaF9jYWNoZV92bWFwCisjZW5kaWYgLyog
Q09ORklHX1BQQ19CT09LM1NfNjQgKi8KIAogI2RlZmluZSBBUkNIX0lNUExFTUVOVFNfRkxVU0hf
RENBQ0hFX1BBR0UgMQogZXh0ZXJuIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpOwotI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF9sb2NrKG1hcHBpbmcpCQlkbyB7IH0g
d2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2RjYWNoZV9tbWFwX3VubG9jayhtYXBwaW5nKQlkbyB7
IH0gd2hpbGUgKDApCiAKIHZvaWQgZmx1c2hfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgc3RvcCk7Ci1leHRlcm4gdm9pZCBmbHVzaF9pY2FjaGVfdXNlcl9y
YW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCQkgICAgc3RydWN0IHBhZ2UgKnBh
Z2UsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJCQkgICAgaW50IGxlbik7Ci1leHRlcm4gdm9pZCBm
bHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOworI2RlZmluZSBmbHVz
aF9pY2FjaGVfcmFuZ2UgZmx1c2hfaWNhY2hlX3JhbmdlCisKK3ZvaWQgZmx1c2hfaWNhY2hlX3Vz
ZXJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBwYWdlICpwYWdlLAor
CQl1bnNpZ25lZCBsb25nIGFkZHIsIGludCBsZW4pOworI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNl
cl9yYW5nZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZQorCit2b2lkIGZsdXNoX2RjYWNoZV9pY2Fj
aGVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSk7CiB2b2lkIF9fZmx1c2hfZGNhY2hlX2ljYWNoZSh2
b2lkICpwYWdlKTsKIAogLyoqCkBAIC0xMTEsMTQgKzk3LDYgQEAgc3RhdGljIGlubGluZSB2b2lk
IGludmFsaWRhdGVfZGNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJbWIoKTsJLyog
c3luYyAqLwogfQogCi0jZGVmaW5lIGNvcHlfdG9fdXNlcl9wYWdlKHZtYSwgcGFnZSwgdmFkZHIs
IGRzdCwgc3JjLCBsZW4pIFwKLQlkbyB7IFwKLQkJbWVtY3B5KGRzdCwgc3JjLCBsZW4pOyBcCi0J
CWZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKHZtYSwgcGFnZSwgdmFkZHIsIGxlbik7IFwKLQl9IHdo
aWxlICgwKQotI2RlZmluZSBjb3B5X2Zyb21fdXNlcl9wYWdlKHZtYSwgcGFnZSwgdmFkZHIsIGRz
dCwgc3JjLCBsZW4pIFwKLQltZW1jcHkoZHN0LCBzcmMsIGxlbikKLQotI2VuZGlmIC8qIF9fS0VS
TkVMX18gKi8KKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmg+CiAKICNlbmRpZiAv
KiBfQVNNX1BPV0VSUENfQ0FDSEVGTFVTSF9IICovCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
