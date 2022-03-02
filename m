Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4424CA1C1
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 11:05:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3965124834;
	Wed,  2 Mar 2022 11:05:43 +0100 (CET)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mail.librecores.org (Postfix) with ESMTPS id 024F624834
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 11:05:41 +0100 (CET)
Received: by mail-vk1-f178.google.com with SMTP id n10so582184vkm.10
 for <openrisc@lists.librecores.org>; Wed, 02 Mar 2022 02:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EYfrVL/3Fk55o7PeesHa/rcefVwDuQvh3Zqyw9HxNck=;
 b=p22ps3Rofb6CORj8SDnNkt3xVOGW1ph1gijkG0NIZf3rRGUJ1TqY1DTrWYGLv1NFT2
 hhWfPTvxyZWYBtWnBgIhhmW8P5E/G6GAmpjXaSuPM4DSTQBmshH/cZcLNw8APno8Aev4
 ZayEOx7uF3yX7LErhw3aCv8lxRttP7euLWhQIMFki85hkQZH9id4/AoQKJTF0KS3ciEh
 yFmg7d21PuQgNCAGBOPJ4sxSExGCYrpDIBYyFcyG5KNJCl/PRFYud5t4nfYS3f4lC+8V
 8md4KzrnnaoeipZ4CxtA17i/8t4JvxaMuK5kGkG/Kh0TWXPXsE52cchKfdIrwlyTykNG
 eFdA==
X-Gm-Message-State: AOAM533jUbkO5+b6veWkPCuxWCFU68QSv4CIS0aO4vRDkoWPUY6meGBY
 n1HNPGiwg2xk/Cco2uUDzimLt5NLsCubcw==
X-Google-Smtp-Source: ABdhPJwN9l/mpSjeAfDc0ysvB+o8MGbA0IyYIDSGThL6y9hLFl9xhLL9imyYATQqYkxl9jXxRS8vQA==
X-Received: by 2002:a05:6122:546:b0:31f:460:b0df with SMTP id
 y6-20020a056122054600b0031f0460b0dfmr12241670vko.37.1646215540578; 
 Wed, 02 Mar 2022 02:05:40 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45]) by smtp.gmail.com with ESMTPSA id
 i16-20020a056122129000b003314c50d705sm2646804vkp.22.2022.03.02.02.05.39
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 02:05:40 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id q9so1278511vsg.2
 for <openrisc@lists.librecores.org>; Wed, 02 Mar 2022 02:05:39 -0800 (PST)
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr266158vsk.38.1646215539723; Wed, 02 Mar
 2022 02:05:39 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
 <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
In-Reply-To: <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Mar 2022 11:05:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
Message-ID: <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [OpenRISC] [PATCH V3 09/30] arm/mm: Enable
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQW5zaHVtYW4sCgpPbiBXZWQsIE1hciAyLCAyMDIyIGF0IDEwOjUxIEFNIEFuc2h1bWFuIEto
YW5kdWFsCjxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPiB3cm90ZToKPiBPbiAzLzIvMjIgMTI6
MzUgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPiBMZSAwMi8wMy8yMDIyIMOgIDA0OjIy
LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdCA6Cj4gPj4gT24gMy8xLzIyIDE6NDYgUE0sIENo
cmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPj4+IExlIDAxLzAzLzIwMjIgw6AgMDE6MzEsIFJ1c3Nl
bGwgS2luZyAoT3JhY2xlKSBhIMOpY3JpdCA6Cj4gPj4+PiBPbiBUdWUsIE1hciAwMSwgMjAyMiBh
dCAwNTozMDo0MUFNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPiA+Pj4+PiBPbiAy
LzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+Pj4+Pj4gT24g
TW9uLCBGZWIgMjgsIDIwMjIgYXQgMDQ6MTc6MzJQTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1YWwg
d3JvdGU6Cj4gPj4+Pj4+PiBUaGlzIGRlZmluZXMgYW5kIGV4cG9ydHMgYSBwbGF0Zm9ybSBzcGVj
aWZpYyBjdXN0b20gdm1fZ2V0X3BhZ2VfcHJvdCgpIHZpYQo+ID4+Pj4+Pj4gc3Vic2NyaWJpbmcg
QVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9f
UFhYWAo+ID4+Pj4+Pj4gbWFjcm9zIGNhbiBiZSBkcm9wcGVkIHdoaWNoIGFyZSBubyBsb25nZXIg
bmVlZGVkLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBXaGF0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8ga25v
dyBpcyB3aHkgaGF2aW5nIHRvIHJ1biBfY29kZV8gdG8gd29yayBvdXQKPiA+Pj4+Pj4gd2hhdCB0
aGUgcGFnZSBwcm90ZWN0aW9ucyBuZWVkIHRvIGJlIGlzIGJldHRlciB0aGFuIGxvb2tpbmcgaXQg
dXAgaW4gYQo+ID4+Pj4+PiB0YWJsZS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gTm90IG9ubHkgaXMgdGhp
cyBtb3JlIGV4cGVuc2l2ZSBpbiB0ZXJtcyBvZiBDUFUgY3ljbGVzLCBpdCBhbHNvIGJyaW5ncwo+
ID4+Pj4+PiBhZGRpdGlvbmFsIGNvZGUgc2l6ZSB3aXRoIGl0Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJ
J20gc3RydWdnbGluZyB0byBzZWUgd2hhdCB0aGUgYmVuZWZpdCBpcy4KPiA+Pj4+Pgo+ID4+Pj4+
IEN1cnJlbnRseSB2bV9nZXRfcGFnZV9wcm90KCkgaXMgYWxzbyBiZWluZyBfcnVuXyB0byBmZXRj
aCByZXF1aXJlZCBwYWdlCj4gPj4+Pj4gcHJvdGVjdGlvbiB2YWx1ZXMuIEFsdGhvdWdoIHRoYXQg
aXMgYmVpbmcgcnVuIGluIHRoZSBjb3JlIE1NIGFuZCBmcm9tIGEKPiA+Pj4+PiBwbGF0Zm9ybSBw
ZXJzcGVjdGl2ZSBfX1NYWFgsIF9fUFhYWCBhcmUganVzdCBiZWluZyBleHBvcnRlZCBmb3IgYSB0
YWJsZS4KPiA+Pj4+PiBMb29raW5nIGl0IHVwIGluIGEgdGFibGUgKGFuZCBhcHBseWluZyBtb3Jl
IGNvbnN0cnVjdHMgdGhlcmUgYWZ0ZXIpIGlzCj4gPj4+Pj4gbm90IG11Y2ggZGlmZmVyZW50IHRo
YW4gYSBjbGVhbiBzd2l0Y2ggY2FzZSBzdGF0ZW1lbnQgaW4gdGVybXMgb2YgQ1BVCj4gPj4+Pj4g
dXNhZ2UuIFNvIHRoaXMgaXMgbm90IG1vcmUgZXhwZW5zaXZlIGluIHRlcm1zIG9mIENQVSBjeWNs
ZXMuCj4gPj4+Pgo+ID4+Pj4gSSBkaXNhZ3JlZS4KPiA+Pj4KPiA+Pj4gU28gZG8gSS4KPiA+Pj4K
PiA+Pj4+Cj4gPj4+PiBIb3dldmVyLCBsZXQncyBiYXNlIHRoaXMgZGlzYWdyZWVtZW50IG9uIHNv
bWUgZXZpZGVuY2UuIEhlcmUgaXMgdGhlCj4gPj4+PiBwcmVzZW50IDMyLWJpdCBBUk0gaW1wbGVt
ZW50YXRpb246Cj4gPj4+Pgo+ID4+Pj4gMDAwMDAwNDggPHZtX2dldF9wYWdlX3Byb3Q+Ogo+ID4+
Pj4gICAgICAgICA0ODogICAgICAgZTIwMDAwMGYgICAgICAgIGFuZCAgICAgcjAsIHIwLCAjMTUK
PiA+Pj4+ICAgICAgICAgNGM6ICAgICAgIGUzMDAzMDAwICAgICAgICBtb3Z3ICAgIHIzLCAjMAo+
ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICA0YzogUl9BUk1fTU9WV19BQlNfTkMgICAu
TEFOQ0hPUjEKPiA+Pj4+ICAgICAgICAgNTA6ICAgICAgIGUzNDAzMDAwICAgICAgICBtb3Z0ICAg
IHIzLCAjMAo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICA1MDogUl9BUk1fTU9WVF9B
QlMgICAgICAuTEFOQ0hPUjEKPiA+Pj4+ICAgICAgICAgNTQ6ICAgICAgIGU3OTMwMTAwICAgICAg
ICBsZHIgICAgIHIwLCBbcjMsIHIwLCBsc2wgIzJdCj4gPj4+PiAgICAgICAgIDU4OiAgICAgICBl
MTJmZmYxZSAgICAgICAgYnggICAgICBscgo+ID4+Pj4KPiA+Pj4+IFRoYXQgaXMgZml2ZSBpbnN0
cnVjdGlvbnMgbG9uZy4KPiA+Pj4KPiA+Pj4gT24gcHBjMzIgSSBnZXQ6Cj4gPj4+Cj4gPj4+IDAw
MDAwMDk0IDx2bV9nZXRfcGFnZV9wcm90PjoKPiA+Pj4gICAgICAgICA5NDogM2QgMjAgMDAgMDAg
ICAgIGxpcyAgICAgcjksMAo+ID4+PiAgICAgICAgICAgICAgICAgICAgIDk2OiBSX1BQQ19BRERS
MTZfSEEgICAgIC5kYXRhLi5yb19hZnRlcl9pbml0Cj4gPj4+ICAgICAgICAgOTg6IDU0IDg0IDE2
IGJhICAgICBybHdpbm0gIHI0LHI0LDIsMjYsMjkKPiA+Pj4gICAgICAgICA5YzogMzkgMjkgMDAg
MDAgICAgIGFkZGkgICAgcjkscjksMAo+ID4+PiAgICAgICAgICAgICAgICAgICAgIDllOiBSX1BQ
Q19BRERSMTZfTE8gICAgIC5kYXRhLi5yb19hZnRlcl9pbml0Cj4gPj4+ICAgICAgICAgYTA6IDdk
IDI5IDIwIDJlICAgICBsd3p4ICAgIHI5LHI5LHI0Cj4gPj4+ICAgICAgICAgYTQ6IDkxIDIzIDAw
IDAwICAgICBzdHcgICAgIHI5LDAocjMpCj4gPj4+ICAgICAgICAgYTg6IDRlIDgwIDAwIDIwICAg
ICBibHIKPiA+Pj4KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBQbGVhc2Ugc2hvdyB0aGF0IHlvdXIgbmV3
IGltcGxlbWVudGF0aW9uIGlzIG5vdCBtb3JlIGV4cGVuc2l2ZSBvbgo+ID4+Pj4gMzItYml0IEFS
TS4gUGxlYXNlIGRvIHNvIGJ5IGJ1aWxkaW5nIGEgMzItYml0IGtlcm5lbCwgYW5kIHByb3ZpZGlu
Zwo+ID4+Pj4gdGhlIGRpc2Fzc2VtYmx5Lgo+ID4+Pgo+ID4+PiBXaXRoIHlvdXIgc2VyaWVzIEkg
Z2V0Ogo+ID4+Pgo+ID4+PiAwMDAwMDAwMCA8dm1fZ2V0X3BhZ2VfcHJvdD46Cj4gPj4+ICAgICAg
MDogICAgIDNkIDIwIDAwIDAwICAgICBsaXMgICAgIHI5LDAKPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAyOiBSX1BQQ19BRERSMTZfSEEgICAgICAucm9kYXRhCj4gPj4+ICAgICAgNDogICAgIDM5
IDI5IDAwIDAwICAgICBhZGRpICAgIHI5LHI5LDAKPiA+Pj4gICAgICAgICAgICAgICAgICAgICA2
OiBSX1BQQ19BRERSMTZfTE8gICAgICAucm9kYXRhCj4gPj4+ICAgICAgODogICAgIDU0IDg0IDE2
IGJhICAgICBybHdpbm0gIHI0LHI0LDIsMjYsMjkKPiA+Pj4gICAgICBjOiAgICAgN2QgNDkgMjAg
MmUgICAgIGx3enggICAgcjEwLHI5LHI0Cj4gPj4+ICAgICAxMDogICAgIDdkIDRhIDRhIDE0ICAg
ICBhZGQgICAgIHIxMCxyMTAscjkKPiA+Pj4gICAgIDE0OiAgICAgN2QgNDkgMDMgYTYgICAgIG10
Y3RyICAgcjEwCj4gPj4+ICAgICAxODogICAgIDRlIDgwIDA0IDIwICAgICBiY3RyCj4gPj4+ICAg
ICAxYzogICAgIDM5IDIwIDAzIDE1ICAgICBsaSAgICAgIHI5LDc4OQo+ID4+PiAgICAgMjA6ICAg
ICA5MSAyMyAwMCAwMCAgICAgc3R3ICAgICByOSwwKHIzKQo+ID4+PiAgICAgMjQ6ICAgICA0ZSA4
MCAwMCAyMCAgICAgYmxyCj4gPj4+ICAgICAyODogICAgIDM5IDIwIDAxIDE1ICAgICBsaSAgICAg
IHI5LDI3Nwo+ID4+PiAgICAgMmM6ICAgICA5MSAyMyAwMCAwMCAgICAgc3R3ICAgICByOSwwKHIz
KQo+ID4+PiAgICAgMzA6ICAgICA0ZSA4MCAwMCAyMCAgICAgYmxyCj4gPj4+ICAgICAzNDogICAg
IDM5IDIwIDA3IDE1ICAgICBsaSAgICAgIHI5LDE4MTMKPiA+Pj4gICAgIDM4OiAgICAgOTEgMjMg
MDAgMDAgICAgIHN0dyAgICAgcjksMChyMykKPiA+Pj4gICAgIDNjOiAgICAgNGUgODAgMDAgMjAg
ICAgIGJscgo+ID4+PiAgICAgNDA6ICAgICAzOSAyMCAwNSAxNSAgICAgbGkgICAgICByOSwxMzAx
Cj4gPj4+ICAgICA0NDogICAgIDkxIDIzIDAwIDAwICAgICBzdHcgICAgIHI5LDAocjMpCj4gPj4+
ICAgICA0ODogICAgIDRlIDgwIDAwIDIwICAgICBibHIKPiA+Pj4gICAgIDRjOiAgICAgMzkgMjAg
MDEgMTEgICAgIGxpICAgICAgcjksMjczCj4gPj4+ICAgICA1MDogICAgIDRiIGZmIGZmIGQwICAg
ICBiICAgICAgIDIwIDx2bV9nZXRfcGFnZV9wcm90KzB4MjA+Cj4gPj4+Cj4gPj4+Cj4gPj4+IFRo
YXQgaXMgZGVmaW5pdGVseSBtb3JlIGV4cGVuc2l2ZSwgaXQgaW1wbGVtZW50cyBhIHRhYmxlIG9m
IGJyYW5jaGVzLgo+ID4+Cj4gPj4gT2theSwgd2lsbCBzcGxpdCBvdXQgdGhlIFBQQzMyIGltcGxl
bWVudGF0aW9uIHRoYXQgcmV0YWlucyBleGlzdGluZwo+ID4+IHRhYmxlIGxvb2sgdXAgbWV0aG9k
LiBBbHNvIHBsYW5uaW5nIHRvIGtlZXAgdGhhdCBpbnNpZGUgc2FtZSBmaWxlCj4gPj4gKGFyY2gv
cG93ZXJwYy9tbS9tbWFwLmMpLCB1bmxlc3MgeW91IGhhdmUgYSBkaWZmZXJlbmNlIHByZWZlcmVu
Y2UuCj4gPgo+ID4gTXkgcG9pbnQgd2FzIG5vdCB0byBnZXQgc29tZXRoaW5nIHNwZWNpZmljIGZv
ciBQUEMzMiwgYnV0IHRvIGFtcGxpZnkgb24KPiA+IFJ1c3NlbGwncyBvYmplY3Rpb24uCj4gPgo+
ID4gQXMgdGhpcyBpcyBiYWQgZm9yIEFSTSBhbmQgYmFkIGZvciBQUEMzMiwgZG8gd2UgaGF2ZSBh
bnkgZXZpZGVuY2UgdGhhdAo+ID4geW91ciBjaGFuZ2UgaXMgZ29vZCBmb3IgYW55IG90aGVyIGFy
Y2hpdGVjdHVyZSA/Cj4gPgo+ID4gSSBjaGVja2VkIFBQQzY0IGFuZCB0aGVyZSBpcyBleGFjdGx5
IHRoZSBzYW1lIGRyYXdiYWNrLiBXaXRoIHRoZSBjdXJyZW50Cj4gPiBpbXBsZW1lbnRhdGlvbiBp
dCBpcyBhIHNtYWxsIGZ1bmN0aW9uIHBlcmZvcm1pbmcgdGFibGUgcmVhZCB0aGVuIGEgZmV3Cj4g
PiBhZGp1c3RtZW50LiBBZnRlciB5b3VyIGNoYW5nZSBpdCBpcyBhIGJpZ2dlciBmdW5jdGlvbiBp
bXBsZW1lbnRpbmcgYQo+ID4gdGFibGUgb2YgYnJhbmNoZXMuCj4KPiBJIGFtIHdvbmRlcmluZyBp
ZiB0aGlzIHdvdWxkIG5vdCBiZSB0aGUgY2FzZSBmb3IgYW55IG90aGVyIHN3aXRjaCBjYXNlCj4g
c3RhdGVtZW50IG9uIHRoZSBwbGF0Zm9ybSA/IElzIHRoZXJlIHNvbWV0aGluZyBzcGVjaWZpYy9k
aWZmZXJlbnQganVzdAo+IG9uIHZtX2dldF9wYWdlX3Byb3QoKSBpbXBsZW1lbnRhdGlvbiA/IEFy
ZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IHN3aXRjaAo+IGNhc2Ugc3RhdGVtZW50cyBzaG91bGQganVz
dCBiZSBhdm9pZGVkIGluc3RlYWQgPwo+Cj4gPgo+ID4gU28sIGFzIHJlcXVlc3RlZCBieSBSdXNz
ZWxsLCBjb3VsZCB5b3UgbG9vayBhdCB0aGUgZGlzYXNzZW1ibHkgZm9yIG90aGVyCj4gPiBhcmNo
aXRlY3R1cmVzIGFuZCBzaG93IHVzIHRoYXQgQVJNIGFuZCBQT1dFUlBDIGFyZSB0aGUgb25seSBv
bmVzIGZvcgo+ID4gd2hpY2ggeW91ciBjaGFuZ2UgaXMgbm90IG9wdGltYWwgPwo+Cj4gQnV0IHRo
ZSBwcmltYXJ5IHB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMgbm90IHRvIGd1YXJhbnRlZSBvcHRp
bWl6ZWQKPiBjb2RlIG9uIHBsYXRmb3JtIGJ5IHBsYXRmb3JtIGJhc2lzLCB3aGlsZSBtaWdyYXRp
bmcgZnJvbSBhIHRhYmxlIGJhc2VkCj4gbG9vayB1cCBtZXRob2QgaW50byBhIHN3aXRjaCBjYXNl
IHN0YXRlbWVudC4KPgo+IEJ1dCBpbnN0ZWFkLCB0aGUgcHVycG9zZXMgaXMgdG8gcmVtb3ZlIGN1
cnJlbnQgbGV2ZWxzIG9mIHVubmVjZXNzYXJ5Cj4gYWJzdHJhY3Rpb24gd2hpbGUgY29udmVydGlu
ZyBhIHZtX2ZsYWdzIGFjY2VzcyBjb21iaW5hdGlvbiBpbnRvIHBhZ2UKPiBwcm90ZWN0aW9uLiBU
aGUgc3dpdGNoIGNhc2Ugc3RhdGVtZW50IGZvciBwbGF0Zm9ybSBpbXBsZW1lbnRhdGlvbiBvZgo+
IHZtX2dldF9wYWdlX3Byb3QoKSBqdXN0IHNlZW1lZCBsb2dpY2FsIGVub3VnaC4gQ2hyaXN0b3Bo
J3Mgb3JpZ2luYWwKPiBzdWdnZXN0aW9uIHBhdGNoIGZvciB4ODYgaGFkIHRoZSBzYW1lIGltcGxl
bWVudGF0aW9uIGFzIHdlbGwuCj4KPiBCdXQgaWYgdGhlIHRhYmxlIGxvb2sgdXAgaXMgc3RpbGwg
YmV0dGVyL3ByZWZlcnJlZCBtZXRob2Qgb24gY2VydGFpbgo+IHBsYXRmb3JtcyBsaWtlIGFybSBv
ciBwcGMzMiwgd2lsbCBiZSBoYXBweSB0byBwcmVzZXJ2ZSB0aGF0LgoKSSBkb3VidCB0aGUgc3dp
dGNoKCkgdmFyaWFudCB3b3VsZCBnaXZlIGJldHRlciBjb2RlIG9uIGFueSBwbGF0Zm9ybS4KCldo
YXQgYWJvdXQgdXNpbmcgdGFibGVzIGV2ZXJ5d2hlcmUsIHVzaW5nIGRlc2lnbmF0ZWQgaW5pdGlh
bGl6ZXJzCnRvIGltcHJvdmUgcmVhZGFiaWxpdHk/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=
