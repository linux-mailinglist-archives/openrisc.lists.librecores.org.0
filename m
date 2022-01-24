Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3DD49817F
	for <lists+openrisc@lfdr.de>; Mon, 24 Jan 2022 14:55:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B1F5D24309;
	Mon, 24 Jan 2022 14:55:03 +0100 (CET)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by mail.librecores.org (Postfix) with ESMTPS id ACCCC20162
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 14:55:01 +0100 (CET)
Received: by mail-ot1-f52.google.com with SMTP id
 10-20020a9d030a000000b0059f164f4a86so4870014otv.13
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IN7Uusq5Ab/5PPa313mWxbwISYSsPNNMjslUal9AZas=;
 b=vMQPZc9X/XpoVZsCqJsX2xc5VNX0bS9t28ILnP530I+1IrfgvkqCfg9iMQGkt5jMqp
 jnQ0+U8ShJ7wrEbDwqSmEzdr06ZlF85Labb3eQCIOnf7+KZqoZOdwMn7vTFMYm7K3YMn
 m5PK9epB4uS95ujAIuT/jnSYd2NLJ/yrok/BQjot6Wx/4J/R8OPBXXZ8taflpLM46YwR
 3uI6CLkW2ADTU5egF455/TNCRDxyzNr2YQnmhPcQLux2mUhd4u1F2vtj2pt6m2bpBmX5
 8eEHaGUT7njtuEeC0mTBE6UaPJOmBAhyFOohqMWtkJaHrkSxo+DFY4msck/4lm5+GUdh
 pkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IN7Uusq5Ab/5PPa313mWxbwISYSsPNNMjslUal9AZas=;
 b=P2TYmdc8L1JFRznCC/i8s7gmW8qTekH7eJAZwEurEuoksfg+jB5fJY2ZqeYflesxoc
 33Cx/xKZ7r6miKVti85k0Ft1XZSvsp4pB0cOQoro2qozLoyTd23gNONCRO0kgNAjp8C5
 4iE58p1SOgKn+xr+c87GCfUJ2LGxUArbR5NM8M1NfcRwAlBhBc4xQ/LzvFiLocQYzk+S
 tqnUqJabpY9UfEbLvzOhMkRbLIYZvlbihMMQfcLRmSjenH5IOB9lPbpplQK0b6RfscgD
 4MRHMl6e5JD32lX2t6OQXglLyYqViRqpG2Ny0pm9J2hTs26BzUNBvkHybu0mBK3b8SHc
 0l9Q==
X-Gm-Message-State: AOAM532yV0JwgONlcopGZTT/PSww7Be0ULHyIWnxEGeDfP0QnRQ5oYbs
 EREvHIHQijpd10dHzq0mWq3bwg==
X-Google-Smtp-Source: ABdhPJyRUjWqMYk5ScY1MIpTDz4KPZn9YkkjzY50xkJIs8k5XIgCi6/PAS3WMvY/4IjjpxHL1Hnmpw==
X-Received: by 2002:a05:6830:2a03:: with SMTP id
 y3mr11882225otu.360.1643032500446; 
 Mon, 24 Jan 2022 05:55:00 -0800 (PST)
Received: from ?IPV6:2804:431:c7cb:27f8:c505:63c0:de61:b716?
 ([2804:431:c7cb:27f8:c505:63c0:de61:b716])
 by smtp.gmail.com with ESMTPSA id h1sm5111902otb.58.2022.01.24.05.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 05:55:00 -0800 (PST)
Message-ID: <d3bbc7eb-348f-872c-32ef-fcff7d2f4153@linaro.org>
Date: Mon, 24 Jan 2022 10:54:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>, Stafford Horne <shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
 <87tudt2rpg.fsf@oldenburg.str.redhat.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <87tudt2rpg.fsf@oldenburg.str.redhat.com>
Subject: Re: [OpenRISC] [PATCH v5 00/13] Glibc OpenRISC port
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAyNC8wMS8yMDIyIDEwOjIzLCBGbG9yaWFuIFdlaW1lciB2aWEgTGliYy1hbHBoYSB3cm90
ZToKPiAqIFN0YWZmb3JkIEhvcm5lOgo+IAo+PiBUaGlzIGlzIHRoZSBPcGVuUklTQyBwb3J0IGZv
ciBnbGliYyB0aGF0IEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24uCj4gCj4gVGhlIHBvcnQgZG9lcyBu
b3QgZGVmaW5lIFBJX1NUQVRJQ19BTkRfSElEREVOLiAgSXMgdGhpcyByZWFsbHkKPiBuZWNlc3Nh
cnksIG9yIGp1c3QgYW4gb3ZlcnNpZ2h0IGR1ZSB0byB0aGUgd2F5IHRoZSBwb3J0IHdhcyBjb25z
dHJ1Y3RlZAo+IChwcmVzdW1hYmx5IHdpdGggTUlQUyBhcyB0aGUgdGVtcGxhdGUpPwo+IAo+IFBJ
X1NUQVRJQ19BTkRfSElEREVOIG1lYW5zIHRoYXQgcmVmZXJlbmNlcyB0byBzdGF0aWMgZnVuY3Rp
b25zIGFuZCBkYXRhCj4gYW5kIHN5bWJvbHMgd2l0aCBoaWRkZW4gdmlzaWJpbGl0eSBkbyBub3Qg
bmVlZCBhbnkgcnVuLXRpbWUgcmVsb2NhdGlvbnMKPiBhZnRlciB0aGUgZmluYWwgbGluaywgd2l0
aCB0aGUgYnVpbGQgZmxhZ3MgdXNlZCBieSBnbGliYy4KCkF0IGxlYXN0IHRoZSBsb2FkZXIgd2l0
aCBhIHNpbXBsZSBoZWxsbyB3b3JsZCBkb2VzIG5vdCBmYWlsIHdpdGggcWVtdSB3aXRoIApQSV9T
VEFUSUNfQU5EX0hJRERFTiBzZXQuCgpTdGFmZm9yaywgY291bGQgeW91IGNvbmZpcm0gaXQgaXMg
b2sgdG8gbWFrZSBvcjFrIHVzZSBQSV9TVEFUSUNfQU5EX0hJRERFTj8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
