Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7063E8508
	for <lists+openrisc@lfdr.de>; Tue, 10 Aug 2021 23:15:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B97B224079;
	Tue, 10 Aug 2021 23:15:49 +0200 (CEST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mail.librecores.org (Postfix) with ESMTPS id 5E67A23F83
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 23:15:47 +0200 (CEST)
Received: by mail-pj1-f52.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so6284406pjs.0
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 14:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RGyN6B+oepLK5COlIQIu0Zg6xm5eWTbyTPOp1hx9GWk=;
 b=qroWg+lyQTF5da3CrND6OLNSNWVz6DyWAF8VgL1fo2SJHuwXB9YWKauFqcX85LOkmy
 8RVT2SbtEeyj86T+BYpGrorwejhONijGBfF5Um2s5pWADhIRA4Pm7Cg41m/qwitli0Yb
 1CJHatNT0IhskHx9iJH8qfrmUSheZNF1QUNWk4sTlYDGzVVDSTiCgGRJgWLdeLm3i92y
 9g+28RHSbvrWvWGLYZoIlrdsc0Yv741/j2sC5seihl0fLGS+xz/csEri2x5YveEoazvl
 F1ok1vfOagpdqz0MaSXXmBlljyp7n8hHCD9j2Pq5Qk4TM3XqwXa9KZsyP2/kFI0JVCET
 dv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RGyN6B+oepLK5COlIQIu0Zg6xm5eWTbyTPOp1hx9GWk=;
 b=OStnH/y9e9sHB/umvBRItTBf/NXlJfnOwGBfZYsgDikklg8E6djiPAI93fBdYM2rjg
 FZ+9ZXU9S4UT3WJzyqopcp2PRV8/XsxXd8J1GDog1QzDwO0c2jsU3KH3e3f/gCG+mWtG
 SLnGlTPQZK1Bl2UanB51mp6SSipSURC9NDX0sye96Od8C82razv6eJ4xyd3l975qTMJq
 viijCUG5AXxLdEeTJiVsx8A3SiOIvDyM8qeOxtJGB56AWQl4vl6tLSwdgLH+9MaoXLR6
 BbPziVAqew7Vb1G995gJ7r+R3Tfq2wKy7rGw2t2sUMrWVkqG8O+U9ttSJNOUl+EHTsMj
 hULQ==
X-Gm-Message-State: AOAM532CWy1supdNOXoFcc7WzgXBiNY07ATvDRDWd8awYBaJyTUXg8XO
 gvYuSm5CnJLNn195niPS2HE=
X-Google-Smtp-Source: ABdhPJyqemEnliLO65WklVw8TWQK4RO38BF68T6O14/5adEk0Fu0g4RN1erX9WU3VuiDs7YsMlf7KA==
X-Received: by 2002:a17:90b:609:: with SMTP id
 gb9mr33751834pjb.156.1628630145855; 
 Tue, 10 Aug 2021 14:15:45 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id j187sm24731451pfb.132.2021.08.10.14.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 14:15:45 -0700 (PDT)
Date: Wed, 11 Aug 2021 06:15:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YRLsf2VyGTQVapuV@antec>
References: <20210808135437.3640549-1-shorne@gmail.com>
 <8a830ab7-6b66-1ca9-bd73-fc1551def648@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a830ab7-6b66-1ca9-bd73-fc1551def648@infradead.org>
Subject: Re: [OpenRISC] [PATCH v2] openrisc: Fix compiler warnings in setup
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBBdWcgMDksIDIwMjEgYXQgMTA6NTE6MDFBTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+IE9uIDgvOC8yMSA2OjU0IEFNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+IFRoaXMg
d2FzIHBvaW50ZWQgb3V0IHdpdGggdGhlIHJlY2VudCBuYW1lIGNoYW5nZSBvZiBvcjMyX2Vhcmx5
X3NldHVwIHRvCj4gPiBvcjFrX2Vhcmx5X3NldHVwLiAgSW52ZXN0aWdhdGluZyB0aGUgZmlsZSBJ
IGZvdW5kIGEgZmV3IG90aGVyIHdhcm5pbmdzCj4gPiBzbyBjbGVhbmluZyB0aGVtIHVwIGhlcmUu
Cj4gPiAKPiA+ICAgICAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYzoyMjA6MTM6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ29yMWtfZWFybHlfc2V0dXAnIFstV21pc3Np
bmctcHJvdG90eXBlc10KPiA+ICAgICAgICAyMjAgfCB2b2lkIF9faW5pdCBvcjFrX2Vhcmx5X3Nl
dHVwKHZvaWQgKmZkdCkKPiA+IAkgIHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+ID4g
Cj4gPiBGaXggdGhpcyB0aGUgbWlzc2luZyBvcjFrX2Vhcmx5X3NldHVwIHByb3RvdHlwZSB3YXJu
aW5nIGJ5IGFkZGluZyBhbgo+ID4gYXNtL3NldHVwLmggZmlsZSB0byBkZWZpbmUgdGhlIHByb3Rv
dHlwZS4KPiA+IAo+ID4gICAgICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jOjI0NjoxMzog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnZGV0ZWN0X3VuaXRfY29uZmlnJyBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gPiAgICAgICAgMjQ2IHwgdm9pZCBfX2luaXQgZGV0ZWN0
X3VuaXRfY29uZmlnKHVuc2lnbmVkIGxvbmcgdXByLCB1bnNpZ25lZCBsb25nIG1hc2ssCj4gPiAJ
ICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gCj4gPiBUaGUgZnVuY3Rpb24g
ZGV0ZWN0X3VuaXRfY29uZmlnIGlzIG5vdCB1c2VkLCBqdXN0IHJlbW92ZSBpdC4KPiA+IAo+ID4g
ICAgICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jOjIyMTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnZmR0JyBub3QgZGVzY3JpYmVkIGluICdvcjFrX2Vhcmx5X3Nl
dHVwJwo+ID4gCj4gPiBBZGQgQGZkdCBkb2NzIHRvIHRoZSBmdW5jdGlvbiBjb21tZW50IHRvIHN1
cHByZXNzIHRoaXMgd2FybmluZy4KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPgo+IAo+IFRoYW5rcy4KClRoYW5rIHlvdS4KCj4gPiAtLS0KPiA+IAo+ID4g
Q2hhbmdlcyBzaW5jZSB2MToKPiA+ICAgLSBBZGQgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4gdG8g
Zml4IGNvbXBpbGUgZmFpbHVyZS4gIFBvaW50ZWQgb3V0IGJ5IHJvYm90IGFuZAo+ID4gICAgIHJh
bmR5Lgo+ID4gCj4gPiAgIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaCB8IDE1ICsr
KysrKysrKysrKysrKwo+ID4gICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jICAgICAgfCAx
NiArLS0tLS0tLS0tLS0tLS0tCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNj
L2luY2x1ZGUvYXNtL3NldHVwLmgKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mv
aW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaAo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOWFjYmM1ZGVk
YTY5Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3NldHVwLmgKPiA+IEBAIC0wLDAgKzEsMTUgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCAqLwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIxIFN0YWZm
b3JkIEhvcm5lCj4gPiArICovCj4gPiArI2lmbmRlZiBfQVNNX09SMUtfU0VUVVBfSAo+ID4gKyNk
ZWZpbmUgX0FTTV9PUjFLX1NFVFVQX0gKPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5o
Pgo+ID4gKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9zZXR1cC5oPgo+ID4gKwo+ID4gKyNpZm5kZWYg
X19BU1NFTUJMWV9fCj4gPiArdm9pZCBfX2luaXQgb3Ixa19lYXJseV9zZXR1cCh2b2lkICpmZHQp
Owo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gKyNlbmRpZiAvKiBfQVNNX09SMUtfU0VUVVBfSCAqLwo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgYi9hcmNoL29wZW5y
aXNjL2tlcm5lbC9zZXR1cC5jCj4gPiBpbmRleCA3ZWRkY2FjMGVmMmYuLjBjZDA0ZDkzNmE3YSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiA+ICsrKyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiA+IEBAIC0yMTAsNiArMjEwLDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfY3B1aW5mbyh2b2lkKQo+ID4gICAvKioKPiA+ICAgICogb3Ixa19lYXJseV9z
ZXR1cAo+ID4gKyAqIEBmZHQ6IHBvaW50ZXIgdG8gdGhlIHN0YXJ0IG9mIHRoZSBkZXZpY2UgdHJl
ZSBpbiBtZW1vcnkgb3IgTlVMTAo+ID4gICAgKgo+ID4gICAgKiBIYW5kbGVzIHRoZSBwb2ludGVy
IHRvIHRoZSBkZXZpY2UgdHJlZSB0aGF0IHRoaXMga2VybmVsIGlzIHRvIHVzZQo+ID4gICAgKiBm
b3IgZXN0YWJsaXNoaW5nIHRoZSBhdmFpbGFibGUgcGxhdGZvcm0gZGV2aWNlcy4KPiA+IEBAIC0y
NDMsMjEgKzI0NCw2IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBleHRyYWN0X3ZhbHVl
KHVuc2lnbmVkIGxvbmcgcmVnLCB1bnNpZ25lZCBsb25nIG1hc2spCj4gPiAgIAlyZXR1cm4gbWFz
ayAmIHJlZzsKPiA+ICAgfQo+ID4gLXZvaWQgX19pbml0IGRldGVjdF91bml0X2NvbmZpZyh1bnNp
Z25lZCBsb25nIHVwciwgdW5zaWduZWQgbG9uZyBtYXNrLAo+ID4gLQkJCSAgICAgICBjaGFyICp0
ZXh0LCB2b2lkICgqZnVuYykgKHZvaWQpKQo+ID4gLXsKPiA+IC0JaWYgKHRleHQgIT0gTlVMTCkK
PiA+IC0JCXByaW50aygiJXMiLCB0ZXh0KTsKPiA+IC0KPiA+IC0JaWYgKHVwciAmIG1hc2spIHsK
PiA+IC0JCWlmIChmdW5jICE9IE5VTEwpCj4gPiAtCQkJZnVuYygpOwo+ID4gLQkJZWxzZQo+ID4g
LQkJCXByaW50aygicHJlc2VudFxuIik7Cj4gPiAtCX0gZWxzZQo+ID4gLQkJcHJpbnRrKCJub3Qg
cHJlc2VudFxuIik7Cj4gPiAtfQo+ID4gLQo+ID4gICAvKgo+ID4gICAgKiBjYWxpYnJhdGVfZGVs
YXkKPiA+ICAgICoKPiA+IAo+IAo+IAo+IC0tIAo+IH5SYW5keQo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
