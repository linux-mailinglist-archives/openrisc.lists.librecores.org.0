Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B61005DDA6
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 07:02:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CF3D2202BB;
	Wed,  3 Jul 2019 07:02:38 +0200 (CEST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mail.librecores.org (Postfix) with ESMTPS id 1B77820220;
 Wed,  3 Jul 2019 07:02:36 +0200 (CEST)
Received: by mail-ed1-f49.google.com with SMTP id m10so702376edv.6;
 Tue, 02 Jul 2019 22:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5/AlHIVaozPuEYzDoeUWBQp3/ZstnTheAqzXt+6tBU=;
 b=Pd3E8kYf5GHd++sTf9ObZwF43Ry8FvYBzGRdRJIjbqhbIrOz9Bb0vEBqq/OPjKKpFL
 6pkS9IDWY+xMDnkEutmzr7Oo1HFPHQOWIgMpvRKnyM2PNUrO7YWH1xiu0+MpIzgvixZT
 FEx9KaNZKbLmdb+NPhoU95HyY9xHit7lwQ2eSm63vR/vy608ScHLpKJ9bnJiu2RrGAYn
 avY2BMD5wMEwOgaHPA4wbCMyu5Q1+qAsDpKnr/TC4eVCJupkVtKfdSWOoxFAmQ97BXJd
 OFaiXm2IfSIYD1f3TfdU6jVL7U8Lp/RPDapQ7wX8hvIBDI+LKck1+MvOtNyAJqFBBU6K
 dHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5/AlHIVaozPuEYzDoeUWBQp3/ZstnTheAqzXt+6tBU=;
 b=TxvMC0ib4NK9+8ok5UU08+pCXl5dxUfgTjtZsJn0v5KGcwkPHCA4HskgeGuGqYWTto
 HezU+wa6iIwOE5jN03pIfZwM4LcLh8eU0pZr8HUwBKYYFMzsndyBhzksEijyebhNv3tF
 hL9FPHjEmy4FAGbd2S46DSC2uUl8Vy/dSY8TxZOnunbPw6Gb57E4FVX/F9rwufy2ag8I
 3NaOwnwQIU2HuUf1Jp4t2EDk3YlAjjpKZoFqwSuy1YHADA4tTdqnWyEPLMEr3Pa0xUAY
 a8zUs9zxGZm8sSSdCyz4nawyjFck0/L1Y1kK5HxI4PFheYctyD2wEZTD1RMc//g8Jo8E
 gsQw==
X-Gm-Message-State: APjAAAUlRRgszl7h/NCQUlnSQaMDO916CGWffxvuOB2zxYjjiqY/UEuM
 BpSjoDizuYRJxO4RT6yzfQOkMOFkuA4pV5e8Dms=
X-Google-Smtp-Source: APXvYqxwSSLWQItjOI/8znCWfxRt3DtTCBSjS/BQ5AXCWE+HlbUi8ZpgcgETwD2V0DP+Kd6UQQ4t2i6GK81MkHEOoQg=
X-Received: by 2002:a05:6402:1459:: with SMTP id
 d25mr39574524edx.235.1562130155300; 
 Tue, 02 Jul 2019 22:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAF69GoqLtjD3jySOto4Fu3N9PRb1Ji5CyNHK7ScYvv+bOeiYKg@mail.gmail.com>
 <CAAfxs77GYaDHJL-qLmQqTqrpAjvws=8Q52qS7eYyX52NFc9z3g@mail.gmail.com>
 <CAKaYPCPNiGT2m+9cviPFui_Dzbo1QOnQviB0s+foa093rTwGKw@mail.gmail.com>
In-Reply-To: <CAKaYPCPNiGT2m+9cviPFui_Dzbo1QOnQviB0s+foa093rTwGKw@mail.gmail.com>
From: Nancy Chauhan <nancychn1@gmail.com>
Date: Wed, 3 Jul 2019 10:32:24 +0530
Message-ID: <CAF69Gope9f3x7-26s3L5fMiK8W2XFqR4GGW9w-BS7gX9o-PeeQ@mail.gmail.com>
To: Olof Kindgren <olof.kindgren@gmail.com>, Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [GSoC 2019] Coding Phase 2 : Continuous Integration
 for Hardware Projects on LibreCores CI (Nancy Chauhan)
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
Cc: "General discussion around open source silicon."
 <discussion@lists.librecores.org>, Openrisc <openrisc@lists.librecores.org>,
 Oleg Nenashev <o.v.nenashev@gmail.com>
Content-Type: multipart/mixed; boundary="===============5871586081869907652=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============5871586081869907652==
Content-Type: multipart/alternative; boundary="000000000000ffeb4e058cbfc4c6"

--000000000000ffeb4e058cbfc4c6
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 3, 2019 at 1:40 AM Olof Kindgren <olof.kindgren@gmail.com>
wrote:

>
>
> On Tue, Jul 2, 2019 at 1:04 AM Stafford Horne <shorne@gmail.com> wrote:
>
>> Hello,
>>
>> On Mon, Jul 1, 2019, 9:22 PM Nancy Chauhan <nancychn1@gmail.com> wrote:
>>
>>> Hello all,
>>>
>>> This mail is to summarize the plan for Coding phase 2 of GSoC 2019. I
>>> will be working to Create CI for Yosys synthesis
>>> <http://www.clifford.at/yosys/>required for monitoring resource usages
>>> in mor1kx <https://github.com/Nancy-Chauhan/mor1kx> and also might
>>> further extend CI for Ysoys synthesis if possible for place and route ( https://github.com/YosysHQ/arachne-pnr
>>> ).
>>>
>>
>> Probably we want nextpnr here.
>> https://github.com/YosysHQ/nextpnr
>>
> Hi,

As far as I have seen https://github.com/olofk/serv/blob/master/serv.core,
https://github.com/olofk/serv/blob/master/servant.core *example project
using fusesoc and yosys*, I realized we might have to do changes in
mor1kx.core https://github.com/openrisc/mor1kx/blob/master/mor1kx.core#L79
and may also have to include target boards the repository. Can you further
clarify on this and guide me further.

>
> I tried to do my part here and just pushed an edalize patch to only run
> synthesis in the icestorm backend by setting pnr to none.
>
> Tested it on my serv CPU with fusesoc run --target=tinyfpga_bx servant
> --pnr=none
>

And also we can try this first.

Hope this helps
>
> //Olof
>
>
>>
>>
>> The plan will be reached to work even on Creating CI for OpenOCD/GDB  for
>>> CPU pipeline debugging in mor1kx  and extending Jenkinsfile (
>>> https://github.com/openrisc/mor1kx/pull/84 ) in mor1kx to make Ysoys
>>> and OpenOCD/GDB part of the build pipeline. It can be added to
>>> ci.librecores.org so that Pull request builder runs for the repository
>>> mor1kx .
>>> We can later  Detach reusable logic of mor1kx to https://github.com/librecores/librecores-pipeline-lib
>>> .
>>>
>>> The question I have is whether should we keep all these new additions in
>>> current Travis flow ( https://github.com/openrisc/mor1kx/blob/master/.travis.yml
>>> ) also ?
>>>
>>>
>> I think we can replace Travis when
>>   1. We have a new build status badge for Jenkins in the readme.
>>   2. Jenkins is integrated and performs all of the same checks for pull
>> requests.
>>   3. (Nice to have) Jenkins can be as fast/faster than Travis i.e. finish
>> within 5 minutes
>>
>>
>>> Thank you ,
>>> Nancy Chauhan
>>>
>>> Chats on : https://gitter.im/librecores/librecores-ci
>>>
>> _______________________________________________
>> OpenRISC mailing list
>> OpenRISC@lists.librecores.org
>> https://lists.librecores.org/listinfo/openrisc
>>
>

--000000000000ffeb4e058cbfc4c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 3, 2019 at 1:40 AM Olof K=
indgren &lt;<a href=3D"mailto:olof.kindgren@gmail.com">olof.kindgren@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 1:04 AM Sta=
fford Horne &lt;<a href=3D"mailto:shorne@gmail.com" target=3D"_blank">shorn=
e@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 1, 2019, 9:22 PM Nancy Ch=
auhan &lt;<a href=3D"mailto:nancychn1@gmail.com" target=3D"_blank">nancychn=
1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hello all, <br><br>This mail is to summarize th=
e plan for Coding phase 2 of GSoC 2019. I will be working to Create CI for =
<a href=3D"http://www.clifford.at/yosys/" rel=3D"noreferrer" target=3D"_bla=
nk">Yosys synthesis </a>required for monitoring resource usages in <a href=
=3D"https://github.com/Nancy-Chauhan/mor1kx" rel=3D"noreferrer" target=3D"_=
blank">mor1kx</a> and also might further extend CI for Ysoys synthesis if p=
ossible for place and route ( <a href=3D"https://github.com/YosysHQ/arachne=
-pnr" rel=3D"noreferrer" target=3D"_blank">https://github.com/YosysHQ/arach=
ne-pnr </a>). </div></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Probably we want nextpnr here.=C2=A0</div><div dir=3D"auto"=
><a href=3D"https://github.com/YosysHQ/nextpnr" target=3D"_blank">https://g=
ithub.com/YosysHQ/nextpnr</a></div></div></blockquote></div></div></blockqu=
ote>Hi,=C2=A0<div><br></div><div>As far as I have seen=C2=A0<a href=3D"http=
s://github.com/olofk/serv/blob/master/serv.core">https://github.com/olofk/s=
erv/blob/master/serv.core</a>,=C2=A0<a href=3D"https://github.com/olofk/ser=
v/blob/master/servant.core">https://github.com/olofk/serv/blob/master/serva=
nt.core</a>=C2=A0<i>example project using fusesoc and yosys</i>, I realized=
 we might have to do changes in mor1kx.core=C2=A0<a href=3D"https://github.=
com/openrisc/mor1kx/blob/master/mor1kx.core#L79">https://github.com/openris=
c/mor1kx/blob/master/mor1kx.core#L79</a></div><div>and may also have to inc=
lude target boards the repository. Can you further clarify on this and guid=
e me further.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>I tried to =
do my part here and just pushed an edalize patch to only run synthesis in t=
he icestorm backend by setting pnr to none.</div><div><br></div><div>Tested=
 it on my serv CPU with fusesoc run --target=3Dtinyfpga_bx servant --pnr=3D=
none</div></div></div></blockquote><div>=C2=A0</div><div>And also we can tr=
y this first.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hope this helps=
</div><div><br></div><div>//Olof<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">The plan will be reached to work even on Creating CI =
for OpenOCD/GDB =C2=A0for CPU pipeline debugging in mor1kx =C2=A0and extend=
ing Jenkinsfile (<a href=3D"https://github.com/openrisc/mor1kx/pull/84" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openrisc/mor1kx/pull/8=
4</a>=C2=A0) in mor1kx to make Ysoys and OpenOCD/GDB part of the build pipe=
line. It can be added to<a href=3D"http://ci.librecores.org" rel=3D"norefer=
rer" target=3D"_blank"> ci.librecores.org</a> so that Pull request builder =
runs for the repository mor1kx .=C2=A0<div>We can later =C2=A0Detach reusab=
le logic of mor1kx to <a href=3D"https://github.com/librecores/librecores-p=
ipeline-lib" rel=3D"noreferrer" target=3D"_blank">https://github.com/librec=
ores/librecores-pipeline-lib </a>.<br><div><br></div><div>The question I ha=
ve is whether should we keep all these new additions in current Travis flow=
 ( <a href=3D"https://github.com/openrisc/mor1kx/blob/master/.travis.yml" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/openrisc/mor1kx/blob=
/master/.travis.yml </a>) also ?<br></div><div><br></div><div></div></div><=
/div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I think we can replace Travis when=C2=A0</div><div dir=3D"auto">=C2=A0 1. =
We have a new build status badge for Jenkins in the readme.</div><div dir=
=3D"auto">=C2=A0 2. Jenkins is integrated and performs all of the same chec=
ks for pull requests.</div><div dir=3D"auto">=C2=A0 3. (Nice to have) Jenki=
ns can be as fast/faster than Travis i.e. finish within 5 minutes</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><br>=
</div><div>Thank you ,<br></div><div>Nancy Chauhan</div></div><div><br></di=
v><div>Chats on :=C2=A0<a href=3D"https://gitter.im/librecores/librecores-c=
i" rel=3D"noreferrer" target=3D"_blank">https://gitter.im/librecores/librec=
ores-ci</a>=C2=A0<br></div></div>
</blockquote></div></div></div>
_______________________________________________<br>
OpenRISC mailing list<br>
<a href=3D"mailto:OpenRISC@lists.librecores.org" target=3D"_blank">OpenRISC=
@lists.librecores.org</a><br>
<a href=3D"https://lists.librecores.org/listinfo/openrisc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.librecores.org/listinfo/openrisc</a><br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000ffeb4e058cbfc4c6--

--===============5871586081869907652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============5871586081869907652==--
