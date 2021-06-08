Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DB0943A057E
	for <lists+openrisc@lfdr.de>; Tue,  8 Jun 2021 23:05:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 61312235FF;
	Tue,  8 Jun 2021 23:05:26 +0200 (CEST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mail.librecores.org (Postfix) with ESMTPS id 1F5622045C
 for <openrisc@lists.librecores.org>; Tue,  8 Jun 2021 16:53:52 +0200 (CEST)
Received: by mail-vs1-f51.google.com with SMTP id y207so2642906vsy.12
 for <openrisc@lists.librecores.org>; Tue, 08 Jun 2021 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AJ2s6Swi7DKePDYPTjpM9W7XfKGuXx2NmxnXLQgYSU=;
 b=rU2pKJ75Y3/QHhh8al8WEHFkA1xcRM5SZMWEuWTFwhfJJj/V+31x/44DQ1/ocvOPg+
 HHLB+cX2JzVE7e8VyhwDv4Qz2FVNR+zh+m0OixPYjyc4fzjuukhztIpMy0r4QCqs9ENM
 rx2wn2LyftAjOv4hRMViR3COc1TqDPy9Jwcq9YGNqCboxfBQc5R+uHuQkEmoWcUMg/uD
 GgTRTBH9LOsD2SMP7YGpIDk7kjlQlU6IpzX1idxEjiKF6VTF7R6q/SsI4HkaBei2kO/c
 foGKHLzxbvnAfZr24OLQ0mXOUtMYfCqu0p3aPHXa31jtaApPg9eDz4MFF332lbCsxpOF
 vhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AJ2s6Swi7DKePDYPTjpM9W7XfKGuXx2NmxnXLQgYSU=;
 b=IuiLIiE6K1j9vn5JNpb0ANVu14HF5JG993nSwj7FH7cicQKu68jhsJfs3Jcp+YrqMt
 Pf5yIirob+hqXm24GHSG7VnERgMvLqOiCegt3IXWhnCQhQGreEQiF6bEqp57CKFdxAFA
 uzL/qr7LCPGx46qvmsypYsS6idEQqNA07sqjilmF5MMoswtg5r0jvB5CK+LXm5EMHDjj
 dEiiShFgSvEzHmw6SkyXAzFkLmSr6AxSOByhu/w599Brx6ZfW35alruAIcGdZB5jbed2
 r1tkxJK2ji8fVlIJ1iexqpz1f/SZmxX77LfMOgXSIJ/2y3O4IOm8aNiSX+KCu6kuHRQm
 hrSQ==
X-Gm-Message-State: AOAM5309Uparnq2lj0T7U46l96UbyRcvqJiQsdI5f6aNFk9ZLiMwvFhM
 +CF/C/vUvDXSGndXjHuQVlm3msufKA6g2F/ulto=
X-Google-Smtp-Source: ABdhPJyRLWrfWEbRY82WKzbAaqxe+Tz0Rq9l4OoSLSgaPe9ZQ71sH6V/8n9uYyj4peJXY7ySMuwi8lVHUHfIxXWhTlU=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr149235vsp.59.1623164030307;
 Tue, 08 Jun 2021 07:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20210608083418.137226-2-wangkefeng.wang@huawei.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:23:38 +0530
Message-ID: <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
 linux-sh@vger.kernel.org, X86 ML <x86@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gOCwgMjAyMSBhdCAxOjU2IFBNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndh
bmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc2V0dXBfaW5pdGlhbF9pbml0X21tKCkgaGVs
cGVyIHRvIHNldHVwIGtlcm5lbCB0ZXh0LAo+IGRhdGEgYW5kIGJyay4KPgo+IENjOiBsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1jc2t5QHZnZXIua2VybmVsLm9yZwo+IENjOiB1Y2xp
bnV4LWg4LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLmpwCj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMu
bGludXgtbTY4ay5vcmcKPiBDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKPiBDYzog
bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IENjOiBsaW51eC1zaEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtczM5
MEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogeDg2QGtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBL
ZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUv
bGludXgvbW0uaCB8IDMgKysrCj4gIG1tL2luaXQtbW0uYyAgICAgICB8IDkgKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+IGluZGV4IGMyNzRmNzVlZmNmOS4u
MDJhYTA1NzU0MGI3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbW0uaAo+IEBAIC0yNDQsNiArMjQ0LDkgQEAgaW50IF9fYWRkX3RvX3BhZ2Vf
Y2FjaGVfbG9ja2VkKHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFw
cGluZywKPgo+ICAjZGVmaW5lIGxydV90b19wYWdlKGhlYWQpIChsaXN0X2VudHJ5KChoZWFkKS0+
cHJldiwgc3RydWN0IHBhZ2UsIGxydSkpCj4KPiArdm9pZCBzZXR1cF9pbml0aWFsX2luaXRfbW0o
dm9pZCAqc3RhcnRfY29kZSwgdm9pZCAqZW5kX2NvZGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqZW5kX2RhdGEsIHZvaWQgKmJyayk7Cj4gKwoKR2VudGxlIHF1ZXJ5IC0+IGlz
IHRoZXJlIGFueSBsaW1pdGF0aW9uIHRvIGFkZCBpbmxpbmUgZnVuY3Rpb25zIGluCnNldHVwX2Fy
Y2goKSBmdW5jdGlvbnMgPwoKPiAgLyoKPiAgICogTGludXgga2VybmVsIHZpcnR1YWwgbWVtb3J5
IG1hbmFnZXIgcHJpbWl0aXZlcy4KPiAgICogVGhlIGlkZWEgYmVpbmcgdG8gaGF2ZSBhICJ2aXJ0
dWFsIiBtbSBpbiB0aGUgc2FtZSB3YXkKPiBkaWZmIC0tZ2l0IGEvbW0vaW5pdC1tbS5jIGIvbW0v
aW5pdC1tbS5jCj4gaW5kZXggMTUzMTYyNjY5ZjgwLi5iNGE2ZjM4ZmI1MWQgMTAwNjQ0Cj4gLS0t
IGEvbW0vaW5pdC1tbS5jCj4gKysrIGIvbW0vaW5pdC1tbS5jCj4gQEAgLTQwLDMgKzQwLDEyIEBA
IHN0cnVjdCBtbV9zdHJ1Y3QgaW5pdF9tbSA9IHsKPiAgICAgICAgIC5jcHVfYml0bWFwICAgICA9
IENQVV9CSVRTX05PTkUsCj4gICAgICAgICBJTklUX01NX0NPTlRFWFQoaW5pdF9tbSkKPiAgfTsK
PiArCj4gK3ZvaWQgc2V0dXBfaW5pdGlhbF9pbml0X21tKHZvaWQgKnN0YXJ0X2NvZGUsIHZvaWQg
KmVuZF9jb2RlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmVuZF9kYXRhLCB2
b2lkICpicmspCj4gK3sKPiArICAgICAgIGluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNpZ25lZCBs
b25nKXN0YXJ0X2NvZGU7Cj4gKyAgICAgICBpbml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxv
bmcpZW5kX2NvZGU7Cj4gKyAgICAgICBpbml0X21tLmVuZF9kYXRhID0gKHVuc2lnbmVkIGxvbmcp
ZW5kX2RhdGE7Cj4gKyAgICAgICBpbml0X21tLmJyayA9ICh1bnNpZ25lZCBsb25nKWJyazsKPiAr
fQo+IC0tCj4gMi4yNi4yCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
