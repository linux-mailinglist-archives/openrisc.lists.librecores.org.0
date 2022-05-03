Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 14831518722
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 16:46:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A7DF924253;
	Tue,  3 May 2022 16:46:25 +0200 (CEST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mail.librecores.org (Postfix) with ESMTPS id A0D1923FA3
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 16:46:23 +0200 (CEST)
Received: by mail-pj1-f42.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so2189217pjf.3
 for <openrisc@lists.librecores.org>; Tue, 03 May 2022 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VnruQLmkKvvhzWMTiTFgFCtJE2gDbASMSMSy7nXxxAs=;
 b=OaxG3GzQ13qR4P2b0uJXWDAq9pcVHYMybrEWsd2NXRtzvDyOcrWdVmrU2UruIb+ipR
 RutK1BZ5ltBiWDM6Q1ZEekWZgkyoDzt8+WOXjWRiTdEFi/EMbQYCL7KXp7kbXoxAtSZC
 gVlNWlj8ydNcX0Aj+hGjmPRpw/JRF0+IAo/Sz7EI28XrTsNqPf5kvRTDPS2jm7F4OIp4
 Qc0/wZvTwfk/7zkoYPlrpkl7fZKDInyNXlnAsTDRULi7XzeEWUS/WA4OnShOXAHKLNz6
 YLkrEXsq9OJvC6JzvmkkUWpCcfj1d4MX5TBGr7r/3lAS7AkMa8vMYayoRBqseKAiTDSV
 5KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VnruQLmkKvvhzWMTiTFgFCtJE2gDbASMSMSy7nXxxAs=;
 b=Y794PUIcgmjFZP4Cj8m/2g5dL92bHPAzfaxV/Am7eeQLDJDa76C3dV2Epq1NkwfWJg
 RCL3RGx3X5D9WDkgWlRDPp00yz6ktEuX+m/dr3E0RU8I+XfaFbs9PXbE14bg7yZWIdiq
 UuHhBxfX1YrciNaHREoWJRse8YLPkrcANMe/vnIwGgk4A0gSpHWMwyirtgW8vRbiSVaa
 KSHLNvOODiuZEfYNbL0a3C1BfZYvByjKnxiACNfXY1sAS04n02+m+MTaJPxgK+xheAie
 hxtJK40gjOweaey9sqH3N83tKmdtkaXfCUOUw9eI2ZFbTTUYZz+GqEhOSd+tsRRRwRqc
 +YEg==
X-Gm-Message-State: AOAM5333seXuAcFyjY8Cn6II9i+gUeByU17XYfQ1Olehl3cajV+Dw9ig
 jhiXOiBpbbJe7rtPyyOyoilFjA==
X-Google-Smtp-Source: ABdhPJw4CB9kOXcSRFIRCEHh+vIdvPpifmuI6fJ2QQKxmrgrLG1ABni3Y1iwgTRL1IU/uoADSqATqA==
X-Received: by 2002:a17:902:f28b:b0:15c:5c21:dc15 with SMTP id
 k11-20020a170902f28b00b0015c5c21dc15mr17208714plc.16.1651589182037; 
 Tue, 03 May 2022 07:46:22 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 on13-20020a17090b1d0d00b001d9acbc3b4esm1457553pjb.47.2022.05.03.07.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 07:46:21 -0700 (PDT)
Message-ID: <0eef40cc-47e0-6670-2b5d-b97026308ce6@linaro.org>
Date: Tue, 3 May 2022 07:46:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220502225230.237369-1-Jason@zx2c4.com>
 <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
 <YnDt0YZK3aG3y8Tl@zx2c4.com> <YnDyaEW2QiUXTNx8@antec>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YnDyaEW2QiUXTNx8@antec>
Subject: Re: [OpenRISC] [PATCH] target/openrisc: implement shutdown and
 reset helpers
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
Cc: openrisc@lists.librecores.org, qemu-devel@nongnu.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNS8zLzIyIDAyOjE0LCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBZZXMsIHdlIGhhZCBhIG1h
aWwgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIHdpdGggUGV0ZXIuICBUaGlzIGJlaW5nIHNpbWlsYXIg
dG8gQVJNCj4gc2VtaWhvc3Rpbmc7IGVuYWJsaW5nIHRoZXNlIHNwZWNpYWwgaW5zdHJ1Y3Rpb25z
IHNob3VsZCBiZSBiZWhpbmQgdGhlIHNlbWlob3N0aW5nCj4gZmxhZy4gIFNvbWV0aGluZyB0aGF0
IG5lZWRzIHRvIGJlIGRvbmUgZm9yIHRoaXMgcGF0Y2guCgpBaCwgb2suCgo+IE91ciBvdGhlciBz
aW11bGF0b3JzIGltcGxlbWVudCB0aGlzLCBzbyB0aGUgY29tcHJvbWlzZSBpcyBpZiB3ZSBkb2N1
bWVudCB0aGlzCj4gb2ZmaWNpYWxseSBhbmQgb25seSBpbXBsZW1lbnQgaXQgYmVoaW5kIHNlbWlo
b3N0aW5nIHBldGVyIHdhcyBPSyB3aXRoIGl0Lgo+IAo+IEkgaGF2ZW4ndCBzdGFydGVkIG9uIHRo
ZSBkb2N1bWVudGF0aW9uIHlldCBhcyBJIGhhdmVuJ3QgaGFzIG11Y2ggdGltZSBpbiB0aGUKPiBs
YXN0IGZldyBkYXlzIHRob3VnaC4KPiAKPiBPcjFrc2ltOgo+ICAgIC0gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5yaXNjL29yMWtzaW0vYmxvYi83OWM2ZjE1MzM5MDEyN2U1MDI1OWQ0NmE3Y2MwNDIx
YWE3ODdkMmVkL2NwdS9vcjMyL2luc25zZXQuYyNMNzY4Cj4gc2ltOgo+ICAgIC0gaHR0cHM6Ly9z
b3VyY2V3YXJlLm9yZy9naXQvP3A9YmludXRpbHMtZ2RiLmdpdDthPWJsb2I7Zj1zaW0vb3Ixay9v
cjFrLmM7aD1iZmFiMzU0NjFiZWUxNDU3ZmU4ZjQyMTc5YWM2ZDI3ZjVhZDQ2Yjk2O2hiPUhFQUQK
ClRoYW5rcyBmb3IgdGhlIHBvaW50ZXJzLgoKCnJ+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
