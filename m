Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A7AA124609D
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C367920272;
	Mon, 17 Aug 2020 10:45:43 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id 8B66720AF7
 for <openrisc@lists.librecores.org>; Thu, 30 Jul 2020 03:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596074076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRu2DjMF0v0Jv3loZnZu2suQTSJCldR+3yWZSkhX+qw=;
 b=WPEioIaUVuT+NXE+mbDAAoYgyszkhwTBNFKCjBxYVVL9b5eej71Tz/jno9YwO9mYf/jKLr
 xF5DiZFUAsSSwVLtMqCL3P/zxV5aYd+ScBHlGrJoXztQWM4yXS7CeatxRxpszbLrghhZ04
 kNLbRDYZUPxM1ZI6kYeq783wR9lAHrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-MKISxg0TPU6a-4FvLzbZhQ-1; Wed, 29 Jul 2020 21:54:32 -0400
X-MC-Unique: MKISxg0TPU6a-4FvLzbZhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6832D1005510;
 Thu, 30 Jul 2020 01:54:27 +0000 (UTC)
Received: from localhost (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56EE9619B5;
 Thu, 30 Jul 2020 01:54:26 +0000 (UTC)
Date: Thu, 30 Jul 2020 09:54:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200730015424.GJ14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-11-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-11-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 10/15] memblock: make memblock_debug and
 related functionality private
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDcvMjgvMjAgYXQgMDg6MTFhbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhlIG9ubHkgdXNlciBvZiBtZW1i
bG9ja19kYmcoKSBvdXRzaWRlIG1lbWJsb2NrIHdhcyBzMzkwIHNldHVwIGNvZGUgYW5kIGl0Cj4g
aXMgY29udmVydGVkIHRvIHVzZSBwcl9kZWJ1ZygpIGluc3RlYWQuCj4gVGhpcyBhbGxvd3MgdG8g
c3RvcCBleHBvc2luZyBtZW1ibG9ja19kZWJ1ZyBhbmQgbWVtYmxvY2tfZGJnKCkgdG8gdGhlIHJl
c3QKPiBvZiB0aGUga2VybmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJw
cHRAbGludXguaWJtLmNvbT4KPiAtLS0KPiAgYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jIHwgIDQg
KystLQo+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggfCAxMiArLS0tLS0tLS0tLS0KPiAgbW0v
bWVtYmxvY2suYyAgICAgICAgICAgIHwgMTMgKysrKysrKysrKystLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKTmljZSBjbGVhbiB1cC4KClJl
dmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYwo+IGlu
ZGV4IDA3YWExNWJhNDNiMy4uOGIyODRjZjZlMTk5IDEwMDY0NAo+IC0tLSBhL2FyY2gvczM5MC9r
ZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYwo+IEBAIC03NzYs
OCArNzc2LDggQEAgc3RhdGljIHZvaWQgX19pbml0IG1lbWJsb2NrX2FkZF9tZW1fZGV0ZWN0X2lu
Zm8odm9pZCkKPiAgCXVuc2lnbmVkIGxvbmcgc3RhcnQsIGVuZDsKPiAgCWludCBpOwo+ICAKPiAt
CW1lbWJsb2NrX2RiZygicGh5c21lbSBpbmZvIHNvdXJjZTogJXMgKCVoaGQpXG4iLAo+IC0JCSAg
ICAgZ2V0X21lbV9pbmZvX3NvdXJjZSgpLCBtZW1fZGV0ZWN0LmluZm9fc291cmNlKTsKPiArCXBy
X2RlYnVnKCJwaHlzbWVtIGluZm8gc291cmNlOiAlcyAoJWhoZClcbiIsCj4gKwkJIGdldF9tZW1f
aW5mb19zb3VyY2UoKSwgbWVtX2RldGVjdC5pbmZvX3NvdXJjZSk7Cj4gIAkvKiBrZWVwIG1lbWJs
b2NrIGxpc3RzIGNsb3NlIHRvIHRoZSBrZXJuZWwgKi8KPiAgCW1lbWJsb2NrX3NldF9ib3R0b21f
dXAodHJ1ZSk7Cj4gIAlmb3JfZWFjaF9tZW1fZGV0ZWN0X2Jsb2NrKGksICZzdGFydCwgJmVuZCkg
ewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggYi9pbmNsdWRlL2xpbnV4
L21lbWJsb2NrLmgKPiBpbmRleCAyMjBiNWYwZGFkNDIuLmU2YTIzYjNkYjY5NiAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21lbWJs
b2NrLmgKPiBAQCAtOTAsNyArOTAsNiBAQCBzdHJ1Y3QgbWVtYmxvY2sgewo+ICB9Owo+ICAKPiAg
ZXh0ZXJuIHN0cnVjdCBtZW1ibG9jayBtZW1ibG9jazsKPiAtZXh0ZXJuIGludCBtZW1ibG9ja19k
ZWJ1ZzsKPiAgCj4gICNpZm5kZWYgQ09ORklHX0FSQ0hfS0VFUF9NRU1CTE9DSwo+ICAjZGVmaW5l
IF9faW5pdF9tZW1ibG9jayBfX21lbWluaXQKPiBAQCAtMTAyLDkgKzEwMSw2IEBAIHZvaWQgbWVt
YmxvY2tfZGlzY2FyZCh2b2lkKTsKPiAgc3RhdGljIGlubGluZSB2b2lkIG1lbWJsb2NrX2Rpc2Nh
cmQodm9pZCkge30KPiAgI2VuZGlmCj4gIAo+IC0jZGVmaW5lIG1lbWJsb2NrX2RiZyhmbXQsIC4u
LikgXAo+IC0JaWYgKG1lbWJsb2NrX2RlYnVnKSBwcmludGsoS0VSTl9JTkZPIHByX2ZtdChmbXQp
LCAjI19fVkFfQVJHU19fKQo+IC0KPiAgcGh5c19hZGRyX3QgbWVtYmxvY2tfZmluZF9pbl9yYW5n
ZShwaHlzX2FkZHJfdCBzdGFydCwgcGh5c19hZGRyX3QgZW5kLAo+ICAJCQkJICAgcGh5c19hZGRy
X3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpZ24pOwo+ICB2b2lkIG1lbWJsb2NrX2FsbG93X3Jlc2l6
ZSh2b2lkKTsKPiBAQCAtNDU2LDEzICs0NTIsNyBAQCBib29sIG1lbWJsb2NrX2lzX3JlZ2lvbl9t
ZW1vcnkocGh5c19hZGRyX3QgYmFzZSwgcGh5c19hZGRyX3Qgc2l6ZSk7Cj4gIGJvb2wgbWVtYmxv
Y2tfaXNfcmVzZXJ2ZWQocGh5c19hZGRyX3QgYWRkcik7Cj4gIGJvb2wgbWVtYmxvY2tfaXNfcmVn
aW9uX3Jlc2VydmVkKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90IHNpemUpOwo+ICAKPiAt
ZXh0ZXJuIHZvaWQgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lkKTsKPiAtCj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBtZW1ibG9ja19kdW1wX2FsbCh2b2lkKQo+IC17Cj4gLQlpZiAobWVtYmxvY2tfZGVi
dWcpCj4gLQkJX19tZW1ibG9ja19kdW1wX2FsbCgpOwo+IC19Cj4gK3ZvaWQgbWVtYmxvY2tfZHVt
cF9hbGwodm9pZCk7Cj4gIAo+ICAvKioKPiAgICogbWVtYmxvY2tfc2V0X2N1cnJlbnRfbGltaXQg
LSBTZXQgdGhlIGN1cnJlbnQgYWxsb2NhdGlvbiBsaW1pdCB0byBhbGxvdwo+IGRpZmYgLS1naXQg
YS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwo+IGluZGV4IGE1YjliM2RmODFmYy4uODI0
OTM4ODQ5ZjZkIDEwMDY0NAo+IC0tLSBhL21tL21lbWJsb2NrLmMKPiArKysgYi9tbS9tZW1ibG9j
ay5jCj4gQEAgLTEzNCw3ICsxMzQsMTAgQEAgc3RydWN0IG1lbWJsb2NrIG1lbWJsb2NrIF9faW5p
dGRhdGFfbWVtYmxvY2sgPSB7Cj4gIAkgICAgIGkgPCBtZW1ibG9ja190eXBlLT5jbnQ7CQkJCQlc
Cj4gIAkgICAgIGkrKywgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbaV0pCj4gIAo+IC1p
bnQgbWVtYmxvY2tfZGVidWcgX19pbml0ZGF0YV9tZW1ibG9jazsKPiArI2RlZmluZSBtZW1ibG9j
a19kYmcoZm10LCAuLi4pIFwKPiArCWlmIChtZW1ibG9ja19kZWJ1ZykgcHJpbnRrKEtFUk5fSU5G
TyBwcl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXykKPiArCj4gK3N0YXRpYyBpbnQgbWVtYmxvY2tf
ZGVidWcgX19pbml0ZGF0YV9tZW1ibG9jazsKPiAgc3RhdGljIGJvb2wgc3lzdGVtX2hhc19zb21l
X21pcnJvciBfX2luaXRkYXRhX21lbWJsb2NrID0gZmFsc2U7Cj4gIHN0YXRpYyBpbnQgbWVtYmxv
Y2tfY2FuX3Jlc2l6ZSBfX2luaXRkYXRhX21lbWJsb2NrOwo+ICBzdGF0aWMgaW50IG1lbWJsb2Nr
X21lbW9yeV9pbl9zbGFiIF9faW5pdGRhdGFfbWVtYmxvY2sgPSAwOwo+IEBAIC0xOTE5LDcgKzE5
MjIsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXRfbWVtYmxvY2sgbWVtYmxvY2tfZHVtcChzdHJ1Y3Qg
bWVtYmxvY2tfdHlwZSAqdHlwZSkKPiAgCX0KPiAgfQo+ICAKPiAtdm9pZCBfX2luaXRfbWVtYmxv
Y2sgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lkKQo+ICtzdGF0aWMgdm9pZCBfX2luaXRfbWVtYmxv
Y2sgX19tZW1ibG9ja19kdW1wX2FsbCh2b2lkKQo+ICB7Cj4gIAlwcl9pbmZvKCJNRU1CTE9DSyBj
b25maWd1cmF0aW9uOlxuIik7Cj4gIAlwcl9pbmZvKCIgbWVtb3J5IHNpemUgPSAlcGEgcmVzZXJ2
ZWQgc2l6ZSA9ICVwYVxuIiwKPiBAQCAtMTkzMyw2ICsxOTM2LDEyIEBAIHZvaWQgX19pbml0X21l
bWJsb2NrIF9fbWVtYmxvY2tfZHVtcF9hbGwodm9pZCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4gK3Zv
aWQgX19pbml0X21lbWJsb2NrIG1lbWJsb2NrX2R1bXBfYWxsKHZvaWQpCj4gK3sKPiArCWlmICht
ZW1ibG9ja19kZWJ1ZykKPiArCQlfX21lbWJsb2NrX2R1bXBfYWxsKCk7Cj4gK30KPiArCj4gIHZv
aWQgX19pbml0IG1lbWJsb2NrX2FsbG93X3Jlc2l6ZSh2b2lkKQo+ICB7Cj4gIAltZW1ibG9ja19j
YW5fcmVzaXplID0gMTsKPiAtLSAKPiAyLjI2LjIKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
