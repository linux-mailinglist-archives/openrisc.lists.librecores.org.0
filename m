Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3334E4362
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 16:54:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BB2F924860;
	Tue, 22 Mar 2022 16:54:44 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id B6A4224260
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 16:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647964482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhnT3KW2N7nGUFmNkySnEopkUtzZ8brHDUQP8GeFjGo=;
 b=JozSWqpSB8UWD3b4CTOx3Nv8OJ1qnUnyDmwamSMZGPwg9XfM/1FOoSwvfbyqArV2C9pmVD
 8AN0sEQ7QZLpDXU+LYvSopIcU8/3AQaotVL8i4IZAl39NfC79LbvSL6zRVACqC5T2OZq/l
 uJNB7qcGXERyB1bjlTavOvpRWtHM+98=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-j0LrWmyDNnym6QHTL5OVNg-1; Tue, 22 Mar 2022 11:54:39 -0400
X-MC-Unique: j0LrWmyDNnym6QHTL5OVNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F6EE29ABA2E;
 Tue, 22 Mar 2022 15:54:38 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C5A4229D0;
 Tue, 22 Mar 2022 15:54:37 +0000 (UTC)
Message-ID: <54d6221d-0c4f-9329-042d-4f74c4ea288f@redhat.com>
Date: Tue, 22 Mar 2022 11:54:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, guoren@kernel.org
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org> <Yjk+LGwhc50zvsk2@antec>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Yjk+LGwhc50zvsk2@antec>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMy8yMS8yMiAyMzoxMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gSGVsbG8sCj4KPiBUaGVy
ZSBpcyBhIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoIG9uIEJpZyBFbmRpYW4gbWFjaGluZXMsIHNl
ZSBiZWxvdy4KPgo+IE9uIFNhdCwgTWFyIDE5LCAyMDIyIGF0IDExOjU0OjUzQU0gKzA4MDAsIGd1
b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+PiBGcm9tOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4+Cj4+IFRoaXMgaXMgYSBzaW1wbGUsIGZhaXIgc3BpbmxvY2suICBTcGVj
aWZpY2FsbHkgaXQgZG9lc24ndCBoYXZlIGFsbCB0aGUKPj4gc3VidGxlIG1lbW9yeSBtb2RlbCBk
ZXBlbmRlbmNpZXMgdGhhdCBxc3BpbmxvY2sgaGFzLCB3aGljaCBtYWtlcyBpdCBtb3JlCj4+IHN1
aXRhYmxlIGZvciBzaW1wbGUgc3lzdGVtcyBhcyBpdCBpcyBtb3JlIGxpa2VseSB0byBiZSBjb3Jy
ZWN0Lgo+Pgo+PiBbUGFsbWVyOiBjb21taXQgdGV4dF0KPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+Cj4+IC0tCj4+Cj4+IEkgaGF2ZSBzcGVj
aWZpY2FsbHkgbm90IGluY2x1ZGVkIFBldGVyJ3MgU09CIG9uIHRoaXMsIGFzIGhlIHNlbnQgaGlz
Cj4+IG9yaWdpbmFsIHBhdGNoCj4+IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1lIYkJC
dVZGTm5JNGtqajNAaGlyZXoucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC8+Cj4+IHdpdGhvdXQg
b25lLgo+PiAtLS0KPj4gICBpbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrLmggICAgICAgICAg
fCAxMSArKystCj4+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9ja190eXBlcy5oICAgIHwg
MTUgKysrKysKPj4gICBpbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLXR5cGVzLmggfCAx
MSArKysrCj4+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oICAgICAgIHwgODYg
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
YXNtLWdlbmVyaWMvc3BpbmxvY2tfdHlwZXMuaAo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLXR5cGVzLmgKPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oCj4+Cj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Rp
Y2tldC1sb2NrLmgKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li41OTM3M2RlM2UzMmEKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9pbmNsdWRlL2FzbS1nZW5l
cmljL3RpY2tldC1sb2NrLmgKPiAuLi4KPgo+PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lk
IHRpY2tldF91bmxvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQo+PiArewo+PiArCXUxNiAqcHRy
ID0gKHUxNiAqKWxvY2sgKyBfX2lzX2RlZmluZWQoX19CSUdfRU5ESUFOKTsKPiBBcyBtZW50aW9u
ZWQsIHRoaXMgcGF0Y2ggc2VyaWVzIGJyZWFrcyBTTVAgb24gT3BlblJJU0MuICBJIHRyYWNlZCBp
dCB0byB0aGlzCj4gbGluZS4gIFRoZSBhYm92ZSBgX19pc19kZWZpbmVkKF9fQklHX0VORElBTilg
ICBkb2VzIG5vdCByZXR1cm4gMSBhcyBleHBlY3RlZAo+IGV2ZW4gb24gQklHX0VORElBTiBtYWNo
aW5lcy4gIFRoaXMgd29ya3M6Cj4KPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmlj
L3RpY2tldC1sb2NrLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLmgKPiBpbmRl
eCA1OTM3M2RlM2UzMmEuLjUyYjVkYzlmZmRiYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2FzbS1n
ZW5lcmljL3RpY2tldC1sb2NrLmgKPiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1s
b2NrLmgKPiBAQCAtMjYsNiArMjYsNyBAQAo+ICAgI2RlZmluZSBfX0FTTV9HRU5FUklDX1RJQ0tF
VF9MT0NLX0gKPiAgIAo+ICAgI2luY2x1ZGUgPGxpbnV4L2F0b21pYy5oPgo+ICsjaW5jbHVkZSA8
bGludXgva2NvbmZpZy5oPgo+ICAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL3RpY2tldC1sb2NrLXR5
cGVzLmg+Cj4gICAKPiAgIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0aWNrZXRfbG9jayhh
cmNoX3NwaW5sb2NrX3QgKmxvY2spCj4gQEAgLTUxLDcgKzUyLDcgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSBib29sIHRpY2tldF90cnlsb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiAgIAo+
ICAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHRpY2tldF91bmxvY2soYXJjaF9zcGlubG9j
a190ICpsb2NrKQo+ICAgewo+IC0gICAgICAgdTE2ICpwdHIgPSAodTE2ICopbG9jayArIF9faXNf
ZGVmaW5lZChfX0JJR19FTkRJQU4pOwo+ICsgICAgICAgdTE2ICpwdHIgPSAodTE2ICopbG9jayAr
IElTX0VOQUJMRUQoQ09ORklHX0NQVV9CSUdfRU5ESUFOKTsKPiAgICAgICAgICB1MzIgdmFsID0g
YXRvbWljX3JlYWQobG9jayk7Cj4gICAKPiAgICAgICAgICBzbXBfc3RvcmVfcmVsZWFzZShwdHIs
ICh1MTYpdmFsICsgMSk7Cj4KPgo+PiArCXUzMiB2YWwgPSBhdG9taWNfcmVhZChsb2NrKTsKPj4g
Kwo+PiArCXNtcF9zdG9yZV9yZWxlYXNlKHB0ciwgKHUxNil2YWwgKyAxKTsKPj4gK30KPj4gKwoK
X19CSUdfRU5ESUFOIGlzIGRlZmluZWQgaW4gPGxpbnV4L2tjb25maWcuaD4uIEkgYmVsaWV2ZSB0
aGF0IGlmIHlvdSAKaW5jbHVkZSA8bGludXgva2NvbmZpZy5oPiwgdGhlIHNlY29uZCBodW5rIGlz
IG5vdCByZWFsbHkgbmVlZGVkIGFuZCB2aWNlIAp2ZXJzYS4KCkNoZWVycywKTG9uZ21hbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
