Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B47E4DC982
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 16:03:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F223623CD1;
	Thu, 17 Mar 2022 16:03:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 50797211B2
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 16:03:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647529426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aa1jAvfCIcTnLm2lUoV2mmz4eiiaEOLiyUm5zpRdIXk=;
 b=OA6aotsSJ+ExrNOr9YF3BpuAP7Jz89tcEiuAT130v0jSEhAzptpNnw0Efqer5NAuybOswu
 UzH45R9UhPOwQu2SCY8Cqf8t1K6oFZt3pr7CzNO3kXXlVMctEpLbkuO1MHJXsQWKGcLLQc
 N6zc7eSZc0vsy0eNV9oOKRzLxk5bkL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-1uKE53VaO8eu6i448SukJw-1; Thu, 17 Mar 2022 11:03:43 -0400
X-MC-Unique: 1uKE53VaO8eu6i448SukJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF02805A30;
 Thu, 17 Mar 2022 15:03:42 +0000 (UTC)
Received: from [10.22.33.180] (unknown [10.22.33.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98BEC401E6F;
 Thu, 17 Mar 2022 15:03:40 +0000 (UTC)
Message-ID: <364c72a9-64ca-592a-510b-d48a963121aa@redhat.com>
Date: Thu, 17 Mar 2022 11:03:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Boqun Feng <boqun.feng@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
 <YjM+P32I4fENIqGV@boqun-archlinux>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <YjM+P32I4fENIqGV@boqun-archlinux>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [OpenRISC] [PATCH 2/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, openrisc@lists.librecores.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMy8xNy8yMiAwOTo1NywgQm9xdW4gRmVuZyB3cm90ZToKPiBPbiBXZWQsIE1hciAxNiwgMjAy
MiBhdCAwNDoyNTo1N1BNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4gRnJvbTogUGV0
ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+Pgo+PiBUaGlzIGlzIGEgc2ltcGxl
LCBmYWlyIHNwaW5sb2NrLiAgU3BlY2lmaWNhbGx5IGl0IGRvZXNuJ3QgaGF2ZSBhbGwgdGhlCj4+
IHN1YnRsZSBtZW1vcnkgbW9kZWwgZGVwZW5kZW5jaWVzIHRoYXQgcXNwaW5sb2NrIGhhcywgd2hp
Y2ggbWFrZXMgaXQgbW9yZQo+PiBzdWl0YWJsZSBmb3Igc2ltcGxlIHN5c3RlbXMgYXMgaXQgaXMg
bW9yZSBsaWtlbHkgdG8gYmUgY29ycmVjdC4KPj4KPj4gW1BhbG1lcjogY29tbWl0IHRleHRdCj4+
IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+Pgo+
PiAtLQo+Pgo+PiBJIGhhdmUgc3BlY2lmaWNhbGx5IG5vdCBpbmNsdWRlZCBQZXRlcidzIFNPQiBv
biB0aGlzLCBhcyBoZSBzZW50IGhpcwo+PiBvcmlnaW5hbCBwYXRjaAo+PiA8aHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramozQGhpcmV6LnByb2dyYW1taW5nLmtpY2tz
LWFzcy5uZXQvPgo+PiB3aXRob3V0IG9uZS4KPj4gLS0tCj4+ICAgaW5jbHVkZS9hc20tZ2VuZXJp
Yy90aWNrZXQtbG9jay10eXBlcy5oIHwgMTEgKysrKwo+PiAgIGluY2x1ZGUvYXNtLWdlbmVyaWMv
dGlja2V0LWxvY2suaCAgICAgICB8IDg2ICsrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCj4+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaAo+Pgo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oIGIvaW5jbHVkZS9hc20t
Z2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uODI5NzU5YWVkZGE4Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
aW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCj4+IEBAIC0wLDAgKzEsMTEg
QEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+ICsKPj4gKyNp
Zm5kZWYgX19BU01fR0VORVJJQ19USUNLRVRfTE9DS19UWVBFU19ICj4+ICsjZGVmaW5lIF9fQVNN
X0dFTkVSSUNfVElDS0VUX0xPQ0tfVFlQRVNfSAo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4KPj4gK3R5cGVkZWYgYXRvbWljX3QgYXJjaF9zcGlubG9ja190Owo+PiArCj4+ICsjZGVm
aW5lIF9fQVJDSF9TUElOX0xPQ0tfVU5MT0NLRUQJQVRPTUlDX0lOSVQoMCkKPj4gKwo+PiArI2Vu
ZGlmIC8qIF9fQVNNX0dFTkVSSUNfVElDS0VUX0xPQ0tfVFlQRVNfSCAqLwo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oIGIvaW5jbHVkZS9hc20tZ2VuZXJp
Yy90aWNrZXQtbG9jay5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAw
MDAwMC4uM2YwZDUzZTIxYTM3Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvaW5jbHVkZS9hc20t
Z2VuZXJpYy90aWNrZXQtbG9jay5oCj4+IEBAIC0wLDAgKzEsODYgQEAKPj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+ICsKPj4gKy8qCj4+ICsgKiAnR2VuZXJpYycg
dGlja2V0LWxvY2sgaW1wbGVtZW50YXRpb24uCj4+ICsgKgo+PiArICogSXQgcmVsaWVzIG9uIGF0
b21pY19mZXRjaF9hZGQoKSBoYXZpbmcgd2VsbCBkZWZpbmVkIGZvcndhcmQgcHJvZ3Jlc3MKPj4g
KyAqIGd1YXJhbnRlZXMgdW5kZXIgY29udGVudGlvbi4gSWYgeW91ciBhcmNoaXRlY3R1cmUgY2Fu
bm90IHByb3ZpZGUgdGhpcywgc3RpY2sKPj4gKyAqIHRvIGEgdGVzdC1hbmQtc2V0IGxvY2suCj4+
ICsgKgo+PiArICogSXQgYWxzbyByZWxpZXMgb24gYXRvbWljX2ZldGNoX2FkZCgpIGJlaW5nIHNh
ZmUgdnMgc21wX3N0b3JlX3JlbGVhc2UoKSBvbiBhCj4+ICsgKiBzdWItd29yZCBvZiB0aGUgdmFs
dWUuIFRoaXMgaXMgZ2VuZXJhbGx5IHRydWUgZm9yIGFueXRoaW5nIExML1NDIGFsdGhvdWdoCj4+
ICsgKiB5b3UnZCBiZSBoYXJkIHByZXNzZWQgdG8gZmluZCBhbnl0aGluZyB1c2VmdWwgaW4gYXJj
aGl0ZWN0dXJlIHNwZWNpZmljYXRpb25zCj4+ICsgKiBhYm91dCB0aGlzLiBJZiB5b3VyIGFyY2hp
dGVjdHVyZSBjYW5ub3QgZG8gdGhpcyB5b3UgbWlnaHQgYmUgYmV0dGVyIG9mZiB3aXRoCj4+ICsg
KiBhIHRlc3QtYW5kLXNldC4KPj4gKyAqCj4+ICsgKiBJdCBmdXJ0aGVyIGFzc3VtZXMgYXRvbWlj
XypfcmVsZWFzZSgpICsgYXRvbWljXypfYWNxdWlyZSgpIGlzIFJDcGMgYW5kIGhlbmNlCj4+ICsg
KiB1c2VzIGF0b21pY19mZXRjaF9hZGQoKSB3aGljaCBpcyBTQyB0byBjcmVhdGUgYW4gUkNzYyBs
b2NrLgo+PiArICoKPiBQcm9iYWJseSBpdCdzIGJldHRlciB0byB1c2UgImZ1bGx5LW9yZGVyZWQi
IGluc3RlYWQgb2YgIlNDIiwgYmVjYXVzZSBvdXIKPiBhdG9taWMgZG9jdW1lbnRzIG5ldmVyIHVz
ZSAiU0MiIG9yICJTZXF1ZW50aWFsIENvbnNpc3RlbnkiIHRvIGRlc2NyaWJlCj4gdGhlIHNlbWFu
dGljcywgZnVydGhlciBJJ20gbm90IHN1cmUgb3VyICJmdWxseS1vcmRlcmVkIiBpcyBlcXVpdmFs
ZW50IHRvCj4gU0MsIGJldHRlciBub3QgY2F1c2UgbWlzdW5kZXJzdGFuZGluZyBpbiB0aGUgZnV0
dXJlIGhlcmUuCgpUaGUgdGVybXMgUkNwYywgUkNzYyBjb21lcyBmcm9tIGFjYWRlbWlhLiBJIGJl
bGlldmUgd2UgY2FuIGtlZXAgdGhpcyBidXQgCmFkZCBtb3JlIGNvbW1lbnQgdG8gZWxhYm9yYXRl
IHdoYXQgdGhleSBhcmUgYW5kIHdoYXQgZG8gdGhleSBtZWFuIGZvciAKdGhlIGF2ZXJhZ2Uga2Vy
bmVsIGVuZ2luZWVyLgoKQ2hlZXJzLApMb25nbWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=
