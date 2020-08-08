Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B050723F96B
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 01:07:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8EEAE20DBE;
	Sun,  9 Aug 2020 01:07:11 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id B153A20DB3
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 01:07:09 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id d19so2864147pgl.10
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 16:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+PYM2LWPubAwsecp2cm9Eg9qZYacd1EtMsG3lIYCHo=;
 b=tTIufmJ0TWMbd03xb8vnegxRX7bK+EaEleQwIcF1OSAOhCGoEhjxnNl3NeMEAatVKV
 AT14Tfkj9Sh8mHs9WSq4oKZF/urVFxOZKsNulnD3p8EKzyy4Lh/AkWTnCw9PBdLYhlMj
 rOgKwq6r9M1v9DM7fViMn4+QC/DpWWxQdxQosa2CCopnZYKw/Mwnp5cqnQ0uJUvmg72Z
 ZTK2vzs2THaJOFBdR38/KNjZfeI4QQaUsARbCsfOjN+S767We5MAWaIQKb5hWjA83v5O
 /apmaclkvqE5DpoAQpNLOodEZmbw0TmqPay5E3vMZFwNjJmERcAEDdks4mi7xuoiVgeL
 Pg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+PYM2LWPubAwsecp2cm9Eg9qZYacd1EtMsG3lIYCHo=;
 b=sIQa1hhwmA0JzZ5duDTjyMWilcEBL39lwVUMgqFb1osUmMV2Bdw/YWq/FIy0rTXdF8
 qY+90Ohi/WH5x+E2Ly+/0OtHCobzB/wRE9arXab1CZzLwoih5bB+yzmQBHZrrQR3qtyh
 +w7EJtSk0ELfppl/brNKPQlzWRdfk6qpsBilmeicF0kbomKJuyasFvdHEYotR4GTYCW+
 bReHZKLXeCTmo3uVgUwe94093wXIZrBYz9QNy+seX24Bt0CVTaM2oPRJuCrO1Xd2+v4R
 rwAdlRo/dVVNf8q5hispKb14UGb/vwnkFFlqvjAEYLs5murm6aIlfdQrPfRlvIrvgWHJ
 YiBA==
X-Gm-Message-State: AOAM531C/95tA5gBt2u65f83zlQ//ZHBPwQypTr6lzu3iHYXXf9QTrvI
 f7JzOY893Ed9Uk4ZpKEx6X4=
X-Google-Smtp-Source: ABdhPJzGYJUpa9rN7iaUH+qm57gmZJfvQVG0zFjfB6O5iv/opID3H8mIBoZdP0o0WBYzAeZ+fg3c+w==
X-Received: by 2002:a62:b417:: with SMTP id h23mr18259041pfn.118.1596928028346; 
 Sat, 08 Aug 2020 16:07:08 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id x7sm17623887pfc.209.2020.08.08.16.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 16:07:07 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  9 Aug 2020 08:06:44 +0900
Message-Id: <20200808230647.833047-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808230647.833047-1-shorne@gmail.com>
References: <20200808230647.833047-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 3/6] openrisc: uaccess: Use static inline
 function in access_ok
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QXMgc3VnZ2VzdGVkIGJ5IExpbnVzIHdoZW4gcmV2aWV3aW5nIGNvbW1pdCA5Y2IyZmViNGQyMWQK
KCJhcmNoL29wZW5yaXNjOiBGaXggaXNzdWVzIHdpdGggYWNjZXNzX29rKCkiKSBsYXN0IHllYXI7
IG1ha2luZwpfX3JhbmdlX29rIGFuIGlubGluZSBmdW5jdGlvbiBhbHNvIGZpeGVzIHRoZSB1c2Vk
IHR3aWNlIGlzc3VlIHRoYXQgdGhlCmNvbW1pdCB3YXMgZml4aW5nLiAgSSBhZ3JlZSBpdCdzIGEg
Z29vZCBjbGVhbnVwLiAgVGhpcyBwYXRjaCBhZGRyZXNzZXMKdGhhdCBhcyBJIGFtIGN1cnJlbnRs
eSB3b3JraW5nIG9uIHRoZSBhY2Nlc3Nfb2sgbWFjcm8gdG8gZml4dXAgc3BhcnNlCmFubm90YXRp
b25zIGluIE9wZW5SSVNDLgoKU3VnZ2VzdGVkLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9y
bmVAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMudmFub29z
dGVucnlja0BnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNz
LmggfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IGYyZmM1YzRi
ODhjMy4uNGI1OWRjOWFkMzAwIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3VhY2Nlc3MuaAorKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAt
NDgsMTYgKzQ4LDE5IEBACiAvKiBFbnN1cmUgdGhhdCB0aGUgcmFuZ2UgZnJvbSBhZGRyIHRvIGFk
ZHIrc2l6ZSBpcyBhbGwgd2l0aGluIHRoZSBwcm9jZXNzJwogICogYWRkcmVzcyBzcGFjZQogICov
Ci0jZGVmaW5lIF9fcmFuZ2Vfb2soYWRkciwgc2l6ZSkgKHNpemUgPD0gZ2V0X2ZzKCkgJiYgYWRk
ciA8PSAoZ2V0X2ZzKCktc2l6ZSkpCitzdGF0aWMgaW5saW5lIGludCBfX3JhbmdlX29rKHVuc2ln
bmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQoreworCWNvbnN0IG1tX3NlZ21lbnRf
dCBmcyA9IGdldF9mcygpOworCisJcmV0dXJuIHNpemUgPD0gZnMgJiYgYWRkciA8PSAoZnMgLSBz
aXplKTsKK30KIAogLyogRW5zdXJlIHRoYXQgYWRkciBpcyBiZWxvdyB0YXNrJ3MgYWRkcl9saW1p
dCAqLwogI2RlZmluZSBfX2FkZHJfb2soYWRkcikgKCh1bnNpZ25lZCBsb25nKSBhZGRyIDwgZ2V0
X2ZzKCkpCiAKICNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNpemUpCQkJCQkJXAogKHsgCQkJCQkJ
CQkJXAotCXVuc2lnbmVkIGxvbmcgX19hb19hZGRyID0gKHVuc2lnbmVkIGxvbmcpKGFkZHIpOwkJ
XAotCXVuc2lnbmVkIGxvbmcgX19hb19zaXplID0gKHVuc2lnbmVkIGxvbmcpKHNpemUpOwkJXAot
CV9fcmFuZ2Vfb2soX19hb19hZGRyLCBfX2FvX3NpemUpOwkJCQlcCisJX19yYW5nZV9vaygodW5z
aWduZWQgbG9uZykoYWRkciksIChzaXplKSk7CQkJXAogfSkKIAogLyoKLS0gCjIuMjYuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
