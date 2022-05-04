Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5D451B1C7
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 00:24:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F12B8248F5;
	Thu,  5 May 2022 00:24:55 +0200 (CEST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mail.librecores.org (Postfix) with ESMTPS id 58BF6247FE
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 00:24:54 +0200 (CEST)
Received: by mail-pf1-f181.google.com with SMTP id x23so2201820pff.9
 for <openrisc@lists.librecores.org>; Wed, 04 May 2022 15:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qvo1dzGzL2JmCNjYZk1fNrTcxUgcm4KOWzurldTYI3s=;
 b=gK03qTKIXewQFhPyvT47pEbIcdipk3r2FH2iFUMyT+KEiD/2rHJLN7rbUJq7v/HZMw
 r4EUmyTvIeET2LHKdQhORxf/vAo5/3E+/V6CmKSWJkDmvhaMbydTNjEgvfMO271wKD7A
 4/BvxyEA2KR1JDzk88Ui7WAUpU18dAk1bcdpPdVkePfdjUsoR9k+tUvAi2CvEgPkEvd3
 iWL/4IADtrrnj8Y38qG0gLcdQP8eb/EnCH3qsYNciZCGkxRxC7DDwj3d15AegUnFWtEv
 P1XSQ5vMJ8rav/dxEJ4SWmyQIdLzqprROriIJCV3AK9bRoDgHbU88ymG8rB/6iN759XO
 I0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qvo1dzGzL2JmCNjYZk1fNrTcxUgcm4KOWzurldTYI3s=;
 b=B6Pm0UuUWpRD7YQWElvntMSYXar5xn94OqbfnhccVMl+nOa/mH+PpeOhB4vdfs3Rpn
 LN8AUz/MPFDgjbuSuqtAuiL1rUzjM4xea5fKhx6ws60UFyY4wOMd6JusqjVhYghPMc/S
 UJiD4xLuSm3qTuxxtXkI0FCAIN23x/kVZZLe4JqtpUSKN1wTPyECMbqxiDd+oTCXWd9d
 Ppue5+Fbnlb2bd0zpvY+Pik3qzwW6bmy3tq2so1oEZym5jfnQ16FmSwQuo6lp+fHQBv+
 SU3KkVrzz1d1hKFE6x8W8fEnK0U4ZOeSu/yxHTa60hcDxnp6uivUKlmvJNw6qZikLK19
 +mew==
X-Gm-Message-State: AOAM532gK5lmPgC0uop3xVTCYJsAkWJ131rNPb096u9ndrUUMga6Lp6H
 qLa/V7LPxxeHMr0noIj89JM=
X-Google-Smtp-Source: ABdhPJwFc5JLjAEky7LScOnRsmDKdESGn+FrABNggxtJwcgl3s8HkaiqtnUdTAsUBOwMcsKhZM3YeQ==
X-Received: by 2002:a65:4787:0:b0:39d:96b7:bfaa with SMTP id
 e7-20020a654787000000b0039d96b7bfaamr20027629pgs.495.1651703092915; 
 Wed, 04 May 2022 15:24:52 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a17090b050700b001d2bff34228sm3862102pjz.9.2022.05.04.15.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:24:52 -0700 (PDT)
Date: Thu, 5 May 2022 07:24:50 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] openrisc: remove bogus nops and shutdowns
Message-ID: <YnL9MuVLtiGWD2EV@antec>
References: <20220504110911.283525-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504110911.283525-1-Jason@zx2c4.com>
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Wed, May 04, 2022 at 01:09:11PM +0200, Jason A. Donenfeld wrote:
> Nop 42 is some leftover debugging thing by the looks of it. Nop 1 will
> shut down the simulator, which isn't what we want, since it makes it
> possible to handle errors.

Do you mean impossible to handler errors?

> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

This looks good to me, I didn't add these debug's I think we can remove them.

-Stafford

> ---
>  arch/openrisc/mm/fault.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/openrisc/mm/fault.c b/arch/openrisc/mm/fault.c
> index 80bb66ad42f6..860da58d7509 100644
> --- a/arch/openrisc/mm/fault.c
> +++ b/arch/openrisc/mm/fault.c
> @@ -223,8 +223,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
>  	{
>  		const struct exception_table_entry *entry;
>  
> -		__asm__ __volatile__("l.nop 42");
> -
>  		if ((entry = search_exception_tables(regs->pc)) != NULL) {
>  			/* Adjust the instruction pointer in the stackframe */
>  			regs->pc = entry->fixup;
> @@ -252,9 +250,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
>  	 */
>  
>  out_of_memory:
> -	__asm__ __volatile__("l.nop 42");
> -	__asm__ __volatile__("l.nop 1");
> -
>  	mmap_read_unlock(mm);
>  	if (!user_mode(regs))
>  		goto no_context;
> -- 
> 2.35.1
> 
