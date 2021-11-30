Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D28094628E4
	for <lists+openrisc@lfdr.de>; Tue, 30 Nov 2021 01:08:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6774D24210;
	Tue, 30 Nov 2021 01:08:17 +0100 (CET)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by mail.librecores.org (Postfix) with ESMTPS id 36CBC2419D
 for <openrisc@lists.librecores.org>; Tue, 30 Nov 2021 01:08:15 +0100 (CET)
Received: by mail-ot1-f52.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so27809594otv.9
 for <openrisc@lists.librecores.org>; Mon, 29 Nov 2021 16:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8pPDA8BhqYxJlGll70Jfs/EV2c/vlH3kHLgmxR36Bk=;
 b=TwGDqkNffzIeLXIC2OPevHgcgyYAgB/u/Z5OYS58kGv/roj5mySls/8pWn7Nmeay8F
 RkzAyMzjYgxRXI01BnzL+UYmim095ZbozN+JbI2cYmJZTNWNsluYmQuJjwn5ENOZhfme
 O+XbxZKghPP4nNvs/oBdno+TAMorAqiB9LTnU06HKVQbLEtBOYpU3vEHXkmcPDKNG3lT
 Kco26vdBD9ZNdTmuZXePCE+ofTj8pDccpidrMhN/TfvV2Fo2YtbVc6j2Zs5MFtJhNbnM
 /LAoR2+wW1cpaY8fatPIGcZkxQ7k+VdoPzE4DBenFuQef6eqU+jySBjMm2AXqia1ZM6u
 DaFA==
X-Gm-Message-State: AOAM53394ZLxMXifsi5AiRfSdYhYrU9fbhJH/4cdwtOzoKDZpthL3oOq
 horYgXpUwgxoEkVMCZ832A==
X-Google-Smtp-Source: ABdhPJwHdVFEp5hd/T8aXyXLlCP6k0CfP+fpF2T3r+PJoHiG4EwmK+ob5JSJ6nKmQgmurmZ684PLSA==
X-Received: by 2002:a9d:4702:: with SMTP id a2mr47864106otf.262.1638230893962; 
 Mon, 29 Nov 2021 16:08:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bi20sm3422829oib.29.2021.11.29.16.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:08:13 -0800 (PST)
Received: (nullmailer pid 864351 invoked by uid 1000);
 Tue, 30 Nov 2021 00:08:10 -0000
Date: Mon, 29 Nov 2021 18:08:10 -0600
From: Rob Herring <robh@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <YaVrahm+ysoQRGKe@robh.at.kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
Subject: Re: [OpenRISC] [PATCH 0/2] of: remove reserved regions count
 restriction
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
Cc: "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Rich Felker <dalias@libc.org>, Jinyang He <hejinyang@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
 Calvin Zhang <calvinzhang.cool@gmail.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Vladimir Isaev <isaev@synopsys.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Thierry Reding <treding@nvidia.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-xtensa@linux-xtensa.org, Vineet Gupta <vgupta@kernel.org>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBOb3YgMjEsIDIwMjEgYXQgMDg6NDM6NDdBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBGcmksIE5vdiAxOSwgMjAyMSBhdCAwMzo1ODoxN1BNICswODAwLCBDYWx2aW4g
Wmhhbmcgd3JvdGU6Cj4gPiBUaGUgY291bnQgb2YgcmVzZXJ2ZWQgcmVnaW9ucyBpbiAvcmVzZXJ2
ZWQtbWVtb3J5IHdhcyBsaW1pdGVkIGJlY2F1c2UKPiA+IHRoZSBzdHJ1Y3QgcmVzZXJ2ZWRfbWVt
IGFycmF5IHdhcyBkZWZpbmVkIHN0YXRpY2FsbHkuIFRoaXMgc2VyaWVzIHNvcnRzCj4gPiBvdXQg
cmVzZXJ2ZWQgbWVtb3J5IGNvZGUgYW5kIGFsbG9jYXRlcyB0aGF0IGFycmF5IGZyb20gZWFybHkg
YWxsb2NhdG9yLgo+ID4gCj4gPiBOb3RlOiByZXNlcnZlZCByZWdpb24gd2l0aCBmaXhlZCBsb2Nh
dGlvbiBtdXN0IGJlIHJlc2VydmVkIGJlZm9yZSBhbnkKPiA+IG1lbW9yeSBhbGxvY2F0aW9uLiBX
aGlsZSBzdHJ1Y3QgcmVzZXJ2ZWRfbWVtIGFycmF5IHNob3VsZCBiZSBhbGxvY2F0ZWQKPiA+IGFm
dGVyIGFsbG9jYXRvciBpcyBhY3RpdmF0ZWQuIFdlIG1ha2UgZWFybHlfaW5pdF9mZHRfc2Nhbl9y
ZXNlcnZlZF9tZW0oKQo+ID4gZG8gcmVzZXJ2YXRpb24gb25seSBhbmQgYWRkIGFub3RoZXIgY2Fs
bCB0byBpbml0aWFsaXplIHJlc2VydmVkIG1lbW9yeS4KPiA+IFNvIGFyY2ggY29kZSBoYXZlIHRv
IGNoYW5nZSBmb3IgaXQuCj4gCj4gSSB0aGluayBtdWNoIHNpbXBsZXIgd291bGQgYmUgdG8gdXNl
IHRoZSBzYW1lIGNvbnN0YW50IGZvciBzaXppbmcKPiBtZW1ibG9jay5yZXNlcnZlZCBhbmQgcmVz
ZXJ2ZWRfbWVtIGFycmF5cy4KCkRvIHRob3NlIGFycmF5cyBnZXQgc2hydW5rPyBPciBkbyB3ZSB3
YXN0ZSB0aGUgbWVtb3J5IGZvcmV2ZXI/CgpNYXliZSB3ZSBjYW4gY29weSBhbmQgc2hyaW5rIHRo
ZSBpbml0aWFsIGFycmF5PyBUaG91Z2ggSSBzdXNwZWN0IHN0cnVjdCAKcmVzZXJ2ZWRfbWVtIHBv
aW50ZXJzIGhhdmUgYWxyZWFkeSBiZWVuIGdpdmVuIG91dC4KCj4gCj4gSWYgdGhlcmUgaXMgdG9v
IG11Y2ggcmVzZXJ2ZWQgcmVnaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUsIHJlc2VydmluZyB0aGVt
IGluCj4gbWVtYmxvY2sgd2lsbCBmYWlsIGFueXdheSBiZWNhdXNlIG1lbWJsb2NrIGFsc28gc3Rh
cnRzIHdpdGggc3RhdGljIGFycmF5Cj4gZm9yIG1lbWJsb2NrLnJlc2VydmVkLCBzbyBkb2luZyBv
bmUgcGFzcyB3aXRoIG1lbWJsb2NrX3Jlc2VydmUoKSBhbmQKPiBhbm90aGVyIHRvIHNldCB1cCBy
ZXNlcnZlZF9tZW0gd291bGRuJ3QgaGVscCBhbnl3YXkuCj4gCj4gPiBJJ20gb25seSBmYW1pbGlh
ciB3aXRoIGFybSBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJlcy4gQXBwcm92YWxzIGZyb20gYXJjaAo+
ID4gbWFpbnRhaW5lcnMgYXJlIHJlcXVpcmVkLiBUaGFuayB5b3UgYWxsLgo+ID4gCj4gPiBDYWx2
aW4gWmhhbmcgKDIpOgo+ID4gICBvZjogU29ydCByZXNlcnZlZF9tZW0gcmVsYXRlZCBjb2RlCj4g
PiAgIG9mOiByZXNlcnZlZF9tZW06IFJlbW92ZSByZXNlcnZlZCByZWdpb25zIGNvdW50IHJlc3Ry
aWN0aW9uCj4gPiAKPiA+ICBhcmNoL2FyYy9tbS9pbml0LmMgICAgICAgICAgICAgICAgIHwgICAz
ICsKPiA+ICBhcmNoL2FybS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgICAyICsKPiA+ICBh
cmNoL2FybTY0L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgICAzICsKPiA+ICBhcmNoL2Nza3kv
a2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgICAzICsKPiA+ICBhcmNoL2g4MzAwL2tlcm5lbC9z
ZXR1cC5jICAgICAgICAgIHwgICAyICsKPiA+ICBhcmNoL21pcHMva2VybmVsL3NldHVwLmMgICAg
ICAgICAgIHwgICAzICsKPiA+ICBhcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwg
ICAzICsKPiA+ICBhcmNoL25pb3MyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgICAyICsKPiA+
ICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jICAgICAgIHwgICAzICsKPiA+ICBhcmNoL3Bv
d2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5jIHwgICAzICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jICAgICAgICAgIHwgICAyICsKPiA+ICBhcmNoL3NoL2tlcm5lbC9zZXR1cC5jICAg
ICAgICAgICAgIHwgICAzICsKPiA+ICBhcmNoL3h0ZW5zYS9rZXJuZWwvc2V0dXAuYyAgICAgICAg
IHwgICAyICsKPiA+ICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAgICAgICAgICAgIHwgMTA3ICst
LS0tLS0tLS0tLS0tLS0KPiA+ICBkcml2ZXJzL29mL29mX3ByaXZhdGUuaCAgICAgICAgICAgIHwg
IDEyICstCj4gPiAgZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYyAgICAgICB8IDE4OSArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvb2ZfcmVzZXJ2ZWRf
bWVtLmggICAgfCAgIDQgKwo+ID4gIDE3IGZpbGVzIGNoYW5nZWQsIDIwNyBpbnNlcnRpb25zKCsp
LCAxMzkgZGVsZXRpb25zKC0pCj4gPiAKPiA+IC0tIAo+ID4gMi4zMC4yCj4gPiAKPiAKPiAtLSAK
PiBTaW5jZXJlbHkgeW91cnMsCj4gTWlrZS4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
