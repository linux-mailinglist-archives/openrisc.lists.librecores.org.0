Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3861E5050
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6C17C20CCE;
	Wed, 27 May 2020 23:19:45 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by mail.librecores.org (Postfix) with ESMTP id 09A8B20A41
 for <openrisc@lists.librecores.org>; Mon, 18 May 2020 20:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589826056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgUgYOhXHVrOhAbBYxlnYyhMzdekwGrXn9fI5GzJacU=;
 b=R02e7DTE6AfSGT/kUhzmH81a2fEJ34ufqbGIFaAWXoKyh0SMZ9MIko9KOY7BKG0o7gTdaq
 vE5ALxgIHTPL919QCmHQ4btR5vr4lHE0Q12t/fIsbCUQiJNBAp7f6UqXLiGPz0g0n+P0eu
 5oyquCeX6qaAQaeLejCDo3J7i0bVCA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-kVRrudnWNEOZ64966nyy_Q-1; Mon, 18 May 2020 14:20:52 -0400
X-MC-Unique: kVRrudnWNEOZ64966nyy_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428731005510;
 Mon, 18 May 2020 18:20:48 +0000 (UTC)
Received: from ovpn-115-234.rdu2.redhat.com (ovpn-115-234.rdu2.redhat.com
 [10.10.115.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF23398;
 Mon, 18 May 2020 18:20:43 +0000 (UTC)
Message-ID: <5260142047d0339e00d4a74865c2f0b7511c89f6.camel@redhat.com>
From: Mark Salter <msalter@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>,  Arnd Bergmann <arnd@arndb.de>, Roman Zippel
 <zippel@linux-m68k.org>
Date: Mon, 18 May 2020 14:20:42 -0400
In-Reply-To: <20200515143646.3857579-11-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
 <20200515143646.3857579-11-hch@lst.de>
Organization: Red Hat, Inc
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH 10/29] c6x: use asm-generic/cacheflush.h
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCAyMDIwLTA1LTE1IGF0IDE2OjM2ICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBDNnggbmVlZHMgYWxtb3N0IG5vIGNhY2hlIGZsdXNoaW5nIHJvdXRpbmVzIG9mIGl0cyBv
d24uICBSZWx5IG9uCj4gYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIGZvciB0aGUgZGVmYXVsdHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0t
Cj4gIGFyY2gvYzZ4L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDE5ICstLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxOCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9jNngvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJj
aC9jNngvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gaW5kZXggNDU0MGI0MDQ3NWU2Yy4uMTA5
MjJkNTI4ZGU2ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2M2eC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNo
LmgKPiArKysgYi9hcmNoL2M2eC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiBAQCAtMTYsMjEg
KzE2LDYgQEAKPiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gICNpbmNsdWRlIDxhc20vc3RyaW5n
Lmg+Cj4gIAo+IC0vKgo+IC0gKiB2aXJ0dWFsbHktaW5kZXhlZCBjYWNoZSBtYW5hZ2VtZW50IChv
dXIgY2FjaGUgaXMgcGh5c2ljYWxseSBpbmRleGVkKQo+IC0gKi8KPiAtI2RlZmluZSBmbHVzaF9j
YWNoZV9hbGwoKQkJCWRvIHt9IHdoaWxlICgwKQo+IC0jZGVmaW5lIGZsdXNoX2NhY2hlX21tKG1t
KQkJCWRvIHt9IHdoaWxlICgwKQo+IC0jZGVmaW5lIGZsdXNoX2NhY2hlX2R1cF9tbShtbSkJCQlk
byB7fSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9jYWNoZV9yYW5nZShtbSwgc3RhcnQsIGVu
ZCkJZG8ge30gd2hpbGUgKDApCj4gLSNkZWZpbmUgZmx1c2hfY2FjaGVfcGFnZSh2bWEsIHZtYWRk
ciwgcGZuKQlkbyB7fSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9jYWNoZV92bWFwKHN0YXJ0
LCBlbmQpCQlkbyB7fSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9jYWNoZV92dW5tYXAoc3Rh
cnQsIGVuZCkJCWRvIHt9IHdoaWxlICgwKQo+IC0jZGVmaW5lIEFSQ0hfSU1QTEVNRU5UU19GTFVT
SF9EQ0FDSEVfUEFHRSAwCj4gLSNkZWZpbmUgZmx1c2hfZGNhY2hlX3BhZ2UocGFnZSkJCQlkbyB7
fSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF9sb2NrKG1hcHBpbmcpCQlk
byB7fSB3aGlsZSAoMCkKPiAtI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF91bmxvY2sobWFwcGlu
ZykJZG8ge30gd2hpbGUgKDApCj4gLQo+ICAvKgo+ICAgKiBwaHlzaWNhbGx5LWluZGV4ZWQgY2Fj
aGUgbWFuYWdlbWVudAo+ICAgKi8KPiBAQCAtNDksMTQgKzM0LDEyIEBAIGRvIHsJCQkJCQkJCSAg
XAo+ICAJCQkodW5zaWduZWQgbG9uZykgcGFnZV9hZGRyZXNzKHBhZ2UpICsgUEFHRV9TSVpFKSk7
IFwKPiAgfSB3aGlsZSAoMCkKPiAgCj4gLQo+ICAjZGVmaW5lIGNvcHlfdG9fdXNlcl9wYWdlKHZt
YSwgcGFnZSwgdmFkZHIsIGRzdCwgc3JjLCBsZW4pIFwKPiAgZG8gewkJCQkJCSAgICAgXAo+ICAJ
bWVtY3B5KGRzdCwgc3JjLCBsZW4pOwkJCSAgICAgXAo+ICAJZmx1c2hfaWNhY2hlX3JhbmdlKCh1
bnNpZ25lZCkgKGRzdCksICh1bnNpZ25lZCkgKGRzdCkgKyAobGVuKSk7IFwKPiAgfSB3aGlsZSAo
MCkKPiAgCj4gLSNkZWZpbmUgY29weV9mcm9tX3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZhZGRyLCBk
c3QsIHNyYywgbGVuKSBcCj4gLQltZW1jcHkoZHN0LCBzcmMsIGxlbikKPiArI2luY2x1ZGUgPGFz
bS1nZW5lcmljL2NhY2hlZmx1c2guaD4KPiAgCj4gICNlbmRpZiAvKiBfQVNNX0M2WF9DQUNIRUZM
VVNIX0ggKi8KCkFja2VkLWJ5OiBNYXJrIFNhbHRlciA8bXNhbHRlckByZWRoYXQuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
