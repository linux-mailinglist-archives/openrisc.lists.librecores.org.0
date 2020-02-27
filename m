Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A8BDF17176F
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 74DBC209D2;
	Thu, 27 Feb 2020 13:35:42 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by mail.librecores.org (Postfix) with ESMTPS id E932620746
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 13:24:30 +0100 (CET)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j7IDM-0004b4-Ip; Thu, 27 Feb 2020 12:24:28 +0000
Date: Thu, 27 Feb 2020 13:24:27 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200227122427.bt3zvtdibpss46nw@wittgenstein>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200226225625.28935-4-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226225625.28935-4-shorne@gmail.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 3/3] openrisc: Cleanup copy_thread_tls docs
 and comments
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>,
 Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjVBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gUHJldmlvdXNseSBjb3B5X3RocmVhZF90bHMgd2FzIGNvcHlfdGhyZWFkIGFuZCBi
ZWZvcmUgdGhhdCBzb21ldGhpbmcKPiBlbHNlLiAgUmVtb3ZlIHRoZSBkb2N1bWVudGF0aW9uIGFi
b3V0IHRoZSByZWdzIHBhcmFtZXRlciB0aGF0IGRpZG4ndAo+IGV4aXN0IGluIGVpdGhlciB2ZXJz
aW9uLgo+IAo+IE5leHQsIGZpeCBjb21tZW50IHdyYXBwaW5nIGFuZCBkZXRhaWxzIGFib3V0IGhv
dyBUTFMgcG9pbnRlciBnZXRzIHRvIHRoZQo+IGNvcHlfdGhyZWFkX3RscyBmdW5jdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KCkFja2Vk
LWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KCj4g
LS0tCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyB8IDQgKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9w
cm9jZXNzLmMKPiBpbmRleCA2Njk1ZjE2N2UxMjYuLmI0NDJlN2I1OWUxNyAxMDA2NDQKPiAtLS0g
YS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiArKysgYi9hcmNoL29wZW5yaXNjL2tl
cm5lbC9wcm9jZXNzLmMKPiBAQCAtMTIyLDcgKzEyMiw2IEBAIGV4dGVybiBhc21saW5rYWdlIHZv
aWQgcmV0X2Zyb21fZm9yayh2b2lkKTsKPiAgICogQHVzcDogdXNlciBzdGFjayBwb2ludGVyIG9y
IGZuIGZvciBrZXJuZWwgdGhyZWFkCj4gICAqIEBhcmc6IGFyZyB0byBmbiBmb3Iga2VybmVsIHRo
cmVhZDsgYWx3YXlzIE5VTEwgZm9yIHVzZXJzcGFjZSB0aHJlYWQKPiAgICogQHA6IHRoZSBuZXds
eSBjcmVhdGVkIHRhc2sKPiAtICogQHJlZ3M6IENQVSBjb250ZXh0IHRvIGNvcHkgZm9yIHVzZXJz
cGFjZSB0aHJlYWQ7IGFsd2F5cyBOVUxMIGZvciBrdGhyZWFkCj4gICAqIEB0bHM6IHRoZSBUaHJl
YWQgTG9jYWwgU3RvcmF0ZSBwb2ludGVyIGZvciB0aGUgbmV3IHByb2Nlc3MKPiAgICoKPiAgICog
QXQgdGhlIHRvcCBvZiBhIG5ld2x5IGluaXRpYWxpemVkIGtlcm5lbCBzdGFjayBhcmUgdHdvIHN0
YWNrZWQgcHRfcmVnCj4gQEAgLTE4MCw3ICsxNzksOCBAQCBjb3B5X3RocmVhZF90bHModW5zaWdu
ZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1c3AsCj4gIAkJCXVzZXJyZWdzLT5z
cCA9IHVzcDsKPiAgCj4gIAkJLyoKPiAtCQkgKiBGb3IgQ0xPTkVfU0VUVExTIHNldCAidHAiIChy
MTApIHRvIHRoZSBUTFMgcG9pbnRlciBwYXNzZWQgdG8gc3lzX2Nsb25lLgo+ICsJCSAqIEZvciBD
TE9ORV9TRVRUTFMgc2V0ICJ0cCIgKHIxMCkgdG8gdGhlIFRMUyBwb2ludGVyIHBhc3NlZAo+ICsJ
CSAqIGluIGNsb25lX2FyZ3MgdG8gc3lzX2Nsb25lMy4KCkFzIEkgc2FpZCBpbiBteSBvdGhlciBy
ZXBseSwgSSdkIG5vdCByZWZlcmVuY2UgYW55IHNwZWNpZmljIGNhbGxlciBzaW5jZQp3ZSBoYXZl
IGF0IGxlYXN0IHR3by4KCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
