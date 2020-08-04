Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BC70823B3D6
	for <lists+openrisc@lfdr.de>; Tue,  4 Aug 2020 06:24:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9625420D95;
	Tue,  4 Aug 2020 06:24:18 +0200 (CEST)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id 18F9220D92
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 06:24:17 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id t11so2321144plr.5
 for <openrisc@lists.librecores.org>; Mon, 03 Aug 2020 21:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JngFG1EkTLo4BpqZhiJxszD1gfeCHHSLXHsexflvscw=;
 b=K+z3LaGknG3+dskAQIYMfnPKZZK9plCBb+szon+FT/j+2OfxNClUn1QhGrHJ5Y9/mP
 MTv0g3GD6cpoOaHa2uT6sx9vNEqrNbrpVbjR2I4/6Vm/K04cvprsA8wQDKhcmmIkuWvg
 wCxeQXSiWWFwz8jn5WI6+1sqASV2cs+MiO40IB5OOlV61y324Sq6VfZs/ca1Ow/tS+vG
 Hwn2cd1G7ea5W3GkQyif4XReLegm74iGrxoCxVIarH8ASnQgoY5hbPijDuvKv+712y/p
 UMkgde2b0G56XmiZUYIXsvA9wGnG2h5go9RxdWAuu01FYYkWLOOCCROHAdplkQyuBGy+
 vlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JngFG1EkTLo4BpqZhiJxszD1gfeCHHSLXHsexflvscw=;
 b=oBVnINlIiXsQpl5bYcUWBn3dDRoAzSpoFNLnbfXn38vhTFi2LSLCROTRTn+42s6t2p
 CgXjudB8/HPforsmx04imkLjBHAW9LLNLKrCpZV0MB6yKH+bLIpXTNM3/rpiiyTTo1Pb
 WSv6C9PW6BZxyiFfdBTBddNi0N09sdSYWXhB8kTquNjDEhylhGQmXPBQqUnPH4hUfTGV
 3abQY0CXzTHy7xPdKmUMgZrORU7ug36oj0YG3lI+Sp1Lrbgs953ieh06PUkt0jBjLBEf
 rhaH4sDsj2+O5bcCNkdhR0wZewHIW0wDAZ1gffw9N6N3x67m10SK7ovqnHysBVEabFkb
 fBdw==
X-Gm-Message-State: AOAM532nGExzYUdmtZxpL73LD9We8PIB1NHD51JMpIWxUCpEL7NhaF++
 Pp3pyu52c084F4L79qg7/Io=
X-Google-Smtp-Source: ABdhPJzfpgnCKblnJGY/7G3hc88dXBossscj+e/PDs0c+uhVJluJnQ3C3XjLnEzx8zqlP4avaEL5mg==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr17804962pll.17.1596515055411; 
 Mon, 03 Aug 2020 21:24:15 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id j130sm107809pgc.76.2020.08.03.21.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 21:24:14 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  4 Aug 2020 13:23:50 +0900
Message-Id: <20200804042354.3930694-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804042354.3930694-1-shorne@gmail.com>
References: <20200804042354.3930694-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/6] openrisc: uaccess: Fix sparse address space
 warnings
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
