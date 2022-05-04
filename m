Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBE551B1C1
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 00:23:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D7B0248F5;
	Thu,  5 May 2022 00:23:11 +0200 (CEST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mail.librecores.org (Postfix) with ESMTPS id A3604247FE
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 00:23:08 +0200 (CEST)
Received: by mail-pf1-f174.google.com with SMTP id a11so2217251pff.1
 for <openrisc@lists.librecores.org>; Wed, 04 May 2022 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kYPjshZPWZRxlyOXuRE0i0eYpRN407/bZgJI2j/y13A=;
 b=TGdx4OjT67TfDvR1hrCi4fDOrvdlNUGymmur+DNADiERpHTuyXnajjbOZkMM+6NsO5
 fhG9LS4ly1R292cU4G6kKlhkI5cesNE7mRnEfxv3POLUi6sejYKhHrLMvNSF+4eaPTFN
 0s7lRdezYScBPeLca6vggADHoWL+r4HjM18B6cw+yZss2P/06FiSeurWACi6jpjC2Og0
 NxlI287XkSZrhF3IwmY+SU1K/pderVT4wXhgxRvnqCuvvq3JNw2UyyOF8UJv73G1UjBh
 B0lS6K7TwC98PQRUosTwe43ig69RXOdL8njeoXaX3Fd184wwAhO9lmHZKu5TZTjJVt2k
 faTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kYPjshZPWZRxlyOXuRE0i0eYpRN407/bZgJI2j/y13A=;
 b=QZ8k6W1/L4QMFfpxpSJxBb6fclt/t7XvVDhbDpg81U2N9xgiZKP1mnzTBintc8OWNv
 OQpzBylVu+r4lyGFiaKMURZ3HQRKUYfVMrNi39gYmv3G+lkE6K8VZSg3/Rmju8O5Gqp4
 Hjkg6fzfzYsl2HJxYvULWSUjnTka7B7gyTNAdnW8zvDATppzEncCfK9UZwsRRhFgrvmf
 6P6g9YjO4pgR2shoNRGUSx3u4fa4wEYHIc9MrshqPvWAp08VZ3MxQbe89KmuUirYBD1O
 11aE4ibIzf9ZtrGefrAdAWfcIX9ZRgDPzfQeMvMwDD8FwE948L921+u3gRNfhKYoUp8U
 cXaA==
X-Gm-Message-State: AOAM531x7Tz5KigM1YrgrTIK7Nk6Te2umLsqJnhS5Ri1yDLZSAMV5GhK
 bx/uPBq4k92WcRTDyLgDDIY=
X-Google-Smtp-Source: ABdhPJzBrP7vU8o1Xyyb1tFlyFDyDQBvUGTHNDWxv3wj4jdX2VrM28VlZnJTms3kTCp5BKT977XdQg==
X-Received: by 2002:a65:524b:0:b0:383:1b87:2d21 with SMTP id
 q11-20020a65524b000000b003831b872d21mr19539514pgp.482.1651702987068; 
 Wed, 04 May 2022 15:23:07 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a17090a7f9300b001cd60246575sm3806415pjl.17.2022.05.04.15.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:23:06 -0700 (PDT)
Date: Thu, 5 May 2022 07:23:04 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] hw/openrisc: use right OMPIC size variable
Message-ID: <YnL8yLrfC0EcyFgy@antec>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <20220503094533.402157-1-Jason@zx2c4.com> <YnGPDumfp1+6DUQG@antec>
 <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Wed, May 04, 2022 at 01:10:04PM +0200, Jason A. Donenfeld wrote:
> On Tue, May 3, 2022 at 10:22 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > On Tue, May 03, 2022 at 11:45:33AM +0200, Jason A. Donenfeld wrote:
> > > This appears to be a copy and paste error. The UART size was used
> > > instead of the much smaller OMPIC size. But actually that smaller OMPIC
> > > size is wrong too and doesn't allow the IPI to work in Linux. So set it
> > > to the old value.
> > >
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > >  hw/openrisc/openrisc_sim.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > > index 99b14940f4..3218db6656 100644
> > > --- a/hw/openrisc/openrisc_sim.c
> > > +++ b/hw/openrisc/openrisc_sim.c
> > > @@ -78,7 +78,7 @@ static const struct MemmapEntry {
> > >      [OR1KSIM_DRAM] =      { 0x00000000,          0 },
> > >      [OR1KSIM_UART] =      { 0x90000000,      0x100 },
> > >      [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
> > > -    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
> > > +    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },
> >
> > Right, I missed this as part of my series.  OMPIC will allocate 2 32-bit
> > registers per CPU.  I documented this here:
> >
> >   - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-ompic.c
> >
> > I think what we will want here is something like:
> >
> > [OR1KSIM_OMPIC] =     { 0x98000000, 8 * OR1KSIM_CPUS_MAX },
> 
> Do you want a v3 or are you going to fix it up yourself?

I'll fix it up.

-Stafford
