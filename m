Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 99BF11AE5F
	for <lists+openrisc@lfdr.de>; Mon, 13 May 2019 01:09:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 456CF28463;
	Mon, 13 May 2019 01:09:32 +0200 (CEST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mail.librecores.org (Postfix) with ESMTPS id A53FF25A94
 for <openrisc@lists.librecores.org>; Mon, 13 May 2019 01:09:30 +0200 (CEST)
Received: by mail-vk1-f171.google.com with SMTP id s80so2843294vke.6
 for <openrisc@lists.librecores.org>; Sun, 12 May 2019 16:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kS55OIF3U8Rh/NfFpnP8itNDZbaop5o+NkBYmqgt5jY=;
 b=Y//Yba9gt+8BnpQwVNrOGBzo2/MQLBWtGexKmdO3xBeX/tObXSlxNgNhhmUEUaD89y
 sjSG5mUdyybxX8cLLU5ExbbuFn0dh+ZlCbc2wZTGuynOnl/gwck8QOTHMak4HnWCccve
 Wc7r8wSUesLCe9yHGRheaT3R2Qn4kRGtTSriGxkHhe6UT9lkx09eEWcc2eeojYu2vQ55
 afcCdrFy37W/NKqRGnp8DX0mxJmQDjOAzYyREun+OcIz3jHHX6+ppo9HWBKIQl++koFs
 vr5OucB4TTcibGK5yb5JV6cwW7MYSae0yK0Lrsbx1M7OiLiiJcc/mFE184vJnkBum/Ts
 PVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kS55OIF3U8Rh/NfFpnP8itNDZbaop5o+NkBYmqgt5jY=;
 b=BLAmgX15jfrfWDJRDi/cK6W8GM3Hvp55QTjlYO72PJMrz152rTGgbyXWRu7kZSu8HI
 S1pf8/kt7E75XVJPMCD4CSMBbigQzOB+NLm5nbNHXCvCfE2j/Mp3Xhn2F+WvwxMwt7z1
 hG3Us8O3+wLXZjMEKbioMOTYBaWnFcMJ/tfJBpsfUI22j8GwxMnshNFUtGj6D1B3CjfL
 GpFrZpZJZGJ9i1cgE2u8V2YKRP5cXA5z7B4tqKtkgdQFFg5Ebq4G8kGF4KaMhCshJJcc
 ZQ41Vd6A7Zyj8YSqO845J4YFiZUaCfwr9ujRNGgf0trL7SSRwuPxVIMxssSnvcnqDuWh
 ysGA==
X-Gm-Message-State: APjAAAWmNDF3qFpQBFncJjI+a7NV/Tw+ke1YUKDhE73tz9RFAhSGexBV
 ZzyDQtWGJf+SqL95cYns2bCGy7M7Yq0VMlm5zJ8=
X-Google-Smtp-Source: APXvYqzFq4FJPahOriKAlEBwdMuFQXNyUh4C1d/qpbVe+WNTSrVsY20tXCrsbqO2Lr6yNcTha11JclO2ZQpqZ2s3v9o=
X-Received: by 2002:a1f:d585:: with SMTP id m127mr10902852vkg.34.1557702569305; 
 Sun, 12 May 2019 16:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
 <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
 <AED0C7019AE04A2F87CD0E432FA20A70@BAndViG>
 <20190511100433.GA20465@lianli.shorne-pla.net>
 <A49361B4A05048AD995FF588CC923E61@BAndViG>
In-Reply-To: <A49361B4A05048AD995FF588CC923E61@BAndViG>
From: Stafford Horne <shorne@gmail.com>
Date: Mon, 13 May 2019 08:09:13 +0900
Message-ID: <CAAfxs76rr-VPbrQPndNm1rTR1KzgO7NrUSixPhNNp9BArM6Ekg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2775804104256426551=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============2775804104256426551==
Content-Type: multipart/alternative; boundary="0000000000004f296a0588b8e415"

--0000000000004f296a0588b8e415
Content-Type: text/plain; charset="UTF-8"

On Mon, May 13, 2019, 4:58 AM BAndViG <bandvig@mail.ru> wrote:

> > From: Stafford Horne
> > Sent: Saturday, May 11, 2019 1:04 PM
>
> > > On Fri, May 10, 2019 at 10:56:05AM +0300, BAndViG wrote:
> > > I've been thinking about a variants for R0 write protection. R0 could
> be
> > > zero initialized at cpu_rst by dedicated circuits. And `invalid
> > > instruction`
> > > exception should be raised if an instruction tries to write to R0. At
> the
> > > same time such behavior is incompatible with current run-time
> > > initialization
> > > sequences implemented in OR1K tool chains. The circle is closed.
>
> > We still have the option to drop the validation.  Just as we don't have
> > validation for writing to r0, I think its fine to say r31's pair
> register is
> > undefined and should be avoided. (i.e. on some machines it might go into
> the
> > shadow reg space)
>
> On the one hand I'm a kind of perfectionist and would prefer to implement
> such
> protections. On the other hand they cost noticeable space and timing. Not
> trivial choice for me :).
>
> > On the other hand, I have finished the GCC updates for unordered
> comparisons.
> > You can see the patch here, I built newlib with this enabled and was
> able to
> > shake out a few bugs.  It seems to work:
>
> >   - https://github.com/stffrdhrn/gcc/commits/or1k-fpu-2
>
> > The new gcc argument is:
>
> >   -munordered-float
>
> I've build two variants of GCC9/NewLIB tool chains. One has got
> "-mhard-float -munordered-float" options raised by default. And another
> one has
> got "-mhard-float -mdouble-float -munordered-float" default options. First
> variant was used to build single precision Whetstone for mor1kx+FPU32 and
> second to build single and double precision Whetstone for MAROCCHINO. All
> variants work.
> We could merge fp_unordered_cmp branches into master. Or should we
> postpone the
> merge till your binutils/gcc patches being upstreamed?
>

I think we can merge.  It will take time to get it all upstream.

Note I started updates to the spec.
- https://github.com/stffrdhrn/doc

Still a lot to do, but if you want to look at how I wrote up the lf sfu*
instructions please let me know what you think

-stafford

--0000000000004f296a0588b8e415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, May 13, 2019, 4:58 AM BAndViG &lt;<a href=3D"m=
ailto:bandvig@mail.ru" target=3D"_blank" rel=3D"noreferrer">bandvig@mail.ru=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; From: Stafford=
 Horne<br>
&gt; Sent: Saturday, May 11, 2019 1:04 PM<br>
<br>
&gt; &gt; On Fri, May 10, 2019 at 10:56:05AM +0300, BAndViG wrote:<br>
&gt; &gt; I&#39;ve been thinking about a variants for R0 write protection. =
R0 could be<br>
&gt; &gt; zero initialized at cpu_rst by dedicated circuits. And `invalid <=
br>
&gt; &gt; instruction`<br>
&gt; &gt; exception should be raised if an instruction tries to write to R0=
. At the<br>
&gt; &gt; same time such behavior is incompatible with current run-time <br=
>
&gt; &gt; initialization<br>
&gt; &gt; sequences implemented in OR1K tool chains. The circle is closed.<=
br>
<br>
&gt; We still have the option to drop the validation.=C2=A0 Just as we don&=
#39;t have<br>
&gt; validation for writing to r0, I think its fine to say r31&#39;s pair r=
egister is<br>
&gt; undefined and should be avoided. (i.e. on some machines it might go in=
to the<br>
&gt; shadow reg space)<br>
<br>
On the one hand I&#39;m a kind of perfectionist and would prefer to impleme=
nt such <br>
protections. On the other hand they cost noticeable space and timing. Not <=
br>
trivial choice for me :).<br>
<br>
&gt; On the other hand, I have finished the GCC updates for unordered compa=
risons.<br>
&gt; You can see the patch here, I built newlib with this enabled and was a=
ble to<br>
&gt; shake out a few bugs.=C2=A0 It seems to work:<br>
<br>
&gt;=C2=A0 =C2=A0- <a href=3D"https://github.com/stffrdhrn/gcc/commits/or1k=
-fpu-2" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
github.com/stffrdhrn/gcc/commits/or1k-fpu-2</a><br>
<br>
&gt; The new gcc argument is:<br>
<br>
&gt;=C2=A0 =C2=A0-munordered-float<br>
<br>
I&#39;ve build two variants of GCC9/NewLIB tool chains. One has got <br>
&quot;-mhard-float -munordered-float&quot; options raised by default. And a=
nother one has <br>
got &quot;-mhard-float -mdouble-float -munordered-float&quot; default optio=
ns. First <br>
variant was used to build single precision Whetstone for mor1kx+FPU32 and <=
br>
second to build single and double precision Whetstone for MAROCCHINO. All <=
br>
variants work.<br>
We could merge fp_unordered_cmp branches into master. Or should we postpone=
 the <br>
merge till your binutils/gcc patches being upstreamed?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think we can merge.=
=C2=A0 It will take time to get it all upstream.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Note I started updates to the spec.</div><div dir=
=3D"auto">-=C2=A0<a href=3D"https://github.com/stffrdhrn/doc">https://githu=
b.com/stffrdhrn/doc</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Still a lot to do, but if you want to look at how I wrote up the lf sfu* in=
structions please let me know what you think</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">-stafford</div></div>

--0000000000004f296a0588b8e415--

--===============2775804104256426551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============2775804104256426551==--
