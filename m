Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAC147E3D6
	for <lists+openrisc@lfdr.de>; Thu, 23 Dec 2021 13:57:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 15490242E8;
	Thu, 23 Dec 2021 13:57:09 +0100 (CET)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mail.librecores.org (Postfix) with ESMTPS id 3651A2407F
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 13:57:07 +0100 (CET)
Received: by mail-qk1-f169.google.com with SMTP id l11so5278421qke.11
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 04:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HSZBsT4vFPU2xNCNn6YGt1+qKpfE2I5t0qBfGx9ePyw=;
 b=eaJZrYeN/YIAAClTImcvu/IDOGloD4HV+0sbzsgE5JciHMOpMpQr7n6JbQxSZQ8JMA
 cZkitYFE4MU9ixSbWOZ0lFe+NhgSdEb7OvdnV7tWRhSxsvRj0AA+gBVnKnGI3S1EBfQQ
 YkfwC+k4jR4Nt5qtwaj/loV0bhwtoR/QCELtdatRV7NbMWXtBgM08N0Xbz30IqT58oRG
 exJ9yfu6YAh8ynBAmR2nnsJbmmft20WkxblVdgxzEYEHJmMbql8TXt3rrPnUjtyd2IgX
 rnhQtoI4eq4AaFnOdlGVQAzEk5v03TcGkjbYT5FE9KNXo2JOW/rhq/0yF+S0+sYVtVfY
 1Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSZBsT4vFPU2xNCNn6YGt1+qKpfE2I5t0qBfGx9ePyw=;
 b=a+b5IS+hMcWuzIawBBz0tOklkVVPpgzQVSFazV1nqK37RdFU211L35RIJDZqT3JKpB
 W0kJ3Vfd2LOvCMsqLTWSM6nsqN0cBC8mcNOOIBIEaf2U7xD6Ih0XpPKnMNvnudoyk+RG
 VXlyNvuBXozyWtU9qCYfieA9cfVFT/Ptb9R7FFp8sXXsOPdMP6DMq6l24ScpvBYDREtr
 CgMWsF1siKSEtssJCNoxURLVB63i5chR+PG68cDdyEZZwPN5JuEQnaAFb+ZjDGSKlBkp
 46EKm7TmXlweFz9sJFA3nZKgIDlUI77kIG4jSQ/1FG1d1rR/93uBW2lOYlOJoFpbM79x
 MPKQ==
X-Gm-Message-State: AOAM531wj34xMsX2uLTmsme3hZ9fJ4JUTiDbK3JaI2AAF6p1kbqJy2dA
 IdQxN+Nu6mnIikyCe6XZ0TfcAQ==
X-Google-Smtp-Source: ABdhPJx36H2ro4YReaB0clbdvKIzTllUs4QBkj+Y6MQY0KWNZXUpAbrSCpq7QAoBO8Bv41RVr+6MyQ==
X-Received: by 2002:a05:620a:12e7:: with SMTP id
 f7mr1175350qkl.391.1640264226055; 
 Thu, 23 Dec 2021 04:57:06 -0800 (PST)
Received: from ?IPV6:2804:431:c7cb:3b1e:1fd1:c581:58d8:4df2?
 ([2804:431:c7cb:3b1e:1fd1:c581:58d8:4df2])
 by smtp.gmail.com with ESMTPSA id v12sm4246763qkl.50.2021.12.23.04.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 04:57:05 -0800 (PST)
Message-ID: <0e5a4399-e850-5f7b-3c55-a7f87f4c38de@linaro.org>
Date: Thu, 23 Dec 2021 09:57:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-14-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211210233456.4146479-14-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 13/13] Documentation for OpenRISC port
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
ZToKPiBPcGVuUklTQyBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbjoKPiAKPiAgaHR0cHM6Ly9y
YXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL29wZW5yaXNjL2RvYy9tYXN0ZXIvb3BlbnJpc2MtYXJj
aC0xLjMtcmV2MS5wZGYKPiAKPiBDdXJyZW50bHkgdGhlIHBvcnQgYXMgb2YgdGhlIDIwMjEtMTIt
MDcgcmViYXNpbmcgaGFzIHRoZSBmb2xsb3dpbmcgdGVzdAo+IGZhaWx1cmVzOgo+IAo+ICBGQUlM
OiB0aW1lem9uZS90c3QtdHpzZXQgICAgICMgTm90IGVub3VnaCBzcGFjZSB0byBjcmVhdGUgNEdp
QiBmaWxlCj4gIEZBSUw6IGVsZi90c3QtYnoxNTMxMSAgICAgICAgIyBkeW5hbWljIGxkIHNvcnQg
b3JkZXIgZGlmZgo+IAo+IFdyaXRpbmcgY3JlZGl0cyBmb3IgdGhlIHBvcnQgYXJlOgo+IAo+ICBT
dGFmZm9yZCBIb3JuZSAgPHNob3JuZUBnbWFpbC5jb20+Cj4gIENocmlzdGlhbiBTdmVuc3NvbiAg
PGJsdWVAY21kLm51Pj4gLS0tCj4gIE5FV1MgICB8IDQgKysrKwo+ICBSRUFETUUgfCAxICsKPiAg
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvTkVXUyBi
L05FV1MKPiBpbmRleCAxMzk4Y2YyZTg3Li5mODk2NzQ2NTc0IDEwMDY0NAo+IC0tLSBhL05FV1MK
PiArKysgYi9ORVdTCj4gQEAgLTQ4NSw2ICs0ODUsMTAgQEAgTWFqb3IgbmV3IGZlYXR1cmVzOgo+
ICAgIFRoZSBsYXRlc3QgR0NDIGF2YWlsYWJsZSBhdCB0aGlzIHRpbWUgKDEwLjIpIGRvZXMgbm90
IHN1cHBvcnQgdGhpcyBsZXZlbCBvZgo+ICAgIGZvcnRpZmljYXRpb24uCj4gIAo+ICsqIFN1cHBv
cnQgZm9yIE9wZW5SSVNDIG9uIExpbnV4IGhhcyBiZWVuIGFkZGVkLgoKSSB0aGluayBpdCB3b3Vs
ZCBiZSB1c2VmdWwgdG8gYWRkIG9ubHkgc29mdC1mbG9hdCBpcyBjdXJyZW50bHkgc3VwcG9ydGVk
LgoKPiArCj4gKyAgVGhlIE9wZW5SSVNDIHBvcmUgcmVxdWlyZXMgYXQgbGVhc3QgTGludXggNS40
LCBHQ0MgMTEgYW5kIGJpbnV0aWxzIDIuMzUuCj4gKz4gIERlcHJlY2F0ZWQgYW5kIHJlbW92ZWQg
ZmVhdHVyZXMsIGFuZCBvdGhlciBjaGFuZ2VzIGFmZmVjdGluZyBjb21wYXRpYmlsaXR5Ogo+ICAK
PiAgKiBUaGUgbWFsbGluZm8gZnVuY3Rpb24gaXMgbWFya2VkIGRlcHJlY2F0ZWQuICBDYWxsZXJz
IHNob3VsZCBjYWxsCj4gZGlmZiAtLWdpdCBhL1JFQURNRSBiL1JFQURNRQo+IGluZGV4IGQwZjBl
ZGIzOTMuLjNkNWE3OGNjZmYgMTAwNjQ0Cj4gLS0tIGEvUkVBRE1FCj4gKysrIGIvUkVBRE1FCj4g
QEAgLTM1LDYgKzM1LDcgQEAgVGhlIEdOVSBDIExpYnJhcnkgc3VwcG9ydHMgdGhlc2UgY29uZmln
dXJhdGlvbnMgZm9yIHVzaW5nIExpbnV4IGtlcm5lbHM6Cj4gIAltaWNyb2JsYXplKi0qLWxpbnV4
LWdudQo+ICAJbWlwcy0qLWxpbnV4LWdudQo+ICAJbWlwczY0LSotbGludXgtZ251Cj4gKwlvcjFr
LSotbGludXgtZ251Cj4gIAlwb3dlcnBjLSotbGludXgtZ251CUhhcmR3YXJlIG9yIHNvZnR3YXJl
IGZsb2F0aW5nIHBvaW50LCBCRSBvbmx5Lgo+ICAJcG93ZXJwYzY0Ki0qLWxpbnV4LWdudQlCaWct
ZW5kaWFuIGFuZCBsaXR0bGUtZW5kaWFuLgo+ICAJczM5MC0qLWxpbnV4LWdudQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
