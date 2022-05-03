Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A2616518EAA
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 22:22:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 50828248E8;
	Tue,  3 May 2022 22:22:44 +0200 (CEST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mail.librecores.org (Postfix) with ESMTPS id 9D42E247E5
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 22:22:42 +0200 (CEST)
Received: by mail-pf1-f170.google.com with SMTP id bo5so15647021pfb.4
 for <openrisc@lists.librecores.org>; Tue, 03 May 2022 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JkBff3qImxQuWQ850aH9hM77ZaTQE/H3vVf/5bIoIx4=;
 b=lKWz0KMCxNH3FOPMfTEPkldV8Iy4Y0SNNJUAdhqylHZK42/3Vy4tIEoztSTFbzayV6
 S4yQbf3sfk+cAy+sme45mLmZYjC7//xFwn6KStLjJwSmTqfsUG6Ri+YxCPSRMmU93aJm
 uCyZr2M+0YO+mYKEj6UUA7ianQlHf3f5f5NDo8xehmKQGwBDwSLhDJWyNmX9nKBj4N50
 ao+dQIKEtQmzByJ+rVhWgGOdcJuRhs6bzmjMkmDSSy6kwV/6MW2ojxVKW5uior3xSqj8
 dtnddepsECSkn0cw0JK7WDJ4n5WLL5+0sW95+kQkSjDtxWW+LAcJtgazjHEMWeFze7vj
 YMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkBff3qImxQuWQ850aH9hM77ZaTQE/H3vVf/5bIoIx4=;
 b=Uo18cL33NZCE1hos+YVYexSjxRVtsDkJyyYYl8vkWhgi8Ay9jGtR7Z/Ans7NChG2P4
 CqDYZAIKLYjd/5b1EYf++BnJ4q2IdPZ9EJvqP4+aPnnwWF3Yne273CCdoNiSWK3XwXET
 SrQrgDuNNz1YydnDYZVhX71xuwtyCInm74Ztb/MXdmUkWp1XIaWrw8eluDS0kJkVka+w
 6JnCEAhlf3ILYsRuMSGairhtrC3douYX+ylZeNQ3KaCV0lTgzeAyTc8+y4X5WoK9L230
 uaAtinEuLBYGC2zn8y7Om7nMalIIw/FvhR+u1uOyGJTQtlMOsgEOjQXShT47vS8rnWD4
 FS2Q==
X-Gm-Message-State: AOAM530WTrcLLefiyMBgANa1nanOWC8HcHaTI530k63ClRrJjlOaCXer
 z4zVJ9mKH2ztZnN6jI4LXHA=
X-Google-Smtp-Source: ABdhPJwWx9UEPzbcCMg0rWVf1zzDeNXV3oFkZ2zknz9cCCz1nZM97TGCUVts6iHt+zgFqVuwVm4iAw==
X-Received: by 2002:a05:6a00:1a0a:b0:4fc:d6c5:f3f1 with SMTP id
 g10-20020a056a001a0a00b004fcd6c5f3f1mr17582526pfv.45.1651609361083; 
 Tue, 03 May 2022 13:22:41 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170902c7ca00b0015e8d4eb246sm6686691pla.144.2022.05.03.13.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:22:40 -0700 (PDT)
Date: Wed, 4 May 2022 05:22:38 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] hw/openrisc: use right OMPIC size variable
Message-ID: <YnGPDumfp1+6DUQG@antec>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <20220503094533.402157-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503094533.402157-1-Jason@zx2c4.com>
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
Cc: openrisc@lists.librecores.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Tue, May 03, 2022 at 11:45:33AM +0200, Jason A. Donenfeld wrote:
> This appears to be a copy and paste error. The UART size was used
> instead of the much smaller OMPIC size. But actually that smaller OMPIC
> size is wrong too and doesn't allow the IPI to work in Linux. So set it
> to the old value.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/openrisc/openrisc_sim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 99b14940f4..3218db6656 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -78,7 +78,7 @@ static const struct MemmapEntry {
>      [OR1KSIM_DRAM] =      { 0x00000000,          0 },
>      [OR1KSIM_UART] =      { 0x90000000,      0x100 },
>      [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
> -    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
> +    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },

Right, I missed this as part of my series.  OMPIC will allocate 2 32-bit
registers per CPU.  I documented this here:

  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-ompic.c

I think what we will want here is something like:

[OR1KSIM_OMPIC] =     { 0x98000000, 8 * OR1KSIM_CPUS_MAX },

>  };
>  
>  static struct openrisc_boot_info {
> @@ -410,7 +410,7 @@ static void openrisc_sim_init(MachineState *machine)
>  
>      if (smp_cpus > 1) {
>          openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
> -                                or1ksim_memmap[OR1KSIM_UART].size,
> +                                or1ksim_memmap[OR1KSIM_OMPIC].size,
>                                  smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
>      }
>  
> -- 
> 2.35.1
> 
