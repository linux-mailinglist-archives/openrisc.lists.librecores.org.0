Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 28C593FCCED
	for <lists+openrisc@lfdr.de>; Tue, 31 Aug 2021 20:21:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6A76F240E1;
	Tue, 31 Aug 2021 20:21:57 +0200 (CEST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mail.librecores.org (Postfix) with ESMTPS id 1146E22C28
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 20:21:55 +0200 (CEST)
Received: by mail-io1-f45.google.com with SMTP id a13so26214367iol.5
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iZ0jFNQDxj5Z2WDvlfRElFoFZcZVr0EDbgrrOWbfGew=;
 b=sM593gzMCgzMuBWm7WwUL2rJBoW0aOajjJRdbg/GKxsrpx2pPHcQy/VGY2zLNv3uZj
 IfeVVjTKEhQ4j1YeQjgF14SYO9qoASg+yspqeietfF+b1IyiwsxFRAbhB/oCNnGb5IJ9
 yQ176mUbHDr3M6jlz/3SFa5c0hKNgBGCEWZXf6DFsGHKWIUuoUZmIHg4A1A/yJKuRL/1
 GrGF8ro6fUKfQOMEJuWMmk9/fR8AoQvKpDHFpTRG+KxHfIyzL8dQXiNUMHlbaBGcWKFm
 4+2dd31KZMJgCuG78gJsxikW8r6bQRTG4/hfX6j8h7UhtjkpW60WC4ZSsqCiGcRXqZBq
 vUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iZ0jFNQDxj5Z2WDvlfRElFoFZcZVr0EDbgrrOWbfGew=;
 b=VMg3K2EI61ogW/4CX3kd7dRO2mhsQE1JypN2dYffFwM/b46aqZPS/3AUSvJql666HV
 vrfKmE9hYB1RCOtFF+nDArVCwkI2yqafzl2dJmEEU1p6r5eipUchd6+vxiE3POJ1ACrM
 A9cia7Ox2IofHhwB4Hjbv4r6eiwjoCLjsz/B91p/X88K0b6JGuO5iPuNKObbAbIcdLVt
 jQPFoHi9v930coEPSIu1DMgctbKNghBsVMOckYg8KsgLq04vzxGY04YkYI04XKcqrh5U
 4OPICHm5vHq/VfKOzDuT+EASYi4ZuKMDycB0YFyhvIMR6AwhMFp+6mVO5BLhhmiDKcxN
 1znw==
X-Gm-Message-State: AOAM530R9cSszHMzZ4K4ocEQ2BQ1LpClFGrlf88/1b5/q+N6YJB3b6Vv
 1DdlUxXJnW0vxltARTXd7YX+QAX5P6YfMIaV3fEuGTRxwAc8Xw==
X-Google-Smtp-Source: ABdhPJzwokCFdlEYaHz7HS5eTh0SkVpu6s3h4jNkoksSsnR2iTTh9PI1uu9u6l66xpIEFY6B5ekraYilBPrGOfahY94=
X-Received: by 2002:a6b:f214:: with SMTP id q20mr24220572ioh.84.1630434113869; 
 Tue, 31 Aug 2021 11:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
 <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
 <CAAfxs769RLG-qTuezZYiv+Pze-sqxRAokw6pT3ecYrpn8Len4g@mail.gmail.com>
 <3353f448aa67d1d6bf61eaa37256c90d1377bb74.camel@ieee.org>
 <CADGJwMyrBUCb8gLbDZpCgor0BTV5Ouy1N8v=2Dua7cueg=iVfg@mail.gmail.com>
 <7daf0759c553ae00591bfbb9aae8fa88167a3916.camel@ieee.org>
In-Reply-To: <7daf0759c553ae00591bfbb9aae8fa88167a3916.camel@ieee.org>
From: Harshitha S <harshithasridhar172000@gmail.com>
Date: Tue, 31 Aug 2021 23:52:52 +0530
Message-ID: <CADGJwMxveP2gostx-QD2s+kV_cOLdBJzcLw_vb+o46g-KSG2tA@mail.gmail.com>
To: dgisselq@ieee.org, Openrisc <openrisc@lists.librecores.org>
Subject: Re: [OpenRISC] Continue OpenRISC contibution
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
Content-Type: multipart/mixed; boundary="===============2798297839692266878=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============2798297839692266878==
Content-Type: multipart/alternative; boundary="0000000000002fdcc705cadf0695"

--0000000000002fdcc705cadf0695
Content-Type: text/plain; charset="UTF-8"

I couldn't figure out what's wrong with pycode, but replacing all "chparam
-set" with "hierarchy -chparam" runs without error.

Thanks, Dan, for pointing out this issue. I will correct it.

--0000000000002fdcc705cadf0695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I couldn&#39;t figure out what&#39;s wrong with pycode, bu=
t replacing all &quot;chparam -set&quot; with &quot;hierarchy -chparam&quot=
; runs without error.<div><br></div><div>Thanks, Dan, for pointing out this=
 issue. I will correct it.</div></div>

--0000000000002fdcc705cadf0695--

--===============2798297839692266878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============2798297839692266878==--
