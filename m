Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 504335C5D3
	for <lists+openrisc@lfdr.de>; Tue,  2 Jul 2019 01:04:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F38792033E;
	Tue,  2 Jul 2019 01:04:37 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by mail.librecores.org (Postfix) with ESMTPS id 5462D20337;
 Tue,  2 Jul 2019 01:04:36 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id v129so9957689vsb.11;
 Mon, 01 Jul 2019 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l8gRM50RT/PH7NdBr7Q9Nr3pxqdzd2TX4NCxn18EXCw=;
 b=fzCn6BUFvyFHrwJtSnhd2WNPeXluc+B0+hBvIrBdhFywx5f/UmON6z0cuAe4yxuFhq
 TIO1QSwapWVCd7FW8G3UcGOD06BL5cWcCSZj6/7Y2c05QBS2yUvzQ0J6hpiV5dk/Ne1x
 pVpEScZv9ftJAg0xG5rhOWBAedqUUz3Qe1KcPc/Hsw7XqiFT538zaM/0iWzpg5wIFV+W
 Rs+THDd88HPk6iY9GKG9G0APzVYtitHYNckB9qvm1YqRSoi3Vu6QLUnFFuDsCMYAsW4U
 AtaaEoWDJctO0IM7zRnEOmL/t+Dp5HQCdI3FgVvJGn5hdI1nOdKmLyPx7Pp1RLkkEfpW
 8niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8gRM50RT/PH7NdBr7Q9Nr3pxqdzd2TX4NCxn18EXCw=;
 b=mCPfxwgHi8QJ4TzVHMzkhXC0X5gz0iXVUf2BnOXSJ2P1AuvjkRMI+se31UP22MJcii
 8N4EMkjJw3Po8o0KhQnGaNhdCi0FvdOeZkKO0kAtC45PhckX1mvUOpykv/UnpAKieaK2
 7gRQH7kJCqfZOcJatRy06MDY7Xg7yKe8rBKMX+C65FVgPqUsK5wawFk+THISXxuTOG5A
 ooi1hW8yPsttDl11bc61Xf1g9VykTmV5/jtrpNm524AFNJ1yFn5ACY/2hJJ1dWq2R74j
 yi7YFscjwEsiZlgL3yZ1XDFa+N6ohvb25n3yJiiYUVzHUP3rk9S6/N5QMz4JrJQIN0yc
 yOJA==
X-Gm-Message-State: APjAAAWgG6kvJiMsLh0w1xX4/jonvjdETyf1tBaOroJ6k3xgBH9hAono
 uveNdxVd8K5KjN3OQjuaRTv/lUqBq4jcvIgmHsg=
X-Google-Smtp-Source: APXvYqwSPAyYEpFMfu+Rz3l6bGb6SF+yeaOgzTLvEznjs4bKG6762omc2iZ2lnWqs/E0zBEhgo3D7yRK7amNT5KzkCY=
X-Received: by 2002:a67:e296:: with SMTP id g22mr16609598vsf.174.1562022275074; 
 Mon, 01 Jul 2019 16:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAF69GoqLtjD3jySOto4Fu3N9PRb1Ji5CyNHK7ScYvv+bOeiYKg@mail.gmail.com>
In-Reply-To: <CAF69GoqLtjD3jySOto4Fu3N9PRb1Ji5CyNHK7ScYvv+bOeiYKg@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Tue, 2 Jul 2019 08:04:22 +0900
Message-ID: <CAAfxs77GYaDHJL-qLmQqTqrpAjvws=8Q52qS7eYyX52NFc9z3g@mail.gmail.com>
To: Nancy Chauhan <nancychn1@gmail.com>
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
Cc: discussion@lists.librecores.org, Openrisc <openrisc@lists.librecores.org>,
 Oleg Nenashev <o.v.nenashev@gmail.com>
Content-Type: multipart/mixed; boundary="===============9207616287701567015=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============9207616287701567015==
Content-Type: multipart/alternative; boundary="000000000000d64e2f058ca6a681"

--000000000000d64e2f058ca6a681
Content-Type: text/plain; charset="UTF-8"

Hello,

On Mon, Jul 1, 2019, 9:22 PM Nancy Chauhan <nancychn1@gmail.com> wrote:

> Hello all,
>
> This mail is to summarize the plan for Coding phase 2 of GSoC 2019. I will
> be working to Create CI for Yosys synthesis
> <http://www.clifford.at/yosys/>required for monitoring resource usages in
> mor1kx <https://github.com/Nancy-Chauhan/mor1kx> and also might further
> extend CI for Ysoys synthesis if possible for place and route ( https://github.com/YosysHQ/arachne-pnr
> ).
>

Probably we want nextpnr here.
https://github.com/YosysHQ/nextpnr


The plan will be reached to work even on Creating CI for OpenOCD/GDB  for
> CPU pipeline debugging in mor1kx  and extending Jenkinsfile (
> https://github.com/openrisc/mor1kx/pull/84 ) in mor1kx to make Ysoys and
> OpenOCD/GDB part of the build pipeline. It can be added to
> ci.librecores.org so that Pull request builder runs for the repository
> mor1kx .
> We can later  Detach reusable logic of mor1kx to https://github.com/librecores/librecores-pipeline-lib
> .
>
> The question I have is whether should we keep all these new additions in
> current Travis flow ( https://github.com/openrisc/mor1kx/blob/master/.travis.yml
> ) also ?
>
>
I think we can replace Travis when
  1. We have a new build status badge for Jenkins in the readme.
  2. Jenkins is integrated and performs all of the same checks for pull
requests.
  3. (Nice to have) Jenkins can be as fast/faster than Travis i.e. finish
within 5 minutes


> Thank you ,
> Nancy Chauhan
>
> Chats on : https://gitter.im/librecores/librecores-ci
>

--000000000000d64e2f058ca6a681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jul 1, 2019, 9:22 PM Nancy Chauhan &lt;<=
a href=3D"mailto:nancychn1@gmail.com">nancychn1@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello all, <br><br>T=
his mail is to summarize the plan for Coding phase 2 of GSoC 2019. I will b=
e working to Create CI for <a href=3D"http://www.clifford.at/yosys/" target=
=3D"_blank" rel=3D"noreferrer">Yosys synthesis </a>required for monitoring =
resource usages in <a href=3D"https://github.com/Nancy-Chauhan/mor1kx" targ=
et=3D"_blank" rel=3D"noreferrer">mor1kx</a> and also might further extend C=
I for Ysoys synthesis if possible for place and route ( <a href=3D"https://=
github.com/YosysHQ/arachne-pnr" target=3D"_blank" rel=3D"noreferrer">https:=
//github.com/YosysHQ/arachne-pnr </a>). </div></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Probably we want nextpnr here.=C2=
=A0</div><div dir=3D"auto"><a href=3D"https://github.com/YosysHQ/nextpnr">h=
ttps://github.com/YosysHQ/nextpnr</a><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr">The plan will be reached to w=
ork even on Creating CI for OpenOCD/GDB =C2=A0for CPU pipeline debugging in=
 mor1kx =C2=A0and extending Jenkinsfile (<a href=3D"https://github.com/open=
risc/mor1kx/pull/84" target=3D"_blank" rel=3D"noreferrer">https://github.co=
m/openrisc/mor1kx/pull/84</a>=C2=A0) in mor1kx to make Ysoys and OpenOCD/GD=
B part of the build pipeline. It can be added to<a href=3D"http://ci.librec=
ores.org" target=3D"_blank" rel=3D"noreferrer"> ci.librecores.org</a> so th=
at Pull request builder runs for the repository mor1kx .=C2=A0<div>We can l=
ater =C2=A0Detach reusable logic of mor1kx to <a href=3D"https://github.com=
/librecores/librecores-pipeline-lib" target=3D"_blank" rel=3D"noreferrer">h=
ttps://github.com/librecores/librecores-pipeline-lib </a>.<br><div><br></di=
v><div>The question I have is whether should we keep all these new addition=
s in current Travis flow ( <a href=3D"https://github.com/openrisc/mor1kx/bl=
ob/master/.travis.yml" target=3D"_blank" rel=3D"noreferrer">https://github.=
com/openrisc/mor1kx/blob/master/.travis.yml </a>) also ?<br></div><div><br>=
</div><div></div></div></div></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I think we can replace Travis when=C2=A0</div><div=
 dir=3D"auto">=C2=A0 1. We have a new build status badge for Jenkins in the=
 readme.</div><div dir=3D"auto">=C2=A0 2. Jenkins is integrated and perform=
s all of the same checks for pull requests.</div><div dir=3D"auto">=C2=A0 3=
. (Nice to have) Jenkins can be as fast/faster than Travis i.e. finish with=
in 5 minutes</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>=
<br></div><div>Thank you ,<br></div><div>Nancy Chauhan</div></div><div><br>=
</div><div>Chats on :=C2=A0<a href=3D"https://gitter.im/librecores/librecor=
es-ci" target=3D"_blank" rel=3D"noreferrer">https://gitter.im/librecores/li=
brecores-ci</a>=C2=A0<br></div></div>
</blockquote></div></div></div>

--000000000000d64e2f058ca6a681--

--===============9207616287701567015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============9207616287701567015==--
