Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 481054C8D32
	for <lists+openrisc@lfdr.de>; Tue,  1 Mar 2022 15:00:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1AF61242EA;
	Tue,  1 Mar 2022 15:00:47 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id B219820DEE
 for <openrisc@lists.librecores.org>; Tue,  1 Mar 2022 15:00:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7019C61521
 for <openrisc@lists.librecores.org>; Tue,  1 Mar 2022 14:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69EBC340F5
 for <openrisc@lists.librecores.org>; Tue,  1 Mar 2022 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646143242;
 bh=OCDdNe18bifA05pJN6Z3cL5GH76Vx+vSN/tAl+9N2NY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BXoUaM8AeIN8f71PC8fIcrdCRd3XA5bTRsNaI55YrB3n8AdYcHHNQ5PfFONmNJdx9
 3/CPcWQI6xI4q3njZfKJ//7qUb0OLv2P2whtuS8vVnMjqGPoCVcBgHyuiPi2wNTcJ+
 KSByydI8JzRxlo4gWWoVzIU41cydpMN+5Nu46TbYtJPRxdtzH4yMR64LlBcFEmPqIp
 3wzu1lY8fiIAXNFPydAfWfshcQxjaRgRJyXZ322mrYl9USFIgjN6ICC0+WR+CyrjeE
 Jxihmtaod4/dKtcpNMu61/NIh4k/DY+2ax2xbrEVmUuihjdGPL4LSD/jeHzVTjPcDD
 a2kZEW+hgrGpQ==
Received: by mail-vk1-f175.google.com with SMTP id bj24so6890569vkb.8
 for <openrisc@lists.librecores.org>; Tue, 01 Mar 2022 06:00:42 -0800 (PST)
X-Gm-Message-State: AOAM532oIzyFoOO5QJsdvbxC4KoBPT6BrMQocDCS51zDja2sWwadOD5m
 2UTgBCDMrlIMJxKhq6+nJgaye0+qdtLiU8iTrjE=
X-Google-Smtp-Source: ABdhPJwoZPlQG03sWsMv2LaiAVeC86gQ0+wyv+RzPw7RH1ttQNeeKqagstcZB00XUabb5ygCz6Zjo4KWbVCaIqQUo1I=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr10404475vkf.35.1646143241667; Tue, 01 Mar
 2022 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-20-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1646045273-9343-20-git-send-email-anshuman.khandual@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Mar 2022 22:00:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSE-=-rDkMTD8D-bNw5inb4Yb_8S-AzXAuAthn9PCJmA@mail.gmail.com>
Message-ID: <CAJF2gTRSE-=-rDkMTD8D-bNw5inb4Yb_8S-AzXAuAthn9PCJmA@mail.gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [OpenRISC] [PATCH V3 19/30] csky/mm: Enable
 ARCH_HAS_VM_GET_PAGE_PROT
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
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gTW9uLCBGZWIgMjgsIDIw
MjIgYXQgNzoxMCBQTSBBbnNodW1hbiBLaGFuZHVhbAo8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNv
bT4gd3JvdGU6Cj4KPiBUaGlzIGRlZmluZXMgYW5kIGV4cG9ydHMgYSBwbGF0Zm9ybSBzcGVjaWZp
YyBjdXN0b20gdm1fZ2V0X3BhZ2VfcHJvdCgpIHZpYQo+IHN1YnNjcmliaW5nIEFSQ0hfSEFTX1ZN
X0dFVF9QQUdFX1BST1QuIFN1YnNlcXVlbnRseSBhbGwgX19TWFhYIGFuZCBfX1BYWFgKPiBtYWNy
b3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCj4KPiBDYzogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBDYzogbGludXgtY3NreUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+
IC0tLQo+ICBhcmNoL2Nza3kvS2NvbmZpZyAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL2Nz
a3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gv
Y3NreS9tbS9pbml0LmMgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9LY29uZmlnIGIvYXJjaC9jc2t5L0tjb25m
aWcKPiBpbmRleCAxMzJmNDNmMTJkZDguLjIwOWRhYzU2ODZkZCAxMDA2NDQKPiAtLS0gYS9hcmNo
L2Nza3kvS2NvbmZpZwo+ICsrKyBiL2FyY2gvY3NreS9LY29uZmlnCj4gQEAgLTYsNiArNiw3IEBA
IGNvbmZpZyBDU0tZCj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfR0NPVl9QUk9GSUxFX0FMTAo+
ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUKPiAgICAgICAgIHNlbGVj
dCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFCj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNf
Vk1fR0VUX1BBR0VfUFJPVAo+ICAgICAgICAgc2VsZWN0IEFSQ0hfVVNFX0JVSUxUSU5fQlNXQVAK
PiAgICAgICAgIHNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NLUwo+ICAgICAgICAgc2VsZWN0
IEFSQ0hfV0FOVF9GUkFNRV9QT0lOVEVSUyBpZiAhQ1BVX0NLNjEwICYmICQoY2Mtb3B0aW9uLC1t
YmFja3RyYWNlKQo+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5o
IGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IGluZGV4IDE1MTYwN2VkNTE1OC4u
MmM2YjFjZmIxY2NlIDEwMDY0NAo+IC0tLSBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmgKPiArKysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTc2LDI0ICs3
Niw2IEBACj4gICNkZWZpbmUgTUFYX1NXQVBGSUxFU19DSEVDSygpIFwKPiAgICAgICAgICAgICAg
ICAgQlVJTERfQlVHX09OKE1BWF9TV0FQRklMRVNfU0hJRlQgIT0gNSkKPgo+IC0jZGVmaW5lIF9f
UDAwMCBQQUdFX05PTkUKPiAtI2RlZmluZSBfX1AwMDEgUEFHRV9SRUFECj4gLSNkZWZpbmUgX19Q
MDEwIFBBR0VfUkVBRAo+IC0jZGVmaW5lIF9fUDAxMSBQQUdFX1JFQUQKPiAtI2RlZmluZSBfX1Ax
MDAgUEFHRV9SRUFECj4gLSNkZWZpbmUgX19QMTAxIFBBR0VfUkVBRAo+IC0jZGVmaW5lIF9fUDEx
MCBQQUdFX1JFQUQKPiAtI2RlZmluZSBfX1AxMTEgUEFHRV9SRUFECj4gLQo+IC0jZGVmaW5lIF9f
UzAwMCBQQUdFX05PTkUKPiAtI2RlZmluZSBfX1MwMDEgUEFHRV9SRUFECj4gLSNkZWZpbmUgX19T
MDEwIFBBR0VfV1JJVEUKPiAtI2RlZmluZSBfX1MwMTEgUEFHRV9XUklURQo+IC0jZGVmaW5lIF9f
UzEwMCBQQUdFX1JFQUQKPiAtI2RlZmluZSBfX1MxMDEgUEFHRV9SRUFECj4gLSNkZWZpbmUgX19T
MTEwIFBBR0VfV1JJVEUKPiAtI2RlZmluZSBfX1MxMTEgUEFHRV9XUklURQo+IC0KPiAgZXh0ZXJu
IHVuc2lnbmVkIGxvbmcgZW1wdHlfemVyb19wYWdlW1BBR0VfU0laRSAvIHNpemVvZih1bnNpZ25l
ZCBsb25nKV07Cj4gICNkZWZpbmUgWkVST19QQUdFKHZhZGRyKSAgICAgICAodmlydF90b19wYWdl
KGVtcHR5X3plcm9fcGFnZSkpCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L21tL2luaXQuYyBi
L2FyY2gvY3NreS9tbS9pbml0LmMKPiBpbmRleCBiZjIwMDRhYTgxMWEuLmY5YmFiYmVkMTdkNCAx
MDA2NDQKPiAtLS0gYS9hcmNoL2Nza3kvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9jc2t5L21tL2lu
aXQuYwo+IEBAIC0xOTcsMyArMTk3LDM1IEBAIHZvaWQgX19pbml0IGZpeGFkZHJfaW5pdCh2b2lk
KQo+ICAgICAgICAgdmFkZHIgPSBfX2ZpeF90b192aXJ0KF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nl
cyAtIDEpICYgUE1EX01BU0s7Cj4gICAgICAgICBmaXhyYW5nZV9pbml0KHZhZGRyLCB2YWRkciAr
IFBNRF9TSVpFLCBzd2FwcGVyX3BnX2Rpcik7Cj4gIH0KPiArCj4gK3BncHJvdF90IHZtX2dldF9w
YWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKPiArewo+ICsgICAgICAgc3dpdGNoICh2
bV9mbGFncyAmIChWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVDIHwgVk1fU0hBUkVEKSkgewo+
ICsgICAgICAgY2FzZSBWTV9OT05FOgo+ICsgICAgICAgICAgICAgICByZXR1cm4gUEFHRV9OT05F
Owo+ICsgICAgICAgY2FzZSBWTV9SRUFEOgo+ICsgICAgICAgY2FzZSBWTV9XUklURToKPiArICAg
ICAgIGNhc2UgVk1fV1JJVEUgfCBWTV9SRUFEOgo+ICsgICAgICAgY2FzZSBWTV9FWEVDOgo+ICsg
ICAgICAgY2FzZSBWTV9FWEVDIHwgVk1fUkVBRDoKPiArICAgICAgIGNhc2UgVk1fRVhFQyB8IFZN
X1dSSVRFOgo+ICsgICAgICAgY2FzZSBWTV9FWEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEOgo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gUEFHRV9SRUFEOwo+ICsgICAgICAgY2FzZSBWTV9TSEFSRUQ6
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBQQUdFX05PTkU7Cj4gKyAgICAgICBjYXNlIFZNX1NI
QVJFRCB8IFZNX1JFQUQ6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBQQUdFX1JFQUQ7Cj4gKyAg
ICAgICBjYXNlIFZNX1NIQVJFRCB8IFZNX1dSSVRFOgo+ICsgICAgICAgY2FzZSBWTV9TSEFSRUQg
fCBWTV9XUklURSB8IFZNX1JFQUQ6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBQQUdFX1dSSVRF
Owo+ICsgICAgICAgY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDOgo+ICsgICAgICAgY2FzZSBWTV9T
SEFSRUQgfCBWTV9FWEVDIHwgVk1fUkVBRDoKPiArICAgICAgICAgICAgICAgcmV0dXJuIFBBR0Vf
UkVBRDsKPiArICAgICAgIGNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFOgo+ICsg
ICAgICAgY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEOgo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gUEFHRV9XUklURTsKPiArICAgICAgIGRlZmF1bHQ6Cj4gKyAg
ICAgICAgICAgICAgIEJVSUxEX0JVRygpOwo+ICsgICAgICAgfQo+ICt9Cj4gK0VYUE9SVF9TWU1C
T0wodm1fZ2V0X3BhZ2VfcHJvdCk7Cj4gLS0KPiAyLjI1LjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
