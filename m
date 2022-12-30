Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5E59654CBC
	for <lists+openrisc@lfdr.de>; Fri, 23 Dec 2022 08:17:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1A4242499F;
	Fri, 23 Dec 2022 08:17:31 +0100 (CET)
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by mail.librecores.org (Postfix) with ESMTPS id 25CDD214F6
 for <openrisc@lists.librecores.org>; Thu, 24 Nov 2022 02:21:58 +0100 (CET)
Date: Wed, 23 Nov 2022 17:21:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1669252917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCCb6cJQpNNyYRBbz4kRdgD2tyLQ9Ns2A7s10hH5kx0=;
 b=WLIGoxoQm3+/ru5YF2x6H+6yl4N5sAGKnAhwTr5uRYPr8dQqa/R3ysskmGjANDh6CBkZQy
 KJ0MBuI2R1IiCx1P42YUay6SolBrMpWVMI6fGEzq+7bsLesglGpb2m5siLqtS2z++OWNnR
 eN3d8mpNwNHZTr5snKaaNTKSv/nsBqw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 12/12] mm, slob: rename CONFIG_SLOB to
 CONFIG_SLOB_DEPRECATED
Message-ID: <Y37HJr+lBv7wGZcs@P9FQF9L96D.corp.robot.car>
References: <20221121171202.22080-1-vbabka@suse.cz>
 <20221121171202.22080-13-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121171202.22080-13-vbabka@suse.cz>
X-Migadu-Flow: FLOW_OUT
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>,
 openrisc@lists.librecores.org, linux-omap@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-arm-kernel@lists.infradead.org,
 patches@lists.linux.dev, Conor Dooley <conor@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Mon, Nov 21, 2022 at 06:12:02PM +0100, Vlastimil Babka wrote:
> As explained in [1], we would like to remove SLOB if possible.
> 
> - There are no known users that need its somewhat lower memory footprint
>   so much that they cannot handle SLUB (after some modifications by the
>   previous patches) instead.
> 
> - It is an extra maintenance burden, and a number of features are
>   incompatible with it.
> 
> - It blocks the API improvement of allowing kfree() on objects allocated
>   via kmem_cache_alloc().
> 
> As the first step, rename the CONFIG_SLOB option in the slab allocator
> configuration choice to CONFIG_SLOB_DEPRECATED. Add CONFIG_SLOB
> depending on CONFIG_SLOB_DEPRECATED as an internal option to avoid code
> churn. This will cause existing .config files and defconfigs with
> CONFIG_SLOB=y to silently switch to the default (and recommended
> replacement) SLUB, while still allowing SLOB to be configured by anyone
> that notices and needs it. But those should contact the slab maintainers
> and linux-mm@kvack.org as explained in the updated help. With no valid
> objections, the plan is to update the existing defconfigs to SLUB and
> remove SLOB in a few cycles.
> 
> To make SLUB more suitable replacement for SLOB, a CONFIG_SLUB_TINY
> option was introduced to limit SLUB's memory overhead.
> There is a number of defconfigs specifying CONFIG_SLOB=y. As part of
> this patch, update them to select CONFIG_SLUB and CONFIG_SLUB_TINY.
> 
> [1] https://lore.kernel.org/all/b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz/
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Conor Dooley <conor@kernel.org>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <linux-omap@vger.kernel.org>
> Cc: <openrisc@lists.librecores.org>
> Cc: <linux-riscv@lists.infradead.org>
> Cc: <linux-sh@vger.kernel.org>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks!
