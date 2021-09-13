Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F2021409B85
	for <lists+openrisc@lfdr.de>; Mon, 13 Sep 2021 19:58:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6A03E2413E;
	Mon, 13 Sep 2021 19:58:50 +0200 (CEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mail.librecores.org (Postfix) with ESMTPS id E9F0723CBB
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 19:58:48 +0200 (CEST)
Received: by mail-lj1-f176.google.com with SMTP id w4so18772062ljh.13
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tamu-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzoY7975ZgEywYK2TmyfVlY7xz6F5zV/02YQKUXYSzU=;
 b=Znsh84b5vswEsfEIiEeGL6oS0RxJdPFx+EQQxrEApVIfipD7CyYHHUCquSLbh0pmWc
 fR+4/RwUBBwbXaugW0xEOA9VXJocCFlZXpfBTIo2OPGim10tfKamttQYWQv7d3GwZQnB
 HDc0SXNTlHERKYnLgZ3Z1uc2PzA8NSe4uFQxkQgO+qCpxMIkbR7TQc9byn8tobieMlSl
 nGm6cTPFei+UAgF0mvdT6bwaTY/v3ulBy5M9A38f+/DbBYlKoX/s5MkyE5/vUHKav6GN
 Nn3esciOF+fyx7RCw+U+TACvMHPBq6AIx2hheUznJhXCLW18zNE/SedyLOCOtyaOJ5jM
 qOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzoY7975ZgEywYK2TmyfVlY7xz6F5zV/02YQKUXYSzU=;
 b=LzWzWv8gyxp9mrqE8XS2q0998yaPJvVYfnwthkZub/qDt09k9lxEEygbqIqJAqs6aF
 Xp8BBjftvAhbQNeuVwACVAstwSKYRMOfJXRy1bdf39AJA/6sU+Bf2aBfGgSN6d0t8LHH
 Mgorv2HGRkheRAqM9QpohSLO0xy4EiamrX7h3QDIX+GIirnkRT/AGyzDwwoV9NhRGDVv
 KEUgIgbDiecZmIpmo9UNpdTUj+ovb34+x1GfbwoeryMqCJp6wKSczmgOredSV69hh4mr
 JhtFRVJWt977WXVshRHeLB9PnGb6LqBCBPsbWBVI7xtaAEexVG5/yd9BykIFf5ZcfB5n
 Iuyg==
X-Gm-Message-State: AOAM533eDJ0HhET8cM6wo2fucfQxD4hrvnxz6RPKU/EFJ5ySS660TAot
 NPJoeS7n/Ah4CMt0KTuUFcZH8oMOEHBe6vL2S3w7xA==
X-Google-Smtp-Source: ABdhPJxEXg3vYGoOirJ3rhzwdPNR2eESnf6AZSDXCOai705wbxqbd/36CG6gxa/k24YB+xFlVwtdC4yQRqnsdW5MsIM=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr11615796ljg.396.1631555927667; 
 Mon, 13 Sep 2021 10:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPV5DU64Hja40XHgvUz2ph7gcBtNWinUNH633vCfxH7vxEvshA@mail.gmail.com>
 <CADzBsGPS1McirO2W_HRJxDr94DCh-63bEqCfF1ABjPTYPEH3+A@mail.gmail.com>
 <43b3a519-f334-df97-4545-e2fdf7804dd7@wallentowitz.de>
 <CADLGkjtjTVMSkLuxVqJJS_j_Z+QOP15EsQoHMQ+-_kASG7H_GA@mail.gmail.com>
In-Reply-To: <CADLGkjtjTVMSkLuxVqJJS_j_Z+QOP15EsQoHMQ+-_kASG7H_GA@mail.gmail.com>
From: Rahul Kande <rahulkande@tamu.edu>
Date: Mon, 13 Sep 2021 12:58:20 -0500
Message-ID: <CADLGkjvOpkru6UV_5wHUFYRBHdVPHg5Wv6T8Lx3qDwELtSxCEg@mail.gmail.com>
To: Stefan Wallentowitz <stefan@wallentowitz.de>
Subject: Re: [OpenRISC] Reporting the bugs in MOR1KX processor
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
Cc: Ahmad-Reza Sadeghi <ahmad.sadeghi@trust.tu-darmstadt.de>,
 Addison Crump <addisoncrump@tamu.edu>,
 Jeyavijayan Rajendran <jeyavijayan@tamu.edu>,
 Aakash Tyagi <tyagi@cse.tamu.edu>, Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============4078644955502580184=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4078644955502580184==
Content-Type: multipart/alternative; boundary="00000000000080161605cbe43749"

--00000000000080161605cbe43749
Content-Type: text/plain; charset="UTF-8"

Hello  Mr. Wallentowitz,

I just wanted to inform you that we have submitted the bugs to the mor1kx
bug tracker as required.

May I know if we have your acknowledgment of the bugs so that we can
include the same in our submission for the CVE listing?
Also, please let us know if you need any more information from us.

Sincerely,
Rahul

On Tue, Sep 7, 2021 at 9:48 PM Rahul Kande <rahulkande@tamu.edu> wrote:

> Hello Mr. Wallentowitz,
>
> We have opened issues for each of the bugs in the mor1kx bug tracker as
> requested.
>
> Here are the links for the issues we have opened:
> For bug 1: https://github.com/openrisc/mor1kx/issues/139
> For bug 2: https://github.com/openrisc/mor1kx/issues/140
> For bug 3: https://github.com/openrisc/mor1kx/issues/141
>
> Please let us know if the information is sufficient and acknowledge
> whether we can file CVEs for them.
>
> Sincerely,
> Rahul Kande
>
> On Fri, Sep 3, 2021 at 2:37 AM Stefan Wallentowitz <stefan@wallentowitz.de>
> wrote:
>
>> Hi,
>>
>> can you please open issues on the bugtracker?
>>
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/issues__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezYoiO8JTg$
>>
>> Thanks,
>> Stefan
>>
>> On 02.09.21 20:49, Stefan Kristiansson wrote:
>> >
>> >
>> > On Thu, Sep 2, 2021 at 8:53 PM Jeyavijayan Rajendran
>> > <jeyavijayan@tamu.edu <mailto:jeyavijayan@tamu.edu>> wrote:
>> >
>> >     Dear Developers of the MOR1KX processor,
>> >
>> >     We are research teamsfrom Texas A&M University and TU Darmstadt. We
>> >     found the following bugs in your MOR1KX processor design
>> >     (
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezYOf67r0Q$
>> >     <
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBiVlQn4uw$
>> >).
>> >
>> >     We intend to get CVE listing numbers for all these bugs to include
>> >     in our research paper. Hence, we would like to disclose these bugs
>> >     to you before we request CVE IDs.
>> >
>> >     Please respond to us by *_10th Sept 2021, 11:59 PM UTC _*with your
>> >     acknowledgment of the bugs.
>> >
>> >     In case you are not authorized to comment on the bugs, please
>> >     connect us with the right contact person or channel for this
>> matter.
>> >
>> >     Also, let us know if your processor design is one of the CNA-covered
>> >     products (
>> https://urldefense.com/v3/__https://cve.mitre.org/cve/cna.html__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezbJjp-2Xg$
>> >     <
>> https://urldefense.com/v3/__https://cve.mitre.org/cve/cna.html__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi93tT1sQ$
>> >)
>> >     so that we can include the same in our CVE listing.
>> >
>> >
>> >     Vendor of the product(s): openrisc
>> >
>> >
>> >     Bug 1:
>> >
>> >     Bug:The carry flag is incorrectly implemented for
>> subtractinstructions.
>> >
>> >     Location:  mor1kx_execute_alu.v
>> >     (
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZdNKImyQ$
>> >     <
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi4Qmr_iI$
>> >).
>> >
>> >     Triggering input:
>> >
>> >     //set r1=00020000 and r3=00002000
>> >
>> >          l.sub    r4,r1,r3
>> >
>> >     Expected output:
>> >
>> >                    Carry flag = 0
>> >
>> >
>> >     mor1kx output:
>> >
>> >                   Carry flag = 1
>> >
>> >
>> >
>> >     Bug 2:
>> >
>> >     Bug:The EPCR register is accessible from user mode.
>> >
>> >     Location:  mor1kx_ctrl_cappuccino.v
>> >     (
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZmnTocIw$
>> >     <
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6Jz-sng$
>> >).
>> >
>> >     Details: The OpenRISC specification requires that the EPCR register
>> >     be accessible only from supervisor mode.
>> >
>> >     Triggering input:
>> >
>> >     #include <stdio.h>
>> >
>> >     int main() {
>> >
>> >       // enter user mode :
>> >
>> >       asm volatile ( "l.ori r17,r0,0x0000  ");
>> >
>> >       asm volatile ( "l.mtspr r0,r17,0x3806");
>> >
>> >
>> >       asm volatile ( "l.mfspr r17,r0,0x11  ");
>> >
>> >       asm volatile ( "l.andi r17,r17,-2    ");
>> >
>> >       asm volatile ( "l.mtspr r0,r17,0x11  ");
>> >
>> >       // padding the seed code
>> >
>> >       asm volatile( "l.nop 0x0 ");
>> >
>> >       asm volatile( "l.nop 0x0 ");
>> >
>> >       asm volatile( "l.nop 0x0 ");
>> >
>> >       asm volatile( "l.nop 0x0 ");
>> >
>> >       asm volatile ("l.addi r1,r0,1");
>> >
>> >       asm volatile ("l.mfspr r2,r0,32");
>> >
>> >       asm volatile ("l.mtspr r0, r1, 32");
>> >
>> >       return 0;
>> >
>> >     }
>> >
>> >
>> >     The or1ksim fails to execute the mfspr while the mor1kx
>> >     implementation can successfully write into EPCR using the mtspr
>> >     instruction.
>> >
>> >
>> >     Bug 3:
>> >
>> >     Bug:Unable to write to the EEAR register from the supervisor mode.
>> >
>> >     Location:  mor1kx_ctrl_cappuccino.v
>> >     (
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZmnTocIw$
>> >     <
>> https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6Jz-sng$
>> >),
>> >     line 830 to 840.
>> >
>> >     Details: The OpenRISC specification requires that the EEAR register
>> >     be accessible from the supervisor mode but the mor1kx implementation
>> >     does not have the option to write to EEAR with the mtspr instruction
>> >     even from the supervisor mode.
>> >
>> >
>> >     Sincerely,
>> >
>> >     JV, Ahmad, Aakash, Addison, and Rahul.
>> >
>> >
>> >     --
>> >     JV Rajendran,
>> >     Assistant Professor of Electrical and Computer Engineering,
>> >     Texas A&M University.
>> >     Web: https://cesg.tamu.edu/faculty/jv/
>> >     <https://cesg.tamu.edu/faculty/jv/>
>> >
>> >
>> > _______________________________________________
>> > OpenRISC mailing list
>> > OpenRISC@lists.librecores.org
>> >
>> https://urldefense.com/v3/__https://lists.librecores.org/listinfo/openrisc__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezYmyWEWww$
>> >
>>
>>

--00000000000080161605cbe43749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0

Mr. Wallentowitz,<br><br>I just wanted to inform you that we have submitted=
 the bugs to the mor1kx bug tracker as required. <br><br>May I know if we h=
ave your acknowledgment of the bugs so that we can include the same in our =
submission for the CVE listing?<br>Also, please let us know if you need any=
 more information from us.=C2=A0<br><br>Sincerely,=C2=A0<br>Rahul=C2=A0=C2=
=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Sep 7, 2021 at 9:48 PM Rahul Kande &lt;<a href=3D"mailto:rahulka=
nde@tamu.edu">rahulkande@tamu.edu</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello Mr. Wallentowitz,=
=C2=A0<br><br>We have opened issues for each of the bugs in the mor1kx bug =
tracker as requested.=C2=A0<br><br>Here are the links for the issues we hav=
e opened:=C2=A0<br>For bug 1:=C2=A0<a href=3D"https://github.com/openrisc/m=
or1kx/issues/139" target=3D"_blank">https://github.com/openrisc/mor1kx/issu=
es/139</a><br>For bug 2:=C2=A0<a href=3D"https://github.com/openrisc/mor1kx=
/issues/140" target=3D"_blank">https://github.com/openrisc/mor1kx/issues/14=
0</a><br>For bug 3:=C2=A0<a href=3D"https://github.com/openrisc/mor1kx/issu=
es/141" target=3D"_blank">https://github.com/openrisc/mor1kx/issues/141</a>=
<br><br>Please let us know if the=C2=A0information is sufficient and acknow=
ledge whether we can file CVEs for them.=C2=A0<br><br>Sincerely,=C2=A0<br>R=
ahul Kande</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Sep 3, 2021 at 2:37 AM Stefan Wallentowitz &lt;<a href=3D=
"mailto:stefan@wallentowitz.de" target=3D"_blank">stefan@wallentowitz.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,=
<br>
<br>
can you please open issues on the bugtracker?<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/i=
ssues__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgY=
ezYoiO8JTg$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3=
/__https://github.com/openrisc/mor1kx/issues__;!!KwNVnqRv!XeamcSRFA-6TeQbLL=
Ph3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezYoiO8JTg$</a> <br>
<br>
Thanks,<br>
Stefan<br>
<br>
On 02.09.21 20:49, Stefan Kristiansson wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Sep 2, 2021 at 8:53 PM Jeyavijayan Rajendran<br>
&gt; &lt;<a href=3D"mailto:jeyavijayan@tamu.edu" target=3D"_blank">jeyavija=
yan@tamu.edu</a> &lt;mailto:<a href=3D"mailto:jeyavijayan@tamu.edu" target=
=3D"_blank">jeyavijayan@tamu.edu</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Dear Developers of the MOR1KX processor,=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We are research teamsfrom Texas A&amp;M University =
and TU Darmstadt. We<br>
&gt;=C2=A0 =C2=A0 =C2=A0found the following bugs in your MOR1KX processor d=
esign<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://urldefense.com/v3/__https://git=
hub.com/openrisc/mor1kx__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g=
8OchDHo_r7QIXO8QgYezYOf67r0Q$" rel=3D"noreferrer" target=3D"_blank">https:/=
/urldefense.com/v3/__https://github.com/openrisc/mor1kx__;!!KwNVnqRv!XeamcS=
RFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezYOf67r0Q$</a> <br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/openrisc/mor1kx__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHR=
NT2CfnwuMzUMLkGpkd-6OXtBiVlQn4uw$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__https://github.com/openrisc/mor1kx__;!!KwNVnqRv!SN=
shfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBiVlQn4uw$</a>&gt;)=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We intend to get CVE listing numbers for all these =
bugs to include<br>
&gt;=C2=A0 =C2=A0 =C2=A0in our research paper. Hence, we would like to disc=
lose these bugs<br>
&gt;=C2=A0 =C2=A0 =C2=A0to you before we request CVE IDs. =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Please respond to us by=C2=A0*_10th Sept 2021, 11:5=
9 PM UTC _*with your<br>
&gt;=C2=A0 =C2=A0 =C2=A0acknowledgment of the bugs.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In case you are not authorized to comment on the bu=
gs, please<br>
&gt;=C2=A0 =C2=A0 =C2=A0connect us with the right contact person or channel=
 for this matter. =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, let us know if your processor design is one o=
f the CNA-covered<br>
&gt;=C2=A0 =C2=A0 =C2=A0products (<a href=3D"https://urldefense.com/v3/__ht=
tps://cve.mitre.org/cve/cna.html__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189n=
UEBWI3f3g8OchDHo_r7QIXO8QgYezbJjp-2Xg$" rel=3D"noreferrer" target=3D"_blank=
">https://urldefense.com/v3/__https://cve.mitre.org/cve/cna.html__;!!KwNVnq=
Rv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezbJjp-2Xg$</a> =
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
cve.mitre.org/cve/cna.html__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHR=
NT2CfnwuMzUMLkGpkd-6OXtBi93tT1sQ$" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.com/v3/__https://cve.mitre.org/cve/cna.html__;!!KwNVnqRv!SN=
shfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi93tT1sQ$</a>&gt;)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0so that we can include the same in our CVE listing.=
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Vendor of the product(s): openrisc<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug 1:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug:The carry flag is incorrectly implemented for s=
ubtractinstructions.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Location: =C2=A0mor1kx_execute_alu.v<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://urldefense.com/v3/__https://git=
hub.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v__;!!Kw=
NVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZdNKImyQ$"=
 rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://g=
ithub.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v__;!!=
KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZdNKImyQ=
$</a> <br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v__;!=
!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi4Qmr_=
iI$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https=
://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v_=
_;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi4Q=
mr_iI$</a>&gt;).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Triggering input:=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0//set r1=3D00020000 and r3=3D00002000<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l.sub=C2=A0 =C2=A0 r4=
,r1,r3=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Expected output:=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Carry flag =3D 0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0mor1kx output:=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Carry flag =3D 1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug 2:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug:The EPCR register is accessible from user mode.=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Location: =C2=A0mor1kx_ctrl_cappuccino.v<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://urldefense.com/v3/__https://git=
hub.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;=
!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZmnToc=
Iw$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https=
://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccin=
o.v__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYez=
ZmnTocIw$</a> <br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v=
__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6=
Jz-sng$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__h=
ttps://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappu=
ccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-=
6OXtBi6Jz-sng$</a>&gt;).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Details: The OpenRISC specification requires that t=
he EPCR register<br>
&gt;=C2=A0 =C2=A0 =C2=A0be accessible only from supervisor mode.=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Triggering input:=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0int main() {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0// enter user mode :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile ( &quot;l.ori r17,r0,0x000=
0=C2=A0 &quot;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile ( &quot;l.mtspr r0,r17,0x3=
806&quot;);<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile ( &quot;l.mfspr r17,r0,0x1=
1=C2=A0 &quot;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile ( &quot;l.andi r17,r17,-2=
=C2=A0 =C2=A0 &quot;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile ( &quot;l.mtspr r0,r17,0x1=
1=C2=A0 &quot;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0// padding the seed code<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile( &quot;l.nop 0x0 &quot;);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile( &quot;l.nop 0x0 &quot;);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile( &quot;l.nop 0x0 &quot;);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile( &quot;l.nop 0x0 &quot;);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile (&quot;l.addi r1,r0,1&quot=
;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile (&quot;l.mfspr r2,r0,32&qu=
ot;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0asm volatile (&quot;l.mtspr r0, r1, 32&=
quot;);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0return 0;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The or1ksim fails to execute the mfspr while the mo=
r1kx<br>
&gt;=C2=A0 =C2=A0 =C2=A0implementation can successfully write into EPCR usi=
ng the mtspr<br>
&gt;=C2=A0 =C2=A0 =C2=A0instruction.=C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug 3:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug:Unable to write to the EEAR register from the s=
upervisor mode.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Location: =C2=A0mor1kx_ctrl_cappuccino.v<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://urldefense.com/v3/__https://git=
hub.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;=
!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezZmnToc=
Iw$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https=
://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccin=
o.v__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYez=
ZmnTocIw$</a> <br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v=
__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6=
Jz-sng$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__h=
ttps://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappu=
ccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-=
6OXtBi6Jz-sng$</a>&gt;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0line 830 to 840.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Details: The OpenRISC specification requires that t=
he EEAR register<br>
&gt;=C2=A0 =C2=A0 =C2=A0be accessible from the supervisor mode but the mor1=
kx implementation<br>
&gt;=C2=A0 =C2=A0 =C2=A0does not have the option to write to EEAR with the =
mtspr instruction<br>
&gt;=C2=A0 =C2=A0 =C2=A0even from the supervisor mode.=C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Sincerely,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0JV, Ahmad, Aakash, Addison, and Rahul.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0JV Rajendran,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Assistant Professor of Electrical and Computer Engi=
neering,=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Texas A&amp;M University.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Web:=C2=A0<a href=3D"https://cesg.tamu.edu/faculty/=
jv/" rel=3D"noreferrer" target=3D"_blank">https://cesg.tamu.edu/faculty/jv/=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://cesg.tamu.edu/faculty/jv/" r=
el=3D"noreferrer" target=3D"_blank">https://cesg.tamu.edu/faculty/jv/</a>&g=
t;<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; OpenRISC mailing list<br>
&gt; <a href=3D"mailto:OpenRISC@lists.librecores.org" target=3D"_blank">Ope=
nRISC@lists.librecores.org</a><br>
&gt; <a href=3D"https://urldefense.com/v3/__https://lists.librecores.org/li=
stinfo/openrisc__;!!KwNVnqRv!XeamcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_=
r7QIXO8QgYezYmyWEWww$" rel=3D"noreferrer" target=3D"_blank">https://urldefe=
nse.com/v3/__https://lists.librecores.org/listinfo/openrisc__;!!KwNVnqRv!Xe=
amcSRFA-6TeQbLLPh3DDsaf189nUEBWI3f3g8OchDHo_r7QIXO8QgYezYmyWEWww$</a> <br>
&gt; <br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000080161605cbe43749--

--===============4078644955502580184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4078644955502580184==--
