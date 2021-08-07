Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B8F613E3372
	for <lists+openrisc@lfdr.de>; Sat,  7 Aug 2021 06:49:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4F68324037;
	Sat,  7 Aug 2021 06:49:39 +0200 (CEST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mail.librecores.org (Postfix) with ESMTPS id EFD5120309
 for <openrisc@lists.librecores.org>; Sat,  7 Aug 2021 06:49:37 +0200 (CEST)
Received: by mail-ej1-f44.google.com with SMTP id yk17so18660358ejb.11
 for <openrisc@lists.librecores.org>; Fri, 06 Aug 2021 21:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kOB9Uz445i8DlBwNERbW/H+c4bY/F/yYReJYLbwlOo=;
 b=LRU533uNxWBBMlZfQxt4QKrTYrrDyPsnkKlDBr691aBxKJiEJircrvREQ5PG6kUURS
 9uvp3n8QerT37191fr0lqQDV5tPQfVnH+GPRanuloEGBLxfmzANMmjSDXacTv6qU/tFk
 bzyUfuNN9vR451SvcIVfj9ZlkkD5Q8pL5/rIWgkfmggpJEqhk9NF1ftY0WYjpZvuc6/p
 hkHUtaiIYIGH28qvg1aMiyTZkXjhfkMcEKLAA64YZjyG6E2G9H/YN0MFvT5DGYj4THzS
 Y4p0DknSa82M2bi+x9zlAc77VIz7/ahOB/ssbsFzcKYNKpItco03Xnhnea81eGXjhXVW
 dHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kOB9Uz445i8DlBwNERbW/H+c4bY/F/yYReJYLbwlOo=;
 b=lvYdKudRGvwS1EVnKyYpWFVKPbPbfbEhaEXpGtaaOB80Ll/CkfO2UqRm2AmeAmd/U9
 yTM+dJ1F3TQLPxVkH5kF/kSFVe0/M3CPYzE/u28ha0WPXzKGOL9xbEU6jJdH2ZV6xa3W
 CilgDwJPtf7R/xTTcttiTrkghtpncVDM0tl4Re46prHPbl0rwlBhwnNhiJbK6tNo2Kk7
 /bsEcj7ci7AKm3pwk6FYd8R6NBqk/YmAqNVQr3ZwuY01f+y8DERrojBcVq5W6uUxeGwl
 vRutBpBzlQr1V6M7UvdxLNngjjHR4sM8iphMHNow8qr7XVCXgtzjXnndQ/T3edPuhJ1w
 +ADQ==
X-Gm-Message-State: AOAM533Q+N/T6OunxUpQT3lPI2sS3rTLlmZLCLGXvI+Mt86mAxIblpiE
 haprwxHoSWEP9ddcjUtBjpMX4QIQV8xMJGhHP88=
X-Google-Smtp-Source: ABdhPJxllH3mm0U4z1HKznCblQBsz6KVbSyDnjqX1TFApJb9UUhnjKoih8C/HTbGHxIic4QdduuN9uOCdnCjMmnNspg=
X-Received: by 2002:a17:906:f20a:: with SMTP id
 gt10mr13118498ejb.267.1628311777639; 
 Fri, 06 Aug 2021 21:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210805030035.2994973-1-shorne@gmail.com>
 <655ef6e0-defb-7467-25df-f9a13ab96694@infradead.org>
In-Reply-To: <655ef6e0-defb-7467-25df-f9a13ab96694@infradead.org>
From: Stafford Horne <shorne@gmail.com>
Date: Sat, 7 Aug 2021 13:49:25 +0900
Message-ID: <CAAfxs7653w00yKVuRy4K-H3_Pe=WCutB8Tfja-hdh1rG-K+yxA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix compiler warnings in setup
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1082451941328950506=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============1082451941328950506==
Content-Type: multipart/alternative; boundary="0000000000001700a705c8f0e1f7"

--0000000000001700a705c8f0e1f7
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 6, 2021, 4:32 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> On 8/4/21 8:00 PM, Stafford Horne wrote:
> > This was pointed out with the recent name change of or32_early_setup to
> > or1k_early_setup.  Investigating the file I found a few other warnings
> > so cleaning them up here.
> >
> >      arch/openrisc/kernel/setup.c:220:13: warning: no previous prototype
> for 'or1k_early_setup' [-Wmissing-prototypes]
> >        220 | void __init or1k_early_setup(void *fdt)
> >         |             ^~~~~~~~~~~~~~~~
> >
> > Fix this the missing or1k_early_setup prototype warning by adding an
> > asm/setup.h file to define the prototype.
> >
> >      arch/openrisc/kernel/setup.c:246:13: warning: no previous prototype
> for 'detect_unit_config' [-Wmissing-prototypes]
> >        246 | void __init detect_unit_config(unsigned long upr, unsigned
> long mask,
> >         |             ^~~~~~~~~~~~~~~~~~
> >
> > The function detect_unit_config is not used, just remove it.
> >
> >      arch/openrisc/kernel/setup.c:221: warning: Function parameter or
> member 'fdt' not described in 'or1k_early_setup'
> >
> > Add @fdt docs to the function comment to suppress this warning.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
>
> Hi Stafford,
>
> Does this patch apply to your openrisc tree, but not to
> linux-next?  I get a patch error when trying to apply it
> to linux-next-20210805 and this warning is still present:
>
> ../arch/openrisc/kernel/setup.c:221:13: warning: no previous prototype for
> 'or32_early_setup' [-Wmissing-prototypes]
>    221 | void __init or32_early_setup(void *fdt)
>        |             ^~~~~~~~~~~~~~~~
>
> presumably because some openrisc patches are not yet in linux-next??
>
> thanks.
>

Hi Randy,

Thats right, this patch is on top of my openrisc/for-next branch.  It
should show up in linux-next soon.

The branch is here.


https://github.com/openrisc/linux/commit/19e14f3a81d227f1c8b8d5371de28b3ab3deb556

I put this patch on the branch already. I plan to adjust if any feedback.

-stafford

>

--0000000000001700a705c8f0e1f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Aug 6, 2021, 4:32 AM Randy Dunlap &lt;<a href=
=3D"mailto:rdunlap@infradead.org">rdunlap@infradead.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 8/4/21 8:00 PM, Stafford Horne wrote=
:<br>
&gt; This was pointed out with the recent name change of or32_early_setup t=
o<br>
&gt; or1k_early_setup.=C2=A0 Investigating the file I found a few other war=
nings<br>
&gt; so cleaning them up here.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 arch/openrisc/kernel/setup.c:220:13: warning: no p=
revious prototype for &#39;or1k_early_setup&#39; [-Wmissing-prototypes]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 220 | void __init or1k_early_setup(void *fd=
t)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~<br>
&gt; <br>
&gt; Fix this the missing or1k_early_setup prototype warning by adding an<b=
r>
&gt; asm/setup.h file to define the prototype.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 arch/openrisc/kernel/setup.c:246:13: warning: no p=
revious prototype for &#39;detect_unit_config&#39; [-Wmissing-prototypes]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 246 | void __init detect_unit_config(unsign=
ed long upr, unsigned long mask,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<br>
&gt; <br>
&gt; The function detect_unit_config is not used, just remove it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 arch/openrisc/kernel/setup.c:221: warning: Functio=
n parameter or member &#39;fdt&#39; not described in &#39;or1k_early_setup&=
#39;<br>
&gt; <br>
&gt; Add @fdt docs to the function comment to suppress this warning.<br>
&gt; <br>
&gt; Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt;<br>
&gt; Signed-off-by: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt;<br>
<br>
Hi Stafford,<br>
<br>
Does this patch apply to your openrisc tree, but not to<br>
linux-next?=C2=A0 I get a patch error when trying to apply it<br>
to linux-next-20210805 and this warning is still present:<br>
<br>
../arch/openrisc/kernel/setup.c:221:13: warning: no previous prototype for =
&#39;or32_early_setup&#39; [-Wmissing-prototypes]<br>
=C2=A0 =C2=A0221 | void __init or32_early_setup(void *fdt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~~~~~~~<br>
<br>
presumably because some openrisc patches are not yet in linux-next??<br>
<br>
thanks.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Hi Randy,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thats r=
ight, this patch is on top of my openrisc/for-next branch.=C2=A0 It should =
show up in linux-next soon.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">The branch is here.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
=C2=A0<a href=3D"https://github.com/openrisc/linux/commit/19e14f3a81d227f1c=
8b8d5371de28b3ab3deb556">https://github.com/openrisc/linux/commit/19e14f3a8=
1d227f1c8b8d5371de28b3ab3deb556</a></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I put this patch on the branch already. I plan to adjust if any=
 feedback.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-stafford</di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"></blockquote></div></div></div>

--0000000000001700a705c8f0e1f7--

--===============1082451941328950506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1082451941328950506==--
