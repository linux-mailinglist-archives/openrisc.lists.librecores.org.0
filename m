Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 231A21E503B
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:31 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D805C20CAF;
	Wed, 27 May 2020 23:19:30 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 37C2120B31
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QKVIgxxqArZPDCcD+fcp72AY7pKZ1eMD6jkvekw50ps=; b=U00g7SVm+r79wulCB6FTYGkw2R
 mRjWYIYyV0s9ydUNfDN6K5qNd19C5wPzcyqdvTfWLUuzKDBgaFjA/j7PIE3Ik9Qv4BLdMp9S+ecqJ
 wMjUpwQRFD9dvbDYMKody/broi5k1VZaOWbhSNaKaizd07PkJ0djmXfFeF1Qw6hZ9Dpy4FCKopPYu
 S/j9yHKeykn1OL0HU8wHBaV3EeyvT+n3ZvhzUx/KerOOi3kKY3R5FABp9POlwEC1ZNmy5ofW5/u9+
 boVRGb5d7zr5S1XbTEie4sTFM2c2oZ3FyuZcpdA8JPIL+Jq94iMkKr0MrCpW5jDPc+pqijaaTfwZv
 bsQqw1XA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbT3-0004oj-R3; Fri, 15 May 2020 14:37:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:35 +0200
Message-Id: <20200515143646.3857579-19-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 18/29] arm, sparc,
 unicore32: remove flush_icache_user_range
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

Zmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgaXMgb25seSB1c2VkIGJ5IDxhc20tZ2VuZXJpYy9jYWNo
ZWZsdXNoLmg+LCBzbwpyZW1vdmUgaXQgZnJvbSB0aGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGltcGxl
bWVudCBpdCwgYnV0IGRvbid0IHVzZQo8YXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oPi4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2NhY2hlZmx1c2guaCAgICAgICB8IDMgLS0tCiBhcmNoL3NwYXJjL2luY2x1ZGUv
YXNtL2NhY2hlZmx1c2hfMzIuaCAgfCAyIC0tCiBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2hfNjQuaCAgfCAxIC0KIGFyY2gvdW5pY29yZTMyL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2gu
aCB8IDMgLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20v
Y2FjaGVmbHVzaC5oCmluZGV4IDcxMTRiOWFhNDZiODcuLmM3OGUxNGZjZmI1ZGYgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAorKysgYi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgKQEAgLTMxOCw5ICszMTgsNiBAQCBleHRlcm4gdm9pZCBmbHVz
aF9rZXJuZWxfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKik7CiAjZGVmaW5lIGZsdXNoX2RjYWNo
ZV9tbWFwX2xvY2sobWFwcGluZykJCXhhX2xvY2tfaXJxKCZtYXBwaW5nLT5pX3BhZ2VzKQogI2Rl
ZmluZSBmbHVzaF9kY2FjaGVfbW1hcF91bmxvY2sobWFwcGluZykJeGFfdW5sb2NrX2lycSgmbWFw
cGluZy0+aV9wYWdlcykKIAotI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEscGFn
ZSxhZGRyLGxlbikgXAotCWZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpCi0KIC8qCiAgKiBXZSBkb24n
dCBhcHBlYXIgdG8gbmVlZCB0byBkbyBhbnl0aGluZyBoZXJlLiAgSW4gZmFjdCwgaWYgd2UgZGlk
LCB3ZSdkCiAgKiBkdXBsaWNhdGUgY2FjaGUgZmx1c2hpbmcgZWxzZXdoZXJlIHBlcmZvcm1lZCBi
eSBmbHVzaF9kY2FjaGVfcGFnZSgpLgpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoXzMyLmggYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hfMzIu
aAppbmRleCBmYjY2MDk0YTJjMzBjLi40MWM2ZDczNGE0NzQxIDEwMDY0NAotLS0gYS9hcmNoL3Nw
YXJjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hfMzIuaAorKysgYi9hcmNoL3NwYXJjL2luY2x1ZGUv
YXNtL2NhY2hlZmx1c2hfMzIuaApAQCAtMTcsOCArMTcsNiBAQAogI2RlZmluZSBmbHVzaF9pY2Fj
aGVfcmFuZ2Uoc3RhcnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAoMCkKICNkZWZpbmUgZmx1c2hfaWNh
Y2hlX3BhZ2Uodm1hLCBwZykJCWRvIHsgfSB3aGlsZSAoMCkKIAotI2RlZmluZSBmbHVzaF9pY2Fj
aGVfdXNlcl9yYW5nZSh2bWEscGcsYWRyLGxlbikJZG8geyB9IHdoaWxlICgwKQotCiAjZGVmaW5l
IGNvcHlfdG9fdXNlcl9wYWdlKHZtYSwgcGFnZSwgdmFkZHIsIGRzdCwgc3JjLCBsZW4pIFwKIAlk
byB7CQkJCQkJCVwKIAkJZmx1c2hfY2FjaGVfcGFnZSh2bWEsIHZhZGRyLCBwYWdlX3RvX3Bmbihw
YWdlKSk7XApkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoXzY0
LmggYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hfNjQuaAppbmRleCBlNzUxNzQz
NGQxZmE2Li5iOTM0MTgzNjU5N2VjIDEwMDY0NAotLS0gYS9hcmNoL3NwYXJjL2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2hfNjQuaAorKysgYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hf
NjQuaApAQCAtNDksNyArNDksNiBAQCB2b2lkIF9fZmx1c2hfZGNhY2hlX3JhbmdlKHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uo
c3RydWN0IHBhZ2UgKnBhZ2UpOwogCiAjZGVmaW5lIGZsdXNoX2ljYWNoZV9wYWdlKHZtYSwgcGcp
CWRvIHsgfSB3aGlsZSgwKQotI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEscGcs
YWRyLGxlbikJZG8geyB9IHdoaWxlICgwKQogCiB2b2lkIGZsdXNoX3B0cmFjZV9hY2Nlc3Moc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICosIHN0cnVjdCBwYWdlICosCiAJCQkgdW5zaWduZWQgbG9uZyB1
YWRkciwgdm9pZCAqa2FkZHIsCmRpZmYgLS1naXQgYS9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmggYi9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgK
aW5kZXggOTM5M2NhNDA0N2U5My4uZmYwYmU5MmViYzMyMCAxMDA2NDQKLS0tIGEvYXJjaC91bmlj
b3JlMzIvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCisrKyBiL2FyY2gvdW5pY29yZTMyL2luY2x1
ZGUvYXNtL2NhY2hlZmx1c2guaApAQCAtMTYyLDkgKzE2Miw2IEBAIGV4dGVybiB2b2lkIGZsdXNo
X2RjYWNoZV9wYWdlKHN0cnVjdCBwYWdlICopOwogI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF9s
b2NrKG1hcHBpbmcpCQlkbyB7IH0gd2hpbGUgKDApCiAjZGVmaW5lIGZsdXNoX2RjYWNoZV9tbWFw
X3VubG9jayhtYXBwaW5nKQlkbyB7IH0gd2hpbGUgKDApCiAKLSNkZWZpbmUgZmx1c2hfaWNhY2hl
X3VzZXJfcmFuZ2Uodm1hLCBwYWdlLCBhZGRyLCBsZW4pCVwKLQlmbHVzaF9kY2FjaGVfcGFnZShw
YWdlKQotCiAvKgogICogV2UgZG9uJ3QgYXBwZWFyIHRvIG5lZWQgdG8gZG8gYW55dGhpbmcgaGVy
ZS4gIEluIGZhY3QsIGlmIHdlIGRpZCwgd2UnZAogICogZHVwbGljYXRlIGNhY2hlIGZsdXNoaW5n
IGVsc2V3aGVyZSBwZXJmb3JtZWQgYnkgZmx1c2hfZGNhY2hlX3BhZ2UoKS4KLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
