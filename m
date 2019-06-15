Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AFAC646E8A
	for <lists+openrisc@lfdr.de>; Sat, 15 Jun 2019 08:14:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 570B620298;
	Sat, 15 Jun 2019 08:14:33 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mail.librecores.org (Postfix) with ESMTPS id E9FE4201E2
 for <openrisc@lists.librecores.org>; Sat, 15 Jun 2019 08:14:31 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id u124so3134130vsu.2
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x7HRvZBwPJ/BxWln3T0suJ71WB79e6RfHpUnRj26xLE=;
 b=cFhjIeK4ie4Px1I6OlIfbsuvSmmtEXAMWudttsdh7nnj10/N+3xGBjT30fDcItrRI/
 mdM3gzJugTkO7hm8OCcJmLyq+QkYYrctRaPa2kgB6egEcTgNNkiG0TM1Uxj/1/9k469B
 r6ujDMj7agL/tQowzu5JD3mT1au3gqsturfEi1yXEEd3daNmJNkPwrzsWAqqELAAZMmY
 rJ8BurMVsTgJvTX6BChzH/VvooXgj8r1eNMpAH/6NLc644pv4kGnH+Y3RNCb6FLjkP/+
 wuMr8WJsUZu/r3nO5rn/eVHGDVzYL3RYSxVry1HUJ8o/wa+V5v+0+AifCKEAC7cJTQRd
 Q6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x7HRvZBwPJ/BxWln3T0suJ71WB79e6RfHpUnRj26xLE=;
 b=MMTKgUw5vLjh1E6oVKmPnUgdkDKoX6OVCveoB/WKsQLinMzQs/ZWFxGSON7yO1KS9R
 wOMY1qQMFWUi+kTKOooTk0vBVt8HU21kX1JQaxxEgIoGHEDMs4WKqqYzpQ9vtGiS/AsW
 htx2z1dtaN/CUe7FOf8pF74ftd3UaAMVijaaOvr//aWms1e9UsLMTG/rMqmf0Lt7ztJv
 6thOc6yhnURsGZBYaGQpsrK7e0U2AUaANZGGUrcX0qN34M4/nYHJvit4XK6G7GeZBCB/
 6ky/15wBdN/+l907Gxkhju96YMykYS6gjHoUbPc089ReIVIahNrN6zVzH59sSYeP/XvP
 I2AA==
X-Gm-Message-State: APjAAAVg8hIKgV0Qht2no0WS99PGg6wEkikvVR6Au9p8UJgMPQV5MCqW
 t2xVwTeO7ggPxDPthnCos/aA0hlC5gul+sEPRYA=
X-Google-Smtp-Source: APXvYqwEyxBLrTG3imL4IAbzA8Q5h3uISd+AHfGJCnGd15eq2u8S/jq/4KGA0+9g6N0HMqHT35LfQf4fy8sULdy63HE=
X-Received: by 2002:a67:f5c5:: with SMTP id t5mr44419072vso.27.1560579270568; 
 Fri, 14 Jun 2019 23:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
 <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
 <AED0C7019AE04A2F87CD0E432FA20A70@BAndViG>
 <20190511100433.GA20465@lianli.shorne-pla.net>
 <A49361B4A05048AD995FF588CC923E61@BAndViG>
 <20190606221130.GF3379@lianli.shorne-pla.net>
In-Reply-To: <20190606221130.GF3379@lianli.shorne-pla.net>
From: Stafford Horne <shorne@gmail.com>
Date: Sat, 15 Jun 2019 15:14:19 +0900
Message-ID: <CAAfxs740mxPqqa6jm-6DL+K5k_wULTko5bSD5nt1CxxbMO6FeA@mail.gmail.com>
To: BAndViG <bandvig@mail.ru>
Subject: Re: [OpenRISC] OpenRISC 1.3 spec
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
Content-Type: multipart/mixed; boundary="===============3057099005953288536=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============3057099005953288536==
Content-Type: multipart/alternative; boundary="00000000000010f093058b56adfa"

--00000000000010f093058b56adfa
Content-Type: text/plain; charset="UTF-8"

Hello,

The changes are now merged. Thanks for all of your help.

Read more at:
https://openrisc.io/2019/06/04/openrisc-arch1.3

-Stafford

On Fri, Jun 7, 2019, 7:11 AM Stafford Horne <shorne@gmail.com> wrote:

> On Sun, May 12, 2019 at 10:58:53PM +0300, BAndViG wrote:
> >>From: Stafford Horne
> >>Sent: Saturday, May 11, 2019 1:04 PM
> >
> >>> On Fri, May 10, 2019 at 10:56:05AM +0300, BAndViG wrote:
> >>> I've been thinking about a variants for R0 write protection. R0 could
> be
> >>> zero initialized at cpu_rst by dedicated circuits. And `invalid >
> >>instruction`
> >>> exception should be raised if an instruction tries to write to R0. At
> the
> >>> same time such behavior is incompatible with current run-time >
> >>initialization
> >>> sequences implemented in OR1K tool chains. The circle is closed.
> >
> >>We still have the option to drop the validation.  Just as we don't have
> >>validation for writing to r0, I think its fine to say r31's pair
> register is
> >>undefined and should be avoided. (i.e. on some machines it might go into
> the
> >>shadow reg space)
> >
> >On the one hand I'm a kind of perfectionist and would prefer to
> >implement such protections. On the other hand they cost noticeable
> >space and timing. Not trivial choice for me :).
> >
> >>On the other hand, I have finished the GCC updates for unordered
> comparisons.
> >>You can see the patch here, I built newlib with this enabled and was
> able to
> >>shake out a few bugs.  It seems to work:
> >
> >>  - https://github.com/stffrdhrn/gcc/commits/or1k-fpu-2
> >
> >>The new gcc argument is:
> >
> >>  -munordered-float
> >
> >I've build two variants of GCC9/NewLIB tool chains. One has got
> >"-mhard-float -munordered-float" options raised by default. And
> >another one has got "-mhard-float -mdouble-float -munordered-float"
> >default options. First variant was used to build single precision
> >Whetstone for mor1kx+FPU32 and second to build single and double
> >precision Whetstone for MAROCCHINO. All variants work.
> >We could merge fp_unordered_cmp branches into master. Or should we
> >postpone the merge till your binutils/gcc patches being upstreamed?
> >
> >WBR
> >Andrey
>
>
> Hello Richard, Andrey, OpenRISCers,
>
> This is the final review for spec version 1.3.  The pdf is here:
>
>  - https://github.com/openrisc/doc/raw/master/openrisc-arch-1.3-rev1.pdf
>
> To see a history of the changes so far check out these pull requests:
>
>  - https://github.com/openrisc/doc/pull/2 - Spec Updates from Stafford
>  - https://github.com/openrisc/doc/pull/3 - SPec Updates from Andrey
>
> These PRs are all merged and the last thing we have is to merge the
> website and
> news updates to make it official:
>
>  - https://github.com/openrisc/openrisc.github.io/pull/13
>
> I'll let it sit for a bit to see if we can collect any comments or
> feedback on
> the final document.  So please speak up.
>
> But anyway, if there are any issues after the fact we can always create a
> revision 2.
>
> -Stafford
>

--00000000000010f093058b56adfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hello,</div><div dir=3D"auto"><br></div=
>The changes are now merged. Thanks for all of your help.<div dir=3D"auto">=
<br></div><div dir=3D"auto">Read more at:</div><div dir=3D"auto"><a href=3D=
"https://openrisc.io/2019/06/04/openrisc-arch1.3">https://openrisc.io/2019/=
06/04/openrisc-arch1.3</a><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">-Stafford</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Jun 7, 2019, 7:11 AM Stafford Horne &lt;<a hr=
ef=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Sun, May 12, 2019 at 10:58:53PM +0300, BAndV=
iG wrote:<br>
&gt;&gt;From: Stafford Horne<br>
&gt;&gt;Sent: Saturday, May 11, 2019 1:04 PM<br>
&gt;<br>
&gt;&gt;&gt; On Fri, May 10, 2019 at 10:56:05AM +0300, BAndViG wrote:<br>
&gt;&gt;&gt; I&#39;ve been thinking about a variants for R0 write protectio=
n. R0 could be<br>
&gt;&gt;&gt; zero initialized at cpu_rst by dedicated circuits. And `invali=
d &gt; <br>
&gt;&gt;instruction`<br>
&gt;&gt;&gt; exception should be raised if an instruction tries to write to=
 R0. At the<br>
&gt;&gt;&gt; same time such behavior is incompatible with current run-time =
&gt; <br>
&gt;&gt;initialization<br>
&gt;&gt;&gt; sequences implemented in OR1K tool chains. The circle is close=
d.<br>
&gt;<br>
&gt;&gt;We still have the option to drop the validation.=C2=A0 Just as we d=
on&#39;t have<br>
&gt;&gt;validation for writing to r0, I think its fine to say r31&#39;s pai=
r register is<br>
&gt;&gt;undefined and should be avoided. (i.e. on some machines it might go=
 into the<br>
&gt;&gt;shadow reg space)<br>
&gt;<br>
&gt;On the one hand I&#39;m a kind of perfectionist and would prefer to <br=
>
&gt;implement such protections. On the other hand they cost noticeable <br>
&gt;space and timing. Not trivial choice for me :).<br>
&gt;<br>
&gt;&gt;On the other hand, I have finished the GCC updates for unordered co=
mparisons.<br>
&gt;&gt;You can see the patch here, I built newlib with this enabled and wa=
s able to<br>
&gt;&gt;shake out a few bugs.=C2=A0 It seems to work:<br>
&gt;<br>
&gt;&gt;=C2=A0 - <a href=3D"https://github.com/stffrdhrn/gcc/commits/or1k-f=
pu-2" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/st=
ffrdhrn/gcc/commits/or1k-fpu-2</a><br>
&gt;<br>
&gt;&gt;The new gcc argument is:<br>
&gt;<br>
&gt;&gt;=C2=A0 -munordered-float<br>
&gt;<br>
&gt;I&#39;ve build two variants of GCC9/NewLIB tool chains. One has got <br=
>
&gt;&quot;-mhard-float -munordered-float&quot; options raised by default. A=
nd <br>
&gt;another one has got &quot;-mhard-float -mdouble-float -munordered-float=
&quot; <br>
&gt;default options. First variant was used to build single precision <br>
&gt;Whetstone for mor1kx+FPU32 and second to build single and double <br>
&gt;precision Whetstone for MAROCCHINO. All variants work.<br>
&gt;We could merge fp_unordered_cmp branches into master. Or should we <br>
&gt;postpone the merge till your binutils/gcc patches being upstreamed?<br>
&gt;<br>
&gt;WBR<br>
&gt;Andrey<br>
<br>
<br>
Hello Richard, Andrey, OpenRISCers,<br>
<br>
This is the final review for spec version 1.3.=C2=A0 The pdf is here:<br>
<br>
=C2=A0- <a href=3D"https://github.com/openrisc/doc/raw/master/openrisc-arch=
-1.3-rev1.pdf" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/openrisc/doc/raw/master/openrisc-arch-1.3-rev1.pdf</a><br>
<br>
To see a history of the changes so far check out these pull requests:<br>
<br>
=C2=A0- <a href=3D"https://github.com/openrisc/doc/pull/2" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/openrisc/doc/pull/2</a> =
- Spec Updates from Stafford<br>
=C2=A0- <a href=3D"https://github.com/openrisc/doc/pull/3" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/openrisc/doc/pull/3</a> =
- SPec Updates from Andrey<br>
<br>
These PRs are all merged and the last thing we have is to merge the website=
 and<br>
news updates to make it official:<br>
<br>
=C2=A0- <a href=3D"https://github.com/openrisc/openrisc.github.io/pull/13" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/openrisc=
/openrisc.github.io/pull/13</a><br>
<br>
I&#39;ll let it sit for a bit to see if we can collect any comments or feed=
back on<br>
the final document.=C2=A0 So please speak up.<br>
<br>
But anyway, if there are any issues after the fact we can always create a<b=
r>
revision 2.<br>
<br>
-Stafford<br>
</blockquote></div>

--00000000000010f093058b56adfa--

--===============3057099005953288536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============3057099005953288536==--
