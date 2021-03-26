Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C73534B0E3
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 892DA212D4;
	Fri, 26 Mar 2021 21:52:22 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CE589200E4
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 16:42:53 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69E8261A36
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616773369;
 bh=vsTZ/vYOkJZ+dX5RIeYP0sX4VHZ0dMLJGNZeZ1Bm2LQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DUfi5ugO3VGJM2909lBb9UInMPNrDa6EKQqVta1cIaa0jmi9PW3AK/KjrURwAztbo
 i8x5fBqV0zqtki7tKp5qsvRSp+6JN+/eJ6Ieou5FWpav1oVdXzMR9PQmnDp1YWOfOs
 rjJ3avEH5azOsGiVuuyxYhIiIBwrj4oZjmpnUvQIneHge5J52ma4iOUznrC66JY4V8
 tPmhAAColcWAlYEXk93IiPpU/VFt/H+KOGM/w6qxjuUILfYJP2A9DdngmKH0rgvYm1
 Dqclqe/hpH6HH+86ckSN06JT8aWetb7V0wJymW/nFAsU2yRrYVduN9qA2/Ow3crzZ9
 +c/utZ5v2WmJQ==
Received: by mail-ej1-f45.google.com with SMTP id k10so9144691ejg.0
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 08:42:49 -0700 (PDT)
X-Gm-Message-State: AOAM533b6FXspigcVn1nouuT16ywXmsoykvlkxSCbTpWXKMODOXnUvWc
 eoSsJo9nYNbgLphr5wZ7PtNodSy7k+94OggX0A==
X-Google-Smtp-Source: ABdhPJw290YYi5Bn9eJbiCdu+yLMROaG22thNNy/WhodM/XBcUW19HUG6/I3aYcxY0qwZKx/hSfuN8oDM18cKkgl6sQ=
X-Received: by 2002:a17:906:7d48:: with SMTP id
 l8mr15784305ejp.108.1616773367877; 
 Fri, 26 Mar 2021 08:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:42:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Message-ID: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: Re: [OpenRISC] [PATCH v3 01/17] cmdline: Add generic function to
 build command line.
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
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgNzo0NCBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4gVGhpcyBjb2RlIHByb3ZpZGVzIGFyY2hp
dGVjdHVyZXMgd2l0aCBhIHdheSB0byBidWlsZCBjb21tYW5kIGxpbmUKPiBiYXNlZCBvbiB3aGF0
IGlzIGJ1aWx0IGluIHRoZSBrZXJuZWwgYW5kIHdoYXQgaXMgaGFuZGVkIG92ZXIgYnkgdGhlCj4g
Ym9vdGxvYWRlciwgYmFzZWQgb24gc2VsZWN0ZWQgY29tcGlsZS10aW1lIG9wdGlvbnMuCgpOb3Rl
IHRoYXQgSSBoYXZlIHRoaXMgcGF0Y2ggcGVuZGluZzoKCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjEwMzE2MTkzODIwLjMx
MzctMS1hbGV4QGdoaXRpLmZyLwoKSXQncyBnb2luZyB0byBuZWVkIHRvIGJlIGFkYXB0ZWQgZm9y
IHRoaXMuIEkndmUgaGVsZCBvZmYgYXBwbHlpbmcgdG8Kc2VlIGlmIHRoaXMgZ2V0cyBzZXR0bGVk
LgoKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4KPiAtLS0KPiB2MzoKPiAtIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIFdpbGwK
PiAtIEFkZGVkIGNhcGFiaWxpdHkgdG8gaGF2ZSBzcmMgPT0gZHN0Cj4gLS0tCj4gIGluY2x1ZGUv
bGludXgvY21kbGluZS5oIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvbGludXgvY21kbGluZS5oCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9jbWRsaW5lLmggYi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kZWE4N2VkZDQxYmUKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPiBAQCAtMCwwICsxLDU3IEBACj4gKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKyNpZm5kZWYgX0xJTlVYX0NN
RExJTkVfSAo+ICsjZGVmaW5lIF9MSU5VWF9DTURMSU5FX0gKPiArCj4gKyNpbmNsdWRlIDxsaW51
eC9zdHJpbmcuaD4KPiArCj4gKy8qIEFsbG93IGFyY2hpdGVjdHVyZXMgdG8gb3ZlcnJpZGUgc3Ry
bGNhdCwgcG93ZXJwYyBjYW4ndCB1c2Ugc3RyaW5ncyBzbyBlYXJseSAqLwo+ICsjaWZuZGVmIGNt
ZGxpbmVfc3RybGNhdAo+ICsjZGVmaW5lIGNtZGxpbmVfc3RybGNhdCBzdHJsY2F0Cj4gKyNlbmRp
Zgo+ICsKPiArLyoKPiArICogVGhpcyBmdW5jdGlvbiB3aWxsIGFwcGVuZCBvciBwcmVwZW5kIGEg
YnVpbHRpbiBjb21tYW5kIGxpbmUgdG8gdGhlIGNvbW1hbmQKPiArICogbGluZSBwcm92aWRlZCBi
eSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNhbiBiZSB1c2VkIHRvIGFsdGVyCj4g
KyAqIHRoZSBiZWhhdmlvciBvZiB0aGlzIGJ1aWx0aW4gY29tbWFuZCBsaW5lLgo+ICsgKiBAZHN0
OiBUaGUgZGVzdGluYXRpb24gb2YgdGhlIGZpbmFsIGFwcGVuZGVkL3ByZXBlbmRlZCBzdHJpbmcu
Cj4gKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBpZiB0aGVyZSBpc24ndCBv
bmUuCj4gKyAqIEBsZW46IHRoZSBsZW5ndGggb2YgZGVzdCBidWZmZXIuCj4gKyAqLwo+ICtzdGF0
aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jbWRsaW5lX2J1aWxkKGNoYXIgKmRzdCwgY29uc3Qg
Y2hhciAqc3JjLCBzaXplX3QgbGVuKQo+ICt7Cj4gKyAgICAgICBpZiAoIWxlbiB8fCBzcmMgPT0g
ZHN0KQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgaWYgKElTX0VOQUJM
RUQoQ09ORklHX0NNRExJTkVfRk9SQ0UpIHx8ICFzcmMpIHsKPiArICAgICAgICAgICAgICAgZHN0
WzBdID0gMDsKPiArICAgICAgICAgICAgICAgY21kbGluZV9zdHJsY2F0KGRzdCwgQ09ORklHX0NN
RExJTkUsIGxlbik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0KPiArCj4g
KyAgICAgICBpZiAoZHN0ICE9IHNyYykKPiArICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPiAr
Cj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9QUkVQRU5EKSkKPiArICAg
ICAgICAgICAgICAgY21kbGluZV9zdHJsY2F0KGRzdCwgQ09ORklHX0NNRExJTkUgIiAiLCBsZW4p
Owo+ICsKPiArICAgICAgIGNtZGxpbmVfc3RybGNhdChkc3QsIHNyYywgbGVuKTsKPiArCj4gKyAg
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpKQoKU2hvdWxkIGJlIEFQ
UEVORC4KCj4gKyAgICAgICAgICAgICAgIGNtZGxpbmVfc3RybGNhdChkc3QsICIgIiBDT05GSUdf
Q01ETElORSwgbGVuKTsKPiArfQo+ICsKPiArI2RlZmluZSBjbWRsaW5lX2J1aWxkKGRzdCwgc3Jj
LCBsZW4pIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCgpQZXJoYXBzIGEgY29t
bWVudCB3aHkgd2UgbmVlZCB0aGlzIHRvIGJlIGEgZGVmaW5lLgoKPiArICAgICAgIGNoYXIgKl9f
Y19kc3QgPSAoZHN0KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICBjb25zdCBjaGFyICpfX2Nfc3JjID0gKHNyYyk7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIGlmIChfX2Nf
c3JjID09IF9fY19kc3QpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICAgICAgICAgIHN0YXRpYyBjaGFyIF9fY190bXBbQ09NTUFORF9MSU5FX1NJWkVd
IF9faW5pdGRhdGEgPSAiIjsgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAg
Y21kbGluZV9zdHJsY2F0KF9fY190bXAsIF9fY19zcmMsIENPTU1BTkRfTElORV9TSVpFKTsgICBc
Cj4gKyAgICAgICAgICAgICAgIF9fY21kbGluZV9idWlsZChfX2NfZHN0LCBfX2NfdG1wLCAobGVu
KSk7ICAgICAgICAgICAgICAgXAo+ICsgICAgICAgfSBlbHNlIHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAg
X19jbWRsaW5lX2J1aWxkKF9fY19kc3QsIF9fY19zcmMsIChsZW4pKTsgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICt9IHdoaWxlICgwKQo+ICsKPiArI2VuZGlmIC8qIF9MSU5V
WF9DTURMSU5FX0ggKi8KPiAtLQo+IDIuMjUuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
