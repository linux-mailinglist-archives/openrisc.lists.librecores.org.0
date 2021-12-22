Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B589E47D83B
	for <lists+openrisc@lfdr.de>; Wed, 22 Dec 2021 21:20:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 549E3242E7;
	Wed, 22 Dec 2021 21:20:16 +0100 (CET)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mail.librecores.org (Postfix) with ESMTPS id 5FF44212F0
 for <openrisc@lists.librecores.org>; Wed, 22 Dec 2021 21:20:14 +0100 (CET)
Received: by mail-qt1-f179.google.com with SMTP id m18so2554942qtk.3
 for <openrisc@lists.librecores.org>; Wed, 22 Dec 2021 12:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b3cvfmQ1aazSj/qls2DVKyKp4XZTPtx0c1hcgA/WatY=;
 b=moDsbYZJek2H5zTs4EEHcmskJJHRLZqLEDousrz5Oky/QtbpkHCh8ggRvs9roTM+lX
 eIXi5USMamHkj9swjogy+JCKVU4AXwbiawGgxpqZppCgmNaRMBcgKrdbCJ9ZTE820jGW
 kKNtJjKle71SsdcGMPQq0hqR2uEDGP8j5AKESrilRCAmTs3JSURibn0dCTVN2EGkuzb1
 v4UcpUAp5wo1u2ZENKqPuF4Yymz5OjCzJcWLhW9GCVCeV7g16UjWWiywLkYjWPM0jwNq
 vaB9+4tzr5Kq16CuMZIcHOjBmZ526M33lc6zsU+5MijFeseivGB8yrlxFJab1g8hywT5
 usrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b3cvfmQ1aazSj/qls2DVKyKp4XZTPtx0c1hcgA/WatY=;
 b=J1Gk4Bc09v3Uym7Dpz5Y693so66PWN6iFB4ORPUSkJe7f40LH1vzWyRXKqPZXtYP0L
 BAcaiZXUiItAT0/nAUsy8BQzMeqM0ixTR5Q7AhOoqyGYTRiERhthcUpCWmYb4Th0+GT6
 5nyAN9xgwwqAXCvnI+W5hU3KN1ssdyElN2CLTcTXAlDS7MxW14L83IqgrhnWQp6m0SRQ
 mZUv24s8YgTT7YxOYfLQkw0q66I6rCs430l3bB80yGVXaFUKFQ3PNDMnLyaIP4vdmpHX
 QsOF52Ol7sjVA08R4RYDJ259Nw1CRftdRyLFylx/VrDFA85d19MIsBdNIxwJpOt8y1OB
 kpMA==
X-Gm-Message-State: AOAM5324iFcnFi/zxy8RjEIk2DerOEfGiIzFhv6HrJlJMiW23+OR370W
 +YIzlV4WySX9YMz/zsYMaOD55g==
X-Google-Smtp-Source: ABdhPJxVOVxvgiPNgutBQsO3Eq9CGEuvbGYzII435WKc9QGn537+LmtF8rf3nnZmVZcp0Cb+x0MW6Q==
X-Received: by 2002:ac8:4e8a:: with SMTP id 10mr3494892qtp.578.1640204413176; 
 Wed, 22 Dec 2021 12:20:13 -0800 (PST)
Received: from ?IPV6:2804:431:c7cb:3b1e:1ba8:c11f:6224:efe1?
 ([2804:431:c7cb:3b1e:1ba8:c11f:6224:efe1])
 by smtp.gmail.com with ESMTPSA id e17sm2437255qtw.18.2021.12.22.12.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 12:20:12 -0800 (PST)
Message-ID: <1a46b8a6-87dd-b811-fd82-0292ea575935@linaro.org>
Date: Wed, 22 Dec 2021 17:20:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>,
 Florian Weimer <fweimer@redhat.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-11-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211210233456.4146479-11-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 10/13] or1k: ABI lists
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAxMC8xMi8yMDIxIDIwOjM0LCBTdGFmZm9yZCBIb3JuZSB2aWEgTGliYy1hbHBoYSB3cm90
ZToKCj4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvbGQuYWJpbGlz
dCBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvbGQuYWJpbGlzdAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYzRiODVjOGEzMwo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xkLmFiaWxpc3QKPiBAQCAtMCww
ICsxLDUgQEAKPiArR0xJQkNfMi4zNSBfX2xpYmNfc3RhY2tfZW5kIEQgMHg0Cj4gK0dMSUJDXzIu
MzUgX19zdGFja19jaGtfZ3VhcmQgRCAweDQKPiArR0xJQkNfMi4zNSBfX3Rsc19nZXRfYWRkciBG
Cj4gK0dMSUJDXzIuMzUgX2RsX21jb3VudCBGCj4gK0dMSUJDXzIuMzUgX3JfZGVidWcgRCAweDE0
CgpZb3Ugd2lsbCBuZWVkIHRvIHJlZ2VuZXJhdGUgaXQgdG8gaW5jbHVkZSB0aGUgcnNlcSBzeW1i
b2xzOgoKR0xJQkNfMi4zNSBfX3JzZXFfZmxhZ3MgRCAweDQKR0xJQkNfMi4zNSBfX3JzZXFfb2Zm
c2V0IEQgMHg0CkdMSUJDXzIuMzUgX19yc2VxX3NpemUgRCAweDQKCgo+IGRpZmYgLS1naXQgYS9z
eXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYkJyb2tlbkxvY2FsZS5hYmlsaXN0IGIvc3lz
ZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9saWJCcm9rZW5Mb2NhbGUuYWJpbGlzdAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMzY2YzM5MzI3NAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYkJyb2tlbkxvY2Fs
ZS5hYmlsaXN0Cj4gQEAgLTAsMCArMSBAQAo+ICtHTElCQ18yLjM1IF9fY3R5cGVfZ2V0X21iX2N1
cl9tYXggRgo+IGRpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYmFu
bC5hYmlsaXN0IGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9saWJhbmwuYWJpbGlzdAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYzY0Mzc4MDlkYgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYmFubC5h
YmlsaXN0Cj4gQEAgLTAsMCArMSBAQAo+ICtHTElCQ18yLjM1IF9fbGliYW5sX3ZlcnNpb25fcGxh
Y2Vob2xkZXIgRgoKVGhpcyBkb2VzIHNlZW1zIHJpZ2h0LCBvcjFrIHNob3VsZCBub3QgcmVxdWly
ZSB0aGUgcGxhY2Vob2xkZXIuICBJIHRoaW5rCndlIGFyZSBtaXNzaW5nIGEgU0hMSUJfQ09NUEFU
IG9uIHJlc29sdi9saWJhbmwtY29tcGF0LmM6CgpkaWZmIC0tZ2l0IGEvcmVzb2x2L2xpYmFubC1j
b21wYXQuYyBiL3Jlc29sdi9saWJhbmwtY29tcGF0LmMKaW5kZXggMjlkZjc2ZjI3OC4uMDJjMThi
ZGU5MCAxMDA2NDQKLS0tIGEvcmVzb2x2L2xpYmFubC1jb21wYXQuYworKysgYi9yZXNvbHYvbGli
YW5sLWNvbXBhdC5jCkBAIC0zMCw2ICszMCw4IEBAIF9fbGliYW5sX3ZlcnNpb25fcGxhY2Vob2xk
ZXJfMSAodm9pZCkKIHsKIH0KIAorIyBpZiBTSExJQl9DT01QQVQgKGxpYmFubCwgR0xJQkNfMl8y
XzMsIEdMSUJDXzJfMzQpCiBjb21wYXRfc3ltYm9sIChsaWJhbmwsIF9fbGliYW5sX3ZlcnNpb25f
cGxhY2Vob2xkZXJfMSwKICAgICAgICAgICAgICAgIF9fbGliYW5sX3ZlcnNpb25fcGxhY2Vob2xk
ZXIsIEdMSUJDXzJfMl8zKTsKKyMgZW5kaWYKICNlbmRpZgoKPiBkaWZmIC0tZ2l0IGEvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvb3Ixay9saWJ1dGlsLmFiaWxpc3QgYi9zeXNkZXBzL3VuaXgvc3lz
di9saW51eC9vcjFrL2xpYnV0aWwuYWJpbGlzdAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uZjMzYjg0ODEzYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zeXNkZXBz
L3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYnV0aWwuYWJpbGlzdAo+IEBAIC0wLDAgKzEgQEAKPiAr
R0xJQkNfMi4zNSBfX2xpYnV0aWxfdmVyc2lvbl9wbGFjZWhvbGRlciBGCgpUaGlzIGFsc28gZG9l
cyBub3Qgc2VlbXMgcmlnaHQsIGxpYnV0aWwtY29tcGF0IHdpbGwgb25seSBidWlsdCBmb3IKaGF2
ZS1HTElCQ18yLjMzLCB3aGljaCBpcyBub3QgdGhlIGNhc2UuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
