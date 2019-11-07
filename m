Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DF590F740C
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C3D12207DF;
	Mon, 11 Nov 2019 13:37:39 +0100 (CET)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id B0724205FA
 for <openrisc@lists.librecores.org>; Thu,  7 Nov 2019 16:29:12 +0100 (CET)
Received: by mail-pl1-f193.google.com with SMTP id e3so1696197plt.7
 for <openrisc@lists.librecores.org>; Thu, 07 Nov 2019 07:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=celw7kLC34qqwTTfh++uCkQEjOgc/6nwF8dFF2fJRcA=;
 b=noW+GrgCtBbtWmvRliYdOAuMA0YUG7D+eX91HjAU5IDNU+EBOcrbt42dkubqBTxW4S
 WQ8n2ZfnbmfCL4+eE6s1MnG4kJG52VZJ91QbzuQNFIi/COPg+DrUHbZ8+Jcgjj/Q48Re
 QNX4NY1E7vtLM68r6rfozcc3RNzkIItLOE7o9jhPPrBLVYCbQcAaXYdiCcQx1PUOZm7u
 oSAbYZ4+XOAXy2q29Df881Gyse5LGoGTyAaPv6aJ5raeRYhtrrpUAm1qesZ/YD4XWer0
 OQ5NPy7zRFp9dt0jb2kjIPuYcQwfIBFil4fTrnHBnYJ1ukrYml+utoouUC2biDI7it8K
 q8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=celw7kLC34qqwTTfh++uCkQEjOgc/6nwF8dFF2fJRcA=;
 b=m83ZxOHiAljxQNFzmBUZ5kJ5iUGkvDI9yrW2g6Hrv8Qrwh3xpNCnxf23OxI0CRc6GY
 mGikoExwILiAOZSVywBaXx0o60ZttO9XaRVMcEQdNBx1CLiHuv1I7mByxAM+xLUTHX99
 e1DwVHgEqWLXJc6BYgGj3JtijsmfGT7n+/PEODV1ZK/0gIOc7KI+NSfyZKSDPWYUkBf2
 knue3z+xX5W9tHbajGhUjkz+TSDyHO6V2HieqopaaqFYYXg/Q2Wf02pYdaUjgAdmhqjC
 QbVZLwLVNv9hyClR+l09HboxQOPavQ0EttkoRIsLuzampPnjAzVi0EapnhmVc5Qtag0J
 LrAw==
X-Gm-Message-State: APjAAAX6zM/6gLclNeTVAGSwVm6SDfIgth8LH5X4fOfRk9GBslKir988
 lRXzkIsUR+89MMW6aXKQ6UP/XQ==
X-Google-Smtp-Source: APXvYqxwW3UXdXBa6cGLkWhsyLfBz9Kw3ES1wGdovuqY/c7cBz2zbKIbrHc7CxUnNtedCkwAnHzZJw==
X-Received: by 2002:a17:90a:174a:: with SMTP id
 10mr5875131pjm.104.1573140550559; 
 Thu, 07 Nov 2019 07:29:10 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r10sm2405827pgn.68.2019.11.07.07.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 07:29:10 -0800 (PST)
Date: Thu, 07 Nov 2019 07:29:10 -0800 (PST)
X-Google-Original-Date: Wed, 06 Nov 2019 10:45:31 PST (-0800)
In-Reply-To: <20191029064834.23438-18-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-e96b8613-e384-4e94-90f8-d1cf78c5627a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:31 +0100
Subject: Re: [OpenRISC] [PATCH 17/21] lib: provide a simple generic ioremap
 implementation
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
 linux-kernel@vger.kernel.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 linux-mtd@lists.infradead.org, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCAyOCBPY3QgMjAxOSAyMzo0ODozMCBQRFQgKC0wNzAwKSwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQSBsb3Qgb2YgYXJjaGl0ZWN0dXJlcyByZXVzZSB0aGUgc2FtZSBzaW1wbGUg
aW9yZW1hcCBpbXBsZW1lbnRhdGlvbiwgc28KPiBzdGFydCBsaWZ0aW5nIHRoZSBtb3N0IHNpbXBs
ZSB2YXJpYW50IHRvIGxpYi9pb3JlbWFwLmMuICBJdCBwcm92aWRlcwo+IGlvcmVtYXBfcHJvdCBh
bmQgaW91bm1hcCwgcGx1cyBhIGRlZmF1bHQgaW9yZW1hcCB0aGF0IHVzZXMgcHJvdF9ub25jYWNo
ZWQsCj4gYWx0aG91Z2ggdGhhdCBjYW4gYmUgb3ZlcnJpZGRlbiBieSBhc20vaW8uaC4KPgo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBpbmNs
dWRlL2FzbS1nZW5lcmljL2lvLmggfCAyMCArKysrKysrKysrKysrKysrLS0tLQo+ICBsaWIvS2Nv
bmZpZyAgICAgICAgICAgICAgfCAgMyArKysKPiAgbGliL2lvcmVtYXAuYyAgICAgICAgICAgIHwg
MzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2FzbS1nZW5lcmljL2lvLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKPiBpbmRl
eCA0ZTQ1ZTFjYjY1NjAuLjRhNjYxZmRkMTkzNyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2FzbS1n
ZW5lcmljL2lvLmgKPiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKPiBAQCAtOTIzLDkg
KzkyMywxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKnBoeXNfdG9fdmlydCh1bnNpZ25lZCBsb25n
IGFkZHJlc3MpCj4gICAqIERPQzogaW9yZW1hcCgpIGFuZCBpb3JlbWFwXyooKSB2YXJpYW50cwo+
ICAgKgo+ICAgKiBBcmNoaXRlY3R1cmVzIHdpdGggYW4gTU1VIGFyZSBleHBlY3RlZCB0byBwcm92
aWRlIGlvcmVtYXAoKSBhbmQgaW91bm1hcCgpCj4gLSAqIHRoZW1zZWx2ZXMuICBGb3IgTk9NTVUg
YXJjaGl0ZWN0dXJlcyB3ZSBwcm92aWRlIGEgZGVmYXVsdCBub3Atb3AKPiAtICogaW1wbGVtZW50
YXRpb24gdGhhdCBleHBlY3QgdGhhdCB0aGUgcGh5c2ljYWwgYWRkcmVzcyB1c2VkIGZvciBNTUlP
IGFyZQo+IC0gKiBhbHJlYWR5IG1hcmtlZCBhcyB1bmNhY2hlZCwgYW5kIGNhbiBiZSB1c2VkIGFz
IGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Nlcy4KPiArICogdGhlbXNlbHZlcyBvciByZWx5IG9uIEdF
TkVSSUNfSU9SRU1BUC4gIEZvciBOT01NVSBhcmNoaXRlY3R1cmVzIHdlIHByb3ZpZGUKPiArICog
YSBkZWZhdWx0IG5vcC1vcCBpbXBsZW1lbnRhdGlvbiB0aGF0IGV4cGVjdCB0aGF0IHRoZSBwaHlz
aWNhbCBhZGRyZXNzIHVzZWQKPiArICogZm9yIE1NSU8gYXJlIGFscmVhZHkgbWFya2VkIGFzIHVu
Y2FjaGVkLCBhbmQgY2FuIGJlIHVzZWQgYXMga2VybmVsIHZpcnR1YWwKPiArICogYWRkcmVzc2Vz
Lgo+ICAgKgo+ICAgKiBpb3JlbWFwX3djKCkgYW5kIGlvcmVtYXBfd3QoKSBjYW4gcHJvdmlkZSBt
b3JlIHJlbGF4ZWQgY2FjaGluZyBhdHRyaWJ1dGVzCj4gICAqIGZvciBzcGVjaWZpYyBkcml2ZXJz
IGlmIHRoZSBhcmNoaXRlY3R1cmUgY2hvc2VzIHRvIGltcGxlbWVudCB0aGVtLiAgSWYgdGhleQo+
IEBAIC05NDYsNyArOTQ3LDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpb3VubWFwKHZvaWQgX19p
b21lbSAqYWRkcikKPiAgewo+ICB9Cj4gICNlbmRpZgo+IC0jZW5kaWYgLyogQ09ORklHX01NVSAq
Lwo+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19HRU5FUklDX0lPUkVNQVApCj4gKyNpbmNsdWRlIDxh
c20vcGd0YWJsZS5oPgo+ICsKPiArdm9pZCBfX2lvbWVtICppb3JlbWFwX3Byb3QocGh5c19hZGRy
X3QgYWRkciwgc2l6ZV90IHNpemUsIHVuc2lnbmVkIGxvbmcgcHJvdCk7Cj4gK3ZvaWQgaW91bm1h
cCh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpOwo+ICsKPiArc3RhdGljIGlubGluZSB2b2lk
IF9faW9tZW0gKmlvcmVtYXAocGh5c19hZGRyX3QgYWRkciwgc2l6ZV90IHNpemUpCj4gK3sKPiAr
CS8qIF9QQUdFX0lPUkVNQVAgbmVlZHMgdG8gYmUgc3VwcGxpZWQgYnkgdGhlIGFyY2hpdGVjdHVy
ZSAqLwo+ICsJcmV0dXJuIGlvcmVtYXBfcHJvdChhZGRyLCBzaXplLCBfUEFHRV9JT1JFTUFQKTsK
PiArfQo+ICsjZW5kaWYgLyogIUNPTkZJR19NTVUgfHwgQ09ORklHX0dFTkVSSUNfSU9SRU1BUCAq
Lwo+Cj4gICNpZm5kZWYgaW9yZW1hcF9ub2NhY2hlCj4gICNkZWZpbmUgaW9yZW1hcF9ub2NhY2hl
IGlvcmVtYXAKPiBkaWZmIC0tZ2l0IGEvbGliL0tjb25maWcgYi9saWIvS2NvbmZpZwo+IGluZGV4
IDE4M2Y5MmEyOTdjYS4uYWZjNzhhYWYyYjI1IDEwMDY0NAo+IC0tLSBhL2xpYi9LY29uZmlnCj4g
KysrIGIvbGliL0tjb25maWcKPiBAQCAtNjM4LDYgKzYzOCw5IEBAIGNvbmZpZyBTVFJJTkdfU0VM
RlRFU1QKPgo+ICBlbmRtZW51Cj4KPiArY29uZmlnIEdFTkVSSUNfSU9SRU1BUAo+ICsJYm9vbAo+
ICsKPiAgY29uZmlnIEdFTkVSSUNfTElCX0FTSExESTMKPiAgCWJvb2wKPgo+IGRpZmYgLS1naXQg
YS9saWIvaW9yZW1hcC5jIGIvbGliL2lvcmVtYXAuYwo+IGluZGV4IDBhMmZmYWRjNmQ3MS4uM2Yw
ZTE4NTQzZGU4IDEwMDY0NAo+IC0tLSBhL2xpYi9pb3JlbWFwLmMKPiArKysgYi9saWIvaW9yZW1h
cC5jCj4gQEAgLTIzMSwzICsyMzEsNDIgQEAgaW50IGlvcmVtYXBfcGFnZV9yYW5nZSh1bnNpZ25l
ZCBsb25nIGFkZHIsCj4KPiAgCXJldHVybiBlcnI7Cj4gIH0KPiArCj4gKyNpZmRlZiBDT05GSUdf
R0VORVJJQ19JT1JFTUFQCj4gK3ZvaWQgX19pb21lbSAqaW9yZW1hcF9wcm90KHBoeXNfYWRkcl90
IGFkZHIsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBsb25nIHByb3QpCj4gK3sKPiArCXVuc2lnbmVk
IGxvbmcgb2Zmc2V0LCB2YWRkcjsKPiArCXBoeXNfYWRkcl90IGxhc3RfYWRkcjsKPiArCXN0cnVj
dCB2bV9zdHJ1Y3QgKmFyZWE7Cj4gKwo+ICsJLyogRGlzYWxsb3cgd3JhcC1hcm91bmQgb3IgemVy
byBzaXplICovCj4gKwlsYXN0X2FkZHIgPSBhZGRyICsgc2l6ZSAtIDE7Cj4gKwlpZiAoIXNpemUg
fHwgbGFzdF9hZGRyIDwgYWRkcikKPiArCQlyZXR1cm4gTlVMTDsKPiArCj4gKwkvKiBQYWdlLWFs
aWduIG1hcHBpbmdzICovCj4gKwlvZmZzZXQgPSBhZGRyICYgKH5QQUdFX01BU0spOwo+ICsJYWRk
ciAtPSBvZmZzZXQ7Cj4gKwlzaXplID0gUEFHRV9BTElHTihzaXplICsgb2Zmc2V0KTsKPiArCj4g
KwlhcmVhID0gZ2V0X3ZtX2FyZWFfY2FsbGVyKHNpemUsIFZNX0lPUkVNQVAsCj4gKwkJCV9fYnVp
bHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7Cj4gKwlpZiAoIWFyZWEpCj4gKwkJcmV0dXJuIE5VTEw7
Cj4gKwl2YWRkciA9ICh1bnNpZ25lZCBsb25nKWFyZWEtPmFkZHI7Cj4gKwo+ICsJaWYgKGlvcmVt
YXBfcGFnZV9yYW5nZSh2YWRkciwgdmFkZHIgKyBzaXplLCBhZGRyLCBfX3BncHJvdChwcm90KSkp
IHsKPiArCQlmcmVlX3ZtX2FyZWEoYXJlYSk7Cj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwl9Cj4gKwo+
ICsJcmV0dXJuICh2b2lkIF9faW9tZW0gKikodmFkZHIgKyBvZmZzZXQpOwo+ICt9Cj4gK0VYUE9S
VF9TWU1CT0woaW9yZW1hcF9wcm90KTsKPiArCj4gK3ZvaWQgaW91bm1hcCh2b2xhdGlsZSB2b2lk
IF9faW9tZW0gKmFkZHIpCj4gK3sKPiArCXZ1bm1hcCgodm9pZCAqKSgodW5zaWduZWQgbG9uZylh
ZGRyICYgUEFHRV9NQVNLKSk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChpb3VubWFwKTsKPiArI2Vu
ZGlmIC8qIENPTkZJR19HRU5FUklDX0lPUkVNQVAgKi8KClJldmlld2VkLWJ5OiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgoKVGhhbmtzISAgVGhpcyBzaG91bGQgbGV0IHVzIGdl
dCByaWQgb2YgYXJjaC9yaXNjdi9tbS9pb3JlbWFwLmMuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
