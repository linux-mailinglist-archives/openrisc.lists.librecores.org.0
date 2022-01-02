Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 924844828CA
	for <lists+openrisc@lfdr.de>; Sun,  2 Jan 2022 01:03:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3C1D824310;
	Sun,  2 Jan 2022 01:03:38 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id F3A9C23600
 for <openrisc@lists.librecores.org>; Sun,  2 Jan 2022 01:03:35 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so19195320pjc.1
 for <openrisc@lists.librecores.org>; Sat, 01 Jan 2022 16:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euZnA8Zb9UGI+rbOh7oT8YFaaVLoN0moTqEJVq0qLZU=;
 b=O3nAPmxN8+4GCaD8X1d8Js8ejaRnuosqbpJ4RHt5M1Vo3KoZfQR1QTWqzEqPvP83Px
 l7F0FdgJ94JFRCTTW4lYCA2jzWq6Y/g3953dAfGlKn+jgRq3yLbrf7UwszIsESl3Hv97
 pjAihL6fh+mACxIteWIKR052XKz+bzOUxI1NhoAfroD9ChCt4PwTq/2OQwyoghmGayeT
 4ZuO94aLNCwgs8YqZYwg90bZG58Wx3TLjxM4Z2s4bwsWEgz/WR73QMPTOA0aJUkxYvcQ
 9/AlVcxv+Hb4x0VSvZ3/1xMHGbcHXUvQPovGi/oNtYGNnHBakWQ3ZD8eVX+4KDJWm2Cg
 kNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euZnA8Zb9UGI+rbOh7oT8YFaaVLoN0moTqEJVq0qLZU=;
 b=6WtIBT1eyG1P/VKzdLX1+wBk7CjS+XIlaCDoMYpb8FSyVfKU/1Y3NDp630fewJkY43
 8Pt3ETt4EtYhbxINJQ5JHljX6bwDairS+weC9gkqfujC4hhCOP6RVy4vRxZCgrOj9YTm
 wjncru0FsPk4UvE6zoXI7LAMQxcw04Cri8rGBCY5Ftqq/R3yqWJDE9Os76w7Xg6jQlEp
 dnwEHXPan0IfE2fnb2rBIiyxqVQasOz8tXSFEa7LrWk1SAOw2qrsrXDtQo/vsDkK5v67
 Et1QMicfrK0CLIB9tQPnXeY8tMMv0MWFf68i23EtL1IbvSb7sYfq3YhHOvOQ+xqzT1DD
 DfKQ==
X-Gm-Message-State: AOAM533rcZAH3hCujeO4sPF3BDYS9dW3JC+7gytblcNndZRIzbd8atY5
 5zUE/6Hepho8zD8YCgi6aEA=
X-Google-Smtp-Source: ABdhPJwmO6d6nZ36epjIIeOuPFYphsuY5kk7/6PFjFKvzJC35Bd1ahIOvs8AAEgIqKZWf5lmyI12AQ==
X-Received: by 2002:a17:902:aa43:b0:143:e20b:f37f with SMTP id
 c3-20020a170902aa4300b00143e20bf37fmr39973430plr.65.1641081814421; 
 Sat, 01 Jan 2022 16:03:34 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id c17sm28144066pjs.34.2022.01.01.16.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 16:03:33 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Sun,  2 Jan 2022 09:03:28 +0900
Message-Id: <20220102000328.3982587-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by
 using special howto
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UHJldmlvdXNseSB3aGVuIGZpeGluZyBQUiAyMTQ2NCB3ZSBtYXNrZWQgb3V0IHVwcGVyIGJpdHMg
b2YgdGhlCnJlbG9jYXRpb24gdmFsdWUgaW4gb3JkZXIgdG8gYXZvaWQgb3ZlcmZsb3cgY29tcGxh
aW50cyB3aGVuIGFjY2VwdGFibGUuCkl0IHR1cm5zIG91dCB0aGlzIGRvZXMgbm90IHdvcmsgd2hl
biB0aGUgcmVsb2NhdGlvbiB2YWx1ZSBlbmRzIHVwIGJlaW5nCnNpZ25lZC4KClRvIGZpeCB0aGlz
IHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHNwZWNpYWwgaG93dG8gd2l0aApjb21wbGFpbl9vbl9v
dmVyZmxvdyBzZXQgdG8gY29tcGxhaW5fb3ZlcmZsb3dfZG9udC4gIFRoaXMgaXMgdXNlZCBpbgpw
bGFjZSBvZiB0aGUgbm9ybWFsIFJfT1IxS19HT1QxNiBob3d0byB3aGVuIHdlIGRldGVjdCBSX09S
MUtfR09UX0FISTE2CnJlbG9jYXRpb25zLgoKYmZkL0NoYW5nZUxvZzoKCglQUiAyODczNQoJKiBl
bGYzMi1vcjFrLmMgKG9yMWtfZWxmX2dvdDE2X25vX292ZXJmbG93X2hvd3RvKTogRGVmaW5lLgoJ
KG9yMWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24pOiBVc2UgbmV3IGhvd3RvIGluc3RlYWQgb2YgdHJ5
aW5nIHRvCgltYXNrIG91dCByZWxvY2F0aW9uIGJpdHMuCi0tLQogYmZkL2VsZjMyLW9yMWsuYyB8
IDI0ICsrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmZkL2VsZjMyLW9yMWsuYyBiL2Jm
ZC9lbGYzMi1vcjFrLmMKaW5kZXggNGY5MDkyNTM5ZjUuLmEyZmY0NzQ3M2E3IDEwMDY0NAotLS0g
YS9iZmQvZWxmMzItb3Ixay5jCisrKyBiL2JmZC9lbGYzMi1vcjFrLmMKQEAgLTgyOCw2ICs4Mjgs
MjMgQEAgc3RhdGljIHJlbG9jX2hvd3RvX3R5cGUgb3Ixa19lbGZfaG93dG9fdGFibGVbXSA9CiAJ
IGZhbHNlKSwJCS8qIHBjcmVsX29mZnNldCAqLwogfTsKIAorLyogQSBjb3B5IG9mIHRoZSBSX09S
MUtfR09UMTYgdXNlZCBpbiB0aGUgcHJlc2Vuc2Ugb2YgUl9PUjFLX0dPVF9BSEkxNgorICAgcmVs
b2NhdGlvbnMgd2hlbiB3ZSBrbm93IHdlIGNhbiBpZ25vcmUgb3ZlcmZsb3dzLiAgKi8KK3N0YXRp
YyByZWxvY19ob3d0b190eXBlIG9yMWtfZWxmX2dvdDE2X25vX292ZXJmbG93X2hvd3RvID0KKyAg
SE9XVE8gKFJfT1IxS19HT1QxNiwJCS8qIHR5cGUgKi8KKwkgMCwJCQkvKiByaWdodHNoaWZ0ICov
CisJIDIsCQkJLyogc2l6ZSAoMCA9IGJ5dGUsIDEgPSBzaG9ydCwgMiA9IGxvbmcpICovCisJIDE2
LAkJCS8qIGJpdHNpemUgKi8KKwkgZmFsc2UsCQkJLyogcGNfcmVsYXRpdmUgKi8KKwkgMCwJCQkv
KiBiaXRwb3MgKi8KKwkgY29tcGxhaW5fb3ZlcmZsb3dfZG9udCwgLyogY29tcGxhaW5fb25fb3Zl
cmZsb3cgKi8KKwkgYmZkX2VsZl9nZW5lcmljX3JlbG9jLCAvKiBzcGVjaWFsX2Z1bmN0aW9uICov
CisJICJSX09SMUtfR09UMTYiLAkvKiBuYW1lICovCisJIGZhbHNlLAkJCS8qIHBhcnRpYWxfaW5w
bGFjZSAqLworCSAwLAkJCS8qIHNyY19tYXNrICovCisJIDB4ZmZmZiwJCS8qIGRzdF9tYXNrICov
CisJIGZhbHNlKTsJCS8qIHBjcmVsX29mZnNldCAqLworCiAvKiBNYXAgQkZEIHJlbG9jIHR5cGVz
IHRvIE9yMWsgRUxGIHJlbG9jIHR5cGVzLiAgKi8KIAogc3RydWN0IG9yMWtfcmVsb2NfbWFwCkBA
IC0xNTA2LDEyICsxNTIzLDExIEBAIG9yMWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24gKGJmZCAqb3V0
cHV0X2JmZCwKIAkgICAgaWYgKHJfdHlwZSA9PSBSX09SMUtfR09UX0FISTE2KQogCSAgICAgIHNh
d19nb3RoYSA9IHRydWU7CiAKLQkgICAgLyogSWYgd2UgaGF2ZSBhIFJfT1IxS19HT1QxNiBmb2xs
b3dlZCBieSBhIFJfT1IxS19HT1RfQUhJMTYKKwkgICAgLyogSWYgd2UgaGF2ZSBhIFJfT1IxS19H
T1QxNiBmb2xsb3dpbmcgYSBSX09SMUtfR09UX0FISTE2CiAJICAgICAgIHJlbG9jYXRpb24gd2Ug
YXNzdW1lIHRoZSBjb2RlIGlzIGRvaW5nIHRoZSByaWdodCB0aGluZyB0byBhdm9pZAotCSAgICAg
ICBvdmVyZmxvd3MuICBIZXJlIHdlIG1hc2sgdGhlIGxvd2VyIDE2LWJpdCBvZiB0aGUgcmVsb2Nh
dGlvbiB0bwotCSAgICAgICBhdm9pZCBvdmVyZmxvdyB2YWxpZGF0aW9uIGZhaWx1cmVzLiAgKi8K
KwkgICAgICAgb3ZlcmZsb3dzLiAgKi8KIAkgICAgaWYgKHJfdHlwZSA9PSBSX09SMUtfR09UMTYg
JiYgc2F3X2dvdGhhKQotCSAgICAgIHJlbG9jYXRpb24gJj0gMHhmZmZmOworCSAgICAgIGhvd3Rv
ID0gJm9yMWtfZWxmX2dvdDE2X25vX292ZXJmbG93X2hvd3RvOwogCiAJICAvKiBBZGRlbmQgc2hv
dWxkIGJlIHplcm8uICAqLwogCSAgaWYgKHJlbC0+cl9hZGRlbmQgIT0gMCkKLS0gCjIuMzEuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
