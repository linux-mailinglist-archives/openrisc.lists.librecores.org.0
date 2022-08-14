Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D73EB5920BE
	for <lists+openrisc@lfdr.de>; Sun, 14 Aug 2022 17:30:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9EAD724997;
	Sun, 14 Aug 2022 17:30:15 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 4159B24A94
 for <openrisc@lists.librecores.org>; Sun, 14 Aug 2022 17:30:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D36FD60C0B;
 Sun, 14 Aug 2022 15:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D422AC433D7;
 Sun, 14 Aug 2022 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660491011;
 bh=TmwB1yyIO7hlQxEEZ3YP1Hse/khGDr1TusJ9UJG8jgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AClHnpxETW7doCkoaOlshndODXSaqAYcC+SEfS04/CNg2VebkbcVYTmEpB6bQtJFR
 RpCxs/2iZ6WuUU/pk2lZXda+35I/JyEbixMKNT9Adt6OnT0XffNC0pldXzeg1q0wgm
 BDkRQAIwa8pphD5aCFcizf4UeFwnyq3Yhhc2b0aoA75H9Oj8lbtivx2y3KHScavWZr
 N8d8FF6oNZ8Yw/WApEoJC5jJQsKUSL6OdN3r7OmuRBKaG0fA7BgubSSn1YAdel3XUN
 L712S0tJE0y8pRchU35NX+797xnaeeNtBC6fpzXyk4NzTf6hCDzTxA1C/Jyc0KoiOG
 sLHBcO53/LrLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 56/64] openrisc: io: Define iounmap argument as
 volatile
Date: Sun, 14 Aug 2022 11:24:29 -0400
Message-Id: <20220814152437.2374207-56-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814152437.2374207-1-sashal@kernel.org>
References: <20220814152437.2374207-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, jonas@southpole.se,
 openrisc@lists.librecores.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

From: Stafford Horne <shorne@gmail.com>

[ Upstream commit 52e0ea900202d23843daee8f7089817e81dd3dd7 ]

When OpenRISC enables PCI it allows for more drivers to be compiled
resulting in exposing the following with -Werror.

    drivers/video/fbdev/riva/fbdev.c: In function 'rivafb_probe':
    drivers/video/fbdev/riva/fbdev.c:2062:42: error:
	    passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type

    drivers/video/fbdev/nvidia/nvidia.c: In function 'nvidiafb_probe':
    drivers/video/fbdev/nvidia/nvidia.c:1414:20: error:
	    passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type

    drivers/scsi/aic7xxx/aic7xxx_osm.c: In function 'ahc_platform_free':
    drivers/scsi/aic7xxx/aic7xxx_osm.c:1231:41: error:
	    passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type

Most architectures define the iounmap argument to be volatile.  To fix this
issue we do the same for OpenRISC.  This patch must go before PCI is enabled on
OpenRISC to avoid any compile failures.

Link: https://lore.kernel.org/lkml/20220729033728.GA2195022@roeck-us.net/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/openrisc/include/asm/io.h | 2 +-
 arch/openrisc/mm/ioremap.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/openrisc/include/asm/io.h b/arch/openrisc/include/asm/io.h
index c298061c70a7..8aa3e78181e9 100644
--- a/arch/openrisc/include/asm/io.h
+++ b/arch/openrisc/include/asm/io.h
@@ -31,7 +31,7 @@
 void __iomem *ioremap(phys_addr_t offset, unsigned long size);
 
 #define iounmap iounmap
-extern void iounmap(void __iomem *addr);
+extern void iounmap(volatile void __iomem *addr);
 
 #include <asm-generic/io.h>
 
diff --git a/arch/openrisc/mm/ioremap.c b/arch/openrisc/mm/ioremap.c
index daae13a76743..8ec0dafecf25 100644
--- a/arch/openrisc/mm/ioremap.c
+++ b/arch/openrisc/mm/ioremap.c
@@ -77,7 +77,7 @@ void __iomem *__ref ioremap(phys_addr_t addr, unsigned long size)
 }
 EXPORT_SYMBOL(ioremap);
 
-void iounmap(void __iomem *addr)
+void iounmap(volatile void __iomem *addr)
 {
 	/* If the page is from the fixmap pool then we just clear out
 	 * the fixmap mapping.
-- 
2.35.1

