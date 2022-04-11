Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 97F364FF68B
	for <lists+openrisc@lfdr.de>; Wed, 13 Apr 2022 14:16:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3C73A235F1;
	Wed, 13 Apr 2022 14:16:24 +0200 (CEST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mail.librecores.org (Postfix) with ESMTPS id 0AB8A22126
 for <openrisc@lists.librecores.org>; Mon, 11 Apr 2022 03:01:59 +0200 (CEST)
Received: by mail-ej1-f48.google.com with SMTP id bg10so27814725ejb.4
 for <openrisc@lists.librecores.org>; Sun, 10 Apr 2022 18:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=swwYRn4sQuTu8BAiQhLS1M5nn176wzwUNVL4PSfOccs=;
 b=RfCn+qCSkM9GU2kzYbexgAuf2V+kkDz2vHH5G98tfIVIJ+nF0MjKplJb8kxW39K7a8
 NeLno8+i0EWvMFiCrsl3N5luZYSID5xEpVQoU1tSGs4VjeAEPYBR5wa6YgI9hGmVAOZN
 9zLw7xlT6ePGTVOtEoKs3AmBuHfhjH7MNk642jNemxq6WqRsNuP2y5aAFrrkitwaURyV
 G0UXPcAY/t0ED6tTqnx1dBk2GpQjI1nQB3Kf3xwMF15+0JPkWSMjD9Nf+EZtJSg4bvoV
 4pP4jSAOwu6zdl9ESTrRMUaJHQD4ylq5RroC8xe3efPZTRmuvUNEnLWibLaSevD9zAlR
 ZnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=swwYRn4sQuTu8BAiQhLS1M5nn176wzwUNVL4PSfOccs=;
 b=Fs17US9uwMT/SBem/gW4dLvSlHLpAJ+75foN8+yy3b3gu08lLf63JxWBAquSJuY29l
 HjON2KRLdDo6ltdSuJhLumfwPiEnUAmIlnQRZp6nz+VILd/vpFdrDSyFFGBLbsJ7OEzE
 KDHAgcg9D9JspL76wAJ7oxWGBC/qZoUsO85XiEvAamW+TIl2El5nkDSw51ClPa2xKH5o
 pC7lLfDd/DDD+598xMDaVTeZEBoz9kSqv2EGnIv9itQ8KKk58GjjdGb1o3L/0y7TZXot
 vdoNDohd26qjDb14d9rlnsHHp96IsystQhoZXbBFbA8QeFKJl4G5BxANT5kT6vwsw8uw
 A5/Q==
X-Gm-Message-State: AOAM5303WuZY4VxCSlqZbopy8sjTdvsvamOOoH4q5lE96rXqzsjWYbOg
 OtLzCnPmDroDZe9yrVqcYCbp6grzFQE4lfo+vphmdP0a80I=
X-Google-Smtp-Source: ABdhPJxoFvV7YvXgr8UHYlctqFW7sQqkVwTs+HUsL8UjwnDuX0m4zEk3/0KnGdg48I1WnGrIQZ2XPE7FvgowSKAJf8s=
X-Received: by 2002:a17:907:1c19:b0:6e8:322f:cdd7 with SMTP id
 nc25-20020a1709071c1900b006e8322fcdd7mr17838627ejc.493.1649638918576; Sun, 10
 Apr 2022 18:01:58 -0700 (PDT)
MIME-Version: 1.0
From: Robert Finch <robfi680@gmail.com>
Date: Sun, 10 Apr 2022 21:01:56 -0400
Message-ID: <CAOkYDM+3gwtprv87SzZaiZ+bkhe5Vc3SZ-txTzrxjR_9SHKW9Q@mail.gmail.com>
To: openrisc@lists.librecores.org
X-Mailman-Approved-At: Wed, 13 Apr 2022 14:16:23 +0200
Subject: [OpenRISC] Tomasulo's Core
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
Content-Type: multipart/mixed; boundary="===============3853314898377205875=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============3853314898377205875==
Content-Type: multipart/alternative; boundary="000000000000bfdc9b05dc567d24"

--000000000000bfdc9b05dc567d24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I have been perusing the OpenRISC site and studying the OpenRISC
design. I read a comment about the lack of out-of-order cores and thought
people may be interested in the one I am working on. It is not really ready
for prime-time yet. It is located in Github at
https://github.com/robfinch/Thor/tree/main/Thor2022

It is another core using a version of Tomasulo=E2=80=99s Algorithm.

I was glad to see the OpenRISC design make branch delay slots optional. Is
there a way to set a true/ false value in a register using a set
instruction? OpenRISC looks like an excellent design. I am interested in
64/128 bit though. 128-bit decimal floating-point.


Robert Finch

--000000000000bfdc9b05dc567d24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal">Hi, I have been pe=
rusing the OpenRISC site and studying the OpenRISC
design. I read a comment about the lack of out-of-order cores and thought p=
eople
may be interested in the one I am working on. It is not really ready for
prime-time yet. It is located in Github at <a href=3D"https://github.com/ro=
bfinch/Thor/tree/main/Thor2022">https://github.com/robfinch/Thor/tree/main/=
Thor2022</a><span></span></p>

<p class=3D"MsoNormal">It is another core using a version of Tomasulo=E2=80=
=99s Algorithm.<span></span></p>

<p class=3D"MsoNormal">I was glad to see the OpenRISC design make branch de=
lay
slots optional. Is there a way to set a true/ false value in a register usi=
ng a
set instruction? OpenRISC looks like an excellent design. I am interested i=
n
64/128 bit though. 128-bit decimal floating-point.<span></span></p><p class=
=3D"MsoNormal"><br></p><p class=3D"MsoNormal">Robert Finch</p></div></div>

--000000000000bfdc9b05dc567d24--

--===============3853314898377205875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============3853314898377205875==--
