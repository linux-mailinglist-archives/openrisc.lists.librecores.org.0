Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6408EE26DE
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 01:05:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E27D720725;
	Thu, 24 Oct 2019 01:05:53 +0200 (CEST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mail.librecores.org (Postfix) with ESMTPS id 19C412048C
 for <openrisc@lists.librecores.org>; Thu, 24 Oct 2019 01:05:52 +0200 (CEST)
Received: by mail-ua1-f49.google.com with SMTP id n2so6556362ual.11
 for <openrisc@lists.librecores.org>; Wed, 23 Oct 2019 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxN/luI/LQ7VbsZKAXs/dTrXgzegsMPwZT9GhhhmTks=;
 b=Q/B6DskkJOhQ9WpKW1DKStCrmytN4vELvk6r/3Ou7eluFLiBgsEezM+chv4alQRsXp
 qtahaG5FW0Mt2OX+xecJH1ruPgLQpZu8PgrUNRhV0cpam9H46udxDFfc9+a4JVQnk6O5
 1DoLM+a8Vk2NIBG+gT92nVuHJsHGrKL+g7ndo3Q8fGu8CJ9FAwSQFBxMzElXMfqD3+9o
 4xywYobRTSg2ZQi5mdc+fPpTSFxwZTqF3iX1fDwFipOkuWV6VmpKsLI9iWc9iGFc2PEh
 UhuY5Rb8oZzNEmBAkoQgoYSEh4xC2BHc2YpqCunSwCDg+im7WF0cXf1wfqU4/AiMmog2
 3AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxN/luI/LQ7VbsZKAXs/dTrXgzegsMPwZT9GhhhmTks=;
 b=MjwR8Zl9LUd5NQ3psATPqkNPDxyD53OhDZliIct6ezSWtoEakLTO5jSHMCcjeIv09j
 hT3VJD7VBt67N8cXQxA1q62LG5dR/b3PWPxFNDLfF/Xj9Hrz4Uw/J1VAI9vbH/LBSKIn
 AEBCQMy3AQYMnU8mTrimrmgg39OzJrpaDWBs2/09VB//mzkirtDqBBPdPOyUgJ8m8Akt
 gubGUFArZlqoCV/9CYsBUn6QVoCna0E8PJ+3RAppGvea8ibzOmuZP28NYBwcV/y5mB+f
 cweWGGrlPgMICyyGsJYL6iFbdzwj//tvQlfl1e7LI0x33f+bGMvIiV2dC+9Ze6V0vrvL
 X/RQ==
X-Gm-Message-State: APjAAAWKJSNLSbwTjqH7pktvcwcrU7YzFYfEXPI0ZEUQ4mfp6ra/70qV
 faL7487n8bEm0T+8Z5AnWBa+7I+q/iK2pM/X6qu9qA==
X-Google-Smtp-Source: APXvYqwm5XtMRDlKUkHiG3zWAqGVoMRcnb5YktlG1ThMlrkslRClpQu2NrupvJGOExH1rdgconeH+pv8oVRvVk8uelE=
X-Received: by 2002:ab0:784a:: with SMTP id y10mr3430615uaq.97.1571871950186; 
 Wed, 23 Oct 2019 16:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <009d01d58416$7125fe80$5371fb80$@2se.es>
 <CAAfxs76G9Tyygv-5F+y-v9WkKyqO99W2aiBtejB54-qV-OBiFQ@mail.gmail.com>
 <00ef01d584fb$b271ae30$17550a90$@2se.es>
 <CAAfxs75YD4D1twr2q=KcoN-QmWTq-cpEAEw1+3H7kZju=DmYwA@mail.gmail.com>
 <011401d585a2$0a071490$1e153db0$@2se.es>
 <CAAfxs77SF7o=Oy4wuOe6BjJHdP7GE+7a0QV=Q1G41swFmU4XhA@mail.gmail.com>
 <013f01d58976$1c2c7700$54856500$@2se.es>
 <20191023210532.GI24874@lianli.shorne-pla.net>
In-Reply-To: <20191023210532.GI24874@lianli.shorne-pla.net>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 24 Oct 2019 08:05:37 +0900
Message-ID: <CAAfxs76n4Dn0kCavh0TSk0kBFZZq0QbsSdrSMKK-WAdY0toAsQ@mail.gmail.com>
To: ecalvo@2se.es
Subject: Re: [OpenRISC] PCCR and PCRM registers
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============0774427709000608969=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============0774427709000608969==
Content-Type: multipart/alternative; boundary="00000000000039334705959bf5e9"

--00000000000039334705959bf5e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ cc OpenRISC lost

On Thu, Oct 24, 2019, 6:05 AM Stafford Horne <shorne@gmail.com> wrote:

> Hi Elisa,
>
> On Wed, Oct 23, 2019 at 09:47:24AM +0200, ecalvo@2se.es wrote:
> > Hi Stafford,
> >
> > Sorry for the delay in the answer. I have been out of the office.
> >
> > I am using mor1kx 4.1. What I have done is change FEATURE_PERFCOUNTERS
> to ENABLED in orpsoc_top.c in the library of FuseSoc.. I have also change=
d
> OPTION_PERFCOUNTERS_NUM but I have no seen changes in the output.
>
> The versions I am using are (as reported by busesoc):
>
> INFO: Preparing ::adv_debug_sys:3.1.0-r1
> INFO: Preparing ::cdc_utils:0.1
> INFO: Preparing ::elf-loader:1.0.2
> INFO: Preparing ::intgen:0
> INFO: Preparing ::jtag_tap:1.13-r1
> INFO: Preparing ::jtag_vpi:0-r4
> INFO: Preparing ::mor1kx:5.0-r3
> INFO: Preparing ::uart16550:1.5.5-r1
> INFO: Preparing ::verilog-arbiter:0-r2
> INFO: Preparing ::vlog_tb_utils:1.1
> INFO: Preparing ::wb_common:1.0.3
> INFO: Preparing ::wb_bfm:1.2.1
> INFO: Preparing ::wb_intercon:1.2.2
> INFO: Preparing ::wb_ram:1.1
> INFO: Preparing ::mor1kx-generic:1.1
>
> The changes I made in mor1kx-generic are:
>
> diff --git a/mor1kx-generic.core b/mor1kx-generic.core
> index afc3607..f3160b5 100644
> --- a/mor1kx-generic.core
> +++ b/mor1kx-generic.core
> @@ -10,7 +10,6 @@ filesets:
>    marocchino_modules:
>      depend:
>        - or1k_marocchino
> -
>    soc_files:
>      files:
>        - rtl/verilog/wb_intercon.vh: {is_include_file: true}
> @@ -31,7 +30,7 @@ filesets:
>      file_type: verilogSource
>      depend:
>        - elf-loader
> -      - "=3Djtag_vpi-r2"
> +      - ">=3Djtag_vpi-r2"
>        - ">=3Dvlog_tb_utils-1.0"
>    verilator_tb_files:
>      files:
> diff --git a/rtl/verilog/orpsoc_top.v b/rtl/verilog/orpsoc_top.v
> index e2b04d6..4530e1d 100644
> --- a/rtl/verilog/orpsoc_top.v
> +++ b/rtl/verilog/orpsoc_top.v
> @@ -266,6 +266,8 @@ mor1kx #(
>         .OPTION_RF_NUM_SHADOW_GPR       (option_rf_num_shadow_gpr),
>         .IBUS_WB_TYPE                   ("B3_REGISTERED_FEEDBACK"),
>         .DBUS_WB_TYPE                   ("B3_REGISTERED_FEEDBACK"),
> +       .FEATURE_PERFCOUNTERS           ("ENABLED"),
> +       .OPTION_PERFCOUNTERS_NUM        (3),
>         .OPTION_CPU0                    (pipeline),
>         .OPTION_RESET_PC                (32'h00000100)
>  ) mor1kx0 (
>
>
> If using this version is not possible then it would be best that you look
> into
> traces and try to get some insight to where things are getting stuck.
>
> -Stafford
>
> > Output:
> > We have 1 program counters.
> >  (hanged)
> >
> > I have checked that features have been modified in the fuse build files=
.
> >
> > Elisa
> >
> >
> >
> > -----Mensaje original-----
> > De: Stafford Horne <shorne@gmail.com>
> > Enviado el: viernes, 18 de octubre de 2019 16:41
> > Para: ecalvo@2se.es
> > CC: Openrisc <openrisc@lists.librecores.org>
> > Asunto: Re: PCCR and PCRM registers
> >
> > Hello,
> >
> > Which core are you using?  With mor1kx I did not have an issue with
> hanging.  I had to enable perf counters via parameters.
> >
> > I extended and posted my example code here:
> > https://gist.github.com/stffrdhrn/6343706cb1d8124bbac6bb579b6913b0
> >
> > The results looks like:
> >
> >  Compile: or1k-elf-gcc or1k-perfcounters.c
> >  Run: fusesoc run --target mor1kx_tb mor1kx-generic --elf-load ./a.out
> >
> >  Example Output:
> >
> >  We have 4 program counters.
> >  PCCR before setup 0
> >  Run a printf, to generate instructions..
> >  IF 1825
> >  ICS 237
> >
> >  This shows that the printf took 1825 instructions, 237 times the
> pipeline  stalled due to instruction cache misses.
> >
> > On Fri, Oct 18, 2019 at 7:51 PM <ecalvo@2se.es> wrote:
> > >
> > > Hi Stafford,
> > >
> > > Sorry for bothering you again.
> > >
> > > The program is hanged accessing to PCMR and PCCR registers. Should I
> change other features apart from perfcounters?
> > >
> > > Elisa
> > >
> > > -----Mensaje original-----
> > > De: Stafford Horne <shorne@gmail.com>
> > > Enviado el: jueves, 17 de octubre de 2019 23:42
> > > Para: ecalvo@2se.es
> > > CC: Openrisc <openrisc@lists.librecores.org>
> > > Asunto: Re: PCCR and PCRM registers
> > >
> > > Hi Elisa,
> > >
> > > Right, these are the functions.  You only need to be concerned with:
> > >   OR1K_SPR_PERF_PCCR_ADDR(n)
> > >   OR1K_SPR_PERF_PCMR_ADDR(n)
> > >   OR1K_SPR_SYS_PCCFGR_ADDR
> > >   OR1K_SPR_SYS_PCCFGR_NPC_GET(x)
> > >
> > > The others are used internally.
> > > The PCCFGR is read only, it specifies how many performance counters
> your CPU has built in.  It may be 0-7.
> > >
> > > An example of how to use them:
> > >
> > > #include <or1k-support.h>
> > > #include <or1k-sprs.h>
> > > #include <stdio.h>
> > >
> > > #define PCMR_CISM 1<<3
> > > #define PCMR_CIUM 1<<3
> > > #define PCMR_IF   1<<6
> > >
> > > int main() {
> > >
> > >   int number_of_pcs;
> > >   uint32_t pcmr, pccr, upr, pccfgr;
> > >
> > >   /* Check if PCs are even available */
> > >   upr =3D or1k_mfspr(OR1K_SPR_SYS_UPR_ADDR);
> > >
> > >   if (OR1K_SPR_SYS_UPR_PCUP_GET(upr)) {
> > >
> > >     pccfgr =3D or1k_mfspr(OR1K_SPR_SYS_PCCFGR_ADDR);
> > >     number_of_pcs =3D OR1K_SPR_SYS_PCCFGR_NPC_GET(pccfgr) + 1;
> > >
> > >     printf ("We have %d program counters.\n", number_of_pcs);
> > >
> > >     pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0));
> > >     printf ("PCCR before setup %x\n", pccr);
> > >
> > >     /* Turn on counter and enable instruction fetch counting */
> > >     pcmr =3D or1k_mfspr(OR1K_SPR_PERF_PCMR_ADDR(0));
> > >     pcmr |=3D PCMR_CISM | PCMR_CIUM | PCMR_IF;
> > >     or1k_mtspr(OR1K_SPR_PERF_PCMR_ADDR(0), pcmr);
> > >
> > >     /* Read the PCCR after we are done */
> > >     printf ("Run a printf.");
> > >     pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0));
> > >     printf ("PCCR after printf %x\n", pccr);
> > >   } else {
> > >     printf ("No performance counters available.\n");
> > >   }
> > >
> > >   return 0;
> > > }
> > >
> > > On Fri, Oct 18, 2019 at 12:01 AM <ecalvo@2se.es> wrote:
> > > >
> > > > Hi Stafford,
> > > >
> > > >
> > > >
> > > > Yes, I am using newlib. I had discovered both files; these register=
s
> > > > in sprs.h
> > > >
> > > >
> > > >
> > > > /******************************/
> > > >
> > > > /* Performance Counters Group */
> > > >
> > > > /******************************/
> > > >
> > > > #define OR1K_SPR_PERF_GROUP 0x07
> > > >
> > > >
> > > >
> > > > /* Performance Counters Count Registers */
> > > >
> > > > #define OR1K_SPR_PERF_PCCR_BASE     OR1K_UNSIGNED(0x000)
> > > >
> > > > #define OR1K_SPR_PERF_PCCR_COUNT    OR1K_UNSIGNED(0x008)
> > > >
> > > > #define OR1K_SPR_PERF_PCCR_STEP     OR1K_UNSIGNED(0x001)
> > > >
> > > > #define OR1K_SPR_PERF_PCCR_INDEX(N) (OR1K_SPR_PERF_PCCR_BASE + ((N)
> > > > *
> > > > OR1K_SPR_PERF_PCCR_STEP))
> > > >
> > > > #define OR1K_SPR_PERF_PCCR_ADDR(N)  ((OR1K_SPR_PERF_GROUP <<
> > > > OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCCR_INDEX(N))
> > > >
> > > >
> > > >
> > > > /* Performance Counters Mode Registers */
> > > >
> > > > #define OR1K_SPR_PERF_PCMR_BASE     OR1K_UNSIGNED(0x008)
> > > >
> > > > #define OR1K_SPR_PERF_PCMR_COUNT    OR1K_UNSIGNED(0x008)
> > > >
> > > > #define OR1K_SPR_PERF_PCMR_STEP     OR1K_UNSIGNED(0x001)
> > > >
> > > > #define OR1K_SPR_PERF_PCMR_INDEX(N) (OR1K_SPR_PERF_PCMR_BASE + ((N)
> > > > *OR1K_SPR_PERF_PCMR_STEP))
> > > >
> > > > #define OR1K_SPR_PERF_PCMR_ADDR(N)  ((OR1K_SPR_PERF_GROUP <<
> > > > OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCMR_INDEX(N))
> > > >
> > > >
> > > >
> > > > /* Performance Counters Configuration */
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_INDEX OR1K_UNSIGNED(0x008)
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_ADDR  OR1K_UNSIGNED(0x0008)
> > > >
> > > >
> > > >
> > > > /* Number of Performance Counters */
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_NPC_LSB    0
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_NPC_MSB    2
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_NPC_BITS   3
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_NPC_MASK   OR1K_UNSIGNED(0x00000007)
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_NPC_GET(X) (((X) >> 0) &
> > > > OR1K_UNSIGNED(0x00000007))
> > > >
> > > > #define OR1K_SPR_SYS_PCCFGR_NPC_SET(X, Y) (((X) &
> > > > OR1K_UNSIGNED(0xfffffff8)) | ((Y) << 0))
> > > >
> > > >
> > > >
> > > > And these functions in support.h
> > > >
> > > >
> > > >
> > > > static inline void or1k_mtspr (uint32_t spr, uint32_t value)
> > > >
> > > > static inline uint32_t or1k_mfspr (uint32_t spr)
> > > >
> > > >
> > > >
> > > > Despite this I don=E2=80=99t have clear how to use it.
> > > >
> > > >
> > > >
> > > > If I do: or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , 0)  -> Does it allo=
w
> me to configure the PCCFGR to one performance counter?
> > > >
> > > > Is This the same than or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR ,
> OR1K_SPR_SYS_PCCFGR_NPC_LSB ) or  Do OR1K_SPR_SYS_PCCFGR_NPC_LSB   ,
> OR1K_SPR_SYS_PCCFGR_NPC_MSB, etc. provide different functions on each one
> performance counter?
> > > >
> > > > What is the meaning of PCCR_BASE,  PCCR_COUNT, PCCR_STEP,
> > > > PCMR_INDEX(N), PCMR_ADDR(N) ? (the same for PCMR) (Is BASE the base
> address of all PCCR and ADDR the position of each one of them? =E2=80=A6.=
why
> PCMR_BASE and COUNT hasta de same value OR1K_UNSIGNED(0x008)? ) Should I
> define first PCCFGR, second PCMR and last get PCCR?
> > > >
> > > >
> > > >
> > > > Thanks and sorry for the inconveniences.
> > > >
> > > > Elisa
> > > >
> > > >
> > > >
> > > > De: Stafford Horne <shorne@gmail.com> Enviado el: jueves, 17 de
> > > > octubre de 2019 7:14
> > > > Para: ecalvo@2se.es; Openrisc <openrisc@lists.librecores.org>
> > > > Asunto: Re: PCCR and PCRM registers
> > > >
> > > >
> > > >
> > > > +cc mailing list,
> > > >
> > > >
> > > >
> > > > Hi Elisa,
> > > >
> > > >
> > > >
> > > > Which toolchain are you using? I guess newlib?
> > > >
> > > >
> > > >
> > > > It has functions like or1k_mfspr() and or1k_mtspr() see
> or1k-support.h and or1k-sprs.h headers for details.
> > > >
> > > >
> > > >
> > > > -Stafford
> > > >
> > > > On Wed, Oct 16, 2019, 8:40 PM <ecalvo@2se.es> wrote:
> > > >
> > > > Hi Stafford,
> > > >
> > > > I am with PCCR and PCRM registers. I have seen that I can access
> from asm language, but there is functions to access from C? Have you got
> any example about their usage?
> > > >
> > > > I have already confirmed my subscription to the mailing list.
> > > >
> > > > Thanks
> > > > Elisa
> > > >
> > > > -----Mensaje original-----
> > > > De: Stafford Horne <shorne@gmail.com> Enviado el: mi=C3=A9rcoles, 9=
 de
> > > > octubre de 2019 13:38
> > > > Para: ecalvo@2se.es; Julius Baxter <juliusbaxter@gmail.com>
> > > > Asunto: Re: other doubt
> > > >
> > > > Hello Elisa,
> > > >
> > > > If you simulate with Icarus or modelsim you will be able to measure
> pretty much the same performance characteristics as FPGA. So there is no
> need to go straight to FPGA.
> > > >
> > > > In terms of my example C code is one option.  You can also read
> timer data directly from the tick timer in assembly and achieve the same
> thing.
> > > >
> > > > If you are interested we can CC the mailing list and get more
> opinions.
> > > >
> > > > -Stafford
> > > >
> > > > On Wed, Oct 9, 2019 at 5:09 PM <ecalvo@2se.es> wrote:
> > > > >
> > > > > Hi Stafford,
> > > > >
> > > > > Nice to meet you and, first of all, thanks a lot for your
> guidance. I am new on this, and although there is some documentation,
> sometimes it is difficult some point which maybe it is basic.
> > > > >
> > > > > Ok, to your comments. If.."A simulator like QEMU or or1ksim will
> not give and exact representation of the CPUs real time
> performance"...then...if I simulate directly the processor with modelsim,
> icarus or a similar tool...neither I get a real performance, don=E2=80=99=
t I? And
> values for the counters that you tell me to enable, neither are real, isn=
't
> it? should I execute it directly on the FPGA and it will depends on the
> implementation?
> > > > >
> > > > > Ok, to C code. I have understood the dependency with toolchain.
> > > > >
> > > > > Thanks a lot again.
> > > > > Best regards,
> > > > > Elisa
> > > > >
> > > > >
> > > > > -----Mensaje original-----
> > > > > De: Stafford Horne <shorne@gmail.com> Enviado el: martes, 8 de
> > > > > octubre de 2019 16:18
> > > > > Para: Julius Baxter <juliusbaxter@gmail.com>
> > > > > CC: ecalvo@2se.es
> > > > > Asunto: Re: other doubt
> > > > >
> > > > > Hi Elisa,
> > > > >
> > > > > OpenRISC cpu's can run any algorithm, but how well it will perfor=
m
> depends on many things:
> > > > >
> > > > >   - Compiler optimization flags (i.e. -O3)
> > > > >   - Whether or not you are doing FPU instructions and have FPU
> enabled
> > > > >   - Whether or not you use multiply and divide and have these
> instructions
> > > > >     enabled
> > > > >   - The frequency you are running
> > > > >   - Cache settings Icache Dcache
> > > > >   - The type of algorithm, does it require lots of data which wil=
l
> cause many
> > > > >     cache misses?
> > > > >
> > > > > A simulator like QEMU or or1ksim will not give and exact
> representation of the CPUs real time performance.  It can tell you which
> intructions will be executed, but not how fast those will run or how many
> pipeline stalls of cache misses will happen.
> > > > >
> > > > > You can use the performance counters, they are supported in mor1k=
x
> if you enable them with the FEATURE_PERFCOUNTERS=3D'ENABLED' parameter.  =
They
> can help count how many events happen between certain events.  Then you c=
an
> combine them with a timer and watchpoints to detect how many times a loop
> can execute in 1000 clock cycles etc.  Please read about PCCRn and PCMRn =
in
> the architecture manual.
> > > > >
> > > > > It might be just as easy to use simple timing in a c program
> though, depending on the toolchain you use you can compare times between
> runs of your algorithm.
> > > > > i.e.
> > > > >
> > > > >     #include <time.h>
> > > > >     #include <stdio.h>
> > > > >
> > > > >     static long to_micro(struct timespec *time) {
> > > > >       return (time->tv_sec * 1000000) + (time->tv_nsec / 1000);
> > > > >     }
> > > > >
> > > > >     int main() {
> > > > >       int i, j =3D 0;
> > > > >
> > > > >       struct timespec before, after;
> > > > >
> > > > >       clock_gettime(CLOCK_MONOTONIC, &before);
> > > > >       /* Super complex algorithm */
> > > > >       for (int i =3D 0; i < 100; i++) {
> > > > >         j =3D (j+1) * (j+2);
> > > > >       }
> > > > >       clock_gettime(CLOCK_MONOTONIC, &after);
> > > > >
> > > > >       printf("time to run algorithm %ld uSecs\n", to_micro(&after=
)
> > > > > - to_micro(&before));
> > > > >
> > > > >       return 0;
> > > > >     }
> > > > >
> > > > > $ or1k-smh-linux-gnu-gcc timer.c
> > > > > $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to run
> > > > > algorithm
> > > > > 164 uSecs
> > > > >
> > > > > I hope it helps.
> > > > >
> > > > > -Stafford
> > > > >
> > > > > On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter wrote:
> > > > > > Hi,
> > > > > >
> > > > > > No problem.
> > > > > >
> > > > > > There are performance counters in the OpenRISC architecture but
> > > > > > whether they're implemented in a particular implementation is
> another matter.
> > > > > >
> > > > > > You can use these registers to measure various things the CPU i=
s
> > > > > > doing while it's executing. If you read the ISA document it'll
> > > > > > tell you about them.
> > > > > >
> > > > > > I'm CCing Stafford because he's the main OpenRISC man these day=
s
> > > > > > and probably knows about the state of the performance counter
> > > > > > registers in various simulators and RTL implementations.
> > > > > >
> > > > > > Cheers,
> > > > > > Julius
> > > > > >
> > > > > > On Tue., 8 Oct. 2019, 10:43 pm , <ecalvo@2se.es> wrote:
> > > > > >
> > > > > > > Hi Julius,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Sorry for bothering you again =E2=98=B9. Can I do you other f=
ast
> > > > > > > question related to openrisc? If not, ignore the email please=
.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Is there any way to characterize the type of application that
> > > > > > > I can run in openrisc? I mean, could you measure (with
> > > > > > > numbers) if an algorithm can be executed on it and the speed
> that it will achieve?
> > > > > > > Is it possible to do it using orksim?
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Sorry because maybe it is so basic and general =E2=98=B9
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks in advance
> > > > > > >
> > > > > > > Elisa
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > *De:* Julius Baxter <juliusbaxter@gmail.com> *Enviado el:*
> > > > > > > lunes,
> > > > > > > 16 de septiembre de 2019 13:11
> > > > > > > *Para:* ecalvo@2se.es
> > > > > > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Also! To let you know, if you're in Spain, we will soon be
> > > > > > > having our ORConf conference in Europe, and it's in Bordeaux,
> > > > > > > France, just across the border. :)
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > There are several people there who can help you get up to
> > > > > > > speed, one of whom is Stafford Horne who knows most about the
> > > > > > > OpenRISC IP lately. He will be presenting. If you can attend,
> it'd be helpful, I'm sure.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > All info at https://orconf.org
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Cheers,
> > > > > > >
> > > > > > > Julius
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Mon, 16 Sep 2019 at 21:09, Julius Baxter
> > > > > > > <juliusbaxter@gmail.com>
> > > > > > > wrote:
> > > > > > >
> > > > > > > Hi Elisa,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Sorry for the delay in this response.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > You should be using an SoC toplevel. FPGAs have everything yo=
u
> > > > > > > need on board like memories and IO blocks and lots of other
> > > > > > > FPGA fabric for you to implement other pieces of hardware.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > FuseSoC provides a really nice and easy way to build an mor1k=
x
> > > > > > > design for the DE0 nano I believe:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > https://github.com/olofk/de0_nano
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > That github page has a rough guide to getting it going.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > If you need help I recommend posting to the OpenRISC mailing
> > > > > > > list and people will respond probably more promptly than I. (=
I
> > > > > > > recommend getting to know how to use mailing lists.
> > > > > > > https://openrisc.io/community
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > There are more resources here: https://openrisc.io/tutorials
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > I hope that's helpful.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Cheers,
> > > > > > >
> > > > > > > Julius
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Wed, 11 Sep 2019 at 20:09, <ecalvo@2se.es> wrote:
> > > > > > >
> > > > > > > Hi Julius,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks a lot for the quick answer.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Yes, this is the problem: I am using as top level the mor1kx
> > > > > > > module itself. You mean that I need to synthetize also in
> > > > > > > reconfigurable logic these cores, don=E2=80=99t you? I though=
t that I
> > > > > > > could have these elements as external in a development board.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks again,
> > > > > > >
> > > > > > > Cheers
> > > > > > >
> > > > > > > Elisa
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > *De:* Julius Baxter <juliusbaxter@gmail.com> *Enviado el:*
> > > > > > > mi=C3=A9rcoles, 11 de septiembre de 2019 12:02
> > > > > > > *Para:* ecalvo@2se.es
> > > > > > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Hi Elisa,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks for getting in touch, that sounds like a cool project.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Can you tell me about the toplevel - are you using a system
> > > > > > > toplevel, or is your toplevel the mor1kx module itself?
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > If it's the latter, then that's not the best way to do it -
> > > > > > > you need a system toplevel which instantiates memories and
> > > > > > > some reset circuitry and likely some IO (UART, GPIO, JTAG
> debug, etc.) to talk to the outside world.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Is that helpful?
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Cheers,
> > > > > > >
> > > > > > > Julius
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Wed, 11 Sep 2019 at 19:47, <ecalvo@2se.es> wrote:
> > > > > > >
> > > > > > > Dear Dr. Baxter,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > My name is Elisa Calvo Gallego. I am writing you because I
> > > > > > > have started to work with OpenRISC in the framework of a
> > > > > > > research project developed in the company where I am working
> > > > > > > (Space Submicron Electronics, 2SE), and I am having some basi=
c
> troubles. Could you help me?
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Although the FPGA that we are planning to use is larger, I
> > > > > > > have synthetized mor1kx for a DE0 nano board as first step
> > > > > > > (this is the board used in the majority of guides and
> > > > > > > tutorials). My problem is that the results that I have
> > > > > > > obtained are similar in area and resources, except for IOBs,
> > > > > > > which are more than available IOBs in the device. Do you know
> what I am doing wrong?
> > > > > > > Should I comment debug lines or something like that? I
> > > > > > > apologize if the question is immediate. I didn't find the
> answer and I'm new in this.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks very much in advance.
> > > > > > >
> > > > > > > Best regards,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Elisa
> > > > > > >
> > > > > > >
> > > > >
> > >
> >
>

--00000000000039334705959bf5e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">+ cc OpenRISC lost</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 2019, 6:05 AM Stafford =
Horne &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi Elisa,<br>
<br>
On Wed, Oct 23, 2019 at 09:47:24AM +0200, <a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a> wrote:<br>
&gt; Hi Stafford, <br>
&gt; <br>
&gt; Sorry for the delay in the answer. I have been out of the office. <br>
&gt; <br>
&gt; I am using mor1kx 4.1. What I have done is change FEATURE_PERFCOUNTERS=
 to ENABLED in orpsoc_top.c in the library of FuseSoc.. I have also changed=
 OPTION_PERFCOUNTERS_NUM but I have no seen changes in the output. <br>
<br>
The versions I am using are (as reported by busesoc):<br>
<br>
INFO: Preparing ::adv_debug_sys:3.1.0-r1<br>
INFO: Preparing ::cdc_utils:0.1<br>
INFO: Preparing ::elf-loader:1.0.2<br>
INFO: Preparing ::intgen:0<br>
INFO: Preparing ::jtag_tap:1.13-r1<br>
INFO: Preparing ::jtag_vpi:0-r4<br>
INFO: Preparing ::mor1kx:5.0-r3<br>
INFO: Preparing ::uart16550:1.5.5-r1<br>
INFO: Preparing ::verilog-arbiter:0-r2<br>
INFO: Preparing ::vlog_tb_utils:1.1<br>
INFO: Preparing ::wb_common:1.0.3<br>
INFO: Preparing ::wb_bfm:1.2.1<br>
INFO: Preparing ::wb_intercon:1.2.2<br>
INFO: Preparing ::wb_ram:1.1<br>
INFO: Preparing ::mor1kx-generic:1.1<br>
<br>
The changes I made in mor1kx-generic are:<br>
<br>
diff --git a/mor1kx-generic.core b/mor1kx-generic.core<br>
index afc3607..f3160b5 100644<br>
--- a/mor1kx-generic.core<br>
+++ b/mor1kx-generic.core<br>
@@ -10,7 +10,6 @@ filesets:<br>
=C2=A0 =C2=A0marocchino_modules:<br>
=C2=A0 =C2=A0 =C2=A0depend:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- or1k_marocchino<br>
-<br>
=C2=A0 =C2=A0soc_files:<br>
=C2=A0 =C2=A0 =C2=A0files:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- rtl/verilog/wb_intercon.vh: {is_include_file: =
true}<br>
@@ -31,7 +30,7 @@ filesets:<br>
=C2=A0 =C2=A0 =C2=A0file_type: verilogSource<br>
=C2=A0 =C2=A0 =C2=A0depend:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- elf-loader<br>
-=C2=A0 =C2=A0 =C2=A0 - &quot;=3Djtag_vpi-r2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 - &quot;&gt;=3Djtag_vpi-r2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- &quot;&gt;=3Dvlog_tb_utils-1.0&quot;<br>
=C2=A0 =C2=A0verilator_tb_files:<br>
=C2=A0 =C2=A0 =C2=A0files:<br>
diff --git a/rtl/verilog/orpsoc_top.v b/rtl/verilog/orpsoc_top.v<br>
index e2b04d6..4530e1d 100644<br>
--- a/rtl/verilog/orpsoc_top.v<br>
+++ b/rtl/verilog/orpsoc_top.v<br>
@@ -266,6 +266,8 @@ mor1kx #(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .OPTION_RF_NUM_SHADOW_GPR=C2=A0 =C2=A0 =C2=A0 =
=C2=A0(option_rf_num_shadow_gpr),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .IBUS_WB_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;B3_REGISTERED_FEEDBACK&quot;),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .DBUS_WB_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;B3_REGISTERED_FEEDBACK&quot;),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.FEATURE_PERFCOUNTERS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(&quot;ENABLED&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.OPTION_PERFCOUNTERS_NUM=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (3),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .OPTION_CPU0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pipeline),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .OPTION_RESET_PC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (32&#39;h00000100)<br>
=C2=A0) mor1kx0 (<br>
<br>
<br>
If using this version is not possible then it would be best that you look i=
nto<br>
traces and try to get some insight to where things are getting stuck.<br>
<br>
-Stafford<br>
<br>
&gt; Output: <br>
&gt; We have 1 program counters. <br>
&gt;=C2=A0 (hanged) <br>
&gt; <br>
&gt; I have checked that features have been modified in the fuse build file=
s. <br>
&gt; <br>
&gt; Elisa<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -----Mensaje original-----<br>
&gt; De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; <br>
&gt; Enviado el: viernes, 18 de octubre de 2019 16:41<br>
&gt; Para: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"norefe=
rrer">ecalvo@2se.es</a><br>
&gt; CC: Openrisc &lt;<a href=3D"mailto:openrisc@lists.librecores.org" targ=
et=3D"_blank" rel=3D"noreferrer">openrisc@lists.librecores.org</a>&gt;<br>
&gt; Asunto: Re: PCCR and PCRM registers<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Which core are you using?=C2=A0 With mor1kx I did not have an issue wi=
th hanging.=C2=A0 I had to enable perf counters via parameters.<br>
&gt; <br>
&gt; I extended and posted my example code here:<br>
&gt; <a href=3D"https://gist.github.com/stffrdhrn/6343706cb1d8124bbac6bb579=
b6913b0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gist.githu=
b.com/stffrdhrn/6343706cb1d8124bbac6bb579b6913b0</a><br>
&gt; <br>
&gt; The results looks like:<br>
&gt; <br>
&gt;=C2=A0 Compile: or1k-elf-gcc or1k-perfcounters.c<br>
&gt;=C2=A0 Run: fusesoc run --target mor1kx_tb mor1kx-generic --elf-load ./=
a.out<br>
&gt; <br>
&gt;=C2=A0 Example Output:<br>
&gt; <br>
&gt;=C2=A0 We have 4 program counters.<br>
&gt;=C2=A0 PCCR before setup 0<br>
&gt;=C2=A0 Run a printf, to generate instructions..<br>
&gt;=C2=A0 IF 1825<br>
&gt;=C2=A0 ICS 237<br>
&gt; <br>
&gt;=C2=A0 This shows that the printf took 1825 instructions, 237 times the=
 pipeline=C2=A0 stalled due to instruction cache misses.<br>
&gt; <br>
&gt; On Fri, Oct 18, 2019 at 7:51 PM &lt;<a href=3D"mailto:ecalvo@2se.es" t=
arget=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Stafford,<br>
&gt; &gt;<br>
&gt; &gt; Sorry for bothering you again.<br>
&gt; &gt;<br>
&gt; &gt; The program is hanged accessing to PCMR and PCCR registers. Shoul=
d I change other features apart from perfcounters?<br>
&gt; &gt;<br>
&gt; &gt; Elisa<br>
&gt; &gt;<br>
&gt; &gt; -----Mensaje original-----<br>
&gt; &gt; De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt;<br>
&gt; &gt; Enviado el: jueves, 17 de octubre de 2019 23:42<br>
&gt; &gt; Para: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"n=
oreferrer">ecalvo@2se.es</a><br>
&gt; &gt; CC: Openrisc &lt;<a href=3D"mailto:openrisc@lists.librecores.org"=
 target=3D"_blank" rel=3D"noreferrer">openrisc@lists.librecores.org</a>&gt;=
<br>
&gt; &gt; Asunto: Re: PCCR and PCRM registers<br>
&gt; &gt;<br>
&gt; &gt; Hi Elisa,<br>
&gt; &gt;<br>
&gt; &gt; Right, these are the functions.=C2=A0 You only need to be concern=
ed with:<br>
&gt; &gt;=C2=A0 =C2=A0OR1K_SPR_PERF_PCCR_ADDR(n)<br>
&gt; &gt;=C2=A0 =C2=A0OR1K_SPR_PERF_PCMR_ADDR(n)<br>
&gt; &gt;=C2=A0 =C2=A0OR1K_SPR_SYS_PCCFGR_ADDR<br>
&gt; &gt;=C2=A0 =C2=A0OR1K_SPR_SYS_PCCFGR_NPC_GET(x)<br>
&gt; &gt;<br>
&gt; &gt; The others are used internally.<br>
&gt; &gt; The PCCFGR is read only, it specifies how many performance counte=
rs your CPU has built in.=C2=A0 It may be 0-7.<br>
&gt; &gt;<br>
&gt; &gt; An example of how to use them:<br>
&gt; &gt;<br>
&gt; &gt; #include &lt;or1k-support.h&gt;<br>
&gt; &gt; #include &lt;or1k-sprs.h&gt;<br>
&gt; &gt; #include &lt;stdio.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; #define PCMR_CISM 1&lt;&lt;3<br>
&gt; &gt; #define PCMR_CIUM 1&lt;&lt;3<br>
&gt; &gt; #define PCMR_IF=C2=A0 =C2=A01&lt;&lt;6<br>
&gt; &gt;<br>
&gt; &gt; int main() {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int number_of_pcs;<br>
&gt; &gt;=C2=A0 =C2=A0uint32_t pcmr, pccr, upr, pccfgr;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* Check if PCs are even available */<br>
&gt; &gt;=C2=A0 =C2=A0upr =3D or1k_mfspr(OR1K_SPR_SYS_UPR_ADDR);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0if (OR1K_SPR_SYS_UPR_PCUP_GET(upr)) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pccfgr =3D or1k_mfspr(OR1K_SPR_SYS_PCCFGR_ADDR=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0number_of_pcs =3D OR1K_SPR_SYS_PCCFGR_NPC_GET(=
pccfgr) + 1;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0printf (&quot;We have %d program counters.\n&q=
uot;, number_of_pcs);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0)=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0printf (&quot;PCCR before setup %x\n&quot;, pc=
cr);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Turn on counter and enable instruction fetc=
h counting */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pcmr =3D or1k_mfspr(OR1K_SPR_PERF_PCMR_ADDR(0)=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pcmr |=3D PCMR_CISM | PCMR_CIUM | PCMR_IF;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0or1k_mtspr(OR1K_SPR_PERF_PCMR_ADDR(0), pcmr);<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Read the PCCR after we are done */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0printf (&quot;Run a printf.&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0)=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0printf (&quot;PCCR after printf %x\n&quot;, pc=
cr);<br>
&gt; &gt;=C2=A0 =C2=A0} else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0printf (&quot;No performance counters availabl=
e.\n&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0return 0;<br>
&gt; &gt; }<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Oct 18, 2019 at 12:01 AM &lt;<a href=3D"mailto:ecalvo@2se=
.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Stafford,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes, I am using newlib. I had discovered both files; these r=
egisters <br>
&gt; &gt; &gt; in sprs.h<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /******************************/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /* Performance Counters Group */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /******************************/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_GROUP 0x07<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /* Performance Counters Count Registers */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_BASE=C2=A0 =C2=A0 =C2=A0OR1K_UNSI=
GNED(0x000)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_COUNT=C2=A0 =C2=A0 OR1K_UNSIGNED(=
0x008)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_STEP=C2=A0 =C2=A0 =C2=A0OR1K_UNSI=
GNED(0x001)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_INDEX(N) (OR1K_SPR_PERF_PCCR_BASE=
 + ((N) <br>
&gt; &gt; &gt; *<br>
&gt; &gt; &gt; OR1K_SPR_PERF_PCCR_STEP))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_ADDR(N)=C2=A0 ((OR1K_SPR_PERF_GRO=
UP &lt;&lt;<br>
&gt; &gt; &gt; OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCCR_INDEX(N))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /* Performance Counters Mode Registers */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_BASE=C2=A0 =C2=A0 =C2=A0OR1K_UNSI=
GNED(0x008)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_COUNT=C2=A0 =C2=A0 OR1K_UNSIGNED(=
0x008)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_STEP=C2=A0 =C2=A0 =C2=A0OR1K_UNSI=
GNED(0x001)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_INDEX(N) (OR1K_SPR_PERF_PCMR_BASE=
 + ((N)<br>
&gt; &gt; &gt; *OR1K_SPR_PERF_PCMR_STEP))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_ADDR(N)=C2=A0 ((OR1K_SPR_PERF_GRO=
UP &lt;&lt;<br>
&gt; &gt; &gt; OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCMR_INDEX(N))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /* Performance Counters Configuration */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_INDEX OR1K_UNSIGNED(0x008)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_ADDR=C2=A0 OR1K_UNSIGNED(0x0008)=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; /* Number of Performance Counters */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_LSB=C2=A0 =C2=A0 0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_MSB=C2=A0 =C2=A0 2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_BITS=C2=A0 =C2=A03<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_MASK=C2=A0 =C2=A0OR1K_UNSIGN=
ED(0x00000007)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_GET(X) (((X) &gt;&gt; 0) &am=
p;<br>
&gt; &gt; &gt; OR1K_UNSIGNED(0x00000007))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_SET(X, Y) (((X) &amp;<br>
&gt; &gt; &gt; OR1K_UNSIGNED(0xfffffff8)) | ((Y) &lt;&lt; 0))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And these functions in support.h<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; static inline void or1k_mtspr (uint32_t spr, uint32_t value)=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; static inline uint32_t or1k_mfspr (uint32_t spr)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Despite this I don=E2=80=99t have clear how to use it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If I do: or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , 0)=C2=A0 -&g=
t; Does it allow me to configure the PCCFGR to one performance counter?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is This the same than or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR ,=
 OR1K_SPR_SYS_PCCFGR_NPC_LSB ) or=C2=A0 Do OR1K_SPR_SYS_PCCFGR_NPC_LSB=C2=
=A0 =C2=A0, OR1K_SPR_SYS_PCCFGR_NPC_MSB, etc. provide different functions o=
n each one performance counter?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What is the meaning of PCCR_BASE,=C2=A0 PCCR_COUNT, PCCR_STE=
P, <br>
&gt; &gt; &gt; PCMR_INDEX(N), PCMR_ADDR(N) ? (the same for PCMR) (Is BASE t=
he base address of all PCCR and ADDR the position of each one of them? =E2=
=80=A6.why PCMR_BASE and COUNT hasta de same value OR1K_UNSIGNED(0x008)? ) =
Should I define first PCCFGR, second PCMR and last get PCCR?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks and sorry for the inconveniences.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; Enviado el: ju=
eves, 17 de <br>
&gt; &gt; &gt; octubre de 2019 7:14<br>
&gt; &gt; &gt; Para: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=
=3D"noreferrer">ecalvo@2se.es</a>; Openrisc &lt;<a href=3D"mailto:openrisc@=
lists.librecores.org" target=3D"_blank" rel=3D"noreferrer">openrisc@lists.l=
ibrecores.org</a>&gt;<br>
&gt; &gt; &gt; Asunto: Re: PCCR and PCRM registers<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +cc mailing list,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Elisa,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Which toolchain are you using? I guess newlib?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It has functions like or1k_mfspr() and or1k_mtspr() see or1k=
-support.h and or1k-sprs.h headers for details.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Stafford<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Oct 16, 2019, 8:40 PM &lt;<a href=3D"mailto:ecalvo@2=
se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Stafford,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I am with PCCR and PCRM registers. I have seen that I can ac=
cess from asm language, but there is functions to access from C? Have you g=
ot any example about their usage?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have already confirmed my subscription to the mailing list=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -----Mensaje original-----<br>
&gt; &gt; &gt; De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; Enviado el: mi=
=C3=A9rcoles, 9 de <br>
&gt; &gt; &gt; octubre de 2019 13:38<br>
&gt; &gt; &gt; Para: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=
=3D"noreferrer">ecalvo@2se.es</a>; Julius Baxter &lt;<a href=3D"mailto:juli=
usbaxter@gmail.com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail=
.com</a>&gt;<br>
&gt; &gt; &gt; Asunto: Re: other doubt<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello Elisa,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If you simulate with Icarus or modelsim you will be able to =
measure pretty much the same performance characteristics as FPGA. So there =
is no need to go straight to FPGA.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In terms of my example C code is one option.=C2=A0 You can a=
lso read timer data directly from the tick timer in assembly and achieve th=
e same thing.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If you are interested we can CC the mailing list and get mor=
e opinions.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Stafford<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Oct 9, 2019 at 5:09 PM &lt;<a href=3D"mailto:ecalvo@=
2se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Stafford,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Nice to meet you and, first of all, thanks a lot for yo=
ur guidance. I am new on this, and although there is some documentation, so=
metimes it is difficult some point which maybe it is basic.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Ok, to your comments. If..&quot;A simulator like QEMU o=
r or1ksim will not give and exact representation of the CPUs real time perf=
ormance&quot;...then...if I simulate directly the processor with modelsim, =
icarus or a similar tool...neither I get a real performance, don=E2=80=99t =
I? And values for the counters that you tell me to enable, neither are real=
, isn&#39;t it? should I execute it directly on the FPGA and it will depend=
s on the implementation?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Ok, to C code. I have understood the dependency with to=
olchain.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks a lot again.<br>
&gt; &gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -----Mensaje original-----<br>
&gt; &gt; &gt; &gt; De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; Enviado e=
l: martes, 8 de <br>
&gt; &gt; &gt; &gt; octubre de 2019 16:18<br>
&gt; &gt; &gt; &gt; Para: Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&=
gt;<br>
&gt; &gt; &gt; &gt; CC: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" =
rel=3D"noreferrer">ecalvo@2se.es</a><br>
&gt; &gt; &gt; &gt; Asunto: Re: other doubt<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Elisa,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; OpenRISC cpu&#39;s can run any algorithm, but how well =
it will perform depends on many things:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Compiler optimization flags (i.e. -O3)<br=
>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Whether or not you are doing FPU instruct=
ions and have FPU enabled<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Whether or not you use multiply and divid=
e and have these instructions<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0enabled<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- The frequency you are running<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- Cache settings Icache Dcache<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0- The type of algorithm, does it require lo=
ts of data which will cause many<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cache misses?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; A simulator like QEMU or or1ksim will not give and exac=
t representation of the CPUs real time performance.=C2=A0 It can tell you w=
hich intructions will be executed, but not how fast those will run or how m=
any pipeline stalls of cache misses will happen.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; You can use the performance counters, they are supporte=
d in mor1kx if you enable them with the FEATURE_PERFCOUNTERS=3D&#39;ENABLED=
&#39; parameter.=C2=A0 They can help count how many events happen between c=
ertain events.=C2=A0 Then you can combine them with a timer and watchpoints=
 to detect how many times a loop can execute in 1000 clock cycles etc.=C2=
=A0 Please read about PCCRn and PCMRn in the architecture manual.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It might be just as easy to use simple timing in a c pr=
ogram though, depending on the toolchain you use you can compare times betw=
een runs of your algorithm.<br>
&gt; &gt; &gt; &gt; i.e.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0#include &lt;time.h&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0static long to_micro(struct timespec=
 *time) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (time-&gt;tv_sec * 100=
0000) + (time-&gt;tv_nsec / 1000);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0int main() {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, j =3D 0;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec before, after=
;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC=
, &amp;before);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Super complex algorithm */=
<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; 100;=
 i++) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D (j+1) * (j+2);<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC=
, &amp;after);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;time to run algo=
rithm %ld uSecs\n&quot;, to_micro(&amp;after) <br>
&gt; &gt; &gt; &gt; - to_micro(&amp;before));<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; $ or1k-smh-linux-gnu-gcc timer.c<br>
&gt; &gt; &gt; &gt; $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to =
run <br>
&gt; &gt; &gt; &gt; algorithm<br>
&gt; &gt; &gt; &gt; 164 uSecs<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I hope it helps.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -Stafford<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; No problem.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; There are performance counters in the OpenRISC arc=
hitecture but <br>
&gt; &gt; &gt; &gt; &gt; whether they&#39;re implemented in a particular im=
plementation is another matter.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; You can use these registers to measure various thi=
ngs the CPU is <br>
&gt; &gt; &gt; &gt; &gt; doing while it&#39;s executing. If you read the IS=
A document it&#39;ll <br>
&gt; &gt; &gt; &gt; &gt; tell you about them.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m CCing Stafford because he&#39;s the main O=
penRISC man these days <br>
&gt; &gt; &gt; &gt; &gt; and probably knows about the state of the performa=
nce counter <br>
&gt; &gt; &gt; &gt; &gt; registers in various simulators and RTL implementa=
tions.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; Julius<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Tue., 8 Oct. 2019, 10:43 pm , &lt;<a href=3D"ma=
ilto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&=
gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Julius,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sorry for bothering you again =E2=98=B9. Can =
I do you other fast <br>
&gt; &gt; &gt; &gt; &gt; &gt; question related to openrisc? If not, ignore =
the email please.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Is there any way to characterize the type of =
application that <br>
&gt; &gt; &gt; &gt; &gt; &gt; I can run in openrisc? I mean, could you meas=
ure (with <br>
&gt; &gt; &gt; &gt; &gt; &gt; numbers) if an algorithm can be executed on i=
t and the speed that it will achieve?<br>
&gt; &gt; &gt; &gt; &gt; &gt; Is it possible to do it using orksim?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sorry because maybe it is so basic and genera=
l =E2=98=B9<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks in advance<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; *De:* Julius Baxter &lt;<a href=3D"mailto:jul=
iusbaxter@gmail.com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmai=
l.com</a>&gt; *Enviado el:* <br>
&gt; &gt; &gt; &gt; &gt; &gt; lunes,<br>
&gt; &gt; &gt; &gt; &gt; &gt; 16 de septiembre de 2019 13:11<br>
&gt; &gt; &gt; &gt; &gt; &gt; *Para:* <a href=3D"mailto:ecalvo@2se.es" targ=
et=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; *Asunto:* Re: Starting with OpenRISC - IOBs<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Also! To let you know, if you&#39;re in Spain=
, we will soon be <br>
&gt; &gt; &gt; &gt; &gt; &gt; having our ORConf conference in Europe, and i=
t&#39;s in Bordeaux, <br>
&gt; &gt; &gt; &gt; &gt; &gt; France, just across the border. :)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; There are several people there who can help y=
ou get up to <br>
&gt; &gt; &gt; &gt; &gt; &gt; speed, one of whom is Stafford Horne who know=
s most about the <br>
&gt; &gt; &gt; &gt; &gt; &gt; OpenRISC IP lately. He will be presenting. If=
 you can attend, it&#39;d be helpful, I&#39;m sure.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; All info at <a href=3D"https://orconf.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://orconf.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Julius<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, 16 Sep 2019 at 21:09, Julius Baxter <=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:juliusbaxter@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Elisa,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sorry for the delay in this response.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; You should be using an SoC toplevel. FPGAs ha=
ve everything you <br>
&gt; &gt; &gt; &gt; &gt; &gt; need on board like memories and IO blocks and=
 lots of other <br>
&gt; &gt; &gt; &gt; &gt; &gt; FPGA fabric for you to implement other pieces=
 of hardware.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; FuseSoC provides a really nice and easy way t=
o build an mor1kx <br>
&gt; &gt; &gt; &gt; &gt; &gt; design for the DE0 nano I believe:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://github.com/olofk/de0_nano"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/olofk/d=
e0_nano</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; That github page has a rough guide to getting=
 it going.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; If you need help I recommend posting to the O=
penRISC mailing <br>
&gt; &gt; &gt; &gt; &gt; &gt; list and people will respond probably more pr=
omptly than I. (I <br>
&gt; &gt; &gt; &gt; &gt; &gt; recommend getting to know how to use mailing =
lists.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://openrisc.io/community" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://openrisc.io/community<=
/a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; There are more resources here: <a href=3D"htt=
ps://openrisc.io/tutorials" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://openrisc.io/tutorials</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I hope that&#39;s helpful.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Julius<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, 11 Sep 2019 at 20:09, &lt;<a href=3D"=
mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a=
>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Julius,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks a lot for the quick answer.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Yes, this is the problem: I am using as top l=
evel the mor1kx <br>
&gt; &gt; &gt; &gt; &gt; &gt; module itself. You mean that I need to synthe=
tize also in <br>
&gt; &gt; &gt; &gt; &gt; &gt; reconfigurable logic these cores, don=E2=80=
=99t you? I thought that I <br>
&gt; &gt; &gt; &gt; &gt; &gt; could have these elements as external in a de=
velopment board.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks again,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cheers<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; *De:* Julius Baxter &lt;<a href=3D"mailto:jul=
iusbaxter@gmail.com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmai=
l.com</a>&gt; *Enviado el:* <br>
&gt; &gt; &gt; &gt; &gt; &gt; mi=C3=A9rcoles, 11 de septiembre de 2019 12:0=
2<br>
&gt; &gt; &gt; &gt; &gt; &gt; *Para:* <a href=3D"mailto:ecalvo@2se.es" targ=
et=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; *Asunto:* Re: Starting with OpenRISC - IOBs<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Elisa,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks for getting in touch, that sounds like=
 a cool project.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Can you tell me about the toplevel - are you =
using a system <br>
&gt; &gt; &gt; &gt; &gt; &gt; toplevel, or is your toplevel the mor1kx modu=
le itself?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; If it&#39;s the latter, then that&#39;s not t=
he best way to do it - <br>
&gt; &gt; &gt; &gt; &gt; &gt; you need a system toplevel which instantiates=
 memories and <br>
&gt; &gt; &gt; &gt; &gt; &gt; some reset circuitry and likely some IO (UART=
, GPIO, JTAG debug, etc.) to talk to the outside world.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Is that helpful?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Julius<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, 11 Sep 2019 at 19:47, &lt;<a href=3D"=
mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a=
>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Dear Dr. Baxter,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; My name is Elisa Calvo Gallego. I am writing =
you because I <br>
&gt; &gt; &gt; &gt; &gt; &gt; have started to work with OpenRISC in the fra=
mework of a <br>
&gt; &gt; &gt; &gt; &gt; &gt; research project developed in the company whe=
re I am working <br>
&gt; &gt; &gt; &gt; &gt; &gt; (Space Submicron Electronics, 2SE), and I am =
having some basic troubles. Could you help me?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Although the FPGA that we are planning to use=
 is larger, I <br>
&gt; &gt; &gt; &gt; &gt; &gt; have synthetized mor1kx for a DE0 nano board =
as first step <br>
&gt; &gt; &gt; &gt; &gt; &gt; (this is the board used in the majority of gu=
ides and <br>
&gt; &gt; &gt; &gt; &gt; &gt; tutorials). My problem is that the results th=
at I have <br>
&gt; &gt; &gt; &gt; &gt; &gt; obtained are similar in area and resources, e=
xcept for IOBs, <br>
&gt; &gt; &gt; &gt; &gt; &gt; which are more than available IOBs in the dev=
ice. Do you know what I am doing wrong?<br>
&gt; &gt; &gt; &gt; &gt; &gt; Should I comment debug lines or something lik=
e that? I <br>
&gt; &gt; &gt; &gt; &gt; &gt; apologize if the question is immediate. I did=
n&#39;t find the answer and I&#39;m new in this.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks very much in advance.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
</blockquote></div>

--00000000000039334705959bf5e9--

--===============0774427709000608969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0774427709000608969==--
