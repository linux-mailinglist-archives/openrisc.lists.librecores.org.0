Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DEE443E8A3B
	for <lists+openrisc@lfdr.de>; Wed, 11 Aug 2021 08:31:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7E766210E3;
	Wed, 11 Aug 2021 08:31:33 +0200 (CEST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mail.librecores.org (Postfix) with ESMTPS id 2895620417
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 16:40:26 +0200 (CEST)
Received: by mail-yb1-f179.google.com with SMTP id z5so34824871ybj.2
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=o8V+K4ppScopuCZBe72HWUzhCyjrxRlwwS1aT33na7U=;
 b=kbDKMdzoD3kdTo+HdZIC9Mit9Sj9d2nu4p9I0r8LlMpG6hErou1U0XT2WfEfvikwyv
 wV+Y2hF0EYsxJmNpPxes1TCK13dAsRzbAbRazkIlGE2+URTWIDkjNig2opzYriVnDxPD
 iGUIUOWtU7EgjAgMEVRQ2GlCbDdyX/4IOM7x1eGVqLI4aGcLbN5gy81PyKIa7UtuTm8V
 XcDho6hsXuVQVNsUnkBfxBy+/3GNYKtchxG0CV590bD1Tdz7P8sAsZndj5F38JDvXJr8
 6oWN4gTyyOuJ1+GjAvZc+YbwNSFUtAMNyJCcpVU9IhFVbWAM8YvK5roU6W/+MQdRw7Os
 hf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=o8V+K4ppScopuCZBe72HWUzhCyjrxRlwwS1aT33na7U=;
 b=UnTnDNEhM5+sbXelG75+8MLxHUUXymBfRpYqFA5Nw5aI7yCrcVHzGKUleIZn2x8WhF
 Ui8L6hpR976LpHa/ELyQxdsxCDRKbUxhvdgOLHz0qNdoBGmdTHuNHEyLUzwi0pbQCZsK
 lYE5GAy8NRboVr8+BXT/twJvBUrmU9ADNgpOSinlAj2KCUvtOkd2PjK2QsInqSbNDi+d
 8WEGDn3g40Luwc9dV6VoVe7mION6Hdkhcqm8RsPvFX/tZ4Lnf7vhiqiJp/B8p/JMgz+k
 wOaIqC1y2XSJPKrXszKgrPN+K65saESFIua/vsdT0SiVLX3bHgUsO7D5ZmwEcLGT4zzX
 b9EA==
X-Gm-Message-State: AOAM533UNP69DhV0Oks8zrBySrwuxxPxbHJL5rWY0pFQQvfGRzWucwxL
 2rG/D1B5HIvyln1JbsZcAQDo9MKCj8mPxLBVidXMhj2XwQs=
X-Google-Smtp-Source: ABdhPJz+LcpIbWrmaCQDw3dfFDtdafLXfsw/zJm/DpbBpEdT5+NiUwgrHzCp3ZvxyxOlWdS6a/PMpnzhe2xru1o8Mzs=
X-Received: by 2002:a25:26c3:: with SMTP id
 m186mr39617436ybm.293.1628606424859; 
 Tue, 10 Aug 2021 07:40:24 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Gutson <danielgutson@gmail.com>
Date: Tue, 10 Aug 2021 11:40:14 -0300
Message-ID: <CAFdMc-3=EpEfW+in+-SWuiaKqyQ_3r6Qb08SvWD9GiEsRFCYpg@mail.gmail.com>
To: openrisc@lists.librecores.org
X-Mailman-Approved-At: Wed, 11 Aug 2021 08:31:32 +0200
Subject: [OpenRISC] Damjan Lampret
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
Content-Type: multipart/mixed; boundary="===============1699270631732414966=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============1699270631732414966==
Content-Type: multipart/alternative; boundary="0000000000006ec83005c9357b0b"

--0000000000006ec83005c9357b0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

    Sorry to post this here, I'm looking for Damjan Lampret to invite him
to an academic talk, but I can't find
any email or profile. If somebody here knows him, could you please help me
to contact him?

Thanks,

    Daniel.

--=20
Who=E2=80=99s got the sweetest disposition?
One guess, that=E2=80=99s who?
Who=E2=80=99d never, ever start an argument?
Who never shows a bit of temperament?
Who's never wrong but always right?
Who'd never dream of starting a fight?
Who get stuck with all the bad luck?

--0000000000006ec83005c9357b0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>=C2=A0 =C2=A0 Sorry to post this he=
re, I&#39;m looking for Damjan Lampret to invite him to an academic talk, b=
ut I can&#39;t find</div><div>any email or profile. If somebody here knows =
him, could you please help me to contact him?</div><div><br></div><div>Than=
ks,</div><div><br></div><div>=C2=A0 =C2=A0 Daniel.<br clear=3D"all"><div><b=
r></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature">Who=E2=80=99s got the sweetest disposition?<br>One guess,=
 that=E2=80=99s who?<br>Who=E2=80=99d never, ever start an argument?<br>Who=
 never shows a bit of temperament?<br>Who&#39;s never wrong but always righ=
t?<br>Who&#39;d never dream of starting a fight?<br>Who get stuck with all =
the bad luck? </div></div></div>

--0000000000006ec83005c9357b0b--

--===============1699270631732414966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1699270631732414966==--
