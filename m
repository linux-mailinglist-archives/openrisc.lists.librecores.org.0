Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 008C1DB0A2
	for <lists+openrisc@lfdr.de>; Thu, 17 Oct 2019 17:01:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8D23E206B9;
	Thu, 17 Oct 2019 17:01:04 +0200 (CEST)
Received: from llsd409-a17.servidoresdns.net (llsd409-a17.servidoresdns.net
 [82.223.190.34])
 by mail.librecores.org (Postfix) with ESMTPS id 2135E2047B
 for <openrisc@lists.librecores.org>; Thu, 17 Oct 2019 17:01:03 +0200 (CEST)
Received: from EW10PR1SI054 (unknown [185.70.174.4])
 by llsd409-a17.servidoresdns.net (Postfix) with ESMTPA id 46vC6555f4z1wTp;
 Thu, 17 Oct 2019 17:01:01 +0200 (CEST)
From: <ecalvo@2se.es>
To: "'Stafford Horne'" <shorne@gmail.com>,
 "'Openrisc'" <openrisc@lists.librecores.org>
References: <009d01d58416$7125fe80$5371fb80$@2se.es>
 <CAAfxs76G9Tyygv-5F+y-v9WkKyqO99W2aiBtejB54-qV-OBiFQ@mail.gmail.com>
In-Reply-To: <CAAfxs76G9Tyygv-5F+y-v9WkKyqO99W2aiBtejB54-qV-OBiFQ@mail.gmail.com>
Date: Thu, 17 Oct 2019 17:01:03 +0200
Message-ID: <00ef01d584fb$b271ae30$17550a90$@2se.es>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGt80GvhaiLZskMfgaoczNFlXkQZQHXM3Ftp59MqjA=
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
Content-Type: multipart/mixed; boundary="===============4067613193719795269=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This is a multipart message in MIME format.

--===============4067613193719795269==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00F0_01D5850C.75FCC820"
Content-Language: es

This is a multipart message in MIME format.

------=_NextPart_000_00F0_01D5850C.75FCC820
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stafford,=20

=20

Yes, I am using newlib. I had discovered both files; these registers in =
sprs.h=20

=20

/******************************/

/* Performance Counters Group */

/******************************/

#define OR1K_SPR_PERF_GROUP 0x07

=20

/* Performance Counters Count Registers */

#define OR1K_SPR_PERF_PCCR_BASE     OR1K_UNSIGNED(0x000)

#define OR1K_SPR_PERF_PCCR_COUNT    OR1K_UNSIGNED(0x008)

#define OR1K_SPR_PERF_PCCR_STEP     OR1K_UNSIGNED(0x001)

#define OR1K_SPR_PERF_PCCR_INDEX(N) (OR1K_SPR_PERF_PCCR_BASE + ((N) * =
OR1K_SPR_PERF_PCCR_STEP))

#define OR1K_SPR_PERF_PCCR_ADDR(N)  ((OR1K_SPR_PERF_GROUP << =
OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCCR_INDEX(N))

=20

/* Performance Counters Mode Registers */

#define OR1K_SPR_PERF_PCMR_BASE     OR1K_UNSIGNED(0x008)

#define OR1K_SPR_PERF_PCMR_COUNT    OR1K_UNSIGNED(0x008)

#define OR1K_SPR_PERF_PCMR_STEP     OR1K_UNSIGNED(0x001)

#define OR1K_SPR_PERF_PCMR_INDEX(N) (OR1K_SPR_PERF_PCMR_BASE + ((N) =
*OR1K_SPR_PERF_PCMR_STEP))

#define OR1K_SPR_PERF_PCMR_ADDR(N)  ((OR1K_SPR_PERF_GROUP << =
OR1K_SPR_GROUP_LSB) | OR1K_SPR_PERF_PCMR_INDEX(N))

=20

/* Performance Counters Configuration */

#define OR1K_SPR_SYS_PCCFGR_INDEX OR1K_UNSIGNED(0x008)

#define OR1K_SPR_SYS_PCCFGR_ADDR  OR1K_UNSIGNED(0x0008)

=20

/* Number of Performance Counters */

#define OR1K_SPR_SYS_PCCFGR_NPC_LSB    0

#define OR1K_SPR_SYS_PCCFGR_NPC_MSB    2

#define OR1K_SPR_SYS_PCCFGR_NPC_BITS   3

#define OR1K_SPR_SYS_PCCFGR_NPC_MASK   OR1K_UNSIGNED(0x00000007)

#define OR1K_SPR_SYS_PCCFGR_NPC_GET(X) (((X) >> 0) & =
OR1K_UNSIGNED(0x00000007))

#define OR1K_SPR_SYS_PCCFGR_NPC_SET(X, Y) (((X) & =
OR1K_UNSIGNED(0xfffffff8)) | ((Y) << 0))

=20

And these functions in support.h

=20

static inline void or1k_mtspr (uint32_t spr, uint32_t value)

static inline uint32_t or1k_mfspr (uint32_t spr)

=20

Despite this I don=E2=80=99t have clear how to use it.=20

=20

1.	If I do: or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , 0)  -> Does it allow =
me to configure the PCCFGR to one performance counter?

Is This the same than or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , =
OR1K_SPR_SYS_PCCFGR_NPC_LSB ) or  Do OR1K_SPR_SYS_PCCFGR_NPC_LSB   , =
OR1K_SPR_SYS_PCCFGR_NPC_MSB, etc. provide different functions on each =
one performance counter?

2.	What is the meaning of PCCR_BASE,  PCCR_COUNT, PCCR_STEP, =
PCMR_INDEX(N), PCMR_ADDR(N) ? (the same for PCMR) (Is BASE the base =
address of all PCCR and ADDR the position of each one of them? =
=E2=80=A6.why PCMR_BASE and COUNT hasta de same value =
OR1K_UNSIGNED(0x008)? )     =20
3.	Should I define first PCCFGR, second PCMR and last get PCCR?

=20

Thanks and sorry for the inconveniences.

Elisa

=20

De: Stafford Horne <shorne@gmail.com>=20
Enviado el: jueves, 17 de octubre de 2019 7:14
Para: ecalvo@2se.es; Openrisc <openrisc@lists.librecores.org>
Asunto: Re: PCCR and PCRM registers

=20

+cc mailing list,

=20

Hi Elisa,

=20

Which toolchain are you using? I guess newlib?

=20

It has functions like or1k_mfspr() and or1k_mtspr() see or1k-support.h =
and or1k-sprs.h headers for details.

=20

-Stafford

On Wed, Oct 16, 2019, 8:40 PM < <mailto:ecalvo@2se.es> ecalvo@2se.es> =
wrote:

Hi Stafford,=20

I am with PCCR and PCRM registers. I have seen that I can access from =
asm language, but there is functions to access from C? Have you got any =
example about their usage?

I have already confirmed my subscription to the mailing list.=20

Thanks=20
Elisa

-----Mensaje original-----
De: Stafford Horne < <mailto:shorne@gmail.com> shorne@gmail.com>=20
Enviado el: mi=C3=A9rcoles, 9 de octubre de 2019 13:38
Para:  <mailto:ecalvo@2se.es> ecalvo@2se.es; Julius Baxter < =
<mailto:juliusbaxter@gmail.com> juliusbaxter@gmail.com>
Asunto: Re: other doubt

Hello Elisa,

If you simulate with Icarus or modelsim you will be able to measure =
pretty much the same performance characteristics as FPGA. So there is no =
need to go straight to FPGA.

In terms of my example C code is one option.  You can also read timer =
data directly from the tick timer in assembly and achieve the same =
thing.

If you are interested we can CC the mailing list and get more opinions.

-Stafford

On Wed, Oct 9, 2019 at 5:09 PM < <mailto:ecalvo@2se.es> ecalvo@2se.es> =
wrote:
>
> Hi Stafford,
>
> Nice to meet you and, first of all, thanks a lot for your guidance. I =
am new on this, and although there is some documentation, sometimes it =
is difficult some point which maybe it is basic.
>
> Ok, to your comments. If.."A simulator like QEMU or or1ksim will not =
give and exact representation of the CPUs real time =
performance"...then...if I simulate directly the processor with =
modelsim, icarus or a similar tool...neither I get a real performance, =
don=E2=80=99t I? And values for the counters that you tell me to enable, =
neither are real, isn't it? should I execute it directly on the FPGA and =
it will depends on the implementation?
>
> Ok, to C code. I have understood the dependency with toolchain.
>
> Thanks a lot again.
> Best regards,
> Elisa
>
>
> -----Mensaje original-----
> De: Stafford Horne < <mailto:shorne@gmail.com> shorne@gmail.com>
> Enviado el: martes, 8 de octubre de 2019 16:18
> Para: Julius Baxter < <mailto:juliusbaxter@gmail.com> =
juliusbaxter@gmail.com>
> CC:  <mailto:ecalvo@2se.es> ecalvo@2se.es
> Asunto: Re: other doubt
>
> Hi Elisa,
>
> OpenRISC cpu's can run any algorithm, but how well it will perform =
depends on many things:
>
>   - Compiler optimization flags (i.e. -O3)
>   - Whether or not you are doing FPU instructions and have FPU enabled
>   - Whether or not you use multiply and divide and have these =
instructions
>     enabled
>   - The frequency you are running
>   - Cache settings Icache Dcache
>   - The type of algorithm, does it require lots of data which will =
cause many
>     cache misses?
>
> A simulator like QEMU or or1ksim will not give and exact =
representation of the CPUs real time performance.  It can tell you which =
intructions will be executed, but not how fast those will run or how =
many pipeline stalls of cache misses will happen.
>
> You can use the performance counters, they are supported in mor1kx if =
you enable them with the FEATURE_PERFCOUNTERS=3D'ENABLED' parameter.  =
They can help count how many events happen between certain events.  Then =
you can combine them with a timer and watchpoints to detect how many =
times a loop can execute in 1000 clock cycles etc.  Please read about =
PCCRn and PCMRn in the architecture manual.
>
> It might be just as easy to use simple timing in a c program though, =
depending on the toolchain you use you can compare times between runs of =
your algorithm.
> i.e.
>
>     #include <time.h>
>     #include <stdio.h>
>
>     static long to_micro(struct timespec *time) {
>       return (time->tv_sec * 1000000) + (time->tv_nsec / 1000);
>     }
>
>     int main() {
>       int i, j =3D 0;
>
>       struct timespec before, after;
>
>       clock_gettime(CLOCK_MONOTONIC, &before);
>       /* Super complex algorithm */
>       for (int i =3D 0; i < 100; i++) {
>         j =3D (j+1) * (j+2);
>       }
>       clock_gettime(CLOCK_MONOTONIC, &after);
>
>       printf("time to run algorithm %ld uSecs\n", to_micro(&after) -=20
> to_micro(&before));
>
>       return 0;
>     }
>
> $ or1k-smh-linux-gnu-gcc timer.c
> $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to run algorithm=20
> 164 uSecs
>
> I hope it helps.
>
> -Stafford
>
> On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter wrote:
> > Hi,
> >
> > No problem.
> >
> > There are performance counters in the OpenRISC architecture but=20
> > whether they're implemented in a particular implementation is =
another matter.
> >
> > You can use these registers to measure various things the CPU is=20
> > doing while it's executing. If you read the ISA document it'll tell=20
> > you about them.
> >
> > I'm CCing Stafford because he's the main OpenRISC man these days and =

> > probably knows about the state of the performance counter registers=20
> > in various simulators and RTL implementations.
> >
> > Cheers,
> > Julius
> >
> > On Tue., 8 Oct. 2019, 10:43 pm , < <mailto:ecalvo@2se.es> =
ecalvo@2se.es> wrote:
> >
> > > Hi Julius,
> > >
> > >
> > >
> > > Sorry for bothering you again =E2=98=B9. Can I do you other fast =
question=20
> > > related to openrisc? If not, ignore the email please.
> > >
> > >
> > >
> > > Is there any way to characterize the type of application that I=20
> > > can run in openrisc? I mean, could you measure (with numbers) if=20
> > > an algorithm can be executed on it and the speed that it will =
achieve?
> > > Is it possible to do it using orksim?
> > >
> > >
> > >
> > > Sorry because maybe it is so basic and general =E2=98=B9
> > >
> > >
> > >
> > > Thanks in advance
> > >
> > > Elisa
> > >
> > >
> > >
> > >
> > >
> > > *De:* Julius Baxter < <mailto:juliusbaxter@gmail.com> =
juliusbaxter@gmail.com> *Enviado el:* lunes,=20
> > > 16 de septiembre de 2019 13:11
> > > *Para:*  <mailto:ecalvo@2se.es> ecalvo@2se.es
> > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > >
> > >
> > >
> > > Also! To let you know, if you're in Spain, we will soon be having=20
> > > our ORConf conference in Europe, and it's in Bordeaux, France,=20
> > > just across the border. :)
> > >
> > >
> > >
> > > There are several people there who can help you get up to speed,=20
> > > one of whom is Stafford Horne who knows most about the OpenRISC IP =

> > > lately. He will be presenting. If you can attend, it'd be helpful, =
I'm sure.
> > >
> > >
> > >
> > > All info at  <https://orconf.org> https://orconf.org
> > >
> > >
> > >
> > > Cheers,
> > >
> > > Julius
> > >
> > >
> > >
> > > On Mon, 16 Sep 2019 at 21:09, Julius Baxter=20
> > > < <mailto:juliusbaxter@gmail.com> juliusbaxter@gmail.com>
> > > wrote:
> > >
> > > Hi Elisa,
> > >
> > >
> > >
> > > Sorry for the delay in this response.
> > >
> > >
> > >
> > > You should be using an SoC toplevel. FPGAs have everything you=20
> > > need on board like memories and IO blocks and lots of other FPGA=20
> > > fabric for you to implement other pieces of hardware.
> > >
> > >
> > >
> > > FuseSoC provides a really nice and easy way to build an mor1kx=20
> > > design for the DE0 nano I believe:
> > >
> > >
> > >
> > >  <https://github.com/olofk/de0_nano> =
https://github.com/olofk/de0_nano
> > >
> > >
> > >
> > > That github page has a rough guide to getting it going.
> > >
> > >
> > >
> > > If you need help I recommend posting to the OpenRISC mailing list=20
> > > and people will respond probably more promptly than I. (I=20
> > > recommend getting to know how to use mailing lists.
> > >  <https://openrisc.io/community> https://openrisc.io/community
> > >
> > >
> > >
> > > There are more resources here:  <https://openrisc.io/tutorials> =
https://openrisc.io/tutorials
> > >
> > >
> > >
> > > I hope that's helpful.
> > >
> > >
> > >
> > > Cheers,
> > >
> > > Julius
> > >
> > >
> > >
> > >
> > >
> > > On Wed, 11 Sep 2019 at 20:09, < <mailto:ecalvo@2se.es> =
ecalvo@2se.es> wrote:
> > >
> > > Hi Julius,
> > >
> > >
> > >
> > > Thanks a lot for the quick answer.
> > >
> > >
> > >
> > > Yes, this is the problem: I am using as top level the mor1kx=20
> > > module itself. You mean that I need to synthetize also in=20
> > > reconfigurable logic these cores, don=E2=80=99t you? I thought =
that I=20
> > > could have these elements as external in a development board.
> > >
> > >
> > >
> > > Thanks again,
> > >
> > > Cheers
> > >
> > > Elisa
> > >
> > >
> > >
> > > *De:* Julius Baxter < <mailto:juliusbaxter@gmail.com> =
juliusbaxter@gmail.com> *Enviado el:*=20
> > > mi=C3=A9rcoles, 11 de septiembre de 2019 12:02
> > > *Para:*  <mailto:ecalvo@2se.es> ecalvo@2se.es
> > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > >
> > >
> > >
> > > Hi Elisa,
> > >
> > >
> > >
> > > Thanks for getting in touch, that sounds like a cool project.
> > >
> > >
> > >
> > > Can you tell me about the toplevel - are you using a system=20
> > > toplevel, or is your toplevel the mor1kx module itself?
> > >
> > >
> > >
> > > If it's the latter, then that's not the best way to do it - you=20
> > > need a system toplevel which instantiates memories and some reset=20
> > > circuitry and likely some IO (UART, GPIO, JTAG debug, etc.) to =
talk to the outside world.
> > >
> > >
> > >
> > > Is that helpful?
> > >
> > >
> > >
> > > Cheers,
> > >
> > > Julius
> > >
> > >
> > >
> > > On Wed, 11 Sep 2019 at 19:47, < <mailto:ecalvo@2se.es> =
ecalvo@2se.es> wrote:
> > >
> > > Dear Dr. Baxter,
> > >
> > >
> > >
> > > My name is Elisa Calvo Gallego. I am writing you because I have=20
> > > started to work with OpenRISC in the framework of a research=20
> > > project developed in the company where I am working (Space=20
> > > Submicron Electronics, 2SE), and I am having some basic troubles. =
Could you help me?
> > >
> > >
> > >
> > > Although the FPGA that we are planning to use is larger, I have=20
> > > synthetized mor1kx for a DE0 nano board as first step (this is the =

> > > board used in the majority of guides and tutorials). My problem is =

> > > that the results that I have obtained are similar in area and=20
> > > resources, except for IOBs, which are more than available IOBs in=20
> > > the device. Do you know what I am doing wrong? Should I comment=20
> > > debug lines or something like that? I apologize if the question is =

> > > immediate. I didn't find the answer and I'm new in this.
> > >
> > >
> > >
> > > Thanks very much in advance.
> > >
> > > Best regards,
> > >
> > >
> > >
> > > Elisa
> > >
> > >
>


------=_NextPart_000_00F0_01D5850C.75FCC820
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Texto sin formato Car";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.TextosinformatoCar
	{mso-style-name:"Texto sin formato Car";
	mso-style-priority:99;
	mso-style-link:"Texto sin formato";
	font-family:"Calibri",sans-serif;}
span.EstiloCorreo20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:585842301;
	mso-list-template-ids:-73650184;}
@list l1
	{mso-list-id:1185751508;
	mso-list-type:hybrid;
	mso-list-template-ids:728278270 -520213632 201981977 201981979 =
201981967 201981977 201981979 201981967 201981977 201981979;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:53.25pt;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:89.25pt;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:125.25pt;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:161.25pt;
	text-indent:-18.0pt;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:197.25pt;
	text-indent:-18.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:233.25pt;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:269.25pt;
	text-indent:-18.0pt;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:305.25pt;
	text-indent:-18.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:341.25pt;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:2075003323;
	mso-list-type:hybrid;
	mso-list-template-ids:88607292 201981967 201981977 201981979 201981967 =
201981977 201981979 201981967 201981977 201981979;}
@list l2:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DES link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>Hi Stafford, =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Yes, I am using newlib. I had =
discovered both files; these registers in sprs.h =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText><span =
lang=3DEN-GB>/******************************/<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>/* Performance Counters Group =
*/<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>/******************************/<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>#define OR1K_SPR_PERF_GROUP =
0x07<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>/* Performance Counters Count Registers =
*/<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCCR_BASE=C2=A0=C2=A0=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x000)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCCR_COUNT=C2=A0=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x008)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCCR_STEP=C2=A0=C2=A0=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x001)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCCR_INDEX(N) =
(OR1K_SPR_PERF_PCCR_BASE + ((N) * =
OR1K_SPR_PERF_PCCR_STEP))<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>#define =
OR1K_SPR_PERF_PCCR_ADDR(N)=C2=A0 ((OR1K_SPR_PERF_GROUP &lt;&lt; =
OR1K_SPR_GROUP_LSB) | =
OR1K_SPR_PERF_PCCR_INDEX(N))<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>/* Performance Counters Mode =
Registers */<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCMR_BASE=C2=A0=C2=A0=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x008)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCMR_COUNT=C2=A0=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x008)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCMR_STEP=C2=A0=C2=A0=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x001)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_PERF_PCMR_INDEX(N) =
(OR1K_SPR_PERF_PCMR_BASE + ((N) =
*OR1K_SPR_PERF_PCMR_STEP))<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>#define =
OR1K_SPR_PERF_PCMR_ADDR(N)=C2=A0 ((OR1K_SPR_PERF_GROUP &lt;&lt; =
OR1K_SPR_GROUP_LSB) | =
OR1K_SPR_PERF_PCMR_INDEX(N))<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>/* Performance Counters =
Configuration */<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_SYS_PCCFGR_INDEX =
OR1K_UNSIGNED(0x008)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_SYS_PCCFGR_ADDR=C2=A0 =
OR1K_UNSIGNED(0x0008)<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>/* Number of Performance Counters =
*/<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_SYS_PCCFGR_NPC_LSB=C2=A0=C2=A0=C2=A0 =
0<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_SYS_PCCFGR_NPC_MSB=C2=A0=C2=A0=C2=A0 =
2<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_SYS_PCCFGR_NPC_BITS=C2=A0=C2=A0 =
3<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>#define OR1K_SPR_SYS_PCCFGR_NPC_MASK=C2=A0=C2=A0 =
OR1K_UNSIGNED(0x00000007)<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>#define =
OR1K_SPR_SYS_PCCFGR_NPC_GET(X) (((X) &gt;&gt; 0) &amp; =
OR1K_UNSIGNED(0x00000007))<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>#define =
OR1K_SPR_SYS_PCCFGR_NPC_SET(X, Y) (((X) &amp; OR1K_UNSIGNED(0xfffffff8)) =
| ((Y) &lt;&lt; 0))<o:p></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-GB>And these functions in support.h<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>static inline void or1k_mtspr =
(uint32_t spr, uint32_t value)<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>static inline uint32_t =
or1k_mfspr (uint32_t spr)<o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB>Despite this I don=E2=80=99t =
have clear how to use it. <o:p></o:p></span></p><p =
class=3DMsoPlainText><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><ol =
style=3D'margin-top:0cm' start=3D1 type=3D1><li class=3DMsoPlainText =
style=3D'mso-list:l2 level1 lfo3'><span lang=3DEN-GB>If I do: or1k_mtspr =
(OR1K_SPR_SYS_PCCFGR_ADDR , 0) =C2=A0-&gt; Does it allow me to configure =
the PCCFGR to one performance counter?<o:p></o:p></span></li></ol><p =
class=3DMsoPlainText style=3D'margin-left:36.0pt'><span lang=3DEN-GB>Is =
This the same than or1k_mtspr (OR1K_SPR_SYS_PCCFGR_ADDR , =
OR1K_SPR_SYS_PCCFGR_NPC_LSB ) or =C2=A0Do =
OR1K_SPR_SYS_PCCFGR_NPC_LSB=C2=A0=C2=A0 , OR1K_SPR_SYS_PCCFGR_NPC_MSB, =
etc. provide different functions on each one performance =
counter?<o:p></o:p></span></p><ol style=3D'margin-top:0cm' start=3D2 =
type=3D1><li class=3DMsoPlainText style=3D'mso-list:l2 level1 =
lfo3'><span lang=3DEN-GB>What is the meaning of PCCR_BASE,=C2=A0 =
PCCR_COUNT, PCCR_STEP, PCMR_INDEX(N), PCMR_ADDR(N) ? (the same for PCMR) =
(Is BASE the base address of all PCCR and ADDR the position of each one =
of them? =E2=80=A6.why PCMR_BASE and COUNT hasta de same value =
OR1K_UNSIGNED(0x008)? )=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0<o:p></o:p></span></li><li class=3DMsoPlainText =
style=3D'mso-list:l2 level1 lfo3'><span lang=3DEN-GB>Should I define =
first PCCFGR, second PCMR and last get =
PCCR?<o:p></o:p></span></li></ol><p class=3DMsoPlainText><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>Thanks and sorry for =
the inconveniences.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Elisa<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b>De:</b> Stafford Horne &lt;shorne@gmail.com&gt; =
<br><b>Enviado el:</b> jueves, 17 de octubre de 2019 =
7:14<br><b>Para:</b> ecalvo@2se.es; Openrisc =
&lt;openrisc@lists.librecores.org&gt;<br><b>Asunto:</b> Re: PCCR and =
PCRM registers<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>+cc mailing =
list,<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>Hi =
Elisa,<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>Which toolchain are you using? I =
guess newlib?<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>It has functions like or1k_mfspr() =
and or1k_mtspr() see or1k-support.h and or1k-sprs.h headers for =
details.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><span =
lang=3DEN-GB>-Stafford<o:p></o:p></span></p><div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>On Wed, Oct 16, 2019, 8:40 PM =
&lt;</span><a href=3D"mailto:ecalvo@2se.es"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>&gt; =
wrote:<o:p></o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5=
.0pt'><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span =
lang=3DEN-GB>Hi Stafford, <br><br>I am with PCCR and PCRM registers. I =
have seen that I can access from asm language, but there is functions to =
access from C? Have you got any example about their usage?<br><br>I have =
already confirmed my subscription to the mailing list. <br><br>Thanks =
<br>Elisa<br><br>-----Mensaje original-----<br>De: Stafford Horne =
&lt;</span><a href=3D"mailto:shorne@gmail.com" target=3D"_blank"><span =
lang=3DEN-GB>shorne@gmail.com</span></a><span lang=3DEN-GB>&gt; =
<br>Enviado el: mi=C3=A9rcoles, 9 de octubre de 2019 13:38<br>Para: =
</span><a href=3D"mailto:ecalvo@2se.es" target=3D"_blank"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>; Julius Baxter =
&lt;</span><a href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank"><span =
lang=3DEN-GB>juliusbaxter@gmail.com</span></a><span =
lang=3DEN-GB>&gt;<br>Asunto: Re: other doubt<br><br>Hello =
Elisa,<br><br>If you simulate with Icarus or modelsim you will be able =
to measure pretty much the same performance characteristics as FPGA. So =
there is no need to go straight to FPGA.<br><br>In terms of my example C =
code is one option.&nbsp; You can also read timer data directly from the =
tick timer in assembly and achieve the same thing.<br><br>If you are =
interested we can CC the mailing list and get more =
opinions.<br><br>-Stafford<br><br>On Wed, Oct 9, 2019 at 5:09 PM =
&lt;</span><a href=3D"mailto:ecalvo@2se.es" target=3D"_blank"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>&gt; =
wrote:<br>&gt;<br>&gt; Hi Stafford,<br>&gt;<br>&gt; Nice to meet you =
and, first of all, thanks a lot for your guidance. I am new on this, and =
although there is some documentation, sometimes it is difficult some =
point which maybe it is basic.<br>&gt;<br>&gt; Ok, to your comments. =
If..&quot;A simulator like QEMU or or1ksim will not give and exact =
representation of the CPUs real time performance&quot;...then...if I =
simulate directly the processor with modelsim, icarus or a similar =
tool...neither I get a real performance, don=E2=80=99t I? And values for =
the counters that you tell me to enable, neither are real, isn't it? =
should I execute it directly on the FPGA and it will depends on the =
implementation?<br>&gt;<br>&gt; Ok, to C code. I have understood the =
dependency with toolchain.<br>&gt;<br>&gt; Thanks a lot again.<br>&gt; =
Best regards,<br>&gt; Elisa<br>&gt;<br>&gt;<br>&gt; -----Mensaje =
original-----<br>&gt; De: Stafford Horne &lt;</span><a =
href=3D"mailto:shorne@gmail.com" target=3D"_blank"><span =
lang=3DEN-GB>shorne@gmail.com</span></a><span lang=3DEN-GB>&gt;<br>&gt; =
Enviado el: martes, 8 de octubre de 2019 16:18<br>&gt; Para: Julius =
Baxter &lt;</span><a href=3D"mailto:juliusbaxter@gmail.com" =
target=3D"_blank"><span =
lang=3DEN-GB>juliusbaxter@gmail.com</span></a><span =
lang=3DEN-GB>&gt;<br>&gt; CC: </span><a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank"><span lang=3DEN-GB>ecalvo@2se.es</span></a><span =
lang=3DEN-GB><br>&gt; Asunto: Re: other doubt<br>&gt;<br>&gt; Hi =
Elisa,<br>&gt;<br>&gt; OpenRISC cpu's can run any algorithm, but how =
well it will perform depends on many things:<br>&gt;<br>&gt;&nbsp; =
&nbsp;- Compiler optimization flags (i.e. -O3)<br>&gt;&nbsp; &nbsp;- =
Whether or not you are doing FPU instructions and have FPU =
enabled<br>&gt;&nbsp; &nbsp;- Whether or not you use multiply and divide =
and have these instructions<br>&gt;&nbsp; &nbsp; =
&nbsp;enabled<br>&gt;&nbsp; &nbsp;- The frequency you are =
running<br>&gt;&nbsp; &nbsp;- Cache settings Icache Dcache<br>&gt;&nbsp; =
&nbsp;- The type of algorithm, does it require lots of data which will =
cause many<br>&gt;&nbsp; &nbsp; &nbsp;cache misses?<br>&gt;<br>&gt; A =
simulator like QEMU or or1ksim will not give and exact representation of =
the CPUs real time performance.&nbsp; It can tell you which intructions =
will be executed, but not how fast those will run or how many pipeline =
stalls of cache misses will happen.<br>&gt;<br>&gt; You can use the =
performance counters, they are supported in mor1kx if you enable them =
with the FEATURE_PERFCOUNTERS=3D'ENABLED' parameter.&nbsp; They can help =
count how many events happen between certain events.&nbsp; Then you can =
combine them with a timer and watchpoints to detect how many times a =
loop can execute in 1000 clock cycles etc.&nbsp; Please read about PCCRn =
and PCMRn in the architecture manual.<br>&gt;<br>&gt; It might be just =
as easy to use simple timing in a c program though, depending on the =
toolchain you use you can compare times between runs of your =
algorithm.<br>&gt; i.e.<br>&gt;<br>&gt;&nbsp; &nbsp; &nbsp;#include =
&lt;time.h&gt;<br>&gt;&nbsp; &nbsp; &nbsp;#include =
&lt;stdio.h&gt;<br>&gt;<br>&gt;&nbsp; &nbsp; &nbsp;static long =
to_micro(struct timespec *time) {<br>&gt;&nbsp; &nbsp; &nbsp; =
&nbsp;return (time-&gt;tv_sec * 1000000) + (time-&gt;tv_nsec / =
1000);<br>&gt;&nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt;&nbsp; &nbsp; =
&nbsp;int main() {<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp;int i, j =3D =
0;<br>&gt;<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp;struct timespec before, =
after;<br>&gt;<br>&gt;&nbsp; &nbsp; &nbsp; =
&nbsp;clock_gettime(CLOCK_MONOTONIC, &amp;before);<br>&gt;&nbsp; &nbsp; =
&nbsp; &nbsp;/* Super complex algorithm */<br>&gt;&nbsp; &nbsp; &nbsp; =
&nbsp;for (int i =3D 0; i &lt; 100; i++) {<br>&gt;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;j =3D (j+1) * (j+2);<br>&gt;&nbsp; &nbsp; &nbsp; =
&nbsp;}<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp;clock_gettime(CLOCK_MONOTONIC, =
&amp;after);<br>&gt;<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;time =
to run algorithm %ld uSecs\n&quot;, to_micro(&amp;after) - <br>&gt; =
to_micro(&amp;before));<br>&gt;<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp;return =
0;<br>&gt;&nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt; $ or1k-smh-linux-gnu-gcc =
timer.c<br>&gt; $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to =
run algorithm <br>&gt; 164 uSecs<br>&gt;<br>&gt; I hope it =
helps.<br>&gt;<br>&gt; -Stafford<br>&gt;<br>&gt; On Tue, Oct 08, 2019 at =
10:54:29PM +1100, Julius Baxter wrote:<br>&gt; &gt; Hi,<br>&gt; =
&gt;<br>&gt; &gt; No problem.<br>&gt; &gt;<br>&gt; &gt; There are =
performance counters in the OpenRISC architecture but <br>&gt; &gt; =
whether they're implemented in a particular implementation is another =
matter.<br>&gt; &gt;<br>&gt; &gt; You can use these registers to measure =
various things the CPU is <br>&gt; &gt; doing while it's executing. If =
you read the ISA document it'll tell <br>&gt; &gt; you about =
them.<br>&gt; &gt;<br>&gt; &gt; I'm CCing Stafford because he's the main =
OpenRISC man these days and <br>&gt; &gt; probably knows about the state =
of the performance counter registers <br>&gt; &gt; in various simulators =
and RTL implementations.<br>&gt; &gt;<br>&gt; &gt; Cheers,<br>&gt; &gt; =
Julius<br>&gt; &gt;<br>&gt; &gt; On Tue., 8 Oct. 2019, 10:43 pm , =
&lt;</span><a href=3D"mailto:ecalvo@2se.es" target=3D"_blank"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>&gt; =
wrote:<br>&gt; &gt;<br>&gt; &gt; &gt; Hi Julius,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Sorry for =
bothering you again </span><span lang=3DEN-GB =
style=3D'font-family:"Segoe UI Emoji",sans-serif'>=E2=98=B9</span><span =
lang=3DEN-GB>. Can I do you other fast question <br>&gt; &gt; &gt; =
related to openrisc? If not, ignore the email please.<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Is there any =
way to characterize the type of application that I <br>&gt; &gt; &gt; =
can run in openrisc? I mean, could you measure (with numbers) if =
<br>&gt; &gt; &gt; an algorithm can be executed on it and the speed that =
it will achieve?<br>&gt; &gt; &gt; Is it possible to do it using =
orksim?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Sorry because maybe it is so basic and general </span><span =
lang=3DEN-GB style=3D'font-family:"Segoe UI =
Emoji",sans-serif'>=E2=98=B9</span><span lang=3DEN-GB><br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Thanks in =
advance<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Elisa<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; *De:* Julius Baxter &lt;</span><a =
href=3D"mailto:juliusbaxter@gmail.com" target=3D"_blank"><span =
lang=3DEN-GB>juliusbaxter@gmail.com</span></a><span lang=3DEN-GB>&gt; =
*Enviado el:* lunes, <br>&gt; &gt; &gt; 16 de septiembre de 2019 =
13:11<br>&gt; &gt; &gt; *Para:* </span><a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank"><span lang=3DEN-GB>ecalvo@2se.es</span></a><span =
lang=3DEN-GB><br>&gt; &gt; &gt; *Asunto:* Re: Starting with OpenRISC - =
IOBs<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt; Also! To let you know, if you're in Spain, we will soon be having =
<br>&gt; &gt; &gt; our ORConf conference in Europe, and it's in =
Bordeaux, France, <br>&gt; &gt; &gt; just across the border. :)<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; There =
are several people there who can help you get up to speed, <br>&gt; &gt; =
&gt; one of whom is Stafford Horne who knows most about the OpenRISC IP =
<br>&gt; &gt; &gt; lately. He will be presenting. If you can attend, =
it'd be helpful, I'm sure.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt; All info at </span><a =
href=3D"https://orconf.org" target=3D"_blank"><span =
lang=3DEN-GB>https://orconf.org</span></a><span lang=3DEN-GB><br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =
Cheers,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Julius<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; On Mon, 16 =
Sep 2019 at 21:09, Julius Baxter <br>&gt; &gt; &gt; &lt;</span><a =
href=3D"mailto:juliusbaxter@gmail.com" target=3D"_blank"><span =
lang=3DEN-GB>juliusbaxter@gmail.com</span></a><span =
lang=3DEN-GB>&gt;<br>&gt; &gt; &gt; wrote:<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Hi Elisa,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Sorry for the delay in this response.<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; You =
should be using an SoC toplevel. FPGAs have everything you <br>&gt; &gt; =
&gt; need on board like memories and IO blocks and lots of other FPGA =
<br>&gt; &gt; &gt; fabric for you to implement other pieces of =
hardware.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; FuseSoC provides a really nice and easy way to build an mor1kx =
<br>&gt; &gt; &gt; design for the DE0 nano I believe:<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; </span><a =
href=3D"https://github.com/olofk/de0_nano" target=3D"_blank"><span =
lang=3DEN-GB>https://github.com/olofk/de0_nano</span></a><span =
lang=3DEN-GB><br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; That github page has a rough guide to getting it =
going.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; If you need help I recommend posting to the OpenRISC mailing =
list <br>&gt; &gt; &gt; and people will respond probably more promptly =
than I. (I <br>&gt; &gt; &gt; recommend getting to know how to use =
mailing lists.<br>&gt; &gt; &gt; </span><a =
href=3D"https://openrisc.io/community" target=3D"_blank"><span =
lang=3DEN-GB>https://openrisc.io/community</span></a><span =
lang=3DEN-GB><br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; There are more resources here: </span><a =
href=3D"https://openrisc.io/tutorials" target=3D"_blank"><span =
lang=3DEN-GB>https://openrisc.io/tutorials</span></a><span =
lang=3DEN-GB><br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; I hope that's helpful.<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Cheers,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Julius<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt; On Wed, 11 Sep 2019 at 20:09, &lt;</span><a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>&gt; =
wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi Julius,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Thanks a lot =
for the quick answer.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Yes, this is the problem: I am using as top level =
the mor1kx <br>&gt; &gt; &gt; module itself. You mean that I need to =
synthetize also in <br>&gt; &gt; &gt; reconfigurable logic these cores, =
don=E2=80=99t you? I thought that I <br>&gt; &gt; &gt; could have these =
elements as external in a development board.<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Thanks again,<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Cheers<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =
Elisa<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt; *De:* Julius Baxter &lt;</span><a =
href=3D"mailto:juliusbaxter@gmail.com" target=3D"_blank"><span =
lang=3DEN-GB>juliusbaxter@gmail.com</span></a><span lang=3DEN-GB>&gt; =
*Enviado el:* <br>&gt; &gt; &gt; mi=C3=A9rcoles, 11 de septiembre de =
2019 12:02<br>&gt; &gt; &gt; *Para:* </span><a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB><br>&gt; &gt; =
&gt; *Asunto:* Re: Starting with OpenRISC - IOBs<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi =
Elisa,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Thanks for getting in touch, that sounds like a cool =
project.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Can you tell me about the toplevel - are you using a system =
<br>&gt; &gt; &gt; toplevel, or is your toplevel the mor1kx module =
itself?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; If it's the latter, then that's not the best way to do it - =
you <br>&gt; &gt; &gt; need a system toplevel which instantiates =
memories and some reset <br>&gt; &gt; &gt; circuitry and likely some IO =
(UART, GPIO, JTAG debug, etc.) to talk to the outside world.<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Is that =
helpful?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Cheers,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Julius<br>&gt; =
&gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; On Wed, =
11 Sep 2019 at 19:47, &lt;</span><a href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank"><span lang=3DEN-GB>ecalvo@2se.es</span></a><span =
lang=3DEN-GB>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Dear Dr. =
Baxter,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; My name is Elisa Calvo Gallego. I am writing you because I =
have <br>&gt; &gt; &gt; started to work with OpenRISC in the framework =
of a research <br>&gt; &gt; &gt; project developed in the company where =
I am working (Space <br>&gt; &gt; &gt; Submicron Electronics, 2SE), and =
I am having some basic troubles. Could you help me?<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Although the =
FPGA that we are planning to use is larger, I have <br>&gt; &gt; &gt; =
synthetized mor1kx for a DE0 nano board as first step (this is the =
<br>&gt; &gt; &gt; board used in the majority of guides and tutorials). =
My problem is <br>&gt; &gt; &gt; that the results that I have obtained =
are similar in area and <br>&gt; &gt; &gt; resources, except for IOBs, =
which are more than available IOBs in <br>&gt; &gt; &gt; the device. Do =
you know what I am doing wrong? Should I comment <br>&gt; &gt; &gt; =
debug lines or something like that? I apologize if the question is =
<br>&gt; &gt; &gt; immediate. I didn't find the answer and I'm new in =
this.<br></span>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Thanks very much in advance.<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt; Best regards,<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Elisa<br>&gt; &gt; &gt;<br>&gt; =
&gt; =
&gt;<br>&gt;<o:p></o:p></p></blockquote></div></div></div></div></body></=
html>
------=_NextPart_000_00F0_01D5850C.75FCC820--


--===============4067613193719795269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4067613193719795269==--

