Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C5579166B9
	for <lists+openrisc@lfdr.de>; Tue,  7 May 2019 17:28:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8C8D325B1B;
	Tue,  7 May 2019 17:28:52 +0200 (CEST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mail.librecores.org (Postfix) with ESMTPS id 8D56325B78
 for <openrisc@lists.librecores.org>; Tue,  7 May 2019 17:28:50 +0200 (CEST)
Received: by mail-pg1-f179.google.com with SMTP id t22so8471747pgi.10
 for <openrisc@lists.librecores.org>; Tue, 07 May 2019 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KKomz3blqZsJvJOGYOfxzHdacizRDVZ8UOqtz52jbO8=;
 b=b26gmCdAB4F5x9zx3XFCdM7VxLftxgZR2jYXYWMwpcUjLpMpYhPzrmVoGSr4tw3IEB
 cvK1lg08qdqRN8JZQN1swIX3k3fGGKiR1qUDyM3afdsDZ5DK0P6/w4bMW+Ir7EFYgpO+
 STLYyB1/JS7jSceFnRZBSAJ0agD3+ZHgjyvHKJaK4NKtKXfTFSr9Q/cU1lMhU/OjuO/K
 LmiKrzt4g8JLKv63HRalmiAgqQNp7fkZa4NCBPKnadumX7Cv7WqwPju6D/erXuIjyqxh
 3ddpHeg1AlLJe2jQYQzzWDSMCDcjR9Q5l2p22fzT+r6SZdxoMXKpztN2Dq0Q+V/ef7Zm
 2tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KKomz3blqZsJvJOGYOfxzHdacizRDVZ8UOqtz52jbO8=;
 b=mbFiqDH2ZF/fkV85/GuOOqX6cfA6xSpFr9PaYspJw9ieHbTpYh36enz35oH0Fhnmz3
 NA5Ktflvmp3aNy/oiznITPD0Jb4ZoSQAtvtBX/Of4e7Ak9LpY4Quvq2Hc4JZcn6p7YQw
 I7n1U3m7mbNq6jlz8i2/q7mlqn8erliZDrbSOJtU+RRXrgv6lPgekOLrueCkV84pFFg+
 vRJkFufyPQ5gYXSkjMAwslwhfOpeZ998/oT/rGcNgkWCzk6QYawdYLSSSmsNvs5Zlmoj
 zXYmaynQrms1IrbaynhBPMXM2NDcd9xZKzF4V7TLndMH6W2KU/E17EP8Ah7fuFs9OHUn
 t9RA==
X-Gm-Message-State: APjAAAUcYR0qGidqLPN+/CoDQ+ST6h4qi9pW2NrkMopoDe0hqp2K0iQ1
 fUyQaiEYmLAT7fOpfTDzMSlTNQvF
X-Google-Smtp-Source: APXvYqwawZ9n0IO2/918vY6Re18NyA4PdQcasZQwTazovQuk/OKMM+SRx8s4hDuR6RN0PCXdcTp5fA==
X-Received: by 2002:a62:62c1:: with SMTP id w184mr17669766pfb.95.1557242928512; 
 Tue, 07 May 2019 08:28:48 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
 by smtp.googlemail.com with ESMTPSA id 132sm8263483pga.79.2019.05.07.08.28.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 08:28:46 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>, BAndViG <bandvig@mail.ru>
References: <CAAfxs77GkWenpN0s1pM_YeVgNZabBx55fCqLfxoMffTSa-E=cw@mail.gmail.com>
 <afc760d8-0e01-6470-c8d2-6ddc366f3d10@twiddle.net>
 <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
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
Message-ID: <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
Date: Tue, 7 May 2019 08:28:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425211702.GG32284@lianli.shorne-pla.net>
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

T24gNC8yNS8xOSAyOjE3IFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBUaGlzIGlzIGltcGxl
bWVudGVkIGluIGJpbnV0aWxzIG5vdy4gU2VlIG15IHBhdGNoZXMgaGVyZToKPiAKPiAgIC0gaHR0
cHM6Ly9naXRodWIuY29tL3N0ZmZyZGhybi9iaW51dGlscy1nZGIvY29tbWl0cy9vcmZweDY0YTMy
LTMKPiAKPiBJIGhhdmUgbm90IHNxdWFzaGVkIHRoZSBjb21taXRzIGJlY2F1c2UgaXQgbWFrZXMg
aXQgYSBiaXQgZWFzaWVyIGZvciByZXZpZXdpbmcKPiB3aGF0IEkgZGlkIHRvIGdldCB0aGVzZSBm
bGFncyB3b3JraW5nLgoKSSd2ZSBpbXBsZW1lbnRlZCB0aGlzIGZvciBxZW11LAoKICBodHRwczov
L2dpdGh1Yi5jb20vcnRoNzY4MC9xZW11L2NvbW1pdHMvdGd0LW9yMWsKCmFsdGhvdWdoIHVudGVz
dGVkIHNvIGZhci4gIEkgbmVlZCB0byByZWdlbmVyYXRlIG15CmNyb3NzLXRlc3RpbmcgZW52aXJv
bm1lbnQgZm9yIG9yMWsuLi4KCgpyfgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
