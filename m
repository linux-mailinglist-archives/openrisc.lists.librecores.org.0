Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0694BDA3C
	for <lists+openrisc@lfdr.de>; Mon, 21 Feb 2022 15:31:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B8A51247AF;
	Mon, 21 Feb 2022 15:31:55 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 8290E24785
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 15:31:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42CC960F02
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 14:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F18C340F0
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645453911;
 bh=12Bbx9GqAhHL6qqDyToeCYzPAWe2m8+m6+gTGV+hFTw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kzJ4oJ7uqkQlH8HKP59hga7BxTSd9yAv9G83J3PE9Vxo9wgwCF55WEif4JDuq66Es
 xJHgiAYKMSMrCA+rbeIjmKJKM3SV0fBLyOZsQa95vK8cdEppsgKEikoB+c9hrTgPD6
 N3/wnjEuF/+t+ByBpKQN3Dzq1OrIxHrSb4YNAPOcfEv6v4f/QcpswnD2hOYaY7e5ZR
 P2yzCaocscWCwjSY0LU/aagBUySQOBShLiiZAXM9rLdNx4Mpjcu34oGUvRfmZEBPw+
 VjJykXvvmkBWqCNmRXcJeDSqWyibRwN4/9udBAhduxi7qzsuFLGNxd5SxW6ohLqgwt
 B42/CscfKu6MA==
Received: by mail-ed1-f51.google.com with SMTP id m3so23797161eda.10
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 06:31:51 -0800 (PST)
X-Gm-Message-State: AOAM530pP+/8juxJwIpykgvg/1eeY7MCqMm5F5IRfB5YDxLQ/MhMLqdj
 cJgXkp+3O9h85wmKisMa+1FhpqRZvyya5M6zj/4=
X-Google-Smtp-Source: ABdhPJwkamQNFHYmlXBqgC6u1r1MKNMeB6x6hm57ILAz8yVFLOW/Qf4lv8t2aLUhrb2kSK2FAx/PKmoUpYjfFDbRcw0=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr16170850wri.219.1645453899581; Mon, 21
 Feb 2022 06:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
In-Reply-To: <20220221132456.GA7139@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 21 Feb 2022 15:31:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
Message-ID: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [OpenRISC] [PATCH v2 09/18] mips: use simpler access_ok()
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgMjoyNCBQTSBUaG9tYXMgQm9nZW5kb2VyZmVyCjx0c2Jv
Z2VuZEBhbHBoYS5mcmFua2VuLmRlPiB3cm90ZToKPiBPbiBXZWQsIEZlYiAxNiwgMjAyMiBhdCAw
MjoxMzoyM1BNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL21pcHMvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNt
L3VhY2Nlc3MuaAo+ID4gaW5kZXggZGI5YThlMDAyYjYyLi5kN2M4OWRjMzQyNmMgMTAwNjQ0Cj4K
PiB0aGlzIGRvZXNuJ3Qgd29yay4gRm9yIGV2ZXJ5IGFjY2VzcyBhYm92ZSBtYXhpbXVtIGltcGxl
bWVudGVkIHZpcnR1YWwgYWRkcmVzcwo+IHNwYWNlIG9mIHRoZSBDUFUgYW4gYWRkcmVzcyBlcnJv
ciB3aWxsIGJlIGlzc3VlZCwgYnV0IG5vdCBhIFRMQiBtaXNzLgo+IEFuZCBhZGRyZXNzIGVycm9y
IGlzbid0IGFibGUgdG8gaGFuZGxlIHRoaXMgc2l0dWF0aW9uLgoKQWgsIHNvIHRoZSBfX2V4X3Rh
YmxlIGVudHJ5IG9ubHkgY2F0Y2hlcyBUTEIgbWlzc2VzPwoKRG9lcyB0aGlzIG1lYW4gaXQgYWxz
byB0cmFwcyBmb3Iga2VybmVsIG1lbW9yeSBhY2Nlc3Nlcywgb3IgZG8gdGhvc2UKd29yayBhZ2Fp
bj8gSWYgdGhlIGFkZHJlc3NlcyBvbiBtaXBzNjQgYXJlIHNlcGFyYXRlIGxpa2Ugb24Kc3BhcmM2
NCBvciBzMzkwLCB0aGUgZW50aXJlIGFjY2Vzc19vaygpIHN0ZXAgY291bGQgYmUgcmVwbGFjZWQK
YnkgYSBmaXh1cCBjb2RlIGluIHRoZSBleGNlcHRpb24gaGFuZGxlci4gSSBzdXBwb3NlIHRoaXMg
ZGVwZW5kcyBvbgpDT05GSUdfRVZBIGFuZCB5b3Ugc3RpbGwgbmVlZCBhIGxpbWl0IGNoZWNrIGF0
IGxlYXN0IHdoZW4gRVZBIGlzCmRpc2FibGVkLgoKPiBXaXRoIHRoaXMgcGF0Y2gKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL21pcHMva2VybmVsL3VuYWxpZ25lZC5jIGIvYXJjaC9taXBzL2tlcm5lbC91
bmFsaWduZWQuYwo+IGluZGV4IGRmNGI3MDhjMDRhOS4uMzkxMWYxNDgxZjNkIDEwMDY0NAo+IC0t
LSBhL2FyY2gvbWlwcy9rZXJuZWwvdW5hbGlnbmVkLmMKPiArKysgYi9hcmNoL21pcHMva2VybmVs
L3VuYWxpZ25lZC5jCj4gQEAgLTE0ODAsNiArMTQ4MCwxMyBAQCBhc21saW5rYWdlIHZvaWQgZG9f
YWRlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAgICAgICAgcHJldl9zdGF0ZSA9IGV4Y2VwdGlv
bl9lbnRlcigpOwo+ICAgICAgICAgcGVyZl9zd19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVO
VF9GQVVMVFMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgMSwgcmVncywgcmVncy0+Y3AwX2Jh
ZHZhZGRyKTsKPiArCj4gKyAgICAgICAvKiBBcmUgd2UgcHJlcGFyZWQgdG8gaGFuZGxlIHRoaXMg
a2VybmVsIGZhdWx0PyAgKi8KPiArICAgICAgIGlmIChmaXh1cF9leGNlcHRpb24ocmVncykpIHsK
PiArICAgICAgICAgICAgICAgY3VycmVudC0+dGhyZWFkLmNwMF9iYWR1YWRkciA9IHJlZ3MtPmNw
MF9iYWR2YWRkcjsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsKPiAg
ICAgICAgIC8qCj4gICAgICAgICAgKiBEaWQgd2UgY2F0Y2ggYSBmYXVsdCB0cnlpbmcgdG8gbG9h
ZCBhbiBpbnN0cnVjdGlvbj8KPiAgICAgICAgICAqLwo+Cj4gSSBhdCBsZWFzdCBnZXQgbXkgc2lt
cGxlIHRlc3QgY2FzZXMgZml4ZWQsIGJ1dCBJJ20gbm90IHN1cmUgdGhpcyBpcwo+IGNvcnJlY3Qu
Cj4KPiBJcyB0aGVyZSBhIHJlYXNvbiB0byBub3QgYWxzbyAjZGVmaW5lIFRBU0tfU0laRV9NQVgg
ICBfX1VBX0xJTUlUIGxpa2UKPiBmb3IgdGhlIDMyYml0IGNhc2UgPwo+CgpGb3IgMzItYml0LCB0
aGUgX19VQV9MSU1JVCBpcyBhIGNvbXBpbGUtdGltZSBjb25zdGFudCwgc28gdGhlIGNoZWNrCmVu
ZHMgdXAgYmVpbmcgdHJpdmlhbC4gT24gYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMsIHRoZSBzYW1l
IHRoaW5nIGNhbgpiZSBkb25lIGFmdGVyIHRoZSBzZXRfZnMgcmVtb3ZhbCwgc28gSSB3YXMgaG9w
aW5nIGl0IHdvdWxkIHdvcmsgaGVyZQphcyB3ZWxsLgoKSSBzdXNwZWN0IGRvaW5nIHRoZSBnZW5l
cmljIChzaXplIDw9IGxpbWl0KSAmJiAoYWRkciA8PSAobGltaXQgLSBzaXplKSkKY2hlY2sgb24g
bWlwczY0IHdpdGggdGhlIHJ1bnRpbWUgbGltaXQgZW5kcyB1cCBzbGlnaHRseSBzbG93ZXIKdGhh
biB0aGUgY3VycmVudCBjb2RlIHRoYXQgY2hlY2tzIGEgYml0IG1hc2sgaW5zdGVhZC4gSWYgeW91
IGxpa2UsCkknbGwgdXBkYXRlIGl0IHRoaXMgd2F5LCBvdGhlcndpc2UgSSdkIG5lZWQgaGVscCBp
biBmb3JtIG9mIGEgcGF0Y2gKdGhhdCBjaGFuZ2VzIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgc28g
X19nZXRfdXNlci9fX3B1dF91c2VyCmFsc28gcmV0dXJuIC1FRkFVTFQgZm9yIGFuIGFkZHJlc3Mg
ZXJyb3IuCgogICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
