Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E47D11CD2E3
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E824F2041B;
	Mon, 11 May 2020 09:41:26 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 56F2F20917
 for <openrisc@lists.librecores.org>; Mon,  4 May 2020 17:39:24 +0200 (CEST)
Received: from kernel.org (unknown [87.71.57.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB3FF206D7;
 Mon,  4 May 2020 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588606761;
 bh=K3AQD4/kSurqTKgiy9tnhsUhrYGtu7oPwWRQzafMBDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4eFD/8M6rkpVhWGJCM/XtjuL/CEeeN7FuJSwVNx6NS+9s41kdKOpAfrpyLGuvIjw
 Dsuxy71lGNPG6A1BQVCQEZ5Cg17/+/r+5sTXhGv9TOpm3Ji63adplTBcIG0ncWkgZc
 n7BzNcKe3WYWVs/gQPxwA3v+UREC5VfAHR93vTCo=
Date: Mon, 4 May 2020 18:39:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20200504153901.GM14260@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net>
 <20200503184300.GA154219@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200503184300.GA154219@roeck-us.net>
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

T24gU3VuLCBNYXkgMDMsIDIwMjAgYXQgMTE6NDM6MDBBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiBPbiBTdW4sIE1heSAwMywgMjAyMCBhdCAxMDo0MTozOEFNIC0wNzAwLCBHdWVudGVy
IFJvZWNrIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIFdlZCwgQXByIDI5LCAyMDIwIGF0IDAz
OjExOjIzUE0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiA+IEZyb206IE1pa2UgUmFw
b3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+ID4gCj4gPiA+IFNvbWUgYXJjaGl0ZWN0dXJl
cyAoZS5nLiBBUkMpIGhhdmUgdGhlIFpPTkVfSElHSE1FTSB6b25lIGJlbG93IHRoZQo+ID4gPiBa
T05FX05PUk1BTC4gQWxsb3dpbmcgZnJlZV9hcmVhX2luaXQoKSBwYXJzZSBtYXhfem9uZV9wZm4g
YXJyYXkgZXZlbiBpdCBpcwo+ID4gPiBzb3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBhbGxvd3Mg
dXNpbmcgZnJlZV9hcmVhX2luaXQoKSBvbiBzdWNoCj4gPiA+IGFyY2hpdGVjdHVyZXMuCj4gPiA+
IAo+ID4gPiBBZGQgdG9wIC0+IGRvd24gdHJhdmVyc2FsIG9mIG1heF96b25lX3BmbiBhcnJheSBp
biBmcmVlX2FyZWFfaW5pdCgpIGFuZCB1c2UKPiA+ID4gdGhlIGxhdHRlciBpbiBBUkMgbm9kZS96
b25lIGluaXRpYWxpemF0aW9uLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBUaGlzIHBhdGNoIGNhdXNlcyBteSBt
aWNyb2JsYXplZWwgcWVtdSBib290IHRlc3QgaW4gbGludXgtbmV4dCB0byBmYWlsLgo+ID4gUmV2
ZXJ0aW5nIGl0IGZpeGVzIHRoZSBwcm9ibGVtLgo+ID4gCj4gVGhlIHNhbWUgcHJvYmxlbSBpcyBz
ZWVuIHdpdGggczM5MCBlbXVsYXRpb25zLgoKWWVhaCwgdGhpcyBwYXRjaCBicmVha3Mgc29tZSBv
dGhlcnMgYXMgd2VsbCA6KAoKTXkgYXNzdW1wdGlvbiB0aGF0IG1heF96b25lX3BmbiBkZWZpbmVz
IGFyY2hpdGVjdHVyYWwgbGltaXQgZm9yIG1heGltYWwKUEZOIHRoYXQgY2FuIGJlbG9uZyB0byBh
IHpvbmUgd2FzIG92ZXItb3B0aW1pc3RpYy4gU2V2ZXJhbCBhcmNoZXMKYWN0dWFsbHkgZG8gdGhh
dCwgYnV0IG90aGVycyBkbwoKCW1heF96b25lX3BmbltaT05FX0RNQV0gPSBNQVhfRE1BX1BGTjsK
CW1heF96b25lX3BmbltaT05FX05PUk1BTF0gPSBtYXhfcGZuOwoKd2hlcmUgTUFYX0RNQV9QRk4g
aXMgYnVpbGQtdGltZSBjb25zdHJhaW4gYW5kIG1heF9wZm4gaXMgcnVuIHRpbWUgbGltaXQKZm9y
IHRoZSBjdXJyZW50IHN5c3RlbS4KClNvLCB3aGVuIG1heF9wZm4gaXMgbG93ZXIgdGhhbiBNQVhf
RE1BX1BGTiwgdGhlIGZyZWVfaW5pdF9hcmVhKCkgd2lsbApjb25zaWRlciBtYXhfem9uZV9wZm4g
YXMgZGVzY2VuZGluZyBhbmQgd2lsbCB3cm9uZ2x5IGNhbGN1bGF0ZSB6b25lCmV4dGVudHMuCgpU
aGF0IHNhaWQsIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGNyZWF0ZSBhIGdlbmVyaWMgd2F5IHRvIHNw
ZWNpYWwgY2FzZQpBUkMsIEkgc3VnZ2VzdCB0byBzaW1wbHkgdXNlIHRoZSBiZWxvdyBwYXRjaCBp
bnN0ZWFkLgoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL21tL2luaXQuYyBiL2FyY2gvYXJjL21tL2lu
aXQuYwppbmRleCA0MWViOWJlMTY1M2MuLjM4Njk1OWJhYzNkMiAxMDA2NDQKLS0tIGEvYXJjaC9h
cmMvbW0vaW5pdC5jCisrKyBiL2FyY2gvYXJjL21tL2luaXQuYwpAQCAtNzcsNiArNzcsMTEgQEAg
dm9pZCBfX2luaXQgZWFybHlfaW5pdF9kdF9hZGRfbWVtb3J5X2FyY2godTY0IGJhc2UsIHU2NCBz
aXplKQogCQliYXNlLCBUT19NQihzaXplKSwgIWluX3VzZSA/ICJOb3QgdXNlZCI6IiIpOwogfQog
Citib29sIGFyY2hfaGFzX2Rlc2NlbmRpbmdfbWF4X3pvbmVfcGZucyh2b2lkKQoreworCXJldHVy
biB0cnVlOworfQorCiAvKgogICogRmlyc3QgbWVtb3J5IHNldHVwIHJvdXRpbmUgY2FsbGVkIGZy
b20gc2V0dXBfYXJjaCgpCiAgKiAxLiBzZXR1cCBzd2FwcGVyJ3MgbW0gQGluaXRfbW0KZGlmZiAt
LWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCBiOTkwZTk3MzQ0
NzQuLjExNGYwZTAyNzE0NCAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5jCisrKyBiL21tL3Bh
Z2VfYWxsb2MuYwpAQCAtNzMwNyw2ICs3MzA3LDE1IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2Zvcl9t
ZW1vcnkocGdfZGF0YV90ICpwZ2RhdCwgaW50IG5pZCkKIAl9CiB9CiAKKy8qCisgKiBTb21lIGFy
Y2hpdGVjdHVycywgZS5nLiBBUkMgbWF5IGhhdmUgWk9ORV9ISUdITUVNIGJlbG93IFpPTkVfTk9S
TUFMLiBGb3IKKyAqIHN1Y2ggY2FzZXMgd2UgYWxsb3cgbWF4X3pvbmVfcGZuIHNvcnRlZCBpbiB0
aGUgZGVzY2VuZGluZyBvcmRlcgorICovCitib29sIF9fd2VhayBhcmNoX2hhc19kZXNjZW5kaW5n
X21heF96b25lX3BmbnModm9pZCkKK3sKKwlyZXR1cm4gZmFsc2U7Cit9CisKIC8qKgogICogZnJl
ZV9hcmVhX2luaXQgLSBJbml0aWFsaXNlIGFsbCBwZ19kYXRhX3QgYW5kIHpvbmUgZGF0YQogICog
QG1heF96b25lX3BmbjogYW4gYXJyYXkgb2YgbWF4IFBGTnMgZm9yIGVhY2ggem9uZQpAQCAtNzMy
NCw3ICs3MzMzLDcgQEAgdm9pZCBfX2luaXQgZnJlZV9hcmVhX2luaXQodW5zaWduZWQgbG9uZyAq
bWF4X3pvbmVfcGZuKQogewogCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRfcGZuOwogCWlu
dCBpLCBuaWQsIHpvbmU7Ci0JYm9vbCBkZXNjZW5kaW5nID0gZmFsc2U7CisJYm9vbCBkZXNjZW5k
aW5nOwogCiAJLyogUmVjb3JkIHdoZXJlIHRoZSB6b25lIGJvdW5kYXJpZXMgYXJlICovCiAJbWVt
c2V0KGFyY2hfem9uZV9sb3dlc3RfcG9zc2libGVfcGZuLCAwLApAQCAtNzMzMywxNCArNzM0Miw3
IEBAIHZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3Bm
bikKIAkJCQlzaXplb2YoYXJjaF96b25lX2hpZ2hlc3RfcG9zc2libGVfcGZuKSk7CiAKIAlzdGFy
dF9wZm4gPSBmaW5kX21pbl9wZm5fd2l0aF9hY3RpdmVfcmVnaW9ucygpOwotCi0JLyoKLQkgKiBT
b21lIGFyY2hpdGVjdHVycywgZS5nLiBBUkMgbWF5IGhhdmUgWk9ORV9ISUdITUVNIGJlbG93Ci0J
ICogWk9ORV9OT1JNQUwuIEZvciBzdWNoIGNhc2VzIHdlIGFsbG93IG1heF96b25lX3BmbiBzb3J0
ZWQgaW4gdGhlCi0JICogZGVzY2VuZGluZyBvcmRlcgotCSAqLwotCWlmIChNQVhfTlJfWk9ORVMg
PiAxICYmIG1heF96b25lX3BmblswXSA+IG1heF96b25lX3BmblsxXSkKLQkJZGVzY2VuZGluZyA9
IHRydWU7CisJZGVzY2VuZGluZyA9IGFyY2hfaGFzX2Rlc2NlbmRpbmdfbWF4X3pvbmVfcGZucygp
OwogCiAJZm9yIChpID0gMDsgaSA8IE1BWF9OUl9aT05FUzsgaSsrKSB7CiAJCWlmIChkZXNjZW5k
aW5nKQoKPiBHdWVudGVyCj4gCj4gPiBxZW11IGNvbW1hbmQgbGluZToKPiA+IAo+ID4gcWVtdS1z
eXN0ZW0tbWljcm9ibGF6ZWVsIC1NIHBldGFsb2dpeC1tbDYwNSAtbSAyNTYgXAo+ID4gCS1rZXJu
ZWwgYXJjaC9taWNyb2JsYXplL2Jvb3QvbGludXguYmluIC1uby1yZWJvb3QgXAo+ID4gCS1pbml0
cmQgcm9vdGZzLmNwaW8gXAo+ID4gCS1hcHBlbmQgJ3BhbmljPS0xIHNsdWJfZGVidWc9RlpQVUEg
cmRpbml0PS9zYmluL2luaXQgY29uc29sZT10dHlTMCwxMTUyMDAnIFwKPiA+IAktbW9uaXRvciBu
b25lIC1zZXJpYWwgc3RkaW8gLW5vZ3JhcGhpYwo+ID4gCj4gPiBpbml0cmQ6Cj4gPiAJaHR0cHM6
Ly9naXRodWIuY29tL2dyb2Vjay9saW51eC1idWlsZC10ZXN0L2Jsb2IvbWFzdGVyL3Jvb3Rmcy9t
aWNyb2JsYXplZWwvcm9vdGZzLmNwaW8uZ3oKPiA+IGNvbmZpZ3VyYXRpb246Cj4gPiAJaHR0cHM6
Ly9naXRodWIuY29tL2dyb2Vjay9saW51eC1idWlsZC10ZXN0L2Jsb2IvbWFzdGVyL3Jvb3Rmcy9t
aWNyb2JsYXplZWwvcWVtdV9taWNyb2JsYXplZWxfbWw2MDVfZGVmY29uZmlnCj4gPiAKPiA+IEJp
c2VjdCBsb2cgaXMgYmVsb3cuCj4gPiAKPiA+IEd1ZW50ZXIKPiA+IAo+ID4gLS0tCj4gPiAjIGJh
ZDogW2ZiOWQ2NzBmNTdlM2Y2NDc4NjAyMzI4YmJiZjcxMTM4YmUwNmNhNGZdIEFkZCBsaW51eC1u
ZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDIwMDUwMQo+ID4gIyBnb29kOiBbNmE4YjU1ZWQ0MDU2
ZWE1NTU5ZWJlNGY2YTRiMjQ3ZjYyNzg3MGQ0Y10gTGludXggNS43LXJjMwo+ID4gZ2l0IGJpc2Vj
dCBzdGFydCAnSEVBRCcgJ3Y1LjctcmMzJwo+ID4gIyBnb29kOiBbMDY4YjgwYjY4YTY3MGYwYjE3
Mjg4YzhhM2QxZWU3NTFmMzUxNjJhYl0gTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnZHJt
L2RybS1uZXh0Jwo+ID4gZ2l0IGJpc2VjdCBnb29kIDA2OGI4MGI2OGE2NzBmMGIxNzI4OGM4YTNk
MWVlNzUxZjM1MTYyYWIKPiA+ICMgZ29vZDogWzQ2YzcwZmM2YTNhYzM1Y2Q3MmRkYWQyNDhkY2Jl
NGVlZTcxNmQyYTVdIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ2RyaXZlcnMteDg2L2Zv
ci1uZXh0Jwo+ID4gZ2l0IGJpc2VjdCBnb29kIDQ2YzcwZmM2YTNhYzM1Y2Q3MmRkYWQyNDhkY2Jl
NGVlZTcxNmQyYTUKPiA+ICMgZ29vZDogW2YzOWM0YWQ0NzlhMmYwMDVmOTcyYTJiOTQxYjQwZWZh
NmI5YzkzNDldIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3JwbXNnL2Zvci1uZXh0Jwo+
ID4gZ2l0IGJpc2VjdCBnb29kIGYzOWM0YWQ0NzlhMmYwMDVmOTcyYTJiOTQxYjQwZWZhNmI5Yzkz
NDkKPiA+ICMgYmFkOiBbMTY1ZDNlZTAxNjJmZTI4ZWZjMmM4MTgwMTc2NjMzZTMzNTE1ZGYxNV0g
aXBjLWNvbnZlcnQtaXBjc19pZHItdG8teGFycmF5LXVwZGF0ZQo+ID4gZ2l0IGJpc2VjdCBiYWQg
MTY1ZDNlZTAxNjJmZTI4ZWZjMmM4MTgwMTc2NjMzZTMzNTE1ZGYxNQo+ID4gIyBnb29kOiBbMDAx
ZjFkMjExZWQyZWQwZjAwNTgzOGRjNDM5MDk5MzkzMGJiYmQ2OV0gbW06IHJlbW92ZSBlYXJseV9w
Zm5faW5fbmlkKCkgYW5kIENPTkZJR19OT0RFU19TUEFOX09USEVSX05PREVTCj4gPiBnaXQgYmlz
ZWN0IGdvb2QgMDAxZjFkMjExZWQyZWQwZjAwNTgzOGRjNDM5MDk5MzkzMGJiYmQ2OQo+ID4gIyBi
YWQ6IFthYWFkNzQwMWJkMzJmMTBjMWQ1OTFkZDg4NmIzYTliOTU5NWM2ZDc3XSBtbS92bXNhbjog
Zml4IHNvbWUgdHlwb3MgaW4gY29tbWVudAo+ID4gZ2l0IGJpc2VjdCBiYWQgYWFhZDc0MDFiZDMy
ZjEwYzFkNTkxZGQ4ODZiM2E5Yjk1OTVjNmQ3Nwo+ID4gIyBiYWQ6IFswOWY5ZDBhYjFmYmVkODU2
MjNiMjgzOTk1YWE3YTdkNzhkYWExNjExXSBraHVnZXBhZ2VkOiBhbGxvdyB0byBjb2xsYXBzZSBQ
VEUtbWFwcGVkIGNvbXBvdW5kIHBhZ2VzCj4gPiBnaXQgYmlzZWN0IGJhZCAwOWY5ZDBhYjFmYmVk
ODU2MjNiMjgzOTk1YWE3YTdkNzhkYWExNjExCj4gPiAjIGJhZDogW2M5NDJmYzhhM2U1MDg4NDA3
YmMzMmQ5NGY1NTRiYWIyMDUxNzVmOGFdIG1tL3Ztc3RhdC5jOiBkbyBub3Qgc2hvdyBsb3dtZW0g
cmVzZXJ2ZSBwcm90ZWN0aW9uIGluZm9ybWF0aW9uIG9mIGVtcHR5IHpvbmUKPiA+IGdpdCBiaXNl
Y3QgYmFkIGM5NDJmYzhhM2U1MDg4NDA3YmMzMmQ5NGY1NTRiYWIyMDUxNzVmOGEKPiA+ICMgYmFk
OiBbYjI5MzU4ZDI2OWFjZTM4MjZkODUyMWJlYTg0MmZjMjk4NGNmYzExYl0gbW0vcGFnZV9hbGxv
Yy5jOiByZW5hbWUgZnJlZV9wYWdlc19jaGVjaygpIHRvIGNoZWNrX2ZyZWVfcGFnZSgpCj4gPiBn
aXQgYmlzZWN0IGJhZCBiMjkzNThkMjY5YWNlMzgyNmQ4NTIxYmVhODQyZmMyOTg0Y2ZjMTFiCj4g
PiAjIGJhZDogW2JlMGZiNTkxYTFmMWRmMjBhMDBjOGYwMjNmOWNhNDg5MWYxNzdiMGRdIG1tOiBz
aW1wbGlmeSBmaW5kX21pbl9wZm5fd2l0aF9hY3RpdmVfcmVnaW9ucygpCj4gPiBnaXQgYmlzZWN0
IGJhZCBiZTBmYjU5MWExZjFkZjIwYTAwYzhmMDIzZjljYTQ4OTFmMTc3YjBkCj4gPiAjIGJhZDog
W2MxNzQyMmEwMDhkMzZkY2YzZTlmNTE0Njk3NThjNTc2MjcxNmNiMGFdIG1tOiByZW5hbWUgZnJl
ZV9hcmVhX2luaXRfbm9kZSgpIHRvIGZyZWVfYXJlYV9pbml0X21lbW9yeWxlc3Nfbm9kZSgpCj4g
PiBnaXQgYmlzZWN0IGJhZCBjMTc0MjJhMDA4ZDM2ZGNmM2U5ZjUxNDY5NzU4YzU3NjI3MTZjYjBh
Cj4gPiAjIGJhZDogWzUxYTJmNjQ0ZmQwMjBkNWYwOTAwNDQ4MjVjMzg4NDQ0ZDExMDI5ZDVdIG1t
OiBmcmVlX2FyZWFfaW5pdDogYWxsb3cgZGVmaW5pbmcgbWF4X3pvbmVfcGZuIGluIGRlc2NlbmRp
bmcgb3JkZXIKPiA+IGdpdCBiaXNlY3QgYmFkIDUxYTJmNjQ0ZmQwMjBkNWYwOTAwNDQ4MjVjMzg4
NDQ0ZDExMDI5ZDUKPiA+ICMgZmlyc3QgYmFkIGNvbW1pdDogWzUxYTJmNjQ0ZmQwMjBkNWYwOTAw
NDQ4MjVjMzg4NDQ0ZDExMDI5ZDVdIG1tOiBmcmVlX2FyZWFfaW5pdDogYWxsb3cgZGVmaW5pbmcg
bWF4X3pvbmVfcGZuIGluIGRlc2NlbmRpbmcgb3JkZXIKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1p
a2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
