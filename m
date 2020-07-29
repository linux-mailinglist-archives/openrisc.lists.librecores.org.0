Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E2DF2231DA3
	for <lists+openrisc@lfdr.de>; Wed, 29 Jul 2020 13:46:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 729EB20D48;
	Wed, 29 Jul 2020 13:46:01 +0200 (CEST)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id 25F8620C6F
 for <openrisc@lists.librecores.org>; Wed, 29 Jul 2020 13:45:59 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id l63so14107439pge.12
 for <openrisc@lists.librecores.org>; Wed, 29 Jul 2020 04:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rnSHWpSGzohq9BhD/C5rl6PYPh18BOuLPWnyUBOdMSk=;
 b=J+A4zrhh/K095SpdzjX1CgPX766Epnk6LbUcVSeK3q5d0KW6pywZilp6N76R34FIlg
 VqLOX/UjD3jVuyeRpAPygMZp/nq5EulAg2VVaJ7aroMRYqeuIwBI6egsPGPVrBHUDJkD
 /aE2w6XsNBtY884+iLTCYWY81p2t4BQb+si4l+o7hOWx2mNZOLSnIa694qtY6oDKiA04
 04tkBtLi+CZK1xV7bS1dB4+sHL+KaS4cLVI/H2CroCmCFQSHErwzCwxRyAFXP+MSKXV5
 +m7F5PbmbIFc7q8wkYErNJJLFTNvDvJ+mgKbvTTkypkEEXIfPf95yfMvkw7dCsu4aZ4H
 vBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnSHWpSGzohq9BhD/C5rl6PYPh18BOuLPWnyUBOdMSk=;
 b=P2cXniIkI5pEQCrTKU1kKNzmtvxBEgA0bV3vL9sxQdNrc6nEb8QhQXb9FFg6mIwc8H
 5rnyRhP7PjmCBvMbGG9IQDkozKieRe+CvyjqVn/JEc6yyvrjgLGRY4m8P80zdRzsjtfE
 8Zyp+Mxcd3tOByEnhlXK0vG3Y5cb5SSJiCASYVjKYCopjVOHzjhORWpVMz/E2at+EQTS
 qUhPId0aTDYCha3EhxZxM85nEkLUB7vnP6umRn2M4L0DmcZsDZh5cuXpk78Loy9Dj3L1
 n8ZqJZP3vufuUbJqbBxxxR8w7MY9kLLx3XL67mJ2QkpUGuwOjL3EFFguL0ej/vnzcq0M
 UvNA==
X-Gm-Message-State: AOAM531S5wLVzB5tdtYKuxKsb7HblsvULtbzclOCjFkE5N8fbzML/tNe
 CkrjL7498yJ6Xs5gstPAIGk=
X-Google-Smtp-Source: ABdhPJyjQVFbxP+CyHoZIHRWD+Yqf5j/tnegtYmAsoD0wYfkwzMe5cQTFyjC3B/OV628Iaka0B/EeQ==
X-Received: by 2002:a63:6486:: with SMTP id y128mr27631994pgb.82.1596023157675; 
 Wed, 29 Jul 2020 04:45:57 -0700 (PDT)
Received: from localhost (g155.222-224-148.ppp.wakwak.ne.jp. [222.224.148.155])
 by smtp.gmail.com with ESMTPSA id i14sm2050136pjz.25.2020.07.29.04.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:45:56 -0700 (PDT)
Date: Wed, 29 Jul 2020 20:45:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <20200729114554.GG80756@lianli.shorne-pla.net>
References: <20200728033405.78469-1-npiggin@gmail.com>
 <20200728033405.78469-15-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728033405.78469-15-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jonas Bonn <jonas@southpole.se>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDE6MzM6NTVQTSArMTAwMCwgTmljaG9sYXMgUGlnZ2lu
IHdyb3RlOgo+IENjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+Cj4gQ2M6IFN0ZWZh
biBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiBDYzog
U3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxp
YnJlY29yZXMub3JnCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdt
YWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5o
IHwgOCArKystLS0tLQo+ICBhcmNoL29wZW5yaXNjL21tL3RsYi5jICAgICAgICAgICAgICAgICAg
fCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0
LmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmgKPiBpbmRleCBjZWQ1
Nzc1NDJlMjkuLmE2NzAyMzg0Yzc3ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1
ZGUvYXNtL21tdV9jb250ZXh0LmgKPiArKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL21t
dV9jb250ZXh0LmgKPiBAQCAtMTcsMTMgKzE3LDEzIEBACj4gIAo+ICAjaW5jbHVkZSA8YXNtLWdl
bmVyaWMvbW1faG9va3MuaD4KPiAgCj4gKyNkZWZpbmUgaW5pdF9uZXdfY29udGV4dCBpbml0X25l
d19jb250ZXh0Cj4gIGV4dGVybiBpbnQgaW5pdF9uZXdfY29udGV4dChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+ICsjZGVmaW5lIGRlc3Ryb3lfY29udGV4
dCBkZXN0cm95X2NvbnRleHQKPiAgZXh0ZXJuIHZvaWQgZGVzdHJveV9jb250ZXh0KHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKTsKPiAgZXh0ZXJuIHZvaWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1Y3Qg
KnByZXYsIHN0cnVjdCBtbV9zdHJ1Y3QgKm5leHQsCj4gIAkJICAgICAgc3RydWN0IHRhc2tfc3Ry
dWN0ICp0c2spOwo+ICAKPiAtI2RlZmluZSBkZWFjdGl2YXRlX21tKHRzaywgbW0pCWRvIHsgfSB3
aGlsZSAoMCkKPiAtCj4gICNkZWZpbmUgYWN0aXZhdGVfbW0ocHJldiwgbmV4dCkgc3dpdGNoX21t
KChwcmV2KSwgKG5leHQpLCBOVUxMKQo+ICAKPiAgLyogY3VycmVudCBhY3RpdmUgcGdkIC0gdGhp
cyBpcyBzaW1pbGFyIHRvIG90aGVyIHByb2Nlc3NvcnMgcGdkCj4gQEAgLTMyLDggKzMyLDYgQEAg
ZXh0ZXJuIHZvaWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKnByZXYsIHN0cnVjdCBtbV9z
dHJ1Y3QgKm5leHQsCj4gIAo+ICBleHRlcm4gdm9sYXRpbGUgcGdkX3QgKmN1cnJlbnRfcGdkW107
IC8qIGRlZmluZWQgaW4gYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jICovCj4gIAo+IC1zdGF0aWMg
aW5saW5lIHZvaWQgZW50ZXJfbGF6eV90bGIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB0
YXNrX3N0cnVjdCAqdHNrKQo+IC17Cj4gLX0KPiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL21tdV9j
b250ZXh0Lmg+CgpUaGlzIGxvb2tzIG9rLgoKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gv
b3BlbnJpc2MvbW0vdGxiLmMgYi9hcmNoL29wZW5yaXNjL21tL3RsYi5jCj4gaW5kZXggNGI2ODBh
ZWQ4ZjVmLi44MjFhYWI0Y2YzYmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9tbS90bGIu
Ywo+ICsrKyBiL2FyY2gvb3BlbnJpc2MvbW0vdGxiLmMKPiBAQCAtMTU5LDYgKzE1OSw3IEBAIHZv
aWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKnByZXYsIHN0cnVjdCBtbV9zdHJ1Y3QgKm5l
eHQsCj4gICAqIGluc3RhbmNlLgo+ICAgKi8KPiAgCj4gKyNkZWZpbmUgaW5pdF9uZXdfY29udGV4
dCBpbml0X25ld19jb250ZXh0Cj4gIGludCBpbml0X25ld19jb250ZXh0KHN0cnVjdCB0YXNrX3N0
cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgewo+ICAJbW0tPmNvbnRleHQgPSBO
T19DT05URVhUOwo+IEBAIC0xNzAsNiArMTcxLDcgQEAgaW50IGluaXRfbmV3X2NvbnRleHQoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAgKiBkcm9wcyBp
dC4KPiAgICovCj4gIAo+ICsjZGVmaW5lIGRlc3Ryb3lfY29udGV4dCBkZXN0cm95X2NvbnRleHQK
PiAgdm9pZCBkZXN0cm95X2NvbnRleHQoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gIHsKPiAgCWZs
dXNoX3RsYl9tbShtbSk7CgpJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhlICNkZWZpbmUncyBpbiB0
aGUgLmMgZmlsZS4gIERvIHdlPwoKLVN0YWZmb3JkCgo+IC0tIAo+IDIuMjMuMAo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
