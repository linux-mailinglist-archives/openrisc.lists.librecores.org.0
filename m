Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7C10062524B
	for <lists+openrisc@lfdr.de>; Fri, 11 Nov 2022 05:15:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2607824AA5;
	Fri, 11 Nov 2022 05:15:00 +0100 (CET)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mail.librecores.org (Postfix) with ESMTPS id D480B24A9B
 for <openrisc@lists.librecores.org>; Fri, 11 Nov 2022 05:14:58 +0100 (CET)
Received: by mail-oi1-f177.google.com with SMTP id q83so3907053oib.10
 for <openrisc@lists.librecores.org>; Thu, 10 Nov 2022 20:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p63dJQ8Zm1StkFJbBaYMAZgNwK/eOyFjpsy+2OYCi50=;
 b=h/qWkjLSgEyAJah89p+vgT6NQynzFunXIArGdkU0XeiYzi1H7rata405JYf6ClTI+B
 nmghiawtYZByjpqJy3mM7BNM5xVCvDvD5aX1mxU+IWUlbo6ovG939oMH3O/RCnrgOzYq
 2QGCfjxFTIkAlEppGbWQT936ooO6lf40KQHJMYPtn8VDLjFE7CKiXIFtP5ZrWi9mk4EY
 KA8kXg2gft8P/4vOssapiwPL32B4PF4uMXNw1CynoglzQ5aWS/o0ktEjr8oaGjh68qhq
 rstLTea6xPTAvAc8MODPL87vCtskFz/lJ3xavFe4O5bh/34Ujm4155uJhRhYk67NwVNS
 8mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p63dJQ8Zm1StkFJbBaYMAZgNwK/eOyFjpsy+2OYCi50=;
 b=bL5ZThc5BDSlpXbajP2TJvYBgEDaqiHIQG+7q+WC9Yj2sc4/EkZtrsjyo/vQP3oh+g
 TWPlHknpDhNd7tFozwToeK+ktjZgUm5YRKe5wYOCSdWNznN3s1LMg1ZQF+l/9KX+NjcZ
 Df58N69ec5QPMBFDl8CCuRam2WSrIjx4mynEUPJxJWRpkUXMgibe9536CdI08J1vOi8T
 /pCJ8AOiuWCZc5SJlN5xTTX2XErQ+igNAQNTibPdxPZq2/B7Nx/s5h+8JTsVvHbsKmQO
 FkVtn8hWFvgOiFR4UT1U+SX4RQfDp1372s2YIE3/CnBlw0eBiPCbnZvIL9M0wMpAJnbv
 1HYA==
X-Gm-Message-State: ACrzQf0sz7lIGKkmYehjd+KV/AmnAzo2JsciUK6A1l06Mtn+voETOXMa
 4/hUSJ3OMrsVpFGN6xsDTUw=
X-Google-Smtp-Source: AMsMyM7b8tbRaQRGbmuhAG9mhyQNZp61zj9zEvl1eF7QlhtBjlOwONQncQLSFtFBszzuP5wzulbUHw==
X-Received: by 2002:a05:6808:151e:b0:35a:7300:7208 with SMTP id
 u30-20020a056808151e00b0035a73007208mr2438895oiw.75.1668140097551; 
 Thu, 10 Nov 2022 20:14:57 -0800 (PST)
Received: from localhost ([12.97.180.36]) by smtp.gmail.com with ESMTPSA id
 v4-20020a9d6044000000b00661a05691fasm562487otj.79.2022.11.10.20.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 20:14:57 -0800 (PST)
Date: Thu, 10 Nov 2022 20:14:56 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v4 1/1] x86: cpuinfo: Ensure inputs to cpumask_next are
 valid
Message-ID: <Y23MQA8ZaQ135aJV@yury-laptop>
References: <20221103142504.278543-1-ajones@ventanamicro.com>
 <20221103142504.278543-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103142504.278543-2-ajones@ventanamicro.com>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <hca@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Thu, Nov 03, 2022 at 03:25:04PM +0100, Andrew Jones wrote:
> The valid cpumask range is [0, nr_cpu_ids) and cpumask_next()
> currently calls find_next_bit() with its input CPU ID number plus one
> for the bit number, giving cpumask_next() the range [-1, nr_cpu_ids - 1).
> seq_read_iter() and cpuinfo's start and next seq operations implement a
> pattern like
> 
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
> 
> which will eventually result in cpumask_next() being called with
> nr_cpu_ids - 1. A kernel compiled with commit 78e5a3399421 ("cpumask:
> fix checking valid cpu range"), but not its revert, commit
> 80493877d7d0 ("Revert "cpumask: fix checking valid cpu range"."),
> will generate a warning when DEBUG_PER_CPU_MAPS is enabled each time
> /proc/cpuinfo is read. Future-proof cpuinfo by checking its input to
> cpumask_next() is valid.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>

> ---
>  arch/x86/kernel/cpu/proc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> index 099b6f0d96bd..de3f93ac6e49 100644
> --- a/arch/x86/kernel/cpu/proc.c
> +++ b/arch/x86/kernel/cpu/proc.c
> @@ -153,6 +153,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> +	if (*pos == nr_cpu_ids)
> +		return NULL;
> +
>  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
>  	if ((*pos) < nr_cpu_ids)
>  		return &cpu_data(*pos);
> -- 
> 2.37.3
