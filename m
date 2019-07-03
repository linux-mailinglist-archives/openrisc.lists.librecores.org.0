Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 50CCF5EC50
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 21:09:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B9D4620358;
	Wed,  3 Jul 2019 21:09:55 +0200 (CEST)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by mail.librecores.org (Postfix) with ESMTPS id 196E420113
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 21:09:55 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id n4so4044253wrs.3
 for <openrisc@lists.librecores.org>; Wed, 03 Jul 2019 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FU85s21yrDtJcgLBOZOSzr+w4Sfpt0dGM3I/zuGPuYk=;
 b=NfUK/MX5SdRNq9A8rPqVPSmS3JxRJMfMYb8OFcaIpr+avdcwvd5hKANgwjgd6dnxkz
 TYOVCe1VZHbRQ4+IZWGxGsdm6+4A1zhWuPfEfl5n+EPeY7wTmnowPymNs41wfzmVWwuN
 txCVvpbqaOFrUPN4OMbUSJqey+9Ms2sFuog4+gUMPKyUf27ZrZijmjeB+9DTRwaPhxlI
 XUW8ESwrce2RuvF+T7yffZaKNkC+T5z3q+af80mQK+XstXVredpjLt41d+tOuI0kCbYe
 BcnCj8Wh+AeoYox8aVDsU5PWssghiheqmBFJv8e5RK33NUEwGMCaR8Xz4V1ZNnjjHGaa
 uB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FU85s21yrDtJcgLBOZOSzr+w4Sfpt0dGM3I/zuGPuYk=;
 b=RH4IfXbHrLOkYtMnF2/LxINVezt2zGnbGwCex4yL9belwaf+bM5zDqdVCRUPQ4yalI
 u6zbnw5Av4jzbocxwoxA4QHp8Nu4L9OgPMGBWFnj/XXvRtdmtNdU3RxTNbBpRMM40WGd
 I2UESPtxWEw22dxhbb6X08VqNX+eV4seNw6wROhkkj2kd482VqqJ0Wxdwrc1Fb4H8Fhx
 UfZPv8gbePXRnKP8TE0+8wcfw/bHeLly9a5BSY95RgJunXSab8Ei4+KbjyMJig//aN12
 d/ZoZlRYKJ/vExNI+wVBxFWDRhyQFNCWOEBFQxf3gYfKxz3Wwq1UQoZA5ebYtVcWm088
 XklQ==
X-Gm-Message-State: APjAAAVGiBy8eOfWM/8SyCqyDrClYFmPW6VFXtUVWHOPj5ENEfjz81VB
 oGNgEeJf5wfpLpWKpEjwcp8=
X-Google-Smtp-Source: APXvYqz5VWvBHRb4i248G22D4EBIQSbxdAbI6A2ilQ9ADOO+ivXAF9NHvB217mi4GPNkM5pSYxdo3g==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr4007928wrq.139.1562180994572; 
 Wed, 03 Jul 2019 12:09:54 -0700 (PDT)
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
 by smtp.googlemail.com with ESMTPSA id y18sm3606565wmi.23.2019.07.03.12.09.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 12:09:53 -0700 (PDT)
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Stafford Horne <shorne@gmail.com>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-5-shorne@gmail.com>
 <20190703154301.GY18316@gate.crashing.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVuQENBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAGJASUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <64def15b-f701-4a5e-2724-6fb1e859be9a@twiddle.net>
Date: Wed, 3 Jul 2019 21:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703154301.GY18316@gate.crashing.org>
Content-Language: en-US
Subject: Re: [OpenRISC] [PATCH v2 4/5] or1k: Initial support for FPU
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNy8zLzE5IDU6NDMgUE0sIFNlZ2hlciBCb2Vzc2Vua29vbCB3cm90ZToKPj4gQEAgLTIxMiw2
ICsyMTQsNyBAQCBlbnVtIHJlZ19jbGFzcwo+PiAgI2RlZmluZSBSRUdfQ0xBU1NfQ09OVEVOVFMg
ICAgICBcCj4+ICB7IHsgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCB9LAlcCj4+ICAgIHsgU0lCQ0FM
TF9SRUdTX01BU0ssICAgMCB9LAlcCj4+ICsgIHsgMHg3ZmZmZmVmZSwgMHgwMDAwMDAwMCB9LAlc
Cj4gCj4gQWJvdmUgeW91IHNhaWQgcjAsIHIzMCwgcjMxIGFyZSBleGNsdWRlZCwgYnV0IHRoaXMg
aXMgcjAsIHI4LCByMzAsIG9yCj4gaW4gR0NDIHJlZ2lzdGVyIG51bWJlcnMsIDAsIDgsIGFuZCAz
MT8gIFlvdSBwcm9iYWJseSBzaG91bGQgbWVudGlvbiByOAo+IHNvbWV3aGVyZSAoaXQncyBiZWNh
dXNlIGl0IGlzIHRoZSBsYXN0IGFyZywgdGhpcyBhdm9pZCBwcm9ibGVtcywgSSBndWVzcz8pLAo+
IGFuZCB0aGUgMzAvMzEgdGhpbmcgaXMgY29uZnVzZWQgc29tZSB3YXkuICBNYXliZSBpdCBpcyBh
bGwganVzdCB0aGF0IG9uZQo+IGRvY3VtZW50YXRpb24gbGluZSA6LSkKCi4uLiBhbmQgaWYgcjgg
aXMgZXhjbHVkZWQgYmVjYXVzZSBvZiBhcmd1bWVudHMsIEkgc3VzcGVjdCB0aGF0IHRoaXMgaXMg
dGhlCndyb25nIGZpeCwgYXMgdGhlcmUncyBub3RoaW5nIGluaGVyZW50bHkgd3Jvbmcgd2l0aCBy
NzpyOCBvciByODpyOSBhcyBhIHBhaXIsCmF0IGxlYXN0IHRoYXQgSSBjYW4gc2VlLgoKUGVyaGFw
cyBmdW5jdGlvbl9hcmcgYW5kL29yIGZ1bmN0aW9uX2FyZ19hZHZhbmNlIGlzIHRoZSByaWdodCBw
bGFjZSBmb3IgYSBmaXg/ClRoZSBjYWxsaW5nIGNvbnZlbnRpb24gc2F5cyB0aGF0IDY0LWJpdCBh
cmd1bWVudHMgYXJlIG5vdCBzcGxpdCBhY3Jvc3MKcmVnaXN0ZXJzK3N0YWNrLCBzbyB5b3UgYWxy
ZWFkeSBzaG91bGRuJ3QgaGF2ZSBzZWVuIChyOCwgW3NwKzBdKSBhcyBhIHBhaXIuCgoKcn4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
