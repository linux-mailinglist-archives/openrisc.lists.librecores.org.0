Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 51AD6456B42
	for <lists+openrisc@lfdr.de>; Fri, 19 Nov 2021 09:04:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8894824242;
	Fri, 19 Nov 2021 09:04:18 +0100 (CET)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id CE66024221
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 09:00:13 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso8200470pjb.0
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 00:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
 b=Piq1nJJ8yUxBmd7q2OqqhZ04o/Z/X8wPRFgtRzc8HIEZny/6x/zgzkJJLIzrhAa0e4
 +m/UkOZhCq/qceHyHLy6mrK1/J5X45CiYNHNz4LLNboBkuPFruTDbeHDANZN9gaBX4zE
 BOB6y13oTjWi0vF7xJd+4tsqCwxEUlAfE+LU/vlE+4bU80+Ekh940qsjxgz9xnCUr3Qi
 VmT32x+yuH4lxl7Rhd+Oz9STONwHrFxbc04IdCvrFJWCSYvRIOjZFaZysr2qzarcVla2
 /GqHkfvvxM0BK3O8jT5cWAzBmRaFUrfRWcGlu9hx9ier0QPDw7te7Gc5F9LDdGi5XMS6
 NbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
 b=awhq48hUVSkAl16ckuyf3GQlvGG/XBrZmTwsaW8ie113fA03TGHy/VvFXagsxtfDFr
 SwmBKN+075I8KW6j/I0mZ4OKXf5eBHH6H+f1yQH0tTcwgvxREyKGk4E6r6A2fsPqK0un
 2sExi3oa+NLZAGm6xT34woshmBLDPTl/YoHuZP1o8Ohhr3P5uFT53YgAIYC75o30fUGu
 SrPyMxBKpEM2upr/2pvGc457OPOIGBf1I4+eUBVwbj3VJfd9I8fVQE4/tqCVWVhtJOdY
 Ja/4kiG7iVrwMtaV/7OnGL3waCR6ruAxBTmS5zRJsn9KLRJDbBobBINOaKcsjRph0ask
 TEZg==
X-Gm-Message-State: AOAM530kbjOLhI5XSYbxLAhiKi5F72L50M7p1YczglxPZbtna8WF6yD7
 Rll/e96eAUddbhffnCqZIME=
X-Google-Smtp-Source: ABdhPJyEWl+rgTyJQilluTm65FmkmgWn+LtcD21UQsyfWBcLVUYOXziJspjYdNkg7WaRzd0koE7wlA==
X-Received: by 2002:a17:90a:8815:: with SMTP id
 s21mr2424180pjn.82.1637308812121; 
 Fri, 19 Nov 2021 00:00:12 -0800 (PST)
Received: from localhost.localdomain ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id o6sm1791259pfh.70.2021.11.18.23.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 00:00:11 -0800 (PST)
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Jinyang He <hejinyang@loongson.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Date: Fri, 19 Nov 2021 15:58:17 +0800
Message-Id: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Nov 2021 09:04:16 +0100
Subject: [OpenRISC] [PATCH 0/2] of: remove reserved regions count restriction
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-snps-arc@lists.infradead.org,
 Mauri Sandberg <sandberg@mailfence.com>, linux-sh@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 openrisc@lists.librecores.org,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-riscv@lists.infradead.org, Thierry Reding <treding@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGNvdW50IG9mIHJlc2VydmVkIHJlZ2lvbnMgaW4gL3Jlc2VydmVkLW1lbW9yeSB3YXMgbGlt
aXRlZCBiZWNhdXNlCnRoZSBzdHJ1Y3QgcmVzZXJ2ZWRfbWVtIGFycmF5IHdhcyBkZWZpbmVkIHN0
YXRpY2FsbHkuIFRoaXMgc2VyaWVzIHNvcnRzCm91dCByZXNlcnZlZCBtZW1vcnkgY29kZSBhbmQg
YWxsb2NhdGVzIHRoYXQgYXJyYXkgZnJvbSBlYXJseSBhbGxvY2F0b3IuCgpOb3RlOiByZXNlcnZl
ZCByZWdpb24gd2l0aCBmaXhlZCBsb2NhdGlvbiBtdXN0IGJlIHJlc2VydmVkIGJlZm9yZSBhbnkK
bWVtb3J5IGFsbG9jYXRpb24uIFdoaWxlIHN0cnVjdCByZXNlcnZlZF9tZW0gYXJyYXkgc2hvdWxk
IGJlIGFsbG9jYXRlZAphZnRlciBhbGxvY2F0b3IgaXMgYWN0aXZhdGVkLiBXZSBtYWtlIGVhcmx5
X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkKZG8gcmVzZXJ2YXRpb24gb25seSBhbmQgYWRk
IGFub3RoZXIgY2FsbCB0byBpbml0aWFsaXplIHJlc2VydmVkIG1lbW9yeS4KU28gYXJjaCBjb2Rl
IGhhdmUgdG8gY2hhbmdlIGZvciBpdC4KCkknbSBvbmx5IGZhbWlsaWFyIHdpdGggYXJtIGFuZCBh
cm02NCBhcmNoaXRlY3R1cmVzLiBBcHByb3ZhbHMgZnJvbSBhcmNoCm1haW50YWluZXJzIGFyZSBy
ZXF1aXJlZC4gVGhhbmsgeW91IGFsbC4KCkNhbHZpbiBaaGFuZyAoMik6CiAgb2Y6IFNvcnQgcmVz
ZXJ2ZWRfbWVtIHJlbGF0ZWQgY29kZQogIG9mOiByZXNlcnZlZF9tZW06IFJlbW92ZSByZXNlcnZl
ZCByZWdpb25zIGNvdW50IHJlc3RyaWN0aW9uCgogYXJjaC9hcmMvbW0vaW5pdC5jICAgICAgICAg
ICAgICAgICB8ICAgMyArCiBhcmNoL2FybS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgICAy
ICsKIGFyY2gvYXJtNjQva2VybmVsL3NldHVwLmMgICAgICAgICAgfCAgIDMgKwogYXJjaC9jc2t5
L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8ICAgMyArCiBhcmNoL2g4MzAwL2tlcm5lbC9zZXR1
cC5jICAgICAgICAgIHwgICAyICsKIGFyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAg
fCAgIDMgKwogYXJjaC9uZHMzMi9rZXJuZWwvc2V0dXAuYyAgICAgICAgICB8ICAgMyArCiBhcmNo
L25pb3MyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgICAyICsKIGFyY2gvb3BlbnJpc2Mva2Vy
bmVsL3NldHVwLmMgICAgICAgfCAgIDMgKwogYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21t
b24uYyB8ICAgMyArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgICAyICsK
IGFyY2gvc2gva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgfCAgIDMgKwogYXJjaC94dGVuc2Ev
a2VybmVsL3NldHVwLmMgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAg
ICAgICAgICAgIHwgMTA3ICstLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvb2Yvb2ZfcHJpdmF0ZS5o
ICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgICAgICAg
fCAxODkgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIGluY2x1ZGUvbGludXgvb2ZfcmVz
ZXJ2ZWRfbWVtLmggICAgfCAgIDQgKwogMTcgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMo
KyksIDEzOSBkZWxldGlvbnMoLSkKCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
