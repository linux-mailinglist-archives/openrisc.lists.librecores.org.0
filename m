Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDA1E2AF3
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 09:18:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C4C1F206FC;
	Thu, 24 Oct 2019 09:18:50 +0200 (CEST)
Received: from llsa987-a17.servidoresdns.net (llsa987-a17.servidoresdns.net
 [82.223.190.28])
 by mail.librecores.org (Postfix) with ESMTPS id 2AEA42013F
 for <openrisc@lists.librecores.org>; Thu, 24 Oct 2019 09:18:50 +0200 (CEST)
Received: from EW10PR1SI054 (unknown [185.70.174.4])
 by llsa987-a17.servidoresdns.net (Postfix) with ESMTPA id 46zJWY0D54z2tMJ;
 Thu, 24 Oct 2019 09:18:48 +0200 (CEST)
From: <ecalvo@2se.es>
To: "'Stafford Horne'" <shorne@gmail.com>
References: <009d01d58416$7125fe80$5371fb80$@2se.es>
 <CAAfxs76G9Tyygv-5F+y-v9WkKyqO99W2aiBtejB54-qV-OBiFQ@mail.gmail.com>
 <00ef01d584fb$b271ae30$17550a90$@2se.es>
 <CAAfxs75YD4D1twr2q=KcoN-QmWTq-cpEAEw1+3H7kZju=DmYwA@mail.gmail.com>
 <011401d585a2$0a071490$1e153db0$@2se.es>
 <CAAfxs77SF7o=Oy4wuOe6BjJHdP7GE+7a0QV=Q1G41swFmU4XhA@mail.gmail.com>
 <013f01d58976$1c2c7700$54856500$@2se.es>
 <20191023210532.GI24874@lianli.shorne-pla.net>
 <CAAfxs76n4Dn0kCavh0TSk0kBFZZq0QbsSdrSMKK-WAdY0toAsQ@mail.gmail.com>
In-Reply-To: <CAAfxs76n4Dn0kCavh0TSk0kBFZZq0QbsSdrSMKK-WAdY0toAsQ@mail.gmail.com>
Date: Thu, 24 Oct 2019 09:18:48 +0200
Message-ID: <016201d58a3b$486ec460$d94c4d20$@2se.es>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGt80GvhaiLZskMfgaoczNFlXkQZQHXM3FtAkwaBgICP0IK9wI7l2WdAhwsODwBuyEhsAHk+T9NAuowBH2nLmhvoA==
Content-Language: es
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
Cc: 'Openrisc' <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============1251098167063101545=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This is a multipart message in MIME format.

--===============1251098167063101545==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0163_01D58A4C.0BFA0560"
Content-Language: es

This is a multipart message in MIME format.

------=_NextPart_000_0163_01D58A4C.0BFA0560
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okkk. I will check version numbers first and, if not, I will look into =
traces.=20

I will come back to you if I discover the problem.=20

Thanks a lot Stafford. =20

-Elisa

=20

De: Stafford Horne <shorne@gmail.com>=20
Enviado el: jueves, 24 de octubre de 2019 1:06
Para: ecalvo@2se.es
CC: Openrisc <openrisc@lists.librecores.org>
Asunto: Re: PCCR and PCRM registers

=20

+ cc OpenRISC lost

=20

On Thu, Oct 24, 2019, 6:05 AM Stafford Horne <shorne@gmail.com =
<mailto:shorne@gmail.com> > wrote:

Hi Elisa,

On Wed, Oct 23, 2019 at 09:47:24AM +0200, ecalvo@2se.es =
<mailto:ecalvo@2se.es>  wrote:
> Hi Stafford,=20
>=20
> Sorry for the delay in the answer. I have been out of the office.=20
>=20
> I am using mor1kx 4.1. What I have done is change FEATURE_PERFCOUNTERS =
to ENABLED in orpsoc_top.c in the library of FuseSoc.. I have also =
changed OPTION_PERFCOUNTERS_NUM but I have no seen changes in the =
output.=20

The versions I am using are (as reported by busesoc):

INFO: Preparing ::adv_debug_sys:3.1.0-r1
INFO: Preparing ::cdc_utils:0.1
INFO: Preparing ::elf-loader:1.0.2
INFO: Preparing ::intgen:0
INFO: Preparing ::jtag_tap:1.13-r1
INFO: Preparing ::jtag_vpi:0-r4
INFO: Preparing ::mor1kx:5.0-r3
INFO: Preparing ::uart16550:1.5.5-r1
INFO: Preparing ::verilog-arbiter:0-r2
INFO: Preparing ::vlog_tb_utils:1.1
INFO: Preparing ::wb_common:1.0.3
INFO: Preparing ::wb_bfm:1.2.1
INFO: Preparing ::wb_intercon:1.2.2
INFO: Preparing ::wb_ram:1.1
INFO: Preparing ::mor1kx-generic:1.1

The changes I made in mor1kx-generic are:

diff --git a/mor1kx-generic.core b/mor1kx-generic.core
index afc3607..f3160b5 100644
--- a/mor1kx-generic.core
+++ b/mor1kx-generic.core
@@ -10,7 +10,6 @@ filesets:
   marocchino_modules:
     depend:
       - or1k_marocchino
-
   soc_files:
     files:
       - rtl/verilog/wb_intercon.vh: {is_include_file: true}
@@ -31,7 +30,7 @@ filesets:
     file_type: verilogSource
     depend:
       - elf-loader
-      - "=3Djtag_vpi-r2"
+      - ">=3Djtag_vpi-r2"
       - ">=3Dvlog_tb_utils-1.0"
   verilator_tb_files:
     files:
diff --git a/rtl/verilog/orpsoc_top.v b/rtl/verilog/orpsoc_top.v
index e2b04d6..4530e1d 100644
--- a/rtl/verilog/orpsoc_top.v
+++ b/rtl/verilog/orpsoc_top.v
@@ -266,6 +266,8 @@ mor1kx #(
        .OPTION_RF_NUM_SHADOW_GPR       (option_rf_num_shadow_gpr),
        .IBUS_WB_TYPE                   ("B3_REGISTERED_FEEDBACK"),
        .DBUS_WB_TYPE                   ("B3_REGISTERED_FEEDBACK"),
+       .FEATURE_PERFCOUNTERS           ("ENABLED"),
+       .OPTION_PERFCOUNTERS_NUM        (3),
        .OPTION_CPU0                    (pipeline),
        .OPTION_RESET_PC                (32'h00000100)
 ) mor1kx0 (


If using this version is not possible then it would be best that you =
look into
traces and try to get some insight to where things are getting stuck.

-Stafford

> Output:=20
> We have 1 program counters.=20
>  (hanged)=20
>=20
> I have checked that features have been modified in the fuse build =
files.=20
>=20
> Elisa
>=20
>=20
>=20
> -----Mensaje original-----
> De: Stafford Horne <shorne@gmail.com <mailto:shorne@gmail.com> >=20
> Enviado el: viernes, 18 de octubre de 2019 16:41
> Para: ecalvo@2se.es <mailto:ecalvo@2se.es>=20
> CC: Openrisc <openrisc@lists.librecores.org =
<mailto:openrisc@lists.librecores.org> >
> Asunto: Re: PCCR and PCRM registers
>=20
> Hello,
>=20
> Which core are you using?  With mor1kx I did not have an issue with =
hanging.  I had to enable perf counters via parameters.
>=20
> I extended and posted my example code here:
> https://gist.github.com/stffrdhrn/6343706cb1d8124bbac6bb579b6913b0
>=20
> The results looks like:
>=20
>  Compile: or1k-elf-gcc or1k-perfcounters.c
>  Run: fusesoc run --target mor1kx_tb mor1kx-generic --elf-load ./a.out
>=20
>  Example Output:
>=20
>  We have 4 program counters.
>  PCCR before setup 0
>  Run a printf, to generate instructions..
>  IF 1825
>  ICS 237
>=20
>  This shows that the printf took 1825 instructions, 237 times the =
pipeline  stalled due to instruction cache misses.
>=20
> On Fri, Oct 18, 2019 at 7:51 PM <ecalvo@2se.es <mailto:ecalvo@2se.es> =
> wrote:
> >
> > Hi Stafford,
> >
> > Sorry for bothering you again.
> >
> > The program is hanged accessing to PCMR and PCCR registers. Should I =
change other features apart from perfcounters?
> >
> > Elisa
> >
> > -----Mensaje original-----
> > De: Stafford Horne <shorne@gmail.com <mailto:shorne@gmail.com> >
> > Enviado el: jueves, 17 de octubre de 2019 23:42
> > Para: ecalvo@2se.es <mailto:ecalvo@2se.es>=20
> > CC: Openrisc <openrisc@lists.librecores.org =
<mailto:openrisc@lists.librecores.org> >
> > Asunto: Re: PCCR and PCRM registers
> >
> > Hi Elisa,
> >
> > Right, these are the functions.  You only need to be concerned with:
> >   OR1K_SPR_PERF_PCCR_ADDR(n)
> >   OR1K_SPR_PERF_PCMR_ADDR(n)
> >   OR1K_SPR_SYS_PCCFGR_ADDR
> >   OR1K_SPR_SYS_PCCFGR_NPC_GET(x)
> >
> > The others are used internally.
> > The PCCFGR is read only, it specifies how many performance counters =
your CPU has built in.  It may be 0-7.
> >
> > An example of how to use them:
> >
> > #include <or1k-support.h>
> > #include <or1k-sprs.h>
> > #include <stdio.h>
> >
> > #define PCMR_CISM 1<<3
> > #define PCMR_CIUM 1<<3
> > #define PCMR_IF   1<<6
> >
> > int main() {
> >
> >   int number_of_pcs;
> >   uint32_t pcmr, pccr, upr, pccfgr;
> >
> >   /* Check if PCs are even available */
> >   upr =3D or1k_mfspr(OR1K_SPR_SYS_UPR_ADDR);
> >
> >   if (OR1K_SPR_SYS_UPR_PCUP_GET(upr)) {
> >
> >     pccfgr =3D or1k_mfspr(OR1K_SPR_SYS_PCCFGR_ADDR);
> >     number_of_pcs =3D OR1K_SPR_SYS_PCCFGR_NPC_GET(pccfgr) + 1;
> >
> >     printf ("We have %d program counters.\n", number_of_pcs);
> >
> >     pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0));
> >     printf ("PCCR before setup %x\n", pccr);
> >
> >     /* Turn on counter and enable instruction fetch counting */
> >     pcmr =3D or1k_mfspr(OR1K_SPR_PERF_PCMR_ADDR(0));
> >     pcmr |=3D PCMR_CISM | PCMR_CIUM | PCMR_IF;
> >     or1k_mtspr(OR1K_SPR_PERF_PCMR_ADDR(0), pcmr);
> >
> >     /* Read the PCCR after we are done */
> >     printf ("Run a printf.");
> >     pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0));
> >     printf ("PCCR after printf %x\n", pccr);
> >   } else {
> >     printf ("No performance counters available.\n");
> >   }
> >
> >   return 0;
> > }
> >
> > On Fri, Oct 18, 2019 at 12:01 AM <ecalvo@2se.es =
<mailto:ecalvo@2se.es> > wrote:
> > >
> > > Hi Stafford,
> > >
> > >
> > >
> > > Yes, I am using newlib. I had discovered both files; these =
registers=20
> > > in sprs.h
> > >
> > >
> > >
> > > /******************************/
> > >
> > > /* Performance Counters Group */
> > >
> > > /******************************/
> > >
> > > #define OR1K_SPR_PERF_GROUP 0x07
> > >
> > >
> > >
> > > /* Performance Counters Count Registers */
> > >
> > > #define OR1K_SPR_PERF_PCCR_BASE     OR1K_UNSIGNED(0x000)
> > >
> > > #define OR1K_SPR_PERF_PCCR_COUNT    OR1K_UNSIGNED(0x008)
> > >
> > > #define OR1K_SPR_PERF_PCCR_STEP     OR1K_UNSIGNED(0x001)
> > >
> > > #define OR1K_SPR_PERF_PCCR_INDEX(N) (OR1K_SPR_PERF_PCCR_BASE + =
((N)=20
> > > *
> > > OR1K_SPR_PERF_PCCR_STEP))
> > >
> > > #define OR1K_SPR_PERF_PCCR_ADDR(N)  ((OR1K_SPR_PERF_GROUP <<
> > > OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCCR_INDEX(N))
> > >
> > >
> > >
> > > /* Performance Counters Mode Registers */
> > >
> > > #define OR1K_SPR_PERF_PCMR_BASE     OR1K_UNSIGNED(0x008)
> > >
> > > #define OR1K_SPR_PERF_PCMR_COUNT    OR1K_UNSIGNED(0x008)
> > >
> > > #define OR1K_SPR_PERF_PCMR_STEP     OR1K_UNSIGNED(0x001)
> > >
> > > #define OR1K_SPR_PERF_PCMR_INDEX(N) (OR1K_SPR_PERF_PCMR_BASE + =
((N)
> > > *OR1K_SPR_PERF_PCMR_STEP))
> > >
> > > #define OR1K_SPR_PERF_PCMR_ADDR(N)  ((OR1K_SPR_PERF_GROUP <<
> > > OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCMR_INDEX(N))
> > >
> > >
> > >
> > > /* Performance Counters Configuration */
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_INDEX OR1K_UNSIGNED(0x008)
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_ADDR  OR1K_UNSIGNED(0x0008)
> > >
> > >
> > >
> > > /* Number of Performance Counters */
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_NPC_LSB    0
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_NPC_MSB    2
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_NPC_BITS   3
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_NPC_MASK   OR1K_UNSIGNED(0x00000007)
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_NPC_GET(X) (((X) >> 0) &
> > > OR1K_UNSIGNED(0x00000007))
> > >
> > > #define OR1K_SPR_SYS_PCCFGR_NPC_SET(X, Y) (((X) &
> > > OR1K_UNSIGNED(0xfffffff8)) | ((Y) << 0))
> > >
> > >
> > >
> > > And these functions in support.h
> > >
> > >
> > >
> > > static inline void or1k_mtspr (uint32_t spr, uint32_t value)
> > >
> > > static inline uint32_t or1k_mfspr (uint32_t spr)
> > >
> > >
> > >
> > > Despite this I don=E2=80=99t have clear how to use it.
> > >
> > >
> > >
> > > If I do: or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , 0)  -> Does it =
allow me to configure the PCCFGR to one performance counter?
> > >
> > > Is This the same than or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , =
OR1K_SPR_SYS_PCCFGR_NPC_LSB ) or  Do OR1K_SPR_SYS_PCCFGR_NPC_LSB   , =
OR1K_SPR_SYS_PCCFGR_NPC_MSB, etc. provide different functions on each =
one performance counter?
> > >
> > > What is the meaning of PCCR_BASE,  PCCR_COUNT, PCCR_STEP,=20
> > > PCMR_INDEX(N), PCMR_ADDR(N) ? (the same for PCMR) (Is BASE the =
base address of all PCCR and ADDR the position of each one of them? =
=E2=80=A6.why PCMR_BASE and COUNT hasta de same value =
OR1K_UNSIGNED(0x008)? ) Should I define first PCCFGR, second PCMR and =
last get PCCR?
> > >
> > >
> > >
> > > Thanks and sorry for the inconveniences.
> > >
> > > Elisa
> > >
> > >
> > >
> > > De: Stafford Horne <shorne@gmail.com <mailto:shorne@gmail.com> > =
Enviado el: jueves, 17 de=20
> > > octubre de 2019 7:14
> > > Para: ecalvo@2se.es <mailto:ecalvo@2se.es> ; Openrisc =
<openrisc@lists.librecores.org <mailto:openrisc@lists.librecores.org> >
> > > Asunto: Re: PCCR and PCRM registers
> > >
> > >
> > >
> > > +cc mailing list,
> > >
> > >
> > >
> > > Hi Elisa,
> > >
> > >
> > >
> > > Which toolchain are you using? I guess newlib?
> > >
> > >
> > >
> > > It has functions like or1k_mfspr() and or1k_mtspr() see =
or1k-support.h and or1k-sprs.h headers for details.
> > >
> > >
> > >
> > > -Stafford
> > >
> > > On Wed, Oct 16, 2019, 8:40 PM <ecalvo@2se.es =
<mailto:ecalvo@2se.es> > wrote:
> > >
> > > Hi Stafford,
> > >
> > > I am with PCCR and PCRM registers. I have seen that I can access =
from asm language, but there is functions to access from C? Have you got =
any example about their usage?
> > >
> > > I have already confirmed my subscription to the mailing list.
> > >
> > > Thanks
> > > Elisa
> > >
> > > -----Mensaje original-----
> > > De: Stafford Horne <shorne@gmail.com <mailto:shorne@gmail.com> > =
Enviado el: mi=C3=A9rcoles, 9 de=20
> > > octubre de 2019 13:38
> > > Para: ecalvo@2se.es <mailto:ecalvo@2se.es> ; Julius Baxter =
<juliusbaxter@gmail.com <mailto:juliusbaxter@gmail.com> >
> > > Asunto: Re: other doubt
> > >
> > > Hello Elisa,
> > >
> > > If you simulate with Icarus or modelsim you will be able to =
measure pretty much the same performance characteristics as FPGA. So =
there is no need to go straight to FPGA.
> > >
> > > In terms of my example C code is one option.  You can also read =
timer data directly from the tick timer in assembly and achieve the same =
thing.
> > >
> > > If you are interested we can CC the mailing list and get more =
opinions.
> > >
> > > -Stafford
> > >
> > > On Wed, Oct 9, 2019 at 5:09 PM <ecalvo@2se.es =
<mailto:ecalvo@2se.es> > wrote:
> > > >
> > > > Hi Stafford,
> > > >
> > > > Nice to meet you and, first of all, thanks a lot for your =
guidance. I am new on this, and although there is some documentation, =
sometimes it is difficult some point which maybe it is basic.
> > > >
> > > > Ok, to your comments. If.."A simulator like QEMU or or1ksim will =
not give and exact representation of the CPUs real time =
performance"...then...if I simulate directly the processor with =
modelsim, icarus or a similar tool...neither I get a real performance, =
don=E2=80=99t I? And values for the counters that you tell me to enable, =
neither are real, isn't it? should I execute it directly on the FPGA and =
it will depends on the implementation?
> > > >
> > > > Ok, to C code. I have understood the dependency with toolchain.
> > > >
> > > > Thanks a lot again.
> > > > Best regards,
> > > > Elisa
> > > >
> > > >
> > > > -----Mensaje original-----
> > > > De: Stafford Horne <shorne@gmail.com <mailto:shorne@gmail.com> > =
Enviado el: martes, 8 de=20
> > > > octubre de 2019 16:18
> > > > Para: Julius Baxter <juliusbaxter@gmail.com =
<mailto:juliusbaxter@gmail.com> >
> > > > CC: ecalvo@2se.es <mailto:ecalvo@2se.es>=20
> > > > Asunto: Re: other doubt
> > > >
> > > > Hi Elisa,
> > > >
> > > > OpenRISC cpu's can run any algorithm, but how well it will =
perform depends on many things:
> > > >
> > > >   - Compiler optimization flags (i.e. -O3)
> > > >   - Whether or not you are doing FPU instructions and have FPU =
enabled
> > > >   - Whether or not you use multiply and divide and have these =
instructions
> > > >     enabled
> > > >   - The frequency you are running
> > > >   - Cache settings Icache Dcache
> > > >   - The type of algorithm, does it require lots of data which =
will cause many
> > > >     cache misses?
> > > >
> > > > A simulator like QEMU or or1ksim will not give and exact =
representation of the CPUs real time performance.  It can tell you which =
intructions will be executed, but not how fast those will run or how =
many pipeline stalls of cache misses will happen.
> > > >
> > > > You can use the performance counters, they are supported in =
mor1kx if you enable them with the FEATURE_PERFCOUNTERS=3D'ENABLED' =
parameter.  They can help count how many events happen between certain =
events.  Then you can combine them with a timer and watchpoints to =
detect how many times a loop can execute in 1000 clock cycles etc.  =
Please read about PCCRn and PCMRn in the architecture manual.
> > > >
> > > > It might be just as easy to use simple timing in a c program =
though, depending on the toolchain you use you can compare times between =
runs of your algorithm.
> > > > i.e.
> > > >
> > > >     #include <time.h>
> > > >     #include <stdio.h>
> > > >
> > > >     static long to_micro(struct timespec *time) {
> > > >       return (time->tv_sec * 1000000) + (time->tv_nsec / 1000);
> > > >     }
> > > >
> > > >     int main() {
> > > >       int i, j =3D 0;
> > > >
> > > >       struct timespec before, after;
> > > >
> > > >       clock_gettime(CLOCK_MONOTONIC, &before);
> > > >       /* Super complex algorithm */
> > > >       for (int i =3D 0; i < 100; i++) {
> > > >         j =3D (j+1) * (j+2);
> > > >       }
> > > >       clock_gettime(CLOCK_MONOTONIC, &after);
> > > >
> > > >       printf("time to run algorithm %ld uSecs\n", =
to_micro(&after)=20
> > > > - to_micro(&before));
> > > >
> > > >       return 0;
> > > >     }
> > > >
> > > > $ or1k-smh-linux-gnu-gcc timer.c
> > > > $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to run=20
> > > > algorithm
> > > > 164 uSecs
> > > >
> > > > I hope it helps.
> > > >
> > > > -Stafford
> > > >
> > > > On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter wrote:
> > > > > Hi,
> > > > >
> > > > > No problem.
> > > > >
> > > > > There are performance counters in the OpenRISC architecture =
but=20
> > > > > whether they're implemented in a particular implementation is =
another matter.
> > > > >
> > > > > You can use these registers to measure various things the CPU =
is=20
> > > > > doing while it's executing. If you read the ISA document it'll =

> > > > > tell you about them.
> > > > >
> > > > > I'm CCing Stafford because he's the main OpenRISC man these =
days=20
> > > > > and probably knows about the state of the performance counter=20
> > > > > registers in various simulators and RTL implementations.
> > > > >
> > > > > Cheers,
> > > > > Julius
> > > > >
> > > > > On Tue., 8 Oct. 2019, 10:43 pm , <ecalvo@2se.es =
<mailto:ecalvo@2se.es> > wrote:
> > > > >
> > > > > > Hi Julius,
> > > > > >
> > > > > >
> > > > > >
> > > > > > Sorry for bothering you again =E2=98=B9. Can I do you other =
fast=20
> > > > > > question related to openrisc? If not, ignore the email =
please.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Is there any way to characterize the type of application =
that=20
> > > > > > I can run in openrisc? I mean, could you measure (with=20
> > > > > > numbers) if an algorithm can be executed on it and the speed =
that it will achieve?
> > > > > > Is it possible to do it using orksim?
> > > > > >
> > > > > >
> > > > > >
> > > > > > Sorry because maybe it is so basic and general =E2=98=B9
> > > > > >
> > > > > >
> > > > > >
> > > > > > Thanks in advance
> > > > > >
> > > > > > Elisa
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > *De:* Julius Baxter <juliusbaxter@gmail.com =
<mailto:juliusbaxter@gmail.com> > *Enviado el:*=20
> > > > > > lunes,
> > > > > > 16 de septiembre de 2019 13:11
> > > > > > *Para:* ecalvo@2se.es <mailto:ecalvo@2se.es>=20
> > > > > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > > > > >
> > > > > >
> > > > > >
> > > > > > Also! To let you know, if you're in Spain, we will soon be=20
> > > > > > having our ORConf conference in Europe, and it's in =
Bordeaux,=20
> > > > > > France, just across the border. :)
> > > > > >
> > > > > >
> > > > > >
> > > > > > There are several people there who can help you get up to=20
> > > > > > speed, one of whom is Stafford Horne who knows most about =
the=20
> > > > > > OpenRISC IP lately. He will be presenting. If you can =
attend, it'd be helpful, I'm sure.
> > > > > >
> > > > > >
> > > > > >
> > > > > > All info at https://orconf.org
> > > > > >
> > > > > >
> > > > > >
> > > > > > Cheers,
> > > > > >
> > > > > > Julius
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Mon, 16 Sep 2019 at 21:09, Julius Baxter=20
> > > > > > <juliusbaxter@gmail.com <mailto:juliusbaxter@gmail.com> >
> > > > > > wrote:
> > > > > >
> > > > > > Hi Elisa,
> > > > > >
> > > > > >
> > > > > >
> > > > > > Sorry for the delay in this response.
> > > > > >
> > > > > >
> > > > > >
> > > > > > You should be using an SoC toplevel. FPGAs have everything =
you=20
> > > > > > need on board like memories and IO blocks and lots of other=20
> > > > > > FPGA fabric for you to implement other pieces of hardware.
> > > > > >
> > > > > >
> > > > > >
> > > > > > FuseSoC provides a really nice and easy way to build an =
mor1kx=20
> > > > > > design for the DE0 nano I believe:
> > > > > >
> > > > > >
> > > > > >
> > > > > > https://github.com/olofk/de0_nano
> > > > > >
> > > > > >
> > > > > >
> > > > > > That github page has a rough guide to getting it going.
> > > > > >
> > > > > >
> > > > > >
> > > > > > If you need help I recommend posting to the OpenRISC mailing =

> > > > > > list and people will respond probably more promptly than I. =
(I=20
> > > > > > recommend getting to know how to use mailing lists.
> > > > > > https://openrisc.io/community
> > > > > >
> > > > > >
> > > > > >
> > > > > > There are more resources here: https://openrisc.io/tutorials
> > > > > >
> > > > > >
> > > > > >
> > > > > > I hope that's helpful.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Cheers,
> > > > > >
> > > > > > Julius
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Wed, 11 Sep 2019 at 20:09, <ecalvo@2se.es =
<mailto:ecalvo@2se.es> > wrote:
> > > > > >
> > > > > > Hi Julius,
> > > > > >
> > > > > >
> > > > > >
> > > > > > Thanks a lot for the quick answer.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Yes, this is the problem: I am using as top level the mor1kx =

> > > > > > module itself. You mean that I need to synthetize also in=20
> > > > > > reconfigurable logic these cores, don=E2=80=99t you? I =
thought that I=20
> > > > > > could have these elements as external in a development =
board.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Thanks again,
> > > > > >
> > > > > > Cheers
> > > > > >
> > > > > > Elisa
> > > > > >
> > > > > >
> > > > > >
> > > > > > *De:* Julius Baxter <juliusbaxter@gmail.com =
<mailto:juliusbaxter@gmail.com> > *Enviado el:*=20
> > > > > > mi=C3=A9rcoles, 11 de septiembre de 2019 12:02
> > > > > > *Para:* ecalvo@2se.es <mailto:ecalvo@2se.es>=20
> > > > > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > > > > >
> > > > > >
> > > > > >
> > > > > > Hi Elisa,
> > > > > >
> > > > > >
> > > > > >
> > > > > > Thanks for getting in touch, that sounds like a cool =
project.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Can you tell me about the toplevel - are you using a system=20
> > > > > > toplevel, or is your toplevel the mor1kx module itself?
> > > > > >
> > > > > >
> > > > > >
> > > > > > If it's the latter, then that's not the best way to do it -=20
> > > > > > you need a system toplevel which instantiates memories and=20
> > > > > > some reset circuitry and likely some IO (UART, GPIO, JTAG =
debug, etc.) to talk to the outside world.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Is that helpful?
> > > > > >
> > > > > >
> > > > > >
> > > > > > Cheers,
> > > > > >
> > > > > > Julius
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Wed, 11 Sep 2019 at 19:47, <ecalvo@2se.es =
<mailto:ecalvo@2se.es> > wrote:
> > > > > >
> > > > > > Dear Dr. Baxter,
> > > > > >
> > > > > >
> > > > > >
> > > > > > My name is Elisa Calvo Gallego. I am writing you because I=20
> > > > > > have started to work with OpenRISC in the framework of a=20
> > > > > > research project developed in the company where I am working =

> > > > > > (Space Submicron Electronics, 2SE), and I am having some =
basic troubles. Could you help me?
> > > > > >
> > > > > >
> > > > > >
> > > > > > Although the FPGA that we are planning to use is larger, I=20
> > > > > > have synthetized mor1kx for a DE0 nano board as first step=20
> > > > > > (this is the board used in the majority of guides and=20
> > > > > > tutorials). My problem is that the results that I have=20
> > > > > > obtained are similar in area and resources, except for IOBs, =

> > > > > > which are more than available IOBs in the device. Do you =
know what I am doing wrong?
> > > > > > Should I comment debug lines or something like that? I=20
> > > > > > apologize if the question is immediate. I didn't find the =
answer and I'm new in this.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Thanks very much in advance.
> > > > > >
> > > > > > Best regards,
> > > > > >
> > > > > >
> > > > > >
> > > > > > Elisa
> > > > > >
> > > > > >
> > > >
> >
>=20


------=_NextPart_000_0163_01D58A4C.0BFA0560
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI Emoji";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EstiloCorreo18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DES link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>Okkk. I will check =
version numbers first and, if not, I will look into traces. =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>I will come back to you if I =
discover the problem. <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>Thanks a lot Stafford. =
=C2=A0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>-Elisa<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b>De:</b> Stafford Horne &lt;shorne@gmail.com&gt; =
<br><b>Enviado el:</b> jueves, 24 de octubre de 2019 =
1:06<br><b>Para:</b> ecalvo@2se.es<br><b>CC:</b> Openrisc =
&lt;openrisc@lists.librecores.org&gt;<br><b>Asunto:</b> Re: PCCR and =
PCRM registers<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>+ cc =
OpenRISC lost<o:p></o:p></p></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal>On =
Thu, Oct 24, 2019, 6:05 AM Stafford Horne &lt;<a =
href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; =
wrote:<o:p></o:p></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><p class=3DMsoNormal>Hi =
Elisa,<br><br>On Wed, Oct 23, 2019 at 09:47:24AM +0200, <a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a> =
wrote:<br>&gt; Hi Stafford, <br>&gt; <br>&gt; Sorry for the delay in the =
answer. I have been out of the office. <br>&gt; <br>&gt; I am using =
mor1kx 4.1. What I have done is change FEATURE_PERFCOUNTERS to ENABLED =
in orpsoc_top.c in the library of FuseSoc.. I have also changed =
OPTION_PERFCOUNTERS_NUM but I have no seen changes in the output. =
<br><br>The versions I am using are (as reported by =
busesoc):<br><br>INFO: Preparing ::adv_debug_sys:3.1.0-r1<br>INFO: =
Preparing ::cdc_utils:0.1<br>INFO: Preparing ::elf-loader:1.0.2<br>INFO: =
Preparing ::intgen:0<br>INFO: Preparing ::jtag_tap:1.13-r1<br>INFO: =
Preparing ::jtag_vpi:0-r4<br>INFO: Preparing ::mor1kx:5.0-r3<br>INFO: =
Preparing ::uart16550:1.5.5-r1<br>INFO: Preparing =
::verilog-arbiter:0-r2<br>INFO: Preparing ::vlog_tb_utils:1.1<br>INFO: =
Preparing ::wb_common:1.0.3<br>INFO: Preparing ::wb_bfm:1.2.1<br>INFO: =
Preparing ::wb_intercon:1.2.2<br>INFO: Preparing ::wb_ram:1.1<br>INFO: =
Preparing ::mor1kx-generic:1.1<br><br>The changes I made in =
mor1kx-generic are:<br><br>diff --git a/mor1kx-generic.core =
b/mor1kx-generic.core<br>index afc3607..f3160b5 100644<br>--- =
a/mor1kx-generic.core<br>+++ b/mor1kx-generic.core<br>@@ -10,7 +10,6 @@ =
filesets:<br>&nbsp; &nbsp;marocchino_modules:<br>&nbsp; &nbsp; =
&nbsp;depend:<br>&nbsp; &nbsp; &nbsp; &nbsp;- =
or1k_marocchino<br>-<br>&nbsp; &nbsp;soc_files:<br>&nbsp; &nbsp; =
&nbsp;files:<br>&nbsp; &nbsp; &nbsp; &nbsp;- rtl/verilog/wb_intercon.vh: =
{is_include_file: true}<br>@@ -31,7 +30,7 @@ filesets:<br>&nbsp; &nbsp; =
&nbsp;file_type: verilogSource<br>&nbsp; &nbsp; &nbsp;depend:<br>&nbsp; =
&nbsp; &nbsp; &nbsp;- elf-loader<br>-&nbsp; &nbsp; &nbsp; - =
&quot;=3Djtag_vpi-r2&quot;<br>+&nbsp; &nbsp; &nbsp; - =
&quot;&gt;=3Djtag_vpi-r2&quot;<br>&nbsp; &nbsp; &nbsp; &nbsp;- =
&quot;&gt;=3Dvlog_tb_utils-1.0&quot;<br>&nbsp; =
&nbsp;verilator_tb_files:<br>&nbsp; &nbsp; &nbsp;files:<br>diff --git =
a/rtl/verilog/orpsoc_top.v b/rtl/verilog/orpsoc_top.v<br>index =
e2b04d6..4530e1d 100644<br>--- a/rtl/verilog/orpsoc_top.v<br>+++ =
b/rtl/verilog/orpsoc_top.v<br>@@ -266,6 +266,8 @@ mor1kx #(<br>&nbsp; =
&nbsp; &nbsp; &nbsp; .OPTION_RF_NUM_SHADOW_GPR&nbsp; &nbsp; &nbsp; =
&nbsp;(option_rf_num_shadow_gpr),<br>&nbsp; &nbsp; &nbsp; &nbsp; =
.IBUS_WB_TYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;(&quot;B3_REGISTERED_FEEDBACK&quot;),<br>&nbsp; &nbsp; =
&nbsp; &nbsp; .DBUS_WB_TYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; =
&nbsp;(&quot;B3_REGISTERED_FEEDBACK&quot;),<br>+&nbsp; &nbsp; &nbsp; =
&nbsp;.FEATURE_PERFCOUNTERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;(&quot;ENABLED&quot;),<br>+&nbsp; &nbsp; &nbsp; =
&nbsp;.OPTION_PERFCOUNTERS_NUM&nbsp; &nbsp; &nbsp; &nbsp; (3),<br>&nbsp; =
&nbsp; &nbsp; &nbsp; .OPTION_CPU0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (pipeline),<br>&nbsp; &nbsp; &nbsp; =
&nbsp; .OPTION_RESET_PC&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (32'h00000100)<br>&nbsp;) mor1kx0 (<br><br><br>If using this =
version is not possible then it would be best that you look =
into<br>traces and try to get some insight to where things are getting =
stuck.<br><br>-Stafford<br><br>&gt; Output: <br>&gt; We have 1 program =
counters. <br>&gt;&nbsp; (hanged) <br>&gt; <br>&gt; I have checked that =
features have been modified in the fuse build files. <br>&gt; <br>&gt; =
Elisa<br>&gt; <br>&gt; <br>&gt; <br>&gt; -----Mensaje =
original-----<br>&gt; De: Stafford Horne &lt;<a =
href=3D"mailto:shorne@gmail.com" =
target=3D"_blank">shorne@gmail.com</a>&gt; <br>&gt; Enviado el: viernes, =
18 de octubre de 2019 16:41<br>&gt; Para: <a =
href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a><br>&gt; CC: Openrisc &lt;<a =
href=3D"mailto:openrisc@lists.librecores.org" =
target=3D"_blank">openrisc@lists.librecores.org</a>&gt;<br>&gt; Asunto: =
Re: PCCR and PCRM registers<br>&gt; <br>&gt; Hello,<br>&gt; <br>&gt; =
Which core are you using?&nbsp; With mor1kx I did not have an issue with =
hanging.&nbsp; I had to enable perf counters via parameters.<br>&gt; =
<br>&gt; I extended and posted my example code here:<br>&gt; <a =
href=3D"https://gist.github.com/stffrdhrn/6343706cb1d8124bbac6bb579b6913b=
0" =
target=3D"_blank">https://gist.github.com/stffrdhrn/6343706cb1d8124bbac6b=
b579b6913b0</a><br>&gt; <br>&gt; The results looks like:<br>&gt; =
<br>&gt;&nbsp; Compile: or1k-elf-gcc or1k-perfcounters.c<br>&gt;&nbsp; =
Run: fusesoc run --target mor1kx_tb mor1kx-generic --elf-load =
./a.out<br>&gt; <br>&gt;&nbsp; Example Output:<br>&gt; <br>&gt;&nbsp; We =
have 4 program counters.<br>&gt;&nbsp; PCCR before setup 0<br>&gt;&nbsp; =
Run a printf, to generate instructions..<br>&gt;&nbsp; IF =
1825<br>&gt;&nbsp; ICS 237<br>&gt; <br>&gt;&nbsp; This shows that the =
printf took 1825 instructions, 237 times the pipeline&nbsp; stalled due =
to instruction cache misses.<br>&gt; <br>&gt; On Fri, Oct 18, 2019 at =
7:51 PM &lt;<a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; =
Hi Stafford,<br>&gt; &gt;<br>&gt; &gt; Sorry for bothering you =
again.<br>&gt; &gt;<br>&gt; &gt; The program is hanged accessing to PCMR =
and PCCR registers. Should I change other features apart from =
perfcounters?<br>&gt; &gt;<br>&gt; &gt; Elisa<br>&gt; &gt;<br>&gt; &gt; =
-----Mensaje original-----<br>&gt; &gt; De: Stafford Horne &lt;<a =
href=3D"mailto:shorne@gmail.com" =
target=3D"_blank">shorne@gmail.com</a>&gt;<br>&gt; &gt; Enviado el: =
jueves, 17 de octubre de 2019 23:42<br>&gt; &gt; Para: <a =
href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a><br>&gt; &gt; CC: Openrisc &lt;<a =
href=3D"mailto:openrisc@lists.librecores.org" =
target=3D"_blank">openrisc@lists.librecores.org</a>&gt;<br>&gt; &gt; =
Asunto: Re: PCCR and PCRM registers<br>&gt; &gt;<br>&gt; &gt; Hi =
Elisa,<br>&gt; &gt;<br>&gt; &gt; Right, these are the functions.&nbsp; =
You only need to be concerned with:<br>&gt; &gt;&nbsp; =
&nbsp;OR1K_SPR_PERF_PCCR_ADDR(n)<br>&gt; &gt;&nbsp; =
&nbsp;OR1K_SPR_PERF_PCMR_ADDR(n)<br>&gt; &gt;&nbsp; =
&nbsp;OR1K_SPR_SYS_PCCFGR_ADDR<br>&gt; &gt;&nbsp; =
&nbsp;OR1K_SPR_SYS_PCCFGR_NPC_GET(x)<br>&gt; &gt;<br>&gt; &gt; The =
others are used internally.<br>&gt; &gt; The PCCFGR is read only, it =
specifies how many performance counters your CPU has built in.&nbsp; It =
may be 0-7.<br>&gt; &gt;<br>&gt; &gt; An example of how to use =
them:<br>&gt; &gt;<br>&gt; &gt; #include &lt;or1k-support.h&gt;<br>&gt; =
&gt; #include &lt;or1k-sprs.h&gt;<br>&gt; &gt; #include =
&lt;stdio.h&gt;<br>&gt; &gt;<br>&gt; &gt; #define PCMR_CISM =
1&lt;&lt;3<br>&gt; &gt; #define PCMR_CIUM 1&lt;&lt;3<br>&gt; &gt; =
#define PCMR_IF&nbsp; &nbsp;1&lt;&lt;6<br>&gt; &gt;<br>&gt; &gt; int =
main() {<br>&gt; &gt;<br>&gt; &gt;&nbsp; &nbsp;int =
number_of_pcs;<br>&gt; &gt;&nbsp; &nbsp;uint32_t pcmr, pccr, upr, =
pccfgr;<br>&gt; &gt;<br>&gt; &gt;&nbsp; &nbsp;/* Check if PCs are even =
available */<br>&gt; &gt;&nbsp; &nbsp;upr =3D =
or1k_mfspr(OR1K_SPR_SYS_UPR_ADDR);<br>&gt; &gt;<br>&gt; &gt;&nbsp; =
&nbsp;if (OR1K_SPR_SYS_UPR_PCUP_GET(upr)) {<br>&gt; &gt;<br>&gt; =
&gt;&nbsp; &nbsp; &nbsp;pccfgr =3D =
or1k_mfspr(OR1K_SPR_SYS_PCCFGR_ADDR);<br>&gt; &gt;&nbsp; &nbsp; =
&nbsp;number_of_pcs =3D OR1K_SPR_SYS_PCCFGR_NPC_GET(pccfgr) + 1;<br>&gt; =
&gt;<br>&gt; &gt;&nbsp; &nbsp; &nbsp;printf (&quot;We have %d program =
counters.\n&quot;, number_of_pcs);<br>&gt; &gt;<br>&gt; &gt;&nbsp; =
&nbsp; &nbsp;pccr =3D or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0));<br>&gt; =
&gt;&nbsp; &nbsp; &nbsp;printf (&quot;PCCR before setup %x\n&quot;, =
pccr);<br>&gt; &gt;<br>&gt; &gt;&nbsp; &nbsp; &nbsp;/* Turn on counter =
and enable instruction fetch counting */<br>&gt; &gt;&nbsp; &nbsp; =
&nbsp;pcmr =3D or1k_mfspr(OR1K_SPR_PERF_PCMR_ADDR(0));<br>&gt; =
&gt;&nbsp; &nbsp; &nbsp;pcmr |=3D PCMR_CISM | PCMR_CIUM | =
PCMR_IF;<br>&gt; &gt;&nbsp; &nbsp; =
&nbsp;or1k_mtspr(OR1K_SPR_PERF_PCMR_ADDR(0), pcmr);<br>&gt; &gt;<br>&gt; =
&gt;&nbsp; &nbsp; &nbsp;/* Read the PCCR after we are done */<br>&gt; =
&gt;&nbsp; &nbsp; &nbsp;printf (&quot;Run a printf.&quot;);<br>&gt; =
&gt;&nbsp; &nbsp; &nbsp;pccr =3D =
or1k_mfspr(OR1K_SPR_PERF_PCCR_ADDR(0));<br>&gt; &gt;&nbsp; &nbsp; =
&nbsp;printf (&quot;PCCR after printf %x\n&quot;, pccr);<br>&gt; =
&gt;&nbsp; &nbsp;} else {<br>&gt; &gt;&nbsp; &nbsp; &nbsp;printf =
(&quot;No performance counters available.\n&quot;);<br>&gt; &gt;&nbsp; =
&nbsp;}<br>&gt; &gt;<br>&gt; &gt;&nbsp; &nbsp;return 0;<br>&gt; &gt; =
}<br>&gt; &gt;<br>&gt; &gt; On Fri, Oct 18, 2019 at 12:01 AM &lt;<a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>&gt; =
wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi Stafford,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Yes, I am =
using newlib. I had discovered both files; these registers <br>&gt; &gt; =
&gt; in sprs.h<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; /******************************/<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; /* Performance Counters Group */<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; /******************************/<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; #define OR1K_SPR_PERF_GROUP 0x07<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; /* =
Performance Counters Count Registers */<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt; #define OR1K_SPR_PERF_PCCR_BASE&nbsp; &nbsp; =
&nbsp;OR1K_UNSIGNED(0x000)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; #define =
OR1K_SPR_PERF_PCCR_COUNT&nbsp; &nbsp; OR1K_UNSIGNED(0x008)<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_STEP&nbsp; &nbsp; =
&nbsp;OR1K_UNSIGNED(0x001)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; #define =
OR1K_SPR_PERF_PCCR_INDEX(N) (OR1K_SPR_PERF_PCCR_BASE + ((N) <br>&gt; =
&gt; &gt; *<br>&gt; &gt; &gt; OR1K_SPR_PERF_PCCR_STEP))<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; #define OR1K_SPR_PERF_PCCR_ADDR(N)&nbsp; =
((OR1K_SPR_PERF_GROUP &lt;&lt;<br>&gt; &gt; &gt; OR1K_SPR_GROUP_LSB) | =
OR1K_SPR_PERF_PCCR_INDEX(N))<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; /* Performance Counters Mode Registers =
*/<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; #define =
OR1K_SPR_PERF_PCMR_BASE&nbsp; &nbsp; &nbsp;OR1K_UNSIGNED(0x008)<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_COUNT&nbsp; =
&nbsp; OR1K_UNSIGNED(0x008)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; #define =
OR1K_SPR_PERF_PCMR_STEP&nbsp; &nbsp; &nbsp;OR1K_UNSIGNED(0x001)<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; #define OR1K_SPR_PERF_PCMR_INDEX(N) =
(OR1K_SPR_PERF_PCMR_BASE + ((N)<br>&gt; &gt; &gt; =
*OR1K_SPR_PERF_PCMR_STEP))<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; #define =
OR1K_SPR_PERF_PCMR_ADDR(N)&nbsp; ((OR1K_SPR_PERF_GROUP &lt;&lt;<br>&gt; =
&gt; &gt; OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCMR_INDEX(N))<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; /* =
Performance Counters Configuration */<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt; #define OR1K_SPR_SYS_PCCFGR_INDEX OR1K_UNSIGNED(0x008)<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_ADDR&nbsp; =
OR1K_UNSIGNED(0x0008)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; /* Number of Performance Counters */<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_LSB&nbsp; &nbsp; =
0<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; #define =
OR1K_SPR_SYS_PCCFGR_NPC_MSB&nbsp; &nbsp; 2<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_BITS&nbsp; &nbsp;3<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; #define OR1K_SPR_SYS_PCCFGR_NPC_MASK&nbsp; =
&nbsp;OR1K_UNSIGNED(0x00000007)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =
#define OR1K_SPR_SYS_PCCFGR_NPC_GET(X) (((X) &gt;&gt; 0) &amp;<br>&gt; =
&gt; &gt; OR1K_UNSIGNED(0x00000007))<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =
#define OR1K_SPR_SYS_PCCFGR_NPC_SET(X, Y) (((X) &amp;<br>&gt; &gt; &gt; =
OR1K_UNSIGNED(0xfffffff8)) | ((Y) &lt;&lt; 0))<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; And these functions in =
support.h<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; static inline void or1k_mtspr (uint32_t spr, uint32_t =
value)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; static inline uint32_t =
or1k_mfspr (uint32_t spr)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; Despite this I don=E2=80=99t have clear how =
to use it.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; If I do: or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , 0)&nbsp; -&gt; =
Does it allow me to configure the PCCFGR to one performance =
counter?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Is This the same than =
or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , OR1K_SPR_SYS_PCCFGR_NPC_LSB ) =
or&nbsp; Do OR1K_SPR_SYS_PCCFGR_NPC_LSB&nbsp; &nbsp;, =
OR1K_SPR_SYS_PCCFGR_NPC_MSB, etc. provide different functions on each =
one performance counter?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; What is the =
meaning of PCCR_BASE,&nbsp; PCCR_COUNT, PCCR_STEP, <br>&gt; &gt; &gt; =
PCMR_INDEX(N), PCMR_ADDR(N) ? (the same for PCMR) (Is BASE the base =
address of all PCCR and ADDR the position of each one of them? =
=E2=80=A6.why PCMR_BASE and COUNT hasta de same value =
OR1K_UNSIGNED(0x008)? ) Should I define first PCCFGR, second PCMR and =
last get PCCR?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Thanks and sorry for the inconveniences.<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; Elisa<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; De: Stafford Horne &lt;<a =
href=3D"mailto:shorne@gmail.com" =
target=3D"_blank">shorne@gmail.com</a>&gt; Enviado el: jueves, 17 de =
<br>&gt; &gt; &gt; octubre de 2019 7:14<br>&gt; &gt; &gt; Para: <a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>; =
Openrisc &lt;<a href=3D"mailto:openrisc@lists.librecores.org" =
target=3D"_blank">openrisc@lists.librecores.org</a>&gt;<br>&gt; &gt; =
&gt; Asunto: Re: PCCR and PCRM registers<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; +cc mailing list,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi =
Elisa,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Which toolchain are you using? I guess newlib?<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; It has =
functions like or1k_mfspr() and or1k_mtspr() see or1k-support.h and =
or1k-sprs.h headers for details.<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; -Stafford<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; On Wed, Oct 16, 2019, 8:40 PM &lt;<a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>&gt; =
wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi Stafford,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; I am with PCCR and PCRM registers. I have seen =
that I can access from asm language, but there is functions to access =
from C? Have you got any example about their usage?<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; I have already confirmed my subscription to the =
mailing list.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Thanks<br>&gt; &gt; =
&gt; Elisa<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; -----Mensaje =
original-----<br>&gt; &gt; &gt; De: Stafford Horne &lt;<a =
href=3D"mailto:shorne@gmail.com" =
target=3D"_blank">shorne@gmail.com</a>&gt; Enviado el: mi=C3=A9rcoles, 9 =
de <br>&gt; &gt; &gt; octubre de 2019 13:38<br>&gt; &gt; &gt; Para: <a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>; =
Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank">juliusbaxter@gmail.com</a>&gt;<br>&gt; &gt; &gt; =
Asunto: Re: other doubt<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hello =
Elisa,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; If you simulate with Icarus =
or modelsim you will be able to measure pretty much the same performance =
characteristics as FPGA. So there is no need to go straight to =
FPGA.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; In terms of my example C code =
is one option.&nbsp; You can also read timer data directly from the tick =
timer in assembly and achieve the same thing.<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; If you are interested we can CC the mailing list and get more =
opinions.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; -Stafford<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; On Wed, Oct 9, 2019 at 5:09 PM &lt;<a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>&gt; =
wrote:<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Hi =
Stafford,<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Nice to meet you =
and, first of all, thanks a lot for your guidance. I am new on this, and =
although there is some documentation, sometimes it is difficult some =
point which maybe it is basic.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; Ok, to your comments. If..&quot;A simulator like QEMU or or1ksim =
will not give and exact representation of the CPUs real time =
performance&quot;...then...if I simulate directly the processor with =
modelsim, icarus or a similar tool...neither I get a real performance, =
don=E2=80=99t I? And values for the counters that you tell me to enable, =
neither are real, isn't it? should I execute it directly on the FPGA and =
it will depends on the implementation?<br>&gt; &gt; &gt; &gt;<br>&gt; =
&gt; &gt; &gt; Ok, to C code. I have understood the dependency with =
toolchain.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Thanks a lot =
again.<br>&gt; &gt; &gt; &gt; Best regards,<br>&gt; &gt; &gt; &gt; =
Elisa<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; -----Mensaje original-----<br>&gt; &gt; &gt; &gt; De: Stafford =
Horne &lt;<a href=3D"mailto:shorne@gmail.com" =
target=3D"_blank">shorne@gmail.com</a>&gt; Enviado el: martes, 8 de =
<br>&gt; &gt; &gt; &gt; octubre de 2019 16:18<br>&gt; &gt; &gt; &gt; =
Para: Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank">juliusbaxter@gmail.com</a>&gt;<br>&gt; &gt; &gt; &gt; =
CC: <a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a><br>&gt; &gt; &gt; &gt; Asunto: Re: =
other doubt<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Hi =
Elisa,<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; OpenRISC cpu's can =
run any algorithm, but how well it will perform depends on many =
things:<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp;- =
Compiler optimization flags (i.e. -O3)<br>&gt; &gt; &gt; &gt;&nbsp; =
&nbsp;- Whether or not you are doing FPU instructions and have FPU =
enabled<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp;- Whether or not you use =
multiply and divide and have these instructions<br>&gt; &gt; &gt; =
&gt;&nbsp; &nbsp; &nbsp;enabled<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp;- The =
frequency you are running<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp;- Cache =
settings Icache Dcache<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp;- The type of =
algorithm, does it require lots of data which will cause many<br>&gt; =
&gt; &gt; &gt;&nbsp; &nbsp; &nbsp;cache misses?<br>&gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; A simulator like QEMU or or1ksim will not =
give and exact representation of the CPUs real time performance.&nbsp; =
It can tell you which intructions will be executed, but not how fast =
those will run or how many pipeline stalls of cache misses will =
happen.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; You can use the =
performance counters, they are supported in mor1kx if you enable them =
with the FEATURE_PERFCOUNTERS=3D'ENABLED' parameter.&nbsp; They can help =
count how many events happen between certain events.&nbsp; Then you can =
combine them with a timer and watchpoints to detect how many times a =
loop can execute in 1000 clock cycles etc.&nbsp; Please read about PCCRn =
and PCMRn in the architecture manual.<br>&gt; &gt; &gt; &gt;<br>&gt; =
&gt; &gt; &gt; It might be just as easy to use simple timing in a c =
program though, depending on the toolchain you use you can compare times =
between runs of your algorithm.<br>&gt; &gt; &gt; &gt; i.e.<br>&gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;#include =
&lt;time.h&gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;#include =
&lt;stdio.h&gt;<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;&nbsp; =
&nbsp; &nbsp;static long to_micro(struct timespec *time) {<br>&gt; &gt; =
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;return (time-&gt;tv_sec * 1000000) + =
(time-&gt;tv_nsec / 1000);<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; =
&nbsp;}<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; =
&nbsp;int main() {<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;int =
i, j =3D 0;<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; =
&nbsp; &nbsp;struct timespec before, after;<br>&gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;clock_gettime(CLOCK_MONOTONIC, &amp;before);<br>&gt; &gt; &gt; =
&gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Super complex algorithm */<br>&gt; =
&gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;for (int i =3D 0; i &lt; 100; =
i++) {<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;j =3D =
(j+1) * (j+2);<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;}<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;clock_gettime(CLOCK_MONOTONIC, &amp;after);<br>&gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;time =
to run algorithm %ld uSecs\n&quot;, to_micro(&amp;after) <br>&gt; &gt; =
&gt; &gt; - to_micro(&amp;before));<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>&gt; &gt; &gt; =
&gt;&nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
$ or1k-smh-linux-gnu-gcc timer.c<br>&gt; &gt; &gt; &gt; $ =
./glibc-build-scripts/qemu-or1k-libc ./a.out time to run <br>&gt; &gt; =
&gt; &gt; algorithm<br>&gt; &gt; &gt; &gt; 164 uSecs<br>&gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; I hope it helps.<br>&gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; -Stafford<br>&gt; &gt; &gt; &gt;<br>&gt; =
&gt; &gt; &gt; On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter =
wrote:<br>&gt; &gt; &gt; &gt; &gt; Hi,<br>&gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; No problem.<br>&gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; There are performance counters in the =
OpenRISC architecture but <br>&gt; &gt; &gt; &gt; &gt; whether they're =
implemented in a particular implementation is another matter.<br>&gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; You can use these =
registers to measure various things the CPU is <br>&gt; &gt; &gt; &gt; =
&gt; doing while it's executing. If you read the ISA document it'll =
<br>&gt; &gt; &gt; &gt; &gt; tell you about them.<br>&gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; I'm CCing Stafford because he's the =
main OpenRISC man these days <br>&gt; &gt; &gt; &gt; &gt; and probably =
knows about the state of the performance counter <br>&gt; &gt; &gt; &gt; =
&gt; registers in various simulators and RTL implementations.<br>&gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; Cheers,<br>&gt; &gt; =
&gt; &gt; &gt; Julius<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; On Tue., 8 Oct. 2019, 10:43 pm , &lt;<a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>&gt; =
wrote:<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Hi =
Julius,<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
Sorry for bothering you again <span style=3D'font-family:"Segoe UI =
Emoji",sans-serif'>=E2=98=B9</span>. Can I do you other fast <br>&gt; =
&gt; &gt; &gt; &gt; &gt; question related to openrisc? If not, ignore =
the email please.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt; Is there any way to characterize the type of application that =
<br>&gt; &gt; &gt; &gt; &gt; &gt; I can run in openrisc? I mean, could =
you measure (with <br>&gt; &gt; &gt; &gt; &gt; &gt; numbers) if an =
algorithm can be executed on it and the speed that it will =
achieve?<br>&gt; &gt; &gt; &gt; &gt; &gt; Is it possible to do it using =
orksim?<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
Sorry because maybe it is so basic and general <span =
style=3D'font-family:"Segoe UI =
Emoji",sans-serif'>=E2=98=B9</span><br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Thanks in advance<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Elisa<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; *De:* Julius Baxter &lt;<a =
href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank">juliusbaxter@gmail.com</a>&gt; *Enviado el:* <br>&gt; =
&gt; &gt; &gt; &gt; &gt; lunes,<br>&gt; &gt; &gt; &gt; &gt; &gt; 16 de =
septiembre de 2019 13:11<br>&gt; &gt; &gt; &gt; &gt; &gt; *Para:* <a =
href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a><br>&gt; &gt; &gt; &gt; &gt; &gt; =
*Asunto:* Re: Starting with OpenRISC - IOBs<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Also! To let you know, if you're =
in Spain, we will soon be <br>&gt; &gt; &gt; &gt; &gt; &gt; having our =
ORConf conference in Europe, and it's in Bordeaux, <br>&gt; &gt; &gt; =
&gt; &gt; &gt; France, just across the border. :)<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; There are several people there who =
can help you get up to <br>&gt; &gt; &gt; &gt; &gt; &gt; speed, one of =
whom is Stafford Horne who knows most about the <br>&gt; &gt; &gt; &gt; =
&gt; &gt; OpenRISC IP lately. He will be presenting. If you can attend, =
it'd be helpful, I'm sure.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt; All info at <a href=3D"https://orconf.org" =
target=3D"_blank">https://orconf.org</a><br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Cheers,<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Julius<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; On Mon, 16 Sep 2019 at 21:09, =
Julius Baxter <br>&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a =
href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank">juliusbaxter@gmail.com</a>&gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt; wrote:<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt; Hi Elisa,<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt; Sorry for the delay in this response.<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; You should be using an SoC =
toplevel. FPGAs have everything you <br>&gt; &gt; &gt; &gt; &gt; &gt; =
need on board like memories and IO blocks and lots of other <br>&gt; =
&gt; &gt; &gt; &gt; &gt; FPGA fabric for you to implement other pieces =
of hardware.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt; FuseSoC provides a really nice and easy way to build an mor1kx =
<br>&gt; &gt; &gt; &gt; &gt; &gt; design for the DE0 nano I =
believe:<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
<a href=3D"https://github.com/olofk/de0_nano" =
target=3D"_blank">https://github.com/olofk/de0_nano</a><br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; That github page has a =
rough guide to getting it going.<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; If you need help I recommend =
posting to the OpenRISC mailing <br>&gt; &gt; &gt; &gt; &gt; &gt; list =
and people will respond probably more promptly than I. (I <br>&gt; &gt; =
&gt; &gt; &gt; &gt; recommend getting to know how to use mailing =
lists.<br>&gt; &gt; &gt; &gt; &gt; &gt; <a =
href=3D"https://openrisc.io/community" =
target=3D"_blank">https://openrisc.io/community</a><br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; There are more resources =
here: <a href=3D"https://openrisc.io/tutorials" =
target=3D"_blank">https://openrisc.io/tutorials</a><br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; I hope that's =
helpful.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
Cheers,<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt; Julius<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
On Wed, 11 Sep 2019 at 20:09, &lt;<a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a>&gt; wrote:<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Hi Julius,<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Thanks a lot for the quick =
answer.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
Yes, this is the problem: I am using as top level the mor1kx <br>&gt; =
&gt; &gt; &gt; &gt; &gt; module itself. You mean that I need to =
synthetize also in <br>&gt; &gt; &gt; &gt; &gt; &gt; reconfigurable =
logic these cores, don=E2=80=99t you? I thought that I <br>&gt; &gt; =
&gt; &gt; &gt; &gt; could have these elements as external in a =
development board.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt; Thanks again,<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt; Cheers<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt; Elisa<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt; *De:* Julius Baxter &lt;<a =
href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank">juliusbaxter@gmail.com</a>&gt; *Enviado el:* <br>&gt; =
&gt; &gt; &gt; &gt; &gt; mi=C3=A9rcoles, 11 de septiembre de 2019 =
12:02<br>&gt; &gt; &gt; &gt; &gt; &gt; *Para:* <a =
href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a><br>&gt; &gt; &gt; &gt; &gt; &gt; =
*Asunto:* Re: Starting with OpenRISC - IOBs<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Hi Elisa,<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Thanks for getting in touch, that =
sounds like a cool project.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; =
&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt; Can you tell me about the toplevel - are you using a =
system <br>&gt; &gt; &gt; &gt; &gt; &gt; toplevel, or is your toplevel =
the mor1kx module itself?<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt; If it's the latter, then that's not the best way to do it =
- <br>&gt; &gt; &gt; &gt; &gt; &gt; you need a system toplevel which =
instantiates memories and <br>&gt; &gt; &gt; &gt; &gt; &gt; some reset =
circuitry and likely some IO (UART, GPIO, JTAG debug, etc.) to talk to =
the outside world.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt; Is that helpful?<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt; Cheers,<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt; Julius<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt; On Wed, 11 Sep 2019 at 19:47, &lt;<a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank">ecalvo@2se.es</a>&gt; =
wrote:<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
Dear Dr. Baxter,<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt; My name is Elisa Calvo Gallego. I am writing you because I <br>&gt; =
&gt; &gt; &gt; &gt; &gt; have started to work with OpenRISC in the =
framework of a <br>&gt; &gt; &gt; &gt; &gt; &gt; research project =
developed in the company where I am working <br>&gt; &gt; &gt; &gt; &gt; =
&gt; (Space Submicron Electronics, 2SE), and I am having some basic =
troubles. Could you help me?<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; =
&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; =
&gt; &gt; &gt; &gt; Although the FPGA that we are planning to use is =
larger, I <br>&gt; &gt; &gt; &gt; &gt; &gt; have synthetized mor1kx for =
a DE0 nano board as first step <br>&gt; &gt; &gt; &gt; &gt; &gt; (this =
is the board used in the majority of guides and <br>&gt; &gt; &gt; &gt; =
&gt; &gt; tutorials). My problem is that the results that I have =
<br>&gt; &gt; &gt; &gt; &gt; &gt; obtained are similar in area and =
resources, except for IOBs, <br>&gt; &gt; &gt; &gt; &gt; &gt; which are =
more than available IOBs in the device. Do you know what I am doing =
wrong?<br>&gt; &gt; &gt; &gt; &gt; &gt; Should I comment debug lines or =
something like that? I <br>&gt; &gt; &gt; &gt; &gt; &gt; apologize if =
the question is immediate. I didn't find the answer and I'm new in =
this.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; =
Thanks very much in advance.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; =
&gt; &gt; &gt; &gt; &gt; Best regards,<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Elisa<br>&gt; &gt; &gt; &gt; &gt; =
&gt;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;<br>&gt; =
&gt;<br>&gt; <o:p></o:p></p></blockquote></div></div></body></html>
------=_NextPart_000_0163_01D58A4C.0BFA0560--


--===============1251098167063101545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1251098167063101545==--

