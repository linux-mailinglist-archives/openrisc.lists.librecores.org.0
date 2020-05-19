Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6506A1DA2DC
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:38:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 29EF920B79;
	Tue, 19 May 2020 22:38:15 +0200 (CEST)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id E78F820B6C
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:38:12 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id d3so375877pln.1
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Q/3nTceEZ391I3b3RhkysOOJWhmvQQyOS9vFP25wd4=;
 b=TPWY8rEPnVU/bGHaqk1CmS50ojnwmSvXYkyQIJAMUr0PAjPiGDQepmkNztdZFHie0b
 nkEc46IUlgNYJqawXqlme6jfneLCOy6/G+FG48kpSUz+l+8asapmPXgeaYhQhI0yDYS+
 D3eu+egS7kfiBG+iWqzaEOksXmM4viBEgTJbLaDyRgBnSJ8SYgfPks+7j8VqcYBmbI6+
 bI6Of4+hMJy9xnGn+J5LavJQOeOwP2h5tQWq8ZlKMnDWLsskkDjamx/u7OMyiuDwDyE8
 ez/wo1cniiZ3aNVe5HxQAb56x1YsXkakOpMJbRY05Fx9edUo7oCXHfF76ZacCmp77pE3
 1z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Q/3nTceEZ391I3b3RhkysOOJWhmvQQyOS9vFP25wd4=;
 b=cyPpTjGK30fSkL3VD2Uy+fmeDEeta4hijKCNjg0R7OKytFJZ+1C0tbIqBMgTtWgBAT
 sJwNTScgpq5U+KR6eqEYDgQZTQsLTGTkjioLHK/J6k66vZSNUm1vDbtQVB4ijths5RHb
 EYU40q2VxYO5tEuLP+XGHIlxQ9ZOuwye/aXeglfSPzEgJCFa7dn48MsJEU10vT74HMmN
 gHSBm7Ujvheg/xOfjGj65rbNQh8ykHvOx0XvzlA2VvSfbx2REN3RCK5yhGDFEwJABNy/
 5l3LzkQt8/v1y/oEObA0gV99/nPofm9RdmlxjyFv6Lk43kNu/pE0khTCQQ5Z6QE3qjTv
 Jthg==
X-Gm-Message-State: AOAM531qzs/YdsQHLvZnmMtkUtbvZhQXim2OrAqOI/uJn5BUOhhoe1DX
 nJHjT5LLaZzQknDoc7+Lhnk=
X-Google-Smtp-Source: ABdhPJyMVXO8nBe+OaeipfZkt0PBUdQMKuKquNYxip990clEABRyRRIfoiuDBtuEKOBF1uIhPVKPMg==
X-Received: by 2002:a17:902:8d8d:: with SMTP id
 v13mr1217653plo.67.1589920691460; 
 Tue, 19 May 2020 13:38:11 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id jx10sm325067pjb.46.2020.05.19.13.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:38:10 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed, 20 May 2020 05:37:46 +0900
Message-Id: <20200519203750.401593-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519203750.401593-1-shorne@gmail.com>
References: <20200519203750.401593-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/5] or1k: Implement profile hook calling _mcount
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
eCAyM2RiNzcxZDhmYi4uYmUwODk5MDBmZDQgMTAwNjQ0Ci0tLSBhL2djYy9jb25maWcvb3Ixay9v
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
