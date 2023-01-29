Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E567FF11
	for <lists+openrisc@lfdr.de>; Sun, 29 Jan 2023 13:43:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3310323049;
	Sun, 29 Jan 2023 13:43:33 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 271E523044
 for <openrisc@lists.librecores.org>; Sun, 29 Jan 2023 13:43:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13E1C60D32;
 Sun, 29 Jan 2023 12:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11014C4339C;
 Sun, 29 Jan 2023 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674996210;
 bh=TNKTwe+UR0ceH94DVHkVlPLs1JCpp400iKAUs+FXrEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kHOqK+fkBQfue2/LgvXT5/OFdAT2H2FDvjblZicbNXbJBXdpPk6eRh5KAzlpLxCYr
 +ZshLmihJgfk3B+zAwo730+puTcbIc8k+mnQeD2+zmdUjKYXlyfsgcn6GYvHDuUc19
 AOHGXLEYgfNJeOc530SeCns3uW1t7x0orjihKEYEIIT5GQHR6IqYB/gEFrjidz/2dv
 f0dKfcsUeo0xUm2dYF+qX8c/XDVdQtMrsNcKx4lXhoiKAIFdyDDeO7DFDI10MnLJsj
 Zihs3LV7jZdAazuy4Qto4ScBNLLuXUWDyHAfB37wPKFgGicdZknfE+MkdxncDSrEh9
 WkpxoaJlG/GPw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 3/4] mips: drop definition of pfn_valid() for DISCONTIGMEM
Date: Sun, 29 Jan 2023 14:42:34 +0200
Message-Id: <20230129124235.209895-4-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230129124235.209895-1-rppt@kernel.org>
References: <20230129124235.209895-1-rppt@kernel.org>
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

There is stale definition of pfn_valid() for DISCONTINGMEM memory model
guarded !FLATMEM && !SPARSEMEM && NUMA ifdefery.

Remove everything but definition of pfn_valid() for FLATMEM.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/mips/include/asm/page.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 96bc798c1ec1..9286f11ff6ad 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -235,21 +235,6 @@ static inline int pfn_valid(unsigned long pfn)
 	return pfn >= pfn_offset && pfn < max_mapnr;
 }
 
-#elif defined(CONFIG_SPARSEMEM)
-
-/* pfn_valid is defined in linux/mmzone.h */
-
-#elif defined(CONFIG_NUMA)
-
-#define pfn_valid(pfn)							\
-({									\
-	unsigned long __pfn = (pfn);					\
-	int __n = pfn_to_nid(__pfn);					\
-	((__n >= 0) ? (__pfn < NODE_DATA(__n)->node_start_pfn +		\
-			       NODE_DATA(__n)->node_spanned_pages)	\
-		    : 0);						\
-})
-
 #endif
 
 #define virt_to_pfn(kaddr)   	PFN_DOWN(virt_to_phys((void *)(kaddr)))
-- 
2.35.1

