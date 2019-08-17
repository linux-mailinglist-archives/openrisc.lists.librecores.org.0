Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E792E97197
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6E5ED204BF;
	Wed, 21 Aug 2019 07:30:44 +0200 (CEST)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by mail.librecores.org (Postfix) with ESMTPS id DFFB3201E8
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 23:15:08 +0200 (CEST)
Received: by mail-io1-f67.google.com with SMTP id i22so13229523ioh.2
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 14:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=of7+kXZ7O7iQMaD+uR4bskNv7dazvfYrCLyFqQNS+Ys=;
 b=J32rrdBRvRsfbFjCu9mt8fMYOMslmZza78qiqRkRyerF7Tvcpg2S9u01Ma540XGXA7
 2iMu5p3Hkj4aS5LBrD+33KElVbGx/xBadIYVGPANBM7jO6Se6GA6GrwSMEwF29HvJ6ER
 vZ9LmfwOTrujU/Kp5jYgpxJYxNHczK453ZXPgcwCmkGHcdiVYKwlFvQ6JuUiC1/4nCYl
 uFAhRB0N/reKVlsdq1bNGymQlRL3HWYkOuH8XT80KfGMY/WL2QfRa8xGoQM4QoYPzMnq
 iTWN1h7rhUiSs1zoLq4NqE4o/IAPIBBfkwLsR3a1H+aqVN59SAAPttTAgUB3YgtJ2wpS
 6ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=of7+kXZ7O7iQMaD+uR4bskNv7dazvfYrCLyFqQNS+Ys=;
 b=Shus3PNLUCCYjtVzvP/0yUTebdy56Snr96xAoRj5Mi/hWCZdrgNlyNZzUrfoD8sOkf
 sQLQJCys8sg2ua3fbrFas9podFdv+YM6dHhD9cLwhYhEOTpyHEsRwqTfGFYsrPS7sr6d
 AiN4LF6gh+2T/5xT7eBt8zlFm5hoekWs0WHFEhKpJnZFL+Ymk8mWlaEsnQTB8wftP1DP
 m784J1C3Nx260reQmheUhdArCUzky8wmDHZXqUzDoMGQ8xma2r6YKQKAxr32TmCpimkm
 7P9glEeJQAN5g2dkRbIK5khkuccAmEdxKqZrKhKgB5lKNgqB+YMwDcQ0z4X00kFXhrIc
 eApQ==
X-Gm-Message-State: APjAAAWpe39+Ep7ia5kGMvKycUWcWJO/l4Pq18OrPhyqpDtkM3quYD/R
 pV0hSLjemIDrDvyWjM/rtK+KWw==
X-Google-Smtp-Source: APXvYqxhPFwhoGwEv9EiCGR2YXAs4N7HYnW3IuL/COnl5kQqZm2U/FQDN7BsZ9+pbm1TtqxdMhb2eg==
X-Received: by 2002:a02:654d:: with SMTP id u74mr19023736jab.115.1566076507872; 
 Sat, 17 Aug 2019 14:15:07 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z19sm8681923ioh.12.2019.08.17.14.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:15:07 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:15:06 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190817073253.27819-17-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171414260.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-17-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 16/26] asm-generic: don't provide ioremap for
 CONFIG_MMU
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCAxNyBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IEFsbCBNTVUt
ZW5hYmxlZCBwb3J0cyBoYXZlIGEgbm9uLXRyaXZpYWwgaW9yZW1hcCBhbmQgc2hvdWxkIHRodXMg
cHJvdmlkZQo+IHRoZSBwcm90b3R5cGUgZm9yIHRoZWlyIGltcGxlbWVudGF0aW9uIGluc3RlYWQg
b2YgcHJvdmlkaW5nIGEgZ2VuZXJpYwo+IG9uZSB1bmxlc3MgYSBkaWZmZXJlbnQgc3ltYm9sIGlz
IG5vdCBkZWZpbmVkLiAgTm90ZSB0aGF0IHRoaXMgb25seQo+IGFmZmVjdHMgc3BhcmMzMiBuZHMz
MiBhcyBhbGwgb3RoZXJzIGRvIHByb3ZpZGUgdGhlaXIgb3duIHZlcnNpb24uCj4gCj4gQWxzbyB1
cGRhdGUgdGhlIGtlcm5lbGRvYyBjb21tZW50cyBpbiBhc20tZ2VuZXJpYy9pby5oIHRvIGV4cGxh
aW4gdGhlCj4gc2l0dWF0aW9uIGFyb3VuZCB0aGUgZGVmYXVsdCBpb3JlbWFwKiBpbXBsZW1lbnRh
dGlvbnMgY29ycmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL25kczMyL2luY2x1ZGUvYXNtL2lvLmggICAgfCAgMiAr
Kwo+ICBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2lvXzMyLmggfCAgMSArCj4gIGluY2x1ZGUvYXNt
LWdlbmVyaWMvaW8uaCAgICAgICB8IDI5ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCgpb
IC4uLiBdCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmggYi9pbmNsdWRl
L2FzbS1nZW5lcmljL2lvLmgKPiBpbmRleCBhOThlZDYzMjU3MjcuLjZhNWVkYzIzYWZlMiAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKPiArKysgYi9pbmNsdWRlL2FzbS1n
ZW5lcmljL2lvLmgKPiBAQCAtOTIyLDI4ICs5MjIsMTYgQEAgc3RhdGljIGlubGluZSB2b2lkICpw
aHlzX3RvX3ZpcnQodW5zaWduZWQgbG9uZyBhZGRyZXNzKQo+ICAvKioKPiAgICogRE9DOiBpb3Jl
bWFwKCkgYW5kIGlvcmVtYXBfKigpIHZhcmlhbnRzCj4gICAqCj4gLSAqIElmIHlvdSBoYXZlIGFu
IElPTU1VIHlvdXIgYXJjaGl0ZWN0dXJlIGlzIGV4cGVjdGVkIHRvIGhhdmUgYm90aCBpb3JlbWFw
KCkKPiAtICogYW5kIGlvdW5tYXAoKSBpbXBsZW1lbnRlZCBvdGhlcndpc2UgdGhlIGFzbS1nZW5l
cmljIGhlbHBlcnMgd2lsbCBwcm92aWRlIGEKPiAtICogZGlyZWN0IG1hcHBpbmcuCj4gKyAqIEFy
Y2hpdGVjdHVyZXMgd2l0aCBhbiBNTVUgYXJlIGV4cGVjdGVkIHRvIHByb3ZpZGUgaW9yZW1hcCgp
IGFuZCBpb3VubWFwKCkKPiArICogdGhlbXNlbHZlcy4gIEZvciBOT01NVSBhcmNoaXRlY3R1cmVz
IHdlIHByb3ZpZGUgYSBkZWZhdWx0IG5vcC1vcAo+ICsgKiBpbXBsZW1lbnRhdGlvbiB0aGF0IGV4
cGVjdCB0aGF0IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHVzZWQgZm9yIE1NSU8gYXJlCj4gKyAqIGFs
cmVhZHkgbWFya2VkIGFzIHVuY2FjaGVkLCBhbmQgY2FuIGJlIHVzZWQgYXMga2VybmVsIHZpcnR1
YWwgYWRkcmVzc2VzLgo+ICAgKgo+IC0gKiBUaGVyZSBhcmUgaW9yZW1hcF8qKCkgY2FsbCB2YXJp
YW50cywgaWYgeW91IGhhdmUgbm8gSU9NTVUgd2UgbmF0dXJhbGx5IHdpbGwKPiAtICogZGVmYXVs
dCB0byBkaXJlY3QgbWFwcGluZyBmb3IgYWxsIG9mIHRoZW0sIHlvdSBjYW4gb3ZlcnJpZGUgdGhl
c2UgZGVmYXVsdHMuCj4gLSAqIElmIHlvdSBoYXZlIGFuIElPTU1VIHlvdSBhcmUgaGlnaGx5IGVu
Y291cmFnZWQgdG8gcHJvdmlkZSB5b3VyIG93bgo+IC0gKiBpb3JlbWFwIHZhcmlhbnQgaW1wbGVt
ZW50YXRpb24gYXMgdGhlcmUgY3VycmVudGx5IGlzIG5vIHNhZmUgYXJjaGl0ZWN0dXJlCj4gLSAq
IGFnbm9zdGljIGRlZmF1bHQuIFRvIGF2b2lkIHBvc3NpYmxlIGltcHJvcGVyIGJlaGF2aW91ciBk
ZWZhdWx0IGFzbS1nZW5lcmljCj4gLSAqIGlvcmVtYXBfKigpIHZhcmlhbnRzIGFsbCByZXR1cm4g
TlVMTCB3aGVuIGFuIElPTU1VIGlzIGF2YWlsYWJsZS4gSWYgeW91J3ZlCj4gLSAqIGRlZmluZWQg
eW91ciBvd24gaW9yZW1hcF8qKCkgdmFyaWFudCB5b3UgbXVzdCB0aGVuIGRlY2xhcmUgeW91ciBv
d24KPiAtICogaW9yZW1hcF8qKCkgdmFyaWFudCBhcyBkZWZpbmVkIHRvIGl0c2VsZiB0byBhdm9p
ZCB0aGUgZGVmYXVsdCBOVUxMIHJldHVybi4KPiArICogaW9yZW1hcF93YygpIGFuZCBpb3JlbWFw
X3d0KCkgY2FuIHByb3ZpZGUgbW9yZSByZWxheGVkIGNhY2hpbmcgYXR0cmlidXRlcwo+ICsgKiBm
b3Igc3BlY2lmaWMgZHJpdmVycyBpZiB0aGUgYXJjaGl0ZWN0dXJlIGNob3NlcyB0byBpbXBsZW1l
bnQgdGhlbS4gIElmIHRoZXkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeXl4gY2hvb3NlcwoKCgotIFBhdWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
