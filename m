Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BBDC24B65BF
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 09:18:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6DE7224810;
	Tue, 15 Feb 2022 09:18:16 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id E6AFD212F0
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:18:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B717D61677
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 08:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C553C36AE3
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644913093;
 bh=04jl3xlTAr2mAK86GyJL0xbgNN5b7HtshwArFPtWTHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=stRaKCevAHKdgCmUGBrfhYzWT/8iK3ELaeINBLVStpnUtlgra7KJKB1LPYgCFz1Pz
 +EGWCG7GiscQwxqnR6qJYfTfqIKew2R3ilXdCTdcizcfhkqcFb2TJHt6sjZQfI2a33
 z9c50e3SciQbRuuCC7ZH5imVtHHxU2mhBfrCJWqpha1zoDHYemAFJAhKFnW+HE9Ygj
 VumcFjSy1p4dB9c+6GpPb1xWIMbXv5/9DDjAH5DCfzY/fxC8JQEtfusc6ZaJDHhC5h
 AXGqyPAIzRgK+LIGR73S0GgDLdYFf2jflIjiT0umxwXaCiuWmVS2bzqZo6JrJeQrhm
 7SbBQn0gB5/3Q==
Received: by mail-ed1-f46.google.com with SMTP id w10so12187287edd.11
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 00:18:13 -0800 (PST)
X-Gm-Message-State: AOAM533fVK36wKS3XbnMtV/lterMXx2ncjNrgxYjwuVfzAss1SC1kitR
 pbRAqjdb/86663KWv3a5aFAdLqQ4rBBDl2EMXZk=
X-Google-Smtp-Source: ABdhPJw4PL6nNrFqa4c6RC8ozuX9Vj+TpXvd1rMYfibECm69yxHe+9RwBgU/na3QadsOPEjyGv1buhx93wXVXPObDfI=
X-Received: by 2002:a5d:490d:: with SMTP id x13mr2213081wrq.417.1644913080942; 
 Tue, 15 Feb 2022 00:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-9-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Feb 2022 09:17:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
Message-ID: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 08/14] arm64: simplify access_ok()
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
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, monstr@monstr.eu,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-api@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCAxNCBGZWIgMjAyMiBhdCAxNzozNywgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBh
cm02NCBoYXMgYW4gaW5saW5lIGFzbSBpbXBsZW1lbnRhdGlvbiBvZiBhY2Nlc3Nfb2soKSB0aGF0
IGlzIGRlcml2ZWQgZnJvbQo+IHRoZSAzMi1iaXQgYXJtIHZlcnNpb24gYW5kIG9wdGltaXplZCBm
b3IgdGhlIGNhc2UgdGhhdCBib3RoIHRoZSBsaW1pdCBhbmQKPiB0aGUgc2l6ZSBhcmUgdmFyaWFi
bGUuIFdpdGggc2V0X2ZzKCkgZ29uZSwgdGhlIGxpbWl0IGlzIGFsd2F5cyBjb25zdGFudCwKPiBh
bmQgdGhlIHNpemUgdXN1YWxseSBpcyBhcyB3ZWxsLCBzbyBqdXN0IHVzaW5nIHRoZSBkZWZhdWx0
IGltcGxlbWVudGF0aW9uCj4gcmVkdWNlcyB0aGUgY2hlY2sgaW50byBhIGNvbXBhcmlzb24gYWdh
aW5zdCBhIGNvbnN0YW50IHRoYXQgY2FuIGJlCj4gc2NoZWR1bGVkIGJ5IHRoZSBjb21waWxlci4K
Pgo+IE9uIGEgZGVmY29uZmlnIGJ1aWxkLCB0aGlzIHNhdmVzIG92ZXIgMjhLQiBvZiAudGV4dC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4g
IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjggKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBi
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gaW5kZXggMzU3ZjdiZDljOTgxLi5l
OGRjZTBjYzVlYWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNz
LmgKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC0yNiw2ICsy
Niw4IEBACj4gICNpbmNsdWRlIDxhc20vbWVtb3J5Lmg+Cj4gICNpbmNsdWRlIDxhc20vZXh0YWJs
ZS5oPgo+Cj4gK3N0YXRpYyBpbmxpbmUgaW50IF9fYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2Vy
ICpwdHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gKwo+ICAvKgo+ICAgKiBUZXN0IHdoZXRoZXIg
YSBibG9jayBvZiBtZW1vcnkgaXMgYSB2YWxpZCB1c2VyIHNwYWNlIGFkZHJlc3MuCj4gICAqIFJl
dHVybnMgMSBpZiB0aGUgcmFuZ2UgaXMgdmFsaWQsIDAgb3RoZXJ3aXNlLgo+IEBAIC0zMywxMCAr
MzUsOCBAQAo+ICAgKiBUaGlzIGlzIGVxdWl2YWxlbnQgdG8gdGhlIGZvbGxvd2luZyB0ZXN0Ogo+
ICAgKiAodTY1KWFkZHIgKyAodTY1KXNpemUgPD0gKHU2NSlUQVNLX1NJWkVfTUFYCj4gICAqLwo+
IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3Vz
ZXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiArc3RhdGljIGlubGluZSBpbnQgYWNjZXNz
X29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gIHsKPiAt
ICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0LCBsaW1pdCA9IFRBU0tfU0laRV9NQVggLSAxOwo+IC0K
PiAgICAgICAgIC8qCj4gICAgICAgICAgKiBBc3luY2hyb25vdXMgSS9PIHJ1bm5pbmcgaW4gYSBr
ZXJuZWwgdGhyZWFkIGRvZXMgbm90IGhhdmUgdGhlCj4gICAgICAgICAgKiBUSUZfVEFHR0VEX0FE
RFIgZmxhZyBvZiB0aGUgcHJvY2VzcyBvd25pbmcgdGhlIG1tLCBzbyBhbHdheXMgdW50YWcKPiBA
QCAtNDYsMjcgKzQ2LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9fYWNjZXNzX29r
KGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAgICAgICAo
Y3VycmVudC0+ZmxhZ3MgJiBQRl9LVEhSRUFEIHx8IHRlc3RfdGhyZWFkX2ZsYWcoVElGX1RBR0dF
RF9BRERSKSkpCj4gICAgICAgICAgICAgICAgIGFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOwo+
Cj4gLSAgICAgICBfX2Noa191c2VyX3B0cihhZGRyKTsKPiAtICAgICAgIGFzbSB2b2xhdGlsZSgK
PiAtICAgICAgIC8vIEEgKyBCIDw9IEMgKyAxIGZvciBhbGwgQSxCLEMsIGluIGZvdXIgZWFzeSBz
dGVwczoKPiAtICAgICAgIC8vIDE6IFggPSBBICsgQjsgWCcgPSBYICUgMl42NAo+IC0gICAgICAg
IiAgICAgICBhZGRzICAgICUwLCAlMywgJTJcbiIKPiAtICAgICAgIC8vIDI6IFNldCBDID0gMCBp
ZiBYID4gMl42NCwgdG8gZ3VhcmFudGVlIFgnID4gQyBpbiBzdGVwIDQKPiAtICAgICAgICIgICAg
ICAgY3NlbCAgICAlMSwgeHpyLCAlMSwgaGlcbiIKPiAtICAgICAgIC8vIDM6IFNldCBYJyA9IH4w
IGlmIFggPj0gMl42NC4gRm9yIFggPT0gMl42NCwgdGhpcyBkZWNyZW1lbnRzIFgnCj4gLSAgICAg
ICAvLyAgICB0byBjb21wZW5zYXRlIGZvciB0aGUgY2FycnkgZmxhZyBiZWluZyBzZXQgaW4gc3Rl
cCA0LiBGb3IKPiAtICAgICAgIC8vICAgIFggPiAyXjY0LCBYJyBtZXJlbHkgaGFzIHRvIHJlbWFp
biBub256ZXJvLCB3aGljaCBpdCBkb2VzLgo+IC0gICAgICAgIiAgICAgICBjc2ludiAgICUwLCAl
MCwgeHpyLCBjY1xuIgo+IC0gICAgICAgLy8gNDogRm9yIFggPCAyXjY0LCB0aGlzIGdpdmVzIHVz
IFgnIC0gQyAtIDEgPD0gMCwgd2hlcmUgdGhlIC0xCj4gLSAgICAgICAvLyAgICBjb21lcyBmcm9t
IHRoZSBjYXJyeSBpbiBiZWluZyBjbGVhci4gT3RoZXJ3aXNlLCB3ZSBhcmUKPiAtICAgICAgIC8v
ICAgIHRlc3RpbmcgWCcgLSBDID09IDAsIHN1YmplY3QgdG8gdGhlIHByZXZpb3VzIGFkanVzdG1l
bnRzLgo+IC0gICAgICAgIiAgICAgICBzYmNzICAgIHh6ciwgJTAsICUxXG4iCj4gLSAgICAgICAi
ICAgICAgIGNzZXQgICAgJTAsIGxzXG4iCj4gLSAgICAgICA6ICI9JnIiIChyZXQpLCAiK3IiIChs
aW1pdCkgOiAiSXIiIChzaXplKSwgIjAiIChhZGRyKSA6ICJjYyIpOwo+IC0KPiAtICAgICAgIHJl
dHVybiByZXQ7Cj4gKyAgICAgICByZXR1cm4gbGlrZWx5KF9fYWNjZXNzX29rKGFkZHIsIHNpemUp
KTsKPiAgfQo+IC0jZGVmaW5lIF9fYWNjZXNzX29rIF9fYWNjZXNzX29rCj4gKyNkZWZpbmUgYWNj
ZXNzX29rIGFjY2Vzc19vawo+Cj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9hY2Nlc3Nfb2suaD4K
Pgo+IC0tCj4gMi4yOS4yCj4KCldpdGggc2V0X2ZzKCkgb3V0IG9mIHRoZSBwaWN0dXJlLCB3b3Vs
ZG4ndCBpdCBiZSBzdWZmaWNpZW50IHRvIGNoZWNrCnRoYXQgYml0ICM1NSBpcyBjbGVhcj8gKHRo
ZSBiaXQgdGhhdCBzZWxlY3RzIGJldHdlZW4gVFRCUjAgYW5kIFRUQlIxKQpUaGF0IHdvdWxkIGFs
c28gcmVtb3ZlIHRoZSBuZWVkIHRvIHN0cmlwIHRoZSB0YWcgZnJvbSB0aGUgYWRkcmVzcy4KClNv
bWV0aGluZyBsaWtlCgogICAgYXNtIGdvdG8oInRibnogICUwLCAjNTUsICUyICAgICBcbiIKICAg
ICAgICAgICAgICJ0Ym56ICAlMSwgIzU1LCAlMiAgICAgXG4iCiAgICAgICAgICAgICA6OiAiciIo
YWRkciksICJyIihhZGRyICsgc2l6ZSAtIDEpIDo6IG5vdG9rKTsKICAgIHJldHVybiAxOwpub3Rv
azoKICAgIHJldHVybiAwOwoKd2l0aCBhbiBhZGRpdGlvbmFsIHNhbml0eSBjaGVjayBvbiB0aGUg
c2l6ZSB3aGljaCB0aGUgY29tcGlsZXIgY291bGQKZWxpbWluYXRlIGZvciBjb21waWxlLXRpbWUg
Y29uc3RhbnQgdmFsdWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
