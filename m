Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B22BE97195
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2CA9C204B7;
	Wed, 21 Aug 2019 07:30:44 +0200 (CEST)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by mail.librecores.org (Postfix) with ESMTPS id B2FEF2011C
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 23:07:31 +0200 (CEST)
Received: by mail-io1-f65.google.com with SMTP id l7so13213736ioj.6
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=oaLZqyUNyQl0GDzg3TD6D3y22xcAlUrpApHmCWftkKw=;
 b=RFEgb4b2hnNS1WpBLunJkjsIPF/Sn00DtxYAOuifEl6DxdVvHfM90BewsheCYGGIbc
 KkLEVKkHBB0QA34K1oL1QqTpTDmH1r0AAS5LIo/Wzqnat3RY7e+91XBtlrB6cTkdTpWU
 kte/9iGUVWH3tp9kz8MHvMt2gyye60gDCIBj8NdLeTB71AjDJMlqAJtKUxtx8xWkFhbs
 YbzFpA0yJYJCQurf1gnnMtlqH+un70tn1BjQGrEcVg5mWlPKN1VotnQ0tUinFRHtRRZr
 YGQo+eeilNUcY2675AOwdgK09hjXorEyFrfH2VgmS9azKAXXlU4rovb4iLfV8rGhNCxH
 YgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=oaLZqyUNyQl0GDzg3TD6D3y22xcAlUrpApHmCWftkKw=;
 b=tQFgEIT+OCb72tPtPzPiWgcekvdgjfACUTc+uTESCSmklRZPijoC0jfU9fH3pEnQRA
 QQTpHxKyf0qtEX3Hd7lcDAIjZGs2R6PlI2NVwaFdd7wbKB+4Q+1ZHtCRVhoGTklwIAK5
 jXga23VaU6UT6yrsc6r6uGUCt/kV3gGSbY68GWaVApQ4+AEPfVfZR/CECeBvYhMbB1FD
 a4vWg0r43g6lBGVR1FarIV6u+0Gaz1D1UO+jkqt13/xU0nuDdCjBEJQslxxgnC2aREvq
 +iWxFW0PgahnyovrcQWNxkrNuIVHEu2WXWysPchG9NrxSNzO/kc2uAUcSoQPukaTlQ+i
 zvrw==
X-Gm-Message-State: APjAAAX2bxtJ4FCCp1spoY0j9gOT1Sr56ZSeWnJDhJ0yrec9X195RNAD
 yxCqaYk2tiJQyM7cWXPskGiNnQ==
X-Google-Smtp-Source: APXvYqxg4I5F1jSj4ALE9JDvtf3Qsjlfm04dEVrcDSQX4DQggSlvp1PesRmYUB74gUk83a46+nakJw==
X-Received: by 2002:a05:6638:637:: with SMTP id
 h23mr18425886jar.59.1566076050556; 
 Sat, 17 Aug 2019 14:07:30 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 l6sm6664146ioc.15.2019.08.17.14.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:07:29 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:07:29 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190817073253.27819-16-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171403330.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-16-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 15/26] asm-generic: ioremap_uc should behave
 the same with and without MMU
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

T24gU2F0LCAxNyBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IFdoYXRldmVy
IHJlYXNvbiB0aGVyZSBpcyBmb3IgdGhlIGV4aXN0ZW5jZSBvZiBpb3JlbWFwX3VjLCBhbmQgdGhl
IGZhY3QgCj4gdGhhdCBpdCByZXR1cm5zIE5VTEwgYnkgZGVmYXVsdCBvbiBhcmNoaXRlY3R1cmVz
IHdpdGggYW4gTU1VIGFwcGxpZXMgCj4gZXF1YWxseSB0byBub21tdSBhcmNoaXRlY3R1cmVzLCBz
byBkb24ndCBwcm92aWRlIGRpZmZlcmVudCBkZWZhdWx0cy4KPiAKPiBJbiBwcmFjdGljZSB0aGUg
ZGlmZmVyZW5jZSBpcyBtZWFuaW5nbGVzcyBhcyB0aGUgb25seSBwb3J0YWJsZSBkcml2ZXIKPiB0
aGF0IHVzZXMgaW9yZW1hcF91YyBpcyBhdHlmYiB3aGljaCBwcm9iYWJseSBkb2Vzbid0IHNob3cg
dXAgb24gbm9tbXUKPiBkZXZpY2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9pby5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCj4gaW5kZXggZDAyODA2NTEzNjcw
Li5hOThlZDYzMjU3MjcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCj4g
KysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCgpbIC4uLiBdCgo+IEBAIC0xMDA0LDYgKzk4
NSwyMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF93dChwaHlzX2FkZHJf
dCBvZmZzZXQsIHNpemVfdCBzaXplKQo+ICB9Cj4gICNlbmRpZgo+ICAKPiArLyoKPiArICogaW9y
ZW1hcF91YyBpcyBzcGVjaWFsIGluIHRoYXQgd2UgZG8gcmVxdWlyZSBhbiBleHBsaWNpdCBhcmNo
aXRlY3R1cmUKPiArICogaW1wbGVtZW50YXRpb24uICBJbiBnZW5lcmFsIHlvdSBkbyBub3cgd2Fu
dCB0byB1c2UgdGhpcyBmdW5jdGlvbiBpbiBhCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eIG5vdAoKPiArICogZHJpdmVyIGFuZCB1c2UgcGxhaW4gaW9yZW1hcCwg
d2hpY2ggaXMgdW5jYWNoZWQgYnkgZGVmYXVsdC4gIFNpbWlsYXJseQogICAgICAgICAgICAgICAg
XiBpbnN0ZWFkIAoKPiArICogYXJjaGl0ZWN0dXJlcyBzaG91bGQgbm90IGltcGxlbWVudCBpdCB1
bmxlc3MgdGhleSBoYXZlIGEgdmVyeSBnb29kCj4gKyAqIHJlYXNvbi4KPiArICovCgpMb29rcyBs
aWtlIHRoaXMgbWVzcyBpcyBvbmx5IG5lZWRlZCBvbiB4ODYgd2l0aCBjZXJ0YWluIGdyYXBoaWNz
IGRyaXZlcnMgCmFuZCBjb25mbGljdHMgYmV0d2VlbiBNVFJSIGFuZCBwYWdlIHRhYmxlLWJhc2Vk
IE1NVSBhdHRyaWJ1dGVzLgoKClJldmlld2VkLWJ5OiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+ClRlc3RlZC1ieTogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBz
aWZpdmUuY29tPiAjIHJ2MzIsIHJ2NjQgYm9vdAoKCi0gUGF1bApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
