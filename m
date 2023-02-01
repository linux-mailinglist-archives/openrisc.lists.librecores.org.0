Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2D91467FEF7
	for <lists+openrisc@lfdr.de>; Sun, 29 Jan 2023 13:43:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CECCE23044;
	Sun, 29 Jan 2023 13:42:59 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 8A20A229EB
 for <openrisc@lists.librecores.org>; Sun, 29 Jan 2023 13:42:58 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C2F760D30;
 Sun, 29 Jan 2023 12:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E716EC433D2;
 Sun, 29 Jan 2023 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674996176;
 bh=8RQZps3hA/u1mdRRQGYSzSx3iKFm4iTs/37kan3EXRs=;
 h=From:To:Cc:Subject:Date:From;
 b=nZUZmSKw7/syf9RrBIFurd/O3AkMNzmfegfK+1AS6FvCaH0OhJOzBAu3UXC6av8P5
 uY9AOa46F/d5yj77Ho8Ndgvw8xxJHw4nNHTmwjtslAXWyegt5vS1IKaYW+Stnwyuiy
 2a+kHtcUtcTQ5Rqh9d7F2WecpHec0CXwi5TSyt1qClHpJLOA2sydJTb6OF8VZPCNps
 3fd8EBQ67Wgcl+xTfrf7oQnKtinBQv8tebZZGSc5tamZZbBvwb6yYhdPyn1uALV1nu
 d2H6gUYCo1lWTN9F7fs+AKTM2279BJ7XhGhJhYj0+jZo3axy2AgunU1xbS8ZdbQ6oz
 oCSDE8gtPikyw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/4] mm,
 arch: add generic implementation of pfn_valid() for FLATMEM
Date: Sun, 29 Jan 2023 14:42:31 +0200
Message-Id: <20230129124235.209895-1-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openrisc@lists.librecores.org
X-Mailman-Version: 2.1.29
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
 linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

Every architecture that supports FLATMEM memory model defines its own
version of pfn_valid() that essentially compares a pfn to max_mapnr.

Use mips/powerpc version implemented as static inline as a generic
implementation of pfn_valid() and drop its per-architecture definitions

v2:
* fix build on ARM and xtensa
* add Acked- and Reviewed-by, thanks everybody

v1: https://lore.kernel.org/all/20230125190757.22555-1-rppt@kernel.org

Mike Rapoport (IBM) (4):
  arm: include asm-generic/memory_model.h from page.h rather than
    memory.h
  m68k: use asm-generic/memory_model.h for both MMU and !MMU
  mips: drop definition of pfn_valid() for DISCONTIGMEM
  mm, arch: add generic implementation of pfn_valid() for FLATMEM

 arch/alpha/include/asm/page.h      |  4 ----
 arch/arc/include/asm/page.h        |  1 -
 arch/arm/include/asm/memory.h      |  2 --
 arch/arm/include/asm/page.h        |  2 ++
 arch/csky/include/asm/page.h       |  1 -
 arch/hexagon/include/asm/page.h    |  1 -
 arch/ia64/include/asm/page.h       |  4 ----
 arch/loongarch/include/asm/page.h  | 13 -------------
 arch/m68k/include/asm/page.h       |  6 +-----
 arch/m68k/include/asm/page_mm.h    |  1 -
 arch/m68k/include/asm/page_no.h    |  4 ----
 arch/microblaze/include/asm/page.h |  1 -
 arch/mips/include/asm/page.h       | 28 ----------------------------
 arch/nios2/include/asm/page.h      |  9 ---------
 arch/openrisc/include/asm/page.h   |  2 --
 arch/parisc/include/asm/page.h     |  4 ----
 arch/powerpc/include/asm/page.h    |  9 ---------
 arch/riscv/include/asm/page.h      |  5 -----
 arch/sh/include/asm/page.h         |  3 ---
 arch/sparc/include/asm/page_32.h   |  1 -
 arch/um/include/asm/page.h         |  1 -
 arch/x86/include/asm/page_32.h     |  4 ----
 arch/x86/include/asm/page_64.h     |  4 ----
 arch/xtensa/include/asm/page.h     |  4 ++--
 include/asm-generic/memory_model.h | 12 ++++++++++++
 include/asm-generic/page.h         |  2 --
 26 files changed, 17 insertions(+), 111 deletions(-)


base-commit: 2241ab53cbb5cdb08a6b2d4688feb13971058f65
-- 
2.35.1

