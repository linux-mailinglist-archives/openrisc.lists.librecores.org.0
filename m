Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA804DE826
	for <lists+openrisc@lfdr.de>; Sat, 19 Mar 2022 14:26:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2A95524806;
	Sat, 19 Mar 2022 14:26:46 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 26B92242D4
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 14:26:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA819B801BD
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 13:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D91BC340F0
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647696403;
 bh=/cegirEsmDFTjrf/jcxsGyePYHoVLLLJoW1NFjz4T5Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UmxrhwNaCnUWbJzDElDW7iWolt4CGGYJhefwhRmFTmzo2j87XTi4xTuJVs36kD5JG
 69RQ0mQCebSeuQ4AhaJApoX6VwElGf7V4BC8rfUkwWuvgpiaaPa3jGb3o+snOuTb2k
 NOW79cQNRqST7BAGRYUWAORXaDzvmSAg2B6w248PC3R6nvaui/SHW8FJ2hedBRDgYo
 coYR2xN+VaEyBa5EG9Wai4ohwlKADQhwfahLv5/R367rf9RlJFSK9pU+2Fz8mcgQcd
 RVyhLuTavC+pBjRe+rn71qGpXmglQXXvufsvxt9fTW+IlNYvFfJGdI4qYf+k3jbdu9
 86UD75gQwZlKg==
Received: by mail-vk1-f170.google.com with SMTP id x125so44340vkb.7
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 06:26:43 -0700 (PDT)
X-Gm-Message-State: AOAM532FxdIalwvecRtwwzsCk+cArjgdAdMrdK2ir2y325DmmDomltv4
 lpk5HXvVeUGNVW121BDWhU5OU9O1gt/rHD56H0A=
X-Google-Smtp-Source: ABdhPJxG6qrxPivDMuPuCDhlEL9zUSIkjTquHlcXEinKt2wIvI4so3PHrSQEnmjVSdhEdSsEmEbGCrUxLkOxGgBZ5z8=
X-Received: by 2002:a1f:7f17:0:b0:336:cede:7f97 with SMTP id
 o23-20020a1f7f17000000b00336cede7f97mr5353580vki.8.1647696402468; Sat, 19 Mar
 2022 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
 <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
In-Reply-To: <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 19 Mar 2022 21:26:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRvOLZPP_PYOEPMkr0S3vTSiPZOCFOmiVRXxi2QRu-vMA@mail.gmail.com>
Message-ID: <CAJF2gTRvOLZPP_PYOEPMkr0S3vTSiPZOCFOmiVRXxi2QRu-vMA@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBNYXIgMTksIDIwMjIgYXQgNzo1MiBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFNhdCwgTWFyIDE5LCAyMDIyIGF0IDQ6NTQgQU0gPGd1b3JlbkBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ICAvKgo+ID4gLSAqIFlvdSBuZWVkIHRvIGltcGxlbWVudCBh
c20vc3BpbmxvY2suaCBmb3IgU01QIHN1cHBvcnQuIFRoZSBnZW5lcmljCj4gPiAtICogdmVyc2lv
biBkb2VzIG5vdCBoYW5kbGUgU01QLgo+ID4gKyAqIFVzaW5nIHRpY2tldC1zcGlubG9jay5oIGFz
IGdlbmVyaWMgZm9yIFNNUCBzdXBwb3J0Lgo+ID4gICAqLwo+ID4gICNpZmRlZiBDT05GSUdfU01Q
Cj4gPiAtI2Vycm9yIG5lZWQgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGFzbS9zcGlubG9jay5o
Cj4gPiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL3RpY2tldC1sb2NrLmg+Cj4gPiArI2lmZGVmIENP
TkZJR19RVUVVRURfUldMT0NLUwo+ID4gKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9xcndsb2NrLmg+
Cj4gPiArI2Vsc2UKPiA+ICsjZXJyb3IgUGxlYXNlIHNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldM
T0NLUyBpbiBhcmNoaXRlY3R1cmUgS2NvbmZpZwo+ID4gKyNlbmRpZgo+ID4gICNlbmRpZgo+Cj4g
VGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlICFDT05GSUdfU01QIGNhc2UsIGFzIGFzbS9zcGlubG9j
ay5oIG9ubHkgZXZlcgo+IGdldHMgaW5jbHVkZWQgZm9yIFNNUCBidWlsZHMgaW4gdGhlIGZpcnN0
IHBsYWNlLiBUaGlzIHdhcyBhbHJlYWR5IGEgbWlzdGFrZQo+IGluIHRoZSBleGlzdGluZyBjb2Rl
LCBidXQgeW91ciBjaGFuZ2Ugd291bGQgYmUgdGhlIHRpbWUgdG8gZml4IGl0Lgo+Cj4gSSB3b3Vs
ZCBhbHNvIGRyb3AgdGhlICFDT05GSUdfUVVFVUVEX1JXTE9DS1MgY2FzZSwganVzdCBpbmNsdWRl
Cj4gaXQgdW5jb25kaXRpb25hbGx5LiBJZiBhbnkgYXJjaGl0ZWN0dXJlIHdhbnRzIHRoZSB0aWNr
ZXQgc3BpbmxvY2sgaW4KPiBjb21iaW5hdGlvbiB3aXRoIGEgY3VzdG9tIHJ3bG9jaywgdGhleSBj
YW4gc2ltcGx5IGluY2x1ZGUgdGhlCj4gYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaCBmcm9tIHRo
ZWlyIGFzbS9zcGlubG9jay5oLCBidXQgbW9yZQo+IGxpa2VseSBhbnkgYXJjaGl0ZWN0dXJlIHRo
YXQgY2FuIHVzZSB0aGUgdGlja2V0IHNwaW5sb2NrIHdpbGwgYWxzbwo+IHdhbnQgdGhlIHFyd2xv
Y2sgYW55d2F5LgpJIGFncmVlLCAhQ09ORklHX1NNUCAmICFDT05GSUdfUVVFVUVEX1JXTE9DS1Mg
YXJlIHVubmVjZXNzYXJ5LgoKQFBhbG1lciwgeW91IGNvdWxkIHBpY2sgYmFjayB0aGUgc2VyaWVz
LCB0aHguCgo+Cj4gICAgICBBcm5kCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
