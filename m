Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB7D291FC3
	for <lists+openrisc@lfdr.de>; Sun, 18 Oct 2020 22:17:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6F8A220EB0;
	Sun, 18 Oct 2020 22:17:13 +0200 (CEST)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id 9DAC020EAC
 for <openrisc@lists.librecores.org>; Sun, 18 Oct 2020 22:17:11 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id o3so4735354pgr.11
 for <openrisc@lists.librecores.org>; Sun, 18 Oct 2020 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AHh2bMKyWi8itG0tlpCf17j2AL2aFudUN1FRuH686xs=;
 b=JB2XuWfPMfRoVSjJ2ayv2vY2hJ8nTnJ6+/Hp1A4oKypPEOXI7vZQYbXwSPeJ7kntr7
 8ZywekvuCTJLrv0O29W+ErhuPPHQPn/CoJdgaIw9mi1azEDoX82rt4kUSDaBsrZwIu10
 iglpX/aw7YxvdaAI5Fd1nTqNfSAEc/XS56XfSXUesk41toGIyJj8i3L/Uj4apwXK7y6Y
 vLir1MZ6JhWzHxf7+mptYuPgghQxG+9fP4HhLh+LllOux3QSvrRPgwy7QIRIvvJCcFPz
 Zhrt+MTgrtquQCmAGXLTkGD347S3bFlwmLWvdmaVBuAFhoDQ2hVrB/iWv6Mx8naCzlXD
 Yx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AHh2bMKyWi8itG0tlpCf17j2AL2aFudUN1FRuH686xs=;
 b=VBOzcDkv+ud2YJKH264tgskqu4Td8oOuJh4DBNCZZKpoPcZQeo+t6FL3gBxfzCXe6I
 u1K5Eq6YOo32Z2eXfSmPF7RIOBJtZbUa0TiK49bRM7AARaWwYeyYHlNmqD6cyCqMglC3
 8GkIMdoYEK19UMZCoE08RB7NDFqPoUAdT+RNMjUMIgH50d7vhctmT92HrDNkq7HNpzXb
 zyoi1OTruyM8wbPPz61b/xjce5GY1JmonWbHcKiUrFCRy4SJ7uN2lmcmpsW1QcQJrnoL
 9ExSERYr5J9fwmfNYaATza8Li2y5TWIcIagdP0VVqvdWq4InmNshkwvMCSjdNgeRV6/m
 v6ag==
X-Gm-Message-State: AOAM532nA4Nk60mOo0jfROwXb4YvlXIvdelzWz0MCSZVdSy3REk+Zcwv
 o8LBvUHCeju/U572OzI7+Tc=
X-Google-Smtp-Source: ABdhPJyNlyVPpdxhlX/bSzeKKk7yFjoiXkQ2fyVGGUA1UGAh2dzCreAjtODdTqkDJhNp6F0sR5v36Q==
X-Received: by 2002:a65:5b09:: with SMTP id y9mr11279254pgq.155.1603052229976; 
 Sun, 18 Oct 2020 13:17:09 -0700 (PDT)
Received: from localhost (g167.58-98-146.ppp.wakwak.ne.jp. [58.98.146.167])
 by smtp.gmail.com with ESMTPSA id a18sm9025633pgw.50.2020.10.18.13.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:17:09 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: stable@vger.kernel.org
Date: Mon, 19 Oct 2020 05:16:51 +0900
Message-Id: <20201018201651.2604140-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018201651.2604140-1-shorne@gmail.com>
References: <20201018201651.2604140-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/1] openrisc: Fix issue with get_user for 64-bit
 values
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Y29tbWl0IGQ4NzczMjJiYzFhZGNhYjk4NTA3MzIyNzU2NzA0MDllOGJjY2E0YzQgdXBzdHJlYW0K
CkJhY2twb3J0IG9mIHY1LjkgY29tbWl0IGQ4NzczMjJiYzFhZCBmb3IgdjUuOC55IGFuZCB2NS40
LnkuCgpDaGFuZ2UgaW4gYmFja3BvcnQ6CiAtIFRoZSBvcmlnaW5hbCBjb21taXQgZGVwZW5kcyBv
biBhIHNlcmllcyBvZiBzcGFyc2Ugd2FybmluZyBmaXgKICAgcGF0Y2hlcy4gIFRoaXMgcGF0Y2gg
ZWxsaW1pbmF0ZXMgdGhhdCByZXF1aXJlbWVudC4KCkEgYnVpbGQgZmFpbHVyZSB3YXMgcmFpc2Vk
IGJ5IGtidWlsZCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3IuCgogICAgZHJpdmVycy9hbmRyb2lk
L2JpbmRlci5jOiBBc3NlbWJsZXIgbWVzc2FnZXM6CiAgICBkcml2ZXJzL2FuZHJvaWQvYmluZGVy
LmM6Mzg2MTogRXJyb3I6IHVucmVjb2duaXplZCBrZXl3b3JkL3JlZ2lzdGVyIG5hbWUgYGwubHd6
ID9hcCw0KHIyNCknCiAgICBkcml2ZXJzL2FuZHJvaWQvYmluZGVyLmM6Mzg2NjogRXJyb3I6IHVu
cmVjb2duaXplZCBrZXl3b3JkL3JlZ2lzdGVyIG5hbWUgYGwuYWRkaSA/YXAscjAsMCcKClRoZSBp
c3N1ZSBpcyB3aXRoIDY0LWJpdCBnZXRfdXNlcigpIGNhbGxzIG9uIG9wZW5yaXNjLiAgSSB0cmFj
ZWQgdGhpcyB0bwphIHByb2JsZW0gd2hlcmUgaW4gdGhlIGludGVybmFsbHkgaW4gdGhlIGdldF91
c2VyIG1hY3JvcyB0aGVyZSBpcyBhIGNhc3QKdG8gbG9uZyBfX2d1X3ZhbCB0aGlzIGNhdXNlcyBH
Q0MgdG8gdGhpbmsgdGhlIGdldF91c2VyIGNhbGwgaXMgMzItYml0LgpUaGlzIGJpbmRlciBjb2Rl
IGlzIHJlYWxseSBsb25nIGFuZCBHQ0MgYWxsb2NhdGVzIHJlZ2lzdGVyIHIzMCwgd2hpY2gKdHJp
Z2dlcnMgdGhlIGlzc3VlLiBUaGUgNjQtYml0IGdldF91c2VyIGFzbSB0cmllcyB0byBnZXQgdGhl
IDY0LWJpdCBwYWlyCnJlZ2lzdGVyLCB3aGljaCBmb3IgcjMwIG92ZXJmbG93cyB0aGUgZ2VuZXJh
bCByZWdpc3RlciBuYW1lcyBhbmQgcmV0dXJucwp0aGUgZHVtbXkgcmVnaXN0ZXIgP2FwLgoKVGhl
IGZpeCBoZXJlIGlzIHRvIG1vdmUgdGhlIHRlbXBvcmFyeSB2YXJpYWJsZXMgaW50byB0aGUgYXNt
IG1hY3Jvcy4gIFdlCnVzZSBhIDMyLWJpdCBfX2d1X3RtcCBmb3IgMzItYml0IGFuZCBzbWFsbGVy
IG1hY3JvIGFuZCBhIDY0LWJpdCB0bXAgaW4KdGhlIDY0LWJpdCBtYWNyby4gIFRoZSBjYXN0IGlu
IHRoZSA2NC1iaXQgbWFjcm8gaGFzIGEgdHJpY2sgb2YgY2FzdGluZwp0aHJvdWdoIF9fdHlwZW9m
X18oKHgpLSh4KSkgd2hpY2ggYXZvaWRzIHRoZSBiZWxvdyB3YXJuaW5nLiAgVGhpcyB3YXMKYm9y
cm93ZWQgZnJvbSByaXNjdi4KCiAgICBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aDoyNDA6ODogd2FybmluZzogY2FzdCB0byBwb2ludGVyIGZyb20gaW50ZWdlciBvZiBkaWZmZXJl
bnQgc2l6ZQoKSSB0ZXN0ZWQgdGhpcyBpbiBhIHNtYWxsIHVuaXQgdGVzdCB0byBjaGVjayByZWFk
aW5nIGJldHdlZW4gNjQtYml0IGFuZAozMi1iaXQgcG9pbnRlcnMgdG8gNjQtYml0IGFuZCAzMi1i
aXQgdmFsdWVzIGluIGFsbCBjb21iaW5hdGlvbnMuICBBbHNvIEkKcmFuIG1ha2UgQz0xIHRvIGNv
bmZpcm0gbm8gbmV3IHNwYXJzZSB3YXJuaW5ncyBjYW1lIHVwLiAgSXQgYWxsIGxvb2tzCmNsZWFu
IHRvIG1lLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDgyMDA0NTMu
b2huaHFralElMjVsa3BAaW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8
c2hvcm5lQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEx1YyBWYW4gT29zdGVucnljayA8bHVjLnZh
bm9vc3RlbnJ5Y2tAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oIHwgMzUgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oCmluZGV4IDE3YzI0ZjE0NjE1Zi4uNjgzOWY4ZmNmNzZiIDEwMDY0NAotLS0gYS9h
cmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtMTY0LDE5ICsxNjQsMTkgQEAgc3RydWN0IF9fbGFyZ2Vf
c3RydWN0IHsKIAogI2RlZmluZSBfX2dldF91c2VyX25vY2hlY2soeCwgcHRyLCBzaXplKQkJCVwK
ICh7CQkJCQkJCQlcCi0JbG9uZyBfX2d1X2VyciwgX19ndV92YWw7CQkJCVwKLQlfX2dldF91c2Vy
X3NpemUoX19ndV92YWwsIChwdHIpLCAoc2l6ZSksIF9fZ3VfZXJyKTsJXAotCSh4KSA9IChfX2Zv
cmNlIF9fdHlwZW9mX18oKihwdHIpKSlfX2d1X3ZhbDsJCVwKKwlsb25nIF9fZ3VfZXJyOwkJCQkJ
CVwKKwlfX2dldF91c2VyX3NpemUoKHgpLCAocHRyKSwgKHNpemUpLCBfX2d1X2Vycik7CQlcCiAJ
X19ndV9lcnI7CQkJCQkJXAogfSkKIAogI2RlZmluZSBfX2dldF91c2VyX2NoZWNrKHgsIHB0ciwg
c2l6ZSkJCQkJCVwKICh7CQkJCQkJCQkJXAotCWxvbmcgX19ndV9lcnIgPSAtRUZBVUxULCBfX2d1
X3ZhbCA9IDA7CQkJCVwKLQljb25zdCBfX3R5cGVvZl9fKCoocHRyKSkgKiBfX2d1X2FkZHIgPSAo
cHRyKTsJCQlcCi0JaWYgKGFjY2Vzc19vayhfX2d1X2FkZHIsIHNpemUpKQkJCVwKLQkJX19nZXRf
dXNlcl9zaXplKF9fZ3VfdmFsLCBfX2d1X2FkZHIsIChzaXplKSwgX19ndV9lcnIpOwlcCi0JKHgp
ID0gKF9fZm9yY2UgX190eXBlb2ZfXygqKHB0cikpKV9fZ3VfdmFsOwkJCVwKKwlsb25nIF9fZ3Vf
ZXJyID0gLUVGQVVMVDsJCQkJCVwKKwljb25zdCBfX3R5cGVvZl9fKCoocHRyKSkgKl9fZ3VfYWRk
ciA9IChwdHIpOwkJCVwKKwlpZiAoYWNjZXNzX29rKF9fZ3VfYWRkciwgc2l6ZSkpCQkJCQlcCisJ
CV9fZ2V0X3VzZXJfc2l6ZSgoeCksIF9fZ3VfYWRkciwgKHNpemUpLCBfX2d1X2Vycik7CVwKKwll
bHNlCQkJCQkJCQlcCisJCSh4KSA9IChfX3R5cGVvZl9fKCoocHRyKSkpIDA7CQkJCVwKIAlfX2d1
X2VycjsJCQkJCQkJXAogfSkKIApAQCAtMTkwLDExICsxOTAsMTMgQEAgZG8gewkJCQkJCQkJCVwK
IAljYXNlIDI6IF9fZ2V0X3VzZXJfYXNtKHgsIHB0ciwgcmV0dmFsLCAibC5saHoiKTsgYnJlYWs7
CQlcCiAJY2FzZSA0OiBfX2dldF91c2VyX2FzbSh4LCBwdHIsIHJldHZhbCwgImwubHd6Iik7IGJy
ZWFrOwkJXAogCWNhc2UgODogX19nZXRfdXNlcl9hc20yKHgsIHB0ciwgcmV0dmFsKTsgYnJlYWs7
CQkJXAotCWRlZmF1bHQ6ICh4KSA9IF9fZ2V0X3VzZXJfYmFkKCk7CQkJCVwKKwlkZWZhdWx0OiAo
eCkgPSAoX190eXBlb2ZfXygqKHB0cikpKV9fZ2V0X3VzZXJfYmFkKCk7CQlcCiAJfQkJCQkJCQkJ
XAogfSB3aGlsZSAoMCkKIAogI2RlZmluZSBfX2dldF91c2VyX2FzbSh4LCBhZGRyLCBlcnIsIG9w
KQkJXAorewkJCQkJCQlcCisJdW5zaWduZWQgbG9uZyBfX2d1X3RtcDsJCQkJXAogCV9fYXNtX18g
X192b2xhdGlsZV9fKAkJCQlcCiAJCSIxOgkib3AiICUxLDAoJTIpXG4iCQlcCiAJCSIyOlxuIgkJ
CQkJXApAQCAtMjA4LDEwICsyMTAsMTQgQEAgZG8gewkJCQkJCQkJCVwKIAkJIgkuYWxpZ24gMlxu
IgkJCVwKIAkJIgkubG9uZyAxYiwzYlxuIgkJCVwKIAkJIi5wcmV2aW91cyIJCQkJXAotCQk6ICI9
ciIoZXJyKSwgIj1yIih4KQkJCVwKLQkJOiAiciIoYWRkciksICJpIigtRUZBVUxUKSwgIjAiKGVy
cikpCisJCTogIj1yIihlcnIpLCAiPXIiKF9fZ3VfdG1wKQkJXAorCQk6ICJyIihhZGRyKSwgImki
KC1FRkFVTFQpLCAiMCIoZXJyKSk7CVwKKwkoeCkgPSAoX190eXBlb2ZfXygqKGFkZHIpKSlfX2d1
X3RtcDsJCVwKK30KIAogI2RlZmluZSBfX2dldF91c2VyX2FzbTIoeCwgYWRkciwgZXJyKQkJCVwK
K3sJCQkJCQkJXAorCXVuc2lnbmVkIGxvbmcgbG9uZyBfX2d1X3RtcDsJCQlcCiAJX19hc21fXyBf
X3ZvbGF0aWxlX18oCQkJCVwKIAkJIjE6CWwubHd6ICUxLDAoJTIpXG4iCQlcCiAJCSIyOglsLmx3
eiAlSDEsNCglMilcbiIJCVwKQEAgLTIyOCw4ICsyMzQsMTEgQEAgZG8gewkJCQkJCQkJCVwKIAkJ
IgkubG9uZyAxYiw0YlxuIgkJCVwKIAkJIgkubG9uZyAyYiw0YlxuIgkJCVwKIAkJIi5wcmV2aW91
cyIJCQkJXAotCQk6ICI9ciIoZXJyKSwgIj0mciIoeCkJCQlcCi0JCTogInIiKGFkZHIpLCAiaSIo
LUVGQVVMVCksICIwIihlcnIpKQorCQk6ICI9ciIoZXJyKSwgIj0mciIoX19ndV90bXApCQlcCisJ
CTogInIiKGFkZHIpLCAiaSIoLUVGQVVMVCksICIwIihlcnIpKTsJXAorCSh4KSA9IChfX3R5cGVv
Zl9fKCooYWRkcikpKSgJCQlcCisJCShfX3R5cGVvZl9fKCh4KS0oeCkpKV9fZ3VfdG1wKTsJCVwK
K30KIAogLyogbW9yZSBjb21wbGV4IHJvdXRpbmVzICovCiAKLS0gCjIuMjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
