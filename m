Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 52E94480F8F
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 05:15:54 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EB11524072;
	Wed, 29 Dec 2021 05:15:53 +0100 (CET)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id D4768202A8
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 05:15:51 +0100 (CET)
Received: by mail-pj1-f47.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so18188402pjf.3
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 20:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=oo7gGMOkpKZtsifyQrF9uAkP4p/YBx2m/GIQa4Tq0YE=;
 b=SgUGGN6VhsGuSJ4+x7BV8WmUFGnq6AU/S3MGIbRuvgcmK5iemLDPInHX4HtGqsDBOP
 X+ShdKiY6WGvZxZzGll6Lp9gXc9Iofh3zmxzNCmw3Dn3KgxWg++og+5/hcFLsP9lz2Xr
 2GF2kpRya+BTKsokuDFYluzgdLN+9R6oDmfEeq5seHlKkuDQoWmHZpB5lsfFQJLsHHhA
 J+6fOy7KSqTSf4RHl5+/z/3kvG8PPaQjjUrbxIO/1twWStmOPd1O5hfeFSFRI+7/1KDQ
 V6duyLcOszOYryU8sc+sZAK9TuMnZyNEumxgE9K0xpEM2ht/1sy9t9bhV6U0QsHIl9qG
 4r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=oo7gGMOkpKZtsifyQrF9uAkP4p/YBx2m/GIQa4Tq0YE=;
 b=ATxp1BJv14g/W2ubwEFe3XkbRsJSdsW3tAWlyMAibP0Eruas1OWVn2gQ6SRgIq9zAb
 MASR2E5m//XvC/uNsdEsIHmLelBWrCx/7FTpjL1TDB3lmWAN9w7nrahdMVOFb6VGGMAm
 t0Ju5kOPH7TbpcSwmeueW9WcYD3V3Zp4uaLYqC2sfDlIaUIuD96AA9Eadw1LAThZq0I9
 qeDzEb52PYSY+OYiEeAqG3kyMtPgnq8fdD1Rq6SBV7WL8MxReVR7sbPwdBxvBnpWDF73
 s8Fyt1oiDQOK1r93kWwpON3N3mTeDJ982DbN+ik1ycOrZkmqyf423lVCr1gfjvR9DDVq
 dNfg==
X-Gm-Message-State: AOAM532w0mHdrTO+P5D/D3tSnfEXpjhEv9Wx/MWwS93kHCQOeU6gM+oQ
 17OQRCqjSkcu9IzcUtIxAqw=
X-Google-Smtp-Source: ABdhPJyjCqGNhQip5lk1bKe/Q9ifrO91rL0XFrD4WiMDGXXaVLZjRe+Yr2Tq1lIfNgSSQkzYLSFwkQ==
X-Received: by 2002:a17:902:d48a:b0:148:a8ae:7ab7 with SMTP id
 c10-20020a170902d48a00b00148a8ae7ab7mr24900237plg.171.1640751350387; 
 Tue, 28 Dec 2021 20:15:50 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 k9sm13406563pgr.47.2021.12.28.20.15.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 20:15:49 -0800 (PST)
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
Date: Wed, 29 Dec 2021 17:15:23 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
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
 Albert Ou <aou@eecs.berkeley.edu>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
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

SGkgQXJuZCwKCkFtIDI5LjEyLjIwMjEgdW0gMTY6NDEgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+
IE9uIFR1ZSwgRGVjIDI4LCAyMDIxIGF0IDg6MjAgUE0gTWljaGFlbCBTY2htaXR6IDxzY2htaXR6
bWljQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEFtIDI4LjEyLjIwMjEgdW0gMjM6MDggc2NocmllYiBH
ZWVydCBVeXR0ZXJob2V2ZW46Cj4+PiBPbiBNb24sIERlYyAyNywgMjAyMSBhdCA1OjQ0IFBNIE5p
a2xhcyBTY2huZWxsZSA8c2NobmVsbGVAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4+Pj4gV2UgaW50
cm9kdWNlIGEgbmV3IEhBU19JT1BPUlQgS2NvbmZpZyBvcHRpb24gdG8gZ2F0ZSBzdXBwb3J0IGZv
cgo+Pj4+IEkvTyBwb3J0IGFjY2Vzcy4gSW4gYSBmdXR1cmUgcGF0Y2ggSEFTX0lPUE9SVD1uIHdp
bGwgZGlzYWJsZSBjb21waWxhdGlvbgo+Pj4+IG9mIHRoZSBJL08gYWNjZXNzb3IgZnVuY3Rpb25z
IGluYigpL291dGIoKSBhbmQgZnJpZW5kcyBvbiBhcmNoaXRlY3R1cmVzCj4+Pj4gd2hpY2ggY2Fu
IG5vdCBtZWFuaW5nZnVsbHkgc3VwcG9ydCBsZWdhY3kgSS9PIHNwYWNlcy4gT24gdGhlc2UgcGxh
dGZvcm1zCj4+Pj4gaW5iKCkvb3V0YigpIGV0YyBhcmUgY3VycmVudGx5IGp1c3Qgc3R1YnMgaW4g
YXNtLWdlbmVyaWMvaW8uaCB3aGljaCB3aGVuCj4+Pj4gY2FsbGVkIHdpbGwgY2F1c2UgYSBOVUxM
IHBvaW50ZXIgYWNjZXNzIHdoaWNoIHNvbWUgY29tcGlsZXJzIGFjdHVhbGx5Cj4+Pj4gZGV0ZWN0
IGFuZCB3YXJuIGFib3V0Lgo+Pj4+Cj4+Pj4gVGhlIGRlcGVuZGVuY2llcyBvbiBIQVNfSU9QT1JU
IGluIGRyaXZlcnMgYXMgd2VsbCBhcyBpZmRlZnMgZm9yCj4+Pj4gSEFTX0lPUE9SVCBzcGVjaWZp
YyBzZWN0aW9ucyB3aWxsIGJlIGFkZGVkIGluIHN1YnNlcXVlbnQgcGF0Y2hlcyBvbgo+Pj4+IGEg
cGVyIHN1YnN5c3RlbSBiYXNpcy4gVGhlbiBhIGZpbmFsIHBhdGNoIHdpbGwgaWZkZWYgdGhlIEkv
TyBhY2Nlc3MKPj4+PiBmdW5jdGlvbnMgb24gSEFTX0lPUE9SVCB0aHVzIHR1cm5pbmcgYW55IHVz
ZSBub3QgZ2F0ZWQgYnkgSEFTX0lPUE9SVAo+Pj4+IGludG8gYSBjb21waWxlLXRpbWUgd2Fybmlu
Zy4KPj4+Pgo+Pj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FIay09d2c4
MGplPUs3bWFkRjRlN1dyUk5wMzdlM3FoNnkxMFN2aGRjN084U1pfLThnQG1haWwuZ21haWwuY29t
Lwo+Pj4+IENvLWRldmVsb3BlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBOaWtsYXMgU2NobmVsbGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+Cj4+
Pgo+Pj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+Pj4KPj4+PiAtLS0gYS9hcmNoL202OGsvS2Nv
bmZpZwo+Pj4+ICsrKyBiL2FyY2gvbTY4ay9LY29uZmlnCj4+Pj4gQEAgLTE2LDYgKzE2LDcgQEAg
Y29uZmlnIE02OEsKPj4+PiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0NQVV9ERVZJQ0VTCj4+Pj4g
ICAgICAgICBzZWxlY3QgR0VORVJJQ19JT01BUAo+Pj4+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNf
SVJRX1NIT1cKPj4+PiArICAgICAgIHNlbGVjdCBIQVNfSU9QT1JUCj4+Pj4gICAgICAgICBzZWxl
Y3QgSEFWRV9BT1VUIGlmIE1NVQo+Pj4+ICAgICAgICAgc2VsZWN0IEhBVkVfQVNNX01PRFZFUlNJ
T05TCj4+Pj4gICAgICAgICBzZWxlY3QgSEFWRV9ERUJVR19CVUdWRVJCT1NFCj4+Pgo+Pj4gVGhp
cyBsb29rcyB3YXkgdG9vIGJyb2FkIHRvIG1lOiBtb3N0IG02OGsgcGxhdGZvcm0gZG8gbm90IGhh
dmUgSS9PCj4+PiBwb3J0IGFjY2VzcyBzdXBwb3J0Lgo+Pj4KPj4+IE15IGd1dCBmZWVsaW5nIHNh
eXM6Cj4+Pgo+Pj4gICAgIHNlbGVjdCBIQVNfSU9QT1JUIGlmIFBDSSB8fCBJU0EKPj4+Cj4+PiBi
dXQgdGhhdCBtaWdodCBtaXNzIHNvbWUgaW50cmljYXRlIGRldGFpbHMuLi4KPj4KPj4gSW4gcGFy
dGljdWxhciwgdGhpcyBtaXNzZXMgdGhlIEF0YXJpIFJPTSBwb3J0IElTQSBhZGFwdGVyIGNhc2Ug
LQo+Pgo+PiAgICAgICAgIHNlbGVjdCBIQVNfSU9QT1JUIGlmIFBDSSB8fCBJU0EgfHwgQVRBUklf
Uk9NX0lTQQo+Pgo+PiBtaWdodCBkbyBpbnN0ZWFkLgo+Cj4gUmlnaHQsIG1ha2VzIHNlbnNlLiBJ
IGhhZCBzdWdnZXN0ZWQgdG8gZ28gdGhlIGVhc3kgd2F5IGFuZCBhc3N1bWUgdGhhdAo+IGVhY2gg
YXJjaGl0ZWN0dXJlIHdvdWxkIHNlbGVjdCBIQVNfSU9QT1JUIGlmIGFueSBjb25maWd1cmF0aW9u
IHN1cHBvcnRzCj4gaXQsIGJ1dCBpdCBsb29rcyBsaWtlIGZvciBtNjhrIHRoZXJlIGlzIGEgY2xl
YXJseSBkZWZpbmVkIHNldCBvZiBwbGF0Zm9ybXMgdGhhdAo+IGRvLgo+Cj4gTm90ZSB0aGF0IGZv
ciB0aGUgcGxhdGZvcm1zIHRoYXQgZG9uJ3Qgc2V0IGFueSBvZiB0aGUgdGhyZWUgc3ltYm9scywg
dGhlCj4gZmFsbGJhY2sgbWFrZXMgaW5iKCkgYW4gYWxpYXMgZm9yIHJlYWRiKCkgd2l0aCBhIGRp
ZmZlcmVudCBhcmd1bWVudCB0eXBlLAo+IHNvIHRoZXJlIG1heSBiZSBtNjhrIHNwZWNpZmljIGRy
aXZlcnMgdGhhdCByZWx5IG9uIHRoaXMsIGJ1dCB0aG9zZSB3b3VsZAo+IGFscmVhZHkgYmUgYnJv
a2VuIGlmIEFUQVJJX1JPTV9JU0EgaXMgc2V0LgoKSSdkIGhvcGUgbm90IC0gd2Ugc3BlbnQgc29t
ZSBlZmZvcnQgdG8gbWFrZSBzdXJlIHNldHRpbmcgQVRBUklfUk9NX0lTQSAKZG9lcyBub3QgYWZm
ZWN0IG90aGVyIG02OGsgcGxhdGZvcm1zIHdoZW4gZS5nLiBidWlsZGluZyBtdWx0aXBsYXRmb3Jt
IAprZXJuZWxzLgoKUmVwbGFjaW5nIGluYigpIGJ5IHJlYWRiKCkgd2l0aG91dCBhbnkgYWRkcmVz
cyB0cmFuc2xhdGlvbiB3b24ndCBkbyBtdWNoIApnb29kIGZvciBtNjhrIHRob3VnaCAtIGFkZHJl
c3NlcyBpbiB0aGUgdHJhZGl0aW9uYWwgSVNBIEkvTyBwb3J0IHJhbmdlIAp3b3VsZCBoaXQgdGhl
ICh1bm1hcHBlZCkgemVybyBwYWdlLgoKQ2hlZXJzLAoKCU1pY2hhZWwKCj4KPiAgICAgICAgICAg
QXJuZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
