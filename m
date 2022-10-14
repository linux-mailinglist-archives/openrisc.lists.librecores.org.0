Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5846861E663
	for <lists+openrisc@lfdr.de>; Sun,  6 Nov 2022 22:17:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 07B722062E;
	Sun,  6 Nov 2022 22:17:30 +0100 (CET)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by mail.librecores.org (Postfix) with ESMTPS id 7BA6B240AE
 for <openrisc@lists.librecores.org>; Fri, 14 Oct 2022 23:23:09 +0200 (CEST)
Received: from localhost.localdomain (178.176.75.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 15 Oct
 2022 00:23:07 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Oleg Nesterov <oleg@redhat.com>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, <openrisc@lists.librecores.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/13] openrisc: ptrace: user_regset_copyin_ignore() always
 returns 0
Date: Sat, 15 Oct 2022 00:22:30 +0300
Message-ID: <20221014212235.10770-9-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20221014212235.10770-1-s.shtylyov@omp.ru>
References: <20221014212235.10770-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.75.138]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/14/2022 21:00:39
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 173137 [Oct 14 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 500 500 6cc86d8f5638d79810308830d98d6b6279998c49
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1; 127.0.0.199:7.1.2; 178.176.75.138:7.7.3;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.138
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/14/2022 21:03:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/14/2022 3:23:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Mailman-Approved-At: Sun, 06 Nov 2022 22:17:28 +0100
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
Cc: Andrew Morton <akpm@linux-foundation.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

user_regset_copyin_ignore() always returns 0, so checking its result seems
pointless -- don't do this anymore...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 arch/openrisc/kernel/ptrace.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/openrisc/kernel/ptrace.c b/arch/openrisc/kernel/ptrace.c
index b971740fc2aa..85ace93fc251 100644
--- a/arch/openrisc/kernel/ptrace.c
+++ b/arch/openrisc/kernel/ptrace.c
@@ -66,10 +66,9 @@ static int genregs_set(struct task_struct *target,
 	int ret;
 
 	/* ignore r0 */
-	ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, 4);
+	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, 4);
 	/* r1 - r31 */
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
 					 regs->gpr+1, 4, 4*32);
 	/* PC */
 	if (!ret)
@@ -80,8 +79,7 @@ static int genregs_set(struct task_struct *target,
 	 * the Supervision register
 	 */
 	if (!ret)
-		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
-						4*33, -1);
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 4*33, -1);
 
 	return ret;
 }
-- 
2.26.3

