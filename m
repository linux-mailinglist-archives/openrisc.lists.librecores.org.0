Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B7A251CD2E4
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2FB3020B59;
	Mon, 11 May 2020 09:41:27 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id 385AC2088E
 for <openrisc@lists.librecores.org>; Tue,  5 May 2020 15:18:20 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id o18so1008595pgg.8
 for <openrisc@lists.librecores.org>; Tue, 05 May 2020 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YTVuB3nFO2ZJkwopWJScapBjoH2ODr8djIHuBvrmxls=;
 b=fruBUflDQ6Jeq31XBd3e7ltzEHuo9b/4IfeOLDlJxtRoAHNVReRI4naQPO8gaw9ItY
 oTH4F4i0UGGmndg13WybQGu5JAx1DohGtTWybng2+Qb3WimoaR/cd+IYWZpA38zDZNjc
 ESbdDRGoJGq3pgJmzssH/d9Mgy0xGnno3T1IJAMO1ojEEcgv0Hz91k0k6ELOCkKvABm4
 +wSO9l57ugUBf4HWTPbqQB6+5p79v7TE0bebHVmPWiVgxKNZGOR7kv24hrtvRpe63vmF
 TKU6PNwIkhG6wWAJFbSWbJxU58njxZQlJajAdmJZm2AUDlXm4XN0/+XHppMvuiTQD825
 ksCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YTVuB3nFO2ZJkwopWJScapBjoH2ODr8djIHuBvrmxls=;
 b=sNNLs0YVIieWinUnK0GAhPHECJrCO2ftASjxZYRdWYL4LvuqBMxqxGac6WEz+R/8ZS
 XxXDKQiNh551EcafEvpSRtKaSPafWoBFfEBlLJoGmArF+5C/+OEYwDaxEsjnlxv3wMQl
 2kepUbU/FLvaabz2p+ooUm+ay2PU+3Bs35W2N02GmESloMZSfhZrTMozY2GlYdkRrTBI
 yJmeP0W5+o2UPpx5xTCzO5O6ct9R6B72WZpT1gmtVGlXCXwisbK7S9XvFJ/gSMtQioGJ
 GyysuC9CXWW6r0a0SOGLuIeaaH9+RbXfPU8gmSEFWVjkSko7dgRfLdxKy43Laj54wPo2
 WsiA==
X-Gm-Message-State: AGi0PubcJXSS5F2MRU+lLABiU5m6Rk5xE8fa8OlEH3P6HxxvtH0qJzK3
 is/gLgG3F3/FXHTtaW9ESrg=
X-Google-Smtp-Source: APiQypKlF0tkB910YoBZeknyoe9MlscvGyvM0R4uMbc7bEc9kOFPUpDJJ2pcEUb510HcPsDkqbHR4Q==
X-Received: by 2002:a65:4107:: with SMTP id w7mr2715562pgp.438.1588684697051; 
 Tue, 05 May 2020 06:18:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g40sm2101882pje.38.2020.05.05.06.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 06:18:15 -0700 (PDT)
To: Mike Rapoport <rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net> <20200503184300.GA154219@roeck-us.net>
 <20200504153901.GM14260@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
Date: Tue, 5 May 2020 06:18:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504153901.GM14260@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: Re: [OpenRISC] [PATCH v2 17/20] mm: free_area_init: allow defining
 max_zone_pfn in descending order
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Nick Hu <nickhu@andestech.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 Brian Cain <bcain@codeaurora.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNS80LzIwIDg6MzkgQU0sIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gU3VuLCBNYXkgMDMs
IDIwMjAgYXQgMTE6NDM6MDBBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gU3Vu
LCBNYXkgMDMsIDIwMjAgYXQgMTA6NDE6MzhBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToK
Pj4+IEhpLAo+Pj4KPj4+IE9uIFdlZCwgQXByIDI5LCAyMDIwIGF0IDAzOjExOjIzUE0gKzAzMDAs
IE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+Pj4gRnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPgo+Pj4+Cj4+Pj4gU29tZSBhcmNoaXRlY3R1cmVzIChlLmcuIEFSQykgaGF2ZSB0
aGUgWk9ORV9ISUdITUVNIHpvbmUgYmVsb3cgdGhlCj4+Pj4gWk9ORV9OT1JNQUwuIEFsbG93aW5n
IGZyZWVfYXJlYV9pbml0KCkgcGFyc2UgbWF4X3pvbmVfcGZuIGFycmF5IGV2ZW4gaXQgaXMKPj4+
PiBzb3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBhbGxvd3MgdXNpbmcgZnJlZV9hcmVhX2luaXQo
KSBvbiBzdWNoCj4+Pj4gYXJjaGl0ZWN0dXJlcy4KPj4+Pgo+Pj4+IEFkZCB0b3AgLT4gZG93biB0
cmF2ZXJzYWwgb2YgbWF4X3pvbmVfcGZuIGFycmF5IGluIGZyZWVfYXJlYV9pbml0KCkgYW5kIHVz
ZQo+Pj4+IHRoZSBsYXR0ZXIgaW4gQVJDIG5vZGUvem9uZSBpbml0aWFsaXphdGlvbi4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPj4+
Cj4+PiBUaGlzIHBhdGNoIGNhdXNlcyBteSBtaWNyb2JsYXplZWwgcWVtdSBib290IHRlc3QgaW4g
bGludXgtbmV4dCB0byBmYWlsLgo+Pj4gUmV2ZXJ0aW5nIGl0IGZpeGVzIHRoZSBwcm9ibGVtLgo+
Pj4KPj4gVGhlIHNhbWUgcHJvYmxlbSBpcyBzZWVuIHdpdGggczM5MCBlbXVsYXRpb25zLgo+IAo+
IFllYWgsIHRoaXMgcGF0Y2ggYnJlYWtzIHNvbWUgb3RoZXJzIGFzIHdlbGwgOigKPiAKPiBNeSBh
c3N1bXB0aW9uIHRoYXQgbWF4X3pvbmVfcGZuIGRlZmluZXMgYXJjaGl0ZWN0dXJhbCBsaW1pdCBm
b3IgbWF4aW1hbAo+IFBGTiB0aGF0IGNhbiBiZWxvbmcgdG8gYSB6b25lIHdhcyBvdmVyLW9wdGlt
aXN0aWMuIFNldmVyYWwgYXJjaGVzCj4gYWN0dWFsbHkgZG8gdGhhdCwgYnV0IG90aGVycyBkbwo+
IAo+IAltYXhfem9uZV9wZm5bWk9ORV9ETUFdID0gTUFYX0RNQV9QRk47Cj4gCW1heF96b25lX3Bm
bltaT05FX05PUk1BTF0gPSBtYXhfcGZuOwo+IAo+IHdoZXJlIE1BWF9ETUFfUEZOIGlzIGJ1aWxk
LXRpbWUgY29uc3RyYWluIGFuZCBtYXhfcGZuIGlzIHJ1biB0aW1lIGxpbWl0Cj4gZm9yIHRoZSBj
dXJyZW50IHN5c3RlbS4KPiAKPiBTbywgd2hlbiBtYXhfcGZuIGlzIGxvd2VyIHRoYW4gTUFYX0RN
QV9QRk4sIHRoZSBmcmVlX2luaXRfYXJlYSgpIHdpbGwKPiBjb25zaWRlciBtYXhfem9uZV9wZm4g
YXMgZGVzY2VuZGluZyBhbmQgd2lsbCB3cm9uZ2x5IGNhbGN1bGF0ZSB6b25lCj4gZXh0ZW50cy4K
PiAKPiBUaGF0IHNhaWQsIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGNyZWF0ZSBhIGdlbmVyaWMgd2F5
IHRvIHNwZWNpYWwgY2FzZQo+IEFSQywgSSBzdWdnZXN0IHRvIHNpbXBseSB1c2UgdGhlIGJlbG93
IHBhdGNoIGluc3RlYWQuCj4gCgpBcyBhIHJlbWluZGVyLCBJIHJlcG9ydGVkIHRoZSBwcm9ibGVt
IGFnYWluc3QgczM5MCBhbmQgbWljcm9ibGF6ZWVsCihpbnRlcmVzdGluZ2x5IGVub3VnaCwgbWlj
cm9ibGF6ZSAoYmlnIGVuZGlhbikgd29ya3MpLCBub3QgYWdhaW5zdCBhcmMuCgpHdWVudGVyCgo+
IGRpZmYgLS1naXQgYS9hcmNoL2FyYy9tbS9pbml0LmMgYi9hcmNoL2FyYy9tbS9pbml0LmMKPiBp
bmRleCA0MWViOWJlMTY1M2MuLjM4Njk1OWJhYzNkMiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FyYy9t
bS9pbml0LmMKPiArKysgYi9hcmNoL2FyYy9tbS9pbml0LmMKPiBAQCAtNzcsNiArNzcsMTEgQEAg
dm9pZCBfX2luaXQgZWFybHlfaW5pdF9kdF9hZGRfbWVtb3J5X2FyY2godTY0IGJhc2UsIHU2NCBz
aXplKQo+ICAJCWJhc2UsIFRPX01CKHNpemUpLCAhaW5fdXNlID8gIk5vdCB1c2VkIjoiIik7Cj4g
IH0KPiAgCj4gK2Jvb2wgYXJjaF9oYXNfZGVzY2VuZGluZ19tYXhfem9uZV9wZm5zKHZvaWQpCj4g
K3sKPiArCXJldHVybiB0cnVlOwo+ICt9Cj4gKwo+ICAvKgo+ICAgKiBGaXJzdCBtZW1vcnkgc2V0
dXAgcm91dGluZSBjYWxsZWQgZnJvbSBzZXR1cF9hcmNoKCkKPiAgICogMS4gc2V0dXAgc3dhcHBl
cidzIG1tIEBpbml0X21tCj4gZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2Vf
YWxsb2MuYwo+IGluZGV4IGI5OTBlOTczNDQ3NC4uMTE0ZjBlMDI3MTQ0IDEwMDY0NAo+IC0tLSBh
L21tL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL21tL3BhZ2VfYWxsb2MuYwo+IEBAIC03MzA3LDYgKzcz
MDcsMTUgQEAgc3RhdGljIHZvaWQgY2hlY2tfZm9yX21lbW9yeShwZ19kYXRhX3QgKnBnZGF0LCBp
bnQgbmlkKQo+ICAJfQo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBTb21lIGFyY2hpdGVjdHVycywgZS5n
LiBBUkMgbWF5IGhhdmUgWk9ORV9ISUdITUVNIGJlbG93IFpPTkVfTk9STUFMLiBGb3IKPiArICog
c3VjaCBjYXNlcyB3ZSBhbGxvdyBtYXhfem9uZV9wZm4gc29ydGVkIGluIHRoZSBkZXNjZW5kaW5n
IG9yZGVyCj4gKyAqLwo+ICtib29sIF9fd2VhayBhcmNoX2hhc19kZXNjZW5kaW5nX21heF96b25l
X3BmbnModm9pZCkKPiArewo+ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICAvKioKPiAgICog
ZnJlZV9hcmVhX2luaXQgLSBJbml0aWFsaXNlIGFsbCBwZ19kYXRhX3QgYW5kIHpvbmUgZGF0YQo+
ICAgKiBAbWF4X3pvbmVfcGZuOiBhbiBhcnJheSBvZiBtYXggUEZOcyBmb3IgZWFjaCB6b25lCj4g
QEAgLTczMjQsNyArNzMzMyw3IEBAIHZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0KHVuc2lnbmVk
IGxvbmcgKm1heF96b25lX3BmbikKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBzdGFydF9wZm4sIGVu
ZF9wZm47Cj4gIAlpbnQgaSwgbmlkLCB6b25lOwo+IC0JYm9vbCBkZXNjZW5kaW5nID0gZmFsc2U7
Cj4gKwlib29sIGRlc2NlbmRpbmc7Cj4gIAo+ICAJLyogUmVjb3JkIHdoZXJlIHRoZSB6b25lIGJv
dW5kYXJpZXMgYXJlICovCj4gIAltZW1zZXQoYXJjaF96b25lX2xvd2VzdF9wb3NzaWJsZV9wZm4s
IDAsCj4gQEAgLTczMzMsMTQgKzczNDIsNyBAQCB2b2lkIF9faW5pdCBmcmVlX2FyZWFfaW5pdCh1
bnNpZ25lZCBsb25nICptYXhfem9uZV9wZm4pCj4gIAkJCQlzaXplb2YoYXJjaF96b25lX2hpZ2hl
c3RfcG9zc2libGVfcGZuKSk7Cj4gIAo+ICAJc3RhcnRfcGZuID0gZmluZF9taW5fcGZuX3dpdGhf
YWN0aXZlX3JlZ2lvbnMoKTsKPiAtCj4gLQkvKgo+IC0JICogU29tZSBhcmNoaXRlY3R1cnMsIGUu
Zy4gQVJDIG1heSBoYXZlIFpPTkVfSElHSE1FTSBiZWxvdwo+IC0JICogWk9ORV9OT1JNQUwuIEZv
ciBzdWNoIGNhc2VzIHdlIGFsbG93IG1heF96b25lX3BmbiBzb3J0ZWQgaW4gdGhlCj4gLQkgKiBk
ZXNjZW5kaW5nIG9yZGVyCj4gLQkgKi8KPiAtCWlmIChNQVhfTlJfWk9ORVMgPiAxICYmIG1heF96
b25lX3BmblswXSA+IG1heF96b25lX3BmblsxXSkKPiAtCQlkZXNjZW5kaW5nID0gdHJ1ZTsKPiAr
CWRlc2NlbmRpbmcgPSBhcmNoX2hhc19kZXNjZW5kaW5nX21heF96b25lX3BmbnMoKTsKPiAgCj4g
IAlmb3IgKGkgPSAwOyBpIDwgTUFYX05SX1pPTkVTOyBpKyspIHsKPiAgCQlpZiAoZGVzY2VuZGlu
ZykKPiAKPj4gR3VlbnRlcgo+Pgo+Pj4gcWVtdSBjb21tYW5kIGxpbmU6Cj4+Pgo+Pj4gcWVtdS1z
eXN0ZW0tbWljcm9ibGF6ZWVsIC1NIHBldGFsb2dpeC1tbDYwNSAtbSAyNTYgXAo+Pj4gCS1rZXJu
ZWwgYXJjaC9taWNyb2JsYXplL2Jvb3QvbGludXguYmluIC1uby1yZWJvb3QgXAo+Pj4gCS1pbml0
cmQgcm9vdGZzLmNwaW8gXAo+Pj4gCS1hcHBlbmQgJ3BhbmljPS0xIHNsdWJfZGVidWc9RlpQVUEg
cmRpbml0PS9zYmluL2luaXQgY29uc29sZT10dHlTMCwxMTUyMDAnIFwKPj4+IAktbW9uaXRvciBu
b25lIC1zZXJpYWwgc3RkaW8gLW5vZ3JhcGhpYwo+Pj4KPj4+IGluaXRyZDoKPj4+IAlodHRwczov
L2dpdGh1Yi5jb20vZ3JvZWNrL2xpbnV4LWJ1aWxkLXRlc3QvYmxvYi9tYXN0ZXIvcm9vdGZzL21p
Y3JvYmxhemVlbC9yb290ZnMuY3Bpby5nego+Pj4gY29uZmlndXJhdGlvbjoKPj4+IAlodHRwczov
L2dpdGh1Yi5jb20vZ3JvZWNrL2xpbnV4LWJ1aWxkLXRlc3QvYmxvYi9tYXN0ZXIvcm9vdGZzL21p
Y3JvYmxhemVlbC9xZW11X21pY3JvYmxhemVlbF9tbDYwNV9kZWZjb25maWcKPj4+Cj4+PiBCaXNl
Y3QgbG9nIGlzIGJlbG93Lgo+Pj4KPj4+IEd1ZW50ZXIKPj4+Cj4+PiAtLS0KPj4+ICMgYmFkOiBb
ZmI5ZDY3MGY1N2UzZjY0Nzg2MDIzMjhiYmJmNzExMzhiZTA2Y2E0Zl0gQWRkIGxpbnV4LW5leHQg
c3BlY2lmaWMgZmlsZXMgZm9yIDIwMjAwNTAxCj4+PiAjIGdvb2Q6IFs2YThiNTVlZDQwNTZlYTU1
NTllYmU0ZjZhNGIyNDdmNjI3ODcwZDRjXSBMaW51eCA1LjctcmMzCj4+PiBnaXQgYmlzZWN0IHN0
YXJ0ICdIRUFEJyAndjUuNy1yYzMnCj4+PiAjIGdvb2Q6IFswNjhiODBiNjhhNjcwZjBiMTcyODhj
OGEzZDFlZTc1MWYzNTE2MmFiXSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdkcm0vZHJt
LW5leHQnCj4+PiBnaXQgYmlzZWN0IGdvb2QgMDY4YjgwYjY4YTY3MGYwYjE3Mjg4YzhhM2QxZWU3
NTFmMzUxNjJhYgo+Pj4gIyBnb29kOiBbNDZjNzBmYzZhM2FjMzVjZDcyZGRhZDI0OGRjYmU0ZWVl
NzE2ZDJhNV0gTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnZHJpdmVycy14ODYvZm9yLW5l
eHQnCj4+PiBnaXQgYmlzZWN0IGdvb2QgNDZjNzBmYzZhM2FjMzVjZDcyZGRhZDI0OGRjYmU0ZWVl
NzE2ZDJhNQo+Pj4gIyBnb29kOiBbZjM5YzRhZDQ3OWEyZjAwNWY5NzJhMmI5NDFiNDBlZmE2Yjlj
OTM0OV0gTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAncnBtc2cvZm9yLW5leHQnCj4+PiBn
aXQgYmlzZWN0IGdvb2QgZjM5YzRhZDQ3OWEyZjAwNWY5NzJhMmI5NDFiNDBlZmE2YjljOTM0OQo+
Pj4gIyBiYWQ6IFsxNjVkM2VlMDE2MmZlMjhlZmMyYzgxODAxNzY2MzNlMzM1MTVkZjE1XSBpcGMt
Y29udmVydC1pcGNzX2lkci10by14YXJyYXktdXBkYXRlCj4+PiBnaXQgYmlzZWN0IGJhZCAxNjVk
M2VlMDE2MmZlMjhlZmMyYzgxODAxNzY2MzNlMzM1MTVkZjE1Cj4+PiAjIGdvb2Q6IFswMDFmMWQy
MTFlZDJlZDBmMDA1ODM4ZGM0MzkwOTkzOTMwYmJiZDY5XSBtbTogcmVtb3ZlIGVhcmx5X3Bmbl9p
bl9uaWQoKSBhbmQgQ09ORklHX05PREVTX1NQQU5fT1RIRVJfTk9ERVMKPj4+IGdpdCBiaXNlY3Qg
Z29vZCAwMDFmMWQyMTFlZDJlZDBmMDA1ODM4ZGM0MzkwOTkzOTMwYmJiZDY5Cj4+PiAjIGJhZDog
W2FhYWQ3NDAxYmQzMmYxMGMxZDU5MWRkODg2YjNhOWI5NTk1YzZkNzddIG1tL3Ztc2FuOiBmaXgg
c29tZSB0eXBvcyBpbiBjb21tZW50Cj4+PiBnaXQgYmlzZWN0IGJhZCBhYWFkNzQwMWJkMzJmMTBj
MWQ1OTFkZDg4NmIzYTliOTU5NWM2ZDc3Cj4+PiAjIGJhZDogWzA5ZjlkMGFiMWZiZWQ4NTYyM2Iy
ODM5OTVhYTdhN2Q3OGRhYTE2MTFdIGtodWdlcGFnZWQ6IGFsbG93IHRvIGNvbGxhcHNlIFBURS1t
YXBwZWQgY29tcG91bmQgcGFnZXMKPj4+IGdpdCBiaXNlY3QgYmFkIDA5ZjlkMGFiMWZiZWQ4NTYy
M2IyODM5OTVhYTdhN2Q3OGRhYTE2MTEKPj4+ICMgYmFkOiBbYzk0MmZjOGEzZTUwODg0MDdiYzMy
ZDk0ZjU1NGJhYjIwNTE3NWY4YV0gbW0vdm1zdGF0LmM6IGRvIG5vdCBzaG93IGxvd21lbSByZXNl
cnZlIHByb3RlY3Rpb24gaW5mb3JtYXRpb24gb2YgZW1wdHkgem9uZQo+Pj4gZ2l0IGJpc2VjdCBi
YWQgYzk0MmZjOGEzZTUwODg0MDdiYzMyZDk0ZjU1NGJhYjIwNTE3NWY4YQo+Pj4gIyBiYWQ6IFti
MjkzNThkMjY5YWNlMzgyNmQ4NTIxYmVhODQyZmMyOTg0Y2ZjMTFiXSBtbS9wYWdlX2FsbG9jLmM6
IHJlbmFtZSBmcmVlX3BhZ2VzX2NoZWNrKCkgdG8gY2hlY2tfZnJlZV9wYWdlKCkKPj4+IGdpdCBi
aXNlY3QgYmFkIGIyOTM1OGQyNjlhY2UzODI2ZDg1MjFiZWE4NDJmYzI5ODRjZmMxMWIKPj4+ICMg
YmFkOiBbYmUwZmI1OTFhMWYxZGYyMGEwMGM4ZjAyM2Y5Y2E0ODkxZjE3N2IwZF0gbW06IHNpbXBs
aWZ5IGZpbmRfbWluX3Bmbl93aXRoX2FjdGl2ZV9yZWdpb25zKCkKPj4+IGdpdCBiaXNlY3QgYmFk
IGJlMGZiNTkxYTFmMWRmMjBhMDBjOGYwMjNmOWNhNDg5MWYxNzdiMGQKPj4+ICMgYmFkOiBbYzE3
NDIyYTAwOGQzNmRjZjNlOWY1MTQ2OTc1OGM1NzYyNzE2Y2IwYV0gbW06IHJlbmFtZSBmcmVlX2Fy
ZWFfaW5pdF9ub2RlKCkgdG8gZnJlZV9hcmVhX2luaXRfbWVtb3J5bGVzc19ub2RlKCkKPj4+IGdp
dCBiaXNlY3QgYmFkIGMxNzQyMmEwMDhkMzZkY2YzZTlmNTE0Njk3NThjNTc2MjcxNmNiMGEKPj4+
ICMgYmFkOiBbNTFhMmY2NDRmZDAyMGQ1ZjA5MDA0NDgyNWMzODg0NDRkMTEwMjlkNV0gbW06IGZy
ZWVfYXJlYV9pbml0OiBhbGxvdyBkZWZpbmluZyBtYXhfem9uZV9wZm4gaW4gZGVzY2VuZGluZyBv
cmRlcgo+Pj4gZ2l0IGJpc2VjdCBiYWQgNTFhMmY2NDRmZDAyMGQ1ZjA5MDA0NDgyNWMzODg0NDRk
MTEwMjlkNQo+Pj4gIyBmaXJzdCBiYWQgY29tbWl0OiBbNTFhMmY2NDRmZDAyMGQ1ZjA5MDA0NDgy
NWMzODg0NDRkMTEwMjlkNV0gbW06IGZyZWVfYXJlYV9pbml0OiBhbGxvdyBkZWZpbmluZyBtYXhf
em9uZV9wZm4gaW4gZGVzY2VuZGluZyBvcmRlcgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
