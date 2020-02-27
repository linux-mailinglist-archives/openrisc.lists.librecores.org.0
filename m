Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 70C4D17176D
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:41 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2DF78207F7;
	Thu, 27 Feb 2020 13:35:41 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by mail.librecores.org (Postfix) with ESMTPS id AD7BD20114
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 13:19:55 +0100 (CET)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j7I8v-0004CK-6h; Thu, 27 Feb 2020 12:19:53 +0000
Date: Thu, 27 Feb 2020 13:19:52 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200227121952.hywkuydswvdn3myc@wittgenstein>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200226225625.28935-2-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226225625.28935-2-shorne@gmail.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 1/3] openrisc: Convert copy_thread to
 copy_thread_tls
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

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjNBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gVGhpcyBpcyByZXF1aXJlZCBmb3IgY2xvbmUzIHdoaWNoIHBhc3NlcyB0aGUgVExT
IHZhbHVlIHRocm91Z2ggYQo+IHN0cnVjdCByYXRoZXIgdGhhbiBhIHJlZ2lzdGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IC0tLQo+ICBh
cmNoL29wZW5yaXNjL0tjb25maWcgICAgICAgICAgfCAgMSArCj4gIGFyY2gvb3BlbnJpc2Mva2Vy
bmVsL3Byb2Nlc3MuYyB8IDE1ICsrKysrLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3Bl
bnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+IGluZGV4IDE5MjhlMDYxZmY5
Ni4uNWRlYmRiZTZmYzM1IDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+ICsr
KyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+IEBAIC0xNCw2ICsxNCw3IEBAIGNvbmZpZyBPUEVO
UklTQwo+ICAJc2VsZWN0IEhBTkRMRV9ET01BSU5fSVJRCj4gIAlzZWxlY3QgR1BJT0xJQgo+ICAJ
c2VsZWN0IEhBVkVfQVJDSF9UUkFDRUhPT0sKPiArCXNlbGVjdCBIQVZFX0NPUFlfVEhSRUFEX1RM
Uwo+ICAJc2VsZWN0IFNQQVJTRV9JUlEKPiAgCXNlbGVjdCBHRU5FUklDX0lSUV9DSElQCj4gIAlz
ZWxlY3QgR0VORVJJQ19JUlFfUFJPQkUKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvcHJvY2Vzcy5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggYjA2
Zjg0ZjY2NzZmLi42Njk1ZjE2N2UxMjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvcHJvY2Vzcy5jCj4gKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAg
LTExNywxMiArMTE3LDEzIEBAIHZvaWQgcmVsZWFzZV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0
ICpkZWFkX3Rhc2spCj4gIGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9yayh2b2lk
KTsKPiAgCj4gIC8qCj4gLSAqIGNvcHlfdGhyZWFkCj4gKyAqIGNvcHlfdGhyZWFkX3Rscwo+ICAg
KiBAY2xvbmVfZmxhZ3M6IGZsYWdzCj4gICAqIEB1c3A6IHVzZXIgc3RhY2sgcG9pbnRlciBvciBm
biBmb3Iga2VybmVsIHRocmVhZAo+ICAgKiBAYXJnOiBhcmcgdG8gZm4gZm9yIGtlcm5lbCB0aHJl
YWQ7IGFsd2F5cyBOVUxMIGZvciB1c2Vyc3BhY2UgdGhyZWFkCj4gICAqIEBwOiB0aGUgbmV3bHkg
Y3JlYXRlZCB0YXNrCj4gICAqIEByZWdzOiBDUFUgY29udGV4dCB0byBjb3B5IGZvciB1c2Vyc3Bh
Y2UgdGhyZWFkOyBhbHdheXMgTlVMTCBmb3Iga3RocmVhZAo+ICsgKiBAdGxzOiB0aGUgVGhyZWFk
IExvY2FsIFN0b3JhdGUgcG9pbnRlciBmb3IgdGhlIG5ldyBwcm9jZXNzCj4gICAqCj4gICAqIEF0
IHRoZSB0b3Agb2YgYSBuZXdseSBpbml0aWFsaXplZCBrZXJuZWwgc3RhY2sgYXJlIHR3byBzdGFj
a2VkIHB0X3JlZwo+ICAgKiBzdHJ1Y3R1cmVzLiAgVGhlIGZpcnN0ICh0b3Btb3N0KSBpcyB0aGUg
dXNlcnNwYWNlIGNvbnRleHQgb2YgdGhlIHRocmVhZC4KPiBAQCAtMTQ4LDggKzE0OSw4IEBAIGV4
dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9yayh2b2lkKTsKPiAgICovCj4gIAo+ICBp
bnQKPiAtY29weV90aHJlYWQodW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9u
ZyB1c3AsCj4gLQkgICAgdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCB0YXNrX3N0cnVjdCAqcCkK
PiArY29weV90aHJlYWRfdGxzKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3MsIHVuc2lnbmVkIGxv
bmcgdXNwLAo+ICsJCXVuc2lnbmVkIGxvbmcgYXJnLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIHVu
c2lnbmVkIGxvbmcgdGxzKQo+ICB7Cj4gIAlzdHJ1Y3QgcHRfcmVncyAqdXNlcnJlZ3M7Cj4gIAlz
dHJ1Y3QgcHRfcmVncyAqa3JlZ3M7Cj4gQEAgLTE4MCwxNSArMTgxLDkgQEAgY29weV90aHJlYWQo
dW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1c3AsCj4gIAo+ICAJCS8q
Cj4gIAkJICogRm9yIENMT05FX1NFVFRMUyBzZXQgInRwIiAocjEwKSB0byB0aGUgVExTIHBvaW50
ZXIgcGFzc2VkIHRvIHN5c19jbG9uZS4KCk1heWJlIHJld29yZCB0aGlzIHRvOgoKRm9yIENMT05F
X1NFVFRMUyBzZXQgInRwIiAocjEwKSB0byB0aGUgVExTIHBvaW50ZXIuIFdlIHByb2JhYmx5CnNo
b3VsZG4ndCBtZW50aW9uIGNsb25lKCkgZXhwbGljaXRseSBhbnltb3JlLCBzaW5jZSB3ZSBub3cg
aGF2ZQpjbG9uZTMoKSBhbmQgdGhlcmVmb3JlIHR3byBjYWxsZXJzIHRoYXQgcGFzcyBpbiB0bHMg
YXJndW1lbnRzLgoKVGhhbmtzIQpDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
