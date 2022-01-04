Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE694841A6
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 13:28:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 18DB024312;
	Tue,  4 Jan 2022 13:28:18 +0100 (CET)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mail.librecores.org (Postfix) with ESMTPS id 87DCA24105
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 13:28:16 +0100 (CET)
Received: by mail-qv1-f41.google.com with SMTP id r6so34058975qvr.13
 for <openrisc@lists.librecores.org>; Tue, 04 Jan 2022 04:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lshTDC9/pCwJS0OjklGC5pBLPffvLPpzOoSlXJ4f75c=;
 b=u7FELRWULfYiZ4nCLNEVpcXxKYlAGRgrFRCMCS3BlMkkaKhJ4Ig11XymttOx2mBEYF
 Y8N3rWEAf/n4TK2xwGsEJAEZrL6ZvRnMAIJ1kS1IThaaNDBeo3tBGdwhyzT5eRSonadV
 v5OiWXTBVjSFHxrm3hOfPbpleGO4zeyDEiGfcXg0CHzQb5+9QF1+DSANw/uSBYqfLx0Z
 geEUQUGRZFKEXZyMeFx1jaKKtkZ1RR4BG8SXgibpMrz/TbkQ/Fjqbg10unjuonzzEZ41
 QV3X40kPbFmim2IkRwbT1vpKNQRWEVD3l41Hrttedi3x4ydIEmhQIxhVg7LGwzK6KnC8
 Fm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lshTDC9/pCwJS0OjklGC5pBLPffvLPpzOoSlXJ4f75c=;
 b=PGXXHfTuNjDsCvSyJixYRc6A8n3kYMRMf7/GLfSqeuiDA6bCSjiIYTNXVV7C7jvGS7
 xRJLMvu1HbdyrDgAQP0Y+YKYZ8INTaBSl9xcem527dSSwh6Wd9BCUgEoJPfPFPq74WPZ
 SHNI/xmEKE3kmEYnBFmHsMsNYrGVENOY56wsRBel8wCjuXtm6CNvDSz33mUe0zowsxV6
 mmdkVFmwZr8STDbRIDdhmJoZVbzUgH1xOvToF1x/3D1iz0svBY3CfNFgVHo97EtkPnsy
 mn2FZ8EzmPmi7lZO/D97JKTVETWKSqet+uAOJRwM/qZoCiYBIqrLFbst/xvyx4npPVfa
 6Vww==
X-Gm-Message-State: AOAM530Ae2L03MFHNQZyMZttWJ5CHl30XMp9sa1ujWPolColcFRFJ+VB
 S6BxBbdUMToeLFZsq+W2uBuW2g==
X-Google-Smtp-Source: ABdhPJzbqX152/3vLlznBIJXl6lpJx1Qt+yu3YRGn1eQAXALeH/JfR3nscSwEihPRBvD7+jxEwNuFQ==
X-Received: by 2002:a05:6214:76a:: with SMTP id
 f10mr46034285qvz.8.1641299295517; 
 Tue, 04 Jan 2022 04:28:15 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:a350:1960:9a87:fba4:a664?
 ([2804:431:c7ca:a350:1960:9a87:fba4:a664])
 by smtp.gmail.com with ESMTPSA id k8sm32667166qtx.35.2022.01.04.04.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 04:28:15 -0800 (PST)
Message-ID: <b4207a34-da46-1464-dec2-70c3a39e969d@linaro.org>
Date: Tue, 4 Jan 2022 09:28:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20220104031414.2416928-1-shorne@gmail.com>
 <20220104031414.2416928-14-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20220104031414.2416928-14-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v5 13/13] Documentation for OpenRISC port
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

CgpPbiAwNC8wMS8yMDIyIDAwOjE0LCBTdGFmZm9yZCBIb3JuZSB2aWEgTGliYy1hbHBoYSB3cm90
ZToKPiBPcGVuUklTQyBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbjoKPiAKPiAgaHR0cHM6Ly9y
YXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL29wZW5yaXNjL2RvYy9tYXN0ZXIvb3BlbnJpc2MtYXJj
aC0xLjMtcmV2MS5wZGYKPiAKPiBDdXJyZW50bHkgdGhlIHBvcnQgYXMgb2YgdGhlIDIwMjItMDEt
MDMgcmViYXNpbmcgdGhlcmUgYXJlIG5vIGtub3duCj4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHRl
c3QgZmFpbHVyZXMuCj4gCj4gV3JpdGluZyBjcmVkaXRzIGZvciB0aGUgcG9ydCBhcmU6Cj4gCj4g
IFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWlsLmNvbT4KPiAgQ2hyaXN0aWFuIFN2ZW5zc29u
ICA8Ymx1ZUBjbWQubnU+CgpMR1RNLCB0aGFua3MuCgpSZXZpZXdlZC1ieTogQWRoZW1lcnZhbCBa
YW5lbGxhICA8YWRoZW1lcnZhbC56YW5lbGxhQGxpbmFyby5vcmc+CgoKPiAtLS0KPiAgTkVXUyAg
IHwgOSArKysrKysrKysKPiAgUkVBRE1FIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9ORVdTIGIvTkVXUwo+IGluZGV4IDlkYTJhNzQw
ZWMuLjFiN2E2NGQ2NTQgMTAwNjQ0Cj4gLS0tIGEvTkVXUwo+ICsrKyBiL05FV1MKPiBAQCAtMTA2
LDYgKzEwNiwxNSBAQCBNYWpvciBuZXcgZmVhdHVyZXM6Cj4gICAgY2FuIHVzZSBpdCB0byBlZmZp
Y2llbnRseSBsb2NhdGUgdW53aW5kaW5nIGluZm9ybWF0aW9uIGZvciBhIGNvZGUKPiAgICBhZGRy
ZXNzLgo+ICAKPiArKiBTdXBwb3J0IGZvciBPcGVuUklTQyBydW5uaW5nIG9uIExpbnV4IGhhcyBi
ZWVuIGFkZGVkLiAgVGhpcyBwb3J0IHJlcXVpcmVzCj4gKyAgYXMgbGVhc3QgYmludXRpbHMgMi4z
NSwgR0NDIDExLCBhbmQgTGludXggNS40LiAgQ3VycmVudGx5IG9ubHkgc29mdC1mbG9hdAo+ICsg
IEFCSSBpcyBzdXBwb3J0ZWQ6Cj4gKwo+ICsgICAgLSBvcjFrLWxpbnV4LWdudQo+ICsKPiArICBU
aGUgT3BlblJJU0MgQUJJIGlzIDMyLWJpdCBiaWctZW5kaWFuIGFuZCB1c2VzIDY0LWJpdCB0aW1l
ICh5MjAzOCBzYWZlKSBhbmQKPiArICA2NC1iaXQgZmlsZSBvZmZzZXRzIChMRlMgZGVmYXVsdCku
Cj4gKwo+ICBEZXByZWNhdGVkIGFuZCByZW1vdmVkIGZlYXR1cmVzLCBhbmQgb3RoZXIgY2hhbmdl
cyBhZmZlY3RpbmcgY29tcGF0aWJpbGl0eToKPiAgCj4gICogT24geDg2LTY0LCB0aGUgTERfUFJF
RkVSX01BUF8zMkJJVF9FWEVDIGVudmlyb25tZW50IHZhcmlhYmxlIHN1cHBvcnQKPiBkaWZmIC0t
Z2l0IGEvUkVBRE1FIGIvUkVBRE1FCj4gaW5kZXggZDBmMGVkYjM5My4uM2Q1YTc4Y2NmZiAxMDA2
NDQKPiAtLS0gYS9SRUFETUUKPiArKysgYi9SRUFETUUKPiBAQCAtMzUsNiArMzUsNyBAQCBUaGUg
R05VIEMgTGlicmFyeSBzdXBwb3J0cyB0aGVzZSBjb25maWd1cmF0aW9ucyBmb3IgdXNpbmcgTGlu
dXgga2VybmVsczoKPiAgCW1pY3JvYmxhemUqLSotbGludXgtZ251Cj4gIAltaXBzLSotbGludXgt
Z251Cj4gIAltaXBzNjQtKi1saW51eC1nbnUKPiArCW9yMWstKi1saW51eC1nbnUKPiAgCXBvd2Vy
cGMtKi1saW51eC1nbnUJSGFyZHdhcmUgb3Igc29mdHdhcmUgZmxvYXRpbmcgcG9pbnQsIEJFIG9u
bHkuCj4gIAlwb3dlcnBjNjQqLSotbGludXgtZ251CUJpZy1lbmRpYW4gYW5kIGxpdHRsZS1lbmRp
YW4uCj4gIAlzMzkwLSotbGludXgtZ251Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
