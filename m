Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E666E4E4828
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 22:14:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8EC602403A;
	Tue, 22 Mar 2022 22:14:12 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id F276720DEE
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 22:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647983649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIVLkwlhPM3w906YxQwZL+nXYzlTqcHmn11/FV0IJ2I=;
 b=PW7r3STIorl3Kva1x8X1cmjlLGWpLmRZ1/N7VXtRv0wKCI4aS/i4yp1Nhc8nFF+IBzQ9D9
 N1v30uOSJH290wIRHcsG86YN7sZL8y/RsdwT5xNnPtBDFC5fJOMrp5flDoE1NCROdkWkVS
 NzhCBMpEMzvPn8EnB4jwNzzUn7P2Uo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-gAQqERV8OKCorngkS2_1Ew-1; Tue, 22 Mar 2022 17:14:06 -0400
X-MC-Unique: gAQqERV8OKCorngkS2_1Ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5727803B22;
 Tue, 22 Mar 2022 21:14:05 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 793A440D0166;
 Tue, 22 Mar 2022 21:14:05 +0000 (UTC)
Message-ID: <cbf542d9-d3d4-9de8-5a96-4d5fcea69f6a@redhat.com>
Date: Tue, 22 Mar 2022 17:14:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org> <Yjk+LGwhc50zvsk2@antec>
 <54d6221d-0c4f-9329-042d-4f74c4ea288f@redhat.com> <Yjo6bI+DWolVT/bQ@antec>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Yjo6bI+DWolVT/bQ@antec>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, peterz@infradead.org,
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, palmer@dabbelt.com,
 Palmer Dabbelt <palmer@rivosinc.com>, guoren@kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMy8yMi8yMiAxNzowNiwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gT24gVHVlLCBNYXIgMjIs
IDIwMjIgYXQgMTE6NTQ6MzdBTSAtMDQwMCwgV2FpbWFuIExvbmcgd3JvdGU6Cj4+IE9uIDMvMjEv
MjIgMjM6MTAsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+Pj4gSGVsbG8sCj4+Pgo+Pj4gVGhlcmUg
aXMgYSBwcm9ibGVtIHdpdGggdGhpcyBwYXRjaCBvbiBCaWcgRW5kaWFuIG1hY2hpbmVzLCBzZWUg
YmVsb3cuCj4+Pgo+Pj4gT24gU2F0LCBNYXIgMTksIDIwMjIgYXQgMTE6NTQ6NTNBTSArMDgwMCwg
Z3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4+Pj4gRnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPgo+Pj4+Cj4+Pj4gVGhpcyBpcyBhIHNpbXBsZSwgZmFpciBzcGlubG9j
ay4gIFNwZWNpZmljYWxseSBpdCBkb2Vzbid0IGhhdmUgYWxsIHRoZQo+Pj4+IHN1YnRsZSBtZW1v
cnkgbW9kZWwgZGVwZW5kZW5jaWVzIHRoYXQgcXNwaW5sb2NrIGhhcywgd2hpY2ggbWFrZXMgaXQg
bW9yZQo+Pj4+IHN1aXRhYmxlIGZvciBzaW1wbGUgc3lzdGVtcyBhcyBpdCBpcyBtb3JlIGxpa2Vs
eSB0byBiZSBjb3JyZWN0Lgo+Pj4+Cj4+Pj4gW1BhbG1lcjogY29tbWl0IHRleHRdCj4+Pj4gU2ln
bmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+Pj4KPj4+
PiAtLQo+Pj4+Cj4+Pj4gSSBoYXZlIHNwZWNpZmljYWxseSBub3QgaW5jbHVkZWQgUGV0ZXIncyBT
T0Igb24gdGhpcywgYXMgaGUgc2VudCBoaXMKPj4+PiBvcmlnaW5hbCBwYXRjaAo+Pj4+IDxodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sL1lIYkJCdVZGTm5JNGtqajNAaGlyZXoucHJvZ3JhbW1p
bmcua2lja3MtYXNzLm5ldC8+Cj4+Pj4gd2l0aG91dCBvbmUuCj4+Pj4gLS0tCj4+Pj4gICAgaW5j
bHVkZS9hc20tZ2VuZXJpYy9zcGlubG9jay5oICAgICAgICAgIHwgMTEgKysrLQo+Pj4+ICAgIGlu
Y2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2tfdHlwZXMuaCAgICB8IDE1ICsrKysrCj4+Pj4gICAg
aW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oIHwgMTEgKysrKwo+Pj4+ICAg
IGluY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaCAgICAgICB8IDg2ICsrKysrKysrKysr
KysrKysrKysrKysrKysKPj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDEyMCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2FzbS1n
ZW5lcmljL3NwaW5sb2NrX3R5cGVzLmgKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaAo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaCBiL2luY2x1ZGUvYXNtLWdlbmVy
aWMvdGlja2V0LWxvY2suaAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi41OTM3M2RlM2UzMmEKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvaW5j
bHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oCj4+PiAuLi4KPj4+Cj4+Pj4gK3N0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgdm9pZCB0aWNrZXRfdW5sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykK
Pj4+PiArewo+Pj4+ICsJdTE2ICpwdHIgPSAodTE2ICopbG9jayArIF9faXNfZGVmaW5lZChfX0JJ
R19FTkRJQU4pOwo+Pj4gQXMgbWVudGlvbmVkLCB0aGlzIHBhdGNoIHNlcmllcyBicmVha3MgU01Q
IG9uIE9wZW5SSVNDLiAgSSB0cmFjZWQgaXQgdG8gdGhpcwo+Pj4gbGluZS4gIFRoZSBhYm92ZSBg
X19pc19kZWZpbmVkKF9fQklHX0VORElBTilgICBkb2VzIG5vdCByZXR1cm4gMSBhcyBleHBlY3Rl
ZAo+Pj4gZXZlbiBvbiBCSUdfRU5ESUFOIG1hY2hpbmVzLiAgVGhpcyB3b3JrczoKPj4+Cj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaCBiL2luY2x1
ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaAo+Pj4gaW5kZXggNTkzNzNkZTNlMzJhLi41MmI1
ZGM5ZmZkYmEgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2Nr
LmgKPj4+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaAo+Pj4gQEAgLTI2
LDYgKzI2LDcgQEAKPj4+ICAgICNkZWZpbmUgX19BU01fR0VORVJJQ19USUNLRVRfTE9DS19ICj4+
PiAgICAjaW5jbHVkZSA8bGludXgvYXRvbWljLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L2tjb25m
aWcuaD4KPj4+ICAgICNpbmNsdWRlIDxhc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oPgo+
Pj4gICAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHRpY2tldF9sb2NrKGFyY2hfc3Bpbmxv
Y2tfdCAqbG9jaykKPj4+IEBAIC01MSw3ICs1Miw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
Ym9vbCB0aWNrZXRfdHJ5bG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4+PiAgICBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQgdGlja2V0X3VubG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2sp
Cj4+PiAgICB7Cj4+PiAtICAgICAgIHUxNiAqcHRyID0gKHUxNiAqKWxvY2sgKyBfX2lzX2RlZmlu
ZWQoX19CSUdfRU5ESUFOKTsKPj4+ICsgICAgICAgdTE2ICpwdHIgPSAodTE2ICopbG9jayArIElT
X0VOQUJMRUQoQ09ORklHX0NQVV9CSUdfRU5ESUFOKTsKPj4+ICAgICAgICAgICB1MzIgdmFsID0g
YXRvbWljX3JlYWQobG9jayk7Cj4+PiAgICAgICAgICAgc21wX3N0b3JlX3JlbGVhc2UocHRyLCAo
dTE2KXZhbCArIDEpOwo+Pj4KPj4+Cj4+Pj4gKwl1MzIgdmFsID0gYXRvbWljX3JlYWQobG9jayk7
Cj4+Pj4gKwo+Pj4+ICsJc21wX3N0b3JlX3JlbGVhc2UocHRyLCAodTE2KXZhbCArIDEpOwo+Pj4+
ICt9Cj4+Pj4gKwo+PiBfX0JJR19FTkRJQU4gaXMgZGVmaW5lZCBpbiA8bGludXgva2NvbmZpZy5o
Pi4gSSBiZWxpZXZlIHRoYXQgaWYgeW91IGluY2x1ZGUKPj4gPGxpbnV4L2tjb25maWcuaD4sIHRo
ZSBzZWNvbmQgaHVuayBpcyBub3QgcmVhbGx5IG5lZWRlZCBhbmQgdmljZSB2ZXJzYS4KPiBJIHRo
b3VnaHQgc28gdG9vLCBidXQgaXQgZG9lc24ndCBzZWVtIHRvIHdvcmsuICBJIHRoaW5rIF9faXNf
ZGVmaW5lZCBpcyBub3QKPiBkb2luZyB3aGF0IHdlIHRoaW5rIGluIHRoaXMgY29udGV4dC4gIEl0
IGxvb2tzIGxpa2UgX19pc19kZWZpbmVkIHdvcmtzIHdoZW4gYQo+IG1hY3JvIGlzIGRlZmluZWQg
YXMgMSwgaW4gdGhpcyBjYXNlIHdlIGhhdmUgX19CSUdfRU5ESUFOIDQzMjEuCgpZb3UgYXJlIHJp
Z2h0LiBfX2lzX2RlZmluZWQoKSBvbmx5IGZvciAxIG9yIG5vdCAxLiBTbyBpdCBjYW4ndCBiZSB1
c2VkIApmb3IgX19CSUdfRU5ESUFOLgoKSSB3YXMgbm90IGF3YXJlIG9mIHRoYXQuIEFueXdheSwg
dGhlIDxsaW51eC9rY29uZmlnLmg+IGluY2x1ZGUgaXMgbm90IApyZWFsbHkgbmVlZGVkIHRoZW4u
CgpDaGVlcnMsCkxvbmdtYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
