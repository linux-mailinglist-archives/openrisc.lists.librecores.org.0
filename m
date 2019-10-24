Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ADF08E7A4F
	for <lists+openrisc@lfdr.de>; Mon, 28 Oct 2019 21:41:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2C9072057B;
	Mon, 28 Oct 2019 21:41:09 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id E9AAA20564
 for <openrisc@lists.librecores.org>; Thu, 24 Oct 2019 23:27:00 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id f19so62723pgn.13
 for <openrisc@lists.librecores.org>; Thu, 24 Oct 2019 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kUkEbegezOtNGv0tUZu87phHyx71IxZmkeyn60SQnOg=;
 b=En/E4jkLnZHZy+mU0n+xYo6A5B2QCPZA7Q5Kl1DQ+zCBV2Hc9wujaBMWBIae6tUFs4
 tIcWnJGOEas0Od0B5sk2Ti3COX9G44JnBiYC282/0jlx7tOc0tenD0sXLtqAmoB6CNS9
 6SgVrQwFsaaOX+qnA/Byep1ttXDrnwRjv2jfKA2naIWKz5oHetekopM1VVPsAxLJOkCQ
 oKnBFocH6OnRolWm3MB9T2WRI3+VyYB5OjJWz1D4Of8d64k+zNXQmcbnMaCNgv56F+Jj
 /9dVAMeY3RoPG/51PUPpwCYtvWiTBP3lgfy9NRiLwmV+4DEmHcgi8u4A1rjlGptiuU83
 JABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kUkEbegezOtNGv0tUZu87phHyx71IxZmkeyn60SQnOg=;
 b=qEjW+ucp2tcbXCT7ErFVtjhPe6DLoOGXuZoiEkjwjiRk4ZfF3Jm2ZIyu7vlSJrFQUR
 91Iw0UVn0iW3cl73C0qF1e85plqVsIsqwvYPAHD3APLeU2VCD/1eYhjyEle0nClhsFK0
 w0ew3YmNhhrCgP+hjKBtjJtF6+mnXQyOZgbfOQVcDaOFYPlh9Puqh1yf7g9/d4EwzJBr
 MHUgOEoNsDuFqUsv9RNrA47VbCNwmnRs0oTB2q/M4C1Ev3vdjO9KLP3X1eF6L14qwRuD
 sLM0LQgQpIiVVUP68ehFc6CF2lJRkcAZ5nz58TrmmFd2Q92DO6SRoEJwX335BxwqDzFX
 N46Q==
X-Gm-Message-State: APjAAAWohICDQvBst90gr5hrx/jFd1fuNmdzLso7lk2cMXpuQ8puQHJG
 wuEHGCoB8JSbygpXYQcP/YQ=
X-Google-Smtp-Source: APXvYqy6D+C9a9cPHnf7c33gGSyEGcOdFs+7BB5wTPvhaC/RYI6SU99fdnydvmpO1wCIr8aRTVKUTQ==
X-Received: by 2002:a65:5503:: with SMTP id f3mr106651pgr.351.1571952418762;
 Thu, 24 Oct 2019 14:26:58 -0700 (PDT)
Received: from localhost (g143.222-224-150.ppp.wakwak.ne.jp. [222.224.150.143])
 by smtp.gmail.com with ESMTPSA id y17sm41661514pfo.171.2019.10.24.14.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 14:26:58 -0700 (PDT)
Date: Fri, 25 Oct 2019 06:26:55 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mateusz Holenko <mholenko@antmicro.com>
Message-ID: <20191024212655.GJ24874@lianli.shorne-pla.net>
References: <20191023115427.23684-0-mholenko@antmicro.com>
 <20191023115427.23684-1-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023115427.23684-1-mholenko@antmicro.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 28 Oct 2019 21:41:08 +0100
Subject: Re: [OpenRISC] [PATCH 1/1] openrisc: add support for LiteX
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonas Bonn <jonas@southpole.se>,
 devicetree@vger.kernel.org,
 Filip Kokosinski <fkokosinski@internships.antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMTo1NDo0NEFNICswMjAwLCBNYXRldXN6
IEhvbGVua28gd3JvdGU6Cj4gRnJvbTogRmlsaXAgS29rb3NpbnNraSA8Zmtva29zaW5za2lAaW50
ZXJuc2hpcHMuYW50bWljcm8uY29tPgo+IAo+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciBhIGJhc2lj
IExpdGVYLWJhc2VkIFNvQyB3aXRoIGEgbW9yMWt4IHNvZnQgQ1BVLgoKVGhhbmtzIGZvciBnZXR0
aW5nIHRoZXNlIHBhdGNoZXMgcmVhZHkuCiAKPiBTaWduZWQtb2ZmLWJ5OiBGaWxpcCBLb2tvc2lu
c2tpIDxma29rb3NpbnNraUBpbnRlcm5zaGlwcy5hbnRtaWNyby5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogTWF0ZXVzeiBIb2xlbmtvIDxtaG9sZW5rb0BhbnRtaWNyby5jb20+Cj4gLS0tCj4gIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL29wZW5y
aXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysr
KysrCj4gIGFyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFrbGl0ZXhfZGVmY29uZmlnIHwgMTggKysr
KysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0ZXguZHRzCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa2xpdGV4X2RlZmNvbmZpZwo+IAo+
IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggYzI0YTM3ODMz
ZTc4Li5lODRiMmNiNGMxODYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlO
VEFJTkVSUwo+IEBAIC05NTAwLDYgKzk1MDAsNyBAQCBTOglNYWludGFpbmVkCj4gIEY6CWluY2x1
ZGUvbGludXgvbGl0ZXguaAo+ICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Ki9saXRleCwqLnlhbWwKPiAgRjoJZHJpdmVycy90dHkvc2VyaWFsL2xpdGV1YXJ0LmMKPiArRjoJ
YXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0ZXguZHRzCj4gIAo+ICBMSVZFIFBBVENISU5H
Cj4gIE06CUpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRoYXQuY29tPgo+IGRpZmYgLS1naXQg
YS9hcmNoL29wZW5yaXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMgYi9hcmNoL29wZW5yaXNjL2Jv
b3QvZHRzL29yMWtsaXRleC5kdHMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNjMzOTkzOTgwMDJkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvb3BlbnJp
c2MvYm9vdC9kdHMvb3Ixa2xpdGV4LmR0cwo+IEBAIC0wLDAgKzEsNDkgQEAKPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogTGl0ZVgtYmFzZWQgU3lzdGVt
IG9uIENoaXAKPiArICoKPiArICogQ29weXJpZ2h0IChDKSAyMDE5IEFudG1pY3JvIEx0ZCA8d3d3
LmFudG1pY3JvLmNvbT4KPiArICovCj4gKwo+ICsvZHRzLXYxLzsKPiArLyB7Cj4gKwljb21wYXRp
YmxlID0gIm9wZW5jb3JlcyxvcjFrc2ltIjsKPiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJ
I3NpemUtY2VsbHMgPSA8MT47Cj4gKwlpbnRlcnJ1cHQtcGFyZW50ID0gPCZwaWM+Owo+ICsKPiAr
CWFsaWFzZXMgewo+ICsJCXNlcmlhbDAgPSAmc2VyaWFsMDsKPiArCX07Cj4gKwo+ICsJY2hvc2Vu
IHsKPiArCQlib290YXJncyA9ICJjb25zb2xlPWxpdGV1YXJ0IjsKCkFzIHRoaXMgZGVwZW50cyBv
biBsaXRleCB1YXJ0IEkgd2lsbCB3YWl0IHRvIHF1ZXVlIHRoaXMgdW50aWwgaXQgbG9va3MgbGlr
ZSB0aGUKdWFydCBwYXRjaGVzIGFyZSBhY2NlcHRlZCBmb3IgNS41IG1lcmdlIHdpbmRvdy4KCj4g
Kwl9Owo+ICsKPiArCW1lbW9yeUAwIHsKPiArCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ICsJ
CXJlZyA9IDwweDAwMDAwMDAwIDB4MTAwMDAwMDA+Owo+ICsJfTsKPiArCj4gKwljcHVzIHsKPiAr
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiArCQljcHVA
MCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAib3BlbmNvcmVzLG9yMTIwMC1ydGxzdm40ODEiOwo+ICsJ
CQlyZWcgPSA8MD47Cj4gKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+ICsJCX07
Cj4gKwl9Owo+ICsKPiArCXBpYzogcGljIHsKPiArCQljb21wYXRpYmxlID0gIm9wZW5jb3Jlcyxv
cjFrLXBpYyI7Cj4gKwkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiArCQlpbnRlcnJ1cHQtY29u
dHJvbGxlcjsKPiArCX07Cj4gKwo+ICsJc2VyaWFsMDogc2VyaWFsQGUwMDAxODAwIHsKPiArCQlk
ZXZpY2VfdHlwZSA9ICJzZXJpYWwiOwo+ICsJCWNvbXBhdGlibGUgPSAibGl0ZXgsbGl0ZXVhcnQi
Owo+ICsJCXJlZyA9IDwweGUwMDAxODAwIDB4MTAwPjsKPiArCX07Cj4gK307Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFrbGl0ZXhfZGVmY29uZmlnIGIvYXJjaC9vcGVu
cmlzYy9jb25maWdzL29yMWtsaXRleF9kZWZjb25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uMGU0YzJlNzQ0NTFjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L2FyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFrbGl0ZXhfZGVmY29uZmlnCj4gQEAgLTAsMCArMSwx
OCBAQAo+ICtDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQo+ICtDT05GSUdfQk9PVFBBUkFNX1NPRlRM
T0NLVVBfUEFOSUM9eQo+ICtDT05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTj15Cj4gK0NPTkZJ
R19DQ19PUFRJTUlaRV9GT1JfU0laRT15Cj4gK0NPTkZJR19DUk9TU19DT01QSUxFPSJvcjMyLWxp
bnV4LSIKCldlIHVzZSBvcjFrLWxpbnV4LSBub3cuICBJcyB0aGlzIHdoYXQgeW91IHJlYWxseSB1
c2U/Cgo+ICtDT05GSUdfREVWVE1QRlM9eQo+ICtDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQo+ICtD
T05GSUdfRU1CRURERUQ9eQo+ICtDT05GSUdfSFpfMTAwPXkKPiArQ09ORklHX0lOSVRSQU1GU19T
T1VSQ0U9Im9wZW5yaXNjLXJvb3Rmcy5jcGlvLmd6Igo+ICtDT05GSUdfT0ZfT1ZFUkxBWT15Cj4g
K0NPTkZJR19PUEVOUklTQ19CVUlMVElOX0RUQj0ib3Ixa2xpdGV4Igo+ICtDT05GSUdfUEFOSUNf
T05fT09QUz15Cj4gK0NPTkZJR19QUklOVEtfVElNRT15Cj4gK0NPTkZJR19TRVJJQUxfTElURVVB
UlQ9eQo+ICtDT05GSUdfU0VSSUFMX0xJVEVVQVJUX0NPTlNPTEU9eQoKTm90ZSwgTGl0ZXggdWFy
dCBkZXBlbmRlbmN5IGxvb2tkcyBmaW5lIG5lcmUuCgo+ICtDT05GSUdfU09GVExPQ0tVUF9ERVRF
Q1RPUj15Cj4gK0NPTkZJR19UVFlfUFJJTlRLPXkKPiAtLSAKPiAyLjIzLjAKPiAKCi1TdGFmZm9y
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
