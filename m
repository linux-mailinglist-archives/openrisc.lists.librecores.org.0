Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 61CB1654CBE
	for <lists+openrisc@lfdr.de>; Fri, 23 Dec 2022 08:17:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 156AD249BB;
	Fri, 23 Dec 2022 08:17:32 +0100 (CET)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mail.librecores.org (Postfix) with ESMTPS id 3CD7024B77
 for <openrisc@lists.librecores.org>; Thu, 22 Dec 2022 12:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671709670; x=1703245670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GvFMbOE0GzaAFA+/NgInY0v5QkDpeB2uXRoAiJmqw7k=;
 b=ejD2n4ylcxDtdGSsJ47KslTrEPGw/1VfRk9Xkoai8FFWmZGj+tMdlCH9
 /rho3Z2t9197aARBvERdF/jn/obhJYXhZDv2rY553gFamei3aWleN941Y
 SrodWb1BnEkhbu/l+zxS14R0YeJV5kxckSSefFWQcEmT2bVEvwsHg3x2t
 Ux14JejEPy4NxAlHZoJthGLrG6ihsCTzjTgMUhudJ+VQe3n2NBMfDd3re
 wPvOOo6rIXDu2ug9Qw4iunHrt+QNYDyjBN9UwwzSEiaE14rVEWIpKtm90
 zX+/Yq83j5NIMSjLlZTRTL/H3hvLet2KH9nxYCOxp6Zct8JeLDpSBMKCy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804454"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="318804454"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:47:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504326"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="629504326"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:47:24 -0800
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
Subject: [PATCH 01/19] arch/alpha: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:17 +0100
Message-Id: <20221222114635.1251934-2-andrzej.hajda@intel.com>
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
 arch/alpha/include/asm/cmpxchg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index 6e0a850aa9d38c..40e8159ef6e794 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -6,7 +6,7 @@
  * Atomic exchange routines.
  */
 
-#define ____xchg(type, args...)		__xchg ## type ## _local(args)
+#define ____xchg(type, args...)		__arch_xchg ## type ## _local(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ## type ## _local(args)
 #include <asm/xchg.h>
 
@@ -34,7 +34,7 @@
 
 #undef ____xchg
 #undef ____cmpxchg
-#define ____xchg(type, args...)		__xchg ##type(args)
+#define ____xchg(type, args...)		__arch_xchg ##type(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
 #include <asm/xchg.h>
 
@@ -48,7 +48,7 @@
 	__typeof__(*(ptr)) _x_ = (x);					\
 	smp_mb();							\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
+		__arch_xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
 	smp_mb();							\
 	__ret;								\
 })
-- 
2.34.1

