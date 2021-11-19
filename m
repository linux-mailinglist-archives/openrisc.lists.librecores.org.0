Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 81EDC456D4A
	for <lists+openrisc@lfdr.de>; Fri, 19 Nov 2021 11:30:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3599323F24;
	Fri, 19 Nov 2021 11:30:18 +0100 (CET)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mail.librecores.org (Postfix) with ESMTPS id BC28823F24
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 11:30:15 +0100 (CET)
Received: by mail-pl1-f177.google.com with SMTP id q17so7774896plr.11
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
 b=KPFYp17Oy/uF3pbSIvlZbA7tgtmLiBC3HIruVIaKeBTx1ALHk1wBHI9RWH4Y/TRiM2
 hAq35CyJOhqjAvnIz+XnfBNiKxqvsUzF8MUMqrbb+qoLapa3GCOHgXxaI6x9Km0AlL0K
 2wG7B8CCYpBSr+ZNFswMkvUZagoAlzcdTSS//NHNiGf8CdixgEqb6uKPGS2QpTEgcUAp
 yArb+GP+Q+XhbKyaqKWupK7SJqNy6AAI7qZH/W5TKcSo7ZV4POw8PNPyAsvkQzKhD740
 EiMIWTjA0fXMyULJynwnTQN6Kgk/iWbRQ1iPpWyGjz39JFmP0lOhp61wqe2NJVi1cPEy
 0utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
 b=0BOeB2aFkLj5xOt3NiNCYGl6fnkByhI2Dm/HPbhaCDZuIebj0HoUM0SUJJ+HrYvr4i
 N7onuVi34d4Xxdf0ka6ABwa8XykiaBNtUGUMTwJiDmuJDhxzoeaZPOI9gudppvs+jFSa
 UKNOranZSEWFA1XGgDmdz/iwCGyfRW2s4I1fa9fd0ataolloawZMh9s88U646/oRUlHx
 MWTG9hXysjlJ1+BroqztE0sZfllaqxHFgTzQSZwdqz+jBmKJvTM0nce2+YsF86O24Jpg
 GjfhunJnWnBwSpfMip30GBGmAIrewl1ecWC6VvfDvnfGoJX0B8RqjKbx+zv/eU78mvLA
 HwXQ==
X-Gm-Message-State: AOAM532HedfmffFDvEnhW06tr+aMF9WQmmGNzV3uirr55lrtKbHR1XeD
 gvSfM98hJE8RMUytyasi66w=
X-Google-Smtp-Source: ABdhPJwCL45zphX6sAUQpCTH2XR0MI6TO3LxQucz8xUZnsL94laUGiXdLG1KlgE2xhwPB5DYkk54PQ==
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id
 bb5-20020a170902bc8500b00143954e8548mr73204786plb.82.1637317814262; 
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Received: from localhost ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id u22sm2537834pfk.148.2021.11.19.02.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Date: Fri, 19 Nov 2021 18:30:09 +0800
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <YZd8sc6E0bgNA9ag@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
 <YZd0uEWNH6Def3+8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
Subject: Re: [OpenRISC] [PATCH 2/2] of: reserved_mem: Remove reserved
 regions count restriction
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 Jinyang He <hejinyang@loongson.cn>, David Hildenbrand <david@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Max Filippov <jcmvbkbc@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, Calvin Zhang <calvinzhang.cool@gmail.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Vladimir Isaev <isaev@synopsys.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, linux-mips@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBOb3YgMTksIDIwMjEgYXQgMTE6NTY6MDhBTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+T24gRnJpLCBOb3YgMTksIDIwMjEgYXQgMDM6NTg6MTlQTSArMDgwMCwgQ2Fsdmlu
IFpoYW5nIHdyb3RlOgo+PiBDaGFuZ2UgdG8gYWxsb2NhdGUgcmVzZXJ2ZWRfbWVtcyBkeW5hbWlj
YWxseS4gU3RhdGljIHJlc2VydmVkIHJlZ2lvbnMKPj4gbXVzdCBiZSByZXNlcnZlZCBiZWZvcmUg
YW55IG1lbWJsb2NrIGFsbG9jYXRpb25zLiBUaGUgcmVzZXJ2ZWRfbWVtcwo+PiBhcnJheSBjb3Vs
ZG4ndCBiZSBhbGxvY2F0ZWQgdW50aWwgbWVtYmxvY2sgYW5kIGxpbmVhciBtYXBwaW5nIGFyZSBy
ZWFkeS4KPj4gCj4+IFNvIG1vdmUgdGhlIGFsbG9jYXRpb24gYW5kIGluaXRpYWxpemF0aW9uIG9m
IHJlY29yZHMgYW5kIHJlc2VydmVkIG1lbW9yeQo+PiBmcm9tIGVhcmx5X2luaXRfZmR0X3NjYW5f
cmVzZXJ2ZWRfbWVtKCkgdG8gb2ZfcmVzZXJ2ZWRfbWVtX2luaXQoKS4KPgo+PiAgYXJjaC9hcmMv
bW0vaW5pdC5jICAgICAgICAgICAgICAgICB8ICAzICsrCj4+ICBhcmNoL2FybS9rZXJuZWwvc2V0
dXAuYyAgICAgICAgICAgIHwgIDIgKwo+PiAgYXJjaC9hcm02NC9rZXJuZWwvc2V0dXAuYyAgICAg
ICAgICB8ICAzICsrCj4+ICBhcmNoL2Nza3kva2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgIDMg
KysKPj4gIGFyY2gvaDgzMDAva2VybmVsL3NldHVwLmMgICAgICAgICAgfCAgMiArCj4+ICBhcmNo
L21pcHMva2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgIDMgKysKPj4gIGFyY2gvbmRzMzIva2Vy
bmVsL3NldHVwLmMgICAgICAgICAgfCAgMyArKwo+PiAgYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAu
YyAgICAgICAgICB8ICAyICsKPj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgICAgICAg
fCAgMyArKwo+PiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYyB8ICAzICsrCj4+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgIDIgKwo+PiAgYXJjaC9zaC9r
ZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICB8ICAzICsrCj4+ICBhcmNoL3h0ZW5zYS9rZXJuZWwv
c2V0dXAuYyAgICAgICAgIHwgIDIgKwo+Cj5Jc24ndCB4ODYgbWlzc2VkPyBJcyBpdCBvbiBwdXJw
b3NlPwo+V291bGQgYmUgbmljZSB0byBoYXZlIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9y
IGZpeGVkIGFjY29yZGluZ2x5LgpBRkFJSywgeDg2IGRvZXNuJ3QgcmVzZXJ2ZSBtZW1vcnkgdGhy
b3VnaCAiL3Jlc2VydmVkLW1lbW9yeSIgbm9kZSB1bnRpbCBub3cuCkFjdHVhbGx5LCBJIGdvdCB0
aGUgYXJjaCBsaXN0IGZyb20gY2FsbGVycyBvZgplYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVk
X21lbSgpLgo+Cj4tLSAKPldpdGggQmVzdCBSZWdhcmRzLAo+QW5keSBTaGV2Y2hlbmtvCj4KPgo+
ClRoYW5rcywKQ2FsdmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
