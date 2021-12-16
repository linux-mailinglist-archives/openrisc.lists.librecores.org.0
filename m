Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D55DD476EE7
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 11:30:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 78F39242D5;
	Thu, 16 Dec 2021 11:30:22 +0100 (CET)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mail.librecores.org (Postfix) with ESMTPS id 6DD4824106
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 11:30:20 +0100 (CET)
Received: by mail-qt1-f173.google.com with SMTP id z9so24912174qtj.9
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3EV4TjBlbr9QdyaxXp1kgi5df73HlGVUZCPnKEuMUkY=;
 b=jTtNlBcWCnKXAKnNxDtw/wedsS/r6g1+lBQmnmi1mFZ6mBUkKVdzydeyLcvzJOgmy9
 lQRDVY79cjG5fVQqkHdEhTxeRVipOwSgmqWUCyFdKXsh1LEfmL4x9R8oV88+UmYgM/2U
 tCycuCppdUBOkmlP4rhq1lB2oF1htl9qOzrB9auhDGek2KHhUaR/U0fvOJZnI85qlHFK
 srEWzLlgE4v+ol7HfIJf8kN8Fnaeji2SdCucW7cfPsFOafleJvl0VWeFIe40Inv7C8GV
 8DZjMhlvxqrP9CA/wBKVeeDJbdqF88gb1D+MovjVGkwArtIB6mQyoLo3o6e9ljI/nv9M
 GPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3EV4TjBlbr9QdyaxXp1kgi5df73HlGVUZCPnKEuMUkY=;
 b=f9vrfTbhNe9Rage44N4wHXt5sS3LW+T4dZsaTYOLQG2Ufwf2ZPiRE52XOVL+ziz/9W
 oAeMlDRq2rZiZ0Nu9bqhEpygBZJ9lZVS5S6aCrJo7eJkNAj+f82UvAb1YH4MVYmTRklO
 EtOcFgI+9fUwWIBriJuadCfygb2xeD+/72mDX+FZ1EkPbptaUgf9MzZ4Vf9v4upX1Oqm
 VsHxvtVGzHYM6TDDA7dMJkT4aTZ5QWmzu2CzBdTyyTxXNgMYKawy/lCt4QjENqiRNLCU
 Qsu3y5ptSQkVr+V0qokDrK+es+fkWURZqWAZ1aCARvFGVqtQddcKs0nCN9luYVWmLh8t
 avKw==
X-Gm-Message-State: AOAM532902YrtO8rSupMmrUYcXQG4YnHl7k/1o/rQzTP+rvbRjykaPAt
 lGM+I/GICcrGvARdHZbdEo0qNg==
X-Google-Smtp-Source: ABdhPJx+94aN5woBsiGGvtgJZqW9Dd6RaOEVDiphOUqEAlAs15Dtg3MOM8+qEriPwt6dbbVkWgqvzw==
X-Received: by 2002:ac8:5fd6:: with SMTP id k22mr8923614qta.444.1639650619227; 
 Thu, 16 Dec 2021 02:30:19 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:96e9:fe91:2aff:a44d?
 ([2804:431:c7ca:103f:96e9:fe91:2aff:a44d])
 by smtp.gmail.com with ESMTPSA id y15sm2547244qko.74.2021.12.16.02.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 02:30:18 -0800 (PST)
Message-ID: <8bd97df9-e629-feaf-5028-e20f61fd4001@linaro.org>
Date: Thu, 16 Dec 2021 07:30:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-4-shorne@gmail.com>
 <a0644ab7-85a5-e22d-607e-4e6761d87610@linaro.org>
 <alpine.DEB.2.22.394.2112142242120.1558178@digraph.polyomino.org.uk>
 <86e61afa-ab95-62e1-10a7-3de71db8deb8@linaro.org>
 <CAAfxs769tWjv-T=vCBpDPn9BB5KCZshzWoCfcejhd47-wZKHcA@mail.gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <CAAfxs769tWjv-T=vCBpDPn9BB5KCZshzWoCfcejhd47-wZKHcA@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 03/13] or1k: ABI Implementation
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
 GLIBC patches <libc-alpha@sourceware.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAxNS8xMi8yMDIxIDIwOjMzLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiAKPiAKPiBPbiBX
ZWQsIERlYyAxNSwgMjAyMSwgMTA6MTUgQU0gQWRoZW1lcnZhbCBaYW5lbGxhIDxhZGhlbWVydmFs
LnphbmVsbGFAbGluYXJvLm9yZyA8bWFpbHRvOmFkaGVtZXJ2YWwuemFuZWxsYUBsaW5hcm8ub3Jn
Pj4gd3JvdGU6Cj4gCj4gCj4gCj4gICAgIE9uIDE0LzEyLzIwMjEgMTk6NDMsIEpvc2VwaCBNeWVy
cyB3cm90ZToKPiAgICAgPiBPbiBUdWUsIDE0IERlYyAyMDIxLCBBZGhlbWVydmFsIFphbmVsbGEg
dmlhIExpYmMtYWxwaGEgd3JvdGU6Cj4gICAgID4KPiAgICAgPj4gK2lmIHRlc3QgIngkcHJvZmls
ZSIgIT0geG5vOyB0aGVuCj4gICAgID4+ICvCoCBpZiB0ZXN0ICJ4JHdpdGhfcHJvZmlsZSIgPT0g
eG5vOyB0aGVuCj4gICAgID4+ICvCoCDCoCBBQ19NU0dfRVJST1IoW0FCSSBkb2VzIG5vdCBzdXBw
b3J0IHByb2ZpbGluZ10pCj4gICAgID4KPiAgICAgPiBVc2luZyA9PSBpbiB0ZXN0IGlzIGEgYmFz
aGlzbS4KPiAgICAgPgo+ICAgICA+IEknZCBleHBlY3Qgc3VjaCBhIGNoYW5nZSB0byByZXF1aXJl
IHRoZSBidWlsZC1tYW55LWdsaWJjcy5weSBjb25maWd1cmF0aW9uCj4gICAgID4gZm9yIE9wZW5S
SVNDIHRvIHVzZSAtLWRpc2FibGUtcHJvZmlsZS4KPiAgICAgPgo+IAo+ICAgICBJIGVuZGVkIHVw
IG1peGluZyB1cCB0aGluZ3MgYW5kIHdoYXQgb3IxayBkb2VzIG5vdCBzdXBwb3J0IGlzIExEX1BS
T0ZJTEUKPiAgICAgaW5zdGVhZCBvZiAtLWVuYWJsZS1wcm9maWxlLsKgIEluIHRoaXMgY2FzZSBJ
IGFtIG5vdCBzdXJlIGlmIGl0IHdvdWxkCj4gICAgIGJlIGJldHRlciB0byBqdXN0IG5vdCBlbmFi
bGUgaXQgKGJ5IGlnbm9yaW5nIHRoZSBMRF9QUk9GSUxFIGhhbmRsaW5nCj4gICAgIGluIHJ0bGQu
YyBvciBkbC1zdXBwb3J0LmMpIGFuZCBlbWl0dGluZyBhIHdhcm5pbmcgb3IgYnkganVzdCBkdW1w
aW5nCj4gICAgIGFuZCBlcnJvciBhdCBwcm9jZXNzIGluaXRpYWxpemF0aW9uLgo+IAo+IAo+IEkg
Y2hlY2tlZCwgbmV3IHBvcnRzIGxpa2UgY3NreSBhbmQgYXJjIGFsc28gZG8gbm90IHNlZW0gdG8g
c3VwcG9ydCBMRF9QUk9GSUxFLsKgIFRoZXkgY2hvb3NlIG5vdCB0byBsZWF2ZSBhIHBsYWNlaG9s
ZGVyIGJsb2NrIGluIGRsLW1hY2hpbmUuaCBsaWtlIEkgZGlkIGluIG9yMWsuCj4gCj4gSSBjb3Vs
ZCByZW1vdmUgdGhlIGNvbW1lbnQsIG9yIHJlcGxhY2UgaXQgd2l0aCBhbiBhYm9ydCwgYnV0IEkg
cHJlZmVyIHRvIGtlZXAgaXQgYXMgaXQgbWFrZXMgaXQgY2xlYXIgd2hlcmUgdG8gYWRkIHRoZSBk
eW5hbWljIGxpbmtlciBwcm9maWxlIGhvb2suCgpJIHRoaW5rIHdlIHNob3VsZCByZW1vdmUgdGhl
IGNvbW1lbnRzLCB0aGUgY29kZSBtaWdodCBlbmRlZCB1cCBiZWluZyBub3QgdXBkYXRlZC4KCkxE
X1BST0ZJTEUgc2VlbXMgdG8gYmUgbm90IGEgcmVhbGx5IHVzZWQgZmVhdHVyZSwgSSB3aWxsIHRy
eSB0byBjbGVhbiB0aGlzIHVwCmJ5IGFkZGluZyBhbiBpbnRlcm5hbCBvcHRpb24gdGhhdCBpZiB0
aGUgcG9ydCB0aGF0IGRvZXMgbm90IHN1cHBvcnQgd2UsCnJ0bGQgYXQgbGVhc3QgZGlzYWJsZSBh
bGwgdGhlIHJlcXVpcmVkIGNvZGUgYW5kIG5vdCBzdGFydCB0aGUgcHJvZmlsZQpwcm9jZXNzIChs
aWtlIHByZXBhcmluZyB0aGUgZmlsZSwgZXRjKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
