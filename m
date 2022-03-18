Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 605624DD652
	for <lists+openrisc@lfdr.de>; Fri, 18 Mar 2022 09:40:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1C0C6247DC;
	Fri, 18 Mar 2022 09:40:34 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id ABC7024237
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 09:40:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2ECA461A8B
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 08:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909DCC36AE2
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647592830;
 bh=iUr5tRvZTo9rXrhUfHmBDsVjXAUzfQvdrJ4GOirMD1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NKX3SMHtB+o8znU/U2KTE369qFnc8hXvVsOukLKqhwmETmkyjpUMSdrLeFv1xNn5T
 MJyJTjAckKX4mKT6/mtDwr9pYbdnc45y8ZNx3Dj3mleoMjB1yGVBx0EYNhpPnsUf2v
 3zXX1EklCxZTKWVyMKQh+verzBUIX40X5errq26vokUMTonsuiXmsRMIovokF6ph9U
 iR+iVF6nab3JbFln6eZYgbeZVdLXTWM1VRCBH5Ek+cz3ZmE34EcjEwOcsYeAp524cO
 QFOPXbBldio8bBwJyc+oP0i0sCY8H7FE2TmOSfw1OXmyjL/Qwg51p6EjEh1RW5O3i5
 FvzQRJ1LQv1Uw==
Received: by mail-vs1-f49.google.com with SMTP id g21so8035785vsp.6
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 01:40:30 -0700 (PDT)
X-Gm-Message-State: AOAM53021jEgYHc6MJT11bgZn0jd641RHbSWxPLoaEv+1O9sOia1tqf6
 +xUupT/Vih5fFzE2K2T7OAhZPfdQvbdWiPfF46g=
X-Google-Smtp-Source: ABdhPJyKftDFP/Db0LP/WpQBiK7L2dYAjVWhbklLPdx+VCrE7mm4BHhLc/G2CUjhluQs1dFX90+mXlVVyzM9CXgkfOk=
X-Received: by 2002:a05:6102:311b:b0:324:e48a:75bc with SMTP id
 e27-20020a056102311b00b00324e48a75bcmr265902vsh.2.1647592829461; Fri, 18 Mar
 2022 01:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 18 Mar 2022 16:40:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQdhnxJ3gaJDCnd7-boz83GMxaW7tTNaA9hSHs92L_Zig@mail.gmail.com>
Message-ID: <CAJF2gTQdhnxJ3gaJDCnd7-boz83GMxaW7tTNaA9hSHs92L_Zig@mail.gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [OpenRISC] [PATCH 0/5] Generic Ticket Spinlocks
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
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgUGFsbWVyLAoKVGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCkNvdWxk
IGhlbHAgaW52b2x2ZSB0aGUgYmVsb3cgcGF0Y2ggaW4geW91ciBzZXJpZXM/CgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1hcmNoLzIwMjIwMzE4MDgzNDIxLjIwNjIyNTktMS1ndW9yZW5A
a2VybmVsLm9yZy9ULyN1CgpPbiBUaHUsIE1hciAxNywgMjAyMiBhdCAxOjE0IFBNIFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFBldGVyIHNlbnQgYW4gUkZD
IG91dCBhYm91dCBhIHllYXIgYWdvCj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWUhi
QkJ1VkZObkk0a2pqM0BoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0Lz4sCj4gYnV0IGFm
dGVyIGEgc3Bpcml0ZWQgZGlzY3Vzc2lvbiBpdCBsb29rcyBsaWtlIHdlIGxvc3QgdHJhY2sgb2Yg
dGhpbmdzLgo+IElJUkMgdGhlcmUgd2FzIGJyb2FkIGNvbnNlbnN1cyBvbiB0aGlzIGJlaW5nIHRo
ZSB3YXkgdG8gZ28sIGJ1dCB0aGVyZQo+IHdhcyBhIGxvdCBvZiBkaXNjdXNzaW9uIHNvIEkgd2Fz
bid0IHN1cmUuICBHaXZlbiB0aGF0IGl0J3MgYmVlbiBhIHllYXIsCj4gSSBmaWd1cmVkIGl0J2Qg
YmUgYmVzdCB0byBqdXN0IHNlbmQgdGhpcyBvdXQgYWdhaW4gZm9ybWF0dGVkIGEgYml0IG1vcmUK
PiBleHBsaWNpdGx5IGFzIGEgcGF0Y2guCj4KPiBUaGlzIGhhcyBoYWQgYWxtb3N0IG5vIHRlc3Rp
bmcgKGp1c3QgYSBidWlsZCB0ZXN0IG9uIFJJU0MtViBkZWZjb25maWcpLAo+IGJ1dCBJIHdhbnRl
ZCB0byBzZW5kIGl0IG91dCBsYXJnZWx5IGFzLWlzIGJlY2F1c2UgSSBkaWRuJ3QgaGF2ZSBhIFNP
Qgo+IGZyb20gUGV0ZXIgb24gdGhlIGNvZGUuICBJIGhhZCBzZW50IGFyb3VuZCBzb21ldGhpbmcg
c29ydCBvZiBzaW1pbGFyIGluCj4gc3Bpcml0LCBidXQgdGhpcyBsb29rcyBjb21wbGV0ZWx5IHJl
LXdyaXR0ZW4uICBKdXN0IHRvIHBsYXkgaXQgc2FmZSBJCj4gd2FudGVkIHRvIHNlbmQgb3V0IGFs
bW9zdCBleGFjdGx5IGFzIGl0IHdhcyBwb3N0ZWQuICBJJ2QgcHJvYmFibHkgcmVuYW1lCj4gdGhp
cyB0c3BpbmxvY2sgYW5kIHRzcGlubG9ja190eXBlcywgYXMgdGhlIG1pcy1tYXRjaCBraW5kIG9m
IG1ha2VzIG15Cj4gZXllcyBnbyBmdW5ueSwgYnV0IEkgZG9uJ3QgcmVhbGx5IGNhcmUgdGhhdCBt
dWNoLiAgSSdsbCBhbHNvIGdvIHRocm91Z2gKPiB0aGUgb3RoZXIgcG9ydHMgYW5kIHNlZSBpZiB0
aGVyZSdzIGFueSBtb3JlIGNhbmRpZGF0ZXMsIEkgc2VlbSB0bwo+IHJlbWVtYmVyIHRoZXJlIGhh
dmluZyBiZWVuIG1vcmUgdGhhbiBqdXN0IE9wZW5SSVNDIGJ1dCBpdCdzIGJlZW4gYQo+IHdoaWxl
Lgo+Cj4gSSdtIGluIG5vIGJpZyBydXNoIGZvciB0aGlzIGFuZCBnaXZlbiB0aGUgY29tcGxleCBI
VyBkZXBlbmRlbmNpZXMgSQo+IHRoaW5rIGl0J3MgYmVzdCB0byB0YXJnZXQgaXQgZm9yIDUuMTks
IHRoYXQnZCBnaXZlIHVzIGEgZnVsbCBtZXJnZQo+IHdpbmRvdyBmb3IgZm9sa3MgdG8gdGVzdC9i
ZW5jaG1hcmsgaXQgb24gdGhlaXIgc3lzdGVtcyB0byBtYWtlIHN1cmUgaXQncwo+IE9LLiAgUklT
Qy1WIGhhcyBhIGZvcndhcmQgcHJvZ3Jlc3MgZ3VhcmFudGVlIHNvIHdlIHNob3VsZCBiZSBzYWZl
LCBidXQKPiB0aGVzZSBjYW4gYWx3YXlzIHRyaXAgdGhpbmdzIHVwLgoKCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
