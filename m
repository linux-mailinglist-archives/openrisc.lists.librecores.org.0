Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CEDE223F969
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 01:07:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 659BA20DB8;
	Sun,  9 Aug 2020 01:07:07 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id EA75120DB0
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 01:07:05 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id p3so2880807pgh.3
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 16:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yp0yxUA9Qr5sfN9dJnZ4FZ8o2dyuV6wPYjNmelJkcMo=;
 b=iF9WF3wGU+2/gWAr8dnN9renOmkqTc4zq3LZ5XLVP10CXyaGqO/KxePCis+hRy4hc+
 fz/SbbuRUrKdrxTG/KIuv4IiwcEuwwUxWpkWFLY2IpSfErWITs5aJuGs2QbIa46I6yRg
 qGb9r+f7JoxU55BRk/Mw/GcdQ2Nmp3kaNTv0A/iFIqKlgoyLNqmN0aftAJEaRWrPkwBr
 IoXOxzSkwQgFfK8RfpVKDw+2pBP0h/pN8+KUjJOKQ9HopXhVwvdx+prkBGYBkX+WMImY
 CISWu6uFdL8ZsMPh7Idj4tnSe168WI03aw3wSeYfqim0rjeObINfpGYuCrEd6su+s+ay
 bH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yp0yxUA9Qr5sfN9dJnZ4FZ8o2dyuV6wPYjNmelJkcMo=;
 b=iJzLT5InsqCtna2/738+8ezjO7UA1tyIHyX86Ku+PSNRaX/g93wb3jF7FYpgkHp15m
 mRK3Fp17KCK5eaRmN8E7KNNkPw1EIiqF2oS9KEkq6TKEiQg6gnOP86YjSH61iLsj3Wqo
 JVK0O9tlkcoqNeiy3aJFLS51BWPn3DRp/GlHHgG+LTc1lO7GkW2D3KnTJYHQqDAzzSLc
 ztYXOsy5Y7lEbIWqGMXWIVm5Z7VyiRx+n6ovDt6NsCPuneRXraEezhSvGqAqLgXelLzl
 84MCWKyI98iPJRHGM3QdZxlmy4r4VQRb1J2XmXXi2hSBZAhQSp7rZcb2nMBBrqoXJUNf
 dQdg==
X-Gm-Message-State: AOAM531watABkxKirF/MrOoIDvaVffTAcskRECvLXo3lfFxsR2pvtlIH
 vMpKRzOxH91RUzkgxSm7OJo=
X-Google-Smtp-Source: ABdhPJxvMhp5c76/vMVB3aaIKE6ijLz+owCcy0I5Lr2AhsCmPmt4yeJBZjtck9mFAC/bZlIlb/dj2A==
X-Received: by 2002:aa7:9219:: with SMTP id 25mr19490136pfo.4.1596928024575;
 Sat, 08 Aug 2020 16:07:04 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id m62sm16305354pje.18.2020.08.08.16.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 16:07:03 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  9 Aug 2020 08:06:43 +0900
Message-Id: <20200808230647.833047-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808230647.833047-1-shorne@gmail.com>
References: <20200808230647.833047-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 2/6] openrisc: uaccess: Fix sparse address
 space warnings
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
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIE9wZW5SSVNDIHVzZXIgYWNjZXNzIGZ1bmN0aW9ucyBwdXRfdXNlcigpLCBnZXRfdXNlcigp
IGFuZApjbGVhcl91c2VyKCkgd2VyZSBtaXNzaW5nIHByb3BlciBzcGFyc2UgYW5ub3RhdGlvbnMu
ICBUaGlzIGdlbmVyYXRlZAp3YXJuaW5ncyBsaWtlIHRoZSBiZWxvdy4KClRoaXMgcGF0Y2ggYWRk
cyB0aGUgYW5ub3RhdGlvbnMgdG8gZml4IHRoZSB3YXJuaW5ncy4KCkV4YW1wbGUgd2FybmluZ3M6
CgpuZXQvaXB2NC9pcF9zb2NrZ2x1ZS5jOjc1OToyOTogd2FybmluZzogaW5jb3JyZWN0IHR5cGUg
aW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQpuZXQvaXB2NC9pcF9zb2Nr
Z2x1ZS5jOjc1OToyOTogICAgZXhwZWN0ZWQgdm9pZCBjb25zdCB2b2xhdGlsZSBbbm9kZXJlZl0g
X191c2VyICoKbmV0L2lwdjQvaXBfc29ja2dsdWUuYzo3NTk6Mjk6ICAgIGdvdCBpbnQgY29uc3Qg
Kl9fZ3VfYWRkcgpuZXQvaXB2NC9pcF9zb2NrZ2x1ZS5jOjc2NDoyOTogd2FybmluZzogaW5jb3Jy
ZWN0IHR5cGUgaW4gaW5pdGlhbGl6ZXIgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykKbmV0L2lw
djQvaXBfc29ja2dsdWUuYzo3NjQ6Mjk6ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGNoYXIgY29uc3Qg
Kl9fZ3VfYWRkcgpuZXQvaXB2NC9pcF9zb2NrZ2x1ZS5jOjc2NDoyOTogICAgZ290IHVuc2lnbmVk
IGNoYXIgW25vZGVyZWZdIF9fdXNlciAqCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8
c2hvcm5lQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEx1YyBWYW4gT29zdGVucnljayA8bHVjLnZh
bm9vc3RlbnJ5Y2tAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IDQ2ZTMxYmI0
YTlhZC4uZjJmYzVjNGI4OGMzIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3VhY2Nlc3MuaAorKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAt
MTAwLDcgKzEwMCw3IEBAIGV4dGVybiBsb25nIF9fcHV0X3VzZXJfYmFkKHZvaWQpOwogI2RlZmlu
ZSBfX3B1dF91c2VyX2NoZWNrKHgsIHB0ciwgc2l6ZSkJCQkJCVwKICh7CQkJCQkJCQkJXAogCWxv
bmcgX19wdV9lcnIgPSAtRUZBVUxUOwkJCQkJXAotCV9fdHlwZW9mX18oKihwdHIpKSAqX19wdV9h
ZGRyID0gKHB0cik7CQkJCVwKKwlfX3R5cGVvZl9fKCoocHRyKSkgX191c2VyICpfX3B1X2FkZHIg
PSAocHRyKTsJCQlcCiAJaWYgKGFjY2Vzc19vayhfX3B1X2FkZHIsIHNpemUpKQkJCVwKIAkJX19w
dXRfdXNlcl9zaXplKCh4KSwgX19wdV9hZGRyLCAoc2l6ZSksIF9fcHVfZXJyKTsJXAogCV9fcHVf
ZXJyOwkJCQkJCQlcCkBAIC0xNzMsNyArMTczLDcgQEAgc3RydWN0IF9fbGFyZ2Vfc3RydWN0IHsK
ICNkZWZpbmUgX19nZXRfdXNlcl9jaGVjayh4LCBwdHIsIHNpemUpCQkJCQlcCiAoewkJCQkJCQkJ
CVwKIAlsb25nIF9fZ3VfZXJyID0gLUVGQVVMVCwgX19ndV92YWwgPSAwOwkJCQlcCi0JY29uc3Qg
X190eXBlb2ZfXygqKHB0cikpICogX19ndV9hZGRyID0gKHB0cik7CQkJXAorCWNvbnN0IF9fdHlw
ZW9mX18oKihwdHIpKSBfX3VzZXIgKl9fZ3VfYWRkciA9IChwdHIpOwkJXAogCWlmIChhY2Nlc3Nf
b2soX19ndV9hZGRyLCBzaXplKSkJCQlcCiAJCV9fZ2V0X3VzZXJfc2l6ZShfX2d1X3ZhbCwgX19n
dV9hZGRyLCAoc2l6ZSksIF9fZ3VfZXJyKTsJXAogCSh4KSA9IChfX2ZvcmNlIF9fdHlwZW9mX18o
KihwdHIpKSlfX2d1X3ZhbDsJCQlcCkBAIC0yNDgsMTAgKzI0OCwxMCBAQCByYXdfY29weV90b191
c2VyKHZvaWQgX191c2VyICp0bywgY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbG9uZyBzaXpl
KQogI2RlZmluZSBJTkxJTkVfQ09QWV9GUk9NX1VTRVIKICNkZWZpbmUgSU5MSU5FX0NPUFlfVE9f
VVNFUgogCi1leHRlcm4gdW5zaWduZWQgbG9uZyBfX2NsZWFyX3VzZXIodm9pZCAqYWRkciwgdW5z
aWduZWQgbG9uZyBzaXplKTsKK2V4dGVybiB1bnNpZ25lZCBsb25nIF9fY2xlYXJfdXNlcih2b2lk
IF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKIAogc3RhdGljIGlubGluZSBfX211
c3RfY2hlY2sgdW5zaWduZWQgbG9uZwotY2xlYXJfdXNlcih2b2lkICphZGRyLCB1bnNpZ25lZCBs
b25nIHNpemUpCitjbGVhcl91c2VyKHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNp
emUpCiB7CiAJaWYgKGxpa2VseShhY2Nlc3Nfb2soYWRkciwgc2l6ZSkpKQogCQlzaXplID0gX19j
bGVhcl91c2VyKGFkZHIsIHNpemUpOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
