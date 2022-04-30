Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8084E515B1C
	for <lists+openrisc@lfdr.de>; Sat, 30 Apr 2022 09:52:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 22D94248D7;
	Sat, 30 Apr 2022 09:52:12 +0200 (CEST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id 1D63924811
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 09:52:10 +0200 (CEST)
Received: by mail-pj1-f53.google.com with SMTP id r9so8861683pjo.5
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bDVSZwPRgcAPJ3fWKSzR6sElFikHXLwmOFE7dJ7yN/I=;
 b=cBvuaGmInnkqUkO0kS3bKHO4L9FR56pjEwE1demPcEhzi4K0j5S/88Cvsqk/k+Inec
 HRNetMhU3zxfoHzCqM8kX568jD8Dtk8BgoHBbxGb1+5Lfut0JnkbfZDqadABIRQCFVU8
 Wo8HnY8dAuKrV4Zk3L0bKRoGE+7tBTVFhdpSpChcwqKwSoBfgopMEv8GbFIxW/ajrKuH
 Kjcps/SLOfTCowCaf9zG6VUOTe+uKTf59l/KkuTkrcHBWGJhBpP+3yDdjMEW5Seg+W+H
 rMvSXfYuTQtuhfcIFZvf5onF37T127wCsbqJZEKo/CMeGotJDXQAfMH4oQ4CP83apdSw
 sFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bDVSZwPRgcAPJ3fWKSzR6sElFikHXLwmOFE7dJ7yN/I=;
 b=2+rsMwTY/IPbhNmVe02i/a7U+bd3Fd8NCOMU75xIOglaZSRYJh84GrKVDd9x1QA8mP
 347pkOlN01sdMA7RFJGpCuJiQW+JfZ/ZL6NVdZOyOKXsr1xm96vYm8dzYB6qqJbn3e/I
 5akEdT5QrH235IGX6o8KXWFy2NsjCsC6yjIMRJYJ7ntvZB+lrJOCrUpvvDPzWzgqPrqG
 JUoWD9EDSZ+7myud8RoOFjwZxbb3ugahukbNzhCnoK20aBJwVE/y4EPdHBN63w9bnCa4
 aSkRvrtW73ByEViwTL/15Z+7FsVlP5fmXDvxwpq0O8jNtckl6+/tf80AT4A5xI8qfPLG
 jvpg==
X-Gm-Message-State: AOAM533J5pDed1z1YZUB/L+yIw630U4JqHqlI37sc8+cUw85w06s1LKD
 b8M98D+GntL+R5IqaoqLYa0=
X-Google-Smtp-Source: ABdhPJyRLygBdsWCWCiMOr7lmCiKPgf60Yhl9qtmmd4xMBQ4UAqn4VA2VymZU0SJZeL72jYgAdA+ZA==
X-Received: by 2002:a17:903:246:b0:153:87f0:a93e with SMTP id
 j6-20020a170903024600b0015387f0a93emr2969288plh.171.1651305128433; 
 Sat, 30 Apr 2022 00:52:08 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b0015e8d4eb252sm851999plh.156.2022.04.30.00.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 00:52:07 -0700 (PDT)
Date: Sat, 30 Apr 2022 16:52:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <YmzqpVCEenOXRTga@antec>
References: <20220414220214.24556-1-palmer@rivosinc.com>
 <20220414220214.24556-5-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414220214.24556-5-palmer@rivosinc.com>
Subject: Re: [OpenRISC] [PATCH v3 4/7] openrisc: Move to ticket-spinlock
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
Cc: wangkefeng.wang@huawei.com, heiko@sntech.de, peterz@infradead.org,
 guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, jonas@southpole.se, linux-csky@vger.kernel.org,
 mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMDM6MDI6MTFQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IAo+
IFdlIGhhdmUgbm8gaW5kaWNhdGlvbnMgdGhhdCBvcGVucmlzYyBtZWV0cyB0aGUgcXNwaW5sb2Nr
IHJlcXVpcmVtZW50cywKPiBzbyBtb3ZlIHRvIHRpY2tldC1zcGlubG9jayBhcyB0aGF0IGlzIG1v
cmUgbGlrZXkgdG8gYmUgY29ycmVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBaaWpsc3Ry
YSAoSW50ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9vcGVucmlzYy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL29wZW5yaXNjL2luY2x1ZGUv
YXNtL0tidWlsZCAgICAgICAgICAgfCAgNSArKy0tCj4gIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vc3BpbmxvY2suaCAgICAgICB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9v
cGVucmlzYy9pbmNsdWRlL2FzbS9zcGlubG9ja190eXBlcy5oIHwgIDcgLS0tLS0tCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2suaAo+ICBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcGlubG9ja190eXBlcy5oCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJpc2MvS2Nv
bmZpZwo+IGluZGV4IDBkNjhhZGY2ZTAyYi4uOTlmMGU0YTRjYmJkIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvb3BlbnJpc2MvS2NvbmZpZwo+ICsrKyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+IEBAIC0z
MCw3ICszMCw2IEBAIGNvbmZpZyBPUEVOUklTQwo+ICAJc2VsZWN0IEhBVkVfREVCVUdfU1RBQ0tP
VkVSRkxPVwo+ICAJc2VsZWN0IE9SMUtfUElDCj4gIAlzZWxlY3QgQ1BVX05PX0VGRklDSUVOVF9G
RlMgaWYgIU9QRU5SSVNDX0hBVkVfSU5TVF9GRjEKPiAtCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURf
U1BJTkxPQ0tTCj4gIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MKPiAgCXNlbGVjdCBP
TVBJQyBpZiBTTVAKPiAgCXNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9LYnVpbGQgYi9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL0tidWlsZAo+IGluZGV4IGNhNTk4N2UxMTA1My4uMzM4NmI5YzFjMDczIDEwMDY0
NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkCj4gKysrIGIvYXJjaC9v
cGVucmlzYy9pbmNsdWRlL2FzbS9LYnVpbGQKPiBAQCAtMSw5ICsxLDggQEAKPiAgIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICBnZW5lcmljLXkgKz0gZXh0YWJsZS5oCj4gIGdl
bmVyaWMteSArPSBrdm1fcGFyYS5oCj4gLWdlbmVyaWMteSArPSBtY3Nfc3BpbmxvY2suaAo+IC1n
ZW5lcmljLXkgKz0gcXNwaW5sb2NrX3R5cGVzLmgKPiAtZ2VuZXJpYy15ICs9IHFzcGlubG9jay5o
Cj4gK2dlbmVyaWMteSArPSBzcGlubG9ja190eXBlcy5oCj4gK2dlbmVyaWMteSArPSBzcGlubG9j
ay5oCj4gIGdlbmVyaWMteSArPSBxcndsb2NrX3R5cGVzLmgKPiAgZ2VuZXJpYy15ICs9IHFyd2xv
Y2suaAo+ICBnZW5lcmljLXkgKz0gdXNlci5oCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mv
aW5jbHVkZS9hc20vc3BpbmxvY2suaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3Bpbmxv
Y2suaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDI2NDk0NGE3MTUzNS4uMDAw
MDAwMDAwMDAwCj4gLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcGlubG9jay5oCj4g
KysrIC9kZXYvbnVsbAo+IEBAIC0xLDI3ICswLDAgQEAKPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8KPiAtLyoKPiAtICogT3BlblJJU0MgTGludXgKPiAt
ICoKPiAtICogTGludXggYXJjaGl0ZWN0dXJhbCBwb3J0IGJvcnJvd2luZyBsaWJlcmFsbHkgZnJv
bSBzaW1pbGFyIHdvcmtzIG9mCj4gLSAqIG90aGVycy4gIEFsbCBvcmlnaW5hbCBjb3B5cmlnaHRz
IGFwcGx5IGFzIHBlciB0aGUgb3JpZ2luYWwgc291cmNlCj4gLSAqIGRlY2xhcmF0aW9uLgo+IC0g
Kgo+IC0gKiBPcGVuUklTQyBpbXBsZW1lbnRhdGlvbjoKPiAtICogQ29weXJpZ2h0IChDKSAyMDAz
IE1hdGpheiBCcmVza3ZhciA8cGhvZW5peEBic2VtaS5jb20+Cj4gLSAqIENvcHlyaWdodCAoQykg
MjAxMC0yMDExIEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KPiAtICogZXQgYWwuCj4g
LSAqLwo+IC0KPiAtI2lmbmRlZiBfX0FTTV9PUEVOUklTQ19TUElOTE9DS19ICj4gLSNkZWZpbmUg
X19BU01fT1BFTlJJU0NfU1BJTkxPQ0tfSAo+IC0KPiAtI2luY2x1ZGUgPGFzbS9xc3BpbmxvY2su
aD4KPiAtCj4gLSNpbmNsdWRlIDxhc20vcXJ3bG9jay5oPgo+IC0KPiAtI2RlZmluZSBhcmNoX3Nw
aW5fcmVsYXgobG9jaykJY3B1X3JlbGF4KCkKPiAtI2RlZmluZSBhcmNoX3JlYWRfcmVsYXgobG9j
aykJY3B1X3JlbGF4KCkKPiAtI2RlZmluZSBhcmNoX3dyaXRlX3JlbGF4KGxvY2spCWNwdV9yZWxh
eCgpCj4gLQo+IC0KPiAtI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vc3BpbmxvY2tfdHlwZXMuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3Bpbmxv
Y2tfdHlwZXMuaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDdjNmZiMTIwOGM4
OC4uMDAwMDAwMDAwMDAwCj4gLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcGlubG9j
a190eXBlcy5oCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDcgKzAsMCBAQAo+IC0jaWZuZGVmIF9B
U01fT1BFTlJJU0NfU1BJTkxPQ0tfVFlQRVNfSAo+IC0jZGVmaW5lIF9BU01fT1BFTlJJU0NfU1BJ
TkxPQ0tfVFlQRVNfSAo+IC0KPiAtI2luY2x1ZGUgPGFzbS9xc3BpbmxvY2tfdHlwZXMuaD4KPiAt
I2luY2x1ZGUgPGFzbS9xcndsb2NrX3R5cGVzLmg+Cj4gLQo+IC0jZW5kaWYgLyogX0FTTV9PUEVO
UklTQ19TUElOTE9DS19UWVBFU19IICovCgpUaGFua3MgZm9yIHRoaXMsIGEgYml0IGxhdGUgYnV0
LgoKQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
