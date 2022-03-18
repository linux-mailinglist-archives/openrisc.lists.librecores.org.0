Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E3C914DD52F
	for <lists+openrisc@lfdr.de>; Fri, 18 Mar 2022 08:24:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9CDA1242C0;
	Fri, 18 Mar 2022 08:24:45 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 5438E20D4A
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 08:24:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1484061952
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 07:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1792C340F7
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647588280;
 bh=BfoKZy6B91Hiu61I3JtTMYU0kjXTJYatxUR/A7w6QKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jv4I9aWN18i+RpqiME4Tu16flA6GoS6NLvmm/rNpSUqgBduuIeqZ2+pWXdTdYDwuI
 MMFgDm88yex0Z8yQM2j7KzSgDND1ghEGYNcrMVnJlJn09bXbYqMBTxOgCsgraYwoUO
 FDJI/2gyqslJ4kbaPmHeBXwwMyUnXWnM2+/jZa9TV6ClUSPE+gwvvvcrVkmNU+JO3Z
 JMJbkYS3nWEK6D1Ekc/6TnAa/B8yGusd/JCQLi7xmixU0Mmy7N6PMHmNUrloD+jfmf
 IbkiUGYs02aiK9trOw5xilOKxsf3seeCPa9WDFB6my5qrI2dY3X4bjuEinemMCR1sz
 hOHWkId8ryfxg==
Received: by mail-ua1-f45.google.com with SMTP id x19so2949629uaf.1
 for <openrisc@lists.librecores.org>; Fri, 18 Mar 2022 00:24:40 -0700 (PDT)
X-Gm-Message-State: AOAM532Qhd025dN2gELTXmRxSCHTprkXHIIbuY5XDX0YtUqQtaykP9SK
 Fkofbu6sRjRB187CTFhsN104NcITnxgomZRnGzk=
X-Google-Smtp-Source: ABdhPJxZF9Z+ZVoAdhpq0HZjK1nqC+y82LR7GvGRglz1nfW3jIhfJECm+nlETFHFF9JTp4BwdsUYrSjxCtoHTQhykoQ=
X-Received: by 2002:ab0:26d9:0:b0:34c:609d:c23 with SMTP id
 b25-20020ab026d9000000b0034c609d0c23mr2889947uap.84.1647588279723; Fri, 18
 Mar 2022 00:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <11364105.8ZH9dyz9j6@diego>
In-Reply-To: <11364105.8ZH9dyz9j6@diego>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 18 Mar 2022 15:24:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS3C_GHvLnrep_V3pz4bUOBMO-Tc5v5BpEt7V1EQxF0jw@mail.gmail.com>
Message-ID: <CAJF2gTS3C_GHvLnrep_V3pz4bUOBMO-Tc5v5BpEt7V1EQxF0jw@mail.gmail.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCk9uIFRodSwgTWFyIDE3LCAy
MDIyIGF0IDg6NTggUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4K
PiBIaSwKPgo+IEFtIERvbm5lcnN0YWcsIDE3LiBNw6RyeiAyMDIyLCAwMDoyNTo1NSBDRVQgc2No
cmllYiBQYWxtZXIgRGFiYmVsdDoKPiA+IFBldGVyIHNlbnQgYW4gUkZDIG91dCBhYm91dCBhIHll
YXIgYWdvCj4gPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramoz
QGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvPiwKPiA+IGJ1dCBhZnRlciBhIHNwaXJp
dGVkIGRpc2N1c3Npb24gaXQgbG9va3MgbGlrZSB3ZSBsb3N0IHRyYWNrIG9mIHRoaW5ncy4KPiA+
IElJUkMgdGhlcmUgd2FzIGJyb2FkIGNvbnNlbnN1cyBvbiB0aGlzIGJlaW5nIHRoZSB3YXkgdG8g
Z28sIGJ1dCB0aGVyZQo+ID4gd2FzIGEgbG90IG9mIGRpc2N1c3Npb24gc28gSSB3YXNuJ3Qgc3Vy
ZS4gIEdpdmVuIHRoYXQgaXQncyBiZWVuIGEgeWVhciwKPiA+IEkgZmlndXJlZCBpdCdkIGJlIGJl
c3QgdG8ganVzdCBzZW5kIHRoaXMgb3V0IGFnYWluIGZvcm1hdHRlZCBhIGJpdCBtb3JlCj4gPiBl
eHBsaWNpdGx5IGFzIGEgcGF0Y2guCj4gPgo+ID4gVGhpcyBoYXMgaGFkIGFsbW9zdCBubyB0ZXN0
aW5nIChqdXN0IGEgYnVpbGQgdGVzdCBvbiBSSVNDLVYgZGVmY29uZmlnKSwKPiA+IGJ1dCBJIHdh
bnRlZCB0byBzZW5kIGl0IG91dCBsYXJnZWx5IGFzLWlzIGJlY2F1c2UgSSBkaWRuJ3QgaGF2ZSBh
IFNPQgo+ID4gZnJvbSBQZXRlciBvbiB0aGUgY29kZS4gIEkgaGFkIHNlbnQgYXJvdW5kIHNvbWV0
aGluZyBzb3J0IG9mIHNpbWlsYXIgaW4KPiA+IHNwaXJpdCwgYnV0IHRoaXMgbG9va3MgY29tcGxl
dGVseSByZS13cml0dGVuLiAgSnVzdCB0byBwbGF5IGl0IHNhZmUgSQo+ID4gd2FudGVkIHRvIHNl
bmQgb3V0IGFsbW9zdCBleGFjdGx5IGFzIGl0IHdhcyBwb3N0ZWQuICBJJ2QgcHJvYmFibHkgcmVu
YW1lCj4gPiB0aGlzIHRzcGlubG9jayBhbmQgdHNwaW5sb2NrX3R5cGVzLCBhcyB0aGUgbWlzLW1h
dGNoIGtpbmQgb2YgbWFrZXMgbXkKPiA+IGV5ZXMgZ28gZnVubnksIGJ1dCBJIGRvbid0IHJlYWxs
eSBjYXJlIHRoYXQgbXVjaC4gIEknbGwgYWxzbyBnbyB0aHJvdWdoCj4gPiB0aGUgb3RoZXIgcG9y
dHMgYW5kIHNlZSBpZiB0aGVyZSdzIGFueSBtb3JlIGNhbmRpZGF0ZXMsIEkgc2VlbSB0bwo+ID4g
cmVtZW1iZXIgdGhlcmUgaGF2aW5nIGJlZW4gbW9yZSB0aGFuIGp1c3QgT3BlblJJU0MgYnV0IGl0
J3MgYmVlbiBhCj4gPiB3aGlsZS4KPiA+Cj4gPiBJJ20gaW4gbm8gYmlnIHJ1c2ggZm9yIHRoaXMg
YW5kIGdpdmVuIHRoZSBjb21wbGV4IEhXIGRlcGVuZGVuY2llcyBJCj4gPiB0aGluayBpdCdzIGJl
c3QgdG8gdGFyZ2V0IGl0IGZvciA1LjE5LCB0aGF0J2QgZ2l2ZSB1cyBhIGZ1bGwgbWVyZ2UKPiA+
IHdpbmRvdyBmb3IgZm9sa3MgdG8gdGVzdC9iZW5jaG1hcmsgaXQgb24gdGhlaXIgc3lzdGVtcyB0
byBtYWtlIHN1cmUgaXQncwo+ID4gT0suICBSSVNDLVYgaGFzIGEgZm9yd2FyZCBwcm9ncmVzcyBn
dWFyYW50ZWUgc28gd2Ugc2hvdWxkIGJlIHNhZmUsIGJ1dAo+ID4gdGhlc2UgY2FuIGFsd2F5cyB0
cmlwIHRoaW5ncyB1cC4KPgo+IEkndmUgdGVzdGVkIHRoaXMgb24gYm90aCB0aGUgUWVtdS1WaXJ0
IG1hY2hpbmUgYXMgd2VsbCBhcyB0aGUKPiBBbGx3aW5uZXIgTmV6aGEgYm9hcmQgKHdpdGggYSBE
MSBTb0MpLgo+Cj4gQm90aCBvZiB0aG9zZSBhcmUgb2YgY291cnNlIG5vdCBuZWNlc3NhcmlseSB0
aGUgYmVzdCBwbGF0Zm9ybXMKPiBmb3IgYmVuY2htYXJrcyBJIGd1ZXNzLCBhcyBmcm9tIHdoYXQg
SSBnYXRoZXJlZCBiZWZvcmUgSSdkIG5lZWQKPiBuZWVkIG11bHRpcGxlIGNvcmVzIHRvIGFjdHVh
bGx5IGdldCBpbnRlcmVzdGluZyBtZWFzdXJlbWVudHMgd2hlbgo+IGNvbXBhcmluZyBkaWZmZXJl
bnQgaW1wbGVtZW50YXRpb25zLiBCdXQgYXQgbGVhc3QgZXZlcnl0aGluZyB0aGF0Cj4gd29ya2Vk
IGJlZm9yZSBzdGlsbCB3b3JrcyB3aXRoIHRoaXMgc2VyaWVzIDstKQo+Cj4KPiBTbywgU2VyaWVz
Cj4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+Cj4KPiBIZWlr
bwo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY3NreS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
