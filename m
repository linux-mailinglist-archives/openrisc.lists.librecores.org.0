Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A94621E505B
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6844620CEB;
	Wed, 27 May 2020 23:19:49 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 426B320B92
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 06:36:56 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id q8so11296132pfu.5
 for <openrisc@lists.librecores.org>; Tue, 26 May 2020 21:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOpmpojWwwDKmdgvBgyDR/91akL7lsEVaaRXHGRRif0=;
 b=RhgQiHKjSFxt0e4hdk9XFdFmwXlaqqy/oTAekflZtHFdhEKO64qFc1mpKDXZr69CPy
 jdKKGgMYF3/PwLMQqZRA0p7MJV/Go6tkta/h4swizRoRpVhai4LlQKtDfpzOQXol3xcY
 3TW/CBGWUO1G35QH1UIuJXs9WTI3G+E29PktRQFzMSdgmMsbx+ViIkPx4XIoQKnwHjtI
 iuFirKyvXOkp6bKvGs8xYK3w/Dn4sctZ1lOJtxsH8Aa2nP03Bsx7PgwJODEguoGDFtQe
 EV7yB1UHGazYqjCw0y7SPUOzeb1Rx+s20xn4YP/gkyyGkm4H/LKnhLTIPlstwN50FD9J
 kU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOpmpojWwwDKmdgvBgyDR/91akL7lsEVaaRXHGRRif0=;
 b=m4MNCzyoGNnG1S0dxMJzSjl3IwviGB4IGbfGKMhKkKZi+TEJJrJiSAsb2QG30fIWEI
 6NJlERJ6nBoSFfiaqopRQUtEEEmaWnqGw0i4URRHOn0/Xi5rlLmG8B8E6hX74kXPFAUs
 cucGYtDwn9b0UqDIgJb3OUibSaXQ8107JLiatD3vIv0zJws5so1orh5jbIp+0IszpnZB
 VXLM+UqVkZC82OVucWD3kpJgSTx2JyHVub/xmM8lIOpZ0cj/CFKYoTtxj16ijVfqpSAi
 z6gtYzqiU7tZcyY60wrlK/Gins38pR3+qRMHb5o06epm2lJK5U5rM8PQOjRtwvXn5c5D
 m9GA==
X-Gm-Message-State: AOAM530hreB0Y1zCR3jJTpCFqKDugaNzvU7Iocdk31OGre5xD+oTsVLA
 /YR/ppfVKodliZAL9sYGW6w=
X-Google-Smtp-Source: ABdhPJxaG/pR1wu1n7WufrFJ+x4wcg8X7uq9rcDJKu3YRWfpwt3nhECM4aeG8mrZfzsEkO9ezvPt1w==
X-Received: by 2002:aa7:9302:: with SMTP id 2mr2035203pfj.164.1590554214171;
 Tue, 26 May 2020 21:36:54 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id e13sm893604pfm.103.2020.05.26.21.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 21:36:53 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: hch@lst.de
Date: Tue, 26 May 2020 21:34:27 -0700
Message-Id: <20200527043426.3242439-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200515143646.3857579-7-hch@lst.de>
References: <20200515143646.3857579-7-hch@lst.de>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH] media: omap3isp: Shuffle cacheflush.h and
 include mm.h
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, arnd@arndb.de, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 linux-kernel@vger.kernel.org, jeyu@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWZ0ZXIgbW0uaCB3YXMgcmVtb3ZlZCBmcm9tIHRoZSBhc20tZ2VuZXJpYyB2ZXJzaW9uIG9mIGNh
Y2hlZmx1c2guaCwKczM5MCBhbGx5ZXNjb25maWcgc2hvd3Mgc2V2ZXJhbCB3YXJuaW5ncyBvZiB0
aGUgZm9sbG93aW5nIG5hdHVyZToKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2FyY2gvczM5MC9p
bmNsdWRlL2dlbmVyYXRlZC9hc20vY2FjaGVmbHVzaC5oOjEsCiAgICAgICAgICAgICAgICAgZnJv
bSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jOjQyOgouL2luY2x1ZGUvYXNt
LWdlbmVyaWMvY2FjaGVmbHVzaC5oOjE2OjQyOiB3YXJuaW5nOiAnc3RydWN0IG1tX3N0cnVjdCcK
ZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lk
ZSBvZiB0aGlzCmRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KCmNhY2hlZmx1c2guaCBkb2VzIG5v
dCBpbmNsdWRlIG1tLmggbm9yIGRvZXMgaXQgaW5jbHVkZSBhbnkgZm9yd2FyZApkZWNsYXJhdGlv
biBvZiB0aGVzZSBzdHJ1Y3R1cmVzIGhlbmNlIHRoZSB3YXJuaW5nLiBUbyBhdm9pZCB0aGlzLApp
bmNsdWRlIG1tLmggZXhwbGljaXRseSBpbiB0aGlzIGZpbGUgYW5kIHNodWZmbGUgY2FjaGVmbHVz
aC5oIGJlbG93IGl0LgoKRml4ZXM6IDE5YzAwNTQ1OTdhMCAoImFzbS1nZW5lcmljOiBkb24ndCBp
bmNsdWRlIDxsaW51eC9tbS5oPiBpbiBjYWNoZWZsdXNoLmgiKQpTaWduZWQtb2ZmLWJ5OiBOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgotLS0KCkkgYW0gYXdhcmUg
dGhlIGZpeGVzIHRhZyBpcyBraW5kIG9mIGlycmVsZXZhbnQgYmVjYXVzZSB0aGF0IFNIQSB3aWxs
CmNoYW5nZSBpbiB0aGUgbmV4dCBsaW51eC1uZXh0IHJldmlzaW9uIGFuZCB0aGlzIHdpbGwgcHJv
YmFibHkgZ2V0IGZvbGRlZAppbnRvIHRoZSBvcmlnaW5hbCBwYXRjaCBhbnl3YXlzIGJ1dCBzdGls
bC4KClRoZSBvdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBhZGQgZm9yd2FyZCBkZWNsYXJhdGlv
bnMgb2YgdGhlc2Ugc3RydWN0cwp0byB0aGUgdG9wIG9mIGNhY2hlZmx1c2guaCwgSSBqdXN0IGNo
b3NlIHRvIGRvIHdoYXQgQ2hyaXN0b3BoIGRpZCBpbiB0aGUKb3JpZ2luYWwgcGF0Y2guIEkgYW0g
aGFwcHkgdG8gZG8gdGhhdCBpbnN0ZWFkIGlmIHlvdSBhbGwgZmVlbCB0aGF0IGlzCmJldHRlci4K
CiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jIHwgNSArKystLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9vbWFwM2lzcC9pc3AuYwppbmRleCBhNGVlNmI4NjY2M2UuLjU0MTA2YTc2OGU1NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9vbWFwM2lzcC9pc3AuYworKysgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL29tYXAzaXNwL2lzcC5jCkBAIC0zOSw4ICszOSw2IEBACiAgKglU
cm95IExhcmFteSA8dC1sYXJhbXlAdGkuY29tPgogICovCiAKLSNpbmNsdWRlIDxhc20vY2FjaGVm
bHVzaC5oPgotCiAjaW5jbHVkZSA8bGludXgvY2xrLmg+CiAjaW5jbHVkZSA8bGludXgvY2xrZGV2
Lmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KQEAgLTQ5LDYgKzQ3LDcgQEAKICNpbmNsdWRl
IDxsaW51eC9pMmMuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KICNpbmNsdWRlIDxs
aW51eC9tZmQvc3lzY29uLmg+CisjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9vbWFwLWlvbW11Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+CkBAIC01OCw2ICs1Nyw4IEBACiAjaW5jbHVkZSA8bGludXgv
c2NoZWQuaD4KICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+CiAKKyNpbmNsdWRlIDxhc20vY2Fj
aGVmbHVzaC5oPgorCiAjaWZkZWYgQ09ORklHX0FSTV9ETUFfVVNFX0lPTU1VCiAjaW5jbHVkZSA8
YXNtL2RtYS1pb21tdS5oPgogI2VuZGlmCi0tIAoyLjI3LjAucmMwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
