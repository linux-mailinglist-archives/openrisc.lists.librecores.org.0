Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 31ACD23F95D
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 00:48:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D7AC820CEB;
	Sun,  9 Aug 2020 00:48:28 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id E75B820CEB
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 00:48:26 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id f193so3068191pfa.12
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d5emEHeU0VdCmMZnn6BnVqQF21UzfzD0RJjo6t6lJzc=;
 b=g9PMZbPi3HkAE2ef1slA/FZbJQ9A2/ISneUIqXHRSvIm1a5w70I2P+5h5Ktq79OagY
 S4uQAS1NR3fzUHMv0T9MhrggEOZPUuR9fSojaM2gfbADEE2DwVv/cqGrXjpTKz2QhfWT
 dqWzqecB5usUAX8y0XyC8TfiPefmjqXDzWKZ8MkNTXTBavb/TCBxv0sIIztWphPu8Syx
 gn70nutP60p3GoIGrd9zkfmOKLfl2h8hoH+ORfJYWX1Im5ElFUBnpXPzJti7eol/gjgf
 1DRZE+d41xzqtx6RNwWQEjdvvJjTACKbjCC9Ui34beNGfydM4CGY4LWc1BKYnXElTl1F
 Hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d5emEHeU0VdCmMZnn6BnVqQF21UzfzD0RJjo6t6lJzc=;
 b=IhINlZlY8xlvQ0AC1jO0wOC8tu2g5PpoF4o3xO6VVijM9Vmd9pWecETmaBq3fplURZ
 T+v+Uh9X/56ZiKweOZQCY9PjfIYKeh75cE+tv5nTrLXQamI175uAn/YASjMZm2e2fg3Q
 TQZteUNlQbNktKySK6gwkGVih1wwRSXW8aDhtnGxhJ0r2XMwHU9wnnXAho+ar1Z5xKbq
 V6tyN8lXoUsHg1Cwa9BiggnIMV0l8QlqYoBinDoN/cxY7WrAl0AucwQAB0zxz84Vxsm+
 i18Pt/JTecNPSk6q8ziD+yAhdfCCU7UE4dDpuxOBpzqSDAfHjVEFLLvh09u3XaHY8cQx
 Tjbw==
X-Gm-Message-State: AOAM531Tz5JFGfRSKzb37qNA/EFcxbfj6XkcwllL4Q42m2zB98I01QPC
 0nyEku2R8YZTyUgePHCJaTU=
X-Google-Smtp-Source: ABdhPJyW+c0znNsTBfE45CVaHIji2Gh8vNc+nD2vRkQ22H3TrwRYUDFv2Wd5Uz3Gi12LlxGVC1HqVA==
X-Received: by 2002:a65:4044:: with SMTP id h4mr16591152pgp.371.1596926904997; 
 Sat, 08 Aug 2020 15:48:24 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id f20sm19340786pfk.36.2020.08.08.15.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:48:24 -0700 (PDT)
Date: Sun, 9 Aug 2020 07:48:22 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200808224822.GQ80756@lianli.shorne-pla.net>
References: <20200805210725.310301-1-shorne@gmail.com>
 <20200805210725.310301-6-shorne@gmail.com>
 <20200806190449.xqflhmbiiv5btusf@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806190449.xqflhmbiiv5btusf@ltop.local>
Subject: Re: [OpenRISC] [PATCH v2 5/6] openrisc: signal: Fix sparse address
 space warnings
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDk6MDQ6NDlQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IE9uIFRodSwgQXVnIDA2LCAyMDIwIGF0IDA2OjA3OjI0QU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gLS0tCj4gPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2ln
bmFsLmMgfCAxNCArKysrKysrLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNj
L2tlcm5lbC9zaWduYWwuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCj4gPiBpbmRl
eCA0ZjA3NTQ4NzRkNzguLjdjZTA3Mjg0MTJmNiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3NpZ25hbC5jCj4gPiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwu
Ywo+ID4gQEAgLTc2LDcgKzc2LDcgQEAgYXNtbGlua2FnZSBsb25nIF9zeXNfcnRfc2lncmV0dXJu
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gIAkgKiB0aGVuIGZyYW1lIHNob3VsZCBiZSBkd29y
ZCBhbGlnbmVkIGhlcmUuICBJZiBpdCdzCj4gPiAgCSAqIG5vdCwgdGhlbiB0aGUgdXNlciBpcyB0
cnlpbmcgdG8gbWVzcyB3aXRoIHVzLgo+ID4gIAkgKi8KPiA+IC0JaWYgKCgobG9uZylmcmFtZSkg
JiAzKQo+ID4gKwlpZiAoKChfX2ZvcmNlIHVuc2lnbmVkIGxvbmcpZnJhbWUpICYgMykKPiA+ICAJ
CWdvdG8gYmFkZnJhbWU7Cj4gCj4gU2FtZSBhcyBwYXRjaCA2LCB0aGUgX19mb3JjZSBpcyBub3Qg
bmVlZGVkLgoKVGhhbmtzLCAgSSB0aG91Z2h0IHRoaXMgd2FzIGNvbXBsYWluaW5nIGJlZm9yZSwg
SSB0ZXN0ZWQgbm93IGFuZCB0aGVyZSBpcyBubwpwcm9ibGVtIHNvIEkgbXVzdCBoYXZlIGJlZW4g
bWl4ZWQgdXAgd2l0aCBzb21ldGhpbmcgZWxzZS4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
