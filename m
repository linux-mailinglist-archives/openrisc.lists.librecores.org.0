Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A1873537287
	for <lists+openrisc@lfdr.de>; Sun, 29 May 2022 22:34:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 453E1248F1;
	Sun, 29 May 2022 22:34:09 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by mail.librecores.org (Postfix) with ESMTPS id 49CA92480A
 for <openrisc@lists.librecores.org>; Sun, 29 May 2022 22:34:08 +0200 (CEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24TJMjwU012617;
 Sun, 29 May 2022 20:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=x4N7bX0DRRebDZ+llHBEoOO1y8RqkpeB+Jlf+Vx+ui4=;
 b=hakF/8aPF5DH3ICHAn7P7Q7xBA4KtdA0je0+nJRBs+xaI2hHDxgItX2ciwK19sCxk0JA
 lJnlqKta8jHKJkMqJ1rgWh3qDwM1i/TtlTQ6ooSKLwvTWHLC31BcYNAGC/G9N1aAutXV
 V/4AJkKs1JGbbdy51HbI6h6b7Z42larzwd7F8tbvXbgPaisrk9ryWS8vf9H7FU54t9UR
 0Eo3hWRTOOaJavYhxG1gVT9JHKnOc8gKYbkkKxn8voKk4y3jdzUzhrmCMfV05FMX0fA5
 j1Oa7gTPBzc3qIRMostgXnmcMPZVXypM3JAAZSk7OQxWvEnIL9TkJkNVyyqJFOQLb2Mf xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gby3esrdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 May 2022 20:33:34 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24TKP7nu010580;
 Sun, 29 May 2022 20:33:33 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gby3esrd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 May 2022 20:33:33 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24TKLpBX018675;
 Sun, 29 May 2022 20:33:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3gbcakh5ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 May 2022 20:33:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24TKXR4r17105322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 29 May 2022 20:33:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5933511C04C;
 Sun, 29 May 2022 20:33:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEE2A11C04A;
 Sun, 29 May 2022 20:33:24 +0000 (GMT)
Received: from osiris (unknown [9.145.39.236])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 29 May 2022 20:33:24 +0000 (GMT)
Date: Sun, 29 May 2022 22:33:23 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpPYkzbrQmy4FjrI@osiris>
References: <20220527193936.30678-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527193936.30678-1-peterx@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oFSau6Dj_1rg8rX4SeOfmoPaYp5LEgWy
X-Proofpoint-GUID: M6Ru04-Ir3Ey8vHF11WRaj0WUz41oFky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-29_05,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1011 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=818 suspectscore=0 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205290119
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
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Chris Zankel <chris@zankel.net>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Fri, May 27, 2022 at 03:39:36PM -0400, Peter Xu wrote:
> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> index e173b6187ad5..4608cc962ecf 100644
> --- a/arch/s390/mm/fault.c
> +++ b/arch/s390/mm/fault.c
> @@ -433,6 +433,17 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  			goto out_up;
>  		goto out;
>  	}
> +
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED) {
> +		/*
> +		 * Gmap will need the mmap lock again, so retake it.  TODO:
> +		 * only conditionally take the lock when CONFIG_PGSTE set.
> +		 */
> +		mmap_read_lock(mm);
> +		goto out_gmap;
> +	}
> +
>  	if (unlikely(fault & VM_FAULT_ERROR))
>  		goto out_up;
>  

Guess the patch below on top of your patch is what we want.
Just for clarification: if gmap is not NULL then the process is a kvm
process. So, depending on the workload, this optimization makes sense.

diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 4608cc962ecf..e1d40ca341b7 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 
 	/* The fault is fully completed (including releasing mmap lock) */
 	if (fault & VM_FAULT_COMPLETED) {
-		/*
-		 * Gmap will need the mmap lock again, so retake it.  TODO:
-		 * only conditionally take the lock when CONFIG_PGSTE set.
-		 */
-		mmap_read_lock(mm);
-		goto out_gmap;
+		if (gmap) {
+			mmap_read_lock(mm);
+			goto out_gmap;
+		}
+		goto out;
 	}
 
 	if (unlikely(fault & VM_FAULT_ERROR))
