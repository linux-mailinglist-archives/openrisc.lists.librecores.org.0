Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C59566771AA
	for <lists+openrisc@lfdr.de>; Sun, 22 Jan 2023 19:51:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 79B7721572;
	Sun, 22 Jan 2023 19:51:12 +0100 (CET)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id ACBF3200C3
 for <openrisc@lists.librecores.org>; Sun, 22 Jan 2023 19:51:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cy2F0NK90EWaw0M5GPoEQP9ffyepR3s0fUS7pZNqVNM=; b=mgsygI+GVpRKAc6PqndPLE/EGN
 RBXy4FaTuRYaN2huyWrOk+neGZ1ufgqmyi0yXaCxDKbFxKLUFjjgGati04nsAxMUVMX6F93HAT5MV
 jCcjeKcAKc8BuBDKNvpyU4OjSZ3Cz+FrSGYf7cnR14hsABQZhPfPnMdvz6HtQe9qMx/+pGJhPDPZF
 /qyCY0jr74qxGY8j5oRSoOBymBNR8AWbho08oGYqS/eKId6CpeqD2QoBShcQEl28G2ynMmhKfr3vd
 JwyOoMKWaS5EaZC4VS2qmXffZvRjoZ/Ill46hfsEaDEG4akgzhKR6ntCiBFX87m79qo6FBnSd5kkP
 88vn84dg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36094)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pGO0i-0008DZ-DC; Fri, 13 Jan 2023 17:38:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pGO0d-0003KS-Da; Fri, 13 Jan 2023 17:38:31 +0000
Date: Fri, 13 Jan 2023 17:38:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 04/26] arm/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <Y8GXF/AgLKgWQW5p@shell.armlinux.org.uk>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113171026.582290-5-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Fri, Jan 13, 2023 at 06:10:04PM +0100, David Hildenbrand wrote:
> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit from the
> offset. This reduces the maximum swap space per file to 64 GiB (was 128
> GiB).
> 
> While at it drop the PTE_TYPE_FAULT from __swp_entry_to_pte() which is
> defined to be 0 and is rather confusing because we should be dealing
> with "Linux PTEs" not "hardware PTEs". Also, properly mask the type in
> __swp_entry().
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
