Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B47A8E2A5E
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 08:24:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E96FE20723;
	Thu, 24 Oct 2019 08:24:19 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 7DA9A206B8
 for <openrisc@lists.librecores.org>; Mon, 21 Oct 2019 09:58:43 +0200 (CEST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5788521721
 for <openrisc@lists.librecores.org>; Mon, 21 Oct 2019 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571644721;
 bh=HaNxatOx3Yl+LjuXNZSg9j6rwSnjKUPc8eLVmd61SU0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=luHraHozlqKNUHwEUrw+p/CKnNkzg4GhLnRI3IQVw1ZUnmvt4Cwl7ABV+5EzHS34g
 CqVlZgKrjSy7nsjEnaLPBzt8i8/jWykyodKl+iP31wL1BC0A++0dn8emaiIgMxVUqa
 6AeBtKgvcbANkPSenLQVsuD5VltHn5JOl0JQoRvI=
Received: by mail-wr1-f48.google.com with SMTP id o28so12692571wro.7
 for <openrisc@lists.librecores.org>; Mon, 21 Oct 2019 00:58:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWnap9cyyEO9TguQmS8av2/LCE9V8vW2A8ZF21EbuuggB1ZVDps
 B294K4/2UDxXd8VjSt9i61+2eXZug5Pe9GFn9Cc=
X-Google-Smtp-Source: APXvYqzvF6HJCASpTMUMf7HweDv3Hno9oEAxiqhI3GBGEOPTWQrWQiETxVnKLeVHbQ3ma/xucSMvECIDZp2EBxJkKe8=
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr17344477wrn.24.1571644719802; 
 Mon, 21 Oct 2019 00:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-21-hch@lst.de>
In-Reply-To: <20191017174554.29840-21-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 21 Oct 2019 15:58:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ_VeBfi1uaafgtp+uA2skq-w2px12ig=5QD1O9J+PgbA@mail.gmail.com>
Message-ID: <CAJF2gTQ_VeBfi1uaafgtp+uA2skq-w2px12ig=5QD1O9J+PgbA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Thu, 24 Oct 2019 08:24:18 +0200
Subject: Re: [OpenRISC] [PATCH 20/21] csky: remove ioremap_cache
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gRnJpLCBPY3QgMTgsIDIw
MTkgYXQgMTo0NyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4KPiBO
byBkcml2ZXIgdGhhdCBjYW4gYmUgdXNlZCBvbiBjc2t5IHVzZXMgaW9yZW1hcF9jYWNoZSwgYW5k
IHRoaXMKPiBpbnRlcmZhY2UgaGFzIGJlZW4gZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBtZW1yZW1h
cC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0t
LQo+ICBhcmNoL2Nza3kvaW5jbHVkZS9hc20vaW8uaCB8IDIgLS0KPiAgYXJjaC9jc2t5L21tL2lv
cmVtYXAuYyAgICAgfCA3IC0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9jc2t5
L2luY2x1ZGUvYXNtL2lvLmgKPiBpbmRleCBhNGI5ZmI2MTZmYWEuLmY1NzI2MDVkNWFkNSAxMDA2
NDQKPiAtLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vaW8uaAo+ICsrKyBiL2FyY2gvY3NreS9p
bmNsdWRlL2FzbS9pby5oCj4gQEAgLTM2LDEzICszNiwxMSBAQAo+ICAvKgo+ICAgKiBJL08gbWVt
b3J5IG1hcHBpbmcgZnVuY3Rpb25zLgo+ICAgKi8KPiAtZXh0ZXJuIHZvaWQgX19pb21lbSAqaW9y
ZW1hcF9jYWNoZShwaHlzX2FkZHJfdCBhZGRyLCBzaXplX3Qgc2l6ZSk7Cj4gIGV4dGVybiB2b2lk
IF9faW9tZW0gKl9faW9yZW1hcChwaHlzX2FkZHJfdCBhZGRyLCBzaXplX3Qgc2l6ZSwgcGdwcm90
X3QgcHJvdCk7Cj4gIGV4dGVybiB2b2lkIGlvdW5tYXAodm9pZCAqYWRkcik7Cj4KPiAgI2RlZmlu
ZSBpb3JlbWFwKGFkZHIsIHNpemUpICAgICAgICAgICAgX19pb3JlbWFwKChhZGRyKSwgKHNpemUp
LCBwZ3Byb3Rfbm9uY2FjaGVkKFBBR0VfS0VSTkVMKSkKPiAgI2RlZmluZSBpb3JlbWFwX3djKGFk
ZHIsIHNpemUpICAgICAgICAgX19pb3JlbWFwKChhZGRyKSwgKHNpemUpLCBwZ3Byb3Rfd3JpdGVj
b21iaW5lKFBBR0VfS0VSTkVMKSkKPiAtI2RlZmluZSBpb3JlbWFwX2NhY2hlICAgICAgICAgICAg
ICAgICAgaW9yZW1hcF9jYWNoZQo+Cj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9pby5oPgo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9tbS9pb3JlbWFwLmMgYi9hcmNoL2Nza3kvbW0vaW9yZW1h
cC5jCj4gaW5kZXggZTEzY2QzNDk3NjI4Li5hZTc4MjU2YTU2ZmQgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9jc2t5L21tL2lvcmVtYXAuYwo+ICsrKyBiL2FyY2gvY3NreS9tbS9pb3JlbWFwLmMKPiBAQCAt
NDQsMTMgKzQ0LDYgQEAgdm9pZCBfX2lvbWVtICpfX2lvcmVtYXAocGh5c19hZGRyX3QgcGh5c19h
ZGRyLCBzaXplX3Qgc2l6ZSwgcGdwcm90X3QgcHJvdCkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKF9f
aW9yZW1hcCk7Cj4KPiAtdm9pZCBfX2lvbWVtICppb3JlbWFwX2NhY2hlKHBoeXNfYWRkcl90IHBo
eXNfYWRkciwgc2l6ZV90IHNpemUpCj4gLXsKPiAtICAgICAgIHJldHVybiBfX2lvcmVtYXBfY2Fs
bGVyKHBoeXNfYWRkciwgc2l6ZSwgUEFHRV9LRVJORUwsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwo+IC19Cj4gLUVYUE9SVF9T
WU1CT0woaW9yZW1hcF9jYWNoZSk7Cj4gLQo+ICB2b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVtICph
ZGRyKQo+ICB7Cj4gICAgICAgICB2dW5tYXAoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpYWRkciAm
IFBBR0VfTUFTSykpOwo+IC0tCj4gMi4yMC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVu
CgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
