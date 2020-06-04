Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B9C501FECB7
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 87CF3205C2;
	Thu, 18 Jun 2020 09:47:12 +0200 (CEST)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by mail.librecores.org (Postfix) with ESMTPS id 922D7209DF
 for <openrisc@lists.librecores.org>; Thu,  4 Jun 2020 11:50:26 +0200 (CEST)
Received: by mail-qk1-f194.google.com with SMTP id n141so5358811qke.2
 for <openrisc@lists.librecores.org>; Thu, 04 Jun 2020 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Kg6vPoyo+bqnNzeJ15v0h+k7UDJ+CL28zwznimZSCUE=;
 b=iTjBd5guz5HISGo2ssTQ3kdQtGEPcHruUrD+LnAE3oz6ejT5z7/X/1k6Lyhf8TKx5b
 ochOdOSIBb3h3Y16Pi6ii3tWoOJc7cfmg89ims3xh6+Jh8IhCFODcDigvdJUGn8PoFjT
 EkTUAsSp67YsNdsVwVT1r5Vu+evKW2mO3OAUqZvAKH38vSPvlDik/Uz5OVTy8vUxXLlw
 M32Z0qFp1SSOkv3GtQlbFiN4KDNE4Nike0Je9+qrq8Pcg7mXbqKBqHyIM6FNfuqeEz2s
 6n7X6JWYsNnBUTnlr9W/I3IY3mmtryZOuLjZUJqh6MakrvWInHU4vUrvtFma0HR0YPjH
 DA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Kg6vPoyo+bqnNzeJ15v0h+k7UDJ+CL28zwznimZSCUE=;
 b=fsWX7UsQHgCpVeAnEOQlUL/BBWUadWH+KZgAxGjwlQI8fS/u+/eVDZX04qPH4SYBc1
 sKHsO+sOaJLvXMR3Do8wLlCZKswrlVXn+c+ICz2SrecOfcq0evw7y5HuuiM9vAWr9A8+
 IKP0ZnFXNSpkIyRuIps0X6uX8peLhceqoCsr+2sLB05Vvx6ZwTS1JxyNCvATKKbXNpye
 xtewFJX6yO052N5vCcuhES3gxLvnJ7pCSdcYNszge1W6Kzsn+JvsGgTSNCk1dCenJn17
 i8XpXgin3qEk4KyPI0p6Ph7yxMOGwrCF2B2fzu8SjZJ/xo/eMVmYwHkr1DRYeC+v1TKs
 auQg==
X-Gm-Message-State: AOAM5336v3dJDmuH/4+AT7Fn1sBQaKS/jn2i9H4QKsbgy/4Btve05uMM
 Ykh2Y4Y5Bc12xzTNqbONv8fFI965dy247w==
X-Google-Smtp-Source: ABdhPJxfD/CO+vni4AqlLMUrdeQZhzI4lfqDbPL9gDbqoVSPBGPQonJSf2x+4N4xRGOEhDNSqWev4g==
X-Received: by 2002:a05:620a:1218:: with SMTP id
 u24mr3544315qkj.422.1591264224746; 
 Thu, 04 Jun 2020 02:50:24 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id k20sm4369904qtu.16.2020.06.04.02.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 02:50:23 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Date: Thu, 4 Jun 2020 05:50:23 -0400
Message-Id: <F85B8F19-D717-411A-AFA8-466A02159F27@lca.pw>
References: <20200603120522.7646d56a23088416a7d3fc1a@linux-foundation.org>
In-Reply-To: <20200603120522.7646d56a23088416a7d3fc1a@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: iPhone Mail (17F80)
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] [PATCH v4 08/14] powerpc: add support for folded p4d
 page tables
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 James Morse <James.Morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Cgo+IE9uIEp1biAzLCAyMDIwLCBhdCAzOjA1IFBNLCBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4
LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiAKPiBBIGJ1bmNoIG9mIG5ldyBtYXRlcmlhbCBqdXN0
IGxhbmRlZCBpbiBsaW51eC1uZXh0L3Bvd2VycGMuCj4gCj4gVGhlIHRpbWluZyBpcyBhd2t3YXJk
ISAgSSB0cnVzdCB0aGlzIHdpbGwgYmUgZ29pbmcgaW50byBtYWlubGluZSBkdXJpbmcKPiB0aGlz
IG1lcmdlIHdpbmRvdz8gIElmIG5vdCwgcGxlYXNlIGRyb3AgaXQgYW5kIHJlcHVsbCBhZnRlciAt
cmMxLgoKSSBoYXZlIG5vdGljZWQgdGhlIHNhbWUgcGF0dGVybiBvdmVyIGFuZCBvdmVyIGFnYWlu
LCBpLmUuLCBtYW55IHBvd2VycGMgbmV3IG1hdGVyaWFsIGhhcyBvbmx5IHNob3duIHVwIGluIGxp
bnV4LW5leHQgZm9yIG9ubHkgYSBmZXcgZGF5cyBiZWZvcmUgc2VuZGluZyBmb3IgYSBwdWxsIHJl
cXVlc3QgdG8gTGludXMuCgpUaGVyZSBhcmUgYWJzb2x1dGVseSBubyBzYWZlIG5ldCBmb3IgdGhp
cyBraW5kIG9mIHByYWN0aWNlLiBUaGUgbWFpbiBwcm9ibGVtIGlzIHRoYXQgTGludXMgc2VlbXMg
dG90YWxseSBmaW5lIHdpdGggaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
