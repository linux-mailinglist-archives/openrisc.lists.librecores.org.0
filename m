Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 45A304792F9
	for <lists+openrisc@lfdr.de>; Fri, 17 Dec 2021 18:41:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ECF1E242B5;
	Fri, 17 Dec 2021 18:41:26 +0100 (CET)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mail.librecores.org (Postfix) with ESMTPS id 2E823202A8
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 18:41:25 +0100 (CET)
Received: by mail-qk1-f169.google.com with SMTP id t83so2854296qke.8
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 09:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eLqake4hTsAzQhON1njpZDLabAQXV1u7dl15lYjRzAM=;
 b=NPkNxVsXNWCLvXwO0q9GKmViiliaCVP7FcA9Dw1lELEfMvpA8VKN5Ay0RrToSkR2UC
 GCG7FEmkVSTSsCAWyuEXgOh3I8Fpu38Ar9L5GPcQaP1C5VooPh5pKQSo52R/i6d+LS27
 OH+4zTacOc3I6AKx4dVBWS5KdKaxsXkYDxjJZBkhYka5iokzKyvlhi95D1NWvSODttst
 2RmVY5ygphuj5R5DO9U8xEgh2ee6YL2urXVFwMqrZKkzCS6fvG8Vk+E3gIDhNw0eix9x
 z9iN612DIWADyz6JgfUq7+Ww6m+jYOHy9eo+AuB5K9tJXDZtgjPmZGUs1nSvGmTA7vhJ
 y4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eLqake4hTsAzQhON1njpZDLabAQXV1u7dl15lYjRzAM=;
 b=lsfMeS1TWWlg3EblfTkHETvRXGViPghWv+VVm/5f46F44nCkhFZ7HsaP+h7wfEmN6z
 wEfUocxhphAkyso0wqLjt2v7FIKAvkvAEHlxFRmz7znqTAKpL3fh+zBw4it3yTfGXKDZ
 h7zaS4vbLWYyZZxNxUZgGoh+MrBieDeacBz/Rk/nd+4vWfBAdE/8Mk487DPw6fFPT5Bf
 MzPEQMpc+rCAy7v7kNSUYwwDywFjcpILTUz9lg6XLExcteiNRGRrUYQexA4iX5U/xlUu
 19uQ07+kJSZKcv+DxXqGq4UMmqKTiB2S+MCq5X7UD2Cs8v2TzkTxQwUAdIwYW3LHRG15
 2dFg==
X-Gm-Message-State: AOAM5316jv8e+BI/gqIql+F3QaAKKxLDoFe7uhJYQbLka7aC5BAuhVPQ
 QKWFltr233JvI5nc5yBhkIeJmQ==
X-Google-Smtp-Source: ABdhPJzDPFlpBDAPNMvxl2n3zwxt+KSnr62PONl4/EGrie7m14oCk0YOoifx/xZ8nS9szowKH//qUg==
X-Received: by 2002:a05:620a:280d:: with SMTP id
 f13mr2503321qkp.686.1639762883987; 
 Fri, 17 Dec 2021 09:41:23 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:7084:332e:7513:f115?
 ([2804:431:c7ca:103f:7084:332e:7513:f115])
 by smtp.gmail.com with ESMTPSA id y16sm5058112qki.41.2021.12.17.09.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:41:23 -0800 (PST)
Message-ID: <58c906a6-76b0-e4e1-bc17-5338b10e25f0@linaro.org>
Date: Fri, 17 Dec 2021 14:41:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-9-shorne@gmail.com>
 <a4105fcc-1844-b022-f378-3d5474ecaf56@linaro.org> <YbymWIYUxR/ndzWb@antec>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <YbymWIYUxR/ndzWb@antec>
Subject: Re: [OpenRISC] [PATCH v3 08/13] or1k: Linux Syscall Interface
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

CgpPbiAxNy8xMi8yMDIxIDEyOjAxLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBPbiBUaHUsIERl
YyAxNiwgMjAyMSBhdCAwNjoxNzo0NVBNIC0wMzAwLCBBZGhlbWVydmFsIFphbmVsbGEgd3JvdGU6
Cj4+PiBkaWZmIC0tZ2l0IGEvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9iaXRzL3RpbWVz
aXplLmggYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2JpdHMvdGltZXNpemUuaAo+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLjNhYjM4OGRhN2YKPj4+
IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvYml0
cy90aW1lc2l6ZS5oCj4+PiBAQCAtMCwwICsxLDE5IEBACj4+PiArLyogQml0IHNpemUgb2YgdGhl
IHRpbWVfdCB0eXBlIGF0IGdsaWJjIGJ1aWxkIHRpbWUsIE9wZW5SSVNDIHZlcnNpb24uCj4+PiAr
ICAgQ29weXJpZ2h0IChDKSAyMDIxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgo+Pj4g
KyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5Lgo+Pj4gKwo+Pj4gKyAg
IFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vcgo+Pj4gKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBM
ZXNzZXIgR2VuZXJhbCBQdWJsaWMKPj4+ICsgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIKPj4+ICsgICB2ZXJzaW9uIDIuMSBvZiB0
aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPj4+ICsK
Pj4+ICsgICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLAo+Pj4gKyAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4+PiArICAgTUVSQ0hBTlRBQklMSVRZ
IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKPj4+ICsg
ICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+Pj4gKwo+
Pj4gKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIg
R2VuZXJhbCBQdWJsaWMKPj4+ICsgICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJh
cnk7IGlmIG5vdCwgc2VlCj4+PiArICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4g
ICovCj4+PiArCj4+PiArI2RlZmluZSBfX1RJTUVTSVpFCTY0Cj4+Cj4+IE9rLCBhbHRob3VnaCBJ
IHRoaW5rIHdlIHNob3VsZCBmbGlwIHRoZSBkZWZhdWx0IHRvIDY0IGJpdHMgbWFrZQo+PiBvbGQg
cG9ydHMgdG8gb3ZlcnJpZGUgdG8gMzIuCj4gCj4gSXQgbWFrZXMgc2Vuc2UuICBJdCBtaWdodCBi
ZSBhIGJpdCB0cmlja3kgYXMgY3VycmVudGx5IF9fVElNRVNJWkUgZGVmYXVsdCBpcwo+IF9fV09S
RFNJWkUuICBJIHNlZSBhIGZldyBvbGQgcG9ydHMgd2hpY2ggaGF2ZSBfX1dPUkRTSVpFIDMyIGFu
ZCA2NCBsaWtlIHNwYXJjLgoKSSB3aWxsIGZpeCB0aGlzIHVwc3RyZWFtLCBpdCBpcyBqdXN0IGEg
bWF0dGVyIHRvIG92ZXJyaWRlIHRvIDMyIGZvciBvbGRlciBwb3J0cy4KCj4+Cj4+IE9rLCBJIHRh
a2UgdGhhdCBpbXBsZW1lbnRpbmcgaXQgc29sZWx5IG9uIF9fb3Ixa19jbG9uZSBpcyBtb3JlIGNv
bXBsZXggdGhhbgo+PiB1c2luZyBhIEMgd3JhcHBlci4KPiAKPiBJIGFtIG5vdCB0byBjbGVhciB3
aGF0IHlvdSBtZWFuIGhlcmUsIEkgdGFrZSB5b3UgYXJlIGFza2luZyB3aHkgd2Uga2VlcAo+IF9f
b3Ixa19jbG9uZSBpbiBhc3NlbWJseSByYXRoZXIgdGhhbiBpbXBsZW1lbnQgX19vcjFrX2Nsb25l
IGluIEMgdG9vLgo+IAo+IFRoZXJlIGFyZSBzb21lIHN0YWNrIHNldHVwIGJpdHMgaW4gX19vcjFr
X2Nsb25lIHdoaWNoIHJlcXVpcmUgYXNzZW1ibHkuCj4gCgpJIG1lYW50IG90aGVyd2lzZSBpbiBm
YWN0LCB3aHkgbm90IGltcGxlbWVudCBjbG9uZSBmb3Igb3IxayBwdXJlbHkgaW4gYXNzZW1ibHku
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
