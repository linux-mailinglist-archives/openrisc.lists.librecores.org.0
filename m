Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4822B424BC3
	for <lists+openrisc@lfdr.de>; Thu,  7 Oct 2021 04:25:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2875924146;
	Thu,  7 Oct 2021 04:25:18 +0200 (CEST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mail.librecores.org (Postfix) with ESMTPS id B980D21011
 for <openrisc@lists.librecores.org>; Thu,  7 Oct 2021 04:25:16 +0200 (CEST)
Received: by mail-pl1-f181.google.com with SMTP id x4so2925170pln.5
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 19:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wdvJk6D1ViEBYH6uB0AwglzPFWNo7cbOO7fkxMbJ9dA=;
 b=Sp/MggvYZ1fkKseKOIqheZEqgIYO9U7l3Fb+F7r4AF1HJvKza55doAM4VFHekfLjFx
 l0h9QKBGfCRkc0EqNboiOVTNmHzg/SEEuLqwArpOJayKxQme+kLkxEIGqZgvnMWmieNx
 fhuC+ZFrD2D0fjMPYFbqmZAg8gVdJN6nAW585b1RLttDiggeBCq69kYRXGKHA2qSZytw
 hSaCB+BvsDGvSowzyJ3w/Myei9Krute/Mf+n+VyS3y75NZoqIH2HR+hkZeD1eiqFJV9a
 +rouVDBNrFLQuldI1V/ceTpSLwESV/R60I9q1ajynvnJIpy9PEOAXakMQE5+aA6KEYjv
 CNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wdvJk6D1ViEBYH6uB0AwglzPFWNo7cbOO7fkxMbJ9dA=;
 b=abryJnJJB9nec+yW0XggFiDdGyvCPW3o8iUDaNCfwXfE/vEkYtlJxs+VJxnrU2UPus
 6PVofCasNjXI7sZA0seHXPY3kJ7gMaIcoqTgw81I/bXgLOD7mpi5cShqp07c5E0KeLva
 LIUOXevpA0NqKww3fBBd+DwM/3roFTz4DwBCDTQiDBjbpEXqQVcwIAnZQ6+VmAJMv2z1
 arZaSxgoxFPSqt1AVby5+Lk3he5VpT8BRonyQo+uBv+Ow7rGg0QhuhO/sEanqDX5LnTs
 qxyqApaVS0ZMcNzlJFDntkI5lcR2zyiDHV45YrcL57liLqafbpHiU9NT5XykSemXIrCG
 r7AA==
X-Gm-Message-State: AOAM530MXIMqGzasDMJ5xxbaFlDFlBdmn/guVtpazf8oSsNSaYrpVEqA
 1UW+zt5xdcdZTR9RTc8oaq0=
X-Google-Smtp-Source: ABdhPJwHRb5SJb8sNMUH9CwZYyScBHBUSvA5u2yjHWxgkKCOzGkTQ5PtC45GQtM+mqCrbUx1dMutLQ==
X-Received: by 2002:a17:90a:8b8d:: with SMTP id
 z13mr2492694pjn.214.1633573515375; 
 Wed, 06 Oct 2021 19:25:15 -0700 (PDT)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id k14sm22015549pgg.92.2021.10.06.19.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:25:14 -0700 (PDT)
Message-ID: <ad0c1e14-62f9-0b9c-0b84-d31a213d53de@gmail.com>
Date: Wed, 6 Oct 2021 19:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-4-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211006164332.1981454-4-robh@kernel.org>
Subject: Re: [OpenRISC] [PATCH 03/12] ARM: broadcom: Use of_get_cpu_hwid()
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAxMC82LzIwMjEgOTo0MyBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gUmVwbGFjZSBvcGVu
IGNvZGVkIHBhcnNpbmcgb2YgQ1BVIG5vZGVzICdyZWcnIHByb3BlcnR5IHdpdGgKPiBvZl9nZXRf
Y3B1X2h3aWQoKS4KPiAKPiBDYzogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5j
b20+Cj4gQ2M6IFJheSBKdWkgPHJqdWlAYnJvYWRjb20uY29tPgo+IENjOiBTY290dCBCcmFuZGVu
IDxzYnJhbmRlbkBicm9hZGNvbS5jb20+Cj4gQ2M6IGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBi
cm9hZGNvbS5jb20KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4g
U2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBG
bG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KLS0gCkZsb3JpYW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
