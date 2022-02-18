Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C08BD4BB4C7
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 10:01:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 843C424876;
	Fri, 18 Feb 2022 10:01:04 +0100 (CET)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mail.librecores.org (Postfix) with ESMTPS id A6F812485B
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 10:01:02 +0100 (CET)
Received: by mail-ua1-f50.google.com with SMTP id 110so1978990uak.4
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 01:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1nYL/qjPVlkIqK+5dnbJ/5QVdVKG9AQSDTVmJuSTxwE=;
 b=E95x+YLEV7hbScgJieSSDshMnjifiEjUu3ARay+UXpWwT+e5odDkQ/noPO1PYc6exu
 R8hR1B7HDbDmC9Yj6GnCEKEz6C+MUjzeZwxS4H6dUwffW1NOBviOtyukKrFtRQfIrnwg
 Hujpk2OtdAQj20pA6gyZZ80pxeqn/iT7wQoGML+LZWRiwhzUN72WkcOzlRcYMIgwlTI/
 VpbLrtPNgJ7XhdzpHugpiPHrB0nzwVTYWVpdYzOcymQXpvosCLomzHPIeA5QZiUeIVmV
 WU6rmkQSeqA8PPIC+JC+zSEPc2sGD1uJjnsXa1M1nU6j8/RiOvBHhiOmScM2+xoY0fFm
 lI8w==
X-Gm-Message-State: AOAM532zxB307cMsK5aejUqUDR6i/nGJJP0iws8pMRCG8W0WB/GhOA63
 YShtPKeGJSsrLoabojN8hJXC3JPV3tpeKQ==
X-Google-Smtp-Source: ABdhPJzMzYC3yBKaYSR83L8Qj74DqV3cRJB0lPol/qt8K6lIfp+7ran70n6DDMmpQraqoeSzvuktWA==
X-Received: by 2002:a9f:3e48:0:b0:33c:aaa6:bb44 with SMTP id
 c8-20020a9f3e48000000b0033caaa6bb44mr2802906uaj.1.1645174861422; 
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id v13sm3502192vsr.10.2022.02.18.01.01.01
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id u10so9162041vsu.13
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 01:01:01 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr3151546vsl.38.1645174850220; Fri, 18
 Feb 2022 01:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-11-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-11-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 10:00:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
Message-ID: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 10/18] m68k: fix access_ok for coldfire
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
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCk9uIFdlZCwgRmViIDE2LCAyMDIyIGF0IDI6MTcgUE0gQXJuZCBCZXJnbWFubiA8
YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+Cj4gV2hpbGUgbW9zdCBtNjhrIHBsYXRmb3JtcyB1c2Ugc2VwYXJhdGUgYWRkcmVzcyBz
cGFjZXMgZm9yIHVzZXIKPiBhbmQga2VybmVsIHNwYWNlLCBhdCBsZWFzdCBjb2xkZmlyZSBkb2Vz
IG5vdCwgYW5kIHRoZSBvdGhlcgo+IG9uZXMgaGF2ZSBhIFRBU0tfU0laRSB0aGF0IGlzIGxlc3Mg
dGhhbiB0aGUgZW50aXJlIDRHQiBhZGRyZXNzCj4gcmFuZ2UuCj4KPiBVc2luZyB0aGUgZGVmYXVs
dCBpbXBsZW1lbnRhdGlvbiBvZiBfX2FjY2Vzc19vaygpIHN0b3BzIGNvbGRmaXJlCj4gdXNlciBz
cGFjZSBmcm9tIHRyaXZpYWxseSBhY2Nlc3Npbmcga2VybmVsIG1lbW9yeS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghCgo+IC0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9hcmNo
L202OGsvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTEyLDE0ICsxMiwyMSBAQAo+ICAjaW5j
bHVkZSA8YXNtL2V4dGFibGUuaD4KPgo+ICAvKiBXZSBsZXQgdGhlIE1NVSBkbyBhbGwgY2hlY2tp
bmcgKi8KPiAtc3RhdGljIGlubGluZSBpbnQgYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICph
ZGRyLAo+ICtzdGF0aWMgaW5saW5lIGludCBhY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKnB0
ciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzaXplKQo+ICB7
Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGxpbWl0ID0gVEFTS19TSVpFOwo+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcHRyOwo+ICsKPiAgICAgICAgIC8qCj4g
ICAgICAgICAgKiBYWFg6IGZvciAhQ09ORklHX0NQVV9IQVNfQUREUkVTU19TUEFDRVMgdGhpcyBy
ZWFsbHkgbmVlZHMgdG8gY2hlY2sKPiAgICAgICAgICAqIGZvciBUQVNLX1NJWkUhCj4gKyAgICAg
ICAgKiBSZW1vdmluZyB0aGlzIGhlbHBlciBpcyBwcm9iYWJseSBzdWZmaWNpZW50Lgo+ICAgICAg
ICAgICovCgpTaG91bGRuJ3QgdGhlIGFib3ZlIGNvbW1lbnQgYmxvY2sgYmUgcmVtb3ZlZCBjb21w
bGV0ZWx5LAphcyB0aGlzIGlzIG5vdyBpbXBsZW1lbnRlZCBiZWxvdz8KCj4gLSAgICAgICByZXR1
cm4gMTsKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19DUFVfSEFTX0FERFJFU1NfU1BB
Q0VTKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gKwo+ICsgICAgICAgcmV0dXJuIChz
aXplIDw9IGxpbWl0KSAmJiAoYWRkciA8PSAobGltaXQgLSBzaXplKSk7Cj4gIH0KCkFueSBwZXNr
eSBjb21waWxlcnMgdGhhdCB3YXJuIChvciB3b3JzZSB3aXRoIC1XZXJyb3IpIGFib3V0CiJjb25k
aXRpb24gYWx3YXlzIHRydWUiIGZvciBUQVNLX1NJWkUgPSAweEZGRkZGRkZGVUw/CgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
