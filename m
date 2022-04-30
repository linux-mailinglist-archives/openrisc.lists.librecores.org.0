Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6F25160CB
	for <lists+openrisc@lfdr.de>; Sun,  1 May 2022 00:37:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 01C9B24811;
	Sun,  1 May 2022 00:37:32 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 4AED320CE9
 for <openrisc@lists.librecores.org>; Sun,  1 May 2022 00:37:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 919F8B80B13
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 22:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227E7C385AA
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 22:37:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NDp4rIz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651358245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+iDoApNmZrBzOkGGRMF45E5XlCq10GMqaSSRUq7xoY=;
 b=NDp4rIz1aJ6W3pKPhtbH7uZHeUlBqacS/FwdHa/UcS3yB5axymjs5llq+Lctq92FVIqAdz
 9+ug3PlUJCyLLNefwB7YVA14nmkgeZZU/FhqWDCf5dDcxW9PGQye4Dz7n0NFTeEnmVVGLu
 gxkrFTjCVxAoTjennIuUe2NN7LOpg5Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 577ce342
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <openrisc@lists.librecores.org>;
 Sat, 30 Apr 2022 22:37:25 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f863469afbso93423717b3.0
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 15:37:25 -0700 (PDT)
X-Gm-Message-State: AOAM533orEAKE6F92LBjW09KBLXViuQU6NxE2EkdyEV70xBfJhwAUAts
 rUZIxf9KoqbqSRRpBh07+KA9FfyEAUmC31vv6Yo=
X-Google-Smtp-Source: ABdhPJxYU0UY9+GbGujV1hleABZ56tELHgGQKt7bK1UNe/8NSCWuVTYsay879Flpt7wuESIHe7mw7VD2paMNb7OwCIw=
X-Received: by 2002:a81:86c7:0:b0:2f7:bc6a:964c with SMTP id
 w190-20020a8186c7000000b002f7bc6a964cmr5587305ywf.485.1651358244216; Sat, 30
 Apr 2022 15:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220430122355.2718797-1-Jason@zx2c4.com>
 <20220430122433.2719029-1-Jason@zx2c4.com> <Ym2567zStHwlND35@antec>
In-Reply-To: <Ym2567zStHwlND35@antec>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 1 May 2022 00:37:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9r-=ShRomP=Nrcz-GjP4kv4e9wKHvNdAMiRui7_FSbH-A@mail.gmail.com>
Message-ID: <CAHmME9r-=ShRomP=Nrcz-GjP4kv4e9wKHvNdAMiRui7_FSbH-A@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v8 06/19] openrisc: start CPU timer early in
 boot
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
Cc: openrisc@lists.librecores.org, LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMSwgMjAyMiBhdCAxMjozNiBBTSBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEFwciAzMCwgMjAyMiBhdCAwMjoyNDozM1BNICsw
MjAwLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gPiBJbiBvcmRlciB0byBtZWFzdXJlIHRo
ZSBib290IHByb2Nlc3MsIHRoZSB0aW1lciBzaG91bGQgYmUgc3dpdGNoZWQgb24gYXMKPiA+IGVh
cmx5IGluIGJvb3QgYXMgcG9zc2libGUuIFRoaXMgaXMgbmVjZXNzYXJ5IHNvIHRoYXQgYnkgdGhl
IHRpbWUgdGhlCj4gPiBzZXR1cCBjb2RlIHJlYWNoZXMgcmFuZG9tX2luaXQoKSwgZ2V0X2N5Y2xl
cygpIChieSB3YXkgb2YKPiA+IHJhbmRvbV9nZXRfZW50cm9weSgpKSByZXR1cm5zIG5vbi16ZXJv
LCBpbmRpY2F0aW5nIHRoYXQgaXQgaXMgYWN0dWFsbHkKPiA+IGNhcGFibGUgb2YgY291bnRpbmcu
IFNvIHRoaXMgY29tbWl0IGVuYWJsZXMgdGhlIHRpbWVyIGltbWVkaWF0ZWx5IHVwb24KPiA+IGJv
b3RpbmcgdXAuIEFzIHdlbGwsIHRoZSBjb21taXQgZGVmaW5lIHRoZSBnZXRfY3ljbGVzIG1hY3Jv
LCBsaWtlIHRoZQo+ID4gcHJldmlvdXMgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcywgc28gdGhhdCBn
ZW5lcmljIGNvZGUgaXMgYXdhcmUgdGhhdCBpdCdzCj4gPiBpbXBsZW1lbnRlZCBieSB0aGUgcGxh
dGZvcm0sIGFzIGlzIGRvbmUgb24gb3RoZXIgYXJjaHMuCj4gPgo+ID4gQ2M6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+ID4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gPiBDYzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+ID4gQ2M6IFN0
ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiA+
IENjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2Vz
IHY3LT52ODoKPiA+IC0gUmF0aGVyIHRoYW4gZG9pbmcgZ2V0X2N5Y2xlcygpKzEgdG8gaGFuZGxl
IHRoZSBlYXJseSBib290IGNhc2UsCj4gPiAgIGFjdHVhbGx5IHN0YXJ0IHRoZSB0aW1lciBlYXJs
eSBpbiBib290LiBUaGlzIGhhcyB0aGUgaHVnZSBhZHZhbnRhZ2Ugb2YKPiA+ICAgcHJvcGVybHkg
bWVhc3VyaW5nIHRoZSBib290IHNlcXVlbmNlIHRpbWluZywgd2hpY2ggY291bGQgYmUgYSB2YWx1
YWJsZQo+ID4gICBzb3VyY2Ugb2YgZW50cm9weS4KPiA+Cj4gPiAgYXJjaC9vcGVucmlzYy9pbmNs
dWRlL2FzbS90aW1leC5oIHwgMSArCj4gPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAg
ICAgIHwgNyArKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS90aW1leC5oIGIvYXJj
aC9vcGVucmlzYy9pbmNsdWRlL2FzbS90aW1leC5oCj4gPiBpbmRleCBkNTJiNGU1MzZlM2YuLjU0
ODdmYTkzZGQ5YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGlt
ZXguaAo+ID4gKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS90aW1leC5oCj4gPiBAQCAt
MjMsNiArMjMsNyBAQCBzdGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXModm9pZCkKPiA+
ICB7Cj4gPiAgICAgICByZXR1cm4gbWZzcHIoU1BSX1RUQ1IpOwo+ID4gIH0KPiA+ICsjZGVmaW5l
IGdldF9jeWNsZXMgZ2V0X2N5Y2xlcwo+ID4KPiA+ICAvKiBUaGlzIGlzbid0IHJlYWxseSB1c2Vk
IGFueSBtb3JlICovCj4gPiAgI2RlZmluZSBDTE9DS19USUNLX1JBVEUgMTAwMAo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5l
bC9zZXR1cC5jCj4gPiBpbmRleCAwY2QwNGQ5MzZhN2EuLjFjYjdjMTc3MGExNyAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiA+ICsrKyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmMKPiA+IEBAIC0yMjAsNiArMjIwLDEzIEBAIHZvaWQgX19pbml0IHNl
dHVwX2NwdWluZm8odm9pZCkKPiA+Cj4gPiAgdm9pZCBfX2luaXQgb3Ixa19lYXJseV9zZXR1cCh2
b2lkICpmZHQpCj4gPiAgewo+ID4gKyAgICAgLyogU3RhcnQgdGhlIFRUQ1IgYXMgZWFybHkgYXMg
cG9zc2libGUsIHNvIHRoYXQgdGhlIFJORyBjYW4gbWFrZSB1c2Ugb2YKPiA+ICsgICAgICAqIG1l
YXN1cmVtZW50cyBvZiBib290IHRpbWUgZnJvbSB0aGUgZWFybGllc3Qgb3Bwb3J0dW5pdHkuIEVz
cGVjaWFsbHkKPiA+ICsgICAgICAqIGltcG9ydGFudCBpcyB0aGF0IHRoZSBUVENSIGRvZXMgbm90
IHJldHVybiB6ZXJvIGJ5IHRoZSB0aW1lIHdlIHJlYWNoCj4gPiArICAgICAgKiByYW5kX2luaXRp
YWxpemUoKS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgbXRzcHIoU1BSX1RUTVIsIFNQUl9UVE1S
X0NSKTsKPiA+ICsKPiA+ICAgICAgIGlmIChmZHQpCj4gPiAgICAgICAgICAgICAgIHByX2luZm8o
IkZEVCBhdCAlcFxuIiwgZmR0KTsKPiA+ICAgICAgIGVsc2Ugewo+Cj4gSXQgbG9va3MgbGlrZSB3
ZSBjcm9zcyBwYXRocyBvbiB0aGlzIG9uZS4KPgo+IEkgY2FuJ3QgdGhpbmsgb2YgYW55dGhpbmcg
YmV0dGVyLiAgQWxzbywgSSB0ZXN0ZWQgdGhpcyBvbiBTTVAgc3lzdGVtcyBhbmQgaXQKPiB3b3Jr
cyBmaW5lLgo+Cj4gQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoK
T2ggb2theS4gRG8geW91IHdhbnQgbWUgdG8gZ28gd2l0aCB0aGlzIG9yIHdpdGggdGhlIGFzc2Vt
Ymx5IG9uZT8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
