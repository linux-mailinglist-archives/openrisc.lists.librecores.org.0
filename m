Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C771A194DE
	for <lists+openrisc@lfdr.de>; Thu,  9 May 2019 23:47:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8043928465;
	Thu,  9 May 2019 23:47:12 +0200 (CEST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mail.librecores.org (Postfix) with ESMTPS id 4FDF025BCD
 for <openrisc@lists.librecores.org>; Thu,  9 May 2019 23:47:10 +0200 (CEST)
Received: by mail-pg1-f181.google.com with SMTP id w22so1872369pgi.6
 for <openrisc@lists.librecores.org>; Thu, 09 May 2019 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bWd/ym5BvLNC4pk9WJMwBUrisKW0DPQPuOXRjHTNeWg=;
 b=qS5Um0Ef3oQSbqiLCxms1a3KUx8TpOrjW0zEmG9J0Q44xHcf5r4CFEpm7uFc8X9GIc
 mdqq0gqVA5KLkYILN+0Mx7tp2xofv4NlK5EpP8f3dNdmGXnSe47h6gpxEbjwPO5xv9Bt
 mkAYF1raTKepIo+defA4buRKhJRWSM/qjAWO7lbl/QP5QD0PcV9eFS0V8m06H3dr2mbo
 VWnlEM5k+EjBAp/nd8tWuYYRhF2T4i2z8z1rZI1V6ZO3v9brjgkqujO6VbU9woriYWTw
 8/JhnyNgfw4DpQpvFdSaUFnivI2IeFFgL75FzgH9mOVopNqkY6IzJKnfVM9EDDQ92lpz
 2NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bWd/ym5BvLNC4pk9WJMwBUrisKW0DPQPuOXRjHTNeWg=;
 b=JLZMnpQKbesDOLOJjFL9eJ6DOJc6gBhsN0IQBVQJ/MNYurWWvp65dYErmP9sGT/6Mz
 qwqwsbBsbT1Rcr/JHwG+DptmaFfn6AX6WlHcwwRcL3F4bi5d9YNDh8c+gekQjzl1HqBf
 /3y7VoaF/LNxW1KWNL9ZAGsiP3a4NMr21qBs8k5n1iVBVtsZhdi4R3XMWtLH9Q2Vy9A4
 hbf3hn3bBxCI1ZLxy9b7F+g95iq8OqTQTXbfGam5VtmGO82r4HJxfAHYDMDAijoLAB2+
 T1eQAGMRlHHealXCRmIhFmxKlSkDLoHrucA/sTyMZ6qtKUErPA6n+nT4cnnCMBYKP6Wm
 At1A==
X-Gm-Message-State: APjAAAW218pHt8qTeiw5hPjbY9Oakd+rzWifQsaKbrtmsDgtjGyNFSt6
 4PdbynyjoMR1n5coR7Bmh6EQUx2A
X-Google-Smtp-Source: APXvYqxYgLcjpOHAoIn+Ql48K1v4fbhd4sqksmIfmRmHx3v1fdUSiGGu803ci9bSkb9qkG9FMGf8zQ==
X-Received: by 2002:a65:4c0b:: with SMTP id u11mr8802107pgq.405.1557438428117; 
 Thu, 09 May 2019 14:47:08 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.googlemail.com with ESMTPSA id
 i22sm4039703pfa.127.2019.05.09.14.47.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:47:06 -0700 (PDT)
To: BAndViG <bandvig@mail.ru>, Stafford Horne <shorne@gmail.com>
References: <CAAfxs77GkWenpN0s1pM_YeVgNZabBx55fCqLfxoMffTSa-E=cw@mail.gmail.com>
 <afc760d8-0e01-6470-c8d2-6ddc366f3d10@twiddle.net>
 <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
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
Message-ID: <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
Date: Thu, 9 May 2019 14:47:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
Content-Language: en-US
Subject: Re: [OpenRISC] OpenRISC 1.3 spec
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

T24gNS84LzE5IDExOjA1IEFNLCBCQW5kVmlHIHdyb3RlOgo+IEFoLCBJIGltcGxlbWVudGVkIHNp
bWlsYXIgYXBwcm9hY2ggaW4gTUFST0NDSElOTyBpbmRlcGVuZGVudGx5IDopLCBzZWUgbGF0ZXN0
Cj4gY29tbWl0IHRvIGZwX3Vub3JkZXJlZF9jbXAgYnJhbmNoOgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVucmlzYy9vcjFrX21hcm9jY2hpbm8vY29tbWl0LzMxM2IyNTY4NzVjOGI2MTlmNWIxNmRi
NDdkOTE1ZTVkZmFlZGZmZjcKCkluIHRoZSBjb21taXQgYWJvdmUsIHlvdSBzYXkKCj4gSWYgQTEv
QjEvRDEgYWRkcmVzcyBgPiAzMGAgdGhhbiBgaW52YWxpZCBpbnN0cnVjdGlvbmAgZXhjZXB0aW9u
IGlzIHJhaXNlZC4KCkJ1dCB0aGF0IGRvZXNuJ3QgaGFuZGxlIEQxPTMwLCBEMVA9MS4KClNpbmNl
IHlvdSBhcmUgdXNpbmcgYSAoNS1iaXQ/KSBhZGQtd2l0aC1jYXJyeSBjaXJjdWl0LCBpcyBpdCBl
YXN5IHRvIHJhaXNlIHRoZQppbnZhbGlkIGluc3RydWN0aW9uIGlmIHRoZXJlIGlzIGNhcnJ5IG91
dCBvZiBiaXQgNCwgaW5zdGVhZCBvZiB0aGUgaGFyZC1jb2RlZApjb21wYXJpc29uIGFnYWluc3Qg
MzA/CgpPdGhlcndpc2UsIEknZCBkcm9wIHRoZSBpbnZhbGlkIGluc3RydWN0aW9uIGFuZCBsZXQg
RDIgd3JhcCBhcm91bmQuCkQxPTMxLEQxUD0xIHdvdWxkIGJlIGEgdmFsaWQgKGJ1dCBzaWxseSkg
aW5zdHJ1Y3Rpb24gY2xvYmJlcmluZyB0aGUgc3RhY2sKcG9pbnRlciAoUjEpLiAgQXMgd291bGQg
RDE9MzEsRDFQPTAsIG92ZXJ3cml0aW5nIHRoZQpvdWdodC10by1oYXZlLWJlZW4taGFyZHdpcmVk
LWJ1dC1pc24ndCBSMC4gIEJvdGggYXJlIGNlcnRhaW5seSB1c2VyIGJ1Z3MsIGJ1dApzbyB3aGF0
IC0tIERvbid0IERvIFRoYXQgVGhlbi4KCgpyfgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
