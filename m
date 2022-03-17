Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5604DCCD0
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 18:46:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3F2762475A;
	Thu, 17 Mar 2022 18:46:56 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by mail.librecores.org (Postfix) with ESMTP id EC4F721376
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 18:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647539212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llqjR9J1FmybTT0pHxsozwhPdyLYqoq+OgcFl5fMvI4=;
 b=X7v+a+3GIfbjGtyGOEoKEN6aLHlBimYXLjPd7cuVU7NrGNI5h6uit4z0oMlC767cpnW7OF
 uSiYek03N2suncz5ZFR6hcGeKix1l+VDmhZ5mb6rdC+/lHIfJFLY+c2K/mLqHDxS+Ey5uX
 j6IYyEOLeK5iKviPhbzgMzaVuTQ2ITc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-D_1JD0DkM1yNyRBj3b6jGg-1; Thu, 17 Mar 2022 13:46:49 -0400
X-MC-Unique: D_1JD0DkM1yNyRBj3b6jGg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A59218A6584;
 Thu, 17 Mar 2022 17:46:48 +0000 (UTC)
Received: from [10.22.8.95] (unknown [10.22.8.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EC33401E87;
 Thu, 17 Mar 2022 17:46:47 +0000 (UTC)
Message-ID: <67ba2190-dd72-4ad0-32c2-de43418b73a2@redhat.com>
Date: Thu, 17 Mar 2022 13:46:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 peterz@infradead.org
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-2-palmer@rivosinc.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220316232600.20419-2-palmer@rivosinc.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [OpenRISC] [PATCH 1/5] asm-generic: qspinlock: Indicate the use
 of mixed-size atomics
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 openrisc@lists.librecores.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMy8xNi8yMiAxOToyNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gRnJvbTogUGV0ZXIgWmlq
bHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+Cj4gVGhlIHFzcGlubG9jayBpbXBsZW1lbnRh
dGlvbiBkZXBlbmRzIG9uIGhhdmluZyB3ZWxsIGJlaGF2ZWQgbWl4ZWQtc2l6ZQo+IGF0b21pY3Mu
ICBUaGlzIGlzIHRydWUgb24gdGhlIG1vcmUgd2lkZWx5LXVzZWQgcGxhdGZvcm1zLCBidXQgdGhl
c2UKPiByZXF1aXJlbWVudHMgYXJlIHNvbWV3aGF0IHN1YnRsZSBhbmQgbWF5IG5vdCBiZSBzYXRp
c2ZpZWQgYnkgYWxsIHRoZQo+IHBsYXRmb3JtcyB0aGF0IHFzcGlubG9jayBpcyB1c2VkIG9uLgo+
Cj4gRG9jdW1lbnQgdGhlc2UgcmVxdWlyZW1lbnRzLCBzbyBwb3J0cyB0aGF0IHVzZSBxc3Bpbmxv
Y2sgY2FuIG1vcmUgZWFzaWx5Cj4gZGV0ZXJtaW5lIGlmIHRoZXkgbWVldCB0aGVzZSByZXF1aXJl
bWVudHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPgo+IC0tLQo+Cj4gSSBoYXZlIHNwZWNpZmljYWxseSBub3QgaW5jbHVkZWQgUGV0ZXIn
cyBTT0Igb24gdGhpcywgYXMgaGUgc2VudCBoaXMKPiBvcmlnaW5hbCBwYXRjaAo+IDxodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sL1lIYkJCdVZGTm5JNGtqajNAaGlyZXoucHJvZ3JhbW1pbmcu
a2lja3MtYXNzLm5ldC8+Cj4gd2l0aG91dCBvbmUuCj4gLS0tCj4gICBpbmNsdWRlL2FzbS1nZW5l
cmljL3FzcGlubG9jay5oIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAx
IGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
YXNtLWdlbmVyaWMvcXNwaW5sb2NrLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5o
Cj4gaW5kZXggZDc0YjEzODI1NTAxLi5hN2ExMjk2YjBiNGQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9xc3BpbmxvY2suaAo+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvcXNw
aW5sb2NrLmgKPiBAQCAtMiw2ICsyLDM2IEBACj4gICAvKgo+ICAgICogUXVldWVkIHNwaW5sb2Nr
Cj4gICAgKgo+ICsgKiBBICdnZW5lcmljJyBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiB0aGF0IGlz
IGJhc2VkIG9uIE1DUyBsb2Nrcy4gQW4KPiArICogYXJjaGl0ZWN0dXJlIHRoYXQncyBsb29raW5n
IGZvciBhICdnZW5lcmljJyBzcGlubG9jaywgcGxlYXNlIGZpcnN0IGNvbnNpZGVyCj4gKyAqIHRp
Y2tldC1sb2NrLmggYW5kIG9ubHkgY29tZSBsb29raW5nIGhlcmUgd2hlbiB5b3UndmUgY29uc2lk
ZXJlZCBhbGwgdGhlCj4gKyAqIGNvbnN0cmFpbnRzIGJlbG93IGFuZCBjYW4gc2hvdyB5b3VyIGhh
cmR3YXJlIGRvZXMgYWN0dWFsbHkgcGVyZm9ybSBiZXR0ZXIKPiArICogd2l0aCBxc3BpbmxvY2su
Cj4gKyAqCj4gKyAqCj4gKyAqIEl0IHJlbGllcyBvbiBhdG9taWNfKl9yZWxlYXNlKCkvYXRvbWlj
XypfYWNxdWlyZSgpIHRvIGJlIFJDc2MgKG9yIG5vIHdlYWtlcgo+ICsgKiB0aGFuIFJDdHNvIGlm
IHlvdSdyZSBwb3dlciksIHdoZXJlIHJlZ3VsYXIgY29kZSBvbmx5IGV4cGVjdHMgYXRvbWljX3Qg
dG8gYmUKPiArICogUkNwYy4KPiArICoKPiArICogSXQgcmVsaWVzIG9uIGEgZmFyIGdyZWF0ZXIg
KGNvbXBhcmVkIHRvIHRpY2tldC1sb2NrLmgpIHNldCBvZiBhdG9taWMKPiArICogb3BlcmF0aW9u
cyB0byBiZWhhdmUgd2VsbCB0b2dldGhlciwgcGxlYXNlIGF1ZGl0IHRoZW0gY2FyZWZ1bGx5IHRv
IGVuc3VyZQo+ICsgKiB0aGV5IGFsbCBoYXZlIGZvcndhcmQgcHJvZ3Jlc3MuIE1hbnkgYXRvbWlj
IG9wZXJhdGlvbnMgbWF5IGRlZmF1bHQgdG8KPiArICogY21weGNoZygpIGxvb3BzIHdoaWNoIHdp
bGwgbm90IGhhdmUgZ29vZCBmb3J3YXJkIHByb2dyZXNzIHByb3BlcnRpZXMgb24KPiArICogTEwv
U0MgYXJjaGl0ZWN0dXJlcy4KPiArICoKPiArICogT25lIG5vdGFibGUgZXhhbXBsZSBpcyBhdG9t
aWNfZmV0Y2hfb3JfYWNxdWlyZSgpLCB3aGljaCB4ODYgY2Fubm90IChjaGVhcGx5KQo+ICsgKiBk
by4gQ2FyZWZ1bGx5IHJlYWQgdGhlIHBhdGNoZXMgdGhhdCBpbnRyb2R1Y2VkIHF1ZXVlZF9mZXRj
aF9zZXRfcGVuZGluZ19hY3F1aXJlKCkuCj4gKyAqCj4gKyAqIEl0IGFsc28gaGVhdmlseSByZWxp
ZXMgb24gbWl4ZWQgc2l6ZSBhdG9taWMgb3BlcmF0aW9ucywgaW4gc3BlY2lmaWMgaXQKPiArICog
cmVxdWlyZXMgYXJjaGl0ZWN0dXJlcyB0byBoYXZlIHhjaGcxNjsgc29tZXRoaW5nIHdoaWNoIG1h
bnkgTEwvU0MKPiArICogYXJjaGl0ZWN0dXJlcyBuZWVkIHRvIGltcGxlbWVudCBhcyBhIDMyYml0
IGFuZCtvciBpbiBvcmRlciB0byBzYXRpc2Z5IHRoZQo+ICsgKiBmb3J3YXJkIHByb2dyZXNzIGd1
YXJhbnRlZXMgbWVudGlvbmVkIGFib3ZlLgo+ICsgKgo+ICsgKiBGdXJ0aGVyIHJlYWRpbmcgb24g
bWl4ZWQgc2l6ZSBhdG9taWNzIHRoYXQgbWlnaHQgYmUgcmVsZXZhbnQ6Cj4gKyAqCj4gKyAqICAg
aHR0cDovL3d3dy5jbC5jYW0uYWMudWsvfnBlczIwL3BvcGwxNy9taXhlZC1zaXplLnBkZgo+ICsg
Kgo+ICsgKgo+ICAgICogKEMpIENvcHlyaWdodCAyMDEzLTIwMTUgSGV3bGV0dC1QYWNrYXJkIERl
dmVsb3BtZW50IENvbXBhbnksIEwuUC4KPiAgICAqIChDKSBDb3B5cmlnaHQgMjAxNSBIZXdsZXR0
LVBhY2thcmQgRW50ZXJwcmlzZSBEZXZlbG9wbWVudCBMUAo+ICAgICoKQWNrZWQtYnk6IFdhaW1h
biBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+CgpOb3RlIHRoYXQgaXQgcmVmZXJlbmNlcyB0aWNr
ZXQtbG9jay5oLiBQZXJoYXBzIHdlIHNob3VsZCByZXZlcnNlIHRoZSAKb3JkZXIgb2YgcGF0Y2hl
cyAxICYgMi4KCkNoZWVycywKTG9uZ21hbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
