Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A62811C05DA
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:10:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DA83E205AD;
	Thu, 30 Apr 2020 21:09:43 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 46E7620ABB
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:15:50 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DF80218AC;
 Wed, 29 Apr 2020 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162549;
 bh=movcaCYQmWErjxqUSSd4ED/cqKNl686zQ1ECUHKKxxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N4HByPD+XpDJ1qEeVO54D6fSLPpj/aM5sw6H0ztwYr1TeTEpnvVJa1Q8JRFTggXkU
 LraoRDScz9Puz2NXmcQ4a0hCA/Cx4rAo/eeB8qPZN7lypbGmXL+mO2M1UBmjKdcgwU
 waKTNbpdJ7FhB0w9+TodAkv/U6zETDe8ricK0PXI=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:22 +0300
Message-Id: <20200429121126.17989-17-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 16/20] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
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
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGNvbW1pdCBmNDdh
YzA4OGM0MDYgKCJtbTogbWVtbWFwX2luaXQ6IGl0ZXJhdGUgb3ZlciBtZW1ibG9jayByZWdpb25z
CnJhdGhlciB0aGF0IGNoZWNrIGVhY2ggUEZOIikgbWFkZSBlYXJseV9wZm5faW5fbmlkKCkgb2Jz
b2xldGUgYW5kIHNpbmNlCkNPTkZJR19OT0RFU19TUEFOX09USEVSX05PREVTIGlzIG9ubHkgdXNl
ZCB0byBwaWNrIGEgc3R1YiBvciBhIHJlYWwKaW1wbGVtZW50YXRpb24gb2YgZWFybHlfcGZuX2lu
X25pZCgpIGl0IGlzIGFsc28gbm90IG5lZWRlZCBhbnltb3JlLgoKUmVtb3ZlIGJvdGggZWFybHlf
cGZuX2luX25pZCgpIGFuZCB0aGUgQ09ORklHX05PREVTX1NQQU5fT1RIRVJfTk9ERVMuCgpDby1k
ZXZlbG9wZWQtYnk6IEhvYW4gVHJhbiA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBIb2FuIFRyYW4gPEhvYW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gvcG93
ZXJwYy9LY29uZmlnIHwgIDkgLS0tLS0tLS0tCiBhcmNoL3NwYXJjL0tjb25maWcgICB8ICA5IC0t
LS0tLS0tLQogYXJjaC94ODYvS2NvbmZpZyAgICAgfCAgOSAtLS0tLS0tLS0KIG1tL3BhZ2VfYWxs
b2MuYyAgICAgIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bv
d2VycGMvS2NvbmZpZwppbmRleCA1Zjg2YjIyYjdkMmMuLjc0ZjMxNmRlZWFlMSAxMDA2NDQKLS0t
IGEvYXJjaC9wb3dlcnBjL0tjb25maWcKKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKQEAgLTY4
NSwxNSArNjg1LDYgQEAgY29uZmlnIEFSQ0hfTUVNT1JZX1BST0JFCiAJZGVmX2Jvb2wgeQogCWRl
cGVuZHMgb24gTUVNT1JZX0hPVFBMVUcKIAotIyBTb21lIE5VTUEgbm9kZXMgaGF2ZSBtZW1vcnkg
cmFuZ2VzIHRoYXQgc3BhbgotIyBvdGhlciBub2Rlcy4gIEV2ZW4gdGhvdWdoIGEgcGZuIGlzIHZh
bGlkIGFuZAotIyBiZXR3ZWVuIGEgbm9kZSdzIHN0YXJ0IGFuZCBlbmQgcGZucywgaXQgbWF5IG5v
dAotIyByZXNpZGUgb24gdGhhdCBub2RlLiAgU2VlIG1lbW1hcF9pbml0X3pvbmUoKQotIyBmb3Ig
ZGV0YWlscy4KLWNvbmZpZyBOT0RFU19TUEFOX09USEVSX05PREVTCi0JZGVmX2Jvb2wgeQotCWRl
cGVuZHMgb24gTkVFRF9NVUxUSVBMRV9OT0RFUwotCiBjb25maWcgU1REQklOVVRJTFMKIAlib29s
ICJVc2luZyBzdGFuZGFyZCBiaW51dGlscyBzZXR0aW5ncyIKIAlkZXBlbmRzIG9uIDQ0eApkaWZm
IC0tZ2l0IGEvYXJjaC9zcGFyYy9LY29uZmlnIGIvYXJjaC9zcGFyYy9LY29uZmlnCmluZGV4IDc5
NTIwNmI3YjU1Mi4uMGU0ZjM4OTFiOTA0IDEwMDY0NAotLS0gYS9hcmNoL3NwYXJjL0tjb25maWcK
KysrIGIvYXJjaC9zcGFyYy9LY29uZmlnCkBAIC0yODYsMTUgKzI4Niw2IEBAIGNvbmZpZyBOT0RF
U19TSElGVAogCSAgU3BlY2lmeSB0aGUgbWF4aW11bSBudW1iZXIgb2YgTlVNQSBOb2RlcyBhdmFp
bGFibGUgb24gdGhlIHRhcmdldAogCSAgc3lzdGVtLiAgSW5jcmVhc2VzIG1lbW9yeSByZXNlcnZl
ZCB0byBhY2NvbW1vZGF0ZSB2YXJpb3VzIHRhYmxlcy4KIAotIyBTb21lIE5VTUEgbm9kZXMgaGF2
ZSBtZW1vcnkgcmFuZ2VzIHRoYXQgc3BhbgotIyBvdGhlciBub2Rlcy4gIEV2ZW4gdGhvdWdoIGEg
cGZuIGlzIHZhbGlkIGFuZAotIyBiZXR3ZWVuIGEgbm9kZSdzIHN0YXJ0IGFuZCBlbmQgcGZucywg
aXQgbWF5IG5vdAotIyByZXNpZGUgb24gdGhhdCBub2RlLiAgU2VlIG1lbW1hcF9pbml0X3pvbmUo
KQotIyBmb3IgZGV0YWlscy4KLWNvbmZpZyBOT0RFU19TUEFOX09USEVSX05PREVTCi0JZGVmX2Jv
b2wgeQotCWRlcGVuZHMgb24gTkVFRF9NVUxUSVBMRV9OT0RFUwotCiBjb25maWcgQVJDSF9TUEFS
U0VNRU1fRU5BQkxFCiAJZGVmX2Jvb2wgeSBpZiBTUEFSQzY0CiAJc2VsZWN0IFNQQVJTRU1FTV9W
TUVNTUFQX0VOQUJMRQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tj
b25maWcKaW5kZXggZjhiZjIxOGExNjljLi4xZWMyYTVlMmZlZjYgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L0tjb25maWcKKysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtMTU4MSwxNSArMTU4MSw2IEBA
IGNvbmZpZyBYODZfNjRfQUNQSV9OVU1BCiAJLS0taGVscC0tLQogCSAgRW5hYmxlIEFDUEkgU1JB
VCBiYXNlZCBub2RlIHRvcG9sb2d5IGRldGVjdGlvbi4KIAotIyBTb21lIE5VTUEgbm9kZXMgaGF2
ZSBtZW1vcnkgcmFuZ2VzIHRoYXQgc3BhbgotIyBvdGhlciBub2Rlcy4gIEV2ZW4gdGhvdWdoIGEg
cGZuIGlzIHZhbGlkIGFuZAotIyBiZXR3ZWVuIGEgbm9kZSdzIHN0YXJ0IGFuZCBlbmQgcGZucywg
aXQgbWF5IG5vdAotIyByZXNpZGUgb24gdGhhdCBub2RlLiAgU2VlIG1lbW1hcF9pbml0X3pvbmUo
KQotIyBmb3IgZGV0YWlscy4KLWNvbmZpZyBOT0RFU19TUEFOX09USEVSX05PREVTCi0JZGVmX2Jv
b2wgeQotCWRlcGVuZHMgb24gWDg2XzY0X0FDUElfTlVNQQotCiBjb25maWcgTlVNQV9FTVUKIAli
b29sICJOVU1BIGVtdWxhdGlvbiIKIAlkZXBlbmRzIG9uIE5VTUEKZGlmZiAtLWdpdCBhL21tL3Bh
Z2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCA4ZDExMmRlZmFlYWQuLmQzNWNhMDk5
NmEwOSAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5jCisrKyBiL21tL3BhZ2VfYWxsb2MuYwpA
QCAtMTU0MSwyNiArMTU0MSw2IEBAIGludCBfX21lbWluaXQgZWFybHlfcGZuX3RvX25pZCh1bnNp
Z25lZCBsb25nIHBmbikKIH0KICNlbmRpZiAvKiBDT05GSUdfTkVFRF9NVUxUSVBMRV9OT0RFUyAq
LwogCi0jaWZkZWYgQ09ORklHX05PREVTX1NQQU5fT1RIRVJfTk9ERVMKLS8qIE9ubHkgc2FmZSB0
byB1c2UgZWFybHkgaW4gYm9vdCB3aGVuIGluaXRpYWxpc2F0aW9uIGlzIHNpbmdsZS10aHJlYWRl
ZCAqLwotc3RhdGljIGlubGluZSBib29sIF9fbWVtaW5pdCBlYXJseV9wZm5faW5fbmlkKHVuc2ln
bmVkIGxvbmcgcGZuLCBpbnQgbm9kZSkKLXsKLQlpbnQgbmlkOwotCi0JbmlkID0gX19lYXJseV9w
Zm5fdG9fbmlkKHBmbiwgJmVhcmx5X3Bmbm5pZF9jYWNoZSk7Ci0JaWYgKG5pZCA+PSAwICYmIG5p
ZCAhPSBub2RlKQotCQlyZXR1cm4gZmFsc2U7Ci0JcmV0dXJuIHRydWU7Ci19Ci0KLSNlbHNlCi1z
dGF0aWMgaW5saW5lIGJvb2wgX19tZW1pbml0IGVhcmx5X3Bmbl9pbl9uaWQodW5zaWduZWQgbG9u
ZyBwZm4sIGludCBub2RlKQotewotCXJldHVybiB0cnVlOwotfQotI2VuZGlmCi0KLQogdm9pZCBf
X2luaXQgbWVtYmxvY2tfZnJlZV9wYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9u
ZyBwZm4sCiAJCQkJCQkJdW5zaWduZWQgaW50IG9yZGVyKQogewotLSAKMi4yNi4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
