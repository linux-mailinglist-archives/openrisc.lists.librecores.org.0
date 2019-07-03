Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C4F865DD0B
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 05:34:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ABC2F20334;
	Wed,  3 Jul 2019 05:34:19 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 6CDE120341
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 05:34:17 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id j2so486884pfe.6
 for <openrisc@lists.librecores.org>; Tue, 02 Jul 2019 20:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPNA0bNPG3wRs6D8w48TWd+PglinH8hBFBH08CNOxdg=;
 b=QeB2gh/bCyYEHCUDe9E55e6hn8ij6/n/JPbu6YpOsbW67Jsj4Q7mNUa1iDxHEgwnoS
 GkbBoJ1KVUd09ExQn1Fz5BpBvFTZLRsMYR/tgNLPRoLnLot/V895VRA9UV26lYdzmiui
 HI7Jawabz+HqGaNpGyPeIFOuWycxJYro7fbxg2Z3lHAywIuYpJaKyZw6ctqFHjBB39+G
 s2Dn55flM4Y2/LlA9Zn6K40ArQteBEDAz4VIALUNFSqBAo6PHbXEPDqndc5jRfWXt78R
 BkBIV5YzDC1hLyhCS3ockq+6N0criFnkRCHwDDLQj5+k5xF/66uI1ytFY4KaKWJ73kaE
 Nm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPNA0bNPG3wRs6D8w48TWd+PglinH8hBFBH08CNOxdg=;
 b=c9kNFaPZ1jkfjeptQ76V45AuNIslSHljX6U+pYJw939Wq+nnTac51gBT/Rp1y2IrW3
 ikqsHoiMNwjpnEvoKNzAel2UpJvPF1LS4PTHqZyiiwdRJJ9AA7+rA2Cne1ERDyl7eeFq
 0MV+e3UFoh63swdfauj7O/aTE1OwXwXkxdeHnEbaG4Wdbwxdja9jpfw2JCaJQ4+qwg2G
 fQwRTTpPwCBS7g8WWW8SHSQeieOfY58eJGx8LaG2HVxchDqziFal1KDsn4akTvL30VkO
 sR/zodruzIQ1TrvDXxOLPnYuC5qEcN97zeRbQgZMLH52aA1DaumZMA6FA5ucnKyZIGal
 N8Fg==
X-Gm-Message-State: APjAAAUvFB9YsWncpMU16Z2uoCFCfEvpYq05LCm8WMxFfBAtgQ7qejgB
 Wu7iThnAP4UdHw4g81qrnmo=
X-Google-Smtp-Source: APXvYqylvldT6p/CuYMKxHvIkFcH3PJW9+fCM4modKB3xUeg9qH4E1eTK3dLyXNPQw3nIC70QJIZNA==
X-Received: by 2002:a63:6cc9:: with SMTP id
 h192mr33751544pgc.339.1562124855997; 
 Tue, 02 Jul 2019 20:34:15 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id v27sm531659pgn.76.2019.07.02.20.34.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 20:34:15 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed,  3 Jul 2019 12:33:51 +0900
Message-Id: <20190703033351.11924-6-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703033351.11924-1-shorne@gmail.com>
References: <20190703033351.11924-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 5/5] or1k: only force reg for immediates
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGZvcmNlX3JlZyBpbiBvcjFrX2V4cGFuZF9jb21wYXJlIGlzIGhhcmQgY29kZWQgZm9yIFNJ
bW9kZSwgd2hpY2ggaXMgZmluZSBhcwp0aGlzIHVzZWQgdG8gb25seSBiZSB1c2VkIG9uIFNJIGV4
cGFuZHMuICBIb3dldmVyLCB3aXRoIEZQIHN1cHBvcnQgdGhpcyB3aWxsCmNhdXNlIGlzc3Vlcy4g
IEluIGdlbmVyYWwgd2Ugc2hvdWxkIG9ubHkgZm9yY2UgdGhlIHJpZ2h0IGhhbmQgb3BlcmFuZCB0
byBhCnJlZ2lzdGVyIGlmIGl0cyBhbiBpbW1lZGlhdGUuICBUaGlzIHBhdGNoIGFkZHMgYW4gY29u
ZGl0aW9uIHRvIGNoZWNrIGZvciB0aGF0LgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFr
L29yMWsuYyAob3Ixa19leHBhbmRfY29tcGFyZSk6IENoZWNrIGZvciBpbnQgYmVmb3JlCglmb3Jj
ZV9yZWcuCi0tLQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBub25lCgogZ2NjL2NvbmZpZy9vcjFrL29y
MWsuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9vcjFrL29yMWsuYyBiL2djYy9j
b25maWcvb3Ixay9vcjFrLmMKaW5kZXggZDkwODI2Yjc1Y2EuLmU0YWZmODNjZWM3IDEwMDY0NAot
LS0gYS9nY2MvY29uZmlnL29yMWsvb3Ixay5jCisrKyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmMK
QEAgLTE0NDYsMTMgKzE0NDYsMTUgQEAgdm9pZAogb3Ixa19leHBhbmRfY29tcGFyZSAocnR4ICpv
cGVyYW5kcykKIHsKICAgcnR4IHNyX2YgPSBnZW5fcnR4X1JFRyAoQkltb2RlLCBTUl9GX1JFR05V
TSk7CisgIHJ0eCByaWdodGhhbmRfb3AgPSBYRVhQIChvcGVyYW5kc1swXSwgMSk7CiAgIHJ0eF9j
b2RlIGNtcF9jb2RlID0gR0VUX0NPREUgKG9wZXJhbmRzWzBdKTsKICAgYm9vbCBmbGFnX2NoZWNr
X25lID0gdHJ1ZTsKIAotICAvKiBUaGUgUlRMIG1heSByZWNlaXZlIGFuIGltbWVkaWF0ZSBpbiBh
cmd1bWVudCAxIG9mIHRoZSBjb21wYXJlLCB0aGlzIGlzIG5vdAotICAgICBzdXBwb3J0ZWQgdW5s
ZXNzIHdlIGhhdmUgbC5zZippIGluc3RydWN0aW9ucywgZm9yY2UgdGhlbSBpbnRvIHJlZ2lzdGVy
cy4gICovCi0gIGlmICghVEFSR0VUX1NGSU1NKQotICAgIFhFWFAgKG9wZXJhbmRzWzBdLCAxKSA9
IGZvcmNlX3JlZyAoU0ltb2RlLCBYRVhQIChvcGVyYW5kc1swXSwgMSkpOworICAvKiBJbnRlZ2Vy
IFJUTCBtYXkgcmVjZWl2ZSBhbiBpbW1lZGlhdGUgaW4gYXJndW1lbnQgMSBvZiB0aGUgY29tcGFy
ZSwgdGhpcyBpcworICAgICBub3Qgc3VwcG9ydGVkIHVubGVzcyB3ZSBoYXZlIGwuc2YqaSBpbnN0
cnVjdGlvbnMsIGZvcmNlIHRoZW0gaW50bworICAgICByZWdpc3RlcnMuICAqLworICBpZiAoIVRB
UkdFVF9TRklNTSAmJiBDT05TVF9JTlRfUCAocmlnaHRoYW5kX29wKSkKKyAgICBYRVhQIChvcGVy
YW5kc1swXSwgMSkgPSBmb3JjZV9yZWcgKFNJbW9kZSwgcmlnaHRoYW5kX29wKTsKIAogICAvKiBO
b3JtYWxpemUgY29tcGFyaXNvbiBvcGVyYXRvcnMgdG8gb25lcyBPcGVuUklTQyBzdXBwb3J0LiAg
Ki8KICAgc3dpdGNoIChjbXBfY29kZSkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
