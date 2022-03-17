Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A6B584DD00D
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 22:20:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5A515242E4;
	Thu, 17 Mar 2022 22:20:45 +0100 (CET)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by mail.librecores.org (Postfix) with ESMTPS id 5366B247D7
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 12:10:12 +0100 (CET)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nUo0i-0007fY-TN; Thu, 17 Mar 2022 12:09:40 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
Date: Thu, 17 Mar 2022 12:09:39 +0100
Message-ID: <11364105.8ZH9dyz9j6@diego>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Mar 2022 22:20:44 +0100
Subject: Re: [OpenRISC] [PATCH 0/5] Generic Ticket Spinlocks
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
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 mingo@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGksCgpBbSBEb25uZXJzdGFnLCAxNy4gTcOkcnogMjAyMiwgMDA6MjU6NTUgQ0VUIHNjaHJpZWIg
UGFsbWVyIERhYmJlbHQ6Cj4gUGV0ZXIgc2VudCBhbiBSRkMgb3V0IGFib3V0IGEgeWVhciBhZ28K
PiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramozQGhpcmV6LnBy
b2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvPiwKPiBidXQgYWZ0ZXIgYSBzcGlyaXRlZCBkaXNjdXNz
aW9uIGl0IGxvb2tzIGxpa2Ugd2UgbG9zdCB0cmFjayBvZiB0aGluZ3MuCj4gSUlSQyB0aGVyZSB3
YXMgYnJvYWQgY29uc2Vuc3VzIG9uIHRoaXMgYmVpbmcgdGhlIHdheSB0byBnbywgYnV0IHRoZXJl
Cj4gd2FzIGEgbG90IG9mIGRpc2N1c3Npb24gc28gSSB3YXNuJ3Qgc3VyZS4gIEdpdmVuIHRoYXQg
aXQncyBiZWVuIGEgeWVhciwKPiBJIGZpZ3VyZWQgaXQnZCBiZSBiZXN0IHRvIGp1c3Qgc2VuZCB0
aGlzIG91dCBhZ2FpbiBmb3JtYXR0ZWQgYSBiaXQgbW9yZQo+IGV4cGxpY2l0bHkgYXMgYSBwYXRj
aC4KPiAKPiBUaGlzIGhhcyBoYWQgYWxtb3N0IG5vIHRlc3RpbmcgKGp1c3QgYSBidWlsZCB0ZXN0
IG9uIFJJU0MtViBkZWZjb25maWcpLAo+IGJ1dCBJIHdhbnRlZCB0byBzZW5kIGl0IG91dCBsYXJn
ZWx5IGFzLWlzIGJlY2F1c2UgSSBkaWRuJ3QgaGF2ZSBhIFNPQgo+IGZyb20gUGV0ZXIgb24gdGhl
IGNvZGUuICBJIGhhZCBzZW50IGFyb3VuZCBzb21ldGhpbmcgc29ydCBvZiBzaW1pbGFyIGluCj4g
c3Bpcml0LCBidXQgdGhpcyBsb29rcyBjb21wbGV0ZWx5IHJlLXdyaXR0ZW4uICBKdXN0IHRvIHBs
YXkgaXQgc2FmZSBJCj4gd2FudGVkIHRvIHNlbmQgb3V0IGFsbW9zdCBleGFjdGx5IGFzIGl0IHdh
cyBwb3N0ZWQuICBJJ2QgcHJvYmFibHkgcmVuYW1lCj4gdGhpcyB0c3BpbmxvY2sgYW5kIHRzcGlu
bG9ja190eXBlcywgYXMgdGhlIG1pcy1tYXRjaCBraW5kIG9mIG1ha2VzIG15Cj4gZXllcyBnbyBm
dW5ueSwgYnV0IEkgZG9uJ3QgcmVhbGx5IGNhcmUgdGhhdCBtdWNoLiAgSSdsbCBhbHNvIGdvIHRo
cm91Z2gKPiB0aGUgb3RoZXIgcG9ydHMgYW5kIHNlZSBpZiB0aGVyZSdzIGFueSBtb3JlIGNhbmRp
ZGF0ZXMsIEkgc2VlbSB0bwo+IHJlbWVtYmVyIHRoZXJlIGhhdmluZyBiZWVuIG1vcmUgdGhhbiBq
dXN0IE9wZW5SSVNDIGJ1dCBpdCdzIGJlZW4gYQo+IHdoaWxlLgo+IAo+IEknbSBpbiBubyBiaWcg
cnVzaCBmb3IgdGhpcyBhbmQgZ2l2ZW4gdGhlIGNvbXBsZXggSFcgZGVwZW5kZW5jaWVzIEkKPiB0
aGluayBpdCdzIGJlc3QgdG8gdGFyZ2V0IGl0IGZvciA1LjE5LCB0aGF0J2QgZ2l2ZSB1cyBhIGZ1
bGwgbWVyZ2UKPiB3aW5kb3cgZm9yIGZvbGtzIHRvIHRlc3QvYmVuY2htYXJrIGl0IG9uIHRoZWly
IHN5c3RlbXMgdG8gbWFrZSBzdXJlIGl0J3MKPiBPSy4gIFJJU0MtViBoYXMgYSBmb3J3YXJkIHBy
b2dyZXNzIGd1YXJhbnRlZSBzbyB3ZSBzaG91bGQgYmUgc2FmZSwgYnV0Cj4gdGhlc2UgY2FuIGFs
d2F5cyB0cmlwIHRoaW5ncyB1cC4KCkkndmUgdGVzdGVkIHRoaXMgb24gYm90aCB0aGUgUWVtdS1W
aXJ0IG1hY2hpbmUgYXMgd2VsbCBhcyB0aGUKQWxsd2lubmVyIE5lemhhIGJvYXJkICh3aXRoIGEg
RDEgU29DKS4KCkJvdGggb2YgdGhvc2UgYXJlIG9mIGNvdXJzZSBub3QgbmVjZXNzYXJpbHkgdGhl
IGJlc3QgcGxhdGZvcm1zCmZvciBiZW5jaG1hcmtzIEkgZ3Vlc3MsIGFzIGZyb20gd2hhdCBJIGdh
dGhlcmVkIGJlZm9yZSBJJ2QgbmVlZApuZWVkIG11bHRpcGxlIGNvcmVzIHRvIGFjdHVhbGx5IGdl
dCBpbnRlcmVzdGluZyBtZWFzdXJlbWVudHMgd2hlbgpjb21wYXJpbmcgZGlmZmVyZW50IGltcGxl
bWVudGF0aW9ucy4gQnV0IGF0IGxlYXN0IGV2ZXJ5dGhpbmcgdGhhdAp3b3JrZWQgYmVmb3JlIHN0
aWxsIHdvcmtzIHdpdGggdGhpcyBzZXJpZXMgOy0pCgoKU28sIFNlcmllcwpUZXN0ZWQtYnk6IEhl
aWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKSGVpa28KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
