Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 860782F5546
	for <lists+openrisc@lfdr.de>; Thu, 14 Jan 2021 00:50:50 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A1843210A8;
	Thu, 14 Jan 2021 00:50:49 +0100 (CET)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mail.librecores.org (Postfix) with ESMTPS id C012521014
 for <openrisc@lists.librecores.org>; Thu, 14 Jan 2021 00:50:47 +0100 (CET)
Received: by mail-pf1-f172.google.com with SMTP id w2so2232783pfc.13
 for <openrisc@lists.librecores.org>; Wed, 13 Jan 2021 15:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqrmZnGxlUv8/emSfwDXVRsgvjA238OJn6NBw4u/65g=;
 b=fDv/rW/IHDX3p+BaqTkR/YqLSsU4ziOPc1GbnuaJltWKWR4CGnGqELdCpZ5jvz5mtd
 bd4xrdPnIpbXbwIJ6zIl0UMbX2Fq93VBfPlCkX3zTok+5ksfpMrcLBbZt4P/5kwOvOPF
 EOVejqrZV1LYlDuRp2vNJ7XMySWF7MCUBYn4E449cveJd+IboMEMsoEPg1NWdASpC6m9
 iM8j2srKFp81HBT6sCyxalOo//G6VQZ7f6yjMOvh8kR+ePXqh0Z7r1BI/42iUveDZ4em
 4XsWkK1BQbho/W1lOSJd/xFRdX+Hozmjc8n0npuEmOzA/dqhKi/xmvs9If9p5EnRfyzD
 l65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XqrmZnGxlUv8/emSfwDXVRsgvjA238OJn6NBw4u/65g=;
 b=mNtLav3OG72DUnJZF3fk7SSJKPyF56UNi2LXkU3SnnLkJMcmKaiMeho+kYlo9/tLkf
 AyvNWSE9TkrzYOXzyx1a7t78P5ipyboVxbg1rrhCVotpD4FYj7q+qyldl79lnMjlt1um
 pBPzpOJh/PzNcL50X72O+83upOcVigEupdnUTumKhQk1Qmjj4ei2L20HXlwF2NAICflQ
 LNZzMfujv97quBC3cXLdAe0zF9utb5IrK+rsbPJwZsH63NypP/FuOv+wl22thtBlneuf
 mtGi90SsWRg7hQHLMNI3evKpIOWCErVKDCRoExZUcLsNk/tjmoUaHZEcOpKHaNy9FeBl
 N1YQ==
X-Gm-Message-State: AOAM533IL7t7xw3OxsyyvpihMWx6RHn61pGzW9Plq+O/o8p2wA6hFdza
 bimURGFIzJfGXkNNd8Pqwik=
X-Google-Smtp-Source: ABdhPJz0XUFsODn6EYa9GWZwgzlZTrlGV99KlR+nm2UJe8jyiJQ5LgsQi22J1qAfpqAiXtJlqp+SmA==
X-Received: by 2002:a62:f948:0:b029:1ad:c27d:2b9e with SMTP id
 g8-20020a62f9480000b02901adc27d2b9emr4456229pfm.33.1610581846418; 
 Wed, 13 Jan 2021 15:50:46 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 r79sm3366587pfc.166.2021.01.13.15.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 15:50:44 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 14 Jan 2021 08:50:28 +0900
Message-Id: <20210113235032.2821155-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113235032.2821155-1-shorne@gmail.com>
References: <20210113235032.2821155-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 1/5] or1k: Implement profile hook calling
 _mcount
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RGVmaW5pbmcgdGhpcyB0byBub3QgYWJvcnQgYXMgZm91bmQgd2hlbiB3b3JraW5nIG9uIHJ1bm5p
bmcgdGVzdHMgaW4KdGhlIGdsaWJjIHRlc3Qgc3VpdGUuCgpXZSBpbXBsZW1lbnQgdGhpcyB3aXRo
IGEgY2FsbCB0byBfbWNvdW50IHdpdGggbm8gYXJndW1lbnRzLiAgVGhlIHJlcXVpcmVkCnJldHVy
biBhZGRyZXNzJ3Mgd2lsbCBiZSBwdWxsZWQgZnJvbSB0aGUgc3RhY2suICBQYXNzaW5nIHRoZSBM
UiAocjkpIGFzCmFuIGFyZ3VtZW50IGhhZCBwcm9ibGVtcyBhcyBzb21ldGltZXMgcjkgaXMgY2xv
YmJlcmVkIGJ5IHRoZSBHT1QgbG9naWMKaW4gdGhlIHByb2xvZ3VlIGJlZm9yZSB0aGUgY2FsbCB0
byBfbWNvdW50LgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFrL29yMWsuaCAoTk9fUFJP
RklMRV9DT1VOVEVSUyk6IERlZmluZSBhcyAxLgoJKFBST0ZJTEVfSE9PSyk6IERlZmluZSB0byBj
YWxsIF9tY291bnQuCgkoRlVOQ1RJT05fUFJPRklMRVIpOiBDaGFuZ2UgZnJvbSBhYm9ydCB0byBu
by1vcC4KLS0tCiBnY2MvY29uZmlnL29yMWsvb3Ixay5oIHwgMTUgKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9nY2MvY29uZmlnL29yMWsvb3Ixay5oIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaAppbmRl
eCBhYjFjNGJiZDJhNy4uZGM1NzllNGEzODggMTAwNjQ0Ci0tLSBhL2djYy9jb25maWcvb3Ixay9v
cjFrLmgKKysrIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaApAQCAtMzc5LDggKzM3OSwxOSBAQCBk
byB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
IC8qIEFsd2F5cyBwYXNzIHRoZSBTWU1CT0xfUkVGIGZvciBkaXJlY3QgY2FsbHMgdG8gdGhlIGV4
cGFuZGVycy4gICovCiAjZGVmaW5lIE5PX0ZVTkNUSU9OX0NTRSAxCiAKLS8qIFByb2ZpbGluZyAq
LwotI2RlZmluZSBGVU5DVElPTl9QUk9GSUxFUihGSUxFLExBQkVMTk8pIChhYm9ydCAoKSwgMCkK
KyNkZWZpbmUgTk9fUFJPRklMRV9DT1VOVEVSUyAxCisKKy8qIEVtaXQgcnRsIGZvciBwcm9maWxp
bmcuICBPdXRwdXQgYXNzZW1ibGVyIGNvZGUgdG8gY2FsbCAiX21jb3VudCIgZm9yCisgICBwcm9m
aWxpbmcgYSBmdW5jdGlvbiBlbnRyeS4gICovCisjZGVmaW5lIFBST0ZJTEVfSE9PSyhMQUJFTCkJ
CQkJCQlcCisgIHsJCQkJCQkJCQlcCisgICAgcnR4IGZ1bjsJCQkJCQkJCVwKKyAgICBmdW4gPSBn
ZW5fcnR4X1NZTUJPTF9SRUYgKFBtb2RlLCAiX21jb3VudCIpOwkJCVwKKyAgICBlbWl0X2xpYnJh
cnlfY2FsbCAoZnVuLCBMQ1RfTk9STUFMLCBWT0lEbW9kZSk7CQkJXAorICB9CisKKy8qIEFsbCB0
aGUgd29yayBpcyBkb25lIGluIFBST0ZJTEVfSE9PSywgYnV0IHRoaXMgaXMgc3RpbGwgcmVxdWly
ZWQuICAqLworI2RlZmluZSBGVU5DVElPTl9QUk9GSUxFUihTVFJFQU0sIExBQkVMTk8pIGRvIHsg
fSB3aGlsZSAoMCkKIAogLyogRHdhcmYgMiBTdXBwb3J0ICovCiAjZGVmaW5lIERXQVJGMl9ERUJV
R0dJTkdfSU5GTyAxCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
