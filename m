Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 857F24B908C
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 19:44:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3AF5224843;
	Wed, 16 Feb 2022 19:44:19 +0100 (CET)
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by mail.librecores.org (Postfix) with ESMTPS id 7D0D72483C
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 19:44:18 +0100 (CET)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7cf017e4-8f58-11ec-baa1-0050568c148b;
 Wed, 16 Feb 2022 18:44:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B79C194B3E;
 Wed, 16 Feb 2022 19:44:17 +0100 (CET)
Date: Wed, 16 Feb 2022 19:44:13 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Yg1F/VT4vRX4aHEt@ravnborg.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS
 users
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCkZpeCBzcGVsbGluZyBpbiAkc3ViamVjdC4uLgoKc3BhcmMvS2NvbmZpZyBiL2Fy
Y2gvc3BhcmMvS2NvbmZpZwo+IGluZGV4IDlmNmY5YmNlNTI5Mi4uOTI3NmYzMjFiM2UzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvc3BhcmMvS2NvbmZpZwo+ICsrKyBiL2FyY2gvc3BhcmMvS2NvbmZpZwo+
IEBAIC00Niw3ICs0Niw2IEBAIGNvbmZpZyBTUEFSQwo+ICAJc2VsZWN0IExPQ0tERVBfU01BTEwg
aWYgTE9DS0RFUAo+ICAJc2VsZWN0IE5FRURfRE1BX01BUF9TVEFURQo+ICAJc2VsZWN0IE5FRURf
U0dfRE1BX0xFTkdUSAo+IC0Jc2VsZWN0IFNFVF9GUwo+ICAJc2VsZWN0IFRSQUNFX0lSUUZMQUdT
X1NVUFBPUlQKPiAgCj4gIGNvbmZpZyBTUEFSQzMyCj4gQEAgLTEwMSw2ICsxMDAsNyBAQCBjb25m
aWcgU1BBUkM2NAo+ICAJc2VsZWN0IEhBVkVfU0VUVVBfUEVSX0NQVV9BUkVBCj4gIAlzZWxlY3Qg
TkVFRF9QRVJfQ1BVX0VNQkVEX0ZJUlNUX0NIVU5LCj4gIAlzZWxlY3QgTkVFRF9QRVJfQ1BVX1BB
R0VfRklSU1RfQ0hVTksKPiArCXNlbGVjdCBTRVRfRlMKVGhpcyBsb29rcyB3cm9uZyAtIGxvb2tz
IGxpa2Ugc29tZSBtZXJnZSB3ZW50IHdyb25nIGhlcmUuCgo+ICAKPiAgY29uZmlnIEFSQ0hfUFJP
Q19LQ09SRV9URVhUCj4gIAlkZWZfYm9vbCB5Cj4gZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvaW5j
bHVkZS9hc20vcHJvY2Vzc29yXzMyLmggYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nv
cl8zMi5oCj4gaW5kZXggNjQ3YmYwYWM3YmViLi5iMjZjMzUzMzZiNTEgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9wcm9jZXNzb3JfMzIuaAo+ICsrKyBiL2FyY2gvc3BhcmMv
aW5jbHVkZS9hc20vcHJvY2Vzc29yXzMyLmgKPiBAQCAtMzIsMTAgKzMyLDYgQEAgc3RydWN0IGZw
cSB7Cj4gIH07Cj4gICNlbmRpZgo+ICAKPiAtdHlwZWRlZiBzdHJ1Y3Qgewo+IC0JaW50IHNlZzsK
PiAtfSBtbV9zZWdtZW50X3Q7Cj4gLQo+ICAvKiBUaGUgU3BhcmMgcHJvY2Vzc29yIHNwZWNpZmlj
IHRocmVhZCBzdHJ1Y3QuICovCj4gIHN0cnVjdCB0aHJlYWRfc3RydWN0IHsKPiAgCXN0cnVjdCBw
dF9yZWdzICprcmVnczsKPiBAQCAtNTAsMTEgKzQ2LDkgQEAgc3RydWN0IHRocmVhZF9zdHJ1Y3Qg
ewo+ICAJdW5zaWduZWQgbG9uZyAgIGZzcjsKPiAgCXVuc2lnbmVkIGxvbmcgICBmcHFkZXB0aDsK
PiAgCXN0cnVjdCBmcHEJZnBxdWV1ZVsxNl07Cj4gLQltbV9zZWdtZW50X3QgY3VycmVudF9kczsK
PiAgfTsKPiAgCj4gICNkZWZpbmUgSU5JVF9USFJFQUQgIHsgXAo+IC0JLmN1cnJlbnRfZHMgPSBL
RVJORUxfRFMsIFwKPiAgCS5rcmVncyA9IChzdHJ1Y3QgcHRfcmVncyAqKShpbml0X3N0YWNrK1RI
UkVBRF9TSVpFKS0xIFwKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRl
L2FzbS91YWNjZXNzXzMyLmggYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3VhY2Nlc3NfMzIuaAo+
IGluZGV4IDM2Nzc0NzExNjI2MC4uOWZkNmM1MzY0NGI2IDEwMDY0NAo+IC0tLSBhL2FyY2gvc3Bh
cmMvaW5jbHVkZS9hc20vdWFjY2Vzc18zMi5oCj4gKysrIGIvYXJjaC9zcGFyYy9pbmNsdWRlL2Fz
bS91YWNjZXNzXzMyLmgKPiBAQCAtMTIsMTkgKzEyLDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3N0
cmluZy5oPgo+ICAKPiAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiAtCj4gLS8qIFNwYXJj
IGlzIG5vdCBzZWdtZW50ZWQsIGhvd2V2ZXIgd2UgbmVlZCB0byBiZSBhYmxlIHRvIGZvb2wgYWNj
ZXNzX29rKCkKPiAtICogd2hlbiBkb2luZyBzeXN0ZW0gY2FsbHMgZnJvbSBrZXJuZWwgbW9kZSBs
ZWdpdGltYXRlbHkuCj4gLSAqCj4gLSAqICJGb3IgaGlzdG9yaWNhbCByZWFzb25zLCB0aGVzZSBt
YWNyb3MgYXJlIGdyb3NzbHkgbWlzbmFtZWQuIiAtTGludXMKPiAtICovCj4gLQo+IC0jZGVmaW5l
IEtFUk5FTF9EUyAgICgobW1fc2VnbWVudF90KSB7IDAgfSkKPiAtI2RlZmluZSBVU0VSX0RTICAg
ICAoKG1tX3NlZ21lbnRfdCkgeyAtMSB9KQo+IC0KPiAtI2RlZmluZSBnZXRfZnMoKQkoY3VycmVu
dC0+dGhyZWFkLmN1cnJlbnRfZHMpCj4gLSNkZWZpbmUgc2V0X2ZzKHZhbCkJKChjdXJyZW50LT50
aHJlYWQuY3VycmVudF9kcykgPSAodmFsKSkKPiAtCj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9h
Y2Nlc3Nfb2suaD4KPiAgCj4gIC8qIFVoLCB0aGVzZSBzaG91bGQgYmVjb21lIHRoZSBtYWluIHNp
bmdsZS12YWx1ZSB0cmFuc2ZlciByb3V0aW5lcy4uCj4gZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMv
a2VybmVsL3Byb2Nlc3NfMzIuYyBiL2FyY2gvc3BhcmMva2VybmVsL3Byb2Nlc3NfMzIuYwo+IGlu
ZGV4IDJkYzBiZjlmZTYyZS4uODhjMGMxNGFhZmYwIDEwMDY0NAo+IC0tLSBhL2FyY2gvc3BhcmMv
a2VybmVsL3Byb2Nlc3NfMzIuYwo+ICsrKyBiL2FyY2gvc3BhcmMva2VybmVsL3Byb2Nlc3NfMzIu
Ywo+IEBAIC0zMDAsNyArMzAwLDYgQEAgaW50IGNvcHlfdGhyZWFkKHVuc2lnbmVkIGxvbmcgY2xv
bmVfZmxhZ3MsIHVuc2lnbmVkIGxvbmcgc3AsIHVuc2lnbmVkIGxvbmcgYXJnLAo+ICAJCWV4dGVy
biBpbnQgbndpbmRvd3M7Cj4gIAkJdW5zaWduZWQgbG9uZyBwc3I7Cj4gIAkJbWVtc2V0KG5ld19z
dGFjaywgMCwgU1RBQ0tGUkFNRV9TWiArIFRSQUNFUkVHX1NaKTsKPiAtCQlwLT50aHJlYWQuY3Vy
cmVudF9kcyA9IEtFUk5FTF9EUzsKPiAgCQl0aS0+a3BjID0gKCgodW5zaWduZWQgbG9uZykgcmV0
X2Zyb21fa2VybmVsX3RocmVhZCkgLSAweDgpOwo+ICAJCWNoaWxkcmVncy0+dV9yZWdzW1VSRUdf
RzFdID0gc3A7IC8qIGZ1bmN0aW9uICovCj4gIAkJY2hpbGRyZWdzLT51X3JlZ3NbVVJFR19HMl0g
PSBhcmc7Cj4gQEAgLTMxMSw3ICszMTAsNiBAQCBpbnQgY29weV90aHJlYWQodW5zaWduZWQgbG9u
ZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyBzcCwgdW5zaWduZWQgbG9uZyBhcmcsCj4gIAl9
Cj4gIAltZW1jcHkobmV3X3N0YWNrLCAoY2hhciAqKXJlZ3MgLSBTVEFDS0ZSQU1FX1NaLCBTVEFD
S0ZSQU1FX1NaICsgVFJBQ0VSRUdfU1opOwo+ICAJY2hpbGRyZWdzLT51X3JlZ3NbVVJFR19GUF0g
PSBzcDsKPiAtCXAtPnRocmVhZC5jdXJyZW50X2RzID0gVVNFUl9EUzsKPiAgCXRpLT5rcGMgPSAo
KCh1bnNpZ25lZCBsb25nKSByZXRfZnJvbV9mb3JrKSAtIDB4OCk7Cj4gIAl0aS0+a3BzciA9IGN1
cnJlbnQtPnRocmVhZC5mb3JrX2twc3IgfCBQU1JfUElMOwo+ICAJdGktPmt3aW0gPSBjdXJyZW50
LT50aHJlYWQuZm9ya19rd2ltOwoKT3RoZXIgdGhhbiB0aGUgYWJvdmUgdGhlIHNwYXJjMzIgY2hh
bmdlcyBsb29rcyBmaW5lLCBhbmQgd2l0aCB0aGUgS2NvbmYKc3R1ZmYgZml4ZWQ6CkFja2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ICMgZm9yIHNwYXJjMzIgY2hhbmdlcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
