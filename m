Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A39C3A057F
	for <lists+openrisc@lfdr.de>; Tue,  8 Jun 2021 23:05:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AE42523F13;
	Tue,  8 Jun 2021 23:05:26 +0200 (CEST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mail.librecores.org (Postfix) with ESMTPS id E2A5521016
 for <openrisc@lists.librecores.org>; Tue,  8 Jun 2021 17:14:21 +0200 (CEST)
Received: by mail-vk1-f177.google.com with SMTP id k189so237139vkb.6
 for <openrisc@lists.librecores.org>; Tue, 08 Jun 2021 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O1gHl02oivo3RqMJKlwA/A5dzOE7PgpnMHshZI9Ylrs=;
 b=q/pGziiOz9jkwf1xpb1EEOjAPz/8OP9lR8P5rwugXRCKdIw+1wS1ArDWbo56DTgYcO
 2xIIfHxWOdAkxjck+U0UFvbyJXLOxqC0e39gdVGuoyznrtl6Kqsbm0vXEM9F9Ph6UxlB
 rR5msRf1tYIkQmYvAoVpDNmbWTNV7I44HNDPmtNDKlNk0+jSHN0zTfRpSQal7ClgWNKL
 nt58hzE/ILIPgRy01To/yIbhd4Nn1FvYEU+6H+m4XZ6Yl5ZdcJKv99WcwWeAt69su8a1
 jHh7JWQyepBhzoAemaPXbFi97EGcaWlnBbUsAZgHFnVI4KURGRzpgTzD9HaiwUKNr0lJ
 8aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O1gHl02oivo3RqMJKlwA/A5dzOE7PgpnMHshZI9Ylrs=;
 b=N3fuwjRdxX+3yC/GHNu83sVE6KBLrTijOVxUxjFgdwa28dUpjP48Pum5xm4InC++oF
 3KAHO/VQpv1Egqkal8ktxEcRllx1+NLQ0CKj8r85ueHli/H+LBxttZYteBl50qPVEFzx
 0q/T+6zsZbaLXbtwEnbNXmrexY7B7T8CJ6E2aJmUfwQgu13U0J6JOrCFlc5A1WA1Bxg5
 nZ7CPX+umymLaqdUqHWHRy6TjkkhWXXPkRTt8Bz8yaKDUEhOjByunTELBvnNiH6p0GaK
 lCywSTg+8mEaIyKaUEIJx/q3ZJfl5XCtRX2apI9J49wR7iYjfdRA8yKlWK3HhgBXAzcg
 UsgA==
X-Gm-Message-State: AOAM532w/QoATLiPvU+YlEN7sV6MF81BCfH3R9VkP36HW9vBKzCQ8brg
 Ma1B4JbZK8V0v65nGIaaPPqgbSXeXvfJ2XNOpEA=
X-Google-Smtp-Source: ABdhPJzvEmzWuahJjCnq+ZMJixhpkm3KNp6kok+q20Al/eAGM2mP9WokEC+P56s7XJVWAW/iqzmnjaTihV1wlYq26Ug=
X-Received: by 2002:a05:6122:a1b:: with SMTP id 27mr387134vkn.23.1623165260736; 
 Tue, 08 Jun 2021 08:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
 <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
 <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
In-Reply-To: <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:44:08 +0530
Message-ID: <CAFqt6zbV32+FsEFywqb6vk90tQ442S63CO+bh=2h8OxxutYQEQ@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Tue, 08 Jun 2021 23:05:24 +0200
Subject: Re: [OpenRISC] [PATCH v3 resend 01/15] mm: add
 setup_initial_init_mm() helper
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-sh@vger.kernel.org,
 X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gOCwgMjAyMSBhdCA4OjI3IFBNIENocmlzdG9waGUgTGVyb3kKPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMDgvMDYvMjAyMSDDoCAxNjo1
MywgU291cHRpY2sgSm9hcmRlciBhIMOpY3JpdCA6Cj4gPiBPbiBUdWUsIEp1biA4LCAyMDIxIGF0
IDE6NTYgUE0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToK
PiA+Pgo+ID4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBoZWxwZXIgdG8gc2V0dXAga2Vy
bmVsIHRleHQsCj4gPj4gZGF0YSBhbmQgYnJrLgo+ID4+Cj4gPj4gQ2M6IGxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4gPj4gQ2M6IHVj
bGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPiA+PiBDYzogbGludXgtbTY4a0Bs
aXN0cy5saW51eC1tNjhrLm9yZwo+ID4+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9y
Zwo+ID4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+ID4+IENjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4gQ2M6IGxpbnV4LXNoQHZnZXIua2VybmVsLm9y
Zwo+ID4+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+ID4+IENjOiB4ODZAa2VybmVs
Lm9yZwo+ID4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGluY2x1ZGUvbGludXgvbW0uaCB8IDMgKysrCj4gPj4g
ICBtbS9pbml0LW1tLmMgICAgICAgfCA5ICsrKysrKysrKwo+ID4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
bS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPj4gaW5kZXggYzI3NGY3NWVmY2Y5Li4wMmFhMDU3
NTQwYjcgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gPj4gKysrIGIvaW5j
bHVkZS9saW51eC9tbS5oCj4gPj4gQEAgLTI0NCw2ICsyNDQsOSBAQCBpbnQgX19hZGRfdG9fcGFn
ZV9jYWNoZV9sb2NrZWQoc3RydWN0IHBhZ2UgKnBhZ2UsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nLAo+ID4+Cj4gPj4gICAjZGVmaW5lIGxydV90b19wYWdlKGhlYWQpIChsaXN0X2VudHJ5
KChoZWFkKS0+cHJldiwgc3RydWN0IHBhZ2UsIGxydSkpCj4gPj4KPiA+PiArdm9pZCBzZXR1cF9p
bml0aWFsX2luaXRfbW0odm9pZCAqc3RhcnRfY29kZSwgdm9pZCAqZW5kX2NvZGUsCj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZW5kX2RhdGEsIHZvaWQgKmJyayk7Cj4gPj4g
Kwo+ID4KPiA+IEdlbnRsZSBxdWVyeSAtPiBpcyB0aGVyZSBhbnkgbGltaXRhdGlvbiB0byBhZGQg
aW5saW5lIGZ1bmN0aW9ucyBpbgo+ID4gc2V0dXBfYXJjaCgpIGZ1bmN0aW9ucyA/Cj4KPiBLZWZl
bmcganVzdCBmb2xsb3dlZCBjb21tZW50IGZyb20gTWlrZSBJIGd1ZXNzLCBzZWUKPiBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjEwNjA0
MDcwNjMzLjMyMzYzLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vIzI2OTYyNTMKCk9rLgo+
Cj4gQ2hyaXN0b3BoZQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
