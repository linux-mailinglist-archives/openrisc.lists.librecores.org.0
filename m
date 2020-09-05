Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE3425E7D4
	for <lists+openrisc@lfdr.de>; Sat,  5 Sep 2020 15:20:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E5CD920D73;
	Sat,  5 Sep 2020 15:20:21 +0200 (CEST)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 00BB120CF5
 for <openrisc@lists.librecores.org>; Sat,  5 Sep 2020 15:20:19 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id j34so366035pgi.7
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgAiG+t/6nOuNKTWGQYGI/rg919QIvV2XBuVNxVNwks=;
 b=B3HBQ0vtDDhkmO9hI2gFrc5ihSgl4RE8pIlZNylCI+jJ78LSpRPD1N/hsIGSC4Z9hx
 FyUX2Tnm7ecf4OSJuYlbKnjMeIVZSAiLMQOUjzX/12hI5ym2lWdcqiGXClNje0udE2SW
 +USqph9cyAEhh0szf5iHyFtsG4DeuiWX6rZAb9bVDHjYYsq8iLUx1X0Hx3tzQNlht2aR
 u/pq7gSugJlBs2/41y2B2/NE2bELbZMWWhWJQSUcfr76FmkGYxMIiPscutQeaXWXQVlR
 Z//Ym80usq61rGHEk3C+XXJnzHlPDaXgwcK4QyHPKYG1L0Ww3sJmh4PN80i8JxVnFeRo
 p+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgAiG+t/6nOuNKTWGQYGI/rg919QIvV2XBuVNxVNwks=;
 b=c8z90AeWYpKdAkxUO4k/ZhrU+dewUUWsQML5YVmDuZBJkhKScE3S183ajhgKb6IJ7m
 Wl4fDoVM+YwElx/cn4tKJDrOhWUWV0yAqrtwW9cTPbVAJVQnCF64u19QZpdt9LDfxtRN
 iUreozqz8hhwWc4vW8AXjb68LilsWJfz4GLWCju5GZ2Zk8sO//T/RMjKU/tLbi5wU6Ps
 hsmps4HgwUh/KjpDNDZmviZqsAfg0mD0oc4H11AGTz5eyI2dgvOrQRw8cahe1HhdHkTy
 +tPp4zwlBZsBQWk6MeSYP6xiStrWy6yNvXTR6knGLIq4bad9e3VM3ochDFzka/NMxDzZ
 z7xg==
X-Gm-Message-State: AOAM532YKSTPuzTRHkiHxIXiHutiOWvYhlVhHvNYb407Wwja4uy5aXYF
 WBzLYbs7ej0MwcP6nCLSzSg=
X-Google-Smtp-Source: ABdhPJyz9eayZr4GdKsD1jzVytjQzRRdwJXEuHPcbNjJeCN1T2CLwTUIILgICQPoIL7yLL4X5245Ow==
X-Received: by 2002:a62:7f8d:: with SMTP id a135mr12895171pfd.43.1599312017998; 
 Sat, 05 Sep 2020 06:20:17 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id r144sm10512566pfc.63.2020.09.05.06.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 06:20:17 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  5 Sep 2020 22:19:35 +0900
Message-Id: <20200905131935.972386-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905131935.972386-1-shorne@gmail.com>
References: <20200905131935.972386-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 3/3] openrisc: Fix issue with get_user for
 64-bit values
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
 Greentime Hu <green.hu@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QSBidWlsZCBmYWlsdXJlIHdhcyByYWlzZWQgYnkga2J1aWxkIHdpdGggdGhlIGZvbGxvd2luZyBl
cnJvci4KCiAgICBkcml2ZXJzL2FuZHJvaWQvYmluZGVyLmM6IEFzc2VtYmxlciBtZXNzYWdlczoK
ICAgIGRyaXZlcnMvYW5kcm9pZC9iaW5kZXIuYzozODYxOiBFcnJvcjogdW5yZWNvZ25pemVkIGtl
eXdvcmQvcmVnaXN0ZXIgbmFtZSBgbC5sd3ogP2FwLDQocjI0KScKICAgIGRyaXZlcnMvYW5kcm9p
ZC9iaW5kZXIuYzozODY2OiBFcnJvcjogdW5yZWNvZ25pemVkIGtleXdvcmQvcmVnaXN0ZXIgbmFt
ZSBgbC5hZGRpID9hcCxyMCwwJwoKVGhlIGlzc3VlIGlzIHdpdGggNjQtYml0IGdldF91c2VyKCkg
Y2FsbHMgb24gb3BlbnJpc2MuICBJIHRyYWNlZCB0aGlzIHRvCmEgcHJvYmxlbSB3aGVyZSBpbiB0
aGUgaW50ZXJuYWxseSBpbiB0aGUgZ2V0X3VzZXIgbWFjcm9zIHRoZXJlIGlzIGEgY2FzdAp0byBs
b25nIF9fZ3VfdmFsIHRoaXMgY2F1c2VzIEdDQyB0byB0aGluayB0aGUgZ2V0X3VzZXIgY2FsbCBp
cyAzMi1iaXQuClRoaXMgYmluZGVyIGNvZGUgaXMgcmVhbGx5IGxvbmcgYW5kIEdDQyBhbGxvY2F0
ZXMgcmVnaXN0ZXIgcjMwLCB3aGljaAp0cmlnZ2VycyB0aGUgaXNzdWUuIFRoZSA2NC1iaXQgZ2V0
X3VzZXIgYXNtIHRyaWVzIHRvIGdldCB0aGUgNjQtYml0IHBhaXIKcmVnaXN0ZXIsIHdoaWNoIGZv
ciByMzAgb3ZlcmZsb3dzIHRoZSBnZW5lcmFsIHJlZ2lzdGVyIG5hbWVzIGFuZCByZXR1cm5zCnRo
ZSBkdW1teSByZWdpc3RlciA/YXAuCgpUaGUgZml4IGlzIHRvIGp1c3QgcmVtb3ZlIHRoZSBhc3Np
Z25tZW50IHRvIHRoZSAzMi1iaXQgdGVtcG9yYXJ5CnZhcmlhYmxlIF9fZ3VfdmFsLgoKTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDgyMDA0NTMub2huaHFralElMjVsa3BA
aW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNv
bT4KLS0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDE2ICsrKysrKysr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBmMDM5MDIxMTIzNmIuLjRhODk3
NmRkYTFhNSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgK
KysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTE2NSwxOSArMTY1
LDE5IEBAIHN0cnVjdCBfX2xhcmdlX3N0cnVjdCB7CiAKICNkZWZpbmUgX19nZXRfdXNlcl9ub2No
ZWNrKHgsIHB0ciwgc2l6ZSkJCQlcCiAoewkJCQkJCQkJXAotCWxvbmcgX19ndV9lcnIsIF9fZ3Vf
dmFsOwkJCQlcCi0JX19nZXRfdXNlcl9zaXplKF9fZ3VfdmFsLCAocHRyKSwgKHNpemUpLCBfX2d1
X2Vycik7CVwKLQkoeCkgPSAoX19mb3JjZSBfX3R5cGVvZl9fKCoocHRyKSkpX19ndV92YWw7CQlc
CisJbG9uZyBfX2d1X2VycjsJCQkJCQlcCisJX19nZXRfdXNlcl9zaXplKCh4KSwgKHB0ciksIChz
aXplKSwgX19ndV9lcnIpOwkJXAogCV9fZ3VfZXJyOwkJCQkJCVwKIH0pCiAKICNkZWZpbmUgX19n
ZXRfdXNlcl9jaGVjayh4LCBwdHIsIHNpemUpCQkJCQlcCiAoewkJCQkJCQkJCVwKLQlsb25nIF9f
Z3VfZXJyID0gLUVGQVVMVCwgX19ndV92YWwgPSAwOwkJCQlcCisJbG9uZyBfX2d1X2VyciA9IC1F
RkFVTFQ7CQkJCQlcCiAJY29uc3QgX190eXBlb2ZfXygqKHB0cikpIF9fdXNlciAqX19ndV9hZGRy
ID0gKHB0cik7CQlcCi0JaWYgKGFjY2Vzc19vayhfX2d1X2FkZHIsIHNpemUpKQkJCVwKLQkJX19n
ZXRfdXNlcl9zaXplKF9fZ3VfdmFsLCBfX2d1X2FkZHIsIChzaXplKSwgX19ndV9lcnIpOwlcCi0J
KHgpID0gKF9fZm9yY2UgX190eXBlb2ZfXygqKHB0cikpKV9fZ3VfdmFsOwkJCVwKKwlpZiAoYWNj
ZXNzX29rKF9fZ3VfYWRkciwgc2l6ZSkpCQkJCQlcCisJCV9fZ2V0X3VzZXJfc2l6ZSgoeCksIF9f
Z3VfYWRkciwgKHNpemUpLCBfX2d1X2Vycik7CVwKKwllbHNlCQkJCQkJCQlcCisJCSh4KSA9IDA7
CQkJCQkJXAogCV9fZ3VfZXJyOwkJCQkJCQlcCiB9KQogCkBAIC0xOTEsNyArMTkxLDcgQEAgZG8g
ewkJCQkJCQkJCVwKIAljYXNlIDI6IF9fZ2V0X3VzZXJfYXNtKHgsIHB0ciwgcmV0dmFsLCAibC5s
aHoiKTsgYnJlYWs7CQlcCiAJY2FzZSA0OiBfX2dldF91c2VyX2FzbSh4LCBwdHIsIHJldHZhbCwg
ImwubHd6Iik7IGJyZWFrOwkJXAogCWNhc2UgODogX19nZXRfdXNlcl9hc20yKHgsIHB0ciwgcmV0
dmFsKTsgYnJlYWs7CQkJXAotCWRlZmF1bHQ6ICh4KSA9IF9fZ2V0X3VzZXJfYmFkKCk7CQkJCVwK
KwlkZWZhdWx0OiAoeCkgPSAoX190eXBlb2ZfXyh4KSkgX19nZXRfdXNlcl9iYWQoKTsJCVwKIAl9
CQkJCQkJCQlcCiB9IHdoaWxlICgwKQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
