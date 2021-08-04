Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD0B3DFA70
	for <lists+openrisc@lfdr.de>; Wed,  4 Aug 2021 06:32:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 162A723CD1;
	Wed,  4 Aug 2021 06:32:09 +0200 (CEST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mail.librecores.org (Postfix) with ESMTPS id 2991D23CD1
 for <openrisc@lists.librecores.org>; Wed,  4 Aug 2021 06:32:07 +0200 (CEST)
Received: by mail-lf1-f42.google.com with SMTP id g13so2196826lfj.12
 for <openrisc@lists.librecores.org>; Tue, 03 Aug 2021 21:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mugNXGU8m6ufGC70FIqT0qui08bjVorzDkGy+EZ+/p0=;
 b=ZiDe7j9n3rubNDbe/70yIBl6Bb5crU07AnvHovWMyjbs4LFo5ezR1r8y1hBztVXK6+
 xpwwPIL8uZN3+glW0jVRa6tlwlME6xTaEOjSPn7rq3CRaI/up33CIvijUkaxKn9IFtLH
 Om+irlhvYcto0YI8kaIf+xKjmoksc3Y5mTXOPL6yCIP6niSXKzGuMzwWWbHt2YK/iV7u
 PwunLJN23I0sn8J20Qks5IxtkUrL0IRQ/9RBJX8+RaDQvmmR+CO3OcQJidfWrJMQ7DCE
 zgRFXCIrk61bHinLiYc/HZfVmfTEJ2rmw5IJ9S2giheT5Oyq94wmiDTsYiYrhjD5+KEw
 7K0Q==
X-Gm-Message-State: AOAM532QORrVP7xLa4B8jXn0wU+xGhRStTgz1V0ci2J8/lJYp5sF2GIv
 JYKtkQqQVtjwNjqzegvLCig6gMDU6aJ4tc9qOxM=
X-Google-Smtp-Source: ABdhPJxkjtadGB7TIcvAAeEZH5qwsWzwYMri41iD62Q6bIgZkg+VmqpjQAjMZfob+mUSx/Hp+eKVP1KwR5+3XJu/bN8=
X-Received: by 2002:ac2:511a:: with SMTP id q26mr11544539lfb.521.1628051526233; 
 Tue, 03 Aug 2021 21:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
In-Reply-To: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Date: Wed, 4 Aug 2021 07:31:55 +0300
Message-ID: <CADzBsGPE=YaKcR9_37iPHk=hwapDar1tV8mkxudmh1v6H4j+EA@mail.gmail.com>
To: Julius Baxter <juliusbaxter@gmail.com>
Subject: Re: [OpenRISC] mor1kx licensing
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
Cc: Stefan Wallentowitz <stefan.wallentowitz@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============4006082583452664766=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4006082583452664766==
Content-Type: multipart/alternative; boundary="000000000000e5b13f05c8b448b1"

--000000000000e5b13f05c8b448b1
Content-Type: text/plain; charset="UTF-8"

I'm in favor, and I agree that CERN-OHL-W sounds like the right flavor.

On Wed, Aug 4, 2021 at 6:50 AM Julius Baxter <juliusbaxter@gmail.com> wrote:

> Hello fellow mor1kx developers,
>
> I've been meaning to do this for a while, but I'd like to propose we
> switch the licence of the mor1kx to the CERN OHL v2, and then I can EOL the
> OHDL.
>
> There are 3 types of the OHL v2 licence, basically 1) strongly reciprocal,
> 2) weakly reciprocal, and 3) permissive.
>
> In the spirit of the OHDL the mor1kx is currently licensed under, I'd
> suggest we go with the weakly-reciprocal licence, the CERN-OHL-W.
>
> The OHWR site has a nice FAQ describing the difference between these v2
> flavours:
> https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-these-suffixes
>
> The idea behind the OHDL was that it'd be file-level copyleft, just like
> the MPL (or at least as I interpreted it) it was based on (via m-x
> query-replace in Emacs :-P ). I think it'd be good to back the work Javier
> and Andrew and Miriam have done with our own work.
>
> I'm copying the OpenRISC list because I guess I want to make sure any
> contributor from the past gets a heads up, too.
>
> This is the first time I've done something like this, so am not too
> familiar with the process. Should I just do a PR on github and we can
> debate it on there?
>
> Anyway, I'm interested in your thoughts. Feel free to contact me off list
> if you prefer. Unless anyone objects, I'll do a PR relicensing the IP in
> the coming week or so.
>
> Cheers,
> Julius
>

--000000000000e5b13f05c8b448b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m in favor, and I agree that CERN-OHL-W sounds like =
the right flavor.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 6:50 AM Julius Baxter &lt;<a =
href=3D"mailto:juliusbaxter@gmail.com">juliusbaxter@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">Hello fellow mor1kx developers,<div><br></div><div>I&#39;ve been meaning=
 to do this for a while, but I&#39;d like to propose we switch the licence =
of the mor1kx to the CERN OHL v2, and then I can EOL the OHDL.</div><div><b=
r></div><div>There are 3 types of the OHL v2 licence, basically 1) strongly=
 reciprocal, 2) weakly reciprocal, and 3) permissive.</div><div><br></div><=
div>In the spirit of the OHDL the mor1kx is currently licensed under, I&#39=
;d suggest we go with the weakly-reciprocal licence, the CERN-OHL-W.</div><=
div><br></div><div>The OHWR site has a nice FAQ describing the difference b=
etween these v2 flavours:</div><div><a href=3D"https://ohwr.org/project/cer=
nohl/wikis/faq#q-what-are-all-these-suffixes" target=3D"_blank">https://ohw=
r.org/project/cernohl/wikis/faq#q-what-are-all-these-suffixes</a><br></div>=
<div><br></div><div>The idea behind the OHDL was that it&#39;d be file-leve=
l copyleft, just like the MPL (or at least as I interpreted it) it was base=
d on (via m-x query-replace in Emacs :-P ). I think it&#39;d be good to bac=
k the work Javier and Andrew and Miriam have done with our own work.</div><=
div><br></div><div>I&#39;m copying the OpenRISC list because I guess I want=
 to make sure any contributor from the past gets a heads up, too.</div><div=
><br></div><div>This is the first time I&#39;ve done something like this, s=
o am not too familiar with the=C2=A0process.=C2=A0Should=C2=A0I just do a P=
R on github and we can debate it on there?</div><div><br></div><div>Anyway,=
 I&#39;m interested in your thoughts. Feel free to contact me off list if y=
ou prefer. Unless anyone objects, I&#39;ll do a PR relicensing the IP in th=
e coming week or so.</div><div><br></div><div>Cheers,</div><div>Julius</div=
></div>
</blockquote></div>

--000000000000e5b13f05c8b448b1--

--===============4006082583452664766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4006082583452664766==--
