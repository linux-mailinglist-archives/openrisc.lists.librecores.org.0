Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B65CD527775
	for <lists+openrisc@lfdr.de>; Sun, 15 May 2022 14:42:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0E01248F1;
	Sun, 15 May 2022 14:42:27 +0200 (CEST)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mail.librecores.org (Postfix) with ESMTPS id 43EDC24216
 for <openrisc@lists.librecores.org>; Sun, 15 May 2022 14:42:26 +0200 (CEST)
Received: by mail-pf1-f180.google.com with SMTP id p8so11678698pfh.8
 for <openrisc@lists.librecores.org>; Sun, 15 May 2022 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6s5Kt+Fz8ODBsnaEn4hTWh6elxNZ/IIbeZw2XTvUCZg=;
 b=lc4V5YUtnupgMS1c/MZU4qcj6d//G0LcTlJukHwOujvp6HpBir50JhV0btF13sYGaM
 +ISPLqzfWMDqUFxUmRI+AbO6W5vX00yMekcn+tyQQ+l/jjrIBdhaeGzx/TTFHj5Q1Bbi
 XUEKteAQBVsAH8CxeUEvgC0rh5qxejXb7V7zHsQzVKnoOIH0OA1v8Eep6sjG5vaatiZY
 PbtPtG8lid4FqjJhO3AHqHYXLFYzh7UEGvJWCUMkNLQ4rsRuOnXitTiC6ZHqOoduZZyb
 xEEnrCMWTFZbGjnhy9pIBKl+9qnJqh6l9wXMLska0Ihh1l9cJrFRnUZM738zT/7+wtwr
 BDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6s5Kt+Fz8ODBsnaEn4hTWh6elxNZ/IIbeZw2XTvUCZg=;
 b=KfRO+7ytS/i5vnkIFBWz+Ar6H/RK1r0RWaJE+ET2R6eTThzYbfdvnpcu7VTF1AiGTg
 2KNWTPasNzqSFckZrBXsqINJDzbJzgbYUAKq0YnVnlGz3s8CPRiYQquHDFG3ODyOWL7G
 4phCtLPlPQ7RKuHtmELBBSK/5QtfVND5lQm1J/Wg6A5oOI9961kZZYOZSrN/YVWvWDu1
 oRV8O+6pbaqOslsJgN1sR7xRXk04wecPbTixHhpedI/2w9bbHU9hpqSHuuVjgC6WG7tP
 ua3NxlqAo2V5CxMfyfli8bcI/Y8tHUqM8YzgAeRoBh2CGogeMMJbLUTzHfY1J4hRI1Bg
 mQtA==
X-Gm-Message-State: AOAM532s9cQIqclXdAh2HlDfVqJqQLyRAISSBmooiY1IbrG5sVG2Zt38
 g2npVj0/F3pHWBG+CKsH+BI=
X-Google-Smtp-Source: ABdhPJwJ4gVjq1yTaJlnMlKZjQnOGd/oZ8PLVA3fKrwt2RCNYbcWKLfnUWK1/23W4NuqBcXxbOz8xg==
X-Received: by 2002:a63:e348:0:b0:3db:7729:c0fe with SMTP id
 o8-20020a63e348000000b003db7729c0femr11490004pgj.482.1652618544750; 
 Sun, 15 May 2022 05:42:24 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a17090ade0e00b001df4a599a7asm607145pjv.17.2022.05.15.05.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 05:42:24 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/13] openrisc: Pretty print show_registers memory dumps
Date: Sun, 15 May 2022 21:41:50 +0900
Message-Id: <20220515124158.3167452-6-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220515124158.3167452-1-shorne@gmail.com>
References: <20220515124158.3167452-1-shorne@gmail.com>
MIME-Version: 1.0
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Openrisc <openrisc@lists.librecores.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Currently show registers, print memory dumps character by character and
there is no address information, so its a bit difficult to use.  For
example before a stack dump looks as follows.

    [   13.650000] Stack:
    [   13.650000] Call trace
    [   13.690000] [<(ptrval)>] ? put_timespec64+0x44/0x60
    [   13.690000] [<(ptrval)>] ? _data_page_fault_handler+0x104/0x10c
    [   13.700000]
    [   13.700000] Code:
    [   13.700000] 13
    [   13.700000] ff
    [   13.700000] ff
    [   13.700000] f9
    [   13.710000] 84
    [   13.710000] 82
    [   13.710000] ff
    [   13.710000] bc
    [   13.710000] 07
    [   13.710000] fd
    [   13.720000] 4e
    [   13.720000] 67
    [   13.720000] 84
    [   13.720000] 62
    [   13.720000] ff
    ...

This change updates this to print the address and data a word at time.

    [    0.830000] Stack:
    [    0.830000] Call trace:
    [    0.830000] [<(ptrval)>] load_elf_binary+0x744/0xf5c
    [    0.830000] [<(ptrval)>] ? __kernel_read+0x144/0x184
    [    0.830000] [<(ptrval)>] bprm_execve+0x27c/0x3e4
    [    0.830000] [<(ptrval)>] kernel_execve+0x16c/0x1a0
    [    0.830000] [<(ptrval)>] run_init_process+0xa0/0xec
    [    0.830000] [<(ptrval)>] ? kernel_init+0x0/0x14c
    [    0.830000] [<(ptrval)>] kernel_init+0x7c/0x14c
    [    0.830000] [<(ptrval)>] ? calculate_sigpending+0x30/0x40
    [    0.830000] [<(ptrval)>] ret_from_fork+0x1c/0x84
    [    0.830000]
    [    0.830000]  c1033dbc:       c1033dec
    [    0.830000]  c1033dc0:       c015258c
    [    0.830000]  c1033dc4:       c129da00
    [    0.830000]  c1033dc8:       00000002
    [    0.830000]  c1033dcc:       00000000
    [    0.830000]  c1033dd0:       c129da00
    [    0.830000]  c1033dd4:       00000000
    [    0.830000]  c1033dd8:       00000000
    [    0.830000] (c1033ddc:)      00001e04
    [    0.830000]  c1033de0:       001501fc
    [    0.830000]  c1033de4:       c1033e68
    [    0.830000]  c1033de8:       c0152e60
    [    0.830000]  c1033dec:       c129da5c
    [    0.830000]  c1033df0:       c0674a20
    [    0.830000]  c1033df4:       c1033e50
    [    0.830000]  c1033df8:       c00e3d6c
    [    0.830000]  c1033dfc:       c129da5c
    [    0.830000]  c1033e00:       00000003
    [    0.830000]  c1033e04:       00150000
    [    0.830000]  c1033e08:       00002034
    [    0.830000]  c1033e0c:       001501fc
    [    0.830000]  c1033e10:       00000000
    [    0.830000]  c1033e14:       00150000
    [    0.830000]  c1033e18:       0014ebbc
    [    0.830000]  c1033e1c:       00002000
    [    0.830000]  c1033e20:       00000003
    [    0.830000]  c1033e24:       c12a07e0
    [    0.830000]  c1033e28:       00000000
    [    0.830000]  c1033e2c:       00000000
    [    0.830000]  c1033e30:       00000000
    [    0.830000]  c1033e34:       40040000
    [    0.830000]  c1033e38:       00000000
    [    0.830000]
    [    0.830000] Code:
    [    0.830000]  c00047a4:       9c21fff8
    [    0.830000]  c00047a8:       d4012000
    [    0.830000]  c00047ac:       d4011804
    [    0.830000]  c00047b0:       e4040000
    [    0.830000]  c00047b4:       10000005
    [    0.830000]  c00047b8:       9c84ffff
    [    0.830000] (c00047bc:)      d8030000
    [    0.830000]  c00047c0:       03fffffc
    [    0.830000]  c00047c4:       9c630001
    [    0.830000]  c00047c8:       9d640001
    [    0.830000]  c00047cc:       84810000
    [    0.830000]  c00047d0:       84610004

Now we are also printing a bit of the stack as well as the code.  The
stack is output to help with debugging.  There may be concern about
exposing sensitive information on the stack, but we are already dumping
all register content which would have similar sensitive information.  So
I am going ahead as this proves useful in investigation.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/openrisc/kernel/traps.c | 46 ++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/arch/openrisc/kernel/traps.c b/arch/openrisc/kernel/traps.c
index 0446a3c34372..f2478bba77b9 100644
--- a/arch/openrisc/kernel/traps.c
+++ b/arch/openrisc/kernel/traps.c
@@ -46,6 +46,14 @@ void print_trace(void *data, unsigned long addr, int reliable)
 	       (void *) addr);
 }
 
+static void print_data(unsigned long base_addr, unsigned long word, int i)
+{
+	if (i == 0)
+		printk("(%08lx:)\t%08lx", base_addr + (i * 4), word);
+	else
+		printk(" %08lx:\t%08lx", base_addr + (i * 4), word);
+}
+
 /* displays a short stack trace */
 void show_stack(struct task_struct *task, unsigned long *esp, const char *loglvl)
 {
@@ -99,22 +107,36 @@ void show_registers(struct pt_regs *regs)
 		printk("\nStack: ");
 		show_stack(NULL, (unsigned long *)esp, KERN_EMERG);
 
+		if (esp < PAGE_OFFSET)
+			goto bad_stack;
+
+		printk("\n");
+		for (i = -8; i < 24; i += 1) {
+			unsigned long word;
+
+			if (__get_user(word, &((unsigned long *)esp)[i])) {
+bad_stack:
+				printk(" Bad Stack value.");
+				break;
+			}
+
+			print_data(esp, word, i);
+		}
+
 		printk("\nCode: ");
 		if (regs->pc < PAGE_OFFSET)
 			goto bad;
 
-		for (i = -24; i < 24; i++) {
-			unsigned char c;
-			if (__get_user(c, &((unsigned char *)regs->pc)[i])) {
+		for (i = -6; i < 6; i += 1) {
+			unsigned long word;
+
+			if (__get_user(word, &((unsigned long *)regs->pc)[i])) {
 bad:
 				printk(" Bad PC value.");
 				break;
 			}
 
-			if (i == 0)
-				printk("(%02x) ", c);
-			else
-				printk("%02x ", c);
+			print_data(regs->pc, word, i);
 		}
 	}
 	printk("\n");
@@ -185,13 +207,11 @@ void nommu_dump_state(struct pt_regs *regs,
 	printk("\nCode: ");
 
 	for (i = -24; i < 24; i++) {
-		unsigned char c;
-		c = ((unsigned char *)(__pa(regs->pc)))[i];
+		unsigned long word;
+
+		word = ((unsigned long *)(__pa(regs->pc)))[i];
 
-		if (i == 0)
-			printk("(%02x) ", c);
-		else
-			printk("%02x ", c);
+		print_data(regs->pc, word, i);
 	}
 	printk("\n");
 }
-- 
2.31.1

