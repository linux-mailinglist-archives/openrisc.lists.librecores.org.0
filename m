Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 04003255764
	for <lists+openrisc@lfdr.de>; Fri, 28 Aug 2020 11:18:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0228920AB4;
	Fri, 28 Aug 2020 11:18:03 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 5291720C4F
 for <openrisc@lists.librecores.org>; Wed, 26 Aug 2020 16:33:13 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id t11so978723plr.5
 for <openrisc@lists.librecores.org>; Wed, 26 Aug 2020 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=AygPhIRiiTHUpr1pkdw/du88lBepQF3siyg0s1NHteQ=;
 b=ZAui/jR/CwDpdtAKBUQOn6w/6EFshzTWU77n6wX1/tw2IAXE4Bb3QkFkgJCLRShaV5
 utLegFIfttO2Gx0mEoLOLG2pvCgjQsIN4PY2NyY1+gNbrxMBy+DMr54xvJWl/mdEBVPr
 QgxanJkkq9C/N2//qQ5L6N76Ha86ET2/i7M6iPWNJjuTjcgrLyzcBCYHhyIi9y/KuMUg
 i1vMV+D8JvrJfbwTFGCai1OUyyLXF8Iqc2vUsPaKwnSC+oGJw/rYpPpYzW+QXSmlUvI1
 pRN7yV0OMoNKOnrR0hAI/1nuDxkb9cYfJTTOjkQhqozkAfsPPWe1NBWBXhKmSD8d1c37
 uitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AygPhIRiiTHUpr1pkdw/du88lBepQF3siyg0s1NHteQ=;
 b=fJvcdK9Iu7yHEfVhPBJmTLA5IQcGgaG6pC58K92ze8q9KgUWodONEbeeHDpoTrc8w/
 X169PwHf42muhX4CkLEQNqxMlX46DMumwQuWt64/AgNlmUbfgnDJb4cYi9rqtwoNO55b
 LIi3mNuXTFZ8wKyOPqtInXMSnlVeg0wyj+2x7iRz6vsdNXyF9+Kl0NOBOLPYsqcn6qF3
 4q68u8yQP1a0g0O8xHaq2aYDsIgGhyJ+hXx84XnS7U2uCAo8szpEaAf3fNrfUGlRaHUU
 KGTchqv37GhjNI052BbXDHGLWZ+UajnwHRIYrK9QaRmDxmJB8vYcMkwhSwuZfpKpdJ8g
 4ntA==
X-Gm-Message-State: AOAM531E9HCR5erSa9nQjkdjpS3iy0gVBaFI6GSmQXWsTpx3PoMrv0N9
 9X9/wkpwPqAXfXHa+M5reYQ=
X-Google-Smtp-Source: ABdhPJxZdzZq9AvbLwTQl7LVD5O/slshPyqOTFJ84mHYa5luHRCEvJImAFN6vU1uDUdJELgynVfgLQ==
X-Received: by 2002:a17:90b:4c84:: with SMTP id
 my4mr6193251pjb.213.1598452391561; 
 Wed, 26 Aug 2020 07:33:11 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id a19sm3208848pfn.10.2020.08.26.07.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:33:10 -0700 (PDT)
Date: Thu, 27 Aug 2020 00:33:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Stafford Horne <shorne@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
 <20200728033405.78469-15-npiggin@gmail.com>
 <20200729114554.GG80756@lianli.shorne-pla.net>
In-Reply-To: <20200729114554.GG80756@lianli.shorne-pla.net>
MIME-Version: 1.0
Message-Id: <1598452354.xwvdyvp4t6.astroid@bobo.none>
X-Mailman-Approved-At: Fri, 28 Aug 2020 11:18:01 +0200
Subject: Re: [OpenRISC] [PATCH 14/24] openrisc: use
 asm-generic/mmu_context.h for no-op implementations
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RXhjZXJwdHMgZnJvbSBTdGFmZm9yZCBIb3JuZSdzIG1lc3NhZ2Ugb2YgSnVseSAyOSwgMjAyMCA5
OjQ1IHBtOgo+IE9uIFR1ZSwgSnVsIDI4LCAyMDIwIGF0IDAxOjMzOjU1UE0gKzEwMDAsIE5pY2hv
bGFzIFBpZ2dpbiB3cm90ZToKPj4gQ2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4K
Pj4gQ2M6IFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0
aS5maT4KPj4gQ2M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+PiBDYzogb3Bl
bnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKPj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGln
Z2luIDxucGlnZ2luQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBhcmNoL29wZW5yaXNjL2luY2x1ZGUv
YXNtL21tdV9jb250ZXh0LmggfCA4ICsrKy0tLS0tCj4+ICBhcmNoL29wZW5yaXNjL21tL3RsYi5j
ICAgICAgICAgICAgICAgICAgfCAyICsrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL21tdV9jb250ZXh0LmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9j
b250ZXh0LmgKPj4gaW5kZXggY2VkNTc3NTQyZTI5Li5hNjcwMjM4NGM3N2QgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAo+PiArKysgYi9hcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmgKPj4gQEAgLTE3LDEzICsxNywxMyBA
QAo+PiAgCj4+ICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvbW1faG9va3MuaD4KPj4gIAo+PiArI2Rl
ZmluZSBpbml0X25ld19jb250ZXh0IGluaXRfbmV3X2NvbnRleHQKPj4gIGV4dGVybiBpbnQgaW5p
dF9uZXdfY29udGV4dChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAq
bW0pOwo+PiArI2RlZmluZSBkZXN0cm95X2NvbnRleHQgZGVzdHJveV9jb250ZXh0Cj4+ICBleHRl
cm4gdm9pZCBkZXN0cm95X2NvbnRleHQoc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+PiAgZXh0ZXJu
IHZvaWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKnByZXYsIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km5leHQsCj4+ICAJCSAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKPj4gIAo+PiAtI2Rl
ZmluZSBkZWFjdGl2YXRlX21tKHRzaywgbW0pCWRvIHsgfSB3aGlsZSAoMCkKPj4gLQo+PiAgI2Rl
ZmluZSBhY3RpdmF0ZV9tbShwcmV2LCBuZXh0KSBzd2l0Y2hfbW0oKHByZXYpLCAobmV4dCksIE5V
TEwpCj4+ICAKPj4gIC8qIGN1cnJlbnQgYWN0aXZlIHBnZCAtIHRoaXMgaXMgc2ltaWxhciB0byBv
dGhlciBwcm9jZXNzb3JzIHBnZAo+PiBAQCAtMzIsOCArMzIsNiBAQCBleHRlcm4gdm9pZCBzd2l0
Y2hfbW0oc3RydWN0IG1tX3N0cnVjdCAqcHJldiwgc3RydWN0IG1tX3N0cnVjdCAqbmV4dCwKPj4g
IAo+PiAgZXh0ZXJuIHZvbGF0aWxlIHBnZF90ICpjdXJyZW50X3BnZFtdOyAvKiBkZWZpbmVkIGlu
IGFyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYyAqLwo+PiAgCj4+IC1zdGF0aWMgaW5saW5lIHZvaWQg
ZW50ZXJfbGF6eV90bGIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB0YXNrX3N0cnVjdCAq
dHNrKQo+PiAtewo+PiAtfQo+PiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL21tdV9jb250ZXh0Lmg+
Cj4gCj4gVGhpcyBsb29rcyBvay4KPiAKPj4gICNlbmRpZgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9v
cGVucmlzYy9tbS90bGIuYyBiL2FyY2gvb3BlbnJpc2MvbW0vdGxiLmMKPj4gaW5kZXggNGI2ODBh
ZWQ4ZjVmLi44MjFhYWI0Y2YzYmUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvb3BlbnJpc2MvbW0vdGxi
LmMKPj4gKysrIGIvYXJjaC9vcGVucmlzYy9tbS90bGIuYwo+PiBAQCAtMTU5LDYgKzE1OSw3IEBA
IHZvaWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKnByZXYsIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km5leHQsCj4+ICAgKiBpbnN0YW5jZS4KPj4gICAqLwo+PiAgCj4+ICsjZGVmaW5lIGluaXRfbmV3
X2NvbnRleHQgaW5pdF9uZXdfY29udGV4dAo+PiAgaW50IGluaXRfbmV3X2NvbnRleHQoc3RydWN0
IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+PiAgewo+PiAgCW1tLT5j
b250ZXh0ID0gTk9fQ09OVEVYVDsKPj4gQEAgLTE3MCw2ICsxNzEsNyBAQCBpbnQgaW5pdF9uZXdf
Y29udGV4dChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4+
ICAgKiBkcm9wcyBpdC4KPj4gICAqLwo+PiAgCj4+ICsjZGVmaW5lIGRlc3Ryb3lfY29udGV4dCBk
ZXN0cm95X2NvbnRleHQKPj4gIHZvaWQgZGVzdHJveV9jb250ZXh0KHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKQo+PiAgewo+PiAgCWZsdXNoX3RsYl9tbShtbSk7Cj4gCj4gSSBkb24ndCB0aGluayB3ZSBu
ZWVkIHRoZSAjZGVmaW5lJ3MgaW4gdGhlIC5jIGZpbGUuICBEbyB3ZT8KCllvdSdyZSByaWdodCwg
SSBmaXhlZCB0aGF0IGFuZCB0aGUgc2FtZSBpc3N1ZSBpbiBhbm90aGVyIGFyY2guCgpUaGFua3Ms
Ck5pY2sKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
