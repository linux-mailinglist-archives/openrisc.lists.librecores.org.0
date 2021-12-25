Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3D74647F281
	for <lists+openrisc@lfdr.de>; Sat, 25 Dec 2021 08:24:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CB12722D3C;
	Sat, 25 Dec 2021 08:24:46 +0100 (CET)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mail.librecores.org (Postfix) with ESMTPS id CFC0420A41
 for <openrisc@lists.librecores.org>; Sat, 25 Dec 2021 08:24:44 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id o6so40713965edc.4
 for <openrisc@lists.librecores.org>; Fri, 24 Dec 2021 23:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=islgDRvLmIkVaW3Txiz9Hblk6YW3+ysBM2HJxSMqLp0=;
 b=d+5QUABcVTBl+/YRa6YX45XprFPqRDYUJx9LE7L3ui5OMAhoRoMum+VfDXbXxXMkQM
 frJG55xnrDNe6swKGnXEptqbz6+2LU/wdQ+n9SzoM11/WK8Zrjpzhnll1pEorZU8IreG
 lqnx6Vi8Hbed4Lwg/BVPkImlLksjxHVmrWk4UUAMuxrTKs+XI8cmbDlV7FoBj2TXLDLa
 NTkTa4jEBw8xOUjLQV5J+rPiG0Cc+/hL7QkhSs7dwarP2NQwmeAUfe0d6gFKqVsq+ojO
 7pa2fZCM9vKlrN1ABfjgEaPY0O2OfYq1bT/QAZ+VQ504jUC+VTJ08qBoFByDG0C0SmtK
 1q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=islgDRvLmIkVaW3Txiz9Hblk6YW3+ysBM2HJxSMqLp0=;
 b=ZBGTve8FGHsmzeSRheVAxXXbzEeIymvhfVo3sd0bObu2RTRgBqKdr/7ztm81aotT9S
 S4ycS/F9biLaNltBBeMxKuxVEV0Ag+aKeZ+iZrlYUv7KNVJTxDDX+TExzHXQxxE1PmcP
 6oYvSfJnx8W0oxIE7BcOxjUd1MEyt6HfjeQ++XZE9dIVjeXr4DvWabknkSO9hAnvJL7Z
 SoU2IcJDnoZDcz8fb/NQUzr6S7iaYky4Ur9PeSW+eSDqhj5D4yQoOVuzYxRtP1zfDUZZ
 TwcdDTOYvZ1CM93Yf9mABswsi85ziwIUzM9lEz4IuPpH3vkqoh5mQh2owD6U+W9tcm+S
 4YZw==
X-Gm-Message-State: AOAM533JdHQbBQbWjDjfmjvtdjS0/A/hm4ud50GvksxjaFgKhMATDlYm
 27g9rTCGJi6kOlqWlInp/x0REqJbXq1a7L7lVmv/Jitf
X-Google-Smtp-Source: ABdhPJxQYvoqVY9PY94n0lFaths8yKnEvZZz33MX2KOyEGVTX4ukF1Yc6RFKOe3ysozrlErIMBg6P7ztao965VsdLnc=
X-Received: by 2002:a05:6402:354b:: with SMTP id
 f11mr8363964edd.342.1640417084506; 
 Fri, 24 Dec 2021 23:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20211210233456.4146479-1-shorne@gmail.com>
 <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
 <Ybl/E2BWBGRMwF0G@antec> <YcSZ0iyC6STzh9uP@antec> <87pmpnnwjf.fsf@igel.home>
 <YcTpmhHaqS5KaFTG@antec>
In-Reply-To: <YcTpmhHaqS5KaFTG@antec>
From: Stafford Horne <shorne@gmail.com>
Date: Sat, 25 Dec 2021 16:24:35 +0900
Message-ID: <CAAfxs75QcK2VkXOtbR70y9SjcNnqvNtTMq0bt+8M1az3A_LVPg@mail.gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [OpenRISC] [PATCH v3 00/13] Glibc OpenRISC port
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
 Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: multipart/mixed; boundary="===============2074360922511848216=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============2074360922511848216==
Content-Type: multipart/alternative; boundary="0000000000009b042305d3f35d9a"

--0000000000009b042305d3f35d9a
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 24, 2021, 6:26 AM Stafford Horne <shorne@gmail.com> wrote:

> On Thu, Dec 23, 2021 at 04:57:56PM +0100, Andreas Schwab wrote:
> > On Dez 24 2021, Stafford Horne via Libc-alpha wrote:
> >
> > > It seems the write to the tmp file was failing due the re-open not
> passing
> > > O_LARGEFILE.
> >
> > open64 implies O_LARGEFILE, so if that is making a difference, then your
> > open64 is broken.
>
> Right, that is what the docs say.  This architecuture is 32-bits.
>
> And the open64 path is generic.
>
> Possibly this bit removing O_LARGEFILE is wrong?
>
> In sysdeps/unix/sysv/linux/open64.c:
>
>   27 #ifdef __OFF_T_MATCHES_OFF64_T
>   28 # define EXTRA_OPEN_FLAGS 0
>   29 #else
>   30 # define EXTRA_OPEN_FLAGS O_LARGEFILE
>   31 #endif
>
> Otherwise there is something is wrong on linux.  It is explicitly checking
> for the precense of O_LARGEFILE.
>
> in fs/read_write.c in generic_write_check_limits:
>
>         if (!(file->f_flags & O_LARGEFILE))
>                 max_size = MAX_NON_LFS;
>

There's something wrong with __OFF_T_MATCHES_OFF64_T in this port.  We have
32-bit off_t in Linux.  So __OFF_T_MATCHES_OFF64_T should be undefined I
think.  I'll look into.

-Stafford

>

--0000000000009b042305d3f35d9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 24, 2021, 6:26 AM Stafford Horne &lt;<a hr=
ef=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Thu, Dec 23, 2021 at 04:57:56PM +0100, Andre=
as Schwab wrote:<br>
&gt; On Dez 24 2021, Stafford Horne via Libc-alpha wrote:<br>
&gt; <br>
&gt; &gt; It seems the write to the tmp file was failing due the re-open no=
t passing<br>
&gt; &gt; O_LARGEFILE.<br>
&gt; <br>
&gt; open64 implies O_LARGEFILE, so if that is making a difference, then yo=
ur<br>
&gt; open64 is broken.<br>
<br>
Right, that is what the docs say.=C2=A0 This architecuture is 32-bits.<br>
<br>
And the open64 path is generic.<br>
<br>
Possibly this bit removing O_LARGEFILE is wrong?<br>
<br>
In sysdeps/unix/sysv/linux/open64.c:<br>
<br>
=C2=A0 27 #ifdef __OFF_T_MATCHES_OFF64_T<br>
=C2=A0 28 # define EXTRA_OPEN_FLAGS 0<br>
=C2=A0 29 #else<br>
=C2=A0 30 # define EXTRA_OPEN_FLAGS O_LARGEFILE<br>
=C2=A0 31 #endif<br>
<br>
Otherwise there is something is wrong on linux.=C2=A0 It is explicitly chec=
king<br>
for the precense of O_LARGEFILE.<br>
<br>
in fs/read_write.c in generic_write_check_limits:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(file-&gt;f_flags &amp; O_LARGEFILE))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_size =3D MAX_NO=
N_LFS;<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">There&#39;s something wrong with __OFF_T_MATCHES_OFF64_T in this port=
.=C2=A0 We have 32-bit off_t in Linux.=C2=A0 So __OFF_T_MATCHES_OFF64_T sho=
uld be undefined I think.=C2=A0 I&#39;ll look into.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">-Stafford</div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000009b042305d3f35d9a--

--===============2074360922511848216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============2074360922511848216==--
