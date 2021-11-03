Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5974A443F17
	for <lists+openrisc@lfdr.de>; Wed,  3 Nov 2021 10:14:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E47ED24256;
	Wed,  3 Nov 2021 10:14:57 +0100 (CET)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mail.librecores.org (Postfix) with ESMTPS id 277DB23F8E
 for <openrisc@lists.librecores.org>; Wed,  3 Nov 2021 10:14:57 +0100 (CET)
Received: by mail-ed1-f42.google.com with SMTP id m14so6891945edd.0
 for <openrisc@lists.librecores.org>; Wed, 03 Nov 2021 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQyBvlVxogRIDeBk5ZzwlYlzVm5k1oWohLoEUx+Pcps=;
 b=a6FpBWuKw/ucF+fAJZC2224xadd3slOMCK+csPuXcEnDffLUfXD/Ua81Uc8bTU4ROD
 Lf/bDmqKhlOrkjZUZrIivs+hYYvSAikTcRJ8y4B/MQ8XlR92J52Nd93PF2EA++PWOxDG
 DWd7x5oUo0ixOt5wHDn9qDpWomjkKHKSGrwepeLaM99UFoazRaYlYDAZve0QkpE72jRH
 Bidx8crUIWg1PkJ0h5mI4wFGBy0tFa7UkESkMAxZa9aEwmlGGPhuRpP+3pz49k0X8m+T
 pCUbDwQ/yl4j++3IV4jnTOwaramsH5DosvGxIFaRzkQAnN7gikXDAB5qTHwfrMZ6Af4J
 sb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQyBvlVxogRIDeBk5ZzwlYlzVm5k1oWohLoEUx+Pcps=;
 b=dtVyoWo6+3d5gmBHPG9EA23GDNyYlZw5F8EbEs1vJ8tePJmNQtVW3HNoc9G4eHuwTL
 EDFDAx3nsw8IYiMjk014IU4zVCpYj/m5ySa6H+oyg1BzmhVheJHccO/NBc7vLPrPy4jX
 WJ0V1jeKhvd/T20HTGEytmT9WKEahBgvyx8v44XjG27pMwAwt8oy08E4jBGeJ88OQsiX
 xd6MX9xO25di4AwgS+APsozg69N2ok2wdA48fg+hsTMN3WBPSVZxpSKvHY1TZ1/zid7H
 bJXJXAFZMHLlZILIeIgUJDuquU0vfohZ/EnY+sjHm2lBUOf7BkKQUfWFFwDJerQvFR/C
 qHhQ==
X-Gm-Message-State: AOAM533FkU5D7GYB1EkhBYbScxPt2IxGXDcZlvIUEPspQXbGZOHIBy2Q
 BLUH3x6i8RgXEOQGRyT3HbkfnN+hn3a/2FBW41eGC5Dk
X-Google-Smtp-Source: ABdhPJxKJE/QvrUTCUkXPdR58qvuNdaQTN9v1RlYpQqFK3BJH6OxUaHzWFD71Y5EKSFRqGmOD99EBfTD50XSEJevmDM=
X-Received: by 2002:a50:ff07:: with SMTP id a7mr58480994edu.338.1635930895896; 
 Wed, 03 Nov 2021 02:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <e35018e8-a15b-550d-cc3e-6b6d045f1b52@rwth-aachen.de>
 <YX8O0ix3MyOGQnqq@antec> <a29b15d7-3e8a-4851-8175-66fa805f4dff@rwth-aachen.de>
In-Reply-To: <a29b15d7-3e8a-4851-8175-66fa805f4dff@rwth-aachen.de>
From: Stafford Horne <shorne@gmail.com>
Date: Wed, 3 Nov 2021 18:14:44 +0900
Message-ID: <CAAfxs76wvwwYNTBBbCqpts8HWNZK9Dx-ETtvEge-Hva6dafumQ@mail.gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Subject: Re: [OpenRISC] OpenRISC SMP kernels broken after 5.8?
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
Content-Type: multipart/mixed; boundary="===============4349915243168851591=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4349915243168851591==
Content-Type: multipart/alternative; boundary="000000000000ed55c905cfded780"

--000000000000ed55c905cfded780
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

You are right. I'll update those as well.

I'll send a patch later tonight. I'm out right now.

On Wed, Nov 3, 2021, 5:02 PM Jan Henrik Weinstock <
jan.weinstock@rwth-aachen.de> wrote:

> Hi Stafford,
>
> your patch has fixed the issue for me. I tested this with a 5.10 kernel
> on single-, dual- and quad- Openriscs in my simulator and it ran stable.
>
> However, are we sure we caught everything? For example, I see the same
> issue in flush_tlb_page [1], which can also have vma == NULL in the
> page_[set|clear]_nocache functions [2]. It does not trigger a panic for
> me though (probably because I do not have any DMA devices in the
> simulator at the moment)...
>
> Jan
>
> [1]
>
> https://elixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/kernel/smp.c#L304
> [2]
>
> https://elixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/kernel/dma.c#L36
>
> On 31/10/2021 22:46, Stafford Horne wrote:
> > On Tue, Oct 26, 2021 at 10:43:45PM +0200, Jan Henrik Weinstock wrote:
> >> Hi all,
> >>
> >> I recently tried to update the kernel my simulator[1] is running to
> 5.10,
> >> but I noticed the newer kernels (>5.8) all panic in flush_tlb_page[2],
> >> because it is called with vma == NULL from flush_tlb_kernel_range[3].
> >> Looking at the code, I do not see how this could work for any SMP kernel
> >> (however, for non-SMP, we call local_tlb_flush_page[4], where we do not
> use
> >> vma, so I guess its fine there). Any ideas?
> >
> > Hi Jan,
> >
> > (sorry for late reply, I need to fix my filters)
> >
> > Are you running on a SMP machine or are you running SMP kernel on a
> single CPU
> > with no ompic device?
> >
> > I haven't had issues when running the SMP kernels on single CPU devices,
> > however, I can't recall how recent that is.
> >
> > I did make a patch to this around 5.10, so I am pretty user it was
> working at
> > this point.  The reason added this patch was because I noticed
> simulators were
> > spending a lot of time, ~90%+, in TLB flushes I figured that reducing
> the work
> > done for TLB flushes would improve performance, and it did.
> >
> > The patch:
> >
> >   -
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=c28b27416da9
> >
> > But it looks like this is what introduced the issue.  Somehow this
> slipped
> > through.  I think a patch like the following would help for now, I
> cannot easily
> > test now due to my environment being occupied by some long running
> tests.  Any
> > suggestions?
> >
> > Basically the idea is, we only need the VMA to figure out which CPU's to
> flush
> > the range on.  When we pass in NULL it means its a kernel flush and we
> should
> > flush on all CPU's.  There may be something more efficient (maybe using
> > init_mm), but this is all I can think of that is safe.
> >
> > -Stafford
> >
> > diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> > index 415e209732a3..cf5079bd8f43 100644
> > --- a/arch/openrisc/kernel/smp.c
> > +++ b/arch/openrisc/kernel/smp.c
> > @@ -320,7 +320,9 @@ void flush_tlb_page(struct vm_area_struct *vma,
> unsigned
> > long uaddr)
> >   void flush_tlb_range(struct vm_area_struct *vma,
> >                       unsigned long start, unsigned long end)
> >   {
> > -       smp_flush_tlb_range(mm_cpumask(vma->vm_mm), start, end);
> > +       struct cpumask *cmask = (vma == NULL) ? cpu_online_mask
> > +                                             : mm_cpumask(vma->vm_mm);
> > +       smp_flush_tlb_range(cmask, start, end);
> >   }
> >
> >   /* Instruction cache invalidate - performed on each cpu */
> >
>

--000000000000ed55c905cfded780
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Jan,</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">You are right. I&#39;ll update those as well.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I&#39;ll send a patch later tonight. I&#39;m o=
ut right now.<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 3, 2021, 5:02 PM Jan Henrik Weinstock &=
lt;<a href=3D"mailto:jan.weinstock@rwth-aachen.de">jan.weinstock@rwth-aache=
n.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Stafford,<br=
>
<br>
your patch has fixed the issue for me. I tested this with a 5.10 kernel <br=
>
on single-, dual- and quad- Openriscs in my simulator and it ran stable.<br=
>
<br>
However, are we sure we caught everything? For example, I see the same <br>
issue in flush_tlb_page [1], which can also have vma =3D=3D NULL in the <br=
>
page_[set|clear]_nocache functions [2]. It does not trigger a panic for <br=
>
me though (probably because I do not have any DMA devices in the <br>
simulator at the moment)...<br>
<br>
Jan<br>
<br>
[1] <br>
<a href=3D"https://elixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/k=
ernel/smp.c#L304" rel=3D"noreferrer noreferrer" target=3D"_blank">https://e=
lixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/kernel/smp.c#L304</a>=
<br>
[2] <br>
<a href=3D"https://elixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/k=
ernel/dma.c#L36" rel=3D"noreferrer noreferrer" target=3D"_blank">https://el=
ixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/kernel/dma.c#L36</a><b=
r>
<br>
On 31/10/2021 22:46, Stafford Horne wrote:<br>
&gt; On Tue, Oct 26, 2021 at 10:43:45PM +0200, Jan Henrik Weinstock wrote:<=
br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; I recently tried to update the kernel my simulator[1] is running t=
o 5.10,<br>
&gt;&gt; but I noticed the newer kernels (&gt;5.8) all panic in flush_tlb_p=
age[2],<br>
&gt;&gt; because it is called with vma =3D=3D NULL from flush_tlb_kernel_ra=
nge[3].<br>
&gt;&gt; Looking at the code, I do not see how this could work for any SMP =
kernel<br>
&gt;&gt; (however, for non-SMP, we call local_tlb_flush_page[4], where we d=
o not use<br>
&gt;&gt; vma, so I guess its fine there). Any ideas?<br>
&gt; <br>
&gt; Hi Jan,<br>
&gt; <br>
&gt; (sorry for late reply, I need to fix my filters)<br>
&gt; <br>
&gt; Are you running on a SMP machine or are you running SMP kernel on a si=
ngle CPU<br>
&gt; with no ompic device?<br>
&gt; <br>
&gt; I haven&#39;t had issues when running the SMP kernels on single CPU de=
vices,<br>
&gt; however, I can&#39;t recall how recent that is.<br>
&gt; <br>
&gt; I did make a patch to this around 5.10, so I am pretty user it was wor=
king at<br>
&gt; this point.=C2=A0 The reason added this patch was because I noticed si=
mulators were<br>
&gt; spending a lot of time, ~90%+, in TLB flushes I figured that reducing =
the work<br>
&gt; done for TLB flushes would improve performance, and it did.<br>
&gt; <br>
&gt; The patch:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?h=3Dc28b27416da9" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/commit/?h=3Dc28b27416da9</a><br>
&gt; <br>
&gt; But it looks like this is what introduced the issue.=C2=A0 Somehow thi=
s slipped<br>
&gt; through.=C2=A0 I think a patch like the following would help for now, =
I cannot easily<br>
&gt; test now due to my environment being occupied by some long running tes=
ts.=C2=A0 Any<br>
&gt; suggestions?<br>
&gt; <br>
&gt; Basically the idea is, we only need the VMA to figure out which CPU&#3=
9;s to flush<br>
&gt; the range on.=C2=A0 When we pass in NULL it means its a kernel flush a=
nd we should<br>
&gt; flush on all CPU&#39;s.=C2=A0 There may be something more efficient (m=
aybe using<br>
&gt; init_mm), but this is all I can think of that is safe.<br>
&gt; <br>
&gt; -Stafford<br>
&gt; <br>
&gt; diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c<b=
r>
&gt; index 415e209732a3..cf5079bd8f43 100644<br>
&gt; --- a/arch/openrisc/kernel/smp.c<br>
&gt; +++ b/arch/openrisc/kernel/smp.c<br>
&gt; @@ -320,7 +320,9 @@ void flush_tlb_page(struct vm_area_struct *vma, un=
signed<br>
&gt; long uaddr)<br>
&gt;=C2=A0 =C2=A0void flush_tlb_range(struct vm_area_struct *vma,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unsigned long start, unsigned long end)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0smp_flush_tlb_range(mm_cpumask(vma-&gt;vm_=
mm), start, end);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpumask *cmask =3D (vma =3D=3D NULL=
) ? cpu_online_mask<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0: mm_cpumask(vma-&gt;vm_mm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0smp_flush_tlb_range(cmask, start, end);<br=
>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Instruction cache invalidate - performed on each cpu */=
<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000ed55c905cfded780--

--===============4349915243168851591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4349915243168851591==--
