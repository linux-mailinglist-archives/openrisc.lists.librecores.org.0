Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E709B18C816
	for <lists+openrisc@lfdr.de>; Fri, 20 Mar 2020 08:21:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 89FE620842;
	Fri, 20 Mar 2020 08:21:27 +0100 (CET)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mail.librecores.org (Postfix) with ESMTPS id B09852074A
 for <openrisc@lists.librecores.org>; Fri, 20 Mar 2020 08:21:25 +0100 (CET)
Received: by mail-wm1-f50.google.com with SMTP id z12so5151566wmf.5
 for <openrisc@lists.librecores.org>; Fri, 20 Mar 2020 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3x7Ry8XzKgFIbFuudGzeQAF0OLQQLlGzKNO2Zn22HVk=;
 b=CVENSbCkG8BF+Js3J7hblbXYzhX3UZgapDIgggW5djn67EP/sgG0ojTuu1nON0CMqW
 icKeRffePYPL1nBm5oAcrcEfXojA2vzTvboRny5fRZu1SsqUpnp3u1Qqr49U3Ez261/m
 9rDa+itgFOYHD1qiDjPbbWa+xb5VhF53wGzfGabUM2SWcrFLFTRt+rkjl/0swce8qe3K
 ty3s3oKc6FyiqVWXBoOh8XmJfk5egWD1J3Gv/z4IhaGMlg6/enQb0ZfkgjIOp1/96bFj
 D1y4DaUkImbxLxudF0y5XkMvRf/t4Jm2xUtbpO9uxQssvnE46J8WxW4gXTfH0IX+qvEd
 s3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3x7Ry8XzKgFIbFuudGzeQAF0OLQQLlGzKNO2Zn22HVk=;
 b=n6fOyHxkeexSBI/8JMJQAHvEE6Il6wM/Z0np+vQUujxNXxP8+on1gqd8VUNBVpQHEO
 K+fkmkTnuXuUM6x/CPcYdsND7uhMfJU56ik9vDSmhMKgwwJSP8OYZQj8UC3Ctqz1J5P0
 4AmB7DbCn9WKNh6dgDnxiUgNa+FdLAazO4JELqlfwNLD8SCfb8MgW1e25/iODNzv2k0t
 E7DJtmSG2lj6piZORRUWCTX55AhmAF2ADhZiKKuT4oUZHQ0yUYk1+rFhqmRlJJPDs+I6
 uAcquXo1jSczzKXMKVWdjsnIl4cOKYvUnXWsdnURU+gwiJFFAcR+palLg3ytDXZuAMLX
 E+JA==
X-Gm-Message-State: ANhLgQ3FkYhSyHe44CqAQkpDiUQFKBQZoWlzaxo6mYb5wbQOIK9g81ph
 2vjtDqVv7BIuOi4P8u/MQZQylDgRftzKonSg4YEsPw==
X-Google-Smtp-Source: ADFU+vv1CBBSFOBch8JzMfYyi5mAhSb5sNgGKCGzriZTlTepUVTK3bEE1Wtc+Ckf49GBksnGRCvwArNRuRMP9DwVcQ4=
X-Received: by 2002:a1c:a102:: with SMTP id k2mr8052697wme.125.1584688885253; 
 Fri, 20 Mar 2020 00:21:25 -0700 (PDT)
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
Date: Fri, 20 Mar 2020 16:21:14 +0900
Message-ID: <CAAfxs75F6mcX_qHPYLzCbudeONXkSCOqNcXGRR4o+bgMDZ_VxQ@mail.gmail.com>
To: BAndViG <bandvig@mail.ru>
Subject: [OpenRISC] Fpu tininess
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
Content-Type: multipart/mixed; boundary="===============7127272366049056646=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============7127272366049056646==
Content-Type: multipart/alternative; boundary="00000000000015cd9f05a14422c9"

--00000000000015cd9f05a14422c9
Content-Type: text/plain; charset="UTF-8"

Hi Andrey,

Thanks for replying to the question about fusesoc.

I've been meaning to ask you a question about our fpu implementation.
Currently for glibc most  floating point math routines use 64-bit double
precision.  Anything not handled by the architecture is emulated.

I have written the emulation patches but the tests are having issues with
underflow flags being incorrectly set sometimes.

I have a hunch it may be due to my tininess setting.   Do you know what we
should set for:

_FP_TININESS_AFTER_ROUNDING

?

The glibc patch
https://github.com/openrisc/or1k-glibc/commit/4748177bdde92846974fc8ec523d212d6db74aa0

The gcc patch
https://github.com/stffrdhrn/gcc/commit/8e99e252edc130162b6d2d7bdef2180305389053

--00000000000015cd9f05a14422c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Andrey,<div dir=3D"auto"><br></div><div dir=3D"auto">T=
hanks for replying to the question about fusesoc.=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">I&#39;ve been meaning to ask you a question=
 about our fpu implementation.=C2=A0 Currently for glibc most=C2=A0 floatin=
g point math routines use 64-bit double precision.=C2=A0 Anything not handl=
ed by the architecture is emulated.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I have written the emulation patches but the tests are having i=
ssues with underflow flags being incorrectly set sometimes.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I have a hunch it may be due to my ti=
niness setting.=C2=A0 =C2=A0Do you know what we should set for:</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><span style=3D"color:rgb(111,66,193=
);font-family:sfmono-regular,consolas,&quot;liberation mono&quot;,menlo,mon=
ospace;font-size:12px;white-space:pre;background-color:rgb(230,255,237)">_F=
P_TININESS_AFTER_ROUNDING</span><br></div><div dir=3D"auto"><span style=3D"=
color:rgb(111,66,193);font-family:sfmono-regular,consolas,&quot;liberation =
mono&quot;,menlo,monospace;font-size:12px;white-space:pre;background-color:=
rgb(230,255,237)"><br></span></div><div dir=3D"auto"><span style=3D"color:r=
gb(111,66,193);font-family:sfmono-regular,consolas,&quot;liberation mono&qu=
ot;,menlo,monospace;font-size:12px;white-space:pre;background-color:rgb(230=
,255,237)">?</span></div><div dir=3D"auto"><br></div><div dir=3D"auto">The =
glibc patch</div><div dir=3D"auto"><a href=3D"https://github.com/openrisc/o=
r1k-glibc/commit/4748177bdde92846974fc8ec523d212d6db74aa0" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/openrisc/or1k-glibc/comm=
it/4748177bdde92846974fc8ec523d212d6db74aa0</a><br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">The gcc patch</div><div dir=3D"auto"><a href=3D=
"https://github.com/stffrdhrn/gcc/commit/8e99e252edc130162b6d2d7bdef2180305=
389053" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
stffrdhrn/gcc/commit/8e99e252edc130162b6d2d7bdef2180305389053</a><br></div>=
</div>

--00000000000015cd9f05a14422c9--

--===============7127272366049056646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============7127272366049056646==--
