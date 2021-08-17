Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7743EF621
	for <lists+openrisc@lfdr.de>; Wed, 18 Aug 2021 01:33:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 460282409F;
	Wed, 18 Aug 2021 01:33:47 +0200 (CEST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mail.librecores.org (Postfix) with ESMTPS id 58772213A6
 for <openrisc@lists.librecores.org>; Wed, 18 Aug 2021 01:33:46 +0200 (CEST)
Received: by mail-ej1-f45.google.com with SMTP id gt38so937063ejc.13
 for <openrisc@lists.librecores.org>; Tue, 17 Aug 2021 16:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d7I381UOgt8GnWBy6HNvmhcl9qnbRMlh1/cMmWCN/pI=;
 b=iMdQh34PgXAhvpPN2Fg+edaHbgKOswaPcIejVIAAnDtl+fD3/HAWiwbSpo1zCeD59y
 NMfcZUnChnJlahg5P6LlP91rUR0QfSOPmQ3/J4wGLoowMh2AB12H69QQHnVM9joOJVJw
 1/wLBZ14LaZuuSHijfDEb0fpUWtx29IIiwCDCDo7zk20WtZdlGsYFqljrWT1E1zxZnT9
 E7mjKhiE9tSANzYaKYkbQVlIvqqcPW8xjIcDgyRdxOiI0bw3nAyFgsP8WPNSTNRbnKg+
 NHJcCuXzIaORWs3f1SPxkgJh3UqhL+OAQ2UUDtxnXOPpy62pKQzsdpgEZafTRmjHPmn2
 Eohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d7I381UOgt8GnWBy6HNvmhcl9qnbRMlh1/cMmWCN/pI=;
 b=X9Nxr/mJKgNqKM0IymaophxQL9utI4rlRiOrQJFbvzxGSb8svv9MOBE7HMbL4u1lGn
 z9e4HHDYYzl7SHx/T1hAI/ml/Ndy7mp2LSOGqrJRf5kAgz/3N8PJlDci7FH6OJfwGws4
 sxphF1YkyZt3frE+Jbb3O0HS1KzuwyZ4dZBW1cQN9ObERmKlPiizeip2rZbwoYqjh8pq
 TNLsdSWFQI9Iso75rSr/wEDbN853mRHDRkH+auGWb9YT9KPMHCegXSANGgxiUqgmVbyL
 8h0z8hwNCeGj/HozzlLCEBloDecMDPipLdu6CRZkjUselul3eNS6KI48KyIwOfN0LIi+
 rF+Q==
X-Gm-Message-State: AOAM530/Tu7FtDWJ1RWpf9CftubSU+mql81UVVMIEJzF0AnULBDXjYBY
 ILbKlDZT0pGtZh7B3V2S6UvtMFZbs2uAQT02LK0=
X-Google-Smtp-Source: ABdhPJy4H11CmoUeFIowF9xFtQnNvOTIWDkpOaCUZdO6Xvocggb75g2JWu0x2lFzNWtSoxhAlQVg0MFZrDiQJkVz9y0=
X-Received: by 2002:a17:906:1e42:: with SMTP id
 i2mr6638346ejj.76.1629243225684; 
 Tue, 17 Aug 2021 16:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210806094217.3227877-1-shorne@gmail.com>
 <0f577bc8-bef8-6c06-aaa9-57bf16d8443b@linaro.org>
 <YRhCqNWB1MC++TAO@antec>
 <alpine.DEB.2.22.394.2108161710590.136350@digraph.polyomino.org.uk>
 <YRrenWZeh103h3zX@antec>
 <alpine.DEB.2.22.394.2108162231010.136350@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.22.394.2108162231010.136350@digraph.polyomino.org.uk>
From: Stafford Horne <shorne@gmail.com>
Date: Wed, 18 Aug 2021 08:33:33 +0900
Message-ID: <CAAfxs75zCUbA1Y3tMssvErhADNPYLevw1azdK4RBt+BU7gFP7Q@mail.gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [OpenRISC] [PATCH v2] time: Fix overflow itimer tests on 32-bit
 systems
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: multipart/mixed; boundary="===============4949700504998037684=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4949700504998037684==
Content-Type: multipart/alternative; boundary="000000000000b8417405c9c9bff7"

--000000000000b8417405c9c9bff7
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021, 7:33 AM Joseph Myers <joseph@codesourcery.com> wrote:

> On Tue, 17 Aug 2021, Stafford Horne via Libc-alpha wrote:
>
> > Should we provide __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 for not linux
> builds,
> > or remove __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 from the itimer test
> again?
> > The reason for using __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 is to pick
> up the
> > timeval size which is different on each architecture.
>
> I'd suggest having a macro that doesn't refer to either "kernel" or "old
> timeval" (and that is defined for both Linux and Hurd).  As far as I
> understand, the logical concept that's relevant for this test isn't either
> one of those, it's more like "setitimer supports times that cannot be
> represented in 32 bits".
>

Hello,

That makes sense, currently with the hurd build being broken how urgent is
this?  I worked on reproducing the build issue with build-many but didn't
get it working yet, probably about 80% there before I ran out of time.

I'll try to get it fixed in a few days as my top priority, but I only have
an hour or two a day to look at it. If we need to revert or add a temporary
patch please feel free.

-stafford

>

--000000000000b8417405c9c9bff7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Aug 17, 2021, 7:33 AM Joseph Myers &lt;<a href=
=3D"mailto:joseph@codesourcery.com">joseph@codesourcery.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Tue, 17 Aug 2021, Stafford Horne=
 via Libc-alpha wrote:<br>
<br>
&gt; Should we provide __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 for not linux=
 builds,<br>
&gt; or remove __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 from the itimer test =
again?<br>
&gt; The reason for using __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 is to pick=
 up the<br>
&gt; timeval size which is different on each architecture.<br>
<br>
I&#39;d suggest having a macro that doesn&#39;t refer to either &quot;kerne=
l&quot; or &quot;old <br>
timeval&quot; (and that is defined for both Linux and Hurd).=C2=A0 As far a=
s I <br>
understand, the logical concept that&#39;s relevant for this test isn&#39;t=
 either <br>
one of those, it&#39;s more like &quot;setitimer supports times that cannot=
 be <br>
represented in 32 bits&quot;.<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Hello,</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">That makes sense, currently with the hurd build being broken ho=
w urgent is this?=C2=A0 I worked on reproducing the build issue with build-=
many but didn&#39;t get it working yet, probably about 80% there before I r=
an out of time.=C2=A0=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I&#39;ll try to get it fixed in a few days as my top priority, but I on=
ly have an hour or two a day to look at it. If we need to revert or add a t=
emporary patch please feel free.=C2=A0</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">-stafford</div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000b8417405c9c9bff7--

--===============4949700504998037684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4949700504998037684==--
