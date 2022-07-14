Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 71CD75743ED
	for <lists+openrisc@lfdr.de>; Thu, 14 Jul 2022 06:51:23 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AA8BB24785;
	Thu, 14 Jul 2022 06:51:21 +0200 (CEST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id CE77524329
 for <openrisc@lists.librecores.org>; Mon, 11 Jul 2022 05:46:55 +0200 (CEST)
Received: by mail-pf1-f173.google.com with SMTP id 70so3765860pfx.1
 for <openrisc@lists.librecores.org>; Sun, 10 Jul 2022 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lXaZY9eIuwP2fJopKwfWWT3qEb555n6mJNYuev1dBus=;
 b=SioxnzTe2ch2xEYudKZfsl67d1QZ4TMyJtotZWTK0aAwzTLr9jj8xZp+pV2EbQoBT0
 MAqRJsKlAj448br5lowpUBxxNEKiSIaSf4cPCV8M8MxZHjLrxh3lyCi8iKO61foW78+D
 U3wLwVIJShgAZq8T6IAOO45Y0W77tixdThRHmTwLzJ6R7JfZwOteG+R57W/788gzDSuM
 WSrrUIfKaYTC2JJcXRmfHiExmrpWtn7on9YUz3BRc1kulVxqkGhEPRDg5Zd7mbkhETJx
 kb2MG90IEqRvvepP4MKGh9DxFmcY/93lXsU9TywbTvUJeRXaVm5GeyLXgoa+sw77yvXJ
 swhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXaZY9eIuwP2fJopKwfWWT3qEb555n6mJNYuev1dBus=;
 b=iyKQbahM4Mz9dFN1ySvMoKUVsAyyy/4qNpzrWmMn4xFVf3EDXmvBTyaJb2Z+XBaUM9
 sMuI90WH5gwYDKjt6znqMu7h7Atf4G2yNhkbIL/UgfADtCYlJzdCSWpLrhNnSFOYmgWM
 jQ3tAleKnyKs5hdAQ7hfvLO6EmgTj7yeNZPFSzkE93lmeGQ7OKp5+b5iuOTQvJDjZqOm
 xy7TlOCKwiVMRi48/ufR8KpkEcombt5JlZC+R8fgJ+C4LIVnbv/+DZaMZcfHNeT1lRa5
 ZUEvnYTplBk90qmPJYxZCIgLBaHA2uK8aVcfn4DFKM+LmuzNMdMBW93QvN9NR0c7Yq4E
 BWQA==
X-Gm-Message-State: AJIora9jjma7FFv3K9YfcVNHeB2AqECyszz6bdAqSwXLuMhjjFDq7ZE5
 r1zTz73ei4s8qyFK5klrlW8=
X-Google-Smtp-Source: AGRyM1sZQM/y1E9SIJsc5yJdrFZSjEkOM1rd5dQPXVIU+O/k1albRoiLAbJq418n0LjL4QbX4nTFhg==
X-Received: by 2002:a05:6a00:1496:b0:52a:c3fb:8ec7 with SMTP id
 v22-20020a056a00149600b0052ac3fb8ec7mr6880047pfu.25.1657511214461; 
 Sun, 10 Jul 2022 20:46:54 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz.
 [47.72.206.164]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 20:46:53 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/4] mm: rmap: Allow platforms without mm_cpumask to defer
 TLB flush
Date: Mon, 11 Jul 2022 15:46:13 +1200
Message-Id: <20220711034615.482895-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711034615.482895-1-21cnbao@gmail.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Jul 2022 06:51:20 +0200
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
Cc: linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com,
 arnd@arndb.de, corbet@lwn.net, realmz6@gmail.com, linux-kernel@vger.kernel.org,
 yangyicong@hisilicon.com, Barry Song <v-songbaohua@oppo.com>,
 openrisc@lists.librecores.org, darren@os.amperecomputing.com,
 huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

From: Barry Song <v-songbaohua@oppo.com>

Platforms like ARM64 have hareware TLB shootdown broadcast. They
don't maintain mm_cpumask but just send tlbi and related sync
instructions for TLB flush. task's mm_cpumask is normally empty
in this case. We also allow deferred TLB flush on this kind of
platforms.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>>
---
 arch/arm/Kconfig       | 1 +
 arch/loongarch/Kconfig | 1 +
 arch/mips/Kconfig      | 1 +
 arch/openrisc/Kconfig  | 1 +
 arch/powerpc/Kconfig   | 1 +
 arch/riscv/Kconfig     | 1 +
 arch/s390/Kconfig      | 1 +
 arch/um/Kconfig        | 1 +
 arch/x86/Kconfig       | 1 +
 mm/Kconfig             | 3 +++
 mm/rmap.c              | 4 ++++
 11 files changed, 16 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7630ba9cb6cc..25c42747f488 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -13,6 +13,7 @@ config ARM
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
 	select ARCH_HAS_PHYS_TO_DMA
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1920d52653b4..4b737c0d17a2 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -7,6 +7,7 @@ config LOONGARCH
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index db09d45d59ec..1b196acdeca3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -9,6 +9,7 @@ config MIPS
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE if !EVA
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
 	select ARCH_HAS_STRNCPY_FROM_USER
 	select ARCH_HAS_STRNLEN_USER
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index e814df4c483c..82483b192f4a 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -9,6 +9,7 @@ config OPENRISC
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select ARCH_HAS_DMA_CLEAR_UNCACHED
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select COMMON_CLK
 	select OF
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c2ce2e60c8f0..19061ffe73a0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -127,6 +127,7 @@ config PPC
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
 	select ARCH_HAS_MMIOWB			if PPC64
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c22f58155948..7570c95a9cc8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 91c0b80a8bf0..48d91fa05bab 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -73,6 +73,7 @@ config S390
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEM_ENCRYPT
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME
 	select ARCH_HAS_SET_MEMORY
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 4ec22e156a2e..df29c729267b 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -8,6 +8,7 @@ config UML
 	select ARCH_EPHEMERAL_INODES
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_STRNCPY_FROM_USER
 	select ARCH_HAS_STRNLEN_USER
 	select ARCH_NO_PREEMPT
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be0b95e51df6..a91d73866238 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -81,6 +81,7 @@ config X86
 	select ARCH_HAS_KCOV			if X86_64
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
+	select ARCH_HAS_MM_CPUMASK
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API		if X86_64
 	select ARCH_HAS_PTE_DEVMAP		if X86_64
diff --git a/mm/Kconfig b/mm/Kconfig
index 169e64192e48..7bf54f57ca01 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -951,6 +951,9 @@ config ARCH_HAS_CURRENT_STACK_POINTER
 	  register alias named "current_stack_pointer", this config can be
 	  selected.
 
+config ARCH_HAS_MM_CPUMASK
+	bool
+
 config ARCH_HAS_VM_GET_PAGE_PROT
 	bool
 
diff --git a/mm/rmap.c b/mm/rmap.c
index 5bcb334cd6f2..13d4f9a1d4f1 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -692,6 +692,10 @@ static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
 	if (!(flags & TTU_BATCH_FLUSH))
 		return false;
 
+#ifndef CONFIG_ARCH_HAS_MM_CPUMASK
+	return true;
+#endif
+
 	/* If remote CPUs need to be flushed then defer batch the flush */
 	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
 		should_defer = true;
-- 
2.25.1

