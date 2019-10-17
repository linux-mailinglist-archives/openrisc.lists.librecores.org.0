Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 61B3ADA507
	for <lists+openrisc@lfdr.de>; Thu, 17 Oct 2019 07:13:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 04CC4206B6;
	Thu, 17 Oct 2019 07:13:58 +0200 (CEST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mail.librecores.org (Postfix) with ESMTPS id 43B5220565
 for <openrisc@lists.librecores.org>; Thu, 17 Oct 2019 07:13:56 +0200 (CEST)
Received: by mail-vs1-f41.google.com with SMTP id b1so721979vsr.10
 for <openrisc@lists.librecores.org>; Wed, 16 Oct 2019 22:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=i/B+8XmGLiBX/V+cm8fo89sX1q/DW3toHLBHKbLTRnM=;
 b=mD7aztVzQCNI9JSqalnJLkukp03FeDnrxfsDhHMbpxT5WsmJbhGZa45Lfgnj7dlqxN
 SvadCFTBL8Ymfc0i+RZjpYVhwU8wKftzu2S+ajflWbD9tBn0AgmkOY5J4xnd3F92+lmx
 diFSf96FyKs67cdn+SfBZwopnngTRI+UaGtcHfL7yEPWZbT8vduMO4Ga9BnxH9u3WmNO
 5c3ac7Zw4AlNwdoSZhD9oItVomcIsXT4PBM3jYOQhvArKpBWmWodqdWqBxzDx7GQ6aWh
 aIu9bmjDCs5lPpj9PYjKYA5OuzDJu6d2CfG9J5SnRB/GwLjqEaMvSsPky3tOF0Sa3dae
 j5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=i/B+8XmGLiBX/V+cm8fo89sX1q/DW3toHLBHKbLTRnM=;
 b=rKBRLZw+JsnibfwbyScvi4hUGSffq3TMfxwziLNfo/jYGw2DgJQnB96dmhez0X0IFu
 qqpIPAD5mAtg0Avrh8+7X4sMMloG30gWfHvrg0FbI1G9ZC0KKoCo2fPImqmPHUigFDLv
 IY/iDIRsi5+iar8B1ik6tPmwlqgIpD0f49ocUVN9Gx7c8w7QMGBbwDqFSP/Iry4fdsRw
 EpzSl/FsxSA3LVm/RgBUkOSSobLXBS6ziV+27smJpvhd8MqPVl401OX/OHaD0iNlxv8d
 HecHQ7Rh2c3ZzP68H9/KKJG4TLYNRRMA8y27Ju8kd/wG+QgrklwauwJmOtIGOcY6BrKq
 gnYQ==
X-Gm-Message-State: APjAAAUFZoaahnnDGDnDgxx+NevB3tTQX+FGcf6jLaefkyqdf2cuHQY6
 UCsBIkSQWLyQ2Uel8C1YDULLjN4JYLYfYpslFDzP4Q==
X-Google-Smtp-Source: APXvYqwWIdM7xBDNkUpCTjqgbUAQkN+ZypU9/9xGR+Ls0Ad3w22r+lLfeKK9DEKyEbRLnAdjulEDVPDd/YmmAnSAj1I=
X-Received: by 2002:a67:2d43:: with SMTP id t64mr906081vst.174.1571289234559; 
 Wed, 16 Oct 2019 22:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <009d01d58416$7125fe80$5371fb80$@2se.es>
In-Reply-To: <009d01d58416$7125fe80$5371fb80$@2se.es>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 17 Oct 2019 14:13:42 +0900
Message-ID: <CAAfxs76G9Tyygv-5F+y-v9WkKyqO99W2aiBtejB54-qV-OBiFQ@mail.gmail.com>
To: ecalvo@2se.es, Openrisc <openrisc@lists.librecores.org>
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
Content-Type: multipart/mixed; boundary="===============4008719333008643231=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4008719333008643231==
Content-Type: multipart/alternative; boundary="000000000000aa597005951448cf"

--000000000000aa597005951448cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+cc mailing list,

Hi Elisa,

Which toolchain are you using? I guess newlib?

It has functions like or1k_mfspr() and or1k_mtspr() see or1k-support.h and
or1k-sprs.h headers for details.

-Stafford

On Wed, Oct 16, 2019, 8:40 PM <ecalvo@2se.es> wrote:

> Hi Stafford,
>
> I am with PCCR and PCRM registers. I have seen that I can access from asm
> language, but there is functions to access from C? Have you got any examp=
le
> about their usage?
>
> I have already confirmed my subscription to the mailing list.
>
> Thanks
> Elisa
>
> -----Mensaje original-----
> De: Stafford Horne <shorne@gmail.com>
> Enviado el: mi=C3=A9rcoles, 9 de octubre de 2019 13:38
> Para: ecalvo@2se.es; Julius Baxter <juliusbaxter@gmail.com>
> Asunto: Re: other doubt
>
> Hello Elisa,
>
> If you simulate with Icarus or modelsim you will be able to measure prett=
y
> much the same performance characteristics as FPGA. So there is no need to
> go straight to FPGA.
>
> In terms of my example C code is one option.  You can also read timer dat=
a
> directly from the tick timer in assembly and achieve the same thing.
>
> If you are interested we can CC the mailing list and get more opinions.
>
> -Stafford
>
> On Wed, Oct 9, 2019 at 5:09 PM <ecalvo@2se.es> wrote:
> >
> > Hi Stafford,
> >
> > Nice to meet you and, first of all, thanks a lot for your guidance. I a=
m
> new on this, and although there is some documentation, sometimes it is
> difficult some point which maybe it is basic.
> >
> > Ok, to your comments. If.."A simulator like QEMU or or1ksim will not
> give and exact representation of the CPUs real time
> performance"...then...if I simulate directly the processor with modelsim,
> icarus or a similar tool...neither I get a real performance, don=E2=80=99=
t I? And
> values for the counters that you tell me to enable, neither are real, isn=
't
> it? should I execute it directly on the FPGA and it will depends on the
> implementation?
> >
> > Ok, to C code. I have understood the dependency with toolchain.
> >
> > Thanks a lot again.
> > Best regards,
> > Elisa
> >
> >
> > -----Mensaje original-----
> > De: Stafford Horne <shorne@gmail.com>
> > Enviado el: martes, 8 de octubre de 2019 16:18
> > Para: Julius Baxter <juliusbaxter@gmail.com>
> > CC: ecalvo@2se.es
> > Asunto: Re: other doubt
> >
> > Hi Elisa,
> >
> > OpenRISC cpu's can run any algorithm, but how well it will perform
> depends on many things:
> >
> >   - Compiler optimization flags (i.e. -O3)
> >   - Whether or not you are doing FPU instructions and have FPU enabled
> >   - Whether or not you use multiply and divide and have these
> instructions
> >     enabled
> >   - The frequency you are running
> >   - Cache settings Icache Dcache
> >   - The type of algorithm, does it require lots of data which will caus=
e
> many
> >     cache misses?
> >
> > A simulator like QEMU or or1ksim will not give and exact representation
> of the CPUs real time performance.  It can tell you which intructions wil=
l
> be executed, but not how fast those will run or how many pipeline stalls =
of
> cache misses will happen.
> >
> > You can use the performance counters, they are supported in mor1kx if
> you enable them with the FEATURE_PERFCOUNTERS=3D'ENABLED' parameter.  The=
y
> can help count how many events happen between certain events.  Then you c=
an
> combine them with a timer and watchpoints to detect how many times a loop
> can execute in 1000 clock cycles etc.  Please read about PCCRn and PCMRn =
in
> the architecture manual.
> >
> > It might be just as easy to use simple timing in a c program though,
> depending on the toolchain you use you can compare times between runs of
> your algorithm.
> > i.e.
> >
> >     #include <time.h>
> >     #include <stdio.h>
> >
> >     static long to_micro(struct timespec *time) {
> >       return (time->tv_sec * 1000000) + (time->tv_nsec / 1000);
> >     }
> >
> >     int main() {
> >       int i, j =3D 0;
> >
> >       struct timespec before, after;
> >
> >       clock_gettime(CLOCK_MONOTONIC, &before);
> >       /* Super complex algorithm */
> >       for (int i =3D 0; i < 100; i++) {
> >         j =3D (j+1) * (j+2);
> >       }
> >       clock_gettime(CLOCK_MONOTONIC, &after);
> >
> >       printf("time to run algorithm %ld uSecs\n", to_micro(&after) -
> > to_micro(&before));
> >
> >       return 0;
> >     }
> >
> > $ or1k-smh-linux-gnu-gcc timer.c
> > $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to run algorithm
> > 164 uSecs
> >
> > I hope it helps.
> >
> > -Stafford
> >
> > On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter wrote:
> > > Hi,
> > >
> > > No problem.
> > >
> > > There are performance counters in the OpenRISC architecture but
> > > whether they're implemented in a particular implementation is another
> matter.
> > >
> > > You can use these registers to measure various things the CPU is
> > > doing while it's executing. If you read the ISA document it'll tell
> > > you about them.
> > >
> > > I'm CCing Stafford because he's the main OpenRISC man these days and
> > > probably knows about the state of the performance counter registers
> > > in various simulators and RTL implementations.
> > >
> > > Cheers,
> > > Julius
> > >
> > > On Tue., 8 Oct. 2019, 10:43 pm , <ecalvo@2se.es> wrote:
> > >
> > > > Hi Julius,
> > > >
> > > >
> > > >
> > > > Sorry for bothering you again =E2=98=B9. Can I do you other fast qu=
estion
> > > > related to openrisc? If not, ignore the email please.
> > > >
> > > >
> > > >
> > > > Is there any way to characterize the type of application that I
> > > > can run in openrisc? I mean, could you measure (with numbers) if
> > > > an algorithm can be executed on it and the speed that it will
> achieve?
> > > > Is it possible to do it using orksim?
> > > >
> > > >
> > > >
> > > > Sorry because maybe it is so basic and general =E2=98=B9
> > > >
> > > >
> > > >
> > > > Thanks in advance
> > > >
> > > > Elisa
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > *De:* Julius Baxter <juliusbaxter@gmail.com> *Enviado el:* lunes,
> > > > 16 de septiembre de 2019 13:11
> > > > *Para:* ecalvo@2se.es
> > > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > > >
> > > >
> > > >
> > > > Also! To let you know, if you're in Spain, we will soon be having
> > > > our ORConf conference in Europe, and it's in Bordeaux, France,
> > > > just across the border. :)
> > > >
> > > >
> > > >
> > > > There are several people there who can help you get up to speed,
> > > > one of whom is Stafford Horne who knows most about the OpenRISC IP
> > > > lately. He will be presenting. If you can attend, it'd be helpful,
> I'm sure.
> > > >
> > > >
> > > >
> > > > All info at https://orconf.org
> > > >
> > > >
> > > >
> > > > Cheers,
> > > >
> > > > Julius
> > > >
> > > >
> > > >
> > > > On Mon, 16 Sep 2019 at 21:09, Julius Baxter
> > > > <juliusbaxter@gmail.com>
> > > > wrote:
> > > >
> > > > Hi Elisa,
> > > >
> > > >
> > > >
> > > > Sorry for the delay in this response.
> > > >
> > > >
> > > >
> > > > You should be using an SoC toplevel. FPGAs have everything you
> > > > need on board like memories and IO blocks and lots of other FPGA
> > > > fabric for you to implement other pieces of hardware.
> > > >
> > > >
> > > >
> > > > FuseSoC provides a really nice and easy way to build an mor1kx
> > > > design for the DE0 nano I believe:
> > > >
> > > >
> > > >
> > > > https://github.com/olofk/de0_nano
> > > >
> > > >
> > > >
> > > > That github page has a rough guide to getting it going.
> > > >
> > > >
> > > >
> > > > If you need help I recommend posting to the OpenRISC mailing list
> > > > and people will respond probably more promptly than I. (I
> > > > recommend getting to know how to use mailing lists.
> > > > https://openrisc.io/community
> > > >
> > > >
> > > >
> > > > There are more resources here: https://openrisc.io/tutorials
> > > >
> > > >
> > > >
> > > > I hope that's helpful.
> > > >
> > > >
> > > >
> > > > Cheers,
> > > >
> > > > Julius
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > On Wed, 11 Sep 2019 at 20:09, <ecalvo@2se.es> wrote:
> > > >
> > > > Hi Julius,
> > > >
> > > >
> > > >
> > > > Thanks a lot for the quick answer.
> > > >
> > > >
> > > >
> > > > Yes, this is the problem: I am using as top level the mor1kx
> > > > module itself. You mean that I need to synthetize also in
> > > > reconfigurable logic these cores, don=E2=80=99t you? I thought that=
 I
> > > > could have these elements as external in a development board.
> > > >
> > > >
> > > >
> > > > Thanks again,
> > > >
> > > > Cheers
> > > >
> > > > Elisa
> > > >
> > > >
> > > >
> > > > *De:* Julius Baxter <juliusbaxter@gmail.com> *Enviado el:*
> > > > mi=C3=A9rcoles, 11 de septiembre de 2019 12:02
> > > > *Para:* ecalvo@2se.es
> > > > *Asunto:* Re: Starting with OpenRISC - IOBs
> > > >
> > > >
> > > >
> > > > Hi Elisa,
> > > >
> > > >
> > > >
> > > > Thanks for getting in touch, that sounds like a cool project.
> > > >
> > > >
> > > >
> > > > Can you tell me about the toplevel - are you using a system
> > > > toplevel, or is your toplevel the mor1kx module itself?
> > > >
> > > >
> > > >
> > > > If it's the latter, then that's not the best way to do it - you
> > > > need a system toplevel which instantiates memories and some reset
> > > > circuitry and likely some IO (UART, GPIO, JTAG debug, etc.) to talk
> to the outside world.
> > > >
> > > >
> > > >
> > > > Is that helpful?
> > > >
> > > >
> > > >
> > > > Cheers,
> > > >
> > > > Julius
> > > >
> > > >
> > > >
> > > > On Wed, 11 Sep 2019 at 19:47, <ecalvo@2se.es> wrote:
> > > >
> > > > Dear Dr. Baxter,
> > > >
> > > >
> > > >
> > > > My name is Elisa Calvo Gallego. I am writing you because I have
> > > > started to work with OpenRISC in the framework of a research
> > > > project developed in the company where I am working (Space
> > > > Submicron Electronics, 2SE), and I am having some basic troubles.
> Could you help me?
> > > >
> > > >
> > > >
> > > > Although the FPGA that we are planning to use is larger, I have
> > > > synthetized mor1kx for a DE0 nano board as first step (this is the
> > > > board used in the majority of guides and tutorials). My problem is
> > > > that the results that I have obtained are similar in area and
> > > > resources, except for IOBs, which are more than available IOBs in
> > > > the device. Do you know what I am doing wrong? Should I comment
> > > > debug lines or something like that? I apologize if the question is
> > > > immediate. I didn't find the answer and I'm new in this.
> > > >
> > > >
> > > >
> > > > Thanks very much in advance.
> > > >
> > > > Best regards,
> > > >
> > > >
> > > >
> > > > Elisa
> > > >
> > > >
> >
>
>

--000000000000aa597005951448cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>+cc mailing list,</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Hi Elisa,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Which toolchain are you using? I guess newlib?</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">It has functions like or1k_mfspr() and or1k_mtspr=
() see or1k-support.h and or1k-sprs.h headers for details.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">-Stafford<br><br><div class=3D"gmail_quo=
te" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 16, 2019=
, 8:40 PM  &lt;<a href=3D"mailto:ecalvo@2se.es">ecalvo@2se.es</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Stafford, <br>
<br>
I am with PCCR and PCRM registers. I have seen that I can access from asm l=
anguage, but there is functions to access from C? Have you got any example =
about their usage?<br>
<br>
I have already confirmed my subscription to the mailing list. <br>
<br>
Thanks <br>
Elisa<br>
<br>
-----Mensaje original-----<br>
De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">shorne@gmail.com</a>&gt; <br>
Enviado el: mi=C3=A9rcoles, 9 de octubre de 2019 13:38<br>
Para: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferrer"=
>ecalvo@2se.es</a>; Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&gt;<br=
>
Asunto: Re: other doubt<br>
<br>
Hello Elisa,<br>
<br>
If you simulate with Icarus or modelsim you will be able to measure pretty =
much the same performance characteristics as FPGA. So there is no need to g=
o straight to FPGA.<br>
<br>
In terms of my example C code is one option.=C2=A0 You can also read timer =
data directly from the tick timer in assembly and achieve the same thing.<b=
r>
<br>
If you are interested we can CC the mailing list and get more opinions.<br>
<br>
-Stafford<br>
<br>
On Wed, Oct 9, 2019 at 5:09 PM &lt;<a href=3D"mailto:ecalvo@2se.es" target=
=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Stafford,<br>
&gt;<br>
&gt; Nice to meet you and, first of all, thanks a lot for your guidance. I =
am new on this, and although there is some documentation, sometimes it is d=
ifficult some point which maybe it is basic.<br>
&gt;<br>
&gt; Ok, to your comments. If..&quot;A simulator like QEMU or or1ksim will =
not give and exact representation of the CPUs real time performance&quot;..=
.then...if I simulate directly the processor with modelsim, icarus or a sim=
ilar tool...neither I get a real performance, don=E2=80=99t I? And values f=
or the counters that you tell me to enable, neither are real, isn&#39;t it?=
 should I execute it directly on the FPGA and it will depends on the implem=
entation?<br>
&gt;<br>
&gt; Ok, to C code. I have understood the dependency with toolchain.<br>
&gt;<br>
&gt; Thanks a lot again.<br>
&gt; Best regards,<br>
&gt; Elisa<br>
&gt;<br>
&gt;<br>
&gt; -----Mensaje original-----<br>
&gt; De: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt;<br>
&gt; Enviado el: martes, 8 de octubre de 2019 16:18<br>
&gt; Para: Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&gt;<br>
&gt; CC: <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferr=
er">ecalvo@2se.es</a><br>
&gt; Asunto: Re: other doubt<br>
&gt;<br>
&gt; Hi Elisa,<br>
&gt;<br>
&gt; OpenRISC cpu&#39;s can run any algorithm, but how well it will perform=
 depends on many things:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- Compiler optimization flags (i.e. -O3)<br>
&gt;=C2=A0 =C2=A0- Whether or not you are doing FPU instructions and have F=
PU enabled<br>
&gt;=C2=A0 =C2=A0- Whether or not you use multiply and divide and have thes=
e instructions<br>
&gt;=C2=A0 =C2=A0 =C2=A0enabled<br>
&gt;=C2=A0 =C2=A0- The frequency you are running<br>
&gt;=C2=A0 =C2=A0- Cache settings Icache Dcache<br>
&gt;=C2=A0 =C2=A0- The type of algorithm, does it require lots of data whic=
h will cause many<br>
&gt;=C2=A0 =C2=A0 =C2=A0cache misses?<br>
&gt;<br>
&gt; A simulator like QEMU or or1ksim will not give and exact representatio=
n of the CPUs real time performance.=C2=A0 It can tell you which intruction=
s will be executed, but not how fast those will run or how many pipeline st=
alls of cache misses will happen.<br>
&gt;<br>
&gt; You can use the performance counters, they are supported in mor1kx if =
you enable them with the FEATURE_PERFCOUNTERS=3D&#39;ENABLED&#39; parameter=
.=C2=A0 They can help count how many events happen between certain events.=
=C2=A0 Then you can combine them with a timer and watchpoints to detect how=
 many times a loop can execute in 1000 clock cycles etc.=C2=A0 Please read =
about PCCRn and PCMRn in the architecture manual.<br>
&gt;<br>
&gt; It might be just as easy to use simple timing in a c program though, d=
epending on the toolchain you use you can compare times between runs of you=
r algorithm.<br>
&gt; i.e.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0#include &lt;time.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0static long to_micro(struct timespec *time) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (time-&gt;tv_sec * 1000000) + (time-&=
gt;tv_nsec / 1000);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int main() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, j =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec before, after;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC, &amp;before);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Super complex algorithm */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; 100; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D (j+1) * (j+2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC, &amp;after);<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;time to run algorithm %ld uSecs=
\n&quot;, to_micro(&amp;after) - <br>
&gt; to_micro(&amp;before));<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; $ or1k-smh-linux-gnu-gcc timer.c<br>
&gt; $ ./glibc-build-scripts/qemu-or1k-libc ./a.out time to run algorithm <=
br>
&gt; 164 uSecs<br>
&gt;<br>
&gt; I hope it helps.<br>
&gt;<br>
&gt; -Stafford<br>
&gt;<br>
&gt; On Tue, Oct 08, 2019 at 10:54:29PM +1100, Julius Baxter wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; No problem.<br>
&gt; &gt;<br>
&gt; &gt; There are performance counters in the OpenRISC architecture but <=
br>
&gt; &gt; whether they&#39;re implemented in a particular implementation is=
 another matter.<br>
&gt; &gt;<br>
&gt; &gt; You can use these registers to measure various things the CPU is =
<br>
&gt; &gt; doing while it&#39;s executing. If you read the ISA document it&#=
39;ll tell <br>
&gt; &gt; you about them.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m CCing Stafford because he&#39;s the main OpenRISC man the=
se days and <br>
&gt; &gt; probably knows about the state of the performance counter registe=
rs <br>
&gt; &gt; in various simulators and RTL implementations.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Julius<br>
&gt; &gt;<br>
&gt; &gt; On Tue., 8 Oct. 2019, 10:43 pm , &lt;<a href=3D"mailto:ecalvo@2se=
.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; Hi Julius,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sorry for bothering you again =E2=98=B9. Can I do you other =
fast question <br>
&gt; &gt; &gt; related to openrisc? If not, ignore the email please.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is there any way to characterize the type of application tha=
t I <br>
&gt; &gt; &gt; can run in openrisc? I mean, could you measure (with numbers=
) if <br>
&gt; &gt; &gt; an algorithm can be executed on it and the speed that it wil=
l achieve?<br>
&gt; &gt; &gt; Is it possible to do it using orksim?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sorry because maybe it is so basic and general =E2=98=B9<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks in advance<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; *De:* Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&gt; *=
Enviado el:* lunes, <br>
&gt; &gt; &gt; 16 de septiembre de 2019 13:11<br>
&gt; &gt; &gt; *Para:* <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" r=
el=3D"noreferrer">ecalvo@2se.es</a><br>
&gt; &gt; &gt; *Asunto:* Re: Starting with OpenRISC - IOBs<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Also! To let you know, if you&#39;re in Spain, we will soon =
be having <br>
&gt; &gt; &gt; our ORConf conference in Europe, and it&#39;s in Bordeaux, F=
rance, <br>
&gt; &gt; &gt; just across the border. :)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There are several people there who can help you get up to sp=
eed, <br>
&gt; &gt; &gt; one of whom is Stafford Horne who knows most about the OpenR=
ISC IP <br>
&gt; &gt; &gt; lately. He will be presenting. If you can attend, it&#39;d b=
e helpful, I&#39;m sure.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; All info at <a href=3D"https://orconf.org" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://orconf.org</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Julius<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, 16 Sep 2019 at 21:09, Julius Baxter <br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:juliusbaxter@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Elisa,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sorry for the delay in this response.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You should be using an SoC toplevel. FPGAs have everything y=
ou <br>
&gt; &gt; &gt; need on board like memories and IO blocks and lots of other =
FPGA <br>
&gt; &gt; &gt; fabric for you to implement other pieces of hardware.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; FuseSoC provides a really nice and easy way to build an mor1=
kx <br>
&gt; &gt; &gt; design for the DE0 nano I believe:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://github.com/olofk/de0_nano" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://github.com/olofk/de0_nano</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; That github page has a rough guide to getting it going.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If you need help I recommend posting to the OpenRISC mailing=
 list <br>
&gt; &gt; &gt; and people will respond probably more promptly than I. (I <b=
r>
&gt; &gt; &gt; recommend getting to know how to use mailing lists.<br>
&gt; &gt; &gt; <a href=3D"https://openrisc.io/community" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://openrisc.io/community</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There are more resources here: <a href=3D"https://openrisc.i=
o/tutorials" rel=3D"noreferrer noreferrer" target=3D"_blank">https://openri=
sc.io/tutorials</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I hope that&#39;s helpful.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Julius<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, 11 Sep 2019 at 20:09, &lt;<a href=3D"mailto:ecalvo@2=
se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Julius,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks a lot for the quick answer.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes, this is the problem: I am using as top level the mor1kx=
 <br>
&gt; &gt; &gt; module itself. You mean that I need to synthetize also in <b=
r>
&gt; &gt; &gt; reconfigurable logic these cores, don=E2=80=99t you? I thoug=
ht that I <br>
&gt; &gt; &gt; could have these elements as external in a development board=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks again,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cheers<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; *De:* Julius Baxter &lt;<a href=3D"mailto:juliusbaxter@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">juliusbaxter@gmail.com</a>&gt; *=
Enviado el:* <br>
&gt; &gt; &gt; mi=C3=A9rcoles, 11 de septiembre de 2019 12:02<br>
&gt; &gt; &gt; *Para:* <a href=3D"mailto:ecalvo@2se.es" target=3D"_blank" r=
el=3D"noreferrer">ecalvo@2se.es</a><br>
&gt; &gt; &gt; *Asunto:* Re: Starting with OpenRISC - IOBs<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Elisa,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks for getting in touch, that sounds like a cool project=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can you tell me about the toplevel - are you using a system =
<br>
&gt; &gt; &gt; toplevel, or is your toplevel the mor1kx module itself?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If it&#39;s the latter, then that&#39;s not the best way to =
do it - you <br>
&gt; &gt; &gt; need a system toplevel which instantiates memories and some =
reset <br>
&gt; &gt; &gt; circuitry and likely some IO (UART, GPIO, JTAG debug, etc.) =
to talk to the outside world.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is that helpful?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Julius<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, 11 Sep 2019 at 19:47, &lt;<a href=3D"mailto:ecalvo@2=
se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Dear Dr. Baxter,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; My name is Elisa Calvo Gallego. I am writing you because I h=
ave <br>
&gt; &gt; &gt; started to work with OpenRISC in the framework of a research=
 <br>
&gt; &gt; &gt; project developed in the company where I am working (Space <=
br>
&gt; &gt; &gt; Submicron Electronics, 2SE), and I am having some basic trou=
bles. Could you help me?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Although the FPGA that we are planning to use is larger, I h=
ave <br>
&gt; &gt; &gt; synthetized mor1kx for a DE0 nano board as first step (this =
is the <br>
&gt; &gt; &gt; board used in the majority of guides and tutorials). My prob=
lem is <br>
&gt; &gt; &gt; that the results that I have obtained are similar in area an=
d <br>
&gt; &gt; &gt; resources, except for IOBs, which are more than available IO=
Bs in <br>
&gt; &gt; &gt; the device. Do you know what I am doing wrong? Should I comm=
ent <br>
&gt; &gt; &gt; debug lines or something like that? I apologize if the quest=
ion is <br>
&gt; &gt; &gt; immediate. I didn&#39;t find the answer and I&#39;m new in t=
his.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks very much in advance.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Elisa<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--000000000000aa597005951448cf--

--===============4008719333008643231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4008719333008643231==--
