Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA79A1B20CE
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9872020B17;
	Tue, 21 Apr 2020 10:02:08 +0200 (CEST)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by mail.librecores.org (Postfix) with ESMTPS id E105820A91
 for <openrisc@lists.librecores.org>; Mon, 20 Apr 2020 16:26:12 +0200 (CEST)
Received: by mail-qt1-f193.google.com with SMTP id x2so8586782qtr.0
 for <openrisc@lists.librecores.org>; Mon, 20 Apr 2020 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=x4haHkUujR1fKPz5RIOI82+KmuZk6e+W1yh47eNmIvQ=;
 b=DnvEUFzSch8BOWv/K7yUwrGGEukS5excCJecSvcapVOhdy/OFYe7Y9x1bGe8SeT916
 l1+1chsImNg3ZkGKpfN6ahvWi6toqC2h9IrP5AAGTN0GSjdGn3qsRFRJ+RJKyRIC9tu1
 Dj3ea0wViCiibWw2vLnH2xAQFEOjXLO8KUs1T46qoBzPcqk7/mrvO1+D2/LejHD1ICpo
 KoyvCsqeLxeoDgKdlRyHMBD+KBeYlPJHqA50tfN8jzW6UL/Xp60Ax2PqCOWTXHM9g3GG
 cbNMSaz+pl+PNBKPTXdiSGvlo1iEHh3BDrH71SvZZsVGfYckGoh6BGUSunvfhu/heiMK
 xWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=x4haHkUujR1fKPz5RIOI82+KmuZk6e+W1yh47eNmIvQ=;
 b=KUdtj7Ncc7dG5owO7+X3PntoZuF9yYn2z8myywgjrlAgbRmHoQaxA6ovoy9mkrf32k
 d+jYNuslkijUk/s/vRCVodLOIxHTPN63KhwUGeRRI4T/4hprcHiw3gCR+rzBroxRNgrQ
 yRatxx2o8+PLsLG1Y5zSy3haHDMWaPp3Uru61gUgZrzME+ZNIMxO+Z7eAPwi1rN15M7n
 2LLdbhzcM+23W6mQpSqXF3BL+jALstI7UacpLVu9e7zxeVgWsfPl27I9tTCpePmXlVOL
 wIpGwEzv5t2En+44hVKg+BJyXGVuGYUhaHRspta8swqievdo0HaIWnrZVhcvpFyqIGLt
 1w+w==
X-Gm-Message-State: AGi0PuYGC/JIgAT+6TEVmtoC1heHEdT1hhrPuWLcsh3KVcKbKyz3Jzq9
 CUuVPl16xO6xzwkUU/GnAYP+Ug==
X-Google-Smtp-Source: APiQypK9hXIJAT9p6UDuSW0Ke/HoSOO0StxcY8aUeQ8xLhHHYW6L8ucFNnBF0yisbryde+2cyEFxTQ==
X-Received: by 2002:ac8:76da:: with SMTP id q26mr15821003qtr.168.1587392770907; 
 Mon, 20 Apr 2020 07:26:10 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id p1sm665290qkd.23.2020.04.20.07.26.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:26:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Qian Cai <cai@lca.pw>
In-Reply-To: <20200412194859.12663-16-rppt@kernel.org>
Date: Mon, 20 Apr 2020 10:26:06 -0400
Message-Id: <CF6E407F-17DC-427C-8203-21979FB882EF@lca.pw>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-16-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
 Baoquan He <bhe@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: Re: [OpenRISC] [PATCH 15/21] mm: memmap_init: iterate over memblock
 regions rather that check each PFN
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Linux-MM <linux-mm@kvack.org>, Vineet Gupta <vgupta@synopsys.com>,
 LKML <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Cgo+IE9uIEFwciAxMiwgMjAyMCwgYXQgMzo0OCBQTSwgTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPiAKPiBGcm9tOiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KPiAK
PiBXaGVuIGNhbGxlZCBkdXJpbmcgYm9vdCB0aGUgbWVtbWFwX2luaXRfem9uZSgpIGZ1bmN0aW9u
IGNoZWNrcyBpZiBlYWNoIFBGTgo+IGlzIHZhbGlkIGFuZCBhY3R1YWxseSBiZWxvbmdzIHRvIHRo
ZSBub2RlIGJlaW5nIGluaXRpYWxpemVkIHVzaW5nCj4gZWFybHlfcGZuX3ZhbGlkKCkgYW5kIGVh
cmx5X3Bmbl9pbl9uaWQoKS4KPiAKPiBFYWNoIHN1Y2ggY2hlY2sgbWF5IGNvc3QgdXAgdG8gTyhs
b2cobikpIHdoZXJlIG4gaXMgdGhlIG51bWJlciBvZiBtZW1vcnkKPiBiYW5rcywgc28gZm9yIGxh
cmdlIGFtb3VudCBvZiBtZW1vcnkgb3ZlcmFsbCB0aW1lIHNwZW50IGluIGVhcmx5X3BmbiooKQo+
IGJlY29tZXMgc3Vic3RhbnRpYWwuCj4gCj4gU2luY2UgdGhlIGluZm9ybWF0aW9uIGlzIGFueXdh
eSBwcmVzZW50IGluIG1lbWJsb2NrLCB3ZSBjYW4gaXRlcmF0ZSBvdmVyCj4gbWVtYmxvY2sgbWVt
b3J5IHJlZ2lvbnMgaW4gbWVtbWFwX2luaXQoKSBhbmQgb25seSBjYWxsIG1lbW1hcF9pbml0X3pv
bmUoKQo+IGZvciBQRk4gcmFuZ2VzIHRoYXQgYXJlIGtub3cgdG8gYmUgdmFsaWQgYW5kIGluIHRo
ZSBhcHByb3ByaWF0ZSBub2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhb3F1YW4gSGUgPGJoZUBy
ZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJt
LmNvbT4KPiAtLS0KPiBtbS9wYWdlX2FsbG9jLmMgfCAyNiArKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5k
ZXggN2Y2YTMwODFlZGI4Li5jNDNjZTg3MDk0NTcgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxv
Yy5jCj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAgLTU5OTUsMTQgKzU5OTUsNiBAQCB2b2lk
IF9fbWVtaW5pdCBtZW1tYXBfaW5pdF96b25lKHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCwg
dW5zaWduZWQgbG9uZyB6b25lLAo+IAkJICogZnVuY3Rpb24uICBUaGV5IGRvIG5vdCBleGlzdCBv
biBob3RwbHVnZ2VkIG1lbW9yeS4KPiAJCSAqLwo+IAkJaWYgKGNvbnRleHQgPT0gTUVNTUFQX0VB
UkxZKSB7Cj4gLQkJCWlmICghZWFybHlfcGZuX3ZhbGlkKHBmbikpIHsKPiAtCQkJCXBmbiA9IG5l
eHRfcGZuKHBmbik7Cj4gLQkJCQljb250aW51ZTsKPiAtCQkJfQo+IC0JCQlpZiAoIWVhcmx5X3Bm
bl9pbl9uaWQocGZuLCBuaWQpKSB7Cj4gLQkJCQlwZm4rKzsKPiAtCQkJCWNvbnRpbnVlOwo+IC0J
CQl9CgpUaGlzIGNhdXNlcyBhIGNvbXBpbGF0aW9uIHdhcm5pbmcgZnJvbSBDbGFuZywKCm1tL3Bh
Z2VfYWxsb2MuYzo1OTE3OjM5OiB3YXJuaW5nOiB1bnVzZWQgZnVuY3Rpb24gJ25leHRfcGZuJyBb
LVd1bnVzZWQtZnVuY3Rpb25dCnN0YXRpYyBpbmxpbmUgX19tZW1pbml0IHVuc2lnbmVkIGxvbmcg
bmV4dF9wZm4odW5zaWduZWQgbG9uZyBwZm4pCgpUaGlzIHNob3VsZCBmaXggaXQsCgpkaWZmIC0t
Z2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCmluZGV4IGQ0NjkzODRjOWNh
Ny4uYjQ4MzM2ZTIwYmRjIDEwMDY0NAotLS0gYS9tbS9wYWdlX2FsbG9jLmMKKysrIGIvbW0vcGFn
ZV9hbGxvYy5jCkBAIC01OTEyLDIzICs1OTEyLDYgQEAgb3ZlcmxhcF9tZW1tYXBfaW5pdCh1bnNp
Z25lZCBsb25nIHpvbmUsIHVuc2lnbmVkIGxvbmcgKnBmbikKIAlyZXR1cm4gZmFsc2U7CiB9CiAK
LSNpZmRlZiBDT05GSUdfU1BBUlNFTUVNCi0vKiBTa2lwIFBGTnMgdGhhdCBiZWxvbmcgdG8gbm9u
LXByZXNlbnQgc2VjdGlvbnMgKi8KLXN0YXRpYyBpbmxpbmUgX19tZW1pbml0IHVuc2lnbmVkIGxv
bmcgbmV4dF9wZm4odW5zaWduZWQgbG9uZyBwZm4pCi17Ci0JY29uc3QgdW5zaWduZWQgbG9uZyBz
ZWN0aW9uX25yID0gcGZuX3RvX3NlY3Rpb25fbnIoKytwZm4pOwotCi0JaWYgKHByZXNlbnRfc2Vj
dGlvbl9ucihzZWN0aW9uX25yKSkKLQkJcmV0dXJuIHBmbjsKLQlyZXR1cm4gc2VjdGlvbl9ucl90
b19wZm4obmV4dF9wcmVzZW50X3NlY3Rpb25fbnIoc2VjdGlvbl9ucikpOwotfQotI2Vsc2UKLXN0
YXRpYyBpbmxpbmUgX19tZW1pbml0IHVuc2lnbmVkIGxvbmcgbmV4dF9wZm4odW5zaWduZWQgbG9u
ZyBwZm4pCi17Ci0JcmV0dXJuIHBmbisrOwotfQotI2VuZGlmCi0KIC8qCiAgKiBJbml0aWFsbHkg
YWxsIHBhZ2VzIGFyZSByZXNlcnZlZCAtIGZyZWUgb25lcyBhcmUgZnJlZWQKICAqIHVwIGJ5IG1l
bWJsb2NrX2ZyZWVfYWxsKCkgb25jZSB0aGUgZWFybHkgYm9vdCBwcm9jZXNzIGlzCgo+IAkJCWlm
IChvdmVybGFwX21lbW1hcF9pbml0KHpvbmUsICZwZm4pKQo+IAkJCQljb250aW51ZTsKPiAJCQlp
ZiAoZGVmZXJfaW5pdChuaWQsIHBmbiwgZW5kX3BmbikpCj4gQEAgLTYxMTgsOSArNjExMCwyMyBA
QCBzdGF0aWMgdm9pZCBfX21lbWluaXQgem9uZV9pbml0X2ZyZWVfbGlzdHMoc3RydWN0IHpvbmUg
KnpvbmUpCj4gfQo+IAo+IHZvaWQgX19tZW1pbml0IF9fd2VhayBtZW1tYXBfaW5pdCh1bnNpZ25l
ZCBsb25nIHNpemUsIGludCBuaWQsCj4gLQkJCQkgIHVuc2lnbmVkIGxvbmcgem9uZSwgdW5zaWdu
ZWQgbG9uZyBzdGFydF9wZm4pCj4gKwkJCQkgIHVuc2lnbmVkIGxvbmcgem9uZSwKPiArCQkJCSAg
dW5zaWduZWQgbG9uZyByYW5nZV9zdGFydF9wZm4pCj4gewo+IC0JbWVtbWFwX2luaXRfem9uZShz
aXplLCBuaWQsIHpvbmUsIHN0YXJ0X3BmbiwgTUVNTUFQX0VBUkxZLCBOVUxMKTsKPiArCXVuc2ln
bmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRfcGZuOwo+ICsJdW5zaWduZWQgbG9uZyByYW5nZV9lbmRf
cGZuID0gcmFuZ2Vfc3RhcnRfcGZuICsgc2l6ZTsKPiArCWludCBpOwo+ICsKPiArCWZvcl9lYWNo
X21lbV9wZm5fcmFuZ2UoaSwgbmlkLCAmc3RhcnRfcGZuLCAmZW5kX3BmbiwgTlVMTCkgewo+ICsJ
CXN0YXJ0X3BmbiA9IGNsYW1wKHN0YXJ0X3BmbiwgcmFuZ2Vfc3RhcnRfcGZuLCByYW5nZV9lbmRf
cGZuKTsKPiArCQllbmRfcGZuID0gY2xhbXAoZW5kX3BmbiwgcmFuZ2Vfc3RhcnRfcGZuLCByYW5n
ZV9lbmRfcGZuKTsKPiArCj4gKwkJaWYgKGVuZF9wZm4gPiBzdGFydF9wZm4pIHsKPiArCQkJc2l6
ZSA9IGVuZF9wZm4gLSBzdGFydF9wZm47Cj4gKwkJCW1lbW1hcF9pbml0X3pvbmUoc2l6ZSwgbmlk
LCB6b25lLCBzdGFydF9wZm4sCj4gKwkJCQkJIE1FTU1BUF9FQVJMWSwgTlVMTCk7Cj4gKwkJfQo+
ICsJfQo+IH0KPiAKPiBzdGF0aWMgaW50IHpvbmVfYmF0Y2hzaXplKHN0cnVjdCB6b25lICp6b25l
KQo+IC0tIAo+IDIuMjUuMQo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
