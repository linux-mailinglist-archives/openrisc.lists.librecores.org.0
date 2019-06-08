Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0085F3A231
	for <lists+openrisc@lfdr.de>; Sat,  8 Jun 2019 23:32:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DD3F520264;
	Sat,  8 Jun 2019 23:32:47 +0200 (CEST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mail.librecores.org (Postfix) with ESMTPS id 6B9F920261
 for <openrisc@lists.librecores.org>; Sat,  8 Jun 2019 23:32:46 +0200 (CEST)
Received: by mail-pf1-f171.google.com with SMTP id s11so3084353pfm.12
 for <openrisc@lists.librecores.org>; Sat, 08 Jun 2019 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ac6y1wD03UY3DeVWSa//4iABBBeljLW/KZZ34rirr/k=;
 b=knHItD47kpFm8IJOJRNYF0Ohhum2nX4Y53Yyp9T0/o978P8YpMKfmPXGz/02y4tzDL
 AX0G62/hpEI68ob0mEOqMTnHeug4LteFCYnK1fZ5Utg0SjHfINpOAO8B8c04ZSsjrEDq
 S3xCa48AZp6MO6aIbzoOUgk6Jh6qDJlFKs3OrutmDMxNnawzHNLNgMQdcktaMKdsP5Sk
 JWw9lVHj15g9eh3wllTbI2s7Gaf+LP/5ZXjJX+UYcyCqL9OPUUBtlCPUwPMP91DKRI8I
 Xbt0WX19DQwcx9NrWnzTds3/eXAp1NRg9L49AC/srk4YAAAAWS/iH6cGvcKApz4oyCYX
 LZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ac6y1wD03UY3DeVWSa//4iABBBeljLW/KZZ34rirr/k=;
 b=dG71J/fMQmvxp0XVGawwPSmTJFWaDncNElDw0rO0qr1o9MJdz5rc9FlGnST0Y4k+iW
 8Sjnp3kkMoN7s7339CaSDceR4bfxCQy0RnZJeP4L5evBZ4PMdJkpybH1LKgxqXpXiU26
 Qxc7Gjp4p7ks80AJ3p8fPPL74K1SQjSF//djkKvh0h/F5+DmxvDUhsdzwykh1DL8lJcp
 abhY+HL/t1ZMyvibqjtMR0Xi3rrxD4QCDJh6vUpzhIxHNjFRRnXEEYF+hUu8qrvwR0+8
 F1qnoq/NQilB/ZEKXy3tE8CqR568+vFCqnIuf2Ql3EAazMDeRJKzSgBX5cBkNvuXjhCB
 6mDg==
X-Gm-Message-State: APjAAAXByPiC6yJGPCAGwd0r4rkmPe+nvJHjGQtyEDoU8VAuNzs/fn9Q
 NjK6+5wnt/hu3NRJa3iD420=
X-Google-Smtp-Source: APXvYqzgBUukXNaAMIoRzONCEzj5cBIJ3YkdIm81ZH578Rmb85nlKIigz2xfO3y7Cloi2g2LojjZbw==
X-Received: by 2002:a17:90a:17c4:: with SMTP id
 q62mr13189817pja.104.1560029565013; 
 Sat, 08 Jun 2019 14:32:45 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id p17sm2824300pjo.1.2019.06.08.14.32.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 14:32:44 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>,
 GNU Binutils <binutils@sourceware.org>
Date: Sun,  9 Jun 2019 06:32:19 +0900
Message-Id: <20190608213225.3230-4-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608213225.3230-1-shorne@gmail.com>
References: <20190608213225.3230-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 03/11] cpu/or1k: Document no branch delay slot
 architectures and l.adrp
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlICduZCcgYXJjaGl0ZWN0dXJlcyBkaWQgbm90IG1lbnRpb24gd2hhdCB0aGUgJ25kJyBzdGFu
ZHMgZm9yLgpEb2N1bWVudCB0aGF0IHRoZXNlIG1lYW4gJ25vIGJyYWNoIGRlbGF5IHNsb3QnLgoK
Y3B1L0NoYW5nZUxvZzoKCnl5eXktbW0tZGQgIFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWls
LmNvbT4KCgkqIG9yMWsuY3B1IChvcjY0bmQsIG9yMzJuZCwgb3IxMjAwbmQpOiBVcGRhdGUgY29t
bWVudC5hCgkobC1hZHJwKTogSW1wcm92ZSBjb21tZW50LgotLS0KIGNwdS9vcjFrLmNwdSAgICAg
IHwgNiArKystLS0KIGNwdS9vcjFrb3JiaXMuY3B1IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY3B1L29yMWsuY3B1
IGIvY3B1L29yMWsuY3B1CmluZGV4IGUxYWUxYjhjODguLmI3OTY4NjJkMWIgMTAwNjQ0Ci0tLSBh
L2NwdS9vcjFrLmNwdQorKysgYi9jcHUvb3Ixay5jcHUKQEAgLTc3LDcgKzc3LDcgQEAKIAogICAg
ICAgKGRlZmluZS1tYWNoCiAgICAgICAgIChuYW1lIG9yMzJuZCkKLSAgICAgICAgKGNvbW1lbnQg
IkdlbmVyaWMgT3BlblJJU0MgMTAwMCAzMi1iaXQgQ1BVIikKKyAgICAgICAgKGNvbW1lbnQgIkdl
bmVyaWMgT3BlblJJU0MgMTAwMCAzMi1iaXQgQ1BVIHdpdGggbm8gYnJhbmNoIGRlbGF5IHNsb3Qi
KQogICAgICAgICAoY3B1IG9yMWszMmJmKQogICAgICAgICAoYmZkLW5hbWUgIm9yMWtuZCIpCiAg
ICAgICAgICkKQEAgLTkyLDcgKzkyLDcgQEAKIAogICAgICAgOyBPcGVuUklTQyAxMjAwIC0gMzIt
Yml0IG9yMWsgQ1BVIGltcGxlbWVudGF0aW9uCiAgICAgICAoZGVmaW5lLW1vZGVsCi0gICAgICAg
IChuYW1lIG9yMTIwMG5kKSAoY29tbWVudCAiT3BlblJJU0MgMTIwMCBtb2RlbCIpCisgICAgICAg
IChuYW1lIG9yMTIwMG5kKSAoY29tbWVudCAiT3BlblJJU0MgMTIwMCBtb2RlbCB3aXRoIG5vIGJy
YW5jaCBkZWxheSBzbG90IikKICAgICAgICAgKGF0dHJzIE5PLURFTEFZLVNMT1QpCiAgICAgICAg
IChtYWNoIG9yMzJuZCkKICAgICAgICAgKHVuaXQgdS1leGVjICJFeGVjdXRpb24gVW5pdCIgKCkg
MSAxICgpICgpICgpICgpKQpAQCAtMTIwLDcgKzEyMCw3IEBACiAKICAgICAgIChkZWZpbmUtbWFj
aAogICAgICAgICAobmFtZSBvcjY0bmQpCi0gICAgICAgIChjb21tZW50ICJHZW5lcmljIE9wZW5S
SVNDIDEwMDAgTkQgNjQtYml0IENQVSIpCisgICAgICAgIChjb21tZW50ICJHZW5lcmljIE9wZW5S
SVNDIDEwMDAgTkQgNjQtYml0IENQVSB3aXRoIG5vIGJyYW5jaCBkZWxheSBzbG90IikKICAgICAg
ICAgKGNwdSBvcjFrNjRiZikKICAgICAgICAgKGJmZC1uYW1lICJvcjFrNjRuZCIpCiAgICAgICAg
ICkKZGlmZiAtLWdpdCBhL2NwdS9vcjFrb3JiaXMuY3B1IGIvY3B1L29yMWtvcmJpcy5jcHUKaW5k
ZXggMzA4ZjM3ODYxZC4uMzc0MWQ0YzhmNyAxMDA2NDQKLS0tIGEvY3B1L29yMWtvcmJpcy5jcHUK
KysrIGIvY3B1L29yMWtvcmJpcy5jcHUKQEAgLTQzMyw3ICs0MzMsNyBAQAogICAgICAgICAgICAp
CiAgICkKIAotKGRuaSBsLWFkcnAgImFkcnAgcmVnL2Rpc3AyMSIKKyhkbmkgbC1hZHJwICJsb2Fk
IHBjLXJlbGF0aXZlIHBhZ2UgYWRkcmVzcyIKICAgICAoKE1BQ0ggT1JCSVMtTUFDSFMpKQogICAg
ICJsLmFkcnAgJHJELCR7ZGlzcDIxfSIKICAgICAoKyBPUENfQURSUCByRCBkaXNwMjEpCi0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
