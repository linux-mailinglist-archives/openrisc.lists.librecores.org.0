Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0533E2A7C
	for <lists+openrisc@lfdr.de>; Fri,  6 Aug 2021 14:22:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1B20E23FE8;
	Fri,  6 Aug 2021 14:22:34 +0200 (CEST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mail.librecores.org (Postfix) with ESMTPS id B7AC623CE2
 for <openrisc@lists.librecores.org>; Fri,  6 Aug 2021 14:22:32 +0200 (CEST)
Received: by mail-wr1-f42.google.com with SMTP id n12so785223wrr.2
 for <openrisc@lists.librecores.org>; Fri, 06 Aug 2021 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=reply-to:subject:to:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=9VGGc4O/qXfTL0amevCzHi6F4rOrNzinptX7eojazFE=;
 b=Vgv5e4Kg5IAwSTmE8VW/AU945tx/BujT5RCyT10U4uVUHDaGFsLcR6Xfkynjm1FVQQ
 UlewOWG1Hdq11T0MRmHOGSSX4FTCInGcfU3c9l3re3w7MHNhMNpBnhk0RSlyOqzz9t3M
 7SxSxSl4Ezzsl0CE7mFxAgEXmn4XBnDwefqCCEmYVH47zNQ5wqxa5c3SzWk5VMPIcr8V
 UZzt8SGKVC21/ur5b0LoOwryJYU6k+CAUOZhua22/IMFyWNak4RilzDPg+zcnvD7MIGV
 Z8VfvlGbfyl2BrHwvY0fy0W0RMDFMHeARpafR3VSMlDw6NWefVJ7vsBoVB1fXxheOhUf
 LcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=9VGGc4O/qXfTL0amevCzHi6F4rOrNzinptX7eojazFE=;
 b=LcMGCr0WL/7f7+WFG9fJo0QPLDo6wdSXgJ+0rEj45pxEkd+WPRfqD44rDAEBP8At1z
 hBd6j2LedWbbXZQszGQolvQuxmZhZE6c9fs+4QwwfpqOfJuvhGP+l0U1+PkBWdHpSMmV
 YvLWIWFm+Y4mUIUzBgiBCe121tT/4Ulnuf4QRr1SaZuE6uTxTIxE8GVH+ztYMDuMNzQF
 39rHdu90ck3ZgNptPj2OfKBS45qYtX8ukhPYo+2c3Xp96okd6GxU2BYOXzzzCB84S6sp
 r+X5cE7xcE6ZXYmaHsfbnG0XAjhuTtkkclQHgZZLCIGQlR9N8kRq1kDafTqhImtnjdGR
 Q9yA==
X-Gm-Message-State: AOAM530ve/1W3HhGzUYbKeXMsaeHfcn1eaO7uiZpCAAl7XWXjBz1yztu
 MmATXyYr5YJqOXee98V9j+1O3w==
X-Google-Smtp-Source: ABdhPJxq/4mSmCDFLPp46K+GLEG33ycPBw75nN+3Kp5JcQKg+qgNOs359ZtmQpdkPlPUgASHTHmyaw==
X-Received: by 2002:a5d:4f86:: with SMTP id d6mr10454776wru.271.1628252552337; 
 Fri, 06 Aug 2021 05:22:32 -0700 (PDT)
Received: from [192.168.1.116] (cust239-dsl57.idnet.net. [212.69.57.239])
 by smtp.gmail.com with ESMTPSA id z17sm9591496wrt.47.2021.08.06.05.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 05:22:31 -0700 (PDT)
To: openrisc@lists.librecores.org
References: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
From: Jeremy Bennett <jeremy.bennett@embecosm.com>
Organization: Embecosm
Message-ID: <3d8e59ca-30f7-d61a-fc33-cf7cb203b113@embecosm.com>
Date: Fri, 6 Aug 2021 13:22:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
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
Reply-To: jeremy.bennett@embecosm.com
Content-Type: multipart/mixed; boundary="===============0533819638137774254=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0533819638137774254==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lWv53rQfCFpxJ3MyEn8jsuNts93mQ8JIp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lWv53rQfCFpxJ3MyEn8jsuNts93mQ8JIp
Content-Type: multipart/mixed; boundary="9SkcH38aMqpHKqLs4DaOSheJhZqZKgePm";
 protected-headers="v1"
From: Jeremy Bennett <jeremy.bennett@embecosm.com>
Reply-To: jeremy.bennett@embecosm.com
To: openrisc@lists.librecores.org
Message-ID: <3d8e59ca-30f7-d61a-fc33-cf7cb203b113@embecosm.com>
Subject: Re: [OpenRISC] mor1kx licensing
References: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
In-Reply-To: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>

--9SkcH38aMqpHKqLs4DaOSheJhZqZKgePm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/08/2021 04:50, Julius Baxter wrote:
> Hello fellow mor1kx developers,
>=20
> I've been meaning to do this for a while, but I'd like to propose we
> switch the licence of the mor1kx to the CERN OHL v2, and then I can EOL=

> the OHDL.

Hi Julius,

Not sure I ever contributed anything, but I am happy with this change
and it applying to anything I did.

Best wishes,


Jeremy

>=20
> There are 3 types of the OHL v2 licence, basically 1) strongly
> reciprocal, 2) weakly reciprocal, and 3) permissive.
>=20
> In the spirit of the OHDL the mor1kx is currently licensed under, I'd
> suggest we go with the weakly-reciprocal licence, the CERN-OHL-W.
>=20
> The OHWR site has a nice FAQ describing the difference between these v2=

> flavours:
> https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-these-suffixe=
s
> <https://ohwr.org/project/cernohl/wikis/faq#q-what-are-all-these-suffix=
es>
>=20
> The idea behind the OHDL was that it'd be file-level copyleft, just lik=
e
> the MPL (or at least as I interpreted it) it was based on (via m-x
> query-replace in Emacs :-P ). I think it'd be good to back the work
> Javier and Andrew and Miriam have done with our own work.
>=20
> I'm copying the OpenRISC list because I guess I want to make sure any
> contributor from the past gets a heads up, too.
>=20
> This is the first time I've done something like this, so am not too
> familiar with the=C2=A0process.=C2=A0Should=C2=A0I just do a PR on gith=
ub and we can
> debate it on there?
>=20
> Anyway, I'm interested in your thoughts. Feel free to contact me off
> list if you prefer. Unless anyone objects, I'll do a PR relicensing the=

> IP in the coming week or so.
>=20
> Cheers,
> Julius
>=20
> _______________________________________________
> OpenRISC mailing list
> OpenRISC@lists.librecores.org
> https://lists.librecores.org/listinfo/openrisc
>=20


--=20
Cell: +44 (7970) 676050
SkypeID: jeremybennett
Twitter: @jeremypbennett
Email: jeremy.bennett@embecosm.com
Web: www.embecosm.com
PGP key: 1024D/BEF58172FB4754E1 2009-03-20


--9SkcH38aMqpHKqLs4DaOSheJhZqZKgePm--

--lWv53rQfCFpxJ3MyEn8jsuNts93mQ8JIp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQRASGDWqmhRZUfAaPW+9YFy+0dU4QUCYQ0phgUDAAAAAAAKCRC+9YFy+0dU4fBe
AJ9josvo9W/D8HQ/KM3yi/oloH3/vwCfYHCDjWhm/ZrWtLhWo0ZneK2WZxM=
=ILrD
-----END PGP SIGNATURE-----

--lWv53rQfCFpxJ3MyEn8jsuNts93mQ8JIp--

--===============0533819638137774254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0533819638137774254==--
