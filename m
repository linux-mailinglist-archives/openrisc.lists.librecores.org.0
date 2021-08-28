Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7DB3FA6EE
	for <lists+openrisc@lfdr.de>; Sat, 28 Aug 2021 19:16:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AC00824129;
	Sat, 28 Aug 2021 19:16:46 +0200 (CEST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by mail.librecores.org (Postfix) with ESMTPS id C422924106
 for <openrisc@lists.librecores.org>; Sat, 28 Aug 2021 19:16:44 +0200 (CEST)
Received: by mail-il1-f171.google.com with SMTP id v2so10738277ilg.12
 for <openrisc@lists.librecores.org>; Sat, 28 Aug 2021 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Fsr0Ni9qSdpeKHq34VUkcxrIUr9mwzjRd4ap6DGIOn0=;
 b=p520GaH7y7EeKlCogcROwa3CRVVve+jJ+LCVmbIl58WXoDuLtsVc3J4fmiFrGBcEJL
 mV/w3+EW3vAadNkzfzVdKuxth+nqaxHvl+cSo5/UVZSGF7+QLQuCl6IzsIMYNx4Miy+5
 kD6S6vdX/Fr7QCB6ZiYtb/hRYFJjrZyi38y5kWXhv2X0dAugZPQlxI2ODVtzFxTCnriK
 AZlfjpEiW6KCn1UA1TvD0F5MhQxOlyobRu2N7zoSlsOXEMgPbDYz0P+dRAg5B6qNw5Ii
 KmpDMbkBKH5qRXgTI+fHhZWQvNi9eVPPsP5/Zglhxos59zOeinytUR+BGHiEUg2tWcL4
 xGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Fsr0Ni9qSdpeKHq34VUkcxrIUr9mwzjRd4ap6DGIOn0=;
 b=taxUS+CJOjEVS6BiCP3QYyKBRYRIlBpDefCsxnhFS14QoYM6DLM8H26kYq5EaVL7M5
 p1Whgvc1joYLkuMATOKz5GSAlE2sld5mKPiQ7T7LlQRiiyuTyeS6FIK7vmgeRony0AwM
 5kVXV56EFu07mPmgRDSUCnEmKpBD35PtNlGt1XFpf37dZejv9C8HcPhbS3rKs0zR38Pm
 /PGk5bVzaagLJV9Ej96SNuqoTQQOkZIAE457O2xfbPQo9mY3HNLCr1jV5mt5uBj66EpH
 f91AInR56dGkeA6461MoBF+J9Uv92uGT8wDSxly0pijSmxm072/us/EAVr56IdsHxPW8
 zzWQ==
X-Gm-Message-State: AOAM530a/6Aobvvs1aThPEym1i/gAOJIHencA+K0XrME9eIr/sHFF0wQ
 CTH9nIuSwaWSPju2SFg0Prj5dNX4rVm/MfG7JEY=
X-Google-Smtp-Source: ABdhPJz5wJc9YRnGKAh9WQ3z32N3KqVa6sDCVk9dFGyoPN3pyvrK3U10Dxz/mkWoyMcVPxPI0Q3UffdDnQbVA3yBChQ=
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id
 h30mr10645870ila.195.1630171003530; 
 Sat, 28 Aug 2021 10:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
In-Reply-To: <YSgmu/bnzRnI7AGI@antec>
From: Harshitha S <harshithasridhar172000@gmail.com>
Date: Sat, 28 Aug 2021 22:47:42 +0530
Message-ID: <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>, Openrisc <openrisc@lists.librecores.org>
Subject: Re: [OpenRISC] Continue OpenRISC contibution
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
Content-Type: multipart/mixed; boundary="===============0086407885503659515=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============0086407885503659515==
Content-Type: multipart/alternative; boundary="00000000000096b28705caa1c322"

--00000000000096b28705caa1c322
Content-Type: text/plain; charset="UTF-8"

Hello Stafford,

I want to start with a simple one. I have updated the Mor1kx Formal in the
readme.
Let me know if anything else to be included.
https://github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce74fe65b2f3a7ced7a22d

I will try fixing the bugs and also work on or1kx-formal. Meanwhile, I'm
thinking of exploring OpenOCD/GDB
for mor1kx CPU debugging but having no idea where to start. Can you guide
me beginning with CPU debugging?

-Harshitha

On Fri, Aug 27, 2021 at 5:11 AM Stafford Horne <shorne@gmail.com> wrote:

> On Thu, Aug 26, 2021 at 10:17:17PM +0530, Harshitha S wrote:
> > Hello,
> >
> > I'm thinking of continuing my contribution to the OpenRISC project. With
> my
> > GSoC project, I have learned too many new skills and wish to keep this
> > learning pace. I would be happy to learn and explore new skills. Please
> let
> > me know what I can work upon.
>
> Hi Harshita,
>
> (CCing list)
>
> Glad to hear you are still interested.  I think there are always plenty of
> things, some things on the top of my head:
>   - Simple - update the mor1kx/readme.md to explain we support formal
>   - Medium - fix the bugs that you raised
>   - Bigger - or1k-formal (like riscv-formal, formally verify each
> instruction)
>
> -Stafford
>

--00000000000096b28705caa1c322
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Stafford,<br><div><br></div><div>I want to start wit=
h a simple one. I have updated the Mor1kx Formal in the readme.</div><div>L=
et me know if anything else to be included.</div><div><a href=3D"https://gi=
thub.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce74fe65b2f3a7ced7=
a22d">https://github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce=
74fe65b2f3a7ced7a22d</a><br></div><div><br></div><div>I will try fixing the=
 bugs and also work on or1kx-formal.=C2=A0Meanwhile, I&#39;m thinking of ex=
ploring=C2=A0OpenOCD/GDB</div><div>for mor1kx CPU debugging but having no i=
dea where to start. Can you guide me beginning with CPU debugging?</div><di=
v><br></div><div>-Harshitha</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 27, 2021 at 5:11 AM Stafford H=
orne &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 26=
, 2021 at 10:17:17PM +0530, Harshitha S wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;m thinking of continuing my contribution to the OpenRISC project=
. With my<br>
&gt; GSoC project, I have learned too many new skills and wish to keep this=
<br>
&gt; learning pace. I would be happy to learn and explore new skills. Pleas=
e let<br>
&gt; me know what I can work upon.<br>
<br>
Hi Harshita,<br>
<br>
(CCing list)<br>
<br>
Glad to hear you are still interested.=C2=A0 I think there are always plent=
y of<br>
things, some things on the top of my head:<br>
=C2=A0 - Simple - update the mor1kx/readme.md to explain we support formal<=
br>
=C2=A0 - Medium - fix the bugs that you raised<br>
=C2=A0 - Bigger - or1k-formal (like riscv-formal, formally verify each inst=
ruction)<br>
<br>
-Stafford<br>
</blockquote></div>

--00000000000096b28705caa1c322--

--===============0086407885503659515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0086407885503659515==--
