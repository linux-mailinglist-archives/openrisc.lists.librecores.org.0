Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6E23DFA1B
	for <lists+openrisc@lfdr.de>; Wed,  4 Aug 2021 05:50:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2CCFD23FD6;
	Wed,  4 Aug 2021 05:50:58 +0200 (CEST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mail.librecores.org (Postfix) with ESMTPS id 31D07235CA
 for <openrisc@lists.librecores.org>; Wed,  4 Aug 2021 05:50:56 +0200 (CEST)
Received: by mail-vs1-f49.google.com with SMTP id b138so340662vsd.2
 for <openrisc@lists.librecores.org>; Tue, 03 Aug 2021 20:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cZTaR7Hh3618tGn/561Xpk77Qdbzu5sLSycCsylUO0g=;
 b=nj+j5cnTzpwAhlsQVkZMA0FRqvww2JK8K/TZrrC/6YPnI97O6XcRjE6ta2oxtaU5Nj
 LLAmJz9pemFp7ehqQZ6ortLu1sb6Go6RGKmEs6ZkGkv2lQmrqJpPgyF2aoYmy7oUVxk/
 WCPuxYur4HDEtUawgOh7NlLggF3h0T5MMQ63IirGWyzVY1iN9hXuWLC51vyv+QKVMb4f
 XSc4AXzP/EqMOB4H69hrw5uedp1N0NQup1VV62i0AlCr6+dZGHDe6/WOYivcSa0EoAuJ
 oF5Eo6B6x6xUF5UyZRFW7kpz4kelWltrrS3pzRNkuF55OU5qZ+8R97eXLjg058vDKoaO
 ApaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cZTaR7Hh3618tGn/561Xpk77Qdbzu5sLSycCsylUO0g=;
 b=Nfd6enUjYUu4DTy5BB4tAwoZCE76gf9x4rKeqpJ3YssB5+yRQuEwEZHOoX98TlX29K
 4ld+E0uaqLckJAC3YHz4KxkydCPQm7vLJ6n66jBl0qR+B6T4Um9kRoGRl1kn58fgVN22
 hzWiMfhR5mp15jC/y9fPig8ZX5fvEpCuNvUZnvN5l6yzYPogAbWdSY6rGgAJjOih86By
 6r6HMOHx4Bf8ahPN25Lz8FW2JQqERwzid7X8svMJGkllLRSwsxCJNaKxotBXjNEsbGps
 qqPNPqGD+/05/yXtRMnl8NrHD8Q0zgVBuR9QETbTnxewazVBorn7LsIsn5zQnKks2HpL
 MPkw==
X-Gm-Message-State: AOAM533YwmjTdHlDDNBBWMaN68A69DY2Hd+VZqSuoQ6Ab0r1t6YkrWCd
 Ap3shprSD54UcTpf5GF+zNOu683DLX97qvtitSc=
X-Google-Smtp-Source: ABdhPJxFMkLd5gsSxE+z2h/yq+uCkheUFxBArB5mQsZLQw5ZNNilYu0uYo2wn1ph+ugus6m7KjieZYkodKyeIaCMPpk=
X-Received: by 2002:a05:6102:3231:: with SMTP id
 x17mr17315721vsf.30.1628049055025; 
 Tue, 03 Aug 2021 20:50:55 -0700 (PDT)
MIME-Version: 1.0
From: Julius Baxter <juliusbaxter@gmail.com>
Date: Wed, 4 Aug 2021 13:50:44 +1000
Message-ID: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
To: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stefan Wallentowitz <stefan.wallentowitz@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [OpenRISC] mor1kx licensing
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
Content-Type: multipart/mixed; boundary="===============1139223274596915873=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============1139223274596915873==
Content-Type: multipart/alternative; boundary="0000000000009a0edd05c8b3b50f"

--0000000000009a0edd05c8b3b50f
Content-Type: text/plain; charset="UTF-8"

Hello fellow mor1kx developers,

I've been meaning to do this for a while, but I'd like to propose we switch
the licence of the mor1kx to the CERN OHL v2, and then I can EOL the OHDL.

There are 3 types of the OHL v2 licence, basically 1) strongly reciprocal,
2) weakly reciprocal, and 3) permissive.

In the spirit of the OHDL the mor1kx is currently licensed under, I'd
suggest we go with the weakly-reciprocal licence, the CERN-OHL-W.

The OHWR site has a nice FAQ describing the difference between these v2
flavours:
https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-these-suffixes

The idea behind the OHDL was that it'd be file-level copyleft, just like
the MPL (or at least as I interpreted it) it was based on (via m-x
query-replace in Emacs :-P ). I think it'd be good to back the work Javier
and Andrew and Miriam have done with our own work.

I'm copying the OpenRISC list because I guess I want to make sure any
contributor from the past gets a heads up, too.

This is the first time I've done something like this, so am not too
familiar with the process. Should I just do a PR on github and we can
debate it on there?

Anyway, I'm interested in your thoughts. Feel free to contact me off list
if you prefer. Unless anyone objects, I'll do a PR relicensing the IP in
the coming week or so.

Cheers,
Julius

--0000000000009a0edd05c8b3b50f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello fellow mor1kx developers,<div><br></div><div>I&#39;v=
e been meaning to do this for a while, but I&#39;d like to propose we switc=
h the licence of the mor1kx to the CERN OHL v2, and then I can EOL the OHDL=
.</div><div><br></div><div>There are 3 types of the OHL v2 licence, basical=
ly 1) strongly reciprocal, 2) weakly reciprocal, and 3) permissive.</div><d=
iv><br></div><div>In the spirit of the OHDL the mor1kx is currently license=
d under, I&#39;d suggest we go with the weakly-reciprocal licence, the CERN=
-OHL-W.</div><div><br></div><div>The OHWR site has a nice FAQ describing th=
e difference between these v2 flavours:</div><div><a href=3D"https://ohwr.o=
rg/project/cernohl/wikis/faq#q-what-are-all-these-suffixes">https://ohwr.or=
g/project/cernohl/wikis/faq#q-what-are-all-these-suffixes</a><br></div><div=
><br></div><div>The idea behind the OHDL was that it&#39;d be file-level co=
pyleft, just like the MPL (or at least as I interpreted it) it was based on=
 (via m-x query-replace in Emacs :-P ). I think it&#39;d be good to back th=
e work Javier and Andrew and Miriam have done with our own work.</div><div>=
<br></div><div>I&#39;m copying the OpenRISC list because I guess I want to =
make sure any contributor from the past gets a heads up, too.</div><div><br=
></div><div>This is the first time I&#39;ve done something like this, so am=
 not too familiar with the=C2=A0process.=C2=A0Should=C2=A0I just do a PR on=
 github and we can debate it on there?</div><div><br></div><div>Anyway, I&#=
39;m interested in your thoughts. Feel free to contact me off list if you p=
refer. Unless anyone objects, I&#39;ll do a PR relicensing the IP in the co=
ming week or so.</div><div><br></div><div>Cheers,</div><div>Julius</div></d=
iv>

--0000000000009a0edd05c8b3b50f--

--===============1139223274596915873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1139223274596915873==--
