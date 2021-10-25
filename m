Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 784B2439AB4
	for <lists+openrisc@lfdr.de>; Mon, 25 Oct 2021 17:44:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 176A324226;
	Mon, 25 Oct 2021 17:44:48 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 84560211B2
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 17:44:46 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6240061078
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635176684;
 bh=t/cG3NYZufoQXI80MvoVKxbOhh2gfbNI54UCGBT3C9s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gxmadbL12O9CP1CNjr+LPFEaW4SzKdMH7wBlnUxy2TzbQ9gtUNV7DEu1WSahSAdvL
 u/BXtC5jblBxPTnpfFqJLIzEtCppyKyls5mNlnSUYhZum9GY/TH9dg/+vSn7xHICbC
 GLEZE6+WCHun6enc8dfKsjr2kBQWjDquNQv9BmuqxtjICcILdqOVO5TSfQnsQr7pUo
 9mokyel9t8DVcl3p+kpJ5J3zE1W6ObHH5vLJl7Mp+ES8XFxHce3uPgJ/Mf77S+X4Hm
 jYNewKS1aqWHMc6o18eqCgLn8SvSOXBCAmZWVHf49oAPQY46Q6rUNL5PhVtyNchEfn
 6muiFFPGVzArQ==
Received: by mail-wm1-f54.google.com with SMTP id
 71-20020a1c014a000000b0032cafd23b1dso391619wmb.4
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 08:44:44 -0700 (PDT)
X-Gm-Message-State: AOAM5309RQfaxSVKIZWOotr6hXDavu6VmVj7BAiMXvwvYlfieWjK7USS
 ydhq5IZn9vrxiCs7jl916O63FtmkrvT5Bf0K9t4=
X-Google-Smtp-Source: ABdhPJwVwah/t3YoUqrQSaMsXvLvLT7cunG21zPbQEpZN6hLw+z/xKNabDoDNkoQgi86rA+/qLopU3mOKvl8de4bOgo=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr7749701wmj.98.1635176682689; 
 Mon, 25 Oct 2021 08:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
 <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
In-Reply-To: <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Oct 2021 17:44:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
Message-ID: <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [OpenRISC] [PATCH] locking: remove spin_lock_flags() etc
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBPY3QgMjUsIDIwMjEgYXQgNToyOCBQTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRo
YXQuY29tPiB3cm90ZToKPiBPbiAxMC8yNS8yMSA5OjA2IEFNLCBBcm5kIEJlcmdtYW5uIHdyb3Rl
Ogo+ID4KPiA+IE9uIHMzOTAsIHdlIHBpY2sgYmV0d2VlbiB0aGUgY21weGNoZygpIGJhc2VkIGRp
cmVjdGVkLXlpZWxkIHdoZW4KPiA+IHJ1bm5pbmcgb24gdmlydHVhbGl6ZWQgQ1BVcywgYW5kIGEg
bm9ybWFsIHFzcGlubG9jayB3aGVuIHJ1bm5pbmcgb24gYQo+ID4gZGVkaWNhdGVkIENQVS4KPgo+
IEkgYW0gbm90IGF3YXJlIHRoYXQgczM5MCBpcyB1c2luZyBxc3BpbmxvY2tzIGF0IGFsbCBhcyBJ
IGRvbid0IHNlZQo+IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1MgYmVpbmcgc2V0IGFueXdoZXJl
IHVuZGVyIGFyY2gvczM5MC4gSSBvbmx5IHNlZQo+IHRoYXQgaXQgdXNlcyBhIGNtcHhjaGcgYmFz
ZWQgc3BpbmxvY2suCgpTb3JyeSwgSSBzaG91bGQgbm90IGhhdmUgc2FpZCAibm9ybWFsIiBoZXJl
LiBTZWUgYXJjaC9zMzkwL2xpYi9zcGlubG9jay5jCmZvciB0aGVpciBjdXN0b20gcXVldWVkIHNw
aW5sb2NrcyBhcyBpbXBsZW1lbnRlZCBpbiBhcmNoX3NwaW5fbG9ja19xdWV1ZWQoKS4KSSBkb24n
dCBrbm93IGlmIHRoYXQgY29kZSBhY3R1YWxseSBkb2VzIHRoZSBzYW1lIHRoaW5nIGFzIHRoZSBn
ZW5lcmljIHFzcGlubG9jaywKYnV0IGl0IHNlZW1zIGF0IGxlYXN0IHNpbWlsYXIuCgogICAgICAg
QXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
