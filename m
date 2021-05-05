Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AD4D73735D7
	for <lists+openrisc@lfdr.de>; Wed,  5 May 2021 09:51:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4254120E5D;
	Wed,  5 May 2021 09:51:50 +0200 (CEST)
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by mail.librecores.org (Postfix) with ESMTP id 85D92211E4
 for <openrisc@lists.librecores.org>; Wed,  5 May 2021 09:51:47 +0200 (CEST)
Received: from [192.168.50.138] ([146.241.181.225])
 by Aruba Outgoing Smtp  with ESMTPA
 id eCJslFocLSvjVeCJslquzI; Wed, 05 May 2021 09:51:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1620201107; bh=loQbCsqNBSdX7z/+710O16hYh7NR8IhmnzYX2zU1+PU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=DzjaiyK44LDtW0twansGTWrN4he/n8n1nkaHiOSQImDjDFL4fGzcARLqj9oPlLf24
 pGNikWd3ctxEUN3jAAmGFhUKYSgeVIE6zPJTU/tykoAn0QSHHo9u3VRlHBSGkV8QNb
 bohapBGyjnd0A0jFsfRzzJIIwC7sDHPSEqrhYlQZ+EXEus5wLAwIOWLUojas+Pdouw
 wCd3JO/2Bh7eXVLffVLJxqn59fgQbjJQBU8Bh7Kccz70s8+ZzdMr81Phw5W7NdcFoq
 hIE2Q743wcKSYW03N2ai3Yo9cD041QvypA6TUZ6X9OdbZHl880XoYKddZ5UasPO5H0
 U4peLnA+jnU3Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 5 May 2021 09:51:43 +0200
Message-Id: <0E376E20-5570-4914-A816-679D77FB1E24@benettiengineering.com>
References: <20210505063004.GT3288043@lianli.shorne-pla.net>
In-Reply-To: <20210505063004.GT3288043@lianli.shorne-pla.net>
To: Stafford Horne <shorne@gmail.com>
X-Mailer: iPhone Mail (18D70)
X-CMAE-Envelope: MS4wfGvT1OLrcwT3xVAu9IsAW+gys/TgaQSvQa/617vEH0YDSR4fW1wKem9up9RQ1LsSzhR5K9Ao9ZYO4CB0Xww5XNVWTrlKyRzd0K/o+txEt+HXuccrvF6w
 YKG1VHLI20SzHLxUJaiItfhi7IBljqouYdjRnnGxMHisHNDWr2GQ69KWuFgCLUd44S6xC3i+TO8gupD+FGx5ODvmNrCLwvdBK7MuJCQEzaUhcM4SwsLpihG6
 ob9Lb3MrM1EgHZ/wXtxJGh7/SHYgE3WUN/H2OxNWILhcC492k8Z/HCDAc8IB+hJFLlRs5arjKHFqLgaAQTicNA==
Subject: Re: [OpenRISC] [PATCH v2 0/2] OpenRISC support for cmodel=large
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Type: multipart/mixed; boundary="===============4580167648540649881=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


--===============4580167648540649881==
Content-Type: multipart/alternative; boundary=Apple-Mail-27BE0B9A-8724-47F2-B0B2-179111401DB3
Content-Transfer-Encoding: 7bit


--Apple-Mail-27BE0B9A-8724-47F2-B0B2-179111401DB3
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stafford, All,

> Il giorno 5 mag 2021, alle ore 08:30, Stafford Horne <shorne@gmail.com> ha=
 scritto:
>=20
> =EF=BB=BFOn Mon, May 03, 2021 at 12:34:22PM +0200, Giulio Benetti wrote:
>> Hi Stafford, All,
>>=20
>> I've backported this patchset for Buildroot to versions:
>> - 9.3.0
>> - 10.3.0
>>=20
>> Does it make sense to send them? I don't know if those version will have
>> minor versions where these backported patches can be applied.
>=20
> Do you mean for me/you to send the backported GCC patches for GCC or build=
root?
I mean for GCC, I=E2=80=99ve already sent them for buildroot:
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D241844

>=20
> I don't need backported versions of the toolchains and usually work off th=
e
> latest release/master.  If someone wants them let me know.
I was asking to know if newer minor versions of
binutils and gcc will be released. If yes I could
send your back ported patches here in the 2 mailing lists(binutils and gcc o=
nes).

Giulio Benetti

>=20
> -Stafford
>=20
>> Best regards
>> --=20
>> Giulio Benetti
>> Benetti Engineering sas
>>=20
>>> On 5/1/21 11:11 PM, Stafford Horne wrote:
>>> Changes from v1:
>>>  - Added patch to enabled cmodle=3Dlarge on crtstuff
>>>=20
>>> This series fixes some bugs found when linking large binaries, both in b=
uildroot
>>> and glibc testing.
>>>=20
>>> Stafford Horne (2):
>>>   or1k: Add mcmodel option to handle large GOTs
>>>   or1k: Use cmodel=3Dlarge when building crtstuff
>>>=20
>>>  gcc/config/or1k/or1k-opts.h   | 30 ++++++++++++++++++++++++++++++
>>>  gcc/config/or1k/or1k.c        | 11 +++++++++--
>>>  gcc/config/or1k/or1k.h        |  7 +++++++
>>>  gcc/config/or1k/or1k.opt      | 19 +++++++++++++++++++
>>>  gcc/doc/invoke.texi           | 12 +++++++++++-
>>>  libgcc/config.host            |  4 ++--
>>>  libgcc/config/or1k/t-crtstuff |  2 ++
>>>  7 files changed, 80 insertions(+), 5 deletions(-)
>>>  create mode 100644 gcc/config/or1k/or1k-opts.h
>>>  create mode 100644 libgcc/config/or1k/t-crtstuff
>>>=20

--Apple-Mail-27BE0B9A-8724-47F2-B0B2-179111401DB3
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Hi Stafford, All,</div><br><div dir=3D=
"ltr"><blockquote type=3D"cite">Il giorno 5 mag 2021, alle ore 08:30, Staffo=
rd Horne &lt;shorne@gmail.com&gt; ha scritto:<br><br></blockquote></div><blo=
ckquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Mon, May 03, 2021 a=
t 12:34:22PM +0200, Giulio Benetti wrote:</span><br><blockquote type=3D"cite=
"><span>Hi Stafford, All,</span><br></blockquote><blockquote type=3D"cite"><=
span></span><br></blockquote><blockquote type=3D"cite"><span>I've backported=
 this patchset for Buildroot to versions:</span><br></blockquote><blockquote=
 type=3D"cite"><span>- 9.3.0</span><br></blockquote><blockquote type=3D"cite=
"><span>- 10.3.0</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span>Does it make sense to se=
nd them? I don't know if those version will have</span><br></blockquote><blo=
ckquote type=3D"cite"><span>minor versions where these backported patches ca=
n be applied.</span><br></blockquote><span></span><br><span>Do you mean for m=
e/you to send the backported GCC patches for GCC or buildroot?</span><br></d=
iv></blockquote>I mean for GCC, I=E2=80=99ve already sent them for buildroot=
:<div><a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D241844">https://patchwork.ozlabs.org/project/buildroot/list/?series=3D241=
844</a></div><div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></spa=
n><br><span>I don't need backported versions of the toolchains and usually w=
ork off the</span><br><span>latest release/master. &nbsp;If someone wants th=
em let me know.</span><br></div></blockquote><div>I was asking to know if ne=
wer minor versions of</div><div>binutils and gcc will be released. If yes I c=
ould</div><div>send your back ported patches here in the 2 mailing lists(bin=
utils and gcc ones).</div><div><br></div><div>Giulio Benetti</div><br><block=
quote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>-Stafford</span>=
<br><span></span><br><blockquote type=3D"cite"><span>Best regards</span><br>=
</blockquote><blockquote type=3D"cite"><span>-- </span><br></blockquote><blo=
ckquote type=3D"cite"><span>Giulio Benetti</span><br></blockquote><blockquot=
e type=3D"cite"><span>Benetti Engineering sas</span><br></blockquote><blockq=
uote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><=
span>On 5/1/21 11:11 PM, Stafford Horne wrote:</span><br></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>Changes from v1:</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span> &nbsp;- Added patch to enabled cmodle=3Dlarge on crtstuff</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>This series fixes some bugs found when linkin=
g large binaries, both in buildroot</span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>and glibc testing.</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>Stafford Horne (2):</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp=
;&nbsp;or1k: Add mcmodel option to handle large GOTs</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbs=
p;&nbsp;or1k: Use cmodel=3Dlarge when building crtstuff</span><br></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span> &nbsp;gcc/config/or1k/or1k-opts.h &nbsp;&nbsp;| 30 +++++++=
+++++++++++++++++++++++</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span> &nbsp;gcc/config/or1k/or1k.c &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 11 +++++++++--</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &n=
bsp;gcc/config/or1k/or1k.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp=
;7 +++++++</span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span> &nbsp;gcc/config/or1k/or1k.opt &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;| 19 +++++++++++++++++++</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;gcc/doc/inv=
oke.texi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 12 ++=
+++++++++-</span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span> &nbsp;libgcc/config.host &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;4 ++--</span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n> &nbsp;libgcc/config/or1k/t-crtstuff | &nbsp;2 ++</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp=
;7 files changed, 80 insertions(+), 5 deletions(-)</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;=
create mode 100644 gcc/config/or1k/or1k-opts.h</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;crea=
te mode 100644 libgcc/config/or1k/t-crtstuff</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote></div></blockquote></div></body></html>=

--Apple-Mail-27BE0B9A-8724-47F2-B0B2-179111401DB3--

--===============4580167648540649881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4580167648540649881==--
