Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C0F8E474CA5
	for <lists+openrisc@lfdr.de>; Tue, 14 Dec 2021 21:28:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6A4FB242D6;
	Tue, 14 Dec 2021 21:28:33 +0100 (CET)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mail.librecores.org (Postfix) with ESMTPS id E9E9A242D6
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 21:28:31 +0100 (CET)
Received: by mail-qt1-f173.google.com with SMTP id l8so19642473qtk.6
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=81LCBFXhjvx1wy8KKz6MAn21zjwVGxgVJS9mote8QAo=;
 b=euwcI5Ob3J6PpzaHYzFL+2NmBv4qyvN9/Anvxe+nSaSBSFwEy9EitUt+epaS/3bsYu
 jUXBhD/1JvtGLnVyZDle+r5doN0S57QZD9Zk+RG1sOwUCOZX14vvpl9hlsw62vBps7p2
 iRnEXlK4a9t4IT0sNXs1XYdbZvTz4f8oXFVQXTnUqjqbf6Tkgf1EzIwc6cWSA/j78T2Q
 NOn7qP2DiGgjVvcRaU87EhJ2OviUt0gugqJCjeb1h7poK+BXO/mPXREVcuJ+XmSOLume
 HTljZqgkbheZIM6iTFmHPw6jegJB9cu4nPP0Hn1htUhEldLO6T6h51Cqdise9WSEg7L/
 YdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=81LCBFXhjvx1wy8KKz6MAn21zjwVGxgVJS9mote8QAo=;
 b=QyoPaluhz8Ju7bLbNwfpioZBnFOUAn7js2x6vQ7oPd4e9k8D+BKhXo338+pWZOcF5Q
 HUL/MihGqoFM11amJ6RqQYHI8mIW1c/A85CzZ8KZNtXDscpIPyiX7iED/4agEK4wZWbo
 4WvvWOMis1eSiB6icjkxPRLuCGwTjw030ojsse0si/Q/cv4nB0ISL1m564PgcuGCcAXJ
 QGrMEs3aPof5SAGJnIstBY8VAQR2qF8ie1r6mnHPoTVkPz6GcjbSWvrbdcmDzar0Vzbr
 I37K0XkOMQRKF3wvJS3UAITqOdgfWFCn/sAJAspAACIFmeX6x+2lBndwY1YSzvp60tAw
 myuw==
X-Gm-Message-State: AOAM5333jtibrpV8prKyyD4YTnWwUgOak9ACpfy4bDQiDzAUThZIrv4C
 iPrq4HoHSsYQCQINTqNGaa7Y6g==
X-Google-Smtp-Source: ABdhPJxFeqHGun3hxdCr0k0be6aTicVg82mb2HxQW9imTQL8aUVeQ0eMiKhNIkx4NeTyUoHBEWLLIg==
X-Received: by 2002:ac8:5a49:: with SMTP id o9mr8648278qta.537.1639513710574; 
 Tue, 14 Dec 2021 12:28:30 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:1000:c46d:a2d6:9bed?
 ([2804:431:c7ca:103f:1000:c46d:a2d6:9bed])
 by smtp.gmail.com with ESMTPSA id a15sm713285qtb.5.2021.12.14.12.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:28:30 -0800 (PST)
Message-ID: <355b94c4-eef4-1270-a9c4-a5ad8cd52c36@linaro.org>
Date: Tue, 14 Dec 2021 17:28:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-2-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211210233456.4146479-2-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 01/13] elf: Add reloc for OpenRISC
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

VGhlIHZhbHVlcyBtYXRjaCBiaW51dGlscyBvbmVzLgoKTEdUTSwgdGhhbmtzLgoKUmV2aWV3ZWQt
Ynk6IEFkaGVtZXJ2YWwgWmFuZWxsYSAgPGFkaGVtZXJ2YWwuemFuZWxsYUBsaW5hcm8ub3JnPgoK
T24gMTAvMTIvMjAyMSAyMDozNCwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cj4gLS0tCj4gIGVsZi9lbGYuaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZWxmL2VsZi5oIGIvZWxmL2VsZi5oCj4gaW5kZXggYmFhNmM2NjkzZS4uMTg0NThlNGQwNCAx
MDA2NDQKPiAtLS0gYS9lbGYvZWxmLmgKPiArKysgYi9lbGYvZWxmLmgKPiBAQCAtNDEyNSw0ICs0
MTI1LDQxIEBAIGVudW0KPiAgI2RlZmluZSBSX0FSQ19UTFNfTEVfUzkJCTB4NGEKPiAgI2RlZmlu
ZSBSX0FSQ19UTFNfTEVfMzIJCTB4NGIKPiAgCj4gKy8qIE9wZW5SSVNDIDEwMDAgc3BlY2lmaWMg
cmVsb2NzLiAgKi8KPiArI2RlZmluZSBSX09SMUtfTk9ORQkJMAo+ICsjZGVmaW5lIFJfT1IxS18z
MgkJMQo+ICsjZGVmaW5lIFJfT1IxS18xNgkJMgo+ICsjZGVmaW5lIFJfT1IxS184CQkzCj4gKyNk
ZWZpbmUgUl9PUjFLX0xPXzE2X0lOX0lOU04JNAo+ICsjZGVmaW5lIFJfT1IxS19ISV8xNl9JTl9J
TlNOCTUKPiArI2RlZmluZSBSX09SMUtfSU5TTl9SRUxfMjYJNgo+ICsjZGVmaW5lIFJfT1IxS19H
TlVfVlRFTlRSWQk3Cj4gKyNkZWZpbmUgUl9PUjFLX0dOVV9WVElOSEVSSVQJOAo+ICsjZGVmaW5l
IFJfT1IxS18zMl9QQ1JFTAkJOQo+ICsjZGVmaW5lIFJfT1IxS18xNl9QQ1JFTAkJMTAKPiArI2Rl
ZmluZSBSX09SMUtfOF9QQ1JFTAkJMTEKPiArI2RlZmluZSBSX09SMUtfR09UUENfSEkxNgkxMgo+
ICsjZGVmaW5lIFJfT1IxS19HT1RQQ19MTzE2CTEzCj4gKyNkZWZpbmUgUl9PUjFLX0dPVDE2CQkx
NAo+ICsjZGVmaW5lIFJfT1IxS19QTFQyNgkJMTUKPiArI2RlZmluZSBSX09SMUtfR09UT0ZGX0hJ
MTYJMTYKPiArI2RlZmluZSBSX09SMUtfR09UT0ZGX0xPMTYJMTcKPiArI2RlZmluZSBSX09SMUtf
Q09QWQkJMTgKPiArI2RlZmluZSBSX09SMUtfR0xPQl9EQVQJCTE5Cj4gKyNkZWZpbmUgUl9PUjFL
X0pNUF9TTE9UCQkyMAo+ICsjZGVmaW5lIFJfT1IxS19SRUxBVElWRQkJMjEKPiArI2RlZmluZSBS
X09SMUtfVExTX0dEX0hJMTYJMjIKPiArI2RlZmluZSBSX09SMUtfVExTX0dEX0xPMTYJMjMKPiAr
I2RlZmluZSBSX09SMUtfVExTX0xETV9ISTE2CTI0Cj4gKyNkZWZpbmUgUl9PUjFLX1RMU19MRE1f
TE8xNgkyNQo+ICsjZGVmaW5lIFJfT1IxS19UTFNfTERPX0hJMTYJMjYKPiArI2RlZmluZSBSX09S
MUtfVExTX0xET19MTzE2CTI3Cj4gKyNkZWZpbmUgUl9PUjFLX1RMU19JRV9ISTE2CTI4Cj4gKyNk
ZWZpbmUgUl9PUjFLX1RMU19JRV9MTzE2CTI5Cj4gKyNkZWZpbmUgUl9PUjFLX1RMU19MRV9ISTE2
CTMwCj4gKyNkZWZpbmUgUl9PUjFLX1RMU19MRV9MTzE2CTMxCj4gKyNkZWZpbmUgUl9PUjFLX1RM
U19UUE9GRgkzMgo+ICsjZGVmaW5lIFJfT1IxS19UTFNfRFRQT0ZGCTMzCj4gKyNkZWZpbmUgUl9P
UjFLX1RMU19EVFBNT0QJMzQKPiArCj4gICNlbmRpZgkvKiBlbGYuaCAqLwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
