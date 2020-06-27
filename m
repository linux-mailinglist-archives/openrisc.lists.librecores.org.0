Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C2D0B20DCDA
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:44:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A15A120CB9;
	Mon, 29 Jun 2020 22:44:57 +0200 (CEST)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by mail.librecores.org (Postfix) with ESMTPS id 5F68520B13
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 05:06:49 +0200 (CEST)
Received: by mail-qv1-f66.google.com with SMTP id el4so1313364qvb.13
 for <openrisc@lists.librecores.org>; Fri, 26 Jun 2020 20:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+vuS6c1B6RhJf/Wc0BlkKUed8Ad7RKtG6ySIxBvmEW4=;
 b=gGSSgpkEGydgQhXoMv3qlsLt5mrlAk1v4a9rb3qIZhmM949nYvicKoTtRuPavC2CPS
 4gqA1cK6C7En4OrR24pSzu/xs4Q8Gi1+rCDB936ZFtDq7qeIhGdqLhX3QVnpV1gh8i9r
 Yr+oBV7orOZer/ucN8JKx+INZnGVhvWI3lJGYoToY83TNPCD/UDAOaXkBbXLVet7FzJU
 YdFda7nN//WQKfslSPDlW95hAsPb2mC0SvZh10iM7adIharPZOJYAapANRg5t3Qkk2Sr
 ISnw9Cflf3OgJKj3vsBG2CTZKXRPGRjLof1FkbQqiDaWgHWLcla93tfKhCRAOkB8QJ9C
 IkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+vuS6c1B6RhJf/Wc0BlkKUed8Ad7RKtG6ySIxBvmEW4=;
 b=GcxwZ77HLJ2U0h5R4UP/TERjH6fE5v3kQTXtyEIW1yhZl8+drQend12eR9kla3Qt/O
 fR3q46GSgH6MIpiFo2+Ddt9iUQAnkI7LPa6mTpuFpYvB1lD6YlvnACueG7njgzFke3BF
 rWTojBnFaLSFp7lEI/jfdyWAHFUt461MZb9x6Asc0dDf9I++SVEsu4Y6Gt/tEZ2wyDTq
 4YJw3AKvcE1PGJ/KNajJh0G6HE/wdJp9zOatj2x7Iqdv2c9OXPteTBfgjrVMc1I/BlD9
 OvbIly+Bc+mLMPJr3JclC6lH+UYLMJK+mOxqbRkCavw6/0vMFof8ioiMD7jI5+zncNS3
 Sexg==
X-Gm-Message-State: AOAM531y52aqCbNB4EBBs0L06uClhdRie7fo9jK5uMwYI+fNxZHq9DPf
 RZ/Resap4CmRLRY57KoYWHNUaSUR+B3OBV1bgd8=
X-Google-Smtp-Source: ABdhPJxYyEJ7kBLOC8G+2pCCNUUQ5BD2x0Y5L6IFg/2fsP6u4dRXqSou/wb4e51wB+OOq8JrNYw66PMvbKNI3NbZUFA=
X-Received: by 2002:a0c:fe01:: with SMTP id x1mr5934189qvr.246.1593227207936; 
 Fri, 26 Jun 2020 20:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-17-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-17-christian.brauner@ubuntu.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Sat, 27 Jun 2020 11:06:08 +0800
Message-ID: <CAEbi=3f3o5jS7zZDo50Vq857mS9n9kDsxkseGKrWshmmp3q5wA@mail.gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+IOaWvCAyMDIw
5bm0NuaciDIz5pelIOmAseS6jCDkuIrljYg3OjQ25a+r6YGT77yaCj4KPiBBbGwgYXJjaGl0ZWN0
dXJlcyBzdXBwb3J0IGNvcHlfdGhyZWFkX3RscygpIG5vdywgc28gcmVtb3ZlIHRoZSBsZWdhY3kK
PiBjb3B5X3RocmVhZCgpIGZ1bmN0aW9uIGFuZCB0aGUgSEFWRV9DT1BZX1RIUkVBRF9UTFMgY29u
ZmlnIG9wdGlvbi4gRXZlcnlvbmUKPiB1c2VzIHRoZSBzYW1lIHByb2Nlc3MgY3JlYXRpb24gY2Fs
bGluZyBjb252ZW50aW9uIGJhc2VkIG9uCj4gY29weV90aHJlYWRfdGxzKCkgYW5kIHN0cnVjdCBr
ZXJuZWxfY2xvbmVfYXJncy4gVGhpcyB3aWxsIG1ha2UgaXQgZWFzaWVyIHRvCj4gbWFpbnRhaW4g
dGhlIGNvcmUgcHJvY2VzcyBjcmVhdGlvbiBjb2RlIHVuZGVyIGtlcm5lbC8sIHNpbXBsaWZpZXMg
dGhlCj4gY2FsbHBhdGhzIGFuZCBtYWtlcyB0aGUgaWRlbnRpY2FsIGZvciBhbGwgYXJjaGl0ZWN0
dXJlcy4KPgo+IENjOiBSaWNoYXJkIEhlbmRlcnNvbiA8cnRoQHR3aWRkbGUubmV0Pgo+IENjOiBJ
dmFuIEtva3NoYXlza3kgPGlua0BqdXJhc3NpYy5wYXJrLm1zdS5ydT4KPiBDYzogTWF0dCBUdXJu
ZXIgPG1hdHRzdDg4QGdtYWlsLmNvbT4KPiBDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3Bz
eXMuY29tPgo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiBDYzog
Q2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBDYzogV2lsbCBEZWFj
b24gPHdpbGxAa2VybmVsLm9yZz4KPiBDYzogTWFyayBTYWx0ZXIgPG1zYWx0ZXJAcmVkaGF0LmNv
bT4KPiBDYzogQXVyZWxpZW4gSmFjcXVpb3QgPGphY3F1aW90LmF1cmVsaWVuQGdtYWlsLmNvbT4K
PiBDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gQ2M6IFlvc2hpbm9yaSBTYXRvIDx5
c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4KPiBDYzogQnJpYW4gQ2FpbiA8YmNhaW5AY29kZWF1
cm9yYS5vcmc+Cj4gQ2M6IFRvbnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4KPiBDYzogRmVu
Z2h1YSBZdSA8ZmVuZ2h1YS55dUBpbnRlbC5jb20+Cj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gQ2M6IE1pY2hhbCBTaW1layA8bW9uc3RyQG1vbnN0ci5l
dT4KPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4K
PiBDYzogTmljayBIdSA8bmlja2h1QGFuZGVzdGVjaC5jb20+Cj4gQ2M6IEdyZWVudGltZSBIdSA8
Z3JlZW4uaHVAZ21haWwuY29tPgo+IENjOiBWaW5jZW50IENoZW4gPGRlYW5ibzQyMkBnbWFpbC5j
b20+Cj4gQ2M6IExleSBGb29uIFRhbiA8bGV5LmZvb24udGFuQGludGVsLmNvbT4KPiBDYzogSm9u
YXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+IENjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxz
dGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ2M6IFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPgo+IENjOiAiSmFtZXMgRS5KLiBCb3R0b21sZXkiIDxKYW1lcy5Cb3R0
b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+Cj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzog
QmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgo+IENjOiBQ
YXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiBDYzogUGF1bCBXYWxtc2xleSA8cGF1
bC53YWxtc2xleUBzaWZpdmUuY29tPgo+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPgo+IENjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPiBDYzogSGVp
a28gQ2Fyc3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+Cj4gQ2M6IFZhc2lseSBHb3Ji
aWsgPGdvckBsaW51eC5pYm0uY29tPgo+IENjOiBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50
cmFlZ2VyQGRlLmlibS5jb20+Cj4gQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+Cj4g
Q2M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0Pgo+IENjOiBKZWZmIERp
a2UgPGpkaWtlQGFkZHRvaXQuY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0Pgo+IENjOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5j
b20+Cj4gQ2M6IEd1YW4gWHVldGFvIDxneHRAcGt1LmVkdS5jbj4KPiBDYzogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQu
Y29tPgo+IENjOiB4ODZAa2VybmVsLm9yZwo+IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IENj
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gQ2M6ICJNYXR0aGV3IFdpbGNv
eAo+IENjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KPiBDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1hbHBoYUB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtYzZ4LWRldkBsaW51eC1jNngub3Jn
Cj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHVjbGludXgtaDgtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UuanAKPiBDYzogbGludXgtaGV4YWdvbkB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGludXgtaWE2NEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbTY4a0BsaXN0cy5s
aW51eC1tNjhrLm9yZwo+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBvcGVu
cmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51eC1wYXJpc2NAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4gQ2M6IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHNwYXJjbGludXhAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgteHRlbnNh
QGxpbnV4LXh0ZW5zYS5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hy
aXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KPiBbLi4uXQo+IGRpZmYgLS1naXQgYS9hcmNoL25k
czMyL0tjb25maWcgYi9hcmNoL25kczMyL0tjb25maWcKPiBpbmRleCA3YjZlYWNhODFjY2UuLmUz
MDI5OGU5OWUxYiAxMDA2NDQKPiAtLS0gYS9hcmNoL25kczMyL0tjb25maWcKPiArKysgYi9hcmNo
L25kczMyL0tjb25maWcKPiBAQCAtNDgsNyArNDgsNiBAQCBjb25maWcgTkRTMzIKPiAgICAgICAg
IHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+ICAgICAgICAgc2VsZWN0IEhBVkVf
RlRSQUNFX01DT1VOVF9SRUNPUkQKPiAgICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNF
Cj4gLSAgICAgICBzZWxlY3QgSEFWRV9DT1BZX1RIUkVBRF9UTFMKPiAgICAgICAgIGhlbHAKPiAg
ICAgICAgICAgQW5kZXMobmRzMzIpIExpbnV4IHN1cHBvcnQuCgpIaSBDaHJpc3RpYW4sIFRoYW5r
IHlvdS4KQWNrZWQtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW4uaHVAZ21haWwuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
