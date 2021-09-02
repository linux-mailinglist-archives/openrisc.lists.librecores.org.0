Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2033FF372
	for <lists+openrisc@lfdr.de>; Thu,  2 Sep 2021 20:49:25 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BC2F524104;
	Thu,  2 Sep 2021 20:49:24 +0200 (CEST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mail.librecores.org (Postfix) with ESMTPS id C31AB2127E
 for <openrisc@lists.librecores.org>; Thu,  2 Sep 2021 20:49:23 +0200 (CEST)
Received: by mail-lj1-f182.google.com with SMTP id g14so5402822ljk.5
 for <openrisc@lists.librecores.org>; Thu, 02 Sep 2021 11:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7F0mO/1y7UpjFokBX43Yy/wb6kIK+KNuF+9xXLaV+8=;
 b=GZ9LbPXNuIAZ5bGRp1B5f0mEz7ujJ3VfjBiXxfncFTn8PQ8HCa/cHRtTJ3hDwKSHeK
 U+l6xRQlsZT/1QZWLy+VNV+6aU5gOw5mJC07GO0IMXLFuaVibFCU0+nPR/WnpaekzefI
 9juPufpUPbTALXqUSoRtIdkkfyPH8MU9evOQSksvI/7Ex3EO2P7mlVnN5d542Sn4g79D
 FYqu5eOU/6gkBoUZpVK7KhLCro7t28IUb6lcEbCxUoS74Uf/0pjprv4tV8TiPtb7YMz6
 OjWqUcOe/TpwwQhHQ/mKp0sI3LMLDsRZWtW88Vk9Z5P2XHP+1Ss8lBC3dUvGp5VghBLu
 I9/w==
X-Gm-Message-State: AOAM533bSWXdzBQtiPr79P2KWGMrS53ScpbuywtgU5+Ar9hT6NDgOISO
 fia+uI4BXl93m/fYr6psC6Bcs8tnQz47WQ+o1KA=
X-Google-Smtp-Source: ABdhPJxskE8PBB/xMiebXjwBpgbpQzOiE2eiFc1/kAQLu9s+JUfsIVbYunMSXk4QuyQ1xIaY5Wbtkb33VdF+77ZSo+Y=
X-Received: by 2002:a2e:b703:: with SMTP id j3mr3724783ljo.63.1630608563096;
 Thu, 02 Sep 2021 11:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPV5DU64Hja40XHgvUz2ph7gcBtNWinUNH633vCfxH7vxEvshA@mail.gmail.com>
In-Reply-To: <CAPV5DU64Hja40XHgvUz2ph7gcBtNWinUNH633vCfxH7vxEvshA@mail.gmail.com>
From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Date: Thu, 2 Sep 2021 21:49:12 +0300
Message-ID: <CADzBsGPS1McirO2W_HRJxDr94DCh-63bEqCfF1ABjPTYPEH3+A@mail.gmail.com>
To: Jeyavijayan Rajendran <jeyavijayan@tamu.edu>,
 Openrisc <openrisc@lists.librecores.org>
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
Cc: Rahul Kande <rahulkande@tamu.edu>, Addison Crump <addisoncrump@tamu.edu>,
 Ahmad-Reza Sadeghi <ahmad.sadeghi@trust.tu-darmstadt.de>,
 Aakash Tyagi <tyagi@cse.tamu.edu>
Content-Type: multipart/mixed; boundary="===============0309279429723497606=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============0309279429723497606==
Content-Type: multipart/alternative; boundary="0000000000002bd00b05cb07a442"

--0000000000002bd00b05cb07a442
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 8:53 PM Jeyavijayan Rajendran <jeyavijayan@tamu.edu>
wrote:

> Dear Developers of the MOR1KX processor,
>
> We are research teams from Texas A&M University and TU Darmstadt. We
> found the following bugs in your MOR1KX processor design (
> https://github.com/openrisc/mor1kx
> <https://urldefense.com/v3/__https://github.com/openrisc/mor1kx__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBiVlQn4uw$>
> ).
>
> We intend to get CVE listing numbers for all these bugs to include in our
> research paper. Hence, we would like to disclose these bugs to you before
> we request CVE IDs.
>
> Please respond to us by *10th Sept 2021, 11:59 PM UTC *with your
> acknowledgment of the bugs.
>
> In case you are not authorized to comment on the bugs, please connect us
> with the right contact person or channel for this matter.
>
> Also, let us know if your processor design is one of the CNA-covered
> products (https://cve.mitre.org/cve/cna.html
> <https://urldefense.com/v3/__https://cve.mitre.org/cve/cna.html__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi93tT1sQ$>)
> so that we can include the same in our CVE listing.
>
>
> Vendor of the product(s): openrisc
>
>
> Bug 1:
>
> Bug: The carry flag is incorrectly implemented for subtract instructions.
>
> Location:  mor1kx_execute_alu.v (
> https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v
> <https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi4Qmr_iI$>
> ).
>
> Triggering input:
>
> //set r1=00020000 and r3=00002000
>
>      l.sub    r4,r1,r3
>
> Expected output:
>
>                Carry flag = 0
>
>
> mor1kx output:
>
>               Carry flag = 1
>
>
>
> Bug 2:
>
> Bug: The EPCR register is accessible from user mode.
>
> Location:  mor1kx_ctrl_cappuccino.v (
> https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v
> <https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6Jz-sng$>
> ).
>
> Details: The OpenRISC specification requires that the EPCR register be
> accessible only from supervisor mode.
>
> Triggering input:
>
> #include <stdio.h>
>
> int main() {
>
>   // enter user mode :
>
>   asm volatile ( "l.ori r17,r0,0x0000  ");
>
>   asm volatile ( "l.mtspr r0,r17,0x3806");
>
>
>   asm volatile ( "l.mfspr r17,r0,0x11  ");
>
>   asm volatile ( "l.andi r17,r17,-2    ");
>
>   asm volatile ( "l.mtspr r0,r17,0x11  ");
>
>   // padding the seed code
>
>   asm volatile( "l.nop 0x0 ");
>
>   asm volatile( "l.nop 0x0 ");
>
>   asm volatile( "l.nop 0x0 ");
>
>   asm volatile( "l.nop 0x0 ");
>
>   asm volatile ("l.addi r1,r0,1");
>
>   asm volatile ("l.mfspr r2,r0,32");
>
>   asm volatile ("l.mtspr r0, r1, 32");
>
>   return 0;
>
> }
>
>
> The or1ksim fails to execute the mfspr while the mor1kx implementation
> can successfully write into EPCR using the mtspr instruction.
>
>
> Bug 3:
>
> Bug: Unable to write to the EEAR register from the supervisor mode.
>
> Location:  mor1kx_ctrl_cappuccino.v (
> https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v
> <https://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6Jz-sng$>),
> line 830 to 840.
>
> Details: The OpenRISC specification requires that the EEAR register be
> accessible from the supervisor mode but the mor1kx implementation does not
> have the option to write to EEAR with the mtspr instruction even from the
> supervisor mode.
>
>
> Sincerely,
>
> JV, Ahmad, Aakash, Addison, and Rahul.
>
> --
> JV Rajendran,
> Assistant Professor of Electrical and Computer Engineering,
> Texas A&M University.
> Web: https://cesg.tamu.edu/faculty/jv/
>

--0000000000002bd00b05cb07a442
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Sep 2, 2021 at 8:53 PM Jeyavijayan Rajendran &=
lt;<a href=3D"mailto:jeyavijayan@tamu.edu">jeyavijayan@tamu.edu</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">Dear Developers of the MOR=
1KX processor,=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);vertical-align:baseline;white-space:pre-w=
rap">We are research team</span><span style=3D"background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-size:11pt;=
font-family:Verdana;color:rgb(0,0,0);vertical-align:baseline;white-space:pr=
e-wrap">s</span><span style=3D"background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);vertical-align:baseline;white-space:pre-wrap"> from Texa=
s A&amp;M University and TU Darmstadt. We found the following bugs in your =
MOR1KX processor design (<a href=3D"https://urldefense.com/v3/__https://git=
hub.com/openrisc/mor1kx__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2=
CfnwuMzUMLkGpkd-6OXtBiVlQn4uw$" target=3D"_blank">https://github.com/openri=
sc/mor1kx</a>).</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
We intend to get CVE listing numbers for all these bugs to include in our r=
esearch paper. Hence, we would like to disclose these bugs to you before we=
 request CVE IDs. </span><span style=3D"font-size:11pt;font-family:Arial;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0</span></p><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">Please respond to us by=C2=A0<b><u>10th Sept=
 2021, 11:59 PM UTC </u></b>with your acknowledgment of the bugs. </span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">In case you are not authorized to comment=
 on the bugs, please connect us with the right contact person or channel </=
span><span style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">for this matter. </span><span style=3D"font-size:11pt;font-family:A=
rial;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Also, let us know if your processor d=
esign is one of the CNA-covered products (</span><a href=3D"https://urldefe=
nse.com/v3/__https://cve.mitre.org/cve/cna.html__;!!KwNVnqRv!SNshfFgKzp1a7X=
2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi93tT1sQ$" style=3D"text-decor=
ation-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-famil=
y:Arial;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-decoration-line:underline;vertical-align:baseline=
;white-space:pre-wrap">https://cve.mitre.org/cve/cna.html</span></a><span s=
tyle=3D"font-size:11pt;font-family:Arial;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">) so that we can include the same in our CVE listi=
ng.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap"><br></span></p><p dir=3D"ltr"=
 style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Vendor of the product(s): openrisc</span></p><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><br style=3D=
"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif"></p><p dir=3D"l=
tr" style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line=
-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:15=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:700;font-variant-numeric:normal;font-variant-east-asian:normal;text-dec=
oration-line:underline;vertical-align:baseline;white-space:pre-wrap">Bug 1:=
</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,Hel=
vetica,sans-serif;line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:700;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">Bug:</span><spa=
n style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap"> The carry flag is incorrectly=
 implemented for </span><span style=3D"font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-style:italic;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">subtract</span><span style=3D"font-size:11pt;font-family:Ar=
ial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-w=
rap"> instructions.</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);fo=
nt-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-weight:700;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Location: </span><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=
=A0mor1kx_execute_alu.v (</span><a href=3D"https://urldefense.com/v3/__http=
s://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v=
__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi4=
Qmr_iI$" style=3D"text-decoration-line:none" target=3D"_blank"><span style=
=3D"font-size:11pt;font-family:Arial;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://github.com/open=
risc/mor1kx/blob/master/rtl/verilog/mor1kx_execute_alu.v</span></a><span st=
yle=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">).</span></p><p dir=3D"ltr" style=
=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:1=
.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:700;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">Triggering input:=C2=A0</span></p><p dir=3D"lt=
r" style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-=
height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weig=
ht:700;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">	</span><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight=
:700;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">	</span><span style=3D"font-size:11pt;fo=
nt-family:&quot;Courier New&quot;;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">//set r1=3D00020000 and r3=3D00002000</s=
pan></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,Helvet=
ica,sans-serif;line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0l.sub=C2=A0 =C2=A0 r4,r1,r3=C2=A0</span></p><p dir=3D"ltr" s=
tyle=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:&quot;Times New Roman&quot;;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">Expected output:=C2=
=A0</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,=
Helvetica,sans-serif;line-height:1.656;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:&quot;Times New Roman&quot;;color:r=
gb(0,0,0);background-color:transparent;font-weight:700;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"font-size:11pt;font-family=
:&quot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">Carry flag =3D 0</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><br style=3D"color:r=
gb(80,0,80);font-family:Arial,Helvetica,sans-serif"></p><p dir=3D"ltr" styl=
e=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:=
1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:700;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">mor1kx output:=C2=A0</span></p><p dir=3D"ltr"=
 style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-he=
ight:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:&quot;Times New Roman&quot;;color:rgb(0,0,0);background-color:t=
ransparent;font-weight:700;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><s=
pan style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Carry flag=
 =3D 1</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><br style=3D"color:rgb(80,0,80);font-family:Arial,Helvetic=
a,sans-serif"><br style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,s=
ans-serif"></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial=
,Helvetica,sans-serif;line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:15pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-weight:700;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">Bug 2:</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,=
80);font-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-weight:700;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">Bug:</span><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"> The =
EPCR register is accessible from user mode.</span></p><p dir=3D"ltr" style=
=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:1=
.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:700;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">Location: </span><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">=C2=A0mor1kx_ctrl_cappuccino.v (</span><a href=3D"https=
://urldefense.com/v3/__https://github.com/openrisc/mor1kx/blob/master/rtl/v=
erilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!SNshfFgKzp1a7X2JYV-4kru80LEyB-=
7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6Jz-sng$" style=3D"text-decoration-line:none"=
 target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;text-decoration-line:underline;vertical-align:baseline;white-space:pre=
-wrap">https://github.com/openrisc/mor1kx/blob/master/rtl/verilog/mor1kx_ct=
rl_cappuccino.v</span></a><span style=3D"font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
).</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,H=
elvetica,sans-serif;line-height:1.656;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:700;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">Details: </sp=
an><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">The OpenRISC specificat=
ion requires that the EPCR register be accessible only from supervisor mode=
.=C2=A0</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Ar=
ial,Helvetica,sans-serif;line-height:1.656;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-weight:700;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Triggeri=
ng input:=C2=A0</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-f=
amily:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;=
Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">#include &lt;stdio.h&gt;</span></p><p dir=3D"ltr" style=
=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:1=
.656;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">int main() {</span></p><p d=
ir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-ser=
if;line-height:1.656;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=
=A0// enter user mode :</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80=
);font-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:&quot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">=C2=A0=C2=A0asm volatile ( &quot;l.ori r17,r0,0x=
0000=C2=A0 &quot;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);fo=
nt-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&q=
uot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">=C2=A0=C2=A0asm volatile ( &quot;l.mtspr r0,r17,0x38=
06&quot;);</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><br style=3D"color:rgb(80,0,80);font-family:Arial,Helv=
etica,sans-serif"></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-famil=
y:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Cour=
ier New&quot;;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">=C2=A0=C2=A0asm volatile ( &quot;l.mfspr r17,r0,0x11=C2=A0 &=
quot;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Ar=
ial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Courier =
New&quot;;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">=C2=A0=C2=A0asm volatile ( &quot;l.andi r17,r17,-2=C2=A0 =C2=A0 =
&quot;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:A=
rial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Courier=
 New&quot;;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">=C2=A0=C2=A0asm volatile ( &quot;l.mtspr r0,r17,0x11=C2=A0 &quo=
t;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial=
,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Courier New=
&quot;;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">=C2=A0=C2=A0// padding the seed code</span></p><p dir=3D"ltr" style=
=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:1=
.656;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0asm volatile( &=
quot;l.nop 0x0 &quot;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80=
);font-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:&quot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">=C2=A0=C2=A0asm volatile( &quot;l.nop 0x0 &quot;=
);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,H=
elvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Courier New&q=
uot;;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">=C2=A0=C2=A0asm volatile( &quot;l.nop 0x0 &quot;);</span></p><p dir=
=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif=
;line-height:1.656;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0a=
sm volatile( &quot;l.nop 0x0 &quot;);</span></p><p dir=3D"ltr" style=3D"col=
or:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:1.656;ma=
rgin-left:36pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:&quot;Courier New&quot;;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0asm volatile (&quot;l.=
addi r1,r0,1&quot;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);f=
ont-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&=
quot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">=C2=A0=C2=A0asm volatile (&quot;l.mfspr r2,r0,32&qu=
ot;);</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Aria=
l,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Courier Ne=
w&quot;;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">=C2=A0=C2=A0asm volatile (&quot;l.mtspr r0, r1, 32&quot;);</span><=
/p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,s=
ans-serif;line-height:1.656;margin-left:36pt;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=
=A0=C2=A0return 0;</span></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);fon=
t-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-left:36pt;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&qu=
ot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">}</span></p><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><br style=3D"color:rgb(80,0,80);font-fami=
ly:Arial,Helvetica,sans-serif"></p><p dir=3D"ltr" style=3D"color:rgb(80,0,8=
0);font-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The or1=
ksim fails to execute the </span><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-style:italic;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">mfspr </span><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">while the mor1kx implementation can successfully write into EPC=
R using the </span><span style=3D"font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-style:italic;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">mtspr </span><span style=3D"font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">in=
struction.=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><br style=3D"color:rgb(80,0,80);font-family:Aria=
l,Helvetica,sans-serif"></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font=
-family:Arial,Helvetica,sans-serif;line-height:1.656;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:15pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-weight:700;font-variant-numeric:normal;=
font-variant-east-asian:normal;text-decoration-line:underline;vertical-alig=
n:baseline;white-space:pre-wrap">Bug 3:</span></p><p dir=3D"ltr" style=3D"c=
olor:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-height:1.656;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:700;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Bug:</span><span style=3D"font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap"> Unable to write to the EEAR register from the supervisor mode.</s=
pan></p><p dir=3D"ltr" style=3D"color:rgb(80,0,80);font-family:Arial,Helvet=
ica,sans-serif;line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-weight:700;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">Location: </span><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">=C2=A0mor1kx_ctrl_cappuccin=
o.v (</span><a href=3D"https://urldefense.com/v3/__https://github.com/openr=
isc/mor1kx/blob/master/rtl/verilog/mor1kx_ctrl_cappuccino.v__;!!KwNVnqRv!SN=
shfFgKzp1a7X2JYV-4kru80LEyB-7pSHRNT2CfnwuMzUMLkGpkd-6OXtBi6Jz-sng$" style=
=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:1=
1pt;font-family:Arial;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;text-decoration-line:underline;vertical-=
align:baseline;white-space:pre-wrap">https://github.com/openrisc/mor1kx/blo=
b/master/rtl/verilog/mor1kx_ctrl_cappuccino.v</span></a><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">), line 830 to 840.</span></p><p dir=3D"ltr" =
style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif;line-hei=
ght:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:=
700;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Details: </span><span style=3D"font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">The OpenRISC specification requires that the EEAR r=
egister be accessible from the supervisor mode but the mor1kx implementatio=
n does not have the option to write to EEAR with the </span><span style=3D"=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-style:italic;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">mtspr </span><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">instruction even from the supervisor=
 mode.=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><br style=3D"color:rgb(80,0,80);font-family:Arial,He=
lvetica,sans-serif"></p><p style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt">Sincerely,</p><p style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt">JV, Ahmad, Aakash, Addison, and Rahul.</p></div><div><br></di=
v>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"verdana, sans-seri=
f">JV Rajendran,</font><div><font face=3D"verdana, sans-serif">Assistant Pr=
ofessor of Electrical and Computer Engineering,=C2=A0<br>Texas A&amp;M Univ=
ersity.</font></div><div><font face=3D"verdana, sans-serif">Web:=C2=A0<a hr=
ef=3D"https://cesg.tamu.edu/faculty/jv/" target=3D"_blank">https://cesg.tam=
u.edu/faculty/jv/</a></font></div></div></div></div>
</blockquote></div>

--0000000000002bd00b05cb07a442--

--===============0309279429723497606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0309279429723497606==--
