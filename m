Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6E13C5BB66
	for <lists+openrisc@lfdr.de>; Mon,  1 Jul 2019 14:22:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5D08A2030D;
	Mon,  1 Jul 2019 14:22:19 +0200 (CEST)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by mail.librecores.org (Postfix) with ESMTPS id 3278320302;
 Mon,  1 Jul 2019 14:22:18 +0200 (CEST)
Received: by mail-ed1-f66.google.com with SMTP id z25so23190249edq.9;
 Mon, 01 Jul 2019 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PUSrzW3pUJHI27DtXR2PUIAcnT28FZpeyrwLbFyBaoo=;
 b=aABJCDtTS5vPnn3tNzZ247qkd9B0GMHqfWMwNW64kBJDmDNjWRQCZHBtVHBGx7OQFK
 cSU+tQVWhSWuwe2qD36DudW8VsEHhq9IYIs0KubaQC4ENgYFF/xhLCTG3ulYjQtFBsck
 ONM/klMPwO3tw5v7DUMM1lxfHFlYcEYkgp1UuYaBKqZ/Uas34dk/cfifomKsxlv1nfjL
 AQ1oI9jag3GrlnnonkkMGIsYQbmLFblqO/itStVvf1VsAbR2T/AsHGrkgdniNU/emkPC
 cTmgMraw8BpRmBUiHnvF66lysrlmOgEsBl/yLV5bPXelHB65YMmJ8GYr339Flj8EesIb
 k+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PUSrzW3pUJHI27DtXR2PUIAcnT28FZpeyrwLbFyBaoo=;
 b=mp99IeAr+yi0uUNFlNVF7pBKwua3G03ZzLmrKwPC8IG75qBkkOPsoX/rTJNGdwunIF
 fu4k55OSxgO2px728TDFKp8XZsLvVVpMRStqWENcdPCvAY03RRtODOWvFVQqU+TjCfid
 6rQd8esN4YuhwZIepuo90/+gKViKF85y7dKY2zA9LcChCwjox4bu9R5DcyPK/9nKhnTD
 YatvDVmyxweQ40gYWSMSdTMqFDOwsaLPA4LP7b/20B95e/5eMiW/PNR6reC3cUXlrfoj
 aagBuVVxV6EgMU0rmlHtj7qqK8I30WPjjOHdgRkT9ivo90EeRYWaxH668kvyrSSLvYr3
 4/Bg==
X-Gm-Message-State: APjAAAUQ4JlrvL6dNJH9JH0WwxgyxsqTyEsPo4VWxwNVGYjvxcj+jxWH
 b2zyWGvTYz63qDGbv0l1ROjIIHKOsBWeoDGapFISvwxGe9A=
X-Google-Smtp-Source: APXvYqxiLtPkiBLjMz58OIl9eLMiF/UQNJ2IMFa3r8lAneZ8BmfFxff2dsazwHlxjODC6QoFYHDfS9DWdMGNrtSAOvA=
X-Received: by 2002:a17:906:45ce:: with SMTP id
 z14mr23003870ejq.144.1561983737373; 
 Mon, 01 Jul 2019 05:22:17 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Chauhan <nancychn1@gmail.com>
Date: Mon, 1 Jul 2019 17:52:06 +0530
Message-ID: <CAF69GoqLtjD3jySOto4Fu3N9PRb1Ji5CyNHK7ScYvv+bOeiYKg@mail.gmail.com>
To: openrisc@lists.librecores.org, discussion@lists.librecores.org
Subject: [OpenRISC] [GSoC 2019] Coding Phase 2 : Continuous Integration for
 Hardware Projects on LibreCores CI (Nancy Chauhan)
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
Cc: Oleg Nenashev <o.v.nenashev@gmail.com>
Content-Type: multipart/mixed; boundary="===============0258800171573867572=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============0258800171573867572==
Content-Type: multipart/alternative; boundary="000000000000cfa87d058c9dadc1"

--000000000000cfa87d058c9dadc1
Content-Type: text/plain; charset="UTF-8"

Hello all,

This mail is to summarize the plan for Coding phase 2 of GSoC 2019. I will
be working to Create CI for Yosys synthesis
<http://www.clifford.at/yosys/>required
for monitoring resource usages in mor1kx
<https://github.com/Nancy-Chauhan/mor1kx> and also might further extend CI
for Ysoys synthesis if possible for place and route (
https://github.com/YosysHQ/arachne-pnr
). The plan will be reached to work even on Creating CI for OpenOCD/GDB
 for CPU pipeline debugging in mor1kx  and extending Jenkinsfile (
https://github.com/openrisc/mor1kx/pull/84 ) in mor1kx to make Ysoys and
OpenOCD/GDB part of the build pipeline. It can be added to ci.librecores.org
so that Pull request builder runs for the repository mor1kx .
We can later  Detach reusable logic of mor1kx to
https://github.com/librecores/librecores-pipeline-lib
.

The question I have is whether should we keep all these new additions in
current Travis flow (
https://github.com/openrisc/mor1kx/blob/master/.travis.yml
) also ?


Thank you ,
Nancy Chauhan

Chats on : https://gitter.im/librecores/librecores-ci

--000000000000cfa87d058c9dadc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all, <br><br>This mail is to summarize the plan for =
Coding phase 2 of GSoC 2019. I will be working to Create CI for <a href=3D"=
http://www.clifford.at/yosys/ ">Yosys synthesis </a>required for monitoring=
 resource usages in <a href=3D"https://github.com/Nancy-Chauhan/mor1kx">mor=
1kx</a> and also might further extend CI for Ysoys synthesis if possible fo=
r place and route ( <a href=3D"https://github.com/YosysHQ/arachne-pnr">http=
s://github.com/YosysHQ/arachne-pnr </a>). The plan will be reached to work =
even on Creating CI for OpenOCD/GDB =C2=A0for CPU pipeline debugging in mor=
1kx =C2=A0and extending Jenkinsfile (<a href=3D"https://github.com/openrisc=
/mor1kx/pull/84">https://github.com/openrisc/mor1kx/pull/84</a>=C2=A0) in m=
or1kx to make Ysoys and OpenOCD/GDB part of the build pipeline. It can be a=
dded to<a href=3D"http://ci.librecores.org"> ci.librecores.org</a> so that =
Pull request builder runs for the repository mor1kx .=C2=A0<div>We can late=
r =C2=A0Detach reusable logic of mor1kx to <a href=3D"https://github.com/li=
brecores/librecores-pipeline-lib">https://github.com/librecores/librecores-=
pipeline-lib </a>.<br><div><br></div><div>The question I have is whether sh=
ould we keep all these new additions in current Travis flow ( <a href=3D"ht=
tps://github.com/openrisc/mor1kx/blob/master/.travis.yml">https://github.co=
m/openrisc/mor1kx/blob/master/.travis.yml </a>) also ?<br></div><div><br></=
div><div><br></div><div>Thank you ,<br></div><div>Nancy Chauhan</div></div>=
<div><br></div><div>Chats on :=C2=A0<a href=3D"https://gitter.im/librecores=
/librecores-ci">https://gitter.im/librecores/librecores-ci</a>=C2=A0<br></d=
iv></div>

--000000000000cfa87d058c9dadc1--

--===============0258800171573867572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0258800171573867572==--
