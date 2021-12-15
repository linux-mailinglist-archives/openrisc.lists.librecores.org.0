Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CC21B47668C
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 00:33:59 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5EA37242DF;
	Thu, 16 Dec 2021 00:33:59 +0100 (CET)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mail.librecores.org (Postfix) with ESMTPS id 6475223F03
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 00:33:57 +0100 (CET)
Received: by mail-ed1-f44.google.com with SMTP id z29so383024edl.7
 for <openrisc@lists.librecores.org>; Wed, 15 Dec 2021 15:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MNWxMqgxk64lqLceUMGb2KD2WFKNONTbtIu3karkT0=;
 b=mJJeQ6D3XHKdLp0EkzkPvWKtmiQWMAgvDS+9jtvPvG1Tuy/6E99Zapq+WiLa/56XGt
 h2vz/iwdbkwR68DkEyAyLa7WyQ7dTO1qDmzXifEsYnSrSe+CCdHKoHGXgPHvxd5sSEy1
 vHlwWvxSi6cYDzmgfD/vhaVP7+nI7iyxXo57kW7ADqZbKrfTin4QczvAI7fXUlJEmkx9
 dla6VEWq8GjOY32d5KTFaXDLRn5p1PbVjfS90mxgQOIAtKGrumH0uQmuOJtW+3hjELdS
 ajwBYjK8VmV9QO2Eb1lJjRaBL8po0R4YZu8d9lrX17dRbkaRoD3c5ldyQm6nTzilFL58
 k+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MNWxMqgxk64lqLceUMGb2KD2WFKNONTbtIu3karkT0=;
 b=zF7KVq4JyR55gxvGLu7cCyefij9QGiv+foZcRnvtFAIf7Jx812yuHDvBsbBWLOXeEg
 4o/FaUxQvIBXCOE9hvVEJSBdTX2IvE269Hbuj8FOmxUDq8DgtIxfiJz6bmdr9bAbML+R
 czFYp4ApWDocGzgbZ8T0Ge04uX1AVw0WsZmUOExRsvbvxjxGKX5antYnhTp3m3qvnE4j
 Y39zqVM8ap6f4jN/QafEdUXk8lFTjYlkZmltvt+uGCdprBC3QZ13d6sk+HNVQLqbGDTx
 60d20qPJDp9swkJKV3/97Vw0stsSI57nt/DtIPifViqyRZUnDFACp7YuVM2Fn+KtQzie
 xzww==
X-Gm-Message-State: AOAM531KBBTIn1CElfKeFCou/ei/gyFURyINIU9UPe2gbpgT/Vplzswq
 JTYfMRSdiyzu5IHO9J19CUxKvcxPBrgkzkVh5ow=
X-Google-Smtp-Source: ABdhPJw7jHw9x24rpuT5VqrKQ3OKkjRsmmu9jey2DZrIJqF0LKwR86Fjfuf49MnC6pufDvo9KdLgVSaA67Y/Ul3V0sk=
X-Received: by 2002:a17:907:6e11:: with SMTP id
 sd17mr14082532ejc.596.1639611236975; 
 Wed, 15 Dec 2021 15:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-4-shorne@gmail.com>
 <a0644ab7-85a5-e22d-607e-4e6761d87610@linaro.org>
 <alpine.DEB.2.22.394.2112142242120.1558178@digraph.polyomino.org.uk>
 <86e61afa-ab95-62e1-10a7-3de71db8deb8@linaro.org>
In-Reply-To: <86e61afa-ab95-62e1-10a7-3de71db8deb8@linaro.org>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 16 Dec 2021 08:33:46 +0900
Message-ID: <CAAfxs769tWjv-T=vCBpDPn9BB5KCZshzWoCfcejhd47-wZKHcA@mail.gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 03/13] or1k: ABI Implementation
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
 GLIBC patches <libc-alpha@sourceware.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============7971165506456930308=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============7971165506456930308==
Content-Type: multipart/alternative; boundary="0000000000005988f805d337bd05"

--0000000000005988f805d337bd05
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 15, 2021, 10:15 AM Adhemerval Zanella <
adhemerval.zanella@linaro.org> wrote:

>
>
> On 14/12/2021 19:43, Joseph Myers wrote:
> > On Tue, 14 Dec 2021, Adhemerval Zanella via Libc-alpha wrote:
> >
> >> +if test "x$profile" != xno; then
> >> +  if test "x$with_profile" == xno; then
> >> +    AC_MSG_ERROR([ABI does not support profiling])
> >
> > Using == in test is a bashism.
> >
> > I'd expect such a change to require the build-many-glibcs.py
> configuration
> > for OpenRISC to use --disable-profile.
> >
>
> I ended up mixing up things and what or1k does not support is LD_PROFILE
> instead of --enable-profile.  In this case I am not sure if it would
> be better to just not enable it (by ignoring the LD_PROFILE handling
> in rtld.c or dl-support.c) and emitting a warning or by just dumping
> and error at process initialization.
>

I checked, new ports like csky and arc also do not seem to support
LD_PROFILE.  They choose not to leave a placeholder block in dl-machine.h
like I did in or1k.

I could remove the comment, or replace it with an abort, but I prefer to
keep it as it makes it clear where to add the dynamic linker profile hook.

-Stafford

>

--0000000000005988f805d337bd05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Dec 15, 2021, 10:15 AM Adhemerval Zanella &lt;=
<a href=3D"mailto:adhemerval.zanella@linaro.org">adhemerval.zanella@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 14/12/2021 19:43, Joseph Myers wrote:<br>
&gt; On Tue, 14 Dec 2021, Adhemerval Zanella via Libc-alpha wrote:<br>
&gt; <br>
&gt;&gt; +if test &quot;x$profile&quot; !=3D xno; then<br>
&gt;&gt; +=C2=A0 if test &quot;x$with_profile&quot; =3D=3D xno; then<br>
&gt;&gt; +=C2=A0 =C2=A0 AC_MSG_ERROR([ABI does not support profiling])<br>
&gt; <br>
&gt; Using =3D=3D in test is a bashism.<br>
&gt; <br>
&gt; I&#39;d expect such a change to require the build-many-glibcs.py confi=
guration <br>
&gt; for OpenRISC to use --disable-profile.<br>
&gt; <br>
<br>
I ended up mixing up things and what or1k does not support is LD_PROFILE<br=
>
instead of --enable-profile.=C2=A0 In this case I am not sure if it would<b=
r>
be better to just not enable it (by ignoring the LD_PROFILE handling<br>
in rtld.c or dl-support.c) and emitting a warning or by just dumping<br>
and error at process initialization.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I checked, new ports like csky and ar=
c also do not seem to support LD_PROFILE.=C2=A0 They choose not to leave a =
placeholder block in dl-machine.h like I did in or1k.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">I could remove the comment, or replace it wit=
h an abort, but I prefer to keep it as it makes it clear where to add the d=
ynamic linker profile hook.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">-Stafford</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
</blockquote></div></div></div>

--0000000000005988f805d337bd05--

--===============7971165506456930308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============7971165506456930308==--
