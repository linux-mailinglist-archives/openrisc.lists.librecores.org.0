Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 161765160C7
	for <lists+openrisc@lfdr.de>; Sun,  1 May 2022 00:36:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C0B7324130;
	Sun,  1 May 2022 00:36:32 +0200 (CEST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mail.librecores.org (Postfix) with ESMTPS id 07025213FD
 for <openrisc@lists.librecores.org>; Sun,  1 May 2022 00:36:31 +0200 (CEST)
Received: by mail-pj1-f43.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so13343072pjb.5
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vSsjcxY4/J413q1CK/LHbfCgeiHmsuLpMe8RS2dCiuo=;
 b=UekdpH4YTibTYVTUFPohxZrCX1QH3oxp9t9/P4i3SUH+HbSgFgllhuV+gKN/6f+UaJ
 tu0h11yOrnxAxDjPqN0pYMV6I9aFVFt6Z8W5IGuql0VainfP+fbsi+4mjO4x7znSaSLw
 gVB6yk2pfGMRZ/SVYhRyypDFJvZFgZShgvrHPo7xU8sg1/3vr2hE0gm8EkZCAFpXpyL+
 WNUI05oxr9Wf3rJhwpLaOnMkeXMRRQF4mpC84bb0t5Jc6LyNEGUcU7spLb0hmQfiDfWP
 +gnGS6mCBpvKPNklO8hFL9ZGXlT2+OJcS2ajWLYTjRKGvtFBvW9oZY2VZLEVbTfkMMr5
 +VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vSsjcxY4/J413q1CK/LHbfCgeiHmsuLpMe8RS2dCiuo=;
 b=o6Gow5+8MaP3GhcIawFifU5GWVPPCNW1tLbBfIa+H40q3bZSKAugmx4gCfJ6gbVfbr
 +SUn9wLODGFvdt77tC6dsbF+opLFPMth8XGhIG8SYV7ZYFYItxNAIk69CGBSOgpeHNaI
 LTK7tOmMhafjMcPzNqUcqmzR5jsu75H6GtlDlhLawZJZYAIUwIF+K0pV1zRpinjb+d3B
 o4soeTDKefEplQsNbp/rzZR3QNmo8FunWRAn8+klAB0q4nIXyChRbvoAoc4T8J2JWkdV
 NLufomLTuxN4xYCEJhCIR2WxxnHtwCo3zwaK0HjTZeFADMXZkSJoRVCJCV/fuzjQSw4w
 wFgw==
X-Gm-Message-State: AOAM530Oaoxwq6+wEOLw16wRTWP7AR6c+ih3m0a3XUx9bCdJRN/FVd7j
 J4PuTJGFxRB7t9krqXEXBdo=
X-Google-Smtp-Source: ABdhPJztogzbcZq5iRfuZtqvrc4NSpl2Xeg+NAS8yrSWtsooguSLnMBX8ilzE2be0jWAmzN/fhFlDw==
X-Received: by 2002:a17:902:f690:b0:15e:9825:291 with SMTP id
 l16-20020a170902f69000b0015e98250291mr1712407plg.89.1651358189490; 
 Sat, 30 Apr 2022 15:36:29 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a62e40d000000b0050dc76281bcsm1998777pfh.150.2022.04.30.15.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 15:36:28 -0700 (PDT)
Date: Sun, 1 May 2022 07:36:27 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <Ym2567zStHwlND35@antec>
References: <20220430122355.2718797-1-Jason@zx2c4.com>
 <20220430122433.2719029-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430122433.2719029-1-Jason@zx2c4.com>
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBBcHIgMzAsIDIwMjIgYXQgMDI6MjQ6MzNQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IEluIG9yZGVyIHRvIG1lYXN1cmUgdGhlIGJvb3QgcHJvY2VzcywgdGhlIHRp
bWVyIHNob3VsZCBiZSBzd2l0Y2hlZCBvbiBhcwo+IGVhcmx5IGluIGJvb3QgYXMgcG9zc2libGUu
IFRoaXMgaXMgbmVjZXNzYXJ5IHNvIHRoYXQgYnkgdGhlIHRpbWUgdGhlCj4gc2V0dXAgY29kZSBy
ZWFjaGVzIHJhbmRvbV9pbml0KCksIGdldF9jeWNsZXMoKSAoYnkgd2F5IG9mCj4gcmFuZG9tX2dl
dF9lbnRyb3B5KCkpIHJldHVybnMgbm9uLXplcm8sIGluZGljYXRpbmcgdGhhdCBpdCBpcyBhY3R1
YWxseQo+IGNhcGFibGUgb2YgY291bnRpbmcuIFNvIHRoaXMgY29tbWl0IGVuYWJsZXMgdGhlIHRp
bWVyIGltbWVkaWF0ZWx5IHVwb24KPiBib290aW5nIHVwLiBBcyB3ZWxsLCB0aGUgY29tbWl0IGRl
ZmluZSB0aGUgZ2V0X2N5Y2xlcyBtYWNybywgbGlrZSB0aGUKPiBwcmV2aW91cyBwYXRjaGVzIGlu
IHRoaXMgc2VyaWVzLCBzbyB0aGF0IGdlbmVyaWMgY29kZSBpcyBhd2FyZSB0aGF0IGl0J3MKPiBp
bXBsZW1lbnRlZCBieSB0aGUgcGxhdGZvcm0sIGFzIGlzIGRvbmUgb24gb3RoZXIgYXJjaHMuCj4g
Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IENjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUu
c2U+Cj4gQ2M6IFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFs
YWh0aS5maT4KPiBDYzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyB2Ny0+djg6Cj4gLSBSYXRoZXIgdGhhbiBkb2luZyBnZXRfY3ljbGVzKCkrMSB0byBoYW5k
bGUgdGhlIGVhcmx5IGJvb3QgY2FzZSwKPiAgIGFjdHVhbGx5IHN0YXJ0IHRoZSB0aW1lciBlYXJs
eSBpbiBib290LiBUaGlzIGhhcyB0aGUgaHVnZSBhZHZhbnRhZ2Ugb2YKPiAgIHByb3Blcmx5IG1l
YXN1cmluZyB0aGUgYm9vdCBzZXF1ZW5jZSB0aW1pbmcsIHdoaWNoIGNvdWxkIGJlIGEgdmFsdWFi
bGUKPiAgIHNvdXJjZSBvZiBlbnRyb3B5Lgo+IAo+ICBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3RpbWV4LmggfCAxICsKPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgIHwgNyAr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaCBiL2FyY2gvb3BlbnJpc2MvaW5j
bHVkZS9hc20vdGltZXguaAo+IGluZGV4IGQ1MmI0ZTUzNmUzZi4uNTQ4N2ZhOTNkZDliIDEwMDY0
NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaAo+ICsrKyBiL2FyY2gv
b3BlbnJpc2MvaW5jbHVkZS9hc20vdGltZXguaAo+IEBAIC0yMyw2ICsyMyw3IEBAIHN0YXRpYyBp
bmxpbmUgY3ljbGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQo+ICB7Cj4gIAlyZXR1cm4gbWZzcHIoU1BS
X1RUQ1IpOwo+ICB9Cj4gKyNkZWZpbmUgZ2V0X2N5Y2xlcyBnZXRfY3ljbGVzCj4gIAo+ICAvKiBU
aGlzIGlzbid0IHJlYWxseSB1c2VkIGFueSBtb3JlICovCj4gICNkZWZpbmUgQ0xPQ0tfVElDS19S
QVRFIDEwMDAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiBpbmRleCAwY2QwNGQ5MzZhN2EuLjFjYjdjMTc3
MGExNyAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gKysrIGIv
YXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+IEBAIC0yMjAsNiArMjIwLDEzIEBAIHZvaWQg
X19pbml0IHNldHVwX2NwdWluZm8odm9pZCkKPiAgCj4gIHZvaWQgX19pbml0IG9yMWtfZWFybHlf
c2V0dXAodm9pZCAqZmR0KQo+ICB7Cj4gKwkvKiBTdGFydCB0aGUgVFRDUiBhcyBlYXJseSBhcyBw
b3NzaWJsZSwgc28gdGhhdCB0aGUgUk5HIGNhbiBtYWtlIHVzZSBvZgo+ICsJICogbWVhc3VyZW1l
bnRzIG9mIGJvb3QgdGltZSBmcm9tIHRoZSBlYXJsaWVzdCBvcHBvcnR1bml0eS4gRXNwZWNpYWxs
eQo+ICsJICogaW1wb3J0YW50IGlzIHRoYXQgdGhlIFRUQ1IgZG9lcyBub3QgcmV0dXJuIHplcm8g
YnkgdGhlIHRpbWUgd2UgcmVhY2gKPiArCSAqIHJhbmRfaW5pdGlhbGl6ZSgpLgo+ICsJICovCj4g
KwltdHNwcihTUFJfVFRNUiwgU1BSX1RUTVJfQ1IpOwo+ICsKPiAgCWlmIChmZHQpCj4gIAkJcHJf
aW5mbygiRkRUIGF0ICVwXG4iLCBmZHQpOwo+ICAJZWxzZSB7CgpJdCBsb29rcyBsaWtlIHdlIGNy
b3NzIHBhdGhzIG9uIHRoaXMgb25lLgoKSSBjYW4ndCB0aGluayBvZiBhbnl0aGluZyBiZXR0ZXIu
ICBBbHNvLCBJIHRlc3RlZCB0aGlzIG9uIFNNUCBzeXN0ZW1zIGFuZCBpdAp3b3JrcyBmaW5lLgoK
QWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
