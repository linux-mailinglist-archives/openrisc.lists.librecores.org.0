Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 509B75D741
	for <lists+openrisc@lfdr.de>; Tue,  2 Jul 2019 22:10:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3B94320156;
	Tue,  2 Jul 2019 22:10:16 +0200 (CEST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mail.librecores.org (Postfix) with ESMTPS id DEF7020101;
 Tue,  2 Jul 2019 22:10:13 +0200 (CEST)
Received: by mail-qk1-f170.google.com with SMTP id r6so15477475qkc.0;
 Tue, 02 Jul 2019 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xi7vmpHMq0FqHkrtCRv6Rd2eRaB2t13lO1JqdvgvF40=;
 b=GHstp36kiG1iWC/qFX7PXdRwwDBTKdmlmW7h8MjQFWpkHhN1OxAWqJDskFPEg2Cigo
 quaUMIaaHdMPZlJYJSp0AkfdtO/HuYpPsV2RGwjYHkMe/sl4dXrWRi5vuMPZHsAXeqP0
 YmfhmDWjHeJXRepCoSft/XcwWHQ3gbRMH32REDyI7L/d/AwOfJXLcrf0gOCecEYoHWVo
 xvrlZWlTseT1gTFT6jpCqyrnlQjvj9R245g2UcHtcvfmUxYJXG35ZlvNaNJ4y0nqmjSb
 CA9cSh6P4v0e/UysA/5EmTiwC51v0kBxGTQYBphZP3VwCmQZ9ibGY9D1royVGFNQce+j
 nIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xi7vmpHMq0FqHkrtCRv6Rd2eRaB2t13lO1JqdvgvF40=;
 b=W2Tf7DA+I/VBLShqtXrfmWD2hTnADSIwpRUpqZW6Bu30lTRRSpvOShktOqMytE9sXi
 I7+IJ4/jyCWY/7cFmC3hXFVaznla3A2XQADY2Jx/Pzkkvgj+9BnMNjKvdFQdnX0k5Kf9
 UeHkk3REKyL4gr+xRpFrahP4ypuxZBun4lzIlEF2lKl+w2DO361bHQoPzXamxrFUbg1J
 rW1tOtZj0ly3vRy+Rm7tToUqUNsuJykd4gElQcPqjDEJoVGTWzb+s987ZH2bHAUs08Nn
 cYP+6NE1Dg3+dwygt48bDxGeF4SKBV/opNvB7UPGSJUQ/N1logXWbO8MQpJ+RKBRUbW9
 m+lg==
X-Gm-Message-State: APjAAAXeNNpdGK5U298bfl5tgeaLrokzAMyquscH+hpH8HTQFo2VPJ4V
 jz5FGX/mPC3qzxFwOniPHA/+B68L3X62pHtSU5M=
X-Google-Smtp-Source: APXvYqzxzm9m6mXiBPVqalfdujaBcx9cko9SYWkvmgMqNm97QKVyma2yDAOYBtDZEYwpvhl6rvbzizG/AWbMAfZrgT8=
X-Received: by 2002:a05:620a:1034:: with SMTP id
 a20mr8586635qkk.165.1562098212403; 
 Tue, 02 Jul 2019 13:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAF69GoqLtjD3jySOto4Fu3N9PRb1Ji5CyNHK7ScYvv+bOeiYKg@mail.gmail.com>
 <CAAfxs77GYaDHJL-qLmQqTqrpAjvws=8Q52qS7eYyX52NFc9z3g@mail.gmail.com>
In-Reply-To: <CAAfxs77GYaDHJL-qLmQqTqrpAjvws=8Q52qS7eYyX52NFc9z3g@mail.gmail.com>
From: Olof Kindgren <olof.kindgren@gmail.com>
Date: Tue, 2 Jul 2019 22:10:00 +0200
Message-ID: <CAKaYPCPNiGT2m+9cviPFui_Dzbo1QOnQviB0s+foa093rTwGKw@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
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
Cc: Oleg Nenashev <o.v.nenashev@gmail.com>,
 "General discussion around open source silicon."
 <discussion@lists.librecores.org>, Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============6452180649470328647=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============6452180649470328647==
Content-Type: multipart/alternative; boundary="0000000000000dff26058cb8554b"

--0000000000000dff26058cb8554b
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 2, 2019 at 1:04 AM Stafford Horne <shorne@gmail.com> wrote:

> Hello,
>
> On Mon, Jul 1, 2019, 9:22 PM Nancy Chauhan <nancychn1@gmail.com> wrote:
>
>> Hello all,
>>
>> This mail is to summarize the plan for Coding phase 2 of GSoC 2019. I
>> will be working to Create CI for Yosys synthesis
>> <http://www.clifford.at/yosys/>required for monitoring resource usages
>> in mor1kx <https://github.com/Nancy-Chauhan/mor1kx> and also might
>> further extend CI for Ysoys synthesis if possible for place and route ( https://github.com/YosysHQ/arachne-pnr
>> ).
>>
>
> Probably we want nextpnr here.
> https://github.com/YosysHQ/nextpnr
>

I tried to do my part here and just pushed an edalize patch to only run
synthesis in the icestorm backend by setting pnr to none.

Tested it on my serv CPU with fusesoc run --target=tinyfpga_bx servant
--pnr=none

Hope this helps

//Olof


>
>
> The plan will be reached to work even on Creating CI for OpenOCD/GDB  for
>> CPU pipeline debugging in mor1kx  and extending Jenkinsfile (
>> https://github.com/openrisc/mor1kx/pull/84 ) in mor1kx to make Ysoys and
>> OpenOCD/GDB part of the build pipeline. It can be added to
>> ci.librecores.org so that Pull request builder runs for the repository
>> mor1kx .
>> We can later  Detach reusable logic of mor1kx to https://github.com/librecores/librecores-pipeline-lib
>> .
>>
>> The question I have is whether should we keep all these new additions in
>> current Travis flow ( https://github.com/openrisc/mor1kx/blob/master/.travis.yml
>> ) also ?
>>
>>
> I think we can replace Travis when
>   1. We have a new build status badge for Jenkins in the readme.
>   2. Jenkins is integrated and performs all of the same checks for pull
> requests.
>   3. (Nice to have) Jenkins can be as fast/faster than Travis i.e. finish
> within 5 minutes
>
>
>> Thank you ,
>> Nancy Chauhan
>>
>> Chats on : https://gitter.im/librecores/librecores-ci
>>
> _______________________________________________
> OpenRISC mailing list
> OpenRISC@lists.librecores.org
> https://lists.librecores.org/listinfo/openrisc
>

--0000000000000dff26058cb8554b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 1:04 AM Staffo=
rd Horne &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Jul 1, 2019, 9:22 PM Nancy Chauhan &lt;<a href=
=3D"mailto:nancychn1@gmail.com" target=3D"_blank">nancychn1@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">Hello all, <br><br>This mail is to summarize the plan for Coding=
 phase 2 of GSoC 2019. I will be working to Create CI for <a href=3D"http:/=
/www.clifford.at/yosys/" rel=3D"noreferrer" target=3D"_blank">Yosys synthes=
is </a>required for monitoring resource usages in <a href=3D"https://github=
.com/Nancy-Chauhan/mor1kx" rel=3D"noreferrer" target=3D"_blank">mor1kx</a> =
and also might further extend CI for Ysoys synthesis if possible for place =
and route ( <a href=3D"https://github.com/YosysHQ/arachne-pnr" rel=3D"noref=
errer" target=3D"_blank">https://github.com/YosysHQ/arachne-pnr </a>). </di=
v></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Pr=
obably we want nextpnr here.=C2=A0</div><div dir=3D"auto"><a href=3D"https:=
//github.com/YosysHQ/nextpnr" target=3D"_blank">https://github.com/YosysHQ/=
nextpnr</a></div></div></blockquote><div><br></div><div>I tried to do my pa=
rt here and just pushed an edalize patch to only run synthesis in the icest=
orm backend by setting pnr to none.</div><div><br></div><div>Tested it on m=
y serv CPU with fusesoc run --target=3Dtinyfpga_bx servant --pnr=3Dnone</di=
v><div><br></div><div>Hope this helps</div><div><br></div><div>//Olof<br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">The plan will be =
reached to work even on Creating CI for OpenOCD/GDB =C2=A0for CPU pipeline =
debugging in mor1kx =C2=A0and extending Jenkinsfile (<a href=3D"https://git=
hub.com/openrisc/mor1kx/pull/84" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openrisc/mor1kx/pull/84</a>=C2=A0) in mor1kx to make Ysoys an=
d OpenOCD/GDB part of the build pipeline. It can be added to<a href=3D"http=
://ci.librecores.org" rel=3D"noreferrer" target=3D"_blank"> ci.librecores.o=
rg</a> so that Pull request builder runs for the repository mor1kx .=C2=A0<=
div>We can later =C2=A0Detach reusable logic of mor1kx to <a href=3D"https:=
//github.com/librecores/librecores-pipeline-lib" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/librecores/librecores-pipeline-lib </a>.<br>=
<div><br></div><div>The question I have is whether should we keep all these=
 new additions in current Travis flow ( <a href=3D"https://github.com/openr=
isc/mor1kx/blob/master/.travis.yml" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/openrisc/mor1kx/blob/master/.travis.yml </a>) also ?<br></=
div><div><br></div><div></div></div></div></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think we can replace Travis when=C2=
=A0</div><div dir=3D"auto">=C2=A0 1. We have a new build status badge for J=
enkins in the readme.</div><div dir=3D"auto">=C2=A0 2. Jenkins is integrate=
d and performs all of the same checks for pull requests.</div><div dir=3D"a=
uto">=C2=A0 3. (Nice to have) Jenkins can be as fast/faster than Travis i.e=
. finish within 5 minutes</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div><div><br></div><div>Thank you ,<br></div><div>Nan=
cy Chauhan</div></div><div><br></div><div>Chats on :=C2=A0<a href=3D"https:=
//gitter.im/librecores/librecores-ci" rel=3D"noreferrer" target=3D"_blank">=
https://gitter.im/librecores/librecores-ci</a>=C2=A0<br></div></div>
</blockquote></div></div></div>
_______________________________________________<br>
OpenRISC mailing list<br>
<a href=3D"mailto:OpenRISC@lists.librecores.org" target=3D"_blank">OpenRISC=
@lists.librecores.org</a><br>
<a href=3D"https://lists.librecores.org/listinfo/openrisc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.librecores.org/listinfo/openrisc</a><br>
</blockquote></div></div>

--0000000000000dff26058cb8554b--

--===============6452180649470328647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============6452180649470328647==--
