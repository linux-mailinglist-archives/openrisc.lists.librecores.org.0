Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D703F5180BE
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 11:14:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 896D42488F;
	Tue,  3 May 2022 11:14:22 +0200 (CEST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id 69073247E5
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 11:14:20 +0200 (CEST)
Received: by mail-pj1-f50.google.com with SMTP id fv2so14796521pjb.4
 for <openrisc@lists.librecores.org>; Tue, 03 May 2022 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XOjg/7UInhraO/29MWhTEQeRn1OMshOC2gZLr5HQ08U=;
 b=fLg2qIBDKZJyaNhjbQDvTQlBdJMGJj47K66yusGgJ7vE6T8jiA+iqCdn7bEyVHWefB
 fUjEpgVHF7/gRXr1x+/i1RXHu1M/8BaDJLtY1X2wvP1FMIFWU7fx6vBF/YDPtSfasRfe
 B9R8Zdoo4L9EFZ+5HJD7Oltnh96hHaw57YM7D8uO8vDHew/Iqm8vy8LYd2UnEi7kPHZg
 AqTEfF8ZpCSQJ1JFC2RgIve4ICTgHmbaaEr5OGXOilIG0TbMRwrQKNUGZWjmkJK5Ycvp
 +8Q/AIZgqAe342H+9Z7cWGms7zcHnVHuompk2dEA6UPgB/rwiZhWJwEaTHa1UvKgO6tY
 sJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XOjg/7UInhraO/29MWhTEQeRn1OMshOC2gZLr5HQ08U=;
 b=2ySE27UOZSuXVgm3kCaSj16ViYfZ3WSnkg0QP1GhDALpYHPHSq0wCU025M43aR/i4x
 h2LlrYol8vDsw5xKntuQv++KGVtgkGtB5RjncVmzBUc9zQGJFC3QNFNyAntAWbjuSyC2
 FDlQVcFaEx3jqafNKferSZJPLyFxT+m44laqYliq570c6EBnULeGvXaTMgw/VuvNpeS9
 ih9X1uStaN7Tx789t29j82cQPyQZPSw01pJNlydNtnbVcoEe3u7tsDB5mor2l22M5l5I
 9UO7yylnQaF20aZI75KD4xAvOt6NePtb4qeRCguUXCaaVPv0j1OfLcb1DOsMLYR2WL6x
 CZ4g==
X-Gm-Message-State: AOAM5301iKYGXnMijM/vZumlmMXJhrvK3m0p2+O+wCKzh/wb/vZ3YGb6
 Je5OsVz1mITp5Df7MlIzCh0=
X-Google-Smtp-Source: ABdhPJwNZfNUNumR+Z8yxaidlXhFANK0r3mMVquzCn7nKgHlNF43vBUkbLOxWljJuoa54tB7fSGMhg==
X-Received: by 2002:a17:90b:3b42:b0:1dc:5cdf:5649 with SMTP id
 ot2-20020a17090b3b4200b001dc5cdf5649mr3600846pjb.239.1651569258713; 
 Tue, 03 May 2022 02:14:18 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170902aa8d00b0015e8d4eb249sm5892277plr.147.2022.05.03.02.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 02:14:18 -0700 (PDT)
Date: Tue, 3 May 2022 18:14:16 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <YnDyaEW2QiUXTNx8@antec>
References: <20220502225230.237369-1-Jason@zx2c4.com>
 <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
 <YnDt0YZK3aG3y8Tl@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnDt0YZK3aG3y8Tl@zx2c4.com>
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
Cc: openrisc@lists.librecores.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMDMsIDIwMjIgYXQgMTA6NTQ6NDFBTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDAyLCAyMDIyIGF0IDA0OjU3OjQzUE0gLTA3MDAsIFJp
Y2hhcmQgSGVuZGVyc29uIHdyb3RlOgo+ID4gT24gNS8yLzIyIDE1OjUyLCBKYXNvbiBBLiBEb25l
bmZlbGQgd3JvdGU6Cj4gPiA+IE9wZW5SSVNDIGRlZmluZXMgdmFyaW91cyBub3AgaW5zdHJ1Y3Rp
b25zIGluIG9yMWsgYXMgbWVhbmluZyBzaHV0ZG93biBvcgo+ID4gPiByZXNldC4gSW1wbGVtZW50
IHRoZXNlIGluIFRDRy4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBMaW51eCBhbmQKPiA+ID4g
Y29uZmlybWVkIHRvIHdvcmsuCj4gPiAKPiA+IE5vLCBPcGVuUklTQyBkb2VzIG5vdCBkZWZpbmUg
dmFyaW91cyBub3AgaW5zdHJ1Y3Rpb25zLCBldGMuCj4gPiAKPiA+IE9wZW5SSVNDIGRlZmluZXMg
YSBQb3dlciBNYW5hZ2VtZW50IFJlZ2lzdGVyIHRvIGhhbmRsZSBkb3plIGFuZCBzdXNwZW5kOyB0
aGVyZSBpcyBubyAKPiA+IHNwZWNpZmljYXRpb24gZm9yIHNodXRkb3duIG9yIHJlc2V0Lgo+ID4g
Cj4gPiBTZWUgaHR0cHM6Ly9vcGVucmlzYy5pby9hcmNoaXRlY3R1cmUKPiAKPiAKPiBTdGFmZm9y
ZCBpcyBpbiB0aGUgcHJvY2VzcyBvZiBkb2N1bWVudGluZy9zcGVjJ2luZyB0aGUgbm9wIHN0dWZm
LgoKSGkgUmljaGFyZCwKClllcywgd2UgaGFkIGEgbWFpbCBkaXNjdXNzaW9uIGFib3V0IHRoaXMg
d2l0aCBQZXRlci4gIFRoaXMgYmVpbmcgc2ltaWxhciB0byBBUk0Kc2VtaWhvc3Rpbmc7IGVuYWJs
aW5nIHRoZXNlIHNwZWNpYWwgaW5zdHJ1Y3Rpb25zIHNob3VsZCBiZSBiZWhpbmQgdGhlIHNlbWlo
b3N0aW5nCmZsYWcuICBTb21ldGhpbmcgdGhhdCBuZWVkcyB0byBiZSBkb25lIGZvciB0aGlzIHBh
dGNoLgoKSWYgeW91IGhhdmUgY29uY2VybiBhYm91dCB0aGlzIGxldCBtZSBub3cuCgpNYWlsOgog
IC0gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNn
ODg0NTYwLmh0bWwKCk91ciBvdGhlciBzaW11bGF0b3JzIGltcGxlbWVudCB0aGlzLCBzbyB0aGUg
Y29tcHJvbWlzZSBpcyBpZiB3ZSBkb2N1bWVudCB0aGlzCm9mZmljaWFsbHkgYW5kIG9ubHkgaW1w
bGVtZW50IGl0IGJlaGluZCBzZW1paG9zdGluZyBwZXRlciB3YXMgT0sgd2l0aCBpdC4KCkkgaGF2
ZW4ndCBzdGFydGVkIG9uIHRoZSBkb2N1bWVudGF0aW9uIHlldCBhcyBJIGhhdmVuJ3QgaGFzIG11
Y2ggdGltZSBpbiB0aGUKbGFzdCBmZXcgZGF5cyB0aG91Z2guCgpPcjFrc2ltOgogIC0gaHR0cHM6
Ly9naXRodWIuY29tL29wZW5yaXNjL29yMWtzaW0vYmxvYi83OWM2ZjE1MzM5MDEyN2U1MDI1OWQ0
NmE3Y2MwNDIxYWE3ODdkMmVkL2NwdS9vcjMyL2luc25zZXQuYyNMNzY4CnNpbToKICAtIGh0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1ibG9iO2Y9c2ltL29y
MWsvb3Ixay5jO2g9YmZhYjM1NDYxYmVlMTQ1N2ZlOGY0MjE3OWFjNmQyN2Y1YWQ0NmI5NjtoYj1I
RUFECgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
