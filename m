Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF7543D642
	for <lists+openrisc@lfdr.de>; Thu, 28 Oct 2021 00:07:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4646B24230;
	Thu, 28 Oct 2021 00:07:17 +0200 (CEST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id D00072407D
 for <openrisc@lists.librecores.org>; Thu, 28 Oct 2021 00:07:15 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id i5so3003859pla.5
 for <openrisc@lists.librecores.org>; Wed, 27 Oct 2021 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2SjRePYpWRflHckARBoZ/uHMxihbmXvUUdkr0lOgDc=;
 b=NBccf2KVK8hDH9k8fzGIneX7sdueRa1Jor7MA84Am971Yuw3Q0JJQn8v4T1NL7bgZU
 fge4jnT3WfcweGciW0skielK9eqtKkf49QiTaSS0g9OAx6HHw57lCmUPcO4MT2XDeSvu
 z3BYXnogE/V7mowlxqict1n03NkRuSX6mDLEnNe6wOBNoqNsBgYMV/9OX9zNfYYwX7w6
 S0omJIeq5wOxmKZv1q4VTFA8Z11+H0LGF2BM1KE+RQajR8CgyjVfQiHNVkApy8b17BCT
 liN8kioAHvSM1lXUP02kcT5qCfG6WVX3rB9OaN3eMswT8Zv9UFSjwXEnCe7WpDfEie9B
 gRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2SjRePYpWRflHckARBoZ/uHMxihbmXvUUdkr0lOgDc=;
 b=5ELCxyJGZrdjx9Yu7L1+TtOaOVG4KCqsXg+0VuZw3dR8GnkNC3U0f6Gd++Uk1JqINQ
 PMjR6UpMptvBE8lpMp+8Cvkd71nrm9eKyWDu2/rC009CAz+IiReRO1XqEFcGOTITOj5s
 IZesBKLYWP1pakFofeIMXHAPuqAYETqPQd3jsGvqZJenh14EfSvpLyP+3dr1giYcLQoe
 vIRStM+Z2Ws2yWQKZQlfntDx29o75BZ+RdFgNZnsmciY1lPaOrHPBh41Vlp3hTRilbCf
 YqFWjeG5qCxxdWQljrH6P+tnXCiwGKI8y0QKy1SCfOJlr+rfkHmUhtOhrWUo6qubmDbT
 eaDQ==
X-Gm-Message-State: AOAM530Xaxe/PvZuIvwkSTZS0GFB8YUmksSTaN7XMMnnX3oXbdcrDKFc
 IArQ5W7SJHAgBxF7k9E27a0=
X-Google-Smtp-Source: ABdhPJxTFqBNYqPebngFmYI5K2p47zmnft4tLJR9gEL9vW4gl/5uhymzMWU0/lkmEAv25v5XR3jfSA==
X-Received: by 2002:a17:902:bd94:b0:13f:f96c:aa22 with SMTP id
 q20-20020a170902bd9400b0013ff96caa22mr382537pls.43.1635372434352; 
 Wed, 27 Oct 2021 15:07:14 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id j8sm883025pfe.105.2021.10.27.15.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 15:07:13 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 28 Oct 2021 07:07:09 +0900
Message-Id: <20211027220709.750104-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] or1k: Add return address argument to _mcount call
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

VGhpcyBmaXhlcyBhbiBpc3N1ZSBpbiB0aGUgZ2xpYmMgcG9ydCBJIGFtIHdvcmtpbmcgb24gd2hl
cmUgdGhlIGJ1aWxkCmZhaWxzIGR1ZSB0byB0aGUgd2FybmluZzoKCiAgZXJyb3I6IGNhbGxpbmcg
4oCYX19idWlsdGluX3JldHVybl9hZGRyZXNz4oCZIHdpdGggYSBub256ZXJvIGFyZ3VtZW50IGlz
IHVuc2FmZSBbLVdlcnJvcj1mcmFtZS1hZGRyZXNzXQoKVGhpcyBpcyBkdWUgdG8gaG93IHRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uIG9mIF9tY291bnQgaW4gZ2xpYmMgdXNlcwpfX2J1aWx0aW5f
cmV0dXJuX2FkZHJlc3Mgd2l0aCBhIGNvdW50IGFyZ3VtZW50IG9mIDEuCgpGaXggdGhhdCBieSBw
YXNzaW5nIHRoZSB2YWx1ZSBvZiBMUl9SRUdOVU0gdG8gdGhlIF9tY291bnQgZnVuY3Rpb24sCmVm
ZmVjdGl2dGx5IHByb3ZpZGluZyB0aGUgdmFsdWUgX21jb3VudCBpcyBhZnRlci4KClRoaXMgaXMg
YW4gQUJJIGNoYW5nZSwgYnV0IEkgdGhpbmsgaXQncyBPSyBiZWNhdXNlIHRoZSBnbGliYyBwb3J0
IGZvcgpvcjFrIGlzIG5vdCB5ZXQgdXBzdHJlYW1lZC4gIEFsc28sIEkgdGhpbmsganVzdCBhZGRp
bmcgYW4gYXJndW1lbnQKc2hvdWxkIG5vdCBicmVhayBhbnl0aGluZyBhbnl3YXkuCgpnY2MvQ2hh
bmdlTG9nOgoKCSogY29uZmlnL29yMWsvb3Ixay5oIChQUk9GSUxFX0hPT0spOiBBZGQgcmV0dXJu
IGFkZHJlc3MgYXJndW1lbnQKCXRvIF9tY291bnQuCi0tLQogZ2NjL2NvbmZpZy9vcjFrL29yMWsu
aCB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCBiL2djYy9jb25maWcvb3Ix
ay9vcjFrLmgKaW5kZXggZmUwMWFiODFlYWQuLjQ2MDNjYjY3MTYwIDEwMDY0NAotLS0gYS9nY2Mv
Y29uZmlnL29yMWsvb3Ixay5oCisrKyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmgKQEAgLTM4Nyw5
ICszODcsMTAgQEAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiAgICBwcm9maWxpbmcgYSBmdW5jdGlvbiBlbnRyeS4gICovCiAjZGVmaW5l
IFBST0ZJTEVfSE9PSyhMQUJFTCkJCQkJCQlcCiAgIHsJCQkJCQkJCQlcCi0gICAgcnR4IGZ1bjsJ
CQkJCQkJCVwKKyAgICBydHggZnVuLCByYTsJCQkJCQkJXAorICAgIHJhID0gZ2V0X2hhcmRfcmVn
X2luaXRpYWxfdmFsIChQbW9kZSwgTFJfUkVHTlVNKTsJCQlcCiAgICAgZnVuID0gZ2VuX3J0eF9T
WU1CT0xfUkVGIChQbW9kZSwgIl9tY291bnQiKTsJCQlcCi0gICAgZW1pdF9saWJyYXJ5X2NhbGwg
KGZ1biwgTENUX05PUk1BTCwgVk9JRG1vZGUpOwkJCVwKKyAgICBlbWl0X2xpYnJhcnlfY2FsbCAo
ZnVuLCBMQ1RfTk9STUFMLCBWT0lEbW9kZSwgcmEsIFBtb2RlKTsJCVwKICAgfQogCiAvKiBBbGwg
dGhlIHdvcmsgaXMgZG9uZSBpbiBQUk9GSUxFX0hPT0ssIGJ1dCB0aGlzIGlzIHN0aWxsIHJlcXVp
cmVkLiAgKi8KLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
