Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EBBBE48082C
	for <lists+openrisc@lfdr.de>; Tue, 28 Dec 2021 11:08:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 970A4213A6;
	Tue, 28 Dec 2021 11:08:30 +0100 (CET)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mail.librecores.org (Postfix) with ESMTPS id DA2B22012B
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 11:08:28 +0100 (CET)
Received: by mail-pj1-f41.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso16659859pjb.1
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 02:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LdjVJCupkO66VZRPSdtPXWlxTkxQlblL8anKkt6w1Y=;
 b=h/wwbR6Gkd84rdbzLviQesP2N02dChdZcNZPnoqvffPW88DiXsGOgOfYm8C3H0BnN1
 VGSkpfGwQ35EiWlOLUUKDh/Cc0xwKuMHwc7FlgkHg7XR5OPBoVbZT6SL2fHghxHWOpRB
 C8xLpRHWVkJEzHSuhKnPNzk2BkAKbwyg+vvPd44ypHKSOAjtGerRdZhQRI2g2uYAZ8xQ
 neucHfaNmQG0rxbq4U47XNoBTv134+HPcETTHCVvEUsKALFvje/sSxjZb59SoAW/vCGF
 U5IhPO5dfxQPeEbFHCqZf0Opcai6p/TSz1tH7ZgHvoCNXz0WeiPpbvhuBbFRInOMUS+V
 X7kg==
X-Gm-Message-State: AOAM533pgkq0EZ05i8PTDjfzfgVe/4Y3VV+GuxTFD+wZyX6VacV0Un+3
 DTAiDou98+2FMREejCRaB7lsF5x8J4kZAA==
X-Google-Smtp-Source: ABdhPJy+J6oXY/mVCaO/AE7t364UnN3ZbHiddIqlKeSbAXRfrnrpW/eozDVP+eb3LPy+6nlM2KP2Rw==
X-Received: by 2002:a17:90b:50e:: with SMTP id
 r14mr25480055pjz.175.1640686107092; 
 Tue, 28 Dec 2021 02:08:27 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50])
 by smtp.gmail.com with ESMTPSA id f16sm17571608pfv.135.2021.12.28.02.08.26
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:08:26 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so16624257pjb.5
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 02:08:26 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id
 j38mr6293010vkd.39.1640686096258; 
 Tue, 28 Dec 2021 02:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-3-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
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
 Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTmlrbGFzLAoKT24gTW9uLCBEZWMgMjcsIDIwMjEgYXQgNTo0NCBQTSBOaWtsYXMgU2NobmVs
bGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+IFdlIGludHJvZHVjZSBhIG5ldyBI
QVNfSU9QT1JUIEtjb25maWcgb3B0aW9uIHRvIGdhdGUgc3VwcG9ydCBmb3IKPiBJL08gcG9ydCBh
Y2Nlc3MuIEluIGEgZnV0dXJlIHBhdGNoIEhBU19JT1BPUlQ9biB3aWxsIGRpc2FibGUgY29tcGls
YXRpb24KPiBvZiB0aGUgSS9PIGFjY2Vzc29yIGZ1bmN0aW9ucyBpbmIoKS9vdXRiKCkgYW5kIGZy
aWVuZHMgb24gYXJjaGl0ZWN0dXJlcwo+IHdoaWNoIGNhbiBub3QgbWVhbmluZ2Z1bGx5IHN1cHBv
cnQgbGVnYWN5IEkvTyBzcGFjZXMuIE9uIHRoZXNlIHBsYXRmb3Jtcwo+IGluYigpL291dGIoKSBl
dGMgYXJlIGN1cnJlbnRseSBqdXN0IHN0dWJzIGluIGFzbS1nZW5lcmljL2lvLmggd2hpY2ggd2hl
bgo+IGNhbGxlZCB3aWxsIGNhdXNlIGEgTlVMTCBwb2ludGVyIGFjY2VzcyB3aGljaCBzb21lIGNv
bXBpbGVycyBhY3R1YWxseQo+IGRldGVjdCBhbmQgd2FybiBhYm91dC4KPgo+IFRoZSBkZXBlbmRl
bmNpZXMgb24gSEFTX0lPUE9SVCBpbiBkcml2ZXJzIGFzIHdlbGwgYXMgaWZkZWZzIGZvcgo+IEhB
U19JT1BPUlQgc3BlY2lmaWMgc2VjdGlvbnMgd2lsbCBiZSBhZGRlZCBpbiBzdWJzZXF1ZW50IHBh
dGNoZXMgb24KPiBhIHBlciBzdWJzeXN0ZW0gYmFzaXMuIFRoZW4gYSBmaW5hbCBwYXRjaCB3aWxs
IGlmZGVmIHRoZSBJL08gYWNjZXNzCj4gZnVuY3Rpb25zIG9uIEhBU19JT1BPUlQgdGh1cyB0dXJu
aW5nIGFueSB1c2Ugbm90IGdhdGVkIGJ5IEhBU19JT1BPUlQKPiBpbnRvIGEgY29tcGlsZS10aW1l
IHdhcm5pbmcuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSGstPXdn
ODBqZT1LN21hZEY0ZTdXclJOcDM3ZTNxaDZ5MTBTdmhkYzdPOFNaXy04Z0BtYWlsLmdtYWlsLmNv
bS8KPiBDby1kZXZlbG9wZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogTmlrbGFzIFNjaG5lbGxlIDxzY2huZWxsZUBsaW51eC5pYm0uY29tPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL202OGsvS2NvbmZpZwo+ICsrKyBiL2FyY2gvbTY4
ay9LY29uZmlnCj4gQEAgLTE2LDYgKzE2LDcgQEAgY29uZmlnIE02OEsKPiAgICAgICAgIHNlbGVj
dCBHRU5FUklDX0NQVV9ERVZJQ0VTCj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19JT01BUAo+ICAg
ICAgICAgc2VsZWN0IEdFTkVSSUNfSVJRX1NIT1cKPiArICAgICAgIHNlbGVjdCBIQVNfSU9QT1JU
Cj4gICAgICAgICBzZWxlY3QgSEFWRV9BT1VUIGlmIE1NVQo+ICAgICAgICAgc2VsZWN0IEhBVkVf
QVNNX01PRFZFUlNJT05TCj4gICAgICAgICBzZWxlY3QgSEFWRV9ERUJVR19CVUdWRVJCT1NFCgpU
aGlzIGxvb2tzIHdheSB0b28gYnJvYWQgdG8gbWU6IG1vc3QgbTY4ayBwbGF0Zm9ybSBkbyBub3Qg
aGF2ZSBJL08KcG9ydCBhY2Nlc3Mgc3VwcG9ydC4KCk15IGd1dCBmZWVsaW5nIHNheXM6CgogICAg
c2VsZWN0IEhBU19JT1BPUlQgaWYgUENJIHx8IElTQQoKYnV0IHRoYXQgbWlnaHQgbWlzcyBzb21l
IGludHJpY2F0ZSBkZXRhaWxzLi4uCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
