Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 08582480F02
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 03:47:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9454624244;
	Wed, 29 Dec 2021 03:47:18 +0100 (CET)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mail.librecores.org (Postfix) with ESMTPS id 960FA2062E
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 02:21:08 +0100 (CET)
Received: by mail-pg1-f170.google.com with SMTP id v25so17214080pge.2
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 17:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ce+QRujFh6Z6jXwpwj96Ajoqinq3qkVE1ootEg0tvM4=;
 b=HR4+5gEvbRK0rU8/dntHoBj1g+0X3qKpLMsP358svmvVe4LU0yAyJLNGs3fCG1IxN5
 M/QTR8OXVpknffzN/8b3pOWH0ImhkhbIhkjgUWsWwTRZMZ2woqwqIa5115FbA6Nf6xT4
 TiKsVnkG1OLJDDZ06iwYnbvfkz/MJz2DtOV5zSZDVPVN2jIRsDW3XOaMugqlveDm5gnG
 bFN6SiWtJfdMPi0YTy0yZg20PhHPIvQQsScpgCUPn8k9cu6v+natJ9ebpk8jSRGpwixK
 MiRCzMxl519LQW1SjZgL9Y49JFwBww9vU7/YKwkn2coaccmwFAJf32w2Pk2xT9akAsgc
 lavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=ce+QRujFh6Z6jXwpwj96Ajoqinq3qkVE1ootEg0tvM4=;
 b=FZ9UD5sku/vhRhUMd68ERc4fT2HJc4pnkvh0qy9G8IcPNFM97uXgwpVLoCrcsd/AEk
 KdQl97iHWd09BQIlfygFqkPl6Y4CKpyIWtEfpoWM2J8001N9Czmx4U0GRDbjgH6yLTw6
 wemZ5YajfI2WYQ8pfB2kv1oO52qkP1l0GLehsusDJm76i6RxIoO8UlbsHWJ4v/jl8j1N
 2QOoe47mopabAz1uNbpIlcD1tAPQW5NAJ8YFeBPeMOc3B5Ryu1kpIIPGJ1uE+0AuEHMI
 hPrZOPPrVtLFNSQXQVZkHIlkDQWTrn5hTvhRj4cpTMFV6fbhGQfKcRWu7GYBBFrb1Dsu
 m2/g==
X-Gm-Message-State: AOAM532F8Z90gHhphy5u4h/KILYADBtcfNBFS1vFowxtIbapRGTW7o1H
 r/iQiuvVC/CTHsD0+BxtYMA=
X-Google-Smtp-Source: ABdhPJx/po46hxln8jdEFq24zHXmQfZv0rMy1a+pao1gS+//RcuuYa1+uO7C36+ZKnR8X7vS6LfebQ==
X-Received: by 2002:a05:6a00:cca:b0:4ba:f5cc:538c with SMTP id
 b10-20020a056a000cca00b004baf5cc538cmr24584430pfv.60.1640740867094; 
 Tue, 28 Dec 2021 17:21:07 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 cm20sm18920963pjb.28.2021.12.28.17.20.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 17:21:06 -0800 (PST)
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
Date: Wed, 29 Dec 2021 14:20:38 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 29 Dec 2021 03:47:16 +0100
Subject: Re: [OpenRISC] [RFC 02/32] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
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
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chris Zankel <chris@zankel.net>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgR2VlcnQsIE5pa2xhcywKCgoKQW0gMjguMTIuMjAyMSB1bSAyMzowOCBzY2hyaWViIEdlZXJ0
IFV5dHRlcmhvZXZlbjoKPiBIaSBOaWtsYXMsCj4KPiBPbiBNb24sIERlYyAyNywgMjAyMSBhdCA1
OjQ0IFBNIE5pa2xhcyBTY2huZWxsZSA8c2NobmVsbGVAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4+
IFdlIGludHJvZHVjZSBhIG5ldyBIQVNfSU9QT1JUIEtjb25maWcgb3B0aW9uIHRvIGdhdGUgc3Vw
cG9ydCBmb3IKPj4gSS9PIHBvcnQgYWNjZXNzLiBJbiBhIGZ1dHVyZSBwYXRjaCBIQVNfSU9QT1JU
PW4gd2lsbCBkaXNhYmxlIGNvbXBpbGF0aW9uCj4+IG9mIHRoZSBJL08gYWNjZXNzb3IgZnVuY3Rp
b25zIGluYigpL291dGIoKSBhbmQgZnJpZW5kcyBvbiBhcmNoaXRlY3R1cmVzCj4+IHdoaWNoIGNh
biBub3QgbWVhbmluZ2Z1bGx5IHN1cHBvcnQgbGVnYWN5IEkvTyBzcGFjZXMuIE9uIHRoZXNlIHBs
YXRmb3Jtcwo+PiBpbmIoKS9vdXRiKCkgZXRjIGFyZSBjdXJyZW50bHkganVzdCBzdHVicyBpbiBh
c20tZ2VuZXJpYy9pby5oIHdoaWNoIHdoZW4KPj4gY2FsbGVkIHdpbGwgY2F1c2UgYSBOVUxMIHBv
aW50ZXIgYWNjZXNzIHdoaWNoIHNvbWUgY29tcGlsZXJzIGFjdHVhbGx5Cj4+IGRldGVjdCBhbmQg
d2FybiBhYm91dC4KPj4KPj4gVGhlIGRlcGVuZGVuY2llcyBvbiBIQVNfSU9QT1JUIGluIGRyaXZl
cnMgYXMgd2VsbCBhcyBpZmRlZnMgZm9yCj4+IEhBU19JT1BPUlQgc3BlY2lmaWMgc2VjdGlvbnMg
d2lsbCBiZSBhZGRlZCBpbiBzdWJzZXF1ZW50IHBhdGNoZXMgb24KPj4gYSBwZXIgc3Vic3lzdGVt
IGJhc2lzLiBUaGVuIGEgZmluYWwgcGF0Y2ggd2lsbCBpZmRlZiB0aGUgSS9PIGFjY2Vzcwo+PiBm
dW5jdGlvbnMgb24gSEFTX0lPUE9SVCB0aHVzIHR1cm5pbmcgYW55IHVzZSBub3QgZ2F0ZWQgYnkg
SEFTX0lPUE9SVAo+PiBpbnRvIGEgY29tcGlsZS10aW1lIHdhcm5pbmcuCj4+Cj4+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FIay09d2c4MGplPUs3bWFkRjRlN1dyUk5wMzdl
M3FoNnkxMFN2aGRjN084U1pfLThnQG1haWwuZ21haWwuY29tLwo+PiBDby1kZXZlbG9wZWQtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBOaWtsYXMgU2NobmVs
bGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4K
Pj4gLS0tIGEvYXJjaC9tNjhrL0tjb25maWcKPj4gKysrIGIvYXJjaC9tNjhrL0tjb25maWcKPj4g
QEAgLTE2LDYgKzE2LDcgQEAgY29uZmlnIE02OEsKPj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19D
UFVfREVWSUNFUwo+PiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0lPTUFQCj4+ICAgICAgICAgc2Vs
ZWN0IEdFTkVSSUNfSVJRX1NIT1cKPj4gKyAgICAgICBzZWxlY3QgSEFTX0lPUE9SVAo+PiAgICAg
ICAgIHNlbGVjdCBIQVZFX0FPVVQgaWYgTU1VCj4+ICAgICAgICAgc2VsZWN0IEhBVkVfQVNNX01P
RFZFUlNJT05TCj4+ICAgICAgICAgc2VsZWN0IEhBVkVfREVCVUdfQlVHVkVSQk9TRQo+Cj4gVGhp
cyBsb29rcyB3YXkgdG9vIGJyb2FkIHRvIG1lOiBtb3N0IG02OGsgcGxhdGZvcm0gZG8gbm90IGhh
dmUgSS9PCj4gcG9ydCBhY2Nlc3Mgc3VwcG9ydC4KPgo+IE15IGd1dCBmZWVsaW5nIHNheXM6Cj4K
PiAgICAgc2VsZWN0IEhBU19JT1BPUlQgaWYgUENJIHx8IElTQQo+Cj4gYnV0IHRoYXQgbWlnaHQg
bWlzcyBzb21lIGludHJpY2F0ZSBkZXRhaWxzLi4uCgpJbiBwYXJ0aWN1bGFyLCB0aGlzIG1pc3Nl
cyB0aGUgQXRhcmkgUk9NIHBvcnQgSVNBIGFkYXB0ZXIgY2FzZSAtCgoJc2VsZWN0IEhBU19JT1BP
UlQgaWYgUENJIHx8IElTQSB8fCBBVEFSSV9ST01fSVNBCgptaWdodCBkbyBpbnN0ZWFkLgoKQ2hl
ZXJzLAoKCU1pY2hhZWwKCgo+Cj4gR3J7b2V0amUsZWV0aW5nfXMsCj4KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAo+Cj4gLS0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCj4KPiBJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
