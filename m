Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CCE8A482680
	for <lists+openrisc@lfdr.de>; Sat,  1 Jan 2022 05:54:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 72BD124040;
	Sat,  1 Jan 2022 05:54:21 +0100 (CET)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mail.librecores.org (Postfix) with ESMTPS id C46CD20CE9
 for <openrisc@lists.librecores.org>; Sat,  1 Jan 2022 05:54:19 +0100 (CET)
Received: by mail-ed1-f45.google.com with SMTP id w16so114814002edc.11
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvfOyUDjgdtpI1mwPhDTpSMABoDCR9H9KpljYo31PfY=;
 b=VXEQOuqbEotiU6FBAKxp/a2fjqbECXL+4nqHaKMy7kKYw7prV5eDNrcT17igQ3bYE6
 /IXM0u6oLtBMgqvL/5t9xu8RoeD6d5SHLM2S5a6srzZWqqaZPDdjawtS2tsD+CjY8Mvl
 T7Ewt3y0JnWTlyX3ZEQs9gEGN2XK6j8qEseC2tTIzOoWFEZVHHEPzFYWRkX7fwrIhkjM
 68N6rsueT1ZGI+BsDZD52DIgUjVT20FnyLH6kKZYAXBusHWc8e60rJbT7qCOadXYcRyX
 z3b1Uucod4qUfMEyPGVD/xdYrAlrJy4tWCALP6XQjV/iqVwwZuRvn3nB1zQPFQMEMhRc
 hD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvfOyUDjgdtpI1mwPhDTpSMABoDCR9H9KpljYo31PfY=;
 b=bxoLJU82tV5rbmXmf19VUCHSugMMV5MzOVRLY/rosIixg6EoNuXyFhSPtPzGzl63Ty
 ZnLDwb0NbE3ptfC2VHTSA4QJ+cpoQ08nurw8RdYzymCF5AexWJwfZxCo9ZwcF1OAxcuv
 bJRoeSV9UZEeVkydO8RW+WncyJ+BQ8+FoMk+DripL0fiSo3wxSA5i7voxpiZhJXXspAX
 lX+AUQZpwtvCkZq7yFMa9/M9tu68SE1KWWiasMnP6DyUzisQ58eKLILrrSp9ImSkSOjL
 CVV9/Rz4md5Iaz7xIpBLQoFUuMC72rG6A8pQYSd6q36Ehwyx2/KvdF7oI5FdFnzv4eVf
 +RNQ==
X-Gm-Message-State: AOAM530PuRtYpT/RQA8JsXfgPWBofWXhYL4NxSM6PIHJAXqdrn/UCNrE
 JoTgguYSYUz1ZsQ5G/JmQszO95Y+l6j/5+nbBek=
X-Google-Smtp-Source: ABdhPJzz5rJSQZLAmINoJ0tAXcYwh5B9XtI4grFX2FuznSapUBWVb+V2Dis2ZTWgcIdVrVe0+bc/ufeV7yTOPV4Bm70=
X-Received: by 2002:a50:c3c8:: with SMTP id i8mr37482399edf.350.1641012859411; 
 Fri, 31 Dec 2021 20:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-11-shorne@gmail.com>
 <alpine.DEB.2.22.394.2112311744180.2293191@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.22.394.2112311744180.2293191@digraph.polyomino.org.uk>
From: Stafford Horne <shorne@gmail.com>
Date: Sat, 1 Jan 2022 13:54:09 +0900
Message-ID: <CAAfxs77-NEGg5vCTPxNd7aJmOqvvf1Nf6=Mm8YfrFxJ6GOcDHQ@mail.gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [OpenRISC] [PATCH v4 10/13] or1k: ABI lists
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
Content-Type: multipart/mixed; boundary="===============4542006896990822329=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4542006896990822329==
Content-Type: multipart/alternative; boundary="0000000000008ea07105d47e1488"

--0000000000008ea07105d47e1488
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 1, 2022, 2:45 AM Joseph Myers <joseph@codesourcery.com> wrote:

> On Wed, 29 Dec 2021, Stafford Horne via Libc-alpha wrote:
>
> >  sysdeps/unix/sysv/linux/or1k/libnsl.abilist   |  121 +
>
> As noted for the LoongArch port submission, I don't think new ports should
> have libnsl or an ABI test baseline for it.
>

Ok, I'll have a look. Is this something we have to do in new ports or is
this something wrong with the generic parts?

-Stafford

>

--0000000000008ea07105d47e1488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Jan 1, 2022, 2:45 AM Joseph Myers &lt;<a href=
=3D"mailto:joseph@codesourcery.com">joseph@codesourcery.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Wed, 29 Dec 2021, Stafford Horne=
 via Libc-alpha wrote:<br>
<br>
&gt;=C2=A0 sysdeps/unix/sysv/linux/or1k/libnsl.abilist=C2=A0 =C2=A0|=C2=A0 =
121 +<br>
<br>
As noted for the LoongArch port submission, I don&#39;t think new ports sho=
uld <br>
have libnsl or an ABI test baseline for it.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Ok, I&#39;ll have a look. Is thi=
s something we have to do in new ports or is this something wrong with the =
generic parts?</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Stafford=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"></blockquote></div></div></div>

--0000000000008ea07105d47e1488--

--===============4542006896990822329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4542006896990822329==--
