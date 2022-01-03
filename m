Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CC90E4836D8
	for <lists+openrisc@lfdr.de>; Mon,  3 Jan 2022 19:31:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7BFC424325;
	Mon,  3 Jan 2022 19:31:14 +0100 (CET)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mail.librecores.org (Postfix) with ESMTPS id 72C0C241FA
 for <openrisc@lists.librecores.org>; Mon,  3 Jan 2022 19:31:12 +0100 (CET)
Received: by mail-qv1-f54.google.com with SMTP id q3so31763265qvc.7
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 10:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uaLTRMMqHLIYd+IZJMXmFV7q+f/YaHnKEYonPm7VgPc=;
 b=u4ss8C/ACeBM5mvnCZxbx6L71ryX4qpW2xQKZLkGnmUY1aVRQmI4FS6NEo+kBLlGrG
 6x/S6G4DPDIG+M0rJfIHBXZ8bILsWIoZuBrRnVO5eUZ15t0LbPk6yIpaVehE9BD8Sl7e
 SEeqUBiOnrsQtE97ViCbyJ6xeuivJi+Pb6v3XYklnd8ep+lfjkmVaaih36Sseab5NZsB
 Dczv5NycSLWFUZ/Gld86Q8frEP6vIX/qOk6/XpnteMP02Vvav0pQUeTHAqzX6mN4hGEV
 SOV2G3DTWt9mNqePpE88MiLTe70gvpxjQGzotmkqtgSc23peJivxDVVCTG7ZFHNcJdzu
 /AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uaLTRMMqHLIYd+IZJMXmFV7q+f/YaHnKEYonPm7VgPc=;
 b=sKzq0etHvzi3pYRTClQkj+3e9FVtAsVnJzDjXMMIf3/zB4G7uMIWnQn47woUqDIg9S
 DvYBcaIvS0mtFmFVZeG/CMfiCGAZQJfI7VWP88G8JnCGEGU+UJt/QW6hxqRhnUk8naFI
 2uq13t2lq6SHxJfqw9EVzpbAETvVod7NEtZYOnT1Wq+1WbgQ97p/aZ7xPf1BVqh1bCqi
 JGs+RWE8vqrpc2kA/dO1fzSl0PEHjuj8Rq/mLe534Fv7vGU0zQVNx0Ce4uVMy33+CPDv
 LcWCAHdbZ0Z6EqYivTbt17SowwVkGFoqOB8+lqkRLPQE7kNrrOoLqT+9dJv/qTRhXBms
 ZK+Q==
X-Gm-Message-State: AOAM532zyuW1SIfOkyZYvgWr3hPFZSurPqC4l5ITQRp0W5+zWJhLmAOg
 nplHy2pBB4WqBxRPAhU6xglWBMVQbMaTRA==
X-Google-Smtp-Source: ABdhPJwTgss/MT05ZMkaoJn3cQ/mioSpF/5oUF7yPv/50s9CuWRyqz9ZU0dypGRMqOs4kZx+N6BTjA==
X-Received: by 2002:ad4:5945:: with SMTP id eo5mr43546135qvb.86.1641234671317; 
 Mon, 03 Jan 2022 10:31:11 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:a350:6969:50a8:eab8:8f2f?
 ([2804:431:c7ca:a350:6969:50a8:eab8:8f2f])
 by smtp.gmail.com with ESMTPSA id v10sm31336170qtk.13.2022.01.03.10.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 10:31:11 -0800 (PST)
Message-ID: <f5d43fe6-ca91-dde4-d3a0-779d95479b3b@linaro.org>
Date: Mon, 3 Jan 2022 15:31:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-14-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211229044251.2203653-14-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v4 13/13] Documentation for OpenRISC port
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

CgpPbiAyOS8xMi8yMDIxIDAxOjQyLCBTdGFmZm9yZCBIb3JuZSB2aWEgTGliYy1hbHBoYSB3cm90
ZToKPiBPcGVuUklTQyBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbjoKPiAKPiAgaHR0cHM6Ly9y
YXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL29wZW5yaXNjL2RvYy9tYXN0ZXIvb3BlbnJpc2MtYXJj
aC0xLjMtcmV2MS5wZGYKPiAKPiBDdXJyZW50bHkgdGhlIHBvcnQgYXMgb2YgdGhlIDIwMjEtMTIt
MjMgcmViYXNpbmcgdGhlcmUgYXJlIG5vIGtub3duIGFyY2hpdGVjdHVyZQo+IHNlcGNpZmljIHRl
c3QgZmFpbHVyZXMuCj4gCj4gV3JpdGluZyBjcmVkaXRzIGZvciB0aGUgcG9ydCBhcmU6Cj4gCj4g
IFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWlsLmNvbT4KPiAgQ2hyaXN0aWFuIFN2ZW5zc29u
ICA8Ymx1ZUBjbWQubnU+Cj4gLS0tCj4gIE5FV1MgICB8IDUgKysrKysKPiAgUkVBRE1FIHwgMSAr
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL05F
V1MgYi9ORVdTCj4gaW5kZXggOTI5NGE3Yjk1My4uMDRiMTFkMzU4OSAxMDA2NDQKPiAtLS0gYS9O
RVdTCj4gKysrIGIvTkVXUwo+IEBAIC01MjcsNiArNTI3LDExIEBAIE1ham9yIG5ldyBmZWF0dXJl
czoKPiAgICBUaGUgbGF0ZXN0IEdDQyBhdmFpbGFibGUgYXQgdGhpcyB0aW1lICgxMC4yKSBkb2Vz
IG5vdCBzdXBwb3J0IHRoaXMgbGV2ZWwgb2YKPiAgICBmb3J0aWZpY2F0aW9uLgo+ICAKPiArKiBT
dXBwb3J0IGZvciBPcGVuUklTQyBvbiBMaW51eCBoYXMgYmVlbiBhZGRlZC4KPiArCj4gKyAgVGhl
IE9wZW5SSVNDIHBvcnQgcmVxdWlyZXMgYXQgbGVhc3QgTGludXggNS40LCBHQ0MgMTEgYW5kIGJp
bnV0aWxzIDIuMzUuCj4gKyAgQ3VycmVudGx5IG9ubHkgc29mdC1mbG9hdCBpcyBzdXBwb3J0ZWQu
Cj4gKwo+ICBEZXByZWNhdGVkIGFuZCByZW1vdmVkIGZlYXR1cmVzLCBhbmQgb3RoZXIgY2hhbmdl
cyBhZmZlY3RpbmcgY29tcGF0aWJpbGl0eToKPiAgCj4gICogVGhlIG1hbGxpbmZvIGZ1bmN0aW9u
IGlzIG1hcmtlZCBkZXByZWNhdGVkLiAgQ2FsbGVycyBzaG91bGQgY2FsbAoKTWF5YmUgZm9sbG93
IHRoZSBlbnRyaWVzIGZvciBvdGhlciBhcmNoaXRlY3R1cmVzLCBmb3IgaW5zdGFuY2UgZm9sbG93
aW5nCnJpc2N2MzIgYW5kIGFyYzoKCiAgKiBTdXBwb3J0IGZvciBPcGVuUklTQyBydW5uaW5nIG9u
IExpbnV4IGhhcyBiZWVuIGFkZGVkLiAgVGhpcyBwb3J0IHJlcXVpcmVzCiAgICBhcyBsZWFzdCBi
aW51dGlscyAyLjM1LCBHQ0MgMTEsIGFuZCBMaW51eCA1LjQuICBDdXJyZW50bHkgb25seSBzb2Z0
LWZsb2F0CiAgICBBQkkgaXMgc3VwcG9ydGVkLgoKICAgIChtYXliZSBhbHNvIGFkZCB0aGUgdHJp
cGxlIG5hbWUgaGVyZSkuCgo+IGRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKPiBpbmRleCBk
MGYwZWRiMzkzLi4zZDVhNzhjY2ZmIDEwMDY0NAo+IC0tLSBhL1JFQURNRQo+ICsrKyBiL1JFQURN
RQo+IEBAIC0zNSw2ICszNSw3IEBAIFRoZSBHTlUgQyBMaWJyYXJ5IHN1cHBvcnRzIHRoZXNlIGNv
bmZpZ3VyYXRpb25zIGZvciB1c2luZyBMaW51eCBrZXJuZWxzOgo+ICAJbWljcm9ibGF6ZSotKi1s
aW51eC1nbnUKPiAgCW1pcHMtKi1saW51eC1nbnUKPiAgCW1pcHM2NC0qLWxpbnV4LWdudQo+ICsJ
b3Ixay0qLWxpbnV4LWdudQo+ICAJcG93ZXJwYy0qLWxpbnV4LWdudQlIYXJkd2FyZSBvciBzb2Z0
d2FyZSBmbG9hdGluZyBwb2ludCwgQkUgb25seS4KPiAgCXBvd2VycGM2NCotKi1saW51eC1nbnUJ
QmlnLWVuZGlhbiBhbmQgbGl0dGxlLWVuZGlhbi4KPiAgCXMzOTAtKi1saW51eC1nbnUKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
