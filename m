Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA9738F5B1
	for <lists+openrisc@lfdr.de>; Tue, 25 May 2021 00:35:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A1CCE235FC;
	Tue, 25 May 2021 00:35:04 +0200 (CEST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mail.librecores.org (Postfix) with ESMTPS id B6E5C21393
 for <openrisc@lists.librecores.org>; Tue, 25 May 2021 00:35:02 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id j10so16229420edw.8
 for <openrisc@lists.librecores.org>; Mon, 24 May 2021 15:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4ODR+JMFy2HO2J/ffAs1b3rw1h0MFoKAy6dEpfFp/A=;
 b=MwX3Uu6tmlRdoLLMfaJcD+SvicwXjWQqUgSM2R702evstV447s8dNca8MgCwq0emSN
 U5HQlRRoZ2dIPx5yJXKHkl4krYRgZWqy7/+DB7ZVSFUctK3QxcdHutBVm6tByVnG1gHU
 90bq66Dc2qG8Xu1A6XAef01bpiMZeSECLclL7MisNfD8BNILK4qBuoYjgJaAZ67OaA9u
 Hwezd8FzgZLVIfehbIXHxAysrNgVxbDAcV65436MbrNNgZBBUOnpDxc/AX4H2ZR4SXc/
 CRUo5uzFN4rf4ww8/I4P0zmxo7uNCLFG+f5DDEd1vlvotT7SJBxpCrOuQce4rcmA1iER
 jUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4ODR+JMFy2HO2J/ffAs1b3rw1h0MFoKAy6dEpfFp/A=;
 b=jHYbAbwAgoWivknN5t1at75/1dx24t/5aRWifCKtEtFf5rnax1OhznSh0gJvF0PHF7
 WsUUS0nXBjpEY4WZTPxjVvcyqNju1ONiKJG7+3/ydZoKFCcu/x04OiX0vPzuZDUNyw/1
 mIXqEsRgmmq2hkZzLg0xhKG4ZrDZV0RzUavZmPmQ1JMAwuATA1C+Zv/CEcaNPDwoCniU
 nNtLHiAYbnBjz/UaqEnNTqvpGrlNa0J+atFmW6SHCVsnSiK+tmoTvycE1BJ+VForQ9Kl
 Jm/KnHBb4J5l1Q5gpoqtR08NoxHXuppOo+xC7al1QmvEUdl9TjYstUr1I+LJjBB43YfB
 jepw==
X-Gm-Message-State: AOAM533ECJy2oWvQ6AOf2Zr7YWI8KYZIVVzGw4LYVUgBGFlbKwcROxjq
 Anu4rXZiLFx+tL41YbcWgxIRC75p64Vep75qT7U=
X-Google-Smtp-Source: ABdhPJyvO940Q3UqXrGEJoXWx1RxMpBNm9DXz/whU44dwbZ1deusgAPZM/DGqLl8Zlo8WdGxN2DVzBv/jS7rv1OwOYw=
X-Received: by 2002:a05:6402:4cf:: with SMTP id
 n15mr29271127edw.162.1621895702206; 
 Mon, 24 May 2021 15:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <dbcce22d-b288-2451-4a8d-681f802c6f49@benettiengineering.com>
In-Reply-To: <dbcce22d-b288-2451-4a8d-681f802c6f49@benettiengineering.com>
From: Stafford Horne <shorne@gmail.com>
Date: Tue, 25 May 2021 07:34:50 +0900
Message-ID: <CAAfxs77Y1qOzex=Bkn5c_4Zxt6nzZP2cpG6qJ85eXnrAm18FgA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [OpenRISC] Maybe another or1k bug
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
Content-Type: multipart/mixed; boundary="===============1312085858265644949=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============1312085858265644949==
Content-Type: multipart/alternative; boundary="000000000000315cad05c31b05ca"

--000000000000315cad05c31b05ca
Content-Type: text/plain; charset="UTF-8"

I'm cc'ing the list so there is a record, and other experts could come in
if they like.

Ok, I'll take a look.

Thanks,  these are always fun for me.

Also I forgot to respond about nios2 bugs. I could help if the bug looked
the same. But to me it looked different.  So I'll hold off for now.

On Tue, May 25, 2021, 7:10 AM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Stafford,
>
> I think I've found another or1k ld bug. Here is the build failure log:
>
> http://autobuild.buildroot.net/results/ca3/ca3281294392da1a5ea84dbb9cc4c5bfea0c4ccf/build-end.log
>
> It complains about:
> pc-relative relocation against dynamic symbol
>
> there is an archive of some files(libcommon.a) compiled in the beginning
> that gets linked with the rest of .o files. Every file is compiled with
> -fPIC option so this should allow to link a .o with .a but it throws
> that error.
>
> I only see that error in or1k and alpha. Maybe I'm missing something.
> When you have time and if you want, can you help me with that?
>
> If you want to reproduce it it's the same procedure of previous bugs but
> you need to specify ca3281294392da1a5ea84dbb9cc4c5bfea0c4ccf to
> br-reproduce-build.
>
> Thanks in advance
> and
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>

--000000000000315cad05c31b05ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">I&#39;m cc&#39;ing the list so there is=
 a record, and other experts could come in if they like.</div><div dir=3D"a=
uto"><br></div><div>Ok, I&#39;ll take a look.=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Thanks,=C2=A0 these are always fun for me.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Also I forgot to respond abo=
ut nios2 bugs. I could help if the bug looked the same. But to me it looked=
 different.=C2=A0 So I&#39;ll hold off for now.<br><br><div class=3D"gmail_=
quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 25, 2=
021, 7:10 AM Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettien=
gineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Sta=
fford,<br>
<br>
I think I&#39;ve found another or1k ld bug. Here is the build failure log:<=
br>
<a href=3D"http://autobuild.buildroot.net/results/ca3/ca3281294392da1a5ea84=
dbb9cc4c5bfea0c4ccf/build-end.log" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">http://autobuild.buildroot.net/results/ca3/ca3281294392d=
a1a5ea84dbb9cc4c5bfea0c4ccf/build-end.log</a><br>
<br>
It complains about:<br>
pc-relative relocation against dynamic symbol<br>
<br>
there is an archive of some files(libcommon.a) compiled in the beginning <b=
r>
that gets linked with the rest of .o files. Every file is compiled with <br=
>
-fPIC option so this should allow to link a .o with .a but it throws <br>
that error.<br>
<br>
I only see that error in or1k and alpha. Maybe I&#39;m missing something.<b=
r>
When you have time and if you want, can you help me with that?<br>
<br>
If you want to reproduce it it&#39;s the same procedure of previous bugs bu=
t <br>
you need to specify ca3281294392da1a5ea84dbb9cc4c5bfea0c4ccf to <br>
br-reproduce-build.<br>
<br>
Thanks in advance<br>
and<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
</blockquote></div>
</div></div>

--000000000000315cad05c31b05ca--

--===============1312085858265644949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1312085858265644949==--
