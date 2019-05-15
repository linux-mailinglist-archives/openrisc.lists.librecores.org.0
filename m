Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AFE231E6F4
	for <lists+openrisc@lfdr.de>; Wed, 15 May 2019 04:54:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5E10B27979;
	Wed, 15 May 2019 04:54:47 +0200 (CEST)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by mail.librecores.org (Postfix) with ESMTPS id 3F2E1259F2
 for <openrisc@lists.librecores.org>; Wed, 15 May 2019 04:54:46 +0200 (CEST)
Received: by mail-ed1-f65.google.com with SMTP id w11so1914427edl.5
 for <openrisc@lists.librecores.org>; Tue, 14 May 2019 19:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AOvmB4EFoJqgskuznqOR+DCoHdLDC0c/dpVzSDqqHhk=;
 b=RwIxNUbCgwUeag/iO/WMTRqRlqedR0RwjE/PWPs0HqiWnVIyKyWA3m/ckHsrGSWGL5
 6jx3k1yVKCt4JECNLr1gtqYQkZo8E2e6Z9+/H/rRvOzhSkGlv8DRmYauqFBhsG4l9ny9
 vKfrhwskMHVdtS3cRPzQPxmADFiJt11dpx6rKRxETP2YrqrrfxlhCbwvyb95n7FePbYz
 6WWz/Sb1e+Z42L7NzjHpZMHa8EU7wg5RuK+Pq1jR/w/lIGtJraeV61Ow3xcYHz5LAjAJ
 VlHcqc8ScEYb12uZXIC8qFwmQNiDyBi4mjj00twED1e2LF7SmZtE9uGn4tvyQwISMG/c
 xo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AOvmB4EFoJqgskuznqOR+DCoHdLDC0c/dpVzSDqqHhk=;
 b=eFBQ6JH01yu/xZYUfgAj9/5EqRvQvlNhTU5q+VzitKSjUM5jKq0hIE3FbEGYUePylb
 WCAat0OT7WURLIv8p2v5f5p/MQTEegbt3ouJl5tlZ2nM5EhaW5OXh3IUJuN+zEcss7js
 ZYLg8JBuuGJZOPA3uLDyAYTxDDdoRTqhQmfbHoSXR5zHkJyWJO993B9i0JKu4x5n5BaU
 5dPU86+bofIwu5zT+/u+YQGxFafyFidsj7axU7J2uYn9FzeYP8nReztx43qu7oGVrr0w
 hTKYeWJ+TGB+V3M33yb7siWmBB+fybvMDg3cSNLuMpTWzjJB1VBKk/tjiRVTqqYZYo+E
 qXsw==
X-Gm-Message-State: APjAAAUIySzKr/p7LCoQgNOZodABykxDBOmR4Fdq2xzWwbc07pJMiJEX
 NA32L3SAPAZL5/bDX1Ed2o/8r5cHpwiWkOFNxEzr8zuEP50=
X-Google-Smtp-Source: APXvYqzFIvBaTCnnnjVw/llMvSOHuTMuHCVvfFZPP7xsH2q0+N584Lo+OVxlXvFAljv4TZY+F36FmBDUiMzzYL3SBos=
X-Received: by 2002:a17:906:c355:: with SMTP id
 ci21mr5826118ejb.202.1557888885424; 
 Tue, 14 May 2019 19:54:45 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Chauhan <nancychn1@gmail.com>
Date: Wed, 15 May 2019 08:24:33 +0530
Message-ID: <CAF69GorM-mvR-=v0x81f2xSAMU2eM39btii42DhqaDQ=dtHLRQ@mail.gmail.com>
To: openrisc@lists.librecores.org, Oleg Nenashev <o.v.nenashev@gmail.com>,
 shorne@gmail.com
Subject: [OpenRISC] GSoC 2019 Introduction : Continuous Integration for
 Hardware Projects on LibreCores CI
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
Content-Type: multipart/mixed; boundary="===============7762255150989411015=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============7762255150989411015==
Content-Type: multipart/alternative; boundary="0000000000009d84fa0588e44515"

--0000000000009d84fa0588e44515
Content-Type: text/plain; charset="UTF-8"

Hello Everyone ,

I am Nancy Chauhan <http://nancychauhan.in/> and I will be working on
Continuous
Integration for Hardware Projects on LibreCores CI
<https://summerofcode.withgoogle.com/projects/#4706542530592768>throughout
my summers as a Google Summer of Code Student Developer 2019 .

Librecores provides a platform to share projects and ideas, in the area of
free and open source digital hardware design. Librecores CI is an
approach/service to provide continuous integration to hardware projects
hosted on Librecores <https://www.librecores.org/> to improve user
experience and reliability. This project aims to provide automation service
for some hardware projects that have a constantly evolving code. Jenkins,
the automation server will be used to achieve the goals of the project.

For the first part of my project I will be mostly working on Setting up
demo CI flow for mor1kx project <https://github.com/openrisc/mor1kx>under
the guidance of mentors : Stafford Horne , Oleg Nenashev and Stefan
Wallentowitz . Looking forward towards an amazing summers !


Thanks
Nancy Chauhan

--0000000000009d84fa0588e44515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Everyone , <br></div><div><br>=
</div><div>I am <a href=3D"http://nancychauhan.in/">Nancy Chauhan</a> and I=
 will be working on <a target=3D"_self" class=3D"gmail-md-soc-theme" href=
=3D"https://summerofcode.withgoogle.com/projects/#4706542530592768">Continu=
ous Integration for Hardware Projects on LibreCores CI </a>throughout my su=
mmers as a Google Summer of Code Student Developer 2019 .</div><div><br></d=
iv><div>Librecores provides a platform to share projects and ideas, in the =
area=20
of free and open source digital hardware design. Librecores CI is an=20
approach/service to provide continuous integration
to hardware projects hosted on<a href=3D"https://www.librecores.org/"> Libr=
ecores</a> to improve user experience and
 reliability. This project aims to provide automation service for some=20
hardware projects that have a constantly evolving code.  Jenkins, the=20
automation server will be used to achieve the goals of the project.</div><d=
iv><br></div><div>For the first part of my project I will be mostly working=
 on=C2=A0Setting up demo CI flow for<a href=3D"https://github.com/openrisc/=
mor1kx"> mor1kx project </a>under the guidance of mentors : Stafford Horne =
, Oleg Nenashev and Stefan Wallentowitz . Looking forward towards an amazin=
g summers ! <br></div><div><br></div><div><br></div><div>Thanks <br></div><=
div>Nancy Chauhan<br> </div></div></div>

--0000000000009d84fa0588e44515--

--===============7762255150989411015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============7762255150989411015==--
