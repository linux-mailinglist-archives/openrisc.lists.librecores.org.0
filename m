Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3FB519ECF
	for <lists+openrisc@lfdr.de>; Wed,  4 May 2022 14:02:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 60AA7248EB;
	Wed,  4 May 2022 14:02:52 +0200 (CEST)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by mail.librecores.org (Postfix) with ESMTPS id D1E602017F
 for <openrisc@lists.librecores.org>; Wed,  4 May 2022 14:02:50 +0200 (CEST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nmDiP-0001Qi-Em; Wed, 04 May 2022 14:02:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/7] RISC-V: Move to generic spinlocks
Date: Wed, 04 May 2022 14:02:44 +0200
Message-ID: <3428595.iIbC2pHGDl@diego>
In-Reply-To: <20220430153626.30660-6-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-6-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: peterz@infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, jonas@southpole.se, linux-csky@vger.kernel.org,
 mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Am Samstag, 30. April 2022, 17:36:24 CEST schrieb Palmer Dabbelt:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Our existing spinlocks aren't fair and replacing them has been on the
> TODO list for a long time.  This moves to the recently-introduced ticket
> spinlocks, which are simple enough that they are likely to be correct
> and fast on the vast majority of extant implementations.
> 
> This introduces a horrible hack that allows us to split out the spinlock
> conversion from the rwlock conversion.  We have to do the spinlocks
> first because qrwlock needs fair spinlocks, but we don't want to pollute
> the asm-generic code to support the generic spinlocks without qrwlocks.
> Thus we pollute the RISC-V code, but just until the next commit as it's
> all going away.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

on riscv64+riscv32 qemu, beaglev and d1-nezha

Tested-by: Heiko Stuebner <heiko@sntech.de>


