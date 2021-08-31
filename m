Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E48FF3FCAD6
	for <lists+openrisc@lfdr.de>; Tue, 31 Aug 2021 17:30:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8D59924078;
	Tue, 31 Aug 2021 17:30:05 +0200 (CEST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mail.librecores.org (Postfix) with ESMTPS id 6184E22C28
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 17:30:03 +0200 (CEST)
Received: by mail-qk1-f173.google.com with SMTP id b64so20168375qkg.0
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 08:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:subject:reply-to:to:cc:date:in-reply-to:references
 :user-agent:mime-version;
 bh=DffPLqA8ACyGoHGuIYVQKbGUhAA+EdYP/scuZYXtkRU=;
 b=u5/I0jqqcikL9OzGra9pX/Bzpq15gsZl0HaigbVB2cYz8r3MH6MUi8ueQVRMc7QF0s
 ZF1IoeLAt/AQRwKSuUapXEPK0ap2hC8k4he+fxvxss8spIsEUOmU/wKCkPwmODipQMmh
 jpfTU5fiNhAI8aebDxvxvbCZNqmO4JlmsA46lTjehdP+FuFZVsQHPYno4+Xgy813N3Kn
 1B3HQZ55dOoKpr9LYEvwwJQVadsRiQ3XVrw+doTNHMPWrUHr4zxpgiL5/vfrgF5TjXN1
 nwTGc5osPVP5tsbqvgbC+SmVlUlU1eaM4pzM/IgkB32z9azeMu/TOAD1t7yewRkg8xCz
 5/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:subject:reply-to:to:cc:date
 :in-reply-to:references:user-agent:mime-version;
 bh=DffPLqA8ACyGoHGuIYVQKbGUhAA+EdYP/scuZYXtkRU=;
 b=M+ekMj4iqz2zra9ywIJWbh6t1lyISXVNgSxqtAPE8/MNu282uOojVVgj6yWtBgwlGh
 EZaTSxMh3BF1HgwUbPWvrsfteuZHjI83OaEdj5GJynziNr0ZcMIz7Aco8LtLE6VS6fJR
 hNxm7+TRCrYt7gEbIs7s7CimYSvVLuqB7PwNuDhJ0VGEd1Do2fiTn0AGSKxY/U0tovRQ
 dCrxb/pDB4ecfUiazRps4EtAwTrnB4B/KnIM9RJ1j2vNXUNiXIMSsAiQL6gLpJEOfjgd
 l7wOTf20uKrwSQHGc41eT9sdnkYWynUOJZmy87nLzI0T6Moh4gAPwkJi16ANiRnNqs0K
 fBwA==
X-Gm-Message-State: AOAM531EjbQQ9Uao9XZSI4JhTehzxqWa8qtzW2VVrOE1GZNa9CjwGQ9y
 IhuIMzRB1WJ259U9drHA+Z9swa8qNnQ=
X-Google-Smtp-Source: ABdhPJzuNGzYeDyaZmd9QZCqWf568aLcKy0lvGL6hWB8cnlZWsId2tLzMvmALruNDY/jDV/9lQEFcg==
X-Received: by 2002:a37:c94:: with SMTP id 142mr3657954qkm.78.1630423802219;
 Tue, 31 Aug 2021 08:30:02 -0700 (PDT)
Received: from joshua (c-73-99-155-72.hsd1.va.comcast.net. [73.99.155.72])
 by smtp.gmail.com with ESMTPSA id z6sm13901630qke.24.2021.08.31.08.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 08:30:01 -0700 (PDT)
From: Dan <dan.gisselquist@gmail.com>
X-Google-Original-From: Dan <dgisselq@ieee.org>
Message-ID: <3353f448aa67d1d6bf61eaa37256c90d1377bb74.camel@ieee.org>
To: Harshitha S <harshithasridhar172000@gmail.com>
Date: Tue, 31 Aug 2021 11:30:00 -0400
In-Reply-To: <CAAfxs769RLG-qTuezZYiv+Pze-sqxRAokw6pT3ecYrpn8Len4g@mail.gmail.com>
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
 <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
 <CAAfxs769RLG-qTuezZYiv+Pze-sqxRAokw6pT3ecYrpn8Len4g@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Reply-To: dgisselq@ieee.org
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============5749065444304968658=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


--===============5749065444304968658==
Content-Type: multipart/alternative; boundary="=-+S8yBm55l8z/2+8BnrRg"


--=-+S8yBm55l8z/2+8BnrRg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Harshita,
I would recommend replacing the "chparam" commands in your SBY files
with "hierarchy" commands.  "chparam" forces the synthesis tool to re-
read the design each time the command is issued, and may lead to
changes that are inconsistent along the way.  "hierarchy" has a "-
chparam" option that can be used to re-read the design once, setting
all of the parameters in the design to a consistent usage.
Dan
On Tue, 2021-08-31 at 22:47 +0900, Stafford Horne wrote:
> The commit looks good, can you make a PR for it?
> On Sun, Aug 29, 2021 at 2:16 AM Harshitha S
> <harshithasridhar172000@gmail.com> wrote:
> > Hello Stafford,
> > I want to start with a simple one. I have updated the Mor1kx Formal
> > in the readme.Let me know if anything else to be included.
> > https://github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce74fe65b2f3a7ced7a22d
> > 
> > I will try fixing the bugs and also work on or1kx-formal.
> > Meanwhile, I'm thinking of exploring OpenOCD/GDBfor mor1kx CPU
> > debugging but having no idea where to start. Can you guide me
> > beginning with CPU debugging?
> > -Harshitha
> > On Fri, Aug 27, 2021 at 5:11 AM Stafford Horne <shorne@gmail.com>
> > wrote:
> > > On Thu, Aug 26, 2021 at 10:17:17PM +0530, Harshitha S wrote:
> > > > Hello,
> > > > I'm thinking of continuing my contribution to the OpenRISC
> > > > project. With myGSoC project, I have learned too many new
> > > > skills and wish to keep thislearning pace. I would be happy to
> > > > learn and explore new skills. Please letme know what I can work
> > > > upon.
> > > 
> > > Hi Harshita,
> > > (CCing list)
> > > Glad to hear you are still interested.  I think there are always
> > > plenty ofthings, some things on the top of my head:  - Simple -
> > > update the mor1kx/readme.md to explain we support formal  -
> > > Medium - fix the bugs that you raised  - Bigger - or1k-formal
> > > (like riscv-formal, formally verify each instruction)
> > > -Stafford
> _______________________________________________OpenRISC mailing 
> listOpenRISC@lists.librecores.org
> https://lists.librecores.org/listinfo/openrisc

--=-+S8yBm55l8z/2+8BnrRg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Harshita,</div><div><br></div><div>I would recommend replacing the=
 "chparam" commands in your SBY files with "hierarchy" commands. &nbsp;"chp=
aram" forces the synthesis tool to re-read the design each time the command=
 is issued, and may lead to changes that are inconsistent along the way. &n=
bsp;"hierarchy" has a "-chparam" option that can be used to re-read the des=
ign once, setting all of the parameters in the design to a consistent usage=
.</div><div><br></div><div>Dan</div><div><br></div><div>On Tue, 2021-08-31 =
at 22:47 +0900, Stafford Horne wrote:</div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
>The commit looks good, can you make a PR for it?</pre><pre><br></pre><pre>=
On Sun, Aug 29, 2021 at 2:16 AM Harshitha S</pre><pre><br></pre><pre>&lt;</=
pre><a href=3D"mailto:harshithasridhar172000@gmail.com"><pre>harshithasridh=
ar172000@gmail.com</pre></a><pre>&gt; wrote:</pre><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><pre><br></pre><pre>Hello Stafford,</pre><pre><br></pre><pre>I want to st=
art with a simple one. I have updated the Mor1kx Formal in the readme.</pre=
><pre>Let me know if anything else to be included.</pre><a href=3D"https://=
github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd4b467ce74fe65b2f3a7ce=
d7a22d"><pre>https://github.com/Harshitha172000/mor1kx/commit/e192b83ce01cd=
4b467ce74fe65b2f3a7ced7a22d</pre></a><pre><br></pre><pre><br></pre><pre>I w=
ill try fixing the bugs and also work on or1kx-formal. Meanwhile, I'm think=
ing of exploring OpenOCD/GDB</pre><pre>for mor1kx CPU debugging but having =
no idea where to start. Can you guide me beginning with CPU debugging?</pre=
><pre><br></pre><pre>-Harshitha</pre><pre><br></pre><pre>On Fri, Aug 27, 20=
21 at 5:11 AM Stafford Horne &lt;</pre><a href=3D"mailto:shorne@gmail.com">=
<pre>shorne@gmail.com</pre></a><pre>&gt; wrote:</pre><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><pre><br></pre><pre>On Thu, Aug 26, 2021 at 10:17:17PM +0530, Harshith=
a S wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; borde=
r-left:2px #729fcf solid;padding-left:1ex"><pre>Hello,</pre><pre><br></pre>=
<pre>I'm thinking of continuing my contribution to the OpenRISC project. Wi=
th my</pre><pre>GSoC project, I have learned too many new skills and wish t=
o keep this</pre><pre>learning pace. I would be happy to learn and explore =
new skills. Please let</pre><pre>me know what I can work upon.</pre></block=
quote><pre><br></pre><pre>Hi Harshita,</pre><pre><br></pre><pre>(CCing list=
)</pre><pre><br></pre><pre>Glad to hear you are still interested.  I think =
there are always plenty of</pre><pre>things, some things on the top of my h=
ead:</pre><pre>  - Simple - update the mor1kx/readme.md to explain we suppo=
rt formal</pre><pre>  - Medium - fix the bugs that you raised</pre><pre>  -=
 Bigger - or1k-formal (like riscv-formal, formally verify each instruction)=
</pre><pre><br></pre><pre>-Stafford</pre></blockquote></blockquote><pre>___=
____________________________________________</pre><pre>OpenRISC mailing lis=
t</pre><a href=3D"mailto:OpenRISC@lists.librecores.org"><pre>OpenRISC@lists=
.librecores.org</pre></a><pre><br></pre><a href=3D"https://lists.librecores=
.org/listinfo/openrisc"><pre>https://lists.librecores.org/listinfo/openrisc=
</pre></a><pre><br></pre></blockquote></body></html>

--=-+S8yBm55l8z/2+8BnrRg--


--===============5749065444304968658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============5749065444304968658==--

