Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CA36523D365
	for <lists+openrisc@lfdr.de>; Wed,  5 Aug 2020 23:07:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8CB4120DA7;
	Wed,  5 Aug 2020 23:07:50 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id DD80520DA7
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 23:07:48 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id d19so1822789pgl.10
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JngFG1EkTLo4BpqZhiJxszD1gfeCHHSLXHsexflvscw=;
 b=vRb0olEwiG/Js2ATUV13Bc/LTdwpm5CDHz0zYOPPXDLQ7Nd+qHyAa2GNpcnvVFvCwh
 zUn6tWgcq7MtGMGxTBijDbj7cOnmaXfMLjJv5w9aOPiWUMZJ04uVmAt/29a5NeREZ6aT
 5CcQZH7GaRdkWqAZrHcIwWvOj1IlAOY6o7z8ogXdRR1Cyfd3MemzUNbQwAeC2iOHWiD4
 xEbuKeb1NNf81yh7lA5Hfx1ahP1mrXodr5M2cRLSxalt2PT7dpib/hjSQg49a1ld0WK1
 UeX+PeRcNGT9xJlRZj60iowG5bllUdEaBg4fb9Lx5YY/r9tsBfnp96pISz/h1LNbo97K
 hG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JngFG1EkTLo4BpqZhiJxszD1gfeCHHSLXHsexflvscw=;
 b=ZEVvCUwuTAgdSPqUU3qMG/GTBjsDafGxc8JrBtIkNOUu9F9cIMR23GmxnA5OXMKX+a
 udzrG9xjV7p/jis9SJTPoC6B0gE7TmrbCWqRwzyh/FJ9pV7Xi+/a1WReNiVMY6AL8mpX
 m25DzRRkuJhkqfGMm8AWaFAdlX+z8ke+0h23AXpTXxhaonrcmkh23zEq01xraXsAjphY
 5+XCEJYE1X6aoAaUWi3d8jFkki0eSng9VsVkNn4xB5mdjl6RW/LymfLHj6mRBYWJMaVd
 aRE51ixbGUs4YcwR4NTkq49X+OaQIDw03bg3VjXxtrdE2HvUFjC9QLuWS/sdq9OsERGW
 NjtA==
X-Gm-Message-State: AOAM531NPZJP0iQZJTgfHtnTFmsTBQlO6ogbVMMCGJr3nZZ+bwDfwRzs
 6gl2wIrh1NKkeW5h3HrGspk=
X-Google-Smtp-Source: ABdhPJzyd4xGR6WgmMUFF1ie18j6wvBJNgLAcJlDGUbsxYG8G6RlHGUDfeW0V3dxac/VrOa+Y/uhtA==
X-Received: by 2002:a65:4c4e:: with SMTP id l14mr3570458pgr.200.1596661666883; 
 Wed, 05 Aug 2020 14:07:46 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id x18sm4382508pfc.93.2020.08.05.14.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 14:07:46 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  6 Aug 2020 06:07:21 +0900
Message-Id: <20200805210725.310301-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805210725.310301-1-shorne@gmail.com>
References: <20200805210725.310301-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 2/6] openrisc: uaccess: Fix sparse address
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
c2hvcm5lQGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aCB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgg
Yi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCA0NmUzMWJiNGE5YWQu
LmYyZmM1YzRiODhjMyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNj
ZXNzLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTEwMCw3
ICsxMDAsNyBAQCBleHRlcm4gbG9uZyBfX3B1dF91c2VyX2JhZCh2b2lkKTsKICNkZWZpbmUgX19w
dXRfdXNlcl9jaGVjayh4LCBwdHIsIHNpemUpCQkJCQlcCiAoewkJCQkJCQkJCVwKIAlsb25nIF9f
cHVfZXJyID0gLUVGQVVMVDsJCQkJCVwKLQlfX3R5cGVvZl9fKCoocHRyKSkgKl9fcHVfYWRkciA9
IChwdHIpOwkJCQlcCisJX190eXBlb2ZfXygqKHB0cikpIF9fdXNlciAqX19wdV9hZGRyID0gKHB0
cik7CQkJXAogCWlmIChhY2Nlc3Nfb2soX19wdV9hZGRyLCBzaXplKSkJCQlcCiAJCV9fcHV0X3Vz
ZXJfc2l6ZSgoeCksIF9fcHVfYWRkciwgKHNpemUpLCBfX3B1X2Vycik7CVwKIAlfX3B1X2VycjsJ
CQkJCQkJXApAQCAtMTczLDcgKzE3Myw3IEBAIHN0cnVjdCBfX2xhcmdlX3N0cnVjdCB7CiAjZGVm
aW5lIF9fZ2V0X3VzZXJfY2hlY2soeCwgcHRyLCBzaXplKQkJCQkJXAogKHsJCQkJCQkJCQlcCiAJ
bG9uZyBfX2d1X2VyciA9IC1FRkFVTFQsIF9fZ3VfdmFsID0gMDsJCQkJXAotCWNvbnN0IF9fdHlw
ZW9mX18oKihwdHIpKSAqIF9fZ3VfYWRkciA9IChwdHIpOwkJCVwKKwljb25zdCBfX3R5cGVvZl9f
KCoocHRyKSkgX191c2VyICpfX2d1X2FkZHIgPSAocHRyKTsJCVwKIAlpZiAoYWNjZXNzX29rKF9f
Z3VfYWRkciwgc2l6ZSkpCQkJXAogCQlfX2dldF91c2VyX3NpemUoX19ndV92YWwsIF9fZ3VfYWRk
ciwgKHNpemUpLCBfX2d1X2Vycik7CVwKIAkoeCkgPSAoX19mb3JjZSBfX3R5cGVvZl9fKCoocHRy
KSkpX19ndV92YWw7CQkJXApAQCAtMjQ4LDEwICsyNDgsMTAgQEAgcmF3X2NvcHlfdG9fdXNlcih2
b2lkIF9fdXNlciAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxvbmcgc2l6ZSkKICNk
ZWZpbmUgSU5MSU5FX0NPUFlfRlJPTV9VU0VSCiAjZGVmaW5lIElOTElORV9DT1BZX1RPX1VTRVIK
IAotZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19jbGVhcl91c2VyKHZvaWQgKmFkZHIsIHVuc2lnbmVk
IGxvbmcgc2l6ZSk7CitleHRlcm4gdW5zaWduZWQgbG9uZyBfX2NsZWFyX3VzZXIodm9pZCBfX3Vz
ZXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7CiAKIHN0YXRpYyBpbmxpbmUgX19tdXN0X2No
ZWNrIHVuc2lnbmVkIGxvbmcKLWNsZWFyX3VzZXIodm9pZCAqYWRkciwgdW5zaWduZWQgbG9uZyBz
aXplKQorY2xlYXJfdXNlcih2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQog
ewogCWlmIChsaWtlbHkoYWNjZXNzX29rKGFkZHIsIHNpemUpKSkKIAkJc2l6ZSA9IF9fY2xlYXJf
dXNlcihhZGRyLCBzaXplKTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
