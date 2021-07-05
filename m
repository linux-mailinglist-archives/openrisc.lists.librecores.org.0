Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 436C23BC3CD
	for <lists+openrisc@lfdr.de>; Tue,  6 Jul 2021 00:03:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E4C1A20417;
	Tue,  6 Jul 2021 00:03:55 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 4F99420417
 for <openrisc@lists.librecores.org>; Tue,  6 Jul 2021 00:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625522632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUzWXmZmr0GsJOGnb4VnyzQTYIBkFxRndxigZFEUVho=;
 b=bsimShZPH1Mf4MAJTEKfb1GPB1HWb90oA2xZG1ISIj997HjK6n/HvtfZc2FkFhPL5UT4D4
 7UwE7KEsL3UDsvyiGaktum15IyhOKLItBZn1Q0ximrF6yJP3iCuwrxd3x6tLbCDpZXASX3
 WCnTm+XPlYXQDt6yvpCY/45kH4p7YtA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-76B2bLGaNy2U2azqK9Ri6g-1; Mon, 05 Jul 2021 18:03:50 -0400
X-MC-Unique: 76B2bLGaNy2U2azqK9Ri6g-1
Received: by mail-pg1-f200.google.com with SMTP id
 m2-20020a6562c20000b029022885db5d8fso7179665pgv.12
 for <openrisc@lists.librecores.org>; Mon, 05 Jul 2021 15:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUzWXmZmr0GsJOGnb4VnyzQTYIBkFxRndxigZFEUVho=;
 b=hbJsv1JN0BN0a+QJ8QI4WtLcN6ZEu0VIlsasdWZ1ws8IQRGvhooPTe2AVwkg8vruLa
 oJrjBz7sGdVabdkQf/j64K+FuvbRFlUq6zBdZ2O0MQgBQ7pw00J+OwzGr3fhZPpqIEh0
 uc2jnWJOd5Izf4SiN7CP8Lo+Ie0o/nCDJ7uCjRemRGBah3C3e+t7ekmrIO6HQyTcg722
 Shnq+nQ4Oqt1p9qPXaMQX0iQ/dZc2Y+IbnuEi4O91jchXL46yBcHnjq83JE9TjzrszST
 nlutk6lTDlWI8Pzdrnrby1r0azujCujsaEMjP80zJW7B1Ayj2NsIzymtqx5BaUE6sXQU
 OJog==
X-Gm-Message-State: AOAM533k7KPejO7PsRRcv/6FN1pFGesSwFuh3FEgdqrImrUVVBogm/4c
 8thauugYRpYR44SQTVcZE8r7HZ33MImSIKSRguxDQeScOZlfy7pv2RYy5OQZM+kpayac7AvhDIw
 a9o2yEgCGNYRgiQWZkMpNYGyFgabXf1zdJMvVrGwqKA==
X-Received: by 2002:aa7:8c41:0:b029:319:f69c:93b4 with SMTP id
 e1-20020aa78c410000b0290319f69c93b4mr14481528pfd.11.1625522629680; 
 Mon, 05 Jul 2021 15:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaQjP0yjZJPH0XdzTfLbV5SoHsJy5ZTqGCd+HFhW3DlAbALDgAx9EZW8JyveZPlsKA2VceSJ6mw7ZSW2G47GY=
X-Received: by 2002:aa7:8c41:0:b029:319:f69c:93b4 with SMTP id
 e1-20020aa78c410000b0290319f69c93b4mr14481515pfd.11.1625522629457; Mon, 05
 Jul 2021 15:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210701231748.1098623-1-shorne@gmail.com>
 <CAOox84vC8qfYVufYN+9yCiQtt=hJRfhz=Q_xczF8W5zvGq4Z+A@mail.gmail.com>
 <YON3v1bM0J4r9AzE@antec>
In-Reply-To: <YON3v1bM0J4r9AzE@antec>
From: Jeff Johnston <jjohnstn@redhat.com>
Date: Mon, 5 Jul 2021 18:03:38 -0400
Message-ID: <CAOox84vBu1=ZPnq9v-8oN_-K=BDw6v0MTEhGhAwfV+Vt=+q_Pg@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jjohnstn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [OpenRISC] [PATCH] libgloss/or1k: Correct the IMMU SXE and UXE
 flags
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
Cc: Newlib <newlib@sourceware.org>, Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============6185563798733935979=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============6185563798733935979==
Content-Type: multipart/alternative; boundary="000000000000e74c0005c6677ae8"

--000000000000e74c0005c6677ae8
Content-Type: text/plain; charset="UTF-8"

Hi Stafford,

It's not you, it's on my side with gmail..  It often distorts git patches
unless they are attachments.

Anyway, patch applied and pushed to master.

Regards,

-- Jeff J.

On Mon, Jul 5, 2021 at 5:21 PM Stafford Horne <shorne@gmail.com> wrote:

> On Mon, Jul 05, 2021 at 04:59:27PM -0400, Jeff Johnston wrote:
> > Hi Stafford,
> >
> > Please resend with the patch as an attachment.
> >
> > Thanks,
>
> Alright,
>
> I hope it't OK in a reply here.  I usually send patches using git
> send-email, is
> this something new for newlib?
>
> Please find attached
>
> -Stafford
>

--000000000000e74c0005c6677ae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Stafford,</div><div><br></div><div>It&#39;s not yo=
u, it&#39;s on my side with gmail..=C2=A0 It often distorts git patches unl=
ess they are attachments.</div><div><br></div><div>Anyway, patch applied an=
d pushed to master.</div><div><br></div><div>Regards,<br></div><div><br></d=
iv><div>-- Jeff J.<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 5:21 PM Stafford Horne=
 &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jul 05, 20=
21 at 04:59:27PM -0400, Jeff Johnston wrote:<br>
&gt; Hi Stafford,<br>
&gt; <br>
&gt; Please resend with the patch as an attachment.<br>
&gt; <br>
&gt; Thanks,<br>
<br>
Alright,<br>
<br>
I hope it&#39;t OK in a reply here.=C2=A0 I usually send patches using git =
send-email, is<br>
this something new for newlib?<br>
<br>
Please find attached<br>
<br>
-Stafford<br>
</blockquote></div>

--000000000000e74c0005c6677ae8--


--===============6185563798733935979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============6185563798733935979==--

