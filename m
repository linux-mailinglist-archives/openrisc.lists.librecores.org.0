Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 08C693F8277
	for <lists+openrisc@lfdr.de>; Thu, 26 Aug 2021 08:31:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 55A2624078;
	Thu, 26 Aug 2021 08:31:01 +0200 (CEST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by mail.librecores.org (Postfix) with ESMTPS id 0021520E43
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 08:30:59 +0200 (CEST)
Received: by mail-ot1-f54.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso2129785ott.13
 for <openrisc@lists.librecores.org>; Wed, 25 Aug 2021 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qglQUpJORr9WMvxZL415YffXthg600NysNg6Ig61w9U=;
 b=NaYd+2inoaPdQpVgTT80Hys8MOpl98HaL9SnHcuLqRGObjIbTCWLv38hFos2sDDaot
 4MXCVurz9a79odnul2QqrHSqX4CIV0ORpcLAC3cpeC+ZGEzO7tqWtinRLHv1XRFiB8Bj
 HGpN9Wgbfn504f4pHCG7iu8T4KF1nZIAbbgY0NBjwg6n9aIENqJUKe7YBTv3NVq21y3V
 3CytlTk72UweosWaIKH5942wZKD2Rs+zJNmpVYehjD7Kl4xcs8oZWM3IexGDMwDVbPf8
 WcDWfDXlQYuRvNNqrNEL6kn3uCMzce7TArxobC3HZkGL5lS77O7UbByxt6qB0jkUbn0z
 Qb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qglQUpJORr9WMvxZL415YffXthg600NysNg6Ig61w9U=;
 b=e3S7I4Bo05/16mjm5mTXUOfXkeqLcfnSYKRqXwgo0ShfcUjegvRue7s3YRqVtf1It8
 PVId7eWZxuGQHMGBeAGjH1if7Fjy1ODzOrxQf4ndwndb2rW0sXJctwzJxiGl9s0s5shK
 YVqvJN5gMEnyMHj7acbYvGHIQa79N80YM7GRwz4L2g1X0IJcmWJZQ12q6kr4grNYNAl1
 fsjqsjE4WEBgvk51ih5oIWJ4Wn/tPCveTs+NGxZo/E5XBTVo6UuvxWWMOr23G5243+8C
 s0WNZ1llGFKq2uUu65YBtsDnJvvNxrGz+6Kz2S52wEJCiOWagA9aitcYUHMTCCQZXKqZ
 eoEQ==
X-Gm-Message-State: AOAM533O+wWiv29GHET7SWhN+uA6y7KJqv6HJLvLgyupuPxyuT5zQ5IR
 MOhG0tJr0jz8zvqwBVx9yWSlzj5oQq0bzCNE9CI=
X-Google-Smtp-Source: ABdhPJyPGwgR9YfsTtS29fQ1DxtyA5r5YOGBdaD5otDIzaUAy6HqRQib9hP8KBWMC3My14L1h8d5dTtXbxVaoPf2dAc=
X-Received: by 2002:a9d:12e2:: with SMTP id g89mr1886811otg.112.1629959458703; 
 Wed, 25 Aug 2021 23:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
 <3d8e59ca-30f7-d61a-fc33-cf7cb203b113@embecosm.com>
In-Reply-To: <3d8e59ca-30f7-d61a-fc33-cf7cb203b113@embecosm.com>
From: Olof Kindgren <olof.kindgren@gmail.com>
Date: Thu, 26 Aug 2021 08:30:47 +0200
Message-ID: <CAKaYPCN2qj8USecNr5bbLiy2ps2kPujGw6ZeU2-kmE-BUsrPsg@mail.gmail.com>
To: Jeremy Bennett <jeremy.bennett@embecosm.com>
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============3986235353267704315=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============3986235353267704315==
Content-Type: multipart/alternative; boundary="00000000000088cc7005ca70824e"

--00000000000088cc7005ca70824e
Content-Type: text/plain; charset="UTF-8"

I think this makes a lot of sense and you have my blessing and permission
in case there is anything in the code with my copyright

//Olof

On Fri, Aug 6, 2021 at 2:22 PM Jeremy Bennett <jeremy.bennett@embecosm.com>
wrote:

> On 04/08/2021 04:50, Julius Baxter wrote:
> > Hello fellow mor1kx developers,
> >
> > I've been meaning to do this for a while, but I'd like to propose we
> > switch the licence of the mor1kx to the CERN OHL v2, and then I can EOL
> > the OHDL.
>
> Hi Julius,
>
> Not sure I ever contributed anything, but I am happy with this change
> and it applying to anything I did.
>
> Best wishes,
>
>
> Jeremy
>
> >
> > There are 3 types of the OHL v2 licence, basically 1) strongly
> > reciprocal, 2) weakly reciprocal, and 3) permissive.
> >
> > In the spirit of the OHDL the mor1kx is currently licensed under, I'd
> > suggest we go with the weakly-reciprocal licence, the CERN-OHL-W.
> >
> > The OHWR site has a nice FAQ describing the difference between these v2
> > flavours:
> > https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-these-suffixes
> > <
> https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-these-suffixes>
> >
> > The idea behind the OHDL was that it'd be file-level copyleft, just like
> > the MPL (or at least as I interpreted it) it was based on (via m-x
> > query-replace in Emacs :-P ). I think it'd be good to back the work
> > Javier and Andrew and Miriam have done with our own work.
> >
> > I'm copying the OpenRISC list because I guess I want to make sure any
> > contributor from the past gets a heads up, too.
> >
> > This is the first time I've done something like this, so am not too
> > familiar with the process. Should I just do a PR on github and we can
> > debate it on there?
> >
> > Anyway, I'm interested in your thoughts. Feel free to contact me off
> > list if you prefer. Unless anyone objects, I'll do a PR relicensing the
> > IP in the coming week or so.
> >
> > Cheers,
> > Julius
> >
> > _______________________________________________
> > OpenRISC mailing list
> > OpenRISC@lists.librecores.org
> > https://lists.librecores.org/listinfo/openrisc
> >
>
>
> --
> Cell: +44 (7970) 676050
> SkypeID: jeremybennett
> Twitter: @jeremypbennett
> Email: jeremy.bennett@embecosm.com
> Web: www.embecosm.com
> PGP key: 1024D/BEF58172FB4754E1 2009-03-20
>
> _______________________________________________
> OpenRISC mailing list
> OpenRISC@lists.librecores.org
> https://lists.librecores.org/listinfo/openrisc
>

--00000000000088cc7005ca70824e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this makes a lot of sense and you have my ble=
ssing and permission in case there is anything in the code with my copyrigh=
t</div><div><br></div><div>//Olof<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 6, 2021 at 2:22 PM J=
eremy Bennett &lt;<a href=3D"mailto:jeremy.bennett@embecosm.com">jeremy.ben=
nett@embecosm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 04/08/2021 04:50, Julius Baxter wrote:<br>
&gt; Hello fellow mor1kx developers,<br>
&gt; <br>
&gt; I&#39;ve been meaning to do this for a while, but I&#39;d like to prop=
ose we<br>
&gt; switch the licence of the mor1kx to the CERN OHL v2, and then I can EO=
L<br>
&gt; the OHDL.<br>
<br>
Hi Julius,<br>
<br>
Not sure I ever contributed anything, but I am happy with this change<br>
and it applying to anything I did.<br>
<br>
Best wishes,<br>
<br>
<br>
Jeremy<br>
<br>
&gt; <br>
&gt; There are 3 types of the OHL v2 licence, basically 1) strongly<br>
&gt; reciprocal, 2) weakly reciprocal, and 3) permissive.<br>
&gt; <br>
&gt; In the spirit of the OHDL the mor1kx is currently licensed under, I&#3=
9;d<br>
&gt; suggest we go with the weakly-reciprocal licence, the CERN-OHL-W.<br>
&gt; <br>
&gt; The OHWR site has a nice FAQ describing the difference between these v=
2<br>
&gt; flavours:<br>
&gt; <a href=3D"https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-t=
hese-suffixes" rel=3D"noreferrer" target=3D"_blank">https://ohwr.org/projec=
t/cernohl/wikis/faq#q-what-are-all-these-suffixes</a><br>
&gt; &lt;<a href=3D"https://ohwr.org/project/cernohl/wikis/faq#q-what-are-a=
ll-these-suffixes" rel=3D"noreferrer" target=3D"_blank">https://ohwr.org/pr=
oject/cernohl/wikis/faq#q-what-are-all-these-suffixes</a>&gt;<br>
&gt; <br>
&gt; The idea behind the OHDL was that it&#39;d be file-level copyleft, jus=
t like<br>
&gt; the MPL (or at least as I interpreted it) it was based on (via m-x<br>
&gt; query-replace in Emacs :-P ). I think it&#39;d be good to back the wor=
k<br>
&gt; Javier and Andrew and Miriam have done with our own work.<br>
&gt; <br>
&gt; I&#39;m copying the OpenRISC list because I guess I want to make sure =
any<br>
&gt; contributor from the past gets a heads up, too.<br>
&gt; <br>
&gt; This is the first time I&#39;ve done something like this, so am not to=
o<br>
&gt; familiar with the=C2=A0process.=C2=A0Should=C2=A0I just do a PR on git=
hub and we can<br>
&gt; debate it on there?<br>
&gt; <br>
&gt; Anyway, I&#39;m interested in your thoughts. Feel free to contact me o=
ff<br>
&gt; list if you prefer. Unless anyone objects, I&#39;ll do a PR relicensin=
g the<br>
&gt; IP in the coming week or so.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Julius<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; OpenRISC mailing list<br>
&gt; <a href=3D"mailto:OpenRISC@lists.librecores.org" target=3D"_blank">Ope=
nRISC@lists.librecores.org</a><br>
&gt; <a href=3D"https://lists.librecores.org/listinfo/openrisc" rel=3D"nore=
ferrer" target=3D"_blank">https://lists.librecores.org/listinfo/openrisc</a=
><br>
&gt; <br>
<br>
<br>
-- <br>
Cell: +44 (7970) 676050<br>
SkypeID: jeremybennett<br>
Twitter: @jeremypbennett<br>
Email: <a href=3D"mailto:jeremy.bennett@embecosm.com" target=3D"_blank">jer=
emy.bennett@embecosm.com</a><br>
Web: <a href=3D"http://www.embecosm.com" rel=3D"noreferrer" target=3D"_blan=
k">www.embecosm.com</a><br>
PGP key: 1024D/BEF58172FB4754E1 2009-03-20<br>
<br>
_______________________________________________<br>
OpenRISC mailing list<br>
<a href=3D"mailto:OpenRISC@lists.librecores.org" target=3D"_blank">OpenRISC=
@lists.librecores.org</a><br>
<a href=3D"https://lists.librecores.org/listinfo/openrisc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.librecores.org/listinfo/openrisc</a><br>
</blockquote></div>

--00000000000088cc7005ca70824e--

--===============3986235353267704315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============3986235353267704315==--
