Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E822E3FC945
	for <lists+openrisc@lfdr.de>; Tue, 31 Aug 2021 16:02:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8C99324135;
	Tue, 31 Aug 2021 16:02:17 +0200 (CEST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mail.librecores.org (Postfix) with ESMTPS id 400A624003
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 16:02:16 +0200 (CEST)
Received: by mail-io1-f53.google.com with SMTP id b7so24944029iob.4
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qGKrbvnyD04qpwrtiGDu79/yBS2STYX8BwgalqzFZZk=;
 b=g8z1oed0sp1y7xMZ3IGH/U15nc6+vJ7Wg16GlwuBNnKStJS63RsHsRhRQ1ht2pF2Ib
 IOUADyxBqd+oUvawt9KaLmFTeqVifyln7OcOgjw6viNbYCxOhT2SH/GtCVQjxQyji9dx
 CLPqQl6Qxuff0ulnilazB1W5Mw9Klcg9gMu6/Axim39DvZZ8K32/N16+ewiaRnLrKXZA
 OWH9IFDJhPsnUrydhuyikr2Lwnp6IZrgI26C274uVfcv5FRUqCq5LH6lNzl8UCNXoWM3
 eKxCkzDMBlPf0kPrbmHWCZ2ikAYpr/nufEAJRq3uXRKV8IImpw6qPii+TcArkSx7iek2
 bcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGKrbvnyD04qpwrtiGDu79/yBS2STYX8BwgalqzFZZk=;
 b=YhWQUXUdmMZZbTyyXYqicOKFR6mwW2vZqFSUwSYV3ZV6Woa3dcdKsnbKIGjJ9xSP38
 2Pqb7//D8UyvOi4WTTRZsVKbpQrhUss1OVtjbarkNODs1LIQ/lN4Klc8T8uouHluqLKW
 xbKx28jAZ2hhbdF6WgNYp9uSd0w9suFAaLwBw77XvxbA0pvNUbyrbjaslnKCF7UFszQ1
 DjsYHa0LcDPlyks2qntq47GVEarDvCH6NjeXXi9vgbOChZU++A5mCIxMb1cKoeqY6sza
 qVxNy17cUQN6s8UlnpRxLXs1rEWn9Z5tDeG1aB+ks8PE7AjDBsvIJh7TQ/CNtFRVtk+3
 oaLg==
X-Gm-Message-State: AOAM530W264cFHafvqiRFOAYZK736BgDXqi/V5KPc34fwE0Pxn+jCL71
 INLn8zURCBeCa+3TrO03COS2SVepkYUCe/UFWbE=
X-Google-Smtp-Source: ABdhPJzr+zvAcEnD6c5ZQRQ6RQSKUHkPM4GmxpGtHBSrsXqjTzIs4XdSPjylxx1lgeFfUug+cOpTGEfx+Dzx5LV0k+o=
X-Received: by 2002:a02:c64a:: with SMTP id k10mr2961679jan.112.1630418534876; 
 Tue, 31 Aug 2021 07:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
 <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
 <CAAfxs769RLG-qTuezZYiv+Pze-sqxRAokw6pT3ecYrpn8Len4g@mail.gmail.com>
In-Reply-To: <CAAfxs769RLG-qTuezZYiv+Pze-sqxRAokw6pT3ecYrpn8Len4g@mail.gmail.com>
From: Harshitha S <harshithasridhar172000@gmail.com>
Date: Tue, 31 Aug 2021 19:32:03 +0530
Message-ID: <CADGJwMxnsAq-Az2OcarXzTY0HvYvjBbvwakooFyE0adZkLZidA@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============5606672127071544320=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============5606672127071544320==
Content-Type: multipart/alternative; boundary="0000000000009b4bdb05cadb65a8"

--0000000000009b4bdb05cadb65a8
Content-Type: text/plain; charset="UTF-8"

Yes, will do.

On Tue, 31 Aug, 2021, 7:17 PM Stafford Horne, <shorne@gmail.com> wrote:

> The commit looks good, can you make a PR for it?
>
> On Sun, Aug 29, 2021 at 2:16 AM Harshitha S
>
> <harshithasridhar172000@gmail.com> wrote:
> >
> > Hello Stafford,
> >
> > I want to start with a simple one. I have updated the Mor1kx Formal in
> the readme.
> > Let me know if anything else to be included.
> >
> https://github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce74fe65b2f3a7ced7a22d
> >
> > I will try fixing the bugs and also work on or1kx-formal. Meanwhile, I'm
> thinking of exploring OpenOCD/GDB
> > for mor1kx CPU debugging but having no idea where to start. Can you
> guide me beginning with CPU debugging?
> >
> > -Harshitha
> >
> > On Fri, Aug 27, 2021 at 5:11 AM Stafford Horne <shorne@gmail.com> wrote:
> >>
> >> On Thu, Aug 26, 2021 at 10:17:17PM +0530, Harshitha S wrote:
> >> > Hello,
> >> >
> >> > I'm thinking of continuing my contribution to the OpenRISC project.
> With my
> >> > GSoC project, I have learned too many new skills and wish to keep this
> >> > learning pace. I would be happy to learn and explore new skills.
> Please let
> >> > me know what I can work upon.
> >>
> >> Hi Harshita,
> >>
> >> (CCing list)
> >>
> >> Glad to hear you are still interested.  I think there are always plenty
> of
> >> things, some things on the top of my head:
> >>   - Simple - update the mor1kx/readme.md to explain we support formal
> >>   - Medium - fix the bugs that you raised
> >>   - Bigger - or1k-formal (like riscv-formal, formally verify each
> instruction)
> >>
> >> -Stafford
>

--0000000000009b4bdb05cadb65a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, will do.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, 31 Aug, 2021, 7:17 PM Stafford Horne=
, &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">The commit looks good, can you make =
a PR for it?<br>
<br>
On Sun, Aug 29, 2021 at 2:16 AM Harshitha S<br>
<br>
&lt;<a href=3D"mailto:harshithasridhar172000@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">harshithasridhar172000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Stafford,<br>
&gt;<br>
&gt; I want to start with a simple one. I have updated the Mor1kx Formal in=
 the readme.<br>
&gt; Let me know if anything else to be included.<br>
&gt; <a href=3D"https://github.com/Harshitha172000/mor1kx/commit/e192b83ce0=
1cd4b467ce74fe65b2f3a7ced7a22d" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce7=
4fe65b2f3a7ced7a22d</a><br>
&gt;<br>
&gt; I will try fixing the bugs and also work on or1kx-formal. Meanwhile, I=
&#39;m thinking of exploring OpenOCD/GDB<br>
&gt; for mor1kx CPU debugging but having no idea where to start. Can you gu=
ide me beginning with CPU debugging?<br>
&gt;<br>
&gt; -Harshitha<br>
&gt;<br>
&gt; On Fri, Aug 27, 2021 at 5:11 AM Stafford Horne &lt;<a href=3D"mailto:s=
horne@gmail.com" target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Aug 26, 2021 at 10:17:17PM +0530, Harshitha S wrote:<br>
&gt;&gt; &gt; Hello,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m thinking of continuing my contribution to the OpenRIS=
C project. With my<br>
&gt;&gt; &gt; GSoC project, I have learned too many new skills and wish to =
keep this<br>
&gt;&gt; &gt; learning pace. I would be happy to learn and explore new skil=
ls. Please let<br>
&gt;&gt; &gt; me know what I can work upon.<br>
&gt;&gt;<br>
&gt;&gt; Hi Harshita,<br>
&gt;&gt;<br>
&gt;&gt; (CCing list)<br>
&gt;&gt;<br>
&gt;&gt; Glad to hear you are still interested.=C2=A0 I think there are alw=
ays plenty of<br>
&gt;&gt; things, some things on the top of my head:<br>
&gt;&gt;=C2=A0 =C2=A0- Simple - update the mor1kx/readme.md to explain we s=
upport formal<br>
&gt;&gt;=C2=A0 =C2=A0- Medium - fix the bugs that you raised<br>
&gt;&gt;=C2=A0 =C2=A0- Bigger - or1k-formal (like riscv-formal, formally ve=
rify each instruction)<br>
&gt;&gt;<br>
&gt;&gt; -Stafford<br>
</blockquote></div>

--0000000000009b4bdb05cadb65a8--

--===============5606672127071544320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============5606672127071544320==--
