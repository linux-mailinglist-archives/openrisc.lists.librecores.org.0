Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA69D4AAD98
	for <lists+openrisc@lfdr.de>; Sun,  6 Feb 2022 04:19:50 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0C4C242FA;
	Sun,  6 Feb 2022 04:19:50 +0100 (CET)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mail.librecores.org (Postfix) with ESMTPS id D2141242FA
 for <openrisc@lists.librecores.org>; Sun,  6 Feb 2022 04:19:47 +0100 (CET)
Received: by mail-pj1-f48.google.com with SMTP id
 oa14-20020a17090b1bce00b001b61aed4a03so9960339pjb.5
 for <openrisc@lists.librecores.org>; Sat, 05 Feb 2022 19:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QGk+V+tevAHKhW+yEMe4I8KgmYjwftpUv9T2QF06uWE=;
 b=J4rbAUwx4FzXDA6I/18kBT29+TTryshYioLti4InX/RjYUY/r/dl4EprlBmuuRtfAY
 6tqo3jCfjC3jASzc5pEp7aKLlaBFMBN7+FVbXNwDu5V5HNsoVlxqYfIOUVG+0A6/Bpul
 Jzuh9hENgnNkS5le4n0/ILY4m7blOqy9qxQRLMGATcg0H+TAoOg2fax9/B5yTXuj4d4j
 1FgnTr4Nm87JQfu+hMBH9NqoYFcpW+CaZ2zMMKNmaMTT6GpgcsFhYstOfD/dW3VMogIA
 6NBNdwwZKobUpi3Nr+BYYxnAUReEDzEcHtYg7N2SHMT22kjxcsBT7W2U831Hqc3sxrFt
 PMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QGk+V+tevAHKhW+yEMe4I8KgmYjwftpUv9T2QF06uWE=;
 b=Vadb72rGePsJxXM4T/fsrNVaeZ4LaqP5WMO7HF2FAlJUZ5OTBux0mVDjGWChELN13G
 vYmYT5J6hWdGasyUl6kwj/EOKUprL8KMsrKMTB1GkW6szLWnh2eGJ78RhJcECFiy0hVU
 U/0r2KF3Ex4TNM9Vz9apklEmCpapZCXq7NWJzO2HEYu9TlSC8n4ZAwPmTb0woU3f9JQt
 1lg3XpT73X/mQwZhlrKM3Ewm5g/HxL+S+Pgy1zcVJ4Oq55liFGRDIFvojC2j/4RdRgNq
 gx+MM0nwQxHZULkYCay9JO/5wyF3ZasSoKI0E3nMhhjaCsmIOJv5SqU73qbgEKazUXLN
 NCiw==
X-Gm-Message-State: AOAM533rvGt1w4QOOEPXw3g8NNcGQ/1m37f2x3saIpyWPoDSCi1dLC4W
 Kq5zqrJ/DolHx6+nKuHeMTg=
X-Google-Smtp-Source: ABdhPJwiUEKuwoRTFvNXtuQDwL5z1wJtmltLIZQjCIR4zKw3P1z/Wtr9Px2qcl6IWmELpm32UEYvIQ==
X-Received: by 2002:a17:90a:fc90:: with SMTP id
 ci16mr6988155pjb.5.1644117586219; 
 Sat, 05 Feb 2022 19:19:46 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id mu13sm19757730pjb.28.2022.02.05.19.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 19:19:45 -0800 (PST)
Date: Sun, 6 Feb 2022 12:19:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <Yf8+T8Ow7n+38w2H@antec>
References: <20220205141956.3315419-1-shorne@gmail.com>
 <Yf6UthQtASGNgW8Q@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yf6UthQtASGNgW8Q@kernel.org>
Subject: Re: [OpenRISC] [PATCH] mm: Remove mmu_gathers storage from
 remaining architectures
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
Cc: Jonas Bonn <jonas@southpole.se>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Brian Cain <bcain@codeaurora.org>,
 Nick Hu <nickhu@andestech.com>, David Hildenbrand <david@redhat.com>,
 linux-hexagon@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBGZWIgMDUsIDIwMjIgYXQgMDU6MTY6MDZQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBTYXQsIEZlYiAwNSwgMjAyMiBhdCAxMToxOTo1M1BNICswOTAwLCBTdGFmZm9y
ZCBIb3JuZSB3cm90ZToKPiA+IE9yaWdpbmFsbHkgdGhlIG1tdV9nYXRoZXJzIHdlcmUgcmVtb3Zl
ZCBpbiBjb21taXQgMWMzOTUxNzY5NjIxICgibW06IG5vdwo+ID4gdGhhdCBhbGwgb2xkIG1tdV9n
YXRoZXIgY29kZSBpcyBnb25lLCByZW1vdmUgdGhlIHN0b3JhZ2UiKS4gIEhvd2V2ZXIsCj4gPiB0
aGUgb3BlbnJpc2MgYW5kIGhleGFnb24gYXJjaGl0ZWN0dXJlIHdlcmUgbWVyZ2VkIGFyb3VuZCB0
aGUgc2FtZSB0aW1lCj4gPiBhbmQgbW11X2dhdGhlcnMgd2FzIG5vdCByZW1vdmVkLgo+ID4gCj4g
PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlbSBmcm9tIG9wZW5yaXNjLCBoZXhhZ29uIGFuZCBuZHMz
MjoKPiA+IAo+ID4gTm90aWNlZCB3aGlsZSBjbGVhbmluZyB0aGlzIHdhcm5pbmc6Cj4gPiAKPiA+
ICAgICBhcmNoL29wZW5yaXNjL21tL2luaXQuYzo0MToxOiB3YXJuaW5nOiBzeW1ib2wgJ21tdV9n
YXRoZXJzJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiAKPiBBY2tl
ZC1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhhbmsgeW91LAoKQlRX
IEZvciBub3cgbXkgcGxhbiBpcyB0byBxdWV1ZSB0aGlzIG9uIG15IG9wZW5yaXNjIGJyYW5jaCB1
bmxlc3Mgc29tZW9uZSBlbHNlCndhbnRzIHRvIHBpY2sgdGhpcyB1cC4KCi1TdGFmZm9yZAoKPiA+
IC0tLQo+ID4gIGFyY2gvaGV4YWdvbi9tbS9pbml0LmMgIHwgMiAtLQo+ID4gIGFyY2gvbmRzMzIv
bW0vaW5pdC5jICAgIHwgMSAtCj4gPiAgYXJjaC9vcGVucmlzYy9tbS9pbml0LmMgfCAyIC0tCj4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9oZXhhZ29uL21tL2luaXQuYyBiL2FyY2gvaGV4YWdvbi9tbS9pbml0LmMKPiA+IGluZGV4
IGYwMWU5MWUxMGQ5NS4uMzE2N2EzYjVjOTdiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9oZXhhZ29u
L21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9oZXhhZ29uL21tL2luaXQuYwo+ID4gQEAgLTI5LDgg
KzI5LDYgQEAgaW50IG1heF9rZXJuZWxfc2VnID0gMHgzMDM7Cj4gPiAgLyogIGluZGljYXRlIHBm
bidzIG9mIGhpZ2ggbWVtb3J5ICAqLwo+ID4gIHVuc2lnbmVkIGxvbmcgaGlnaHN0YXJ0X3Bmbiwg
aGlnaGVuZF9wZm47Cj4gPiAgCj4gPiAtREVGSU5FX1BFUl9DUFUoc3RydWN0IG1tdV9nYXRoZXIs
IG1tdV9nYXRoZXJzKTsKPiA+IC0KPiA+ICAvKiBEZWZhdWx0IGNhY2hlIGF0dHJpYnV0ZSBmb3Ig
bmV3bHkgY3JlYXRlZCBwYWdlIHRhYmxlcyAqLwo+ID4gIHVuc2lnbmVkIGxvbmcgX2RmbHRfY2Fj
aGVfYXR0ID0gQ0FDSEVERUY7Cj4gPiAgCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9uZHMzMi9tbS9p
bml0LmMgYi9hcmNoL25kczMyL21tL2luaXQuYwo+ID4gaW5kZXggZjYzZjgzOTczOGM0Li44MjVj
ODVjYWIxYTEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL25kczMyL21tL2luaXQuYwo+ID4gKysrIGIv
YXJjaC9uZHMzMi9tbS9pbml0LmMKPiA+IEBAIC0xOCw3ICsxOCw2IEBACj4gPiAgI2luY2x1ZGUg
PGFzbS90bGIuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KPiA+ICAKPiA+IC1ERUZJTkVf
UEVSX0NQVShzdHJ1Y3QgbW11X2dhdGhlciwgbW11X2dhdGhlcnMpOwo+ID4gIERFRklORV9TUElO
TE9DSyhhbm9uX2FsaWFzX2xvY2spOwo+ID4gIGV4dGVybiBwZ2RfdCBzd2FwcGVyX3BnX2RpcltQ
VFJTX1BFUl9QR0RdOwo+ID4gIAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0vaW5p
dC5jIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKPiA+IGluZGV4IDk3MzA1YmRlMWIxNi4uM2Ew
MjFhYjZmMWFlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKPiA+ICsr
KyBiL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gPiBAQCAtMzgsOCArMzgsNiBAQAo+ID4gIAo+
ID4gIGludCBtZW1faW5pdF9kb25lOwo+ID4gIAo+ID4gLURFRklORV9QRVJfQ1BVKHN0cnVjdCBt
bXVfZ2F0aGVyLCBtbXVfZ2F0aGVycyk7Cj4gPiAtCj4gPiAgc3RhdGljIHZvaWQgX19pbml0IHpv
bmVfc2l6ZXNfaW5pdCh2b2lkKQo+ID4gIHsKPiA+ICAJdW5zaWduZWQgbG9uZyBtYXhfem9uZV9w
Zm5bTUFYX05SX1pPTkVTXSA9IHsgMCB9Owo+ID4gLS0gCj4gPiAyLjMxLjEKPiA+IAo+IAo+IC0t
IAo+IFNpbmNlcmVseSB5b3VycywKPiBNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
