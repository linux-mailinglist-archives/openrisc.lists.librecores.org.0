Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1E7108B61
	for <lists+openrisc@lfdr.de>; Mon, 25 Nov 2019 11:09:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BBEC82079F;
	Mon, 25 Nov 2019 11:09:03 +0100 (CET)
Received: from llsa735-a17.servidoresdns.net (llsa735-a17.servidoresdns.net
 [82.223.190.26])
 by mail.librecores.org (Postfix) with ESMTPS id 6DE0B20383
 for <openrisc@lists.librecores.org>; Mon, 25 Nov 2019 11:09:02 +0100 (CET)
Received: from EW10PR1SI054 (unknown [185.70.174.4])
 by llsa735-a17.servidoresdns.net (Postfix) with ESMTPA id 47M2n94TZdz2vhW;
 Mon, 25 Nov 2019 11:09:01 +0100 (CET)
From: <ecalvo@2se.es>
To: "'Stafford Horne'" <shorne@gmail.com>
References: <00a201d5a13a$89b42f80$9d1c8e80$@2se.es>
 <CAAfxs75A61B8H8iBS1ibXo2SGg=fY9jBjsNAucSFASBVP=rp+g@mail.gmail.com>
 <00b501d5a369$2b89ea90$829dbfb0$@2se.es>
 <CAAfxs75RqOV_0BVB_-5uyFjJrK2fFqU-_-rtQq65yy4EN0KgTQ@mail.gmail.com>
In-Reply-To: <CAAfxs75RqOV_0BVB_-5uyFjJrK2fFqU-_-rtQq65yy4EN0KgTQ@mail.gmail.com>
Date: Mon, 25 Nov 2019 11:09:03 +0100
Message-ID: <00e601d5a378$5e11b740$1a3525c0$@2se.es>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKtbKg5s03zrnGo6CAnu1DEvIetTQImu6BkAbG7p1YCYsRqB6W6MO6g
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
Cc: 'Openrisc' <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============0114820895958047451=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This is a multipart message in MIME format.

--===============0114820895958047451==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E7_01D5A380.BFD89040"
Content-Language: es

This is a multipart message in MIME format.

------=_NextPart_000_00E7_01D5A380.BFD89040
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Okk, but, independently of the ticks variable updating,  ttmr =
register=E2=80=A6 should it have the value that has been configured with =
 =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga432f3=
4016f4f559c29b0be4fbc87e623> or1k_timer_init?

=20

=20

De: Stafford Horne <shorne@gmail.com>=20
Enviado el: lunes, 25 de noviembre de 2019 10:22
Para: ecalvo@2se.es
CC: Openrisc <openrisc@lists.librecores.org>
Asunto: Re: [OpenRISC] tick timer doubt

=20

Good point,

=20

I think it's missing a line to update the ticks variable.

=20

I terms of ttmr I am not sure if there is anything won't there.  I'll =
try to run it and fix it when I get a chance.

=20

On Mon, Nov 25, 2019, 5:20 PM < <mailto:ecalvo@2se.es> ecalvo@2se.es> =
wrote:

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

It is in the file and also here:  =
<https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#gaf7608=
67d2f9d04f0c101c4c4975b0616> =
https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#gaf76086=
7d2f9d04f0c101c4c4975b0616

=20

Elisa

=20

De: Stafford Horne <shorne@gmail.com <mailto:shorne@gmail.com> >=20
Enviado el: domingo, 24 de noviembre de 2019 1:05
Para: ecalvo@2se.es <mailto:ecalvo@2se.es>=20
CC: Openrisc <openrisc@lists.librecores.org =
<mailto:openrisc@lists.librecores.org> >
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

On Fri, Nov 22, 2019, 10:41 PM < <mailto:ecalvo@2se.es> ecalvo@2se.es> =
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
 <mailto:OpenRISC@lists.librecores.org> OpenRISC@lists.librecores.org
 <https://lists.librecores.org/listinfo/openrisc> =
https://lists.librecores.org/listinfo/openrisc


------=_NextPart_000_00E7_01D5A380.BFD89040
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
p.m-8809720454035437317m-5271582089663214313msolistparagraph, =
li.m-8809720454035437317m-5271582089663214313msolistparagraph, =
div.m-8809720454035437317m-5271582089663214313msolistparagraph
	=
{mso-style-name:m_-8809720454035437317m-5271582089663214313msolistparagra=
ph;
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
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:703867013;
	mso-list-template-ids:1445214678;}
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
@list l1
	{mso-list-id:1233465757;
	mso-list-template-ids:937333414;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level9
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
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>Okk, but, =
independently of the ticks variable updating,=C2=A0 ttmr =
register=E2=80=A6 should it have the value that has been configured with =
</span><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga432f34016f4f559c29b0be4fbc87e623" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_init</span></a><span =
lang=3DEN-GB>?<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b>De:</b> Stafford Horne &lt;shorne@gmail.com&gt; =
<br><b>Enviado el:</b> lunes, 25 de noviembre de 2019 =
10:22<br><b>Para:</b> ecalvo@2se.es<br><b>CC:</b> Openrisc =
&lt;openrisc@lists.librecores.org&gt;<br><b>Asunto:</b> Re: [OpenRISC] =
tick timer doubt<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>Good =
point,<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><p =
class=3DMsoNormal><span lang=3DEN-GB>I think it's missing a line to =
update the ticks variable.<o:p></o:p></span></p><div><p =
class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>I terms of ttmr I am not sure if =
there is anything won't there.&nbsp; I'll try to run it and fix it when =
I get a chance.<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>On Mon, Nov 25, 2019, 5:20 PM =
&lt;</span><a href=3D"mailto:ecalvo@2se.es"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>&gt; =
wrote:<o:p></o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5=
.0pt'><div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Hello, <o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Yeah, I think that I have understood what you have sent me =
in the screenshot. <o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>The example that I am referring is this one: =
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:1=
6.5pt'><span lang=3DEN-GB =
style=3D'font-size:10.5pt;font-family:Roboto;color:black'>Example for =
using the default mode:</span><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#604020'>int</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> main() =
{</span><span lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>uint32_t ticks =3D 0;</span><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>uint32_t timerstate;</span><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span style=3D'color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga432f34016f4f559c29b0be4fbc87e623" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_init</span></a></span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>(100);</span><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span style=3D'color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga369138d63850f2a4dfe216315c31f3d4" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_enable</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>();</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#E08000'>while</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> (1) =
{</span><span lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#E08000'>while</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> (ticks =
=3D=3D </span><span style=3D'color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga2baa18c5153c793b7d2a85c6e224cea0" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_get_ticks</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>()) { }</span><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>timerstate =3D </span><span style=3D'color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
gab40473a360aa82273575cdbc4381ac93" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_disable</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>();</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:maroon'>// do =
something atomar</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span style=3D'color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga0e392edcf73b9cf1c0279471ae59d241" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_restore</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>(timerstate);</span><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#E08000'>if</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> (ticks =
=3D=3D 100) {</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>printf(</span><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#002080'>&quot;A second elapsed\n&quot;</span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>);</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span style=3D'color:black'><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
ga456bc40cdfbbbdfd62c936c065457cc2" target=3D"_blank"><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#4665A2'>or1k_timer_reset_ticks</span></a></span><span =
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>();</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'>ticks =
=3D 0;</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;margin-right:6.0pt;margin-left:1.5pt;bac=
kground:#FBFCFD'><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}</span><span lang=3DEN-GB><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>It is in the file and also here: </span><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
gaf760867d2f9d04f0c101c4c4975b0616" target=3D"_blank"><span =
lang=3DEN-GB>https://www.openrisc.io/newlib/docs/html/group__or1k__timer.=
html#gaf760867d2f9d04f0c101c4c4975b0616</span></a><span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>Elisa<o:p></=
o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p><=
/o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>De:</b> =
Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" =
target=3D"_blank">shorne@gmail.com</a>&gt; <br><b>Enviado el:</b> =
domingo, 24 de noviembre de 2019 1:05<br><b>Para:</b> <a =
href=3D"mailto:ecalvo@2se.es" =
target=3D"_blank">ecalvo@2se.es</a><br><b>CC:</b> Openrisc &lt;<a =
href=3D"mailto:openrisc@lists.librecores.org" =
target=3D"_blank">openrisc@lists.librecores.org</a>&gt;<br><b>Asunto:</b>=
 Re: [OpenRISC] tick timer doubt<o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p><=
/o:p></p><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Hello,<o:p></o:p></span></p><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p></div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Which example are you referring to?&nbsp; Have you been =
able to read the architecture specification and understand section 15 on =
tick timer facility?&nbsp; There ttmr is explained, the value 10000000 I =
think indicates a pending timer =
interrupt.<o:p></o:p></span></p></div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p></div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>See the attached =
screenshot.<o:p></o:p></span></p></div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p></div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>-stafford<o:p></o:p></span></p></div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>On Fri, Nov 22, 2019, 10:41 PM &lt;</span><a =
href=3D"mailto:ecalvo@2se.es" target=3D"_blank"><span =
lang=3DEN-GB>ecalvo@2se.es</span></a><span lang=3DEN-GB>&gt; =
wrote:<o:p></o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5=
.0pt'><div><div><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Hi!!<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>I have some doubts about the tick timer. Could someone help =
me? I explain them below<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;<o:p></o:p></span></p><ul type=3Ddisc><li =
class=3Dm-8809720454035437317m-5271582089663214313msolistparagraph =
style=3D'mso-list:l0 level1 lfo3'><span lang=3DEN-GB>I don=E2=80=99t =
understand really well the example of or1k timer control that is in that =
file: For example, how is ticks variable updated? =
<o:p></o:p></span></li><li =
class=3Dm-8809720454035437317m-5271582089663214313msolistparagraph =
style=3D'mso-list:l0 level1 lfo3'><span lang=3DEN-GB>If it was updated, =
I understand that if frequency is 100Hz, a new tick takes place each =
0.01 seg and with 100 ticks, a second has elapsed. However, If I compile =
and run this code and, and I open with gtkwave the generated vcd, I =
don=E2=80=99t understand why the value of TTMR register is 1000000. Is =
The value of TTMR register fixed by software using or1k_timer_set_period =
function? Is it measured in Hz?</span><o:p></o:p></li></ul><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>Thanks in advance</span><o:p></o:p></p></div></div><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span =
lang=3DEN-GB>_______________________________________________<br>OpenRISC =
mailing list<br></span><a href=3D"mailto:OpenRISC@lists.librecores.org" =
target=3D"_blank"><span =
lang=3DEN-GB>OpenRISC@lists.librecores.org</span></a><span =
lang=3DEN-GB><br></span><a =
href=3D"https://lists.librecores.org/listinfo/openrisc" =
target=3D"_blank"><span =
lang=3DEN-GB>https://lists.librecores.org/listinfo/openrisc</span></a><sp=
an =
lang=3DEN-GB><o:p></o:p></span></p></blockquote></div></div></div></div><=
/blockquote></div></div></body></html>
------=_NextPart_000_00E7_01D5A380.BFD89040--


--===============0114820895958047451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0114820895958047451==--

