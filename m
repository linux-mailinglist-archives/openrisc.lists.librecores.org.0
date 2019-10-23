Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 512FFE2A62
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 08:24:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7EE1920140;
	Thu, 24 Oct 2019 08:24:21 +0200 (CEST)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by mail.librecores.org (Postfix) with ESMTPS id 6EC5720473
 for <openrisc@lists.librecores.org>; Wed, 23 Oct 2019 11:54:52 +0200 (CEST)
Received: by mail-lj1-f193.google.com with SMTP id q78so5249120lje.5
 for <openrisc@lists.librecores.org>; Wed, 23 Oct 2019 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=antmicro-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RseJbARsp4zZmSYZa3mBVZ+J4mOiNk8o0Hk/Uodixac=;
 b=oEa6goVbFlEFPi2VsLP+4D6bF276hL+d8S1U5fdHxP7AzDevelgMOsPlNNmZKXvujr
 djoqsLj1Gvel08INKZQmFQy1skvGYAdFQiUZWxgj6sc/qBvADTsHrnexKAfQY1DCibCw
 ZyT90uCs4hY+tCsnhfmfUGPP2cRwob1R0V3aHwWdP4tRTIu0iOW9JqFO8QyhOGPrNvL1
 H1hy73G8wFIduI+q/slN2TXdq/oTUdoR+pbcKlv48iCOYw1pEN1L4sDUjpNmUjDjGRKB
 Z41G5pSC+PSVRDdBU1CqrLuXtvHzQvOPm8uENpElUciKmm1oVYartpU1TamjwDtUtyVR
 Y5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RseJbARsp4zZmSYZa3mBVZ+J4mOiNk8o0Hk/Uodixac=;
 b=QsjOaiP1pxmFoPnrd+J3lu+Wp5f/bYL8HjSqjC2pBbTa4PvClKftnybawNsLL04iny
 XJVpLNKS/aAIgJG6DEW73kyUCIjzadN07U/e3/Q1dxg1QlhmtqeOn9iLTR26XA0WU+pe
 O5CIgV8w0vWUJW2iO/h3NGAjGOYbDIZ6olVakTa8I+d4avCShh25wT97khP8nfNPdeuG
 DV+60+O0pjn54OYWsLsx+xQIPUgfiZcyAAalY1i8B8KR2vKuC5aq4Y43MGn/QxFPVuo9
 +dDV5E9Z2XHxDZV1rY1XOdvN9POU7t8pOioG17Z7UHR+N7jz8kADw3omSbKq2/5TZ5g8
 Z5Hw==
X-Gm-Message-State: APjAAAXDIAc0uBD91Eiek9Typ60pfiiD66ouO39tkJI2j3EIGvl7aYBk
 sqOMappf7//0lrldDOmNpFmt4g==
X-Google-Smtp-Source: APXvYqyJl56KzCgKPlNhrUrXj1Ty6IPLUatOhK7VsrenqN8txKOggHYnkPZxIo57UYGpqchDKT4n0A==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr22200182ljb.51.1571824491757; 
 Wed, 23 Oct 2019 02:54:51 -0700 (PDT)
Received: from localhost.localdomain (d79-196.icpnet.pl. [77.65.79.196])
 by smtp.gmail.com with ESMTPSA id f8sm3176147ljj.98.2019.10.23.02.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 02:54:51 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:54:44 +0200
From: Mateusz Holenko <mholenko@antmicro.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Message-ID: <20191023115427.23684-1-mholenko@antmicro.com>
References: <20191023115427.23684-0-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023115427.23684-0-mholenko@antmicro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 24 Oct 2019 08:24:18 +0200
Subject: [OpenRISC] [PATCH 1/1] openrisc: add support for LiteX
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
Cc: devicetree@vger.kernel.org, Mateusz Holenko <mholenko@antmicro.com>,
 Filip Kokosinski <fkokosinski@internships.antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogRmlsaXAgS29rb3NpbnNraSA8Zmtva29zaW5za2lAaW50ZXJuc2hpcHMuYW50bWljcm8u
Y29tPgoKVGhpcyBhZGRzIHN1cHBvcnQgZm9yIGEgYmFzaWMgTGl0ZVgtYmFzZWQgU29DIHdpdGgg
YSBtb3Ixa3ggc29mdCBDUFUuCgpTaWduZWQtb2ZmLWJ5OiBGaWxpcCBLb2tvc2luc2tpIDxma29r
b3NpbnNraUBpbnRlcm5zaGlwcy5hbnRtaWNyby5jb20+ClNpZ25lZC1vZmYtYnk6IE1hdGV1c3og
SG9sZW5rbyA8bWhvbGVua29AYW50bWljcm8uY29tPgotLS0KIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFr
bGl0ZXguZHRzICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9vcGVucmlz
Yy9jb25maWdzL29yMWtsaXRleF9kZWZjb25maWcgfCAxOCArKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgNjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2Mv
Ym9vdC9kdHMvb3Ixa2xpdGV4LmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2Mv
Y29uZmlncy9vcjFrbGl0ZXhfZGVmY29uZmlnCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCBjMjRhMzc4MzNlNzguLmU4NGIyY2I0YzE4NiAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTk1MDAsNiArOTUwMCw3IEBAIFM6CU1h
aW50YWluZWQKIEY6CWluY2x1ZGUvbGludXgvbGl0ZXguaAogRjoJRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzLyovbGl0ZXgsKi55YW1sCiBGOglkcml2ZXJzL3R0eS9zZXJpYWwvbGl0
ZXVhcnQuYworRjoJYXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0ZXguZHRzCiAKIExJVkUg
UEFUQ0hJTkcKIE06CUpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRoYXQuY29tPgpkaWZmIC0t
Z2l0IGEvYXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0ZXguZHRzIGIvYXJjaC9vcGVucmlz
Yy9ib290L2R0cy9vcjFrbGl0ZXguZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uNjMzOTkzOTgwMDJkCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9i
b290L2R0cy9vcjFrbGl0ZXguZHRzCkBAIC0wLDAgKzEsNDkgQEAKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCisvKgorICogTGl0ZVgtYmFzZWQgU3lzdGVtIG9uIENoaXAKKyAq
CisgKiBDb3B5cmlnaHQgKEMpIDIwMTkgQW50bWljcm8gTHRkIDx3d3cuYW50bWljcm8uY29tPgor
ICovCisKKy9kdHMtdjEvOworLyB7CisJY29tcGF0aWJsZSA9ICJvcGVuY29yZXMsb3Ixa3NpbSI7
CisJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJI3NpemUtY2VsbHMgPSA8MT47CisJaW50ZXJydXB0
LXBhcmVudCA9IDwmcGljPjsKKworCWFsaWFzZXMgeworCQlzZXJpYWwwID0gJnNlcmlhbDA7CisJ
fTsKKworCWNob3NlbiB7CisJCWJvb3RhcmdzID0gImNvbnNvbGU9bGl0ZXVhcnQiOworCX07CisK
KwltZW1vcnlAMCB7CisJCWRldmljZV90eXBlID0gIm1lbW9yeSI7CisJCXJlZyA9IDwweDAwMDAw
MDAwIDB4MTAwMDAwMDA+OworCX07CisKKwljcHVzIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisJCSNzaXplLWNlbGxzID0gPDA+OworCQljcHVAMCB7CisJCQljb21wYXRpYmxlID0gIm9wZW5j
b3JlcyxvcjEyMDAtcnRsc3ZuNDgxIjsKKwkJCXJlZyA9IDwwPjsKKwkJCWNsb2NrLWZyZXF1ZW5j
eSA9IDwxMDAwMDAwMDA+OworCQl9OworCX07CisKKwlwaWM6IHBpYyB7CisJCWNvbXBhdGlibGUg
PSAib3BlbmNvcmVzLG9yMWstcGljIjsKKwkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsKKwkJaW50
ZXJydXB0LWNvbnRyb2xsZXI7CisJfTsKKworCXNlcmlhbDA6IHNlcmlhbEBlMDAwMTgwMCB7CisJ
CWRldmljZV90eXBlID0gInNlcmlhbCI7CisJCWNvbXBhdGlibGUgPSAibGl0ZXgsbGl0ZXVhcnQi
OworCQlyZWcgPSA8MHhlMDAwMTgwMCAweDEwMD47CisJfTsKK307CmRpZmYgLS1naXQgYS9hcmNo
L29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa2xpdGV4X2RlZmNvbmZpZyBiL2FyY2gvb3BlbnJpc2MvY29u
Zmlncy9vcjFrbGl0ZXhfZGVmY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uMGU0YzJlNzQ0NTFjCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9j
b25maWdzL29yMWtsaXRleF9kZWZjb25maWcKQEAgLTAsMCArMSwxOCBAQAorQ09ORklHX0JMS19E
RVZfSU5JVFJEPXkKK0NPTkZJR19CT09UUEFSQU1fU09GVExPQ0tVUF9QQU5JQz15CitDT05GSUdf
QlVHX09OX0RBVEFfQ09SUlVQVElPTj15CitDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkU9eQor
Q09ORklHX0NST1NTX0NPTVBJTEU9Im9yMzItbGludXgtIgorQ09ORklHX0RFVlRNUEZTPXkKK0NP
TkZJR19ERVZUTVBGU19NT1VOVD15CitDT05GSUdfRU1CRURERUQ9eQorQ09ORklHX0haXzEwMD15
CitDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0ib3BlbnJpc2Mtcm9vdGZzLmNwaW8uZ3oiCitDT05G
SUdfT0ZfT1ZFUkxBWT15CitDT05GSUdfT1BFTlJJU0NfQlVJTFRJTl9EVEI9Im9yMWtsaXRleCIK
K0NPTkZJR19QQU5JQ19PTl9PT1BTPXkKK0NPTkZJR19QUklOVEtfVElNRT15CitDT05GSUdfU0VS
SUFMX0xJVEVVQVJUPXkKK0NPTkZJR19TRVJJQUxfTElURVVBUlRfQ09OU09MRT15CitDT05GSUdf
U09GVExPQ0tVUF9ERVRFQ1RPUj15CitDT05GSUdfVFRZX1BSSU5USz15Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
