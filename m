Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E2381391889
	for <lists+openrisc@lfdr.de>; Wed, 26 May 2021 15:07:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8148F235FC;
	Wed, 26 May 2021 15:07:44 +0200 (CEST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mail.librecores.org (Postfix) with ESMTPS id 42575211D8
 for <openrisc@lists.librecores.org>; Wed, 26 May 2021 15:07:43 +0200 (CEST)
Received: by mail-io1-f47.google.com with SMTP id n10so887167ion.8
 for <openrisc@lists.librecores.org>; Wed, 26 May 2021 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ylEDrxGEjXctJiccNmo/+t9MxYpCyRJxlwiADKcZQc=;
 b=flbgiZJIQ8pWCCELedJhKLwmYh65rix1acE+3qrMTVqp0nJDogrVF583/CkRy4IhUq
 69mSb2j3zirteSbVtp2KTnk3uD/zIz4hbT4yKlQOzJrb7ZSBp5gFVwB2+dmF8xH2hErv
 gsRKsr0P8qdxHnh0B9Hk08/er0TLd6DsOMjADuKB2JII2E+TsTwYEEhN6hDob09CRlkd
 cxVu+5OonrcV2wffRsM7zEj6I6JNoYWSXjnR1ks5Yho8DkbxZsOiBcAZi2H+H5l5aurt
 sh9YxXiiU1A5uOaUjEmGJk++ul+Yvix56au2W5qFKNcvJdrl9UYEp5dSsyeHTGUjYZV+
 B3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ylEDrxGEjXctJiccNmo/+t9MxYpCyRJxlwiADKcZQc=;
 b=Gmrs9QTYqRe2Epbw1ds5I+0upURSu3FRhyy+di9kIK9AOXB2LSDVdLdmVmTL92czJX
 BoRHEnWICK8fD2R8sALs0O4yAxuRg+WP8+cIGCK47MKUmUDyiKzdsTs7nDbvB4EHl0yy
 1imJVGmFGXVFrBNxZ7m7dSBpFuFnoGwZFWnYI8dTcKO2HxvqY2/doO5TvDgtv38OJBx/
 6uEhVFSob30s/6FIcbHIg/mTitYybJ5Df7vt2PvWwI3rHrc3oawhStMlsiwLoZO0NPX3
 82BgN3o5s5Z959bdJ+eVXRq6kURzpNcaJAofIXRS335QJXgxRUKjdNbh+d2/5h6GqSHd
 Pezg==
X-Gm-Message-State: AOAM530i1/89QiNDY8RMWgPdSMuSyKM3odC3yWbWfhl+Jb5+PSOtItv0
 rWlAD7fB+lWG22F6NkLNstRwV8cq4/5TIuCmDNA=
X-Google-Smtp-Source: ABdhPJwKG1mIU5iwokVSoJomGug4WTU2vu687MUIDiF8vBBS8XtVavzxqIn0uw8WwtQ9Q9H3IG2ftJKbSP0ExKcPqDk=
X-Received: by 2002:a05:6638:12c5:: with SMTP id
 v5mr3136915jas.11.1622034462087; 
 Wed, 26 May 2021 06:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMzHeO13bW0i7JFGGtJRcUpGcPW+WxNzqKXRDWLLPFv-eA@mail.gmail.com>
 <YK479iP+xMY8Nucx@antec>
In-Reply-To: <YK479iP+xMY8Nucx@antec>
From: Harshitha S <harshithasridhar172000@gmail.com>
Date: Wed, 26 May 2021 18:37:30 +0530
Message-ID: <CADGJwMz8--vehB_4ed3NHLex5jD19zWamqyyfmrYi3XiM3e34g@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] Error found in mor1kx cache lru
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
Cc: Openrisc <openrisc@lists.librecores.org>, stefan@fossi-foundation.org
Content-Type: multipart/mixed; boundary="===============8030255168561135886=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============8030255168561135886==
Content-Type: multipart/alternative; boundary="000000000000ed1b4b05c33b533b"

--000000000000ed1b4b05c33b533b
Content-Type: text/plain; charset="UTF-8"

Sure, I will do that.

On Wed, 26 May, 2021, 5:45 PM Stafford Horne, <shorne@gmail.com> wrote:

> +CC list
>
> Hi Harshita,
>
> Thanks for reporting, could you also open a github issue with the
> same details at:
>
>  https://github.com/openrisc/mor1kx/issues
>
> -Stafford
>
> On Wed, May 26, 2021 at 02:52:11PM +0530, Harshitha S wrote:
>
> >
> >      NUMWAYS = 4
> >      current = 6'b110100;
> >      access  = 4'b0010;
> >
> >     This current history is:
> >
> >       0<1 0<2 0<3 1<2 1<3 2<3
> >       0   0   1   0   1   1
> >
> >      History of access => 3>0>1>2
> >      Access request is for 1, then expected order is 1>3>0>2.
> >      Expected values of lru_post = 1 and lru_pre = 2
> >
> > Initial expand matrix based on current history
> >
> >         0     1      2      3         0 1 2 3
> >    0    1    (0<1)  (0<2)  (0<3)    0 1 0 0 1
> >    1  (1<0)    1    (1<2)  (1<3) => 1 1 1 0 1
> >    2  (2<0)  (2<1)    1    (2<3)    2 1 1 1 1
> >    3  (3<0)  (3<1)  (3<2)    1      3 0 0 0 1
> >
> > lru_pre is AND of bits in a row
> >
> > When request access=4'b0010 then 1st row of expand matrix is
> > replaced with zeros and 1st column of expand matrix is replaced
> > with 1.
> >
> >
> >
> > The matrix changes accordingly
> >
> >          0 1 2 3      0 1 2 3
> >        0 1 0 0 1    0 1 1 0 1
> >        1 1 1 0 1 => 1 0 1 0 0
> >        2 1 1 1 1    2 1 1 1 1
> >        3 0 0 0 1    3 0 1 0 1
> >
> > lru_post is product of bits in a column
> >
> > update = 6'b100101
> >
> > This means updated history is
> >
> >  0<1 0<2 0<3 1<2 1<3 2<3
> >   1   0   1   0   0   1
> >
> > This is what we interpret from output 1>3>0>2 and its same as our
> expectation.
> >
> >
>
>
>
>
>
>

--000000000000ed1b4b05c33b533b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sure, I will do that.=C2=A0</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 26 May, 2021, 5:45 PM =
Stafford Horne, &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+CC list<br>
<br>
Hi Harshita,<br>
<br>
Thanks for reporting, could you also open a github issue with the<br>
same details at:<br>
<br>
=C2=A0<a href=3D"https://github.com/openrisc/mor1kx/issues" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://github.com/openrisc/mor1kx/issues<=
/a><br>
<br>
-Stafford<br>
<br>
On Wed, May 26, 2021 at 02:52:11PM +0530, Harshitha S wrote:<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 NUMWAYS =3D 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 current =3D 6&#39;b110100;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 access=C2=A0 =3D 4&#39;b0010;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0This current history is:<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00&lt;1 0&lt;2 0&lt;3 1&lt;2 1&lt;3 2&lt;3<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A00=C2=A0 =C2=A01=C2=A0 =C2=A00=
=C2=A0 =C2=A01=C2=A0 =C2=A01<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 History of access =3D&gt; 3&gt;0&gt;1&gt;2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Access request is for 1, then expected order is 1&=
gt;3&gt;0&gt;2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Expected values of lru_post =3D 1 and lru_pre =3D =
2<br>
&gt;=C2=A0 <br>
&gt; Initial expand matrix based on current history<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =
=C2=A0 2=C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 1 2 3<br>
&gt;=C2=A0 =C2=A0 0=C2=A0 =C2=A0 1=C2=A0 =C2=A0 (0&lt;1)=C2=A0 (0&lt;2)=C2=
=A0 (0&lt;3)=C2=A0 =C2=A0 0 1 0 0 1<br>
&gt;=C2=A0 =C2=A0 1=C2=A0 (1&lt;0)=C2=A0 =C2=A0 1=C2=A0 =C2=A0 (1&lt;2)=C2=
=A0 (1&lt;3) =3D&gt; 1 1 1 0 1<br>
&gt;=C2=A0 =C2=A0 2=C2=A0 (2&lt;0)=C2=A0 (2&lt;1)=C2=A0 =C2=A0 1=C2=A0 =C2=
=A0 (2&lt;3)=C2=A0 =C2=A0 2 1 1 1 1<br>
&gt;=C2=A0 =C2=A0 3=C2=A0 (3&lt;0)=C2=A0 (3&lt;1)=C2=A0 (3&lt;2)=C2=A0 =C2=
=A0 1=C2=A0 =C2=A0 =C2=A0 3 0 0 0 1<br>
&gt; <br>
&gt; lru_pre is AND of bits in a row<br>
&gt; <br>
&gt; When request access=3D4&#39;b0010 then 1st row of expand matrix is <br=
>
&gt; replaced with zeros and 1st column of expand matrix is replaced <br>
&gt; with 1.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; The matrix changes accordingly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 1 2 3=C2=A0 =C2=A0 =C2=A0 0 1 2 3<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 1 0 0 1=C2=A0 =C2=A0 0 1 1 0 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 1 1 0 1 =3D&gt; 1 0 1 0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 2 1 1 1 1=C2=A0 =C2=A0 2 1 1 1 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 3 0 0 0 1=C2=A0 =C2=A0 3 0 1 0 1<br>
&gt; <br>
&gt; lru_post is product of bits in a column<br>
&gt; <br>
&gt; update =3D 6&#39;b100101<br>
&gt; <br>
&gt; This means updated history is<br>
&gt; <br>
&gt;=C2=A0 0&lt;1 0&lt;2 0&lt;3 1&lt;2 1&lt;3 2&lt;3<br>
&gt;=C2=A0 =C2=A01=C2=A0 =C2=A00=C2=A0 =C2=A01=C2=A0 =C2=A00=C2=A0 =C2=A00=
=C2=A0 =C2=A01<br>
&gt; <br>
&gt; This is what we interpret from output 1&gt;3&gt;0&gt;2 and its same as=
 our expectation.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ed1b4b05c33b533b--

--===============8030255168561135886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============8030255168561135886==--
