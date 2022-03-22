Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B27964E37D0
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 05:10:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 45DA824866;
	Tue, 22 Mar 2022 05:10:15 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id 781D62485E
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 05:10:13 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso1378371pjb.0
 for <openrisc@lists.librecores.org>; Mon, 21 Mar 2022 21:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YF27/o9OojcIlWSRXUYvT844QPtgp8LqnE9dm5viGDQ=;
 b=ln3p25fvXLz32myeqm5t0hBcUE6tyk/PEExo8WqpnsfcP5zlqpV1ll671d9e8ZulpU
 lqusXemHq030YWLjogGgWnDGnYL0cm48TsOkP3kJ+Ppu09gPxXQR6O8pCqHds+7TJITD
 NaQ9KpeM5/G3c23uTqF2SHe/SF/5rBIaZ2uoM3yqKWz8h8l8wxtagttGDbq3rwY3g6Jg
 NLL2W5/Gym4XWW5+xpEsUWRIEEcmIIGtidxZwXe/7LkHIP+huczI1wrWMfMVE/Nv+76a
 YEsWTOvlvfCbnrWOA+E7H/WtgT82LDtjHDHfDWlU0jOk3iLi0o77i7cXOLCn93Ww39Ln
 WzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YF27/o9OojcIlWSRXUYvT844QPtgp8LqnE9dm5viGDQ=;
 b=53pBK2vsUR7eOg8faUHU+P4vogBXoqgKIM48nHamoa91OhMBTa9VFolKpEmmU4PhrN
 nRREo5KK2L03a2CpgRDUD8rgg9xVsr7AYuOXIf3cQAywQ22Q2TWePgLSYeIjCndWEcfv
 +GC6NrZHa5re4ZVLLYCXLNWHjbOtUYddE3VBknBlriI2egZoWnrpyn66Iw4refLSlL3V
 nJIF3ccuVEshBBEqGOsSmSk4c4It0aYQWvYuQB5r0if6qdUvsA5eT2RczzhxVObEauSx
 vKtnHvEhmhtwgv+IAtl2Ws+BS4oqK4/6sW4Jdiv9OneEH9iC627/r5Oh6uAoQ/pd3Pei
 JfFA==
X-Gm-Message-State: AOAM533bbrzyri2DsNRD+Ej8gHykX2UcSquJhFIS0rrGlF95VfAB7BK3
 e0EtarzJIrPFSjTkclDVjy4=
X-Google-Smtp-Source: ABdhPJw8K6SJLgXLdJjpWrOAa7EmA/p3qAJ4MfsOv0WC5B8UWGhsRke1K9C1t22yXzXvRnFtjfyYXg==
X-Received: by 2002:a17:90b:1a8a:b0:1c5:f707:93a6 with SMTP id
 ng10-20020a17090b1a8a00b001c5f70793a6mr2699198pjb.110.1647922211988; 
 Mon, 21 Mar 2022 21:10:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 t71-20020a63784a000000b00380a9f7367asm16932561pgc.77.2022.03.21.21.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 21:10:10 -0700 (PDT)
Date: Tue, 22 Mar 2022 13:10:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Guo Ren <guoren@kernel.org>
Message-ID: <YjlMIGKgYaLLpp5T@antec>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-4-palmer@rivosinc.com>
 <YjjuOZMzQlnqfLDJ@antec>
 <CAJF2gTSFh0NKLys7kr=UdQWHDyYgg3XmgTJtVaL37Re7QdZ8uw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSFh0NKLys7kr=UdQWHDyYgg3XmgTJtVaL37Re7QdZ8uw@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH 3/5] openrisc: Move to ticket-spinlock
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-arch <linux-arch@vger.kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXIgMjIsIDIwMjIgYXQgMTE6Mjk6MTNBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIE1hciAyMiwgMjAyMiBhdCA3OjIzIEFNIFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE1hciAxNiwgMjAyMiBhdCAwNDoyNTo1
OFBNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+ID4gRnJvbTogUGV0ZXIgWmlqbHN0
cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4gPgo+ID4gPiBXZSBoYXZlIG5vIGluZGljYXRp
b25zIHRoYXQgb3BlbnJpc2MgbWVldHMgdGhlIHFzcGlubG9jayByZXF1aXJlbWVudHMsCj4gPiA+
IHNvIG1vdmUgdG8gdGlja2V0LXNwaW5sb2NrIGFzIHRoYXQgaXMgbW9yZSBsaWtleSB0byBiZSBj
b3JyZWN0Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+Cj4gPiA+IEkgaGF2ZSBzcGVjaWZp
Y2FsbHkgbm90IGluY2x1ZGVkIFBldGVyJ3MgU09CIG9uIHRoaXMsIGFzIGhlIHNlbnQgaGlzCj4g
PiA+IG9yaWdpbmFsIHBhdGNoCj4gPiA+IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1lI
YkJCdVZGTm5JNGtqajNAaGlyZXoucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC8+Cj4gPiA+IHdp
dGhvdXQgb25lLgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICB8IDEgLQo+ID4gPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9LYnVp
bGQgICAgICAgICAgIHwgNSArKy0tLQo+ID4gPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9z
cGlubG9jay5oICAgICAgIHwgMyArLS0KPiA+ID4gIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
c3BpbmxvY2tfdHlwZXMuaCB8IDIgKy0KPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IEhlbGxvLAo+ID4KPiA+IFRoaXMgc2VyaWVz
IGJyZWFrcyBTTVAgc3VwcG9ydCBvbiBPcGVuUklTQy4gIEkgaGF2ZW4ndCB0cmFjZWQgaXQgZG93
biB5ZXQsIGl0Cj4gPiBzZWVtcyB0cml2aWFsIGJ1dCBJIGhhdmUgYSBmZXcgcGxhY2VzIHRvIGNo
ZWNrLgo+ID4KPiA+IEkgcmVwbGllZCB0byB0aGlzIG9uIGEga2J1aWxkIHdhcm5pbmcgdGhyZWFk
LCBidXQgYWxzbyBnb2luZyB0byByZXBseSBoZXJlIHdpdGgKPiA+IG1vcmUgaW5mb3JtYXRpb24u
Cj4gPgo+ID4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWWplWTdDZmFGS2pyOElVY0Bh
bnRlYy8jUgo+ID4KPiA+IFNvIGZhciB0aGlzIGlzIHdoYXQgSSBzZWU6Cj4gPgo+ID4gICAqIHRp
Y2tldF9sb2NrIGlzIHN0dWNrIHRyeWluZyB0byBsb2NrIGNvbnNvbGVfc2VtCj4gPiAgICogaXQg
aXMgc3R1Y2sgb24gYXRvbWljX2NvbmRfcmVhZF9hY3F1aXJlCj4gPiAgICAgcmVhZGluZyBsb2Nr
IHZhbHVlOiByZXR1cm5zIDAgICAgKCpsb2NrIGlzIDB4MTAwMDApCj4gPiAgICAgdGlja2V0IHZh
bHVlOiBpcyAxCj4gPiAgICogcG9zc2libGUgaXNzdWVzOgo+ID4gICAgIC0gT3BlblJJU0MgaXMg
YmlnIGVuZGlhbiwgdGhhdCBzZWVtcyB0byBpbXBhY3QgdGlja2V0X3VubG9jaywgaXQgbG9va3MK
PiBBbGwgY3NreSAmIHJpc2N2IGFyZSBsaXR0bGUtZW5kaWFuLCBpdCBzZWVtcyB0aGUgc2VyaWVz
IGhhcyBhIGJ1ZyB3aXRoCj4gYmlnLWVuZGlhbi4gSXMgdGhhdCBhbGwgcmlnaHQgZm9yIHFlbXU/
IChJZiBxZW11IHdhcyBhbGwgcmlnaHQsIGJ1dAo+IHJlYWwgaGFyZHdhcmUgZmFpbGVkLikKCkhp
IEd1byBSZW4sCgpPcGVuUklTQyByZWFsIGhhcmR3YXJlIGFuZCBRRU1VIGFyZSBib3RoIGJpZy1l
bmRpYW4uICBJdCBmYWlscyBvbiBib3RoLgoKSSByZXBsaWVkIG9uIHBhdGNoIDEvNSB3aXRoIGEg
c3VnZ2VzdGVkIHBhdGNoIHdoaWNoIGZpeGVzIHRoZSBpc3N1ZSBmb3IgbWUuClBsZWFzZSBoYXZl
IGEgbG9vay4KCkJUVy4gbm93IEkgY2FuIGxvb2sgaW50byB0aGUgc3BhcnNlIHdhcm5pbmdzLgoK
LVN0YWZmb3JkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
