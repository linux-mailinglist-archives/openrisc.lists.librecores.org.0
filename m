Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76E1FF7405
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2C05720756;
	Mon, 11 Nov 2019 13:37:34 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 0D83620332
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 18:56:37 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id x28so16281902pfo.6
 for <openrisc@lists.librecores.org>; Wed, 06 Nov 2019 09:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=xZW1gMrCUoJqpGWBEYHWFfV09K+K/0uVmzI4MIoxGS8=;
 b=PGZwZeqhjPGqmbBUrw44Auucb8k6dPtlYxXbuNpTAeEMGmKlsnFWXhrKzSARRD1P5Z
 ofkafacEFrUvuMMQ8srHmApZNGXOM2FXgWNtdGS1rg8UPKc85d79tzD5/t3BF7GMjDtX
 WoCFpoFoR/nlY6sa8P7ME55iO2h9Yfcb7ZSd7Zw+om2XJAjYyCK0yIJtNHDyXsnWFiZL
 JcRZR97cwQ2ZvZRsXx81CQhAqwyUUPUY90oJrysCQQ7l1b0iCyPludGEBBLbIE1elh0S
 JIqszC7OB8xZ2n5/8rEoDBU7MzMibg41EDmgXW2rJwIAtaViAg8zHwFVYITgL2sVpvu1
 UzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=xZW1gMrCUoJqpGWBEYHWFfV09K+K/0uVmzI4MIoxGS8=;
 b=nvHOocfesOT04KtGjAbOVfRD8GRCsItA8Q+ShJXar8uwbwiKUyap2DisRckPs0gyfY
 EE7d+AOFXpdgaPxXbdfCjj+iHwlj0CveTm1T5imCYAwyBcZ87GfA10utVwve80R8ivgN
 Gl85SL/HpNgjzkeGNOGVG2JNpYOq3iloSfXBIHkplmj/A6A88Zq8RrP97FedQ/ZqC++5
 eQZKmk4UdahEj/FDJHDS6hzXxPv3lAvZPTLZJDJanBW34yho9u84QybW8FZnO4NoPfdf
 RqIrXUJOL/ZoWTNmQSdhzobAOV53zQYhm9ruHgnSr2RyoaO+Im+lLDN9Ob6bIU31l1Az
 61Wg==
X-Gm-Message-State: APjAAAUFen1+AIozuLlWDO1c8KUFbk+nztNIafU6kXjX3hLwYSWkBPCN
 SLJaJ5WBGWWy5sULtHjhv7L/Bw==
X-Google-Smtp-Source: APXvYqyZI0/opOONYHdOR3l6SH/z69P+ajsTKg8L6ObdzcVPlsahU45e+bD0ChxR/pgAJsTDNgZ9EA==
X-Received: by 2002:a17:90a:340c:: with SMTP id
 o12mr5529604pjb.18.1573062994968; 
 Wed, 06 Nov 2019 09:56:34 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z11sm32745913pfg.117.2019.11.06.09.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 09:56:34 -0800 (PST)
Date: Wed, 06 Nov 2019 09:56:34 -0800 (PST)
X-Google-Original-Date: Wed, 06 Nov 2019 09:56:23 PST (-0800)
In-Reply-To: <20191029064834.23438-11-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-3f709a8a-a8c3-4612-b4de-847d13b4af0a@palmer-si-x1c4>
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 10/21] asm-generic: ioremap_uc should behave
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCAyOCBPY3QgMjAxOSAyMzo0ODoyMyBQRFQgKC0wNzAwKSwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gV2hhdGV2ZXIgcmVhc29uIHRoZXJlIGlzIGZvciB0aGUgZXhpc3RlbmNlIG9m
IGlvcmVtYXBfdWMsIGFuZCB0aGUgZmFjdAo+IHRoYXQgaXQgcmV0dXJucyBOVUxMIGJ5IGRlZmF1
bHQgb24gYXJjaGl0ZWN0dXJlcyB3aXRoIGFuIE1NVSBhcHBsaWVzCj4gZXF1YWxseSB0byBub21t
dSBhcmNoaXRlY3R1cmVzLCBzbyBkb24ndCBwcm92aWRlIGRpZmZlcmVudCBkZWZhdWx0cy4KPgo+
IEluIHByYWN0aWNlIHRoZSBkaWZmZXJlbmNlIGlzIG1lYW5pbmdsZXNzIGFzIHRoZSBvbmx5IHBv
cnRhYmxlIGRyaXZlcgo+IHRoYXQgdXNlcyBpb3JlbWFwX3VjIGlzIGF0eWZiIHdoaWNoIHByb2Jh
Ymx5IGRvZXNuJ3Qgc2hvdyB1cCBvbiBub21tdQo+IGRldmljZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9pby5oIHwgMzYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lv
LmgKPiBpbmRleCBkMDI4MDY1MTM2NzAuLmE5OGVkNjMyNTcyNyAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2FzbS1nZW5lcmljL2lvLmgKPiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKPiBA
QCAtOTM1LDE4ICs5MzUsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKnBoeXNfdG9fdmlydCh1bnNp
Z25lZCBsb25nIGFkZHJlc3MpCj4gICAqIGRlZmluZWQgeW91ciBvd24gaW9yZW1hcF8qKCkgdmFy
aWFudCB5b3UgbXVzdCB0aGVuIGRlY2xhcmUgeW91ciBvd24KPiAgICogaW9yZW1hcF8qKCkgdmFy
aWFudCBhcyBkZWZpbmVkIHRvIGl0c2VsZiB0byBhdm9pZCB0aGUgZGVmYXVsdCBOVUxMIHJldHVy
bi4KPiAgICovCj4gLQo+IC0jaWZkZWYgQ09ORklHX01NVQo+IC0KPiAtI2lmbmRlZiBpb3JlbWFw
X3VjCj4gLSNkZWZpbmUgaW9yZW1hcF91YyBpb3JlbWFwX3VjCj4gLXN0YXRpYyBpbmxpbmUgdm9p
ZCBfX2lvbWVtICppb3JlbWFwX3VjKHBoeXNfYWRkcl90IG9mZnNldCwgc2l6ZV90IHNpemUpCj4g
LXsKPiAtCXJldHVybiBOVUxMOwo+IC19Cj4gLSNlbmRpZgo+IC0KPiAtI2Vsc2UgLyogIUNPTkZJ
R19NTVUgKi8KPiArI2lmbmRlZiBDT05GSUdfTU1VCj4KPiAgLyoKPiAgICogQ2hhbmdlICJzdHJ1
Y3QgcGFnZSIgdG8gcGh5c2ljYWwgYWRkcmVzcy4KPiBAQCAtOTgwLDE0ICs5NjksNiBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF9ub2NhY2hlKHBoeXNfYWRkcl90IG9mZnNl
dCwgc2l6ZV90IHNpemUpCj4gIH0KPiAgI2VuZGlmCj4KPiAtI2lmbmRlZiBpb3JlbWFwX3VjCj4g
LSNkZWZpbmUgaW9yZW1hcF91YyBpb3JlbWFwX3VjCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBfX2lv
bWVtICppb3JlbWFwX3VjKHBoeXNfYWRkcl90IG9mZnNldCwgc2l6ZV90IHNpemUpCj4gLXsKPiAt
CXJldHVybiBpb3JlbWFwX25vY2FjaGUob2Zmc2V0LCBzaXplKTsKPiAtfQo+IC0jZW5kaWYKPiAt
Cj4gICNpZm5kZWYgaW9yZW1hcF93Ywo+ICAjZGVmaW5lIGlvcmVtYXBfd2MgaW9yZW1hcF93Ywo+
ICBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF93YyhwaHlzX2FkZHJfdCBvZmZz
ZXQsIHNpemVfdCBzaXplKQo+IEBAIC0xMDA0LDYgKzk4NSwyMSBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgX19pb21lbSAqaW9yZW1hcF93dChwaHlzX2FkZHJfdCBvZmZzZXQsIHNpemVfdCBzaXplKQo+
ICB9Cj4gICNlbmRpZgo+Cj4gKy8qCj4gKyAqIGlvcmVtYXBfdWMgaXMgc3BlY2lhbCBpbiB0aGF0
IHdlIGRvIHJlcXVpcmUgYW4gZXhwbGljaXQgYXJjaGl0ZWN0dXJlCj4gKyAqIGltcGxlbWVudGF0
aW9uLiAgSW4gZ2VuZXJhbCB5b3UgZG8gbm93IHdhbnQgdG8gdXNlIHRoaXMgZnVuY3Rpb24gaW4g
YQoKUHJlc3VtYWJseSB0aGF0J3Mgc3VwcG9zZWQgdG8gYmUgImRvIG5vdCB3YW50IHRvIHVzZSI/
Cgo+ICsgKiBkcml2ZXIgYW5kIHVzZSBwbGFpbiBpb3JlbWFwLCB3aGljaCBpcyB1bmNhY2hlZCBi
eSBkZWZhdWx0LiAgU2ltaWxhcmx5Cj4gKyAqIGFyY2hpdGVjdHVyZXMgc2hvdWxkIG5vdCBpbXBs
ZW1lbnQgaXQgdW5sZXNzIHRoZXkgaGF2ZSBhIHZlcnkgZ29vZAo+ICsgKiByZWFzb24uCj4gKyAq
Lwo+ICsjaWZuZGVmIGlvcmVtYXBfdWMKPiArI2RlZmluZSBpb3JlbWFwX3VjIGlvcmVtYXBfdWMK
PiArc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfdWMocGh5c19hZGRyX3Qgb2Zm
c2V0LCBzaXplX3Qgc2l6ZSkKPiArewo+ICsJcmV0dXJuIE5VTEw7Cj4gK30KPiArI2VuZGlmCj4g
Kwo+ICAjaWZkZWYgQ09ORklHX0hBU19JT1BPUlRfTUFQCj4gICNpZm5kZWYgQ09ORklHX0dFTkVS
SUNfSU9NQVAKPiAgI2lmbmRlZiBpb3BvcnRfbWFwCgpXaXRoIHRoZSBmaXg6CgpSZXZpZXdlZC1i
eTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
