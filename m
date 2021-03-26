Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D696934B0E2
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 808FF212D2;
	Fri, 26 Mar 2021 21:52:21 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CACC02068F
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 16:27:03 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A4D161A2A
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616772421;
 bh=PgZvub/EEgXyOMtj36/Ui5nnRJqFFaiQoQ/VbltMCjA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eg+BwZGAwSyILfvPcAOTVne302pKV2q+cmm5Ihp4Me5aUHSjUNGW3+nDtB8R91wcm
 C2DZ9VNhmbn0jETV9GNehbOwe3JTYKhoqjnh/MiS11ee4oxdvW0wRf2ZrWgUDyfJma
 hWNpN/TDOWiJIBIfJozhEVq7FS6Mk6XBvB49orLZFW6uYQR5hUuZGCCK5sAk8SD5SC
 UeP3y50GhNpSvcc4yWyh8y4La1rfFodfJDuofdgE1ai4ujHIVkZF7oQxbAyMF7RCJU
 u626vT1IL6nOSZEgmRmqhiGrDEBDKZfd4AiSGwBgBRCvns974kHSj2o73ajFlbU9P5
 x5eyEjjSzm5/A==
Received: by mail-ed1-f52.google.com with SMTP id e7so6727286edu.10
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 08:27:01 -0700 (PDT)
X-Gm-Message-State: AOAM530DqmH68xIVc853Jj5w8t2pxrUYt9TwR9L/6jMUyUxeQGATDS46
 4otLbIgKWH1bs47iivd/G+D2RCLyjV6zOl2djw==
X-Google-Smtp-Source: ABdhPJwqjia+Et0ifS4Qa3YP7BG89nAuXW50XJw7Bv12OLaUbiQxEkJ38eyAu5ZhN7DqGhRVJR72+O39P4k/LsEHPLw=
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr16004050edd.258.1616772420155; 
 Fri, 26 Mar 2021 08:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
In-Reply-To: <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:26:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Message-ID: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: Re: [OpenRISC] [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgODoyMCBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDI2LzAzLzIwMjEgw6AgMTU6
MDgsIEFuZHJlYXMgU2Nod2FiIGEgw6ljcml0IDoKPiA+IE9uIE3DpHIgMjYgMjAyMSwgQ2hyaXN0
b3BoZSBMZXJveSB3cm90ZToKPiA+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPj4gaW5kZXggZjhmMTUzMzJj
YWEyLi5lN2M5MWVlNDc4ZDEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+PiBAQCAtMjAsNiAr
MjAsNyBAQAo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3N3aW90bGIuaD4KPiA+PiAgICNpbmNsdWRl
IDxsaW51eC9zbXAuaD4KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9lZmkuaD4KPiA+PiArI2luY2x1
ZGUgPGxpbnV4L2NtZGxpbmUuaD4KPiA+Pgo+ID4+ICAgI2luY2x1ZGUgPGFzbS9jcHVfb3BzLmg+
Cj4gPj4gICAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KPiA+PiBAQCAtMjI4LDEwICsy
MjksOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4gPj4gICAgICB9Cj4g
Pj4KPiA+PiAgICAgIHByX2VycigiTm8gRFRCIHBhc3NlZCB0byB0aGUga2VybmVsXG4iKTsKPiA+
PiAtI2lmZGVmIENPTkZJR19DTURMSU5FX0ZPUkNFCj4gPj4gLSAgICBzdHJsY3B5KGJvb3RfY29t
bWFuZF9saW5lLCBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+ID4+ICsgICAg
Y21kbGluZV9idWlsZChib290X2NvbW1hbmRfbGluZSwgTlVMTCwgQ09NTUFORF9MSU5FX1NJWkUp
Owo+ID4+ICAgICAgcHJfaW5mbygiRm9yY2luZyBrZXJuZWwgY29tbWFuZCBsaW5lIHRvOiAlc1xu
IiwgYm9vdF9jb21tYW5kX2xpbmUpOwo+ID4KPiA+IFNob3VsZG4ndCB0aGF0IG1lc3NhZ2UgYmVj
b21lIGNvbmRpdGlvbmFsIGluIHNvbWUgd2F5Pwo+ID4KPgo+IFlvdSBhcmUgcmlnaHQsIEkgZGlk
IHNvbWV0aGluZyBzaW1pbGFyIG9uIEFSTSBidXQgbG9va3MgbGlrZSBJIG1pc3NlZCBpdCBvbiBS
SVNDVi4KCkhvdyBpcyB0aGlzIGh1bmsgZXZlbiB1c2VmdWw/IFVuZGVyIHdoYXQgY29uZGl0aW9u
cyBjYW4geW91IGJvb3QKd2l0aG91dCBhIERUQj8gRXZlbiB3aXRoIGEgYnVpbHQtaW4gRFRCLCB0
aGUgRFQgY21kbGluZSBoYW5kbGluZyB3b3VsZApiZSBjYWxsZWQuCgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
