Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9421D654CC0
	for <lists+openrisc@lfdr.de>; Fri, 23 Dec 2022 08:17:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5DA6120919;
	Fri, 23 Dec 2022 08:17:33 +0100 (CET)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mail.librecores.org (Postfix) with ESMTPS id 9C2E424B76
 for <openrisc@lists.librecores.org>; Thu, 22 Dec 2022 12:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671709671; x=1703245671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IbMw6br59U86nejRLG71yUeJj71gbGKIdiufP6FjbTQ=;
 b=aLWccCOW9SHtJiDayX5jnQV5aNBAYKK9vK2Hbt7FnrhWKstscKAr6A+i
 /ZHysfr1ITOrdjbD+AQ7FCtq9XKQXG0bWhMZ0Cvhr9zP8GLuC59MT2zgK
 DLRg6izg4EZJR+YUoxHiv8ifKrLgeHKqCG67hHoTA33rJvnD5GL05K4DA
 PbE8UsDfw2wqfxNuQAwRbgWOY4y+iq1SWbmOczGuUfmwi1Ct24u/lmlFr
 ORQkyFMAtkggkFS8LomGD2myNMqTKgKLIiRbeMdtqWFbxGyA0e6sy2lAY
 M9JpcxV5QfJ7PfvTr+YEfPEt7Tu9mpbZk+x3293Gb54Gx/YjfQbn0dySP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804511"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="318804511"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:47:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504419"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="629504419"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:47:36 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 03/19] arch/arm: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:19 +0100
Message-Id: <20221222114635.1251934-4-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:17:29 +0100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/arm/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 4dfe538dfc689b..6953fc05a97886 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -25,7 +25,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
@@ -115,7 +115,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 }
 
 #define arch_xchg_relaxed(ptr, x) ({					\
-	(__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr),		\
+	(__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),		\
 				   sizeof(*(ptr)));			\
 })
 
-- 
2.34.1

