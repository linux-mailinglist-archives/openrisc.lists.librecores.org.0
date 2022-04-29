Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 170795140D4
	for <lists+openrisc@lfdr.de>; Fri, 29 Apr 2022 05:15:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BA726211B2;
	Fri, 29 Apr 2022 05:14:59 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mail.librecores.org (Postfix) with ESMTPS id 59CAB24165
 for <openrisc@lists.librecores.org>; Fri, 29 Apr 2022 05:14:58 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id i186so6379231vsc.9
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KVB3IUdRwoTjUZfzDuSB4Hcc/XummifZZAQbe1VnIkA=;
 b=I68ka3LQHE5A/Mtnc3Ul7FGxAI0T9mt0UweEI+Ki8aSmOqKNmV+moyaLGit1X91+1G
 mBB960bLCINXoNlQMHTcbiXui5wVlxo87x9aPajFp3fMneVH+urZEPCP0Lv0PNcpWmIF
 5gSZBqt/2iGw+rWGLAHxBYNcLVXhJa6qGHsRMB39YkDRiUwid4AKCHVd9l7ksIRATaKe
 4K/wnQlGiN+4hQlOqo9ZaLKWJYOeWCAaMk7GNLCF7pSnsFtLCxHKmSKRa00umYDVi+B9
 xgUowttehjRql2tCIf5h9M1NG/4rwfkyyAc7KTRb6Mu1NN9xVTdQtXR7m+MYUsSx2P4+
 5BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KVB3IUdRwoTjUZfzDuSB4Hcc/XummifZZAQbe1VnIkA=;
 b=3ZH5rnKw7ljZgwa2zc2Qz1DLld8oxkmCGWYkqg7xywdQU1ub5PzQLpfuP9lkJ3MvHG
 fUaSgwElvMoiyAh9vpA2TyOBwGrqIRpDsgVtCkpDDqWfw8OYr7XTzTmP6x/BcI5eCvnE
 1dVZ6Vcoo/NN0irW50TzpeT4e5ft3cfL3gGa0AOfiLEycKf81/JcccHJNoO7tVaa1RWH
 spTi7ffK44euf8tLvear3hv+10T7BZF2mdRBkP9pY1blYrjTkXh0Dc5iRkKn8uVkbciA
 J+XsaR3l6y3gphV/vC97y7VR4ds5e5jG1bDxE8ghSk/hNNPS3SneJCkTFAgBH4o52V/J
 VE5A==
X-Gm-Message-State: AOAM532Y/HdXihx0uKDeGAy/FrN1lz9PGMsf2ops1YTURsInYpNHLTxJ
 ko6/MC7OdOyPhNQi7ESnoSBjOGmFgg686KWEcoI=
X-Google-Smtp-Source: ABdhPJwbLFs5wISjA7jvvTRf5c31kGPE7hnA5edUiCWi+ieRDhz7TcH8eWcc7MmB2HwhhO7hxEwx5Sn8n+UbsChi4TY=
X-Received: by 2002:a05:6102:dcf:b0:32c:eb35:ef15 with SMTP id
 e15-20020a0561020dcf00b0032ceb35ef15mr5792173vst.57.1651202097311; Thu, 28
 Apr 2022 20:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9ooFW5unm1AOWU5738_GHkYqVZ0whEgfKn6RH6k=SCm5g@mail.gmail.com>
 <20220428201950.6emdw5i2fvyktt2i@nitro.local>
In-Reply-To: <20220428201950.6emdw5i2fvyktt2i@nitro.local>
From: Stafford Horne <shorne@gmail.com>
Date: Fri, 29 Apr 2022 12:14:40 +0900
Message-ID: <CAAfxs75mxjefcTi5ficG0YvDr1THkPGG6aOxX0oor6WWTUngxA@mail.gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [OpenRISC] Add openrisc@lists.librecores.org to lore.kernel.org
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Philipp Wagner <philipp.wagner@gmail.com>,
 Stefan Wallentowitz <stefan.wallentowitz@gmail.com>
Content-Type: multipart/mixed; boundary="===============1904292378752085665=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============1904292378752085665==
Content-Type: multipart/alternative; boundary="0000000000007674d705ddc27235"

--0000000000007674d705ddc27235
Content-Type: text/plain; charset="UTF-8"

+cc Stefan and Philpp,




On Fri, Apr 29, 2022, 5:19 AM Konstantin Ryabitsev <
konstantin@linuxfoundation.org> wrote:

> On Thu, Apr 28, 2022 at 01:15:09PM +0200, Jason A. Donenfeld wrote:
> > Hi folks,
> >
> > Any interest in getting this mailing list up on lore.kernel.org? This
> > would make sense since it's the mailing list specified in the Linux
> > MAINTAINERS file for OpenRISC development. It'd require the list
> > administrator to send the current list archives to Konstantin and then
> > add some archiver as a subscriber. Given this is a fairly normal
> > mailman list, that doesn't seem too hard.
>
> We can add it, but it would be great if the list can be made DKIM-compliant
> first:
>
> 1. turn off subject modification, if possible
> 2. remove body modification, if present (mailman list footers, etc)
>
> This way any messages sent to this list and to any other lists are properly
> deduplicated.
>

I think it's a good idea, I am not an admin at librecores.  Can you guys
help out?

-stafford

>

--0000000000007674d705ddc27235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">+cc Stefan and Philpp,<div dir=3D"auto"><br></div><div di=
r=3D"auto"><br></div><br><br><div class=3D"gmail_quote" dir=3D"auto"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29, 2022, 5:19 AM Konstantin Ry=
abitsev &lt;<a href=3D"mailto:konstantin@linuxfoundation.org">konstantin@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Thu, Apr 28, 2022 at 01:15:09PM +0200, Jason A. Donenfeld wrote:<br>
&gt; Hi folks,<br>
&gt; <br>
&gt; Any interest in getting this mailing list up on <a href=3D"http://lore=
.kernel.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lore.kernel.or=
g</a>? This<br>
&gt; would make sense since it&#39;s the mailing list specified in the Linu=
x<br>
&gt; MAINTAINERS file for OpenRISC development. It&#39;d require the list<b=
r>
&gt; administrator to send the current list archives to Konstantin and then=
<br>
&gt; add some archiver as a subscriber. Given this is a fairly normal<br>
&gt; mailman list, that doesn&#39;t seem too hard.<br>
<br>
We can add it, but it would be great if the list can be made DKIM-compliant=
<br>
first:<br>
<br>
1. turn off subject modification, if possible<br>
2. remove body modification, if present (mailman list footers, etc)<br>
<br>
This way any messages sent to this list and to any other lists are properly=
<br>
deduplicated.<br></blockquote></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div dir=3D"auto">I think it&#39;s a good idea, I am not an admin at=
 librecores.=C2=A0 Can you guys help out?</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">-stafford</div></div><div class=3D"gmail_quote" dir=3D"au=
to"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"></blockquote></div></div>

--0000000000007674d705ddc27235--

--===============1904292378752085665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1904292378752085665==--
