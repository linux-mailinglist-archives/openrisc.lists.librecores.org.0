Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCF053874E
	for <lists+openrisc@lfdr.de>; Mon, 30 May 2022 20:30:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E190C247F5;
	Mon, 30 May 2022 20:29:59 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by mail.librecores.org (Postfix) with ESMTPS id E036E240FC
 for <openrisc@lists.librecores.org>; Mon, 30 May 2022 20:29:57 +0200 (CEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24UIM0H1024517;
 Mon, 30 May 2022 18:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J3XEFiqlO85yR0rlrt+0Ucb3kcbo/uXfSzDk57v+UvI=;
 b=sK08a5JRQZv/pRZYSijJfgzCNWcnImFCMS1209YIqfs77/e2+DqGCKxKlBXdJgBmlco8
 lBUxmyGoc+OLGeLWYBYYR26O3FsvegFajhqOddNqC68LJDao5jNt43AilvT83QFtIU09
 ymysBZ+7yYvC1vU7jJWa8h114YLyiWf0mvxibmh4UXnXn2YZzAzo8CIdHOnqkmFzsY1r
 B+BMFqTlkhhhT5CMeGiBcg1sFURj8WmM61cUPcqTMXIorBEaBI5LTzeO9gIr7HvJfINf
 FIjGzFOAKcrEWvMA8wWWcaPvQrckVA5zWZJHRK+ah1+o9L5zMidx1M1UKYE9RYi3B87E oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gd34y82yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 18:29:40 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24UIQonu010446;
 Mon, 30 May 2022 18:29:39 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gd34y82y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 18:29:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24UIM2B8011304;
 Mon, 30 May 2022 18:29:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3gbcb7j9t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 18:29:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24UITYUm39059828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 May 2022 18:29:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12CBA5204F;
 Mon, 30 May 2022 18:29:34 +0000 (GMT)
Received: from [9.171.42.121] (unknown [9.171.42.121])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D9F875204E;
 Mon, 30 May 2022 18:29:30 +0000 (GMT)
Message-ID: <58b163b1-22ec-7634-dcd3-5a0a54adec45@linux.ibm.com>
Date: Mon, 30 May 2022 20:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
 <YpToVpjXmdFqGOpY@xz-m1.local> <YpTqNKMTt8PoA41n@xz-m1.local>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <YpTqNKMTt8PoA41n@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BcnqcIajExbqAnGujS-ZUqcYMX48oxDt
X-Proofpoint-ORIG-GUID: iK5fU7K0gq48iA5OulnJebFyFFDVydua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-30_07,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300096
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
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
 Chris Zankel <chris@zankel.net>, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Richard Henderson <rth@twiddle.net>, Brian Cain <bcain@quicinc.com>,
 Michal Simek <monstr@monstr.eu>,
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



Am 30.05.22 um 18:00 schrieb Peter Xu:
> On Mon, May 30, 2022 at 11:52:54AM -0400, Peter Xu wrote:
>> On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
>>>
>>>
>>> Am 29.05.22 um 22:33 schrieb Heiko Carstens:
>>> [...]
>>>>
>>>> Guess the patch below on top of your patch is what we want.
>>>> Just for clarification: if gmap is not NULL then the process is a kvm
>>>> process. So, depending on the workload, this optimization makes sense.
>>>>
>>>> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
>>>> index 4608cc962ecf..e1d40ca341b7 100644
>>>> --- a/arch/s390/mm/fault.c
>>>> +++ b/arch/s390/mm/fault.c
>>>> @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>>>>    	/* The fault is fully completed (including releasing mmap lock) */
>>>>    	if (fault & VM_FAULT_COMPLETED) {
>>>> -		/*
>>>> -		 * Gmap will need the mmap lock again, so retake it.  TODO:
>>>> -		 * only conditionally take the lock when CONFIG_PGSTE set.
>>>> -		 */
>>>> -		mmap_read_lock(mm);
>>>> -		goto out_gmap;
>>>> +		if (gmap) {
>>>> +			mmap_read_lock(mm);
>>>> +			goto out_gmap;
>>>> +		}
>>>> +		goto out;
> 
> Hmm, right after I replied I found "goto out" could be problematic, since
> all s390 callers of do_exception() will assume it an error condition (side
> note: "goto out_gmap" contains one step to clear "fault" to 0).  I'll
> replace this with "return 0" instead if it looks good to both of you.
> 
> I'll wait for a confirmation before reposting.  Thanks,

Yes, that sounds good and thank you for double checking.
