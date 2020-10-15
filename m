Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BDB5A28FB68
	for <lists+openrisc@lfdr.de>; Fri, 16 Oct 2020 01:05:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 63CA320E91;
	Fri, 16 Oct 2020 01:05:33 +0200 (CEST)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by mail.librecores.org (Postfix) with ESMTPS id 046BD20E80
 for <openrisc@lists.librecores.org>; Fri, 16 Oct 2020 01:05:31 +0200 (CEST)
Received: by mail-ed1-f68.google.com with SMTP id cm24so431933edb.0
 for <openrisc@lists.librecores.org>; Thu, 15 Oct 2020 16:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpxpd4iX8RI5djzJtoybZr6YyZX1fcBmRXpcn5Qot/Q=;
 b=QAir4mlN/BNfVS6SAs3RJDS0ecLG5ubXjrKoJATQMXxqXSwD5Wiun6Nhz2Rdcgj9FG
 WPhQLRiphbOSoVImzIR5iQdte+cz3npT7OD0/YcXWWrs2HyD2bwYp9HEIv1QvYBGdSYa
 Z5vukWMO5DVBD31HEZOGEgKqCFveEbCymYxoS5lOAfIKh5nVqkpP0WR9EPqnuRdATylb
 yMHPbrOOBJApte+JgR6tlLYYqiiJG/dqkGT27syY+dgtdCdAaiS1oNtSU/udtxvrgNko
 /tUuIxL6iyktwycYG6Td8HAxHHQdD9z6pxbrrwo3ORkBsqdb2FqH1pJEjEzs8sd10EKK
 zhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpxpd4iX8RI5djzJtoybZr6YyZX1fcBmRXpcn5Qot/Q=;
 b=h+t74p5ANMor/sGFu/ye4kZQsXPaYFZo3b4GQ/DIeIhXHdx6zxr3iw0DeX+SyEFhcB
 6SsXPob5o+kPD9u5vWmhm/571mlW7UIPC1FebONDOsY95dH9/V4EOOkyKGY6WbT453Is
 upXZ7udOhPkCaRpwH3Rq520HE3Fa3WeIa6kOzwK3465H4sv7PdpdwbBg4sCKtFUVhmsS
 1uoXK5CVAYiC10Ry9Abns5mWprsGaR9+2cnntQsKPMwSAEmjpVrBCBidfyJxOQxnWCCY
 PaLj2VmbTJaTLuZeMZuBMBDB7qNo7UN0l8g/R5hL4RC96A+byiWA4gfLd87AOntZZKyU
 YGvQ==
X-Gm-Message-State: AOAM531cPLtX0WWz5fYNkvH94gOx8Lefefss/pNZEbjJlxmeqeWlrCtu
 95xqP+4GyIUnJsyEWL7iihMyE+sW4pFapsTKD60=
X-Google-Smtp-Source: ABdhPJz6sNfxZcOJeuyBzpjeZ36nNwWAW9L+qxsiCBIT9N5zBiHTg/95ZDHZF4qHLHCyNQoZQpDQdwpPpQ1GY7IyyfU=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr870848eds.4.1602803130579;
 Thu, 15 Oct 2020 16:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <202010160523.r8yMbvrW-lkp@intel.com>
 <CAG48ez3VixjDrMnz6+7JjGW_ZLZCD4+dTYWUD_tNOcfEfpu1Bg@mail.gmail.com>
In-Reply-To: <CAG48ez3VixjDrMnz6+7JjGW_ZLZCD4+dTYWUD_tNOcfEfpu1Bg@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Fri, 16 Oct 2020 08:05:17 +0900
Message-ID: <CAAfxs77_h-DHOMFCJBWMuj1H5Rj8OiqC_U1Trs3A8gNCiPvo7w@mail.gmail.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [OpenRISC] [linux-stable-rc:linux-5.4.y 665/2391]
 drivers/android/binder.c:3776: Error: unrecognized keyword/register name
 `l.lwz
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
Cc: Jonas Bonn <jonas@southpole.se>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel list <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org,
 Martijn Coenen <maco@android.com>
Content-Type: multipart/mixed; boundary="===============3056456501315055455=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============3056456501315055455==
Content-Type: multipart/alternative; boundary="0000000000003e44a305b1bdaf9b"

--0000000000003e44a305b1bdaf9b
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020, 6:46 AM Jann Horn <jannh@google.com> wrote:

> +openrisc folks
>
> On Thu, Oct 15, 2020 at 11:28 PM kernel test robot <lkp@intel.com> wrote:
> > tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> linux-5.4.y
> > head:   85b0841aab15c12948af951d477183ab3df7de14
> > commit: c5665cafbedd2e2a523fe933e452391a02d3adb3 [665/2391] binder:
> Prevent context manager from incrementing ref 0
> > config: openrisc-randconfig-r002-20201014 (attached as .config)
> > compiler: or1k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         #
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=c5665cafbedd2e2a523fe933e452391a02d3adb3
> >         git remote add linux-stable-rc
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-5.4.y
> >         git checkout c5665cafbedd2e2a523fe933e452391a02d3adb3
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> ARCH=openrisc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/android/binder.c: Assembler messages:
> > >> drivers/android/binder.c:3776: Error: unrecognized keyword/register
> name `l.lwz ?ap,4(r25)'
> >    drivers/android/binder.c:3781: Error: unrecognized keyword/register
> name `l.addi ?ap,r0,0'
>
> binder is basically doing this:
>
> u64 data_ptr;
> if (get_user(data_ptr, (u64 __user *)ptr))
>   return -EFAULT;
>
> and GCC complains that that doesn't turn into valid assembly on
> openrisc, where get_user() of size 8 expands into this:
>
> #define __get_user_asm2(x, addr, err)                   \
> {                                                       \
>         unsigned long long __gu_tmp;                    \
>         __asm__ __volatile__(                           \
>                 "1:     l.lwz %1,0(%2)\n"               \
>                 "2:     l.lwz %H1,4(%2)\n"              \
>                 "3:\n"                                  \
>                 ".section .fixup,\"ax\"\n"              \
>                 "4:     l.addi %0,r0,%3\n"              \
>                 "       l.addi %1,r0,0\n"               \
>                 "       l.addi %H1,r0,0\n"              \
>                 "       l.j 3b\n"                       \
>                 "       l.nop\n"                        \
>                 ".previous\n"                           \
>                 ".section __ex_table,\"a\"\n"           \
>                 "       .align 2\n"                     \
>                 "       .long 1b,4b\n"                  \
>                 "       .long 2b,4b\n"                  \
>                 ".previous"                             \
>                 : "=r"(err), "=&r"(__gu_tmp)            \
>                 : "r"(addr), "i"(-EFAULT), "0"(err));   \
>         (x) = (__typeof__(*(addr)))(                    \
>                 (__typeof__((x)-(x)))__gu_tmp);         \
> }
>
> and apparently the "l.lwz %H1,4(%2)" and "l.addi %H1,r0,0" don't turn
> into valid assembly when %H1 expands to "?ap"?
>
> I don't know anything about OpenRISC, but this seems like it's
> probably an issue in the get_user() implementation.
>

This is fixed in 5.9.  I think the patch can be cherry picked by itself.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/openrisc?h=v5.9&id=d877322bc1adcab9850732275670409e8bcca4c4

>

--0000000000003e44a305b1bdaf9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 16, 2020, 6:46 AM Jann Horn &lt;<a href=3D=
"mailto:jannh@google.com">jannh@google.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">+openrisc folks<br>
<br>
On Thu, Oct 15, 2020 at 11:28 PM kernel test robot &lt;<a href=3D"mailto:lk=
p@intel.com" target=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt; wro=
te:<br>
&gt; tree:=C2=A0 =C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kern=
el/git/stable/linux-stable-rc.git" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git</a> linux-5.4.y<br>
&gt; head:=C2=A0 =C2=A085b0841aab15c12948af951d477183ab3df7de14<br>
&gt; commit: c5665cafbedd2e2a523fe933e452391a02d3adb3 [665/2391] binder: Pr=
event context manager from incrementing ref 0<br>
&gt; config: openrisc-randconfig-r002-20201014 (attached as .config)<br>
&gt; compiler: or1k-linux-gcc (GCC) 9.3.0<br>
&gt; reproduce (this is a W=3D1 build):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wget <a href=3D"https://raw.githubuse=
rcontent.com/intel/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://raw.githubusercontent.com/intel/lkp-tests=
/master/sbin/make.cross</a> -O ~/bin/make.cross<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ~/bin/make.cross<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://git.kernel.org/p=
ub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=3Dc5665cafbed=
d2e2a523fe933e452391a02d3adb3" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.=
git/commit/?id=3Dc5665cafbedd2e2a523fe933e452391a02d3adb3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git remote add linux-stable-rc <a hre=
f=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc=
.git" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.kernel.or=
g/pub/scm/linux/kernel/git/stable/linux-stable-rc.git</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git fetch --no-tags linux-stable-rc l=
inux-5.4.y<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git checkout c5665cafbedd2e2a523fe933=
e452391a02d3adb3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# save the attached .config to linux =
build tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COMPILER_INSTALL_PATH=3D$HOME/0day CO=
MPILER=3Dgcc-9.3.0 make.cross ARCH=3Dopenrisc<br>
&gt;<br>
&gt; If you fix the issue, kindly add following tag as appropriate<br>
&gt; Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt;<br>
&gt;<br>
&gt; All errors (new ones prefixed by &gt;&gt;):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 drivers/android/binder.c: Assembler messages:<br>
&gt; &gt;&gt; drivers/android/binder.c:3776: Error: unrecognized keyword/re=
gister name `l.lwz ?ap,4(r25)&#39;<br>
&gt;=C2=A0 =C2=A0 drivers/android/binder.c:3781: Error: unrecognized keywor=
d/register name `l.addi ?ap,r0,0&#39;<br>
<br>
binder is basically doing this:<br>
<br>
u64 data_ptr;<br>
if (get_user(data_ptr, (u64 __user *)ptr))<br>
=C2=A0 return -EFAULT;<br>
<br>
and GCC complains that that doesn&#39;t turn into valid assembly on<br>
openrisc, where get_user() of size 8 expands into this:<br>
<br>
#define __get_user_asm2(x, addr, err)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long __gu_tmp;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __asm__ __volatile__(=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1:=C2=A0 =C2=
=A0 =C2=A0l.lwz %1,0(%2)\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;2:=C2=A0 =C2=
=A0 =C2=A0l.lwz %H1,4(%2)\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;3:\n&quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.section .fix=
up,\&quot;ax\&quot;\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;4:=C2=A0 =C2=
=A0 =C2=A0l.addi %0,r0,%3\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0l.addi %1,r0,0\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0l.addi %H1,r0,0\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0l.j 3b\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0l.nop\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.previous\n&q=
uot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.section __ex=
_table,\&quot;a\&quot;\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0.align 2\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0.long 1b,4b\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0.long 2b,4b\n&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.previous&quo=
t;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;=3Dr&quot;(=
err), &quot;=3D&amp;r&quot;(__gu_tmp)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r&quot;(add=
r), &quot;i&quot;(-EFAULT), &quot;0&quot;(err));=C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (x) =3D (__typeof__(*(addr)))(=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (__typeof__((x)-(x)=
))__gu_tmp);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
}<br>
<br>
and apparently the &quot;l.lwz %H1,4(%2)&quot; and &quot;l.addi %H1,r0,0&qu=
ot; don&#39;t turn<br>
into valid assembly when %H1 expands to &quot;?ap&quot;?<br>
<br>
I don&#39;t know anything about OpenRISC, but this seems like it&#39;s<br>
probably an issue in the get_user() implementation.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">This is fixed in 5.9.=C2=
=A0 I think the patch can be cherry picked by itself.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><a href=3D"https://git.kernel.org/pub/scm/lin=
ux/kernel/git/torvalds/linux.git/commit/arch/openrisc?h=3Dv5.9&amp;id=3Dd87=
7322bc1adcab9850732275670409e8bcca4c4">https://git.kernel.org/pub/scm/linux=
/kernel/git/torvalds/linux.git/commit/arch/openrisc?h=3Dv5.9&amp;id=3Dd8773=
22bc1adcab9850732275670409e8bcca4c4</a><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000003e44a305b1bdaf9b--

--===============3056456501315055455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============3056456501315055455==--
