Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECDD18E5A8
	for <lists+openrisc@lfdr.de>; Sun, 22 Mar 2020 01:59:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 96BDB20A5A;
	Sun, 22 Mar 2020 01:59:01 +0100 (CET)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id BB27720853
 for <openrisc@lists.librecores.org>; Sun, 22 Mar 2020 01:58:59 +0100 (CET)
Received: by mail-pf1-f173.google.com with SMTP id q3so968514pff.13
 for <openrisc@lists.librecores.org>; Sat, 21 Mar 2020 17:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=5dMn5iTCFMqX6tiFrpvOhTdSZP2QbT1rjSKxIRjAL4U=;
 b=edeUdkOgE6Q/eAOZXL4kjcSqHYw9ES7H/Ov1tC8+my2TIvL+0jDalEy6sqFExKp5I7
 StGIePcMw3bJuw673BigkRNk8bpn5LccKNhJyj9PAb9F+8iK0cVR1IuPjVoEft2HcKLu
 acyQFgVKXuk4BtqlWA9jGqncQWzTYhY6EIlx9ljqf0rG1G8GEYlUnWLrKKxn0hc7q2ed
 Hu651lu490C76XU4HL/M6FBXkVtcOQG4fS4rCKLT03V5CQU+y/waCqOZkzWXh/ZpXWz/
 wZsLieoZiOAZeFdvFOLQuSA86nEMqZc8McHWpgqfKZtRyVmselYFZvPUhCudHCd33S5d
 uMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5dMn5iTCFMqX6tiFrpvOhTdSZP2QbT1rjSKxIRjAL4U=;
 b=GEKC49fiWcNTO40bJr1yGH2g1ghszYXIvcSCPrG6v1sJpsboKxPyR/PI78wK8ped3S
 /CAHQ6uqCCGL8gudZxoQxEJlVvj8BDRYnMnSkHy0jXp0sVo3iQOswHc3/lNwXjJVfK3T
 vqpMA4wE0tfa+vC/ybTumTQNqceQ8Z9ds15Qown/U4TSYqHhoskYgVKh3LJahSV/92mB
 fDU6P0iDEGuu63BvB1f0TxDf6mx0diB3h3y3un5Ji4TxNKjubgXdSOWEAMOENmyVAreQ
 4Cv8YJAF9Wk2Y7lqccohY1ZpnS2UGHmdYOiHajYNnYgX0D7yMcrMp08hujznDsB9dbW9
 6G+w==
X-Gm-Message-State: ANhLgQ1Qm/EnoN+OxhsEu0x/uAC4mvDUCIrEtJISSLlABw6QjC11XTQT
 Jec6DNr851kF7eOp/j5aCeo=
X-Google-Smtp-Source: ADFU+vva6A9SxuxrjTmPLj/PGPLxx1QZ9brAzkPQz/TSO6qUXegVNNhA0cZXoGkSzzIW7KU1iSQMaA==
X-Received: by 2002:a62:3784:: with SMTP id e126mr17146905pfa.50.1584838738027; 
 Sat, 21 Mar 2020 17:58:58 -0700 (PDT)
Received: from localhost (g54.222-224-167.ppp.wakwak.ne.jp. [222.224.167.54])
 by smtp.gmail.com with ESMTPSA id
 f127sm9165872pfa.112.2020.03.21.17.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 17:58:56 -0700 (PDT)
Date: Sun, 22 Mar 2020 09:58:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Andrey Bacherov <bandvig@mail.ru>
Message-ID: <20200322005854.GM7926@lianli.shorne-pla.net>
References: <CAAfxs75F6mcX_qHPYLzCbudeONXkSCOqNcXGRR4o+bgMDZ_VxQ@mail.gmail.com>
 <1cbd1694-51c1-9b3f-5bb1-6f378b4e703e@mail.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cbd1694-51c1-9b3f-5bb1-6f378b4e703e@mail.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] Fpu tininess
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

T24gU2F0LCBNYXIgMjEsIDIwMjAgYXQgMDQ6MDY6NDVQTSArMDMwMCwgQW5kcmV5IEJhY2hlcm92
IHdyb3RlOgo+IEhlbGxvIFN0YWZmb3JkCj4gCj4gT1JLMSBGUFUgaW1wbGVtZW50cyB0aW5pbmVz
cyBhZnRlciByb3VuZGluZy4KPiAKPiBodHRwczovL2dpdGh1Yi5jb20vYmFuZHZpZy9vcjFrX3Rl
c3RmbG9hdC9ibG9iLzk5NGM4NGI4YzExZjM2MDk3NzJjMzE4Zjg4OTRlY2JhZDg2MGJkODkvc3Jj
L3Rlc3RmbG9hdC5jI0wxNDUKClRoYW5rcywgSSBhbHNvIHNldCBnbGliYyBhbmQgZ2NjIHRvIGVt
dWxhdGUgd2l0aCB0aW5pbmVzcyBhZnRlciByb3VuZGluZy4KSSBqdXN0IHRyaWVkIHRvIHJ1biBh
bGwgdGhlIHRlc3RzIGFmdGVyIHN3aXRjaCB0aW5pbmVzcyBhZnRlciByb3VuZGluZyBvZmYgYXMK
d2VsbCBhbmQgZ2V0IHRoZSBzYW1lIHJlc3VsdHMuICBQZXJoYXBzIHRoZSBpc3N1ZSB3aXRoIHRo
ZSB1bmRlcmZsb3cgZmxhZyBpcyBub3QKcmVsYXRlZCB0byB0aGUgdGluaW5lc3Mgc2V0dGluZy4K
ClJpZ2h0IG5vdyBteSB0ZXN0cyBhcmUgcnVubmluZyBjb21wbGV0ZWx5IG9uIFFFTVUgc2ltdWxh
dG9ycy4gIEkgd2FzIGFibGUgdG8gdHJhY2sKb25lIG9mIHRoZSB1bmRlcmZsb3cgaXNzdWVzIHRv
IHRoZSBzb2Z0d2FyZSBpbXBsZW1lbnRhdGlvbiBvZiAnbG9nJyB0byBtZSBpdApsb29rZWQgbGlr
ZSBhbiBpc3N1ZSBpbiB0aGUgc29mdCBmbG9hdCBpbXBsZW1lbnRhdGlvbi4KClRoZXJlIGFyZSBz
byBtYW55IGxheWVycyBoZXJlLCBxZW11IGZsb2F0IGVtdWxhdGlvbiwgZ2NjIGZsb2F0IGVtdWxh
dGlvbiBnbGliYwpmbG9hdGluZyBwb2ludCByb3V0aW5lcy4gIEkgaGF2ZSBwcm9iYWJseSBqdXN0
IGhhdmUgc29tZXRoaW5nIHdyb25nIG9uIG9uZQpsYXllciwgIGJ1dCBJIHdhbnRlZCB0byBiZSBz
dXJlIHRoZSBzaW11bGF0aW9uIGlzIGlubGluZSB3aXRoIHRoZSBoYXJkd2FyZS4KCgo+IEF0IGxl
YXN0IGl0IHNob3VsZC4uLgo+IAo+IEkgbXVzdCBhZG1pdCB0aGF0IEkgd2Fzbid0IEZQLWd1cnUg
d2hpbGUgd2FzIGltcGxlbWVudGluZyBGUCA6KS4gQW5kIEknbSBub3QKPiBGUC1ndXJ1IG5vdy4g
OikuIFBlcmhhcHMgSSBkb24ndCB1bmRlcnN0YW5kIEZQLXN0YW5kYXJkIGNsZWFybHkgaW4gYWxs
Cj4gYXNwZWN0cy4gQXMgYSByZXN1bHQgInVuZGVyZmxvdyBmbGFnIiBiZWhhdmlvciBkb2Vzbid0
IG1lZXQgc3RhbmRhcmQKPiBjb21wbGV0ZWx5LiBBbmQgSSB0ZW1wb3JhcnkgYmxvY2tlZCAidW5k
ZXJmbG93IGZsYWciIGJlaGF2aW9yIHZlcmlmaWNhdGlvbgo+IGluIG15IHZlcnNpb24gb2YgdGVz
dF9mbG9hdCB0b29sOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9iYW5kdmlnL29yMWtfdGVzdGZs
b2F0L2Jsb2IvOTk0Yzg0YjhjMTFmMzYwOTc3MmMzMThmODg5NGVjYmFkODYwYmQ4OS9zcmMvbWls
aWV1LmgjTDUwCj4gCj4gIlVuZGVyZmxvdyBmbGFnIiBiZWhhdmlvciBjb3JyZWN0aW9uIGlzIGlu
IG15IFRPRE8gbGlzdCwgYnV0IEknbSBub3Qgc3VyZQo+IHRoYXQgSSBjb3VsZCBwYXkgZW5vdWdo
IGF0dGVudGlvbiBmb3IgaXQuCj4gQlRXLCBpdCBjb3VsZCBiZSB0YXNrIGZvciBHU29DLCBpZiBz
b21lYm9keSB3b3VsZCBiZSByZWFkeSB0byBiZWNvbWUgYQo+IG1lbnRvci4KCkFyZSB5b3VyIHZv
bHVudGVlcmluZyB0byBtZW50b3IgYSBzdHVkZW50PyAgV2UgY2FuIHJhaXNlIGEgcHJvamVjdCBw
cm9wb3NhbAp1bmRlciB0aGUgbGlicmVjb3JlcyBHU29DIHByb2dyYW0uCgotU3RhZmZvcmQKCj4g
V0JSCj4gQW5kcmV5Cj4gCj4gCj4gMjAuMDMuMjAyMCAxMDoyMSwgU3RhZmZvcmQgSG9ybmUgd3Jv
dGU6Cj4gPiBIaSBBbmRyZXksCj4gPiAKPiA+IFRoYW5rcyBmb3IgcmVwbHlpbmcgdG8gdGhlIHF1
ZXN0aW9uIGFib3V0IGZ1c2Vzb2MuCj4gPiAKPiA+IEkndmUgYmVlbiBtZWFuaW5nIHRvIGFzayB5
b3UgYSBxdWVzdGlvbiBhYm91dCBvdXIgZnB1IGltcGxlbWVudGF0aW9uLgo+ID4gQ3VycmVudGx5
IGZvciBnbGliYyBtb3N0wqAgZmxvYXRpbmcgcG9pbnQgbWF0aCByb3V0aW5lcyB1c2UgNjQtYml0
IGRvdWJsZQo+ID4gcHJlY2lzaW9uLsKgIEFueXRoaW5nIG5vdCBoYW5kbGVkIGJ5IHRoZSBhcmNo
aXRlY3R1cmUgaXMgZW11bGF0ZWQuCj4gPiAKPiA+IEkgaGF2ZSB3cml0dGVuIHRoZSBlbXVsYXRp
b24gcGF0Y2hlcyBidXQgdGhlIHRlc3RzIGFyZSBoYXZpbmcgaXNzdWVzCj4gPiB3aXRoIHVuZGVy
ZmxvdyBmbGFncyBiZWluZyBpbmNvcnJlY3RseSBzZXQgc29tZXRpbWVzLgo+ID4gCj4gPiBJIGhh
dmUgYSBodW5jaCBpdCBtYXkgYmUgZHVlIHRvIG15IHRpbmluZXNzIHNldHRpbmcuwqAgwqBEbyB5
b3Uga25vdyB3aGF0Cj4gPiB3ZSBzaG91bGQgc2V0IGZvcjoKPiA+IAo+ID4gX0ZQX1RJTklORVNT
X0FGVEVSX1JPVU5ESU5HCj4gPiAKPiA+ID8KPiA+IAo+ID4gVGhlIGdsaWJjIHBhdGNoCj4gPiBo
dHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2Mvb3Ixay1nbGliYy9jb21taXQvNDc0ODE3N2JkZGU5
Mjg0Njk3NGZjOGVjNTIzZDIxMmQ2ZGI3NGFhMAo+ID4gCj4gPiBUaGUgZ2NjIHBhdGNoCj4gPiBo
dHRwczovL2dpdGh1Yi5jb20vc3RmZnJkaHJuL2djYy9jb21taXQvOGU5OWUyNTJlZGMxMzAxNjJi
NmQyZDdiZGVmMjE4MDMwNTM4OTA1Mwo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gT3BlblJJU0MgbWFpbGluZyBsaXN0Cj4gPiBPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
