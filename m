Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E3F321089F9
	for <lists+openrisc@lfdr.de>; Mon, 25 Nov 2019 09:20:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1ACEB20225;
	Mon, 25 Nov 2019 09:20:19 +0100 (CET)
Received: from llsk281-a17.servidoresdns.net (llsk281-a17.servidoresdns.net
 [82.223.190.12])
 by mail.librecores.org (Postfix) with ESMTPS id 8F23D20383
 for <openrisc@lists.librecores.org>; Mon, 25 Nov 2019 09:20:16 +0100 (CET)
Received: from EW10PR1SI054 (unknown [185.70.174.4])
 by llsk281-a17.servidoresdns.net (Postfix) with ESMTPA id 47M0Mf49q1z1wHm;
 Mon, 25 Nov 2019 09:20:14 +0100 (CET)
From: <ecalvo@2se.es>
To: "'Stafford Horne'" <shorne@gmail.com>,
 "'Openrisc'" <openrisc@lists.librecores.org>
References: <00a201d5a13a$89b42f80$9d1c8e80$@2se.es>
 <CAAfxs75A61B8H8iBS1ibXo2SGg=fY9jBjsNAucSFASBVP=rp+g@mail.gmail.com>
In-Reply-To: <CAAfxs75A61B8H8iBS1ibXo2SGg=fY9jBjsNAucSFASBVP=rp+g@mail.gmail.com>
Date: Mon, 25 Nov 2019 09:20:16 +0100
Message-ID: <00b501d5a369$2b89ea90$829dbfb0$@2se.es>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKtbKg5s03zrnGo6CAnu1DEvIetTQImu6BkpdrCUgA=
Content-Language: es
Subject: Re: [OpenRISC] tick timer doubt
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
Content-Type: multipart/mixed; boundary="===============1481880770557775580=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This is a multipart message in MIME format.

--===============1481880770557775580==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00B6_01D5A371.8D9371E0"
Content-Language: es

This is a multipart message in MIME format.

------=_NextPart_000_00B6_01D5A371.8D9371E0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,=20

=20

=20

Yeah, I think that I have understood what you have sent me in the =
screenshot.=20

=20

The example that I am referring is this one:=20

=20

Example for using the default mode:

int main() {

uint32_t ticks =3D 0;

uint32_t timerstate;

 =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga432f3=
4016f4f559c29b0be4fbc87e623> or1k_timer_init(100);

 =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga36913=
8d63850f2a4dfe216315c31f3d4> or1k_timer_enable();

while (1) {

while (ticks =3D=3D  =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga2baa1=
8c5153c793b7d2a85c6e224cea0> or1k_timer_get_ticks()) { }

timerstate =3D  =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#gab4047=
3a360aa82273575cdbc4381ac93> or1k_timer_disable();

// do something atomar

 =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga0e392=
edcf73b9cf1c0279471ae59d241> or1k_timer_restore(timerstate);

if (ticks =3D=3D 100) {

printf("A second elapsed\n");

 =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga456bc=
40cdfbbbdfd62c936c065457cc2> or1k_timer_reset_ticks();

ticks =3D 0;

}

}

}

It is in the file and also here: =
https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#gaf76086=
7d2f9d04f0c101c4c4975b0616

=20

Elisa

=20

De: Stafford Horne <shorne@gmail.com>=20
Enviado el: domingo, 24 de noviembre de 2019 1:05
Para: ecalvo@2se.es
CC: Openrisc <openrisc@lists.librecores.org>
Asunto: Re: [OpenRISC] tick timer doubt

=20

Hello,

=20

Which example are you referring to?  Have you been able to read the =
architecture specification and understand section 15 on tick timer =
facility?  There ttmr is explained, the value 10000000 I think indicates =
a pending timer interrupt.

=20

See the attached screenshot.

=20

-stafford

=20

On Fri, Nov 22, 2019, 10:41 PM <ecalvo@2se.es <mailto:ecalvo@2se.es> > =
wrote:

Hi!!

=20

I have some doubts about the tick timer. Could someone help me? I =
explain them below

=20

*	I don=E2=80=99t understand really well the example of or1k timer =
control that is in that file: For example, how is ticks variable =
updated?=20
*	If it was updated, I understand that if frequency is 100Hz, a new tick =
takes place each 0.01 seg and with 100 ticks, a second has elapsed. =
However, If I compile and run this code and, and I open with gtkwave the =
generated vcd, I don=E2=80=99t understand why the value of TTMR register =
is 1000000. Is The value of TTMR register fixed by software using =
or1k_timer_set_period function? Is it measured in Hz?

=20

Thanks in advance

_______________________________________________
OpenRISC mailing list
OpenRISC@lists.librecores.org <mailto:OpenRISC@lists.librecores.org>=20
https://lists.librecores.org/listinfo/openrisc


------=_NextPart_000_00B6_01D5A371.8D9371E0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Roboto;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.m-5271582089663214313msolistparagraph, =
li.m-5271582089663214313msolistparagraph, =
div.m-5271582089663214313msolistparagraph
	{mso-style-name:m_-5271582089663214313msolistparagraph;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EstiloCorreo19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.keywordtype
	{mso-style-name:keywordtype;}
span.keywordflow
	{mso-style-name:keywordflow;}
span.comment
	{mso-style-name:comment;}
span.stringliteral
	{mso-style-name:stringliteral;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:826751311;
	mso-list-template-ids:-1551364796;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DES link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'mso-fareast-language:EN-US'>Hello, <o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Yeah, I think that I have =
understood what you have sent me in the screenshot. =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>The example that I am referring is =
this one: <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:1=
6.5pt'><span lang=3DEN-GB =
style=3D'font-size:10.5pt;font-family:Roboto;color:black'>Example for =
using the default mode:<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#604020'>int</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> main() =
{<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>uint32_t ticks =3D 0;<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>uint32_t timerstate;<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga432f34016f4f559c29b0be4fbc87e623"><span lang=3DEN-GB =
style=3D'color:#4665A2'>or1k_timer_init</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>(100);<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga369138d63850f2a4dfe216315c31f3d4"><span lang=3DEN-GB =
style=3D'color:#4665A2'>or1k_timer_enable</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>();<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#E08000'>while</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> (1) =
{<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#E08000'>while</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> (ticks =
=3D=3D </span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga2baa18c5153c793b7d2a85c6e224cea0"><span lang=3DEN-GB =
style=3D'color:#4665A2'>or1k_timer_get_ticks</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>()) { }<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>timerstate =3D </span><span =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
gab40473a360aa82273575cdbc4381ac93"><span lang=3DEN-GB =
style=3D'color:#4665A2'>or1k_timer_disable</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>();<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:maroon'>// do something atomar</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga0e392edcf73b9cf1c0279471ae59d241"><span lang=3DEN-GB =
style=3D'color:#4665A2'>or1k_timer_restore</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>(timerstate);<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#E08000'>if</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> (ticks =
=3D=3D 100) {<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>printf(</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#002080'>&quot;A second elapsed\n&quot;</span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>);<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga456bc40cdfbbbdfd62c936c065457cc2"><span lang=3DEN-GB =
style=3D'color:#4665A2'>or1k_timer_reset_ticks</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>();<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>ticks =3D 0;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0cm;margin-right:6.0pt;margin-bottom:0cm;marg=
in-left:1.5pt;margin-bottom:.0001pt;text-indent:-39.75pt;background:#FBFC=
FD'><span lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>It is in the file and =
also here: <a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
gaf760867d2f9d04f0c101c4c4975b0616">https://www.openrisc.io/newlib/docs/h=
tml/group__or1k__timer.html#gaf760867d2f9d04f0c101c4c4975b0616</a><o:p></=
o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Elisa<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b>De:</b> Stafford Horne &lt;shorne@gmail.com&gt; =
<br><b>Enviado el:</b> domingo, 24 de noviembre de 2019 =
1:05<br><b>Para:</b> ecalvo@2se.es<br><b>CC:</b> Openrisc =
&lt;openrisc@lists.librecores.org&gt;<br><b>Asunto:</b> Re: [OpenRISC] =
tick timer doubt<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Which example are you referring to?&nbsp; Have you =
been able to read the architecture specification and understand section =
15 on tick timer facility?&nbsp; There ttmr is explained, the value =
10000000 I think indicates a pending timer =
interrupt.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>See the attached =
screenshot.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>-stafford<o:p></o:p></p></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal>On =
Fri, Nov 22, 2019, 10:41 PM &lt;<a =
href=3D"mailto:ecalvo@2se.es">ecalvo@2se.es</a>&gt; =
wrote:<o:p></o:p></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>Hi!!<o:p></o=
:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p><=
/o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>I have some doubts about the tick timer. Could someone help =
me? I explain them below</span><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><ul type=3Ddisc><li =
class=3Dm-5271582089663214313msolistparagraph style=3D'mso-list:l0 =
level1 lfo1'><span lang=3DEN-GB>I don=E2=80=99t understand really well =
the example of or1k timer control that is in that file: For example, how =
is ticks variable updated? </span><o:p></o:p></li><li =
class=3Dm-5271582089663214313msolistparagraph style=3D'mso-list:l0 =
level1 lfo1'><span lang=3DEN-GB>If it was updated, I understand that if =
frequency is 100Hz, a new tick takes place each 0.01 seg and with 100 =
ticks, a second has elapsed. However, If I compile and run this code =
and, and I open with gtkwave the generated vcd, I don=E2=80=99t =
understand why the value of TTMR register is 1000000. Is The value of =
TTMR register fixed by software using or1k_timer_set_period function? Is =
it measured in Hz?</span><o:p></o:p></li></ul><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Thanks in advance</span><o:p></o:p></p></div></div><p =
class=3DMsoNormal>_______________________________________________<br>Open=
RISC mailing list<br><a href=3D"mailto:OpenRISC@lists.librecores.org" =
target=3D"_blank">OpenRISC@lists.librecores.org</a><br><a =
href=3D"https://lists.librecores.org/listinfo/openrisc" =
target=3D"_blank">https://lists.librecores.org/listinfo/openrisc</a><o:p>=
</o:p></p></blockquote></div></div></div></body></html>
------=_NextPart_000_00B6_01D5A371.8D9371E0--


--===============1481880770557775580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============1481880770557775580==--

