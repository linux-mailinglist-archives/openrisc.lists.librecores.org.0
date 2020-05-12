Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 230461D2014
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C850420B58;
	Wed, 13 May 2020 22:17:54 +0200 (CEST)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 87D2E200FF
 for <openrisc@lists.librecores.org>; Wed, 13 May 2020 01:00:30 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id e6so10119218pjt.4
 for <openrisc@lists.librecores.org>; Tue, 12 May 2020 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=;
 b=YV0IEXO5IABYUMUtMWw6Y0a2xNZhYt4iDNMNdBJAdhkLz+DhDJrEb2/tely+kMRfBe
 elzT7mfwntttCi0+nBJzpxqW1RzbdA4k2z5m0sbPhXbgm86NhUGJ6ezv1UWvqUAF6AFb
 GwYEyZnEpPlXtS0AdB1oOMIXhoSzH1oQ3QYdKyFvf7rV9a0F5474HoxquQdEEcVsoVZk
 mkFDvy/LaDlTuj+uY+/sZnyRH+3w/Rut2ArIzwHPIrhPI856FrWtiOC99MOqCPnAlAt1
 y5de0EiQgDBn8VhocdW7T7X+feJnXd114pzMo7qEMcn1qfbF3zf4gbB8O6Pkx7p0q4QB
 ZmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=;
 b=k+xG12zZsbCWWhHVybHZ1KEPHahy0PYJpN8zIruSZfwuAGCrbZThlvi4dvon3PaIXo
 vcLgJGduWuUjfNs9Ufe//ju/N1JqgS2tJ8hC6iftTGkK19MKP/oERxwZvIK4jzzXs5qO
 9YaaNr7UKZrJL/em3iZ4f+JeTCfcKX7U2BkBdw1unKRBvfEjM0/m7eLvYzV7Ds9kNPT3
 Vrg/vWr7KhRd3djMboq6Jpu+fko0OEdDHj+ew8ELs40e3iVXhy8en0oepTLYp/UyhfJe
 c+xpJ3bNn20ZjyL6AzJHzEsHIMV/vvdGtc5wgkQOvkd40NuuW2GjLFH4RjwmzpPYrYrg
 SUOg==
X-Gm-Message-State: AGi0PuaMUMLw9nQyQ0D6ass1kXjbLV41Dbjy5I4epcvpq6gW+QNa2NN6
 l2Wn8wNeCQOTP0YRIb0SyCkJ6Q==
X-Google-Smtp-Source: APiQypKPbiNIuzOhnfWZK3aSuAimZ6kMvjtjoB3PUVWkLgrXCsrrvonJs2vHPqxiHQA1YoMJYuJ02Q==
X-Received: by 2002:a17:90a:2281:: with SMTP id
 s1mr31687737pjc.68.1589324428530; 
 Tue, 12 May 2020 16:00:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w143sm12602170pfc.165.2020.05.12.16.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 16:00:26 -0700 (PDT)
Date: Tue, 12 May 2020 16:00:26 -0700 (PDT)
X-Google-Original-Date: Tue, 12 May 2020 15:59:50 PDT (-0700)
In-Reply-To: <20200510075510.987823-20-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-8adbedbc-0f91-4291-9471-2df5eb7b802b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 19/31] riscv: use asm-generic/cacheflush.h
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, jeyu@kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 monstr@monstr.eu, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCAxMCBNYXkgMjAyMCAwMDo1NDo1OCBQRFQgKC0wNzAwKSwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gUklTQy1WIG5lZWRzIGFsbW9zdCBubyBjYWNoZSBmbHVzaGluZyByb3V0aW5l
cyBvZiBpdHMgb3duLiAgUmVseSBvbgo+IGFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBmb3IgdGhl
IGRlZmF1bHRzLgo+Cj4gQWxzbyByZW1vdmUgdGhlIHBvaW50bGVzcyBfX0tFUk5FTF9fIGlmZGVm
IHdoaWxlIHdlJ3JlIGF0IGl0Lgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaCB8IDYyICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmgKPiBpbmRleCBjODY3N2M3NWY4MmNiLi5hMTY3YjRmYmRmMDA3IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiBAQCAtOCw2NSArOCw2IEBACj4KPiAg
I2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4KPiAtI2RlZmluZSBBUkNIX0lNUExFTUVOVFNfRkxVU0hf
RENBQ0hFX1BBR0UgMAo+IC0KPiAtLyoKPiAtICogVGhlIGNhY2hlIGRvZXNuJ3QgbmVlZCB0byBi
ZSBmbHVzaGVkIHdoZW4gVExCIGVudHJpZXMgY2hhbmdlIHdoZW4KPiAtICogdGhlIGNhY2hlIGlz
IG1hcHBlZCB0byBwaHlzaWNhbCBtZW1vcnksIG5vdCB2aXJ0dWFsIG1lbW9yeQo+IC0gKi8KPiAt
c3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2NhY2hlX2FsbCh2b2lkKQo+IC17Cj4gLX0KPiAtCj4g
LXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkK
PiAtewo+IC19Cj4gLQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfZHVwX21tKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+IC17Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBm
bHVzaF9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAtCQkJCSAgICAg
dW5zaWduZWQgbG9uZyBzdGFydCwKPiAtCQkJCSAgICAgdW5zaWduZWQgbG9uZyBlbmQpCj4gLXsK
PiAtfQo+IC0KPiAtc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2NhY2hlX3BhZ2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCj4gLQkJCQkgICAgdW5zaWduZWQgbG9uZyB2bWFkZHIsCj4gLQkJ
CQkgICAgdW5zaWduZWQgbG9uZyBwZm4pCj4gLXsKPiAtfQo+IC0KPiAtc3RhdGljIGlubGluZSB2
b2lkIGZsdXNoX2RjYWNoZV9tbWFwX2xvY2soc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcp
Cj4gLXsKPiAtfQo+IC0KPiAtc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNoZV9tbWFwX3Vu
bG9jayhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZykKPiAtewo+IC19Cj4gLQo+IC1zdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfaWNhY2hlX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsCj4gLQkJCQkgICAgIHN0cnVjdCBwYWdlICpwYWdlKQo+IC17Cj4gLX0KPiAtCj4gLXN0YXRp
YyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92bWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgZW5kKQo+IC17Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9j
YWNoZV92dW5tYXAodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gLXsK
PiAtfQo+IC0KPiAtI2RlZmluZSBjb3B5X3RvX3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZhZGRyLCBk
c3QsIHNyYywgbGVuKSBcCj4gLQlkbyB7IFwKPiAtCQltZW1jcHkoZHN0LCBzcmMsIGxlbik7IFwK
PiAtCQlmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBhZ2UsIHZhZGRyLCBsZW4pOyBcCj4g
LQl9IHdoaWxlICgwKQo+IC0jZGVmaW5lIGNvcHlfZnJvbV91c2VyX3BhZ2Uodm1hLCBwYWdlLCB2
YWRkciwgZHN0LCBzcmMsIGxlbikgXAo+IC0JbWVtY3B5KGRzdCwgc3JjLCBsZW4pCj4gLQo+ICBz
dGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCh2b2lkKQo+ICB7Cj4gIAlh
c20gdm9sYXRpbGUgKCJmZW5jZS5pIiA6OjogIm1lbW9yeSIpOwo+IEBAIC03OSw2ICsyMCw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkK
PiAgCWlmICh0ZXN0X2JpdChQR19kY2FjaGVfY2xlYW4sICZwYWdlLT5mbGFncykpCj4gIAkJY2xl
YXJfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBhZ2UtPmZsYWdzKTsKPiAgfQo+ICsjZGVmaW5lIEFS
Q0hfSU1QTEVNRU5UU19GTFVTSF9EQ0FDSEVfUEFHRSAxCj4KPiAgLyoKPiAgICogUklTQy1WIGRv
ZXNuJ3QgaGF2ZSBhbiBpbnN0cnVjdGlvbiB0byBmbHVzaCBwYXJ0cyBvZiB0aGUgaW5zdHJ1Y3Rp
b24gY2FjaGUsCj4gQEAgLTEwNSw0ICs0Nyw2IEBAIHZvaWQgZmx1c2hfaWNhY2hlX21tKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCBib29sIGxvY2FsKTsKPiAgI2RlZmluZSBTWVNfUklTQ1ZfRkxVU0hf
SUNBQ0hFX0xPQ0FMIDFVTAo+ICAjZGVmaW5lIFNZU19SSVNDVl9GTFVTSF9JQ0FDSEVfQUxMICAg
KFNZU19SSVNDVl9GTFVTSF9JQ0FDSEVfTE9DQUwpCj4KPiArI2luY2x1ZGUgPGFzbS1nZW5lcmlj
L2NhY2hlZmx1c2guaD4KPiArCj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX0NBQ0hFRkxVU0hfSCAq
LwoKVGhhbmtzIQoKUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdv
b2dsZS5jb20+CkFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUu
Y29tPgoKV2VyZSB5b3UgdHJ5aW5nIHRvIGdldCB0aGVzZSBhbGwgaW4gYXQgb25jZSwgb3IgZG8g
eW91IHdhbnQgbWUgdG8gdGFrZSBpdCBpbnRvCm15IHRyZWU/Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
