Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C67FE107382
	for <lists+openrisc@lfdr.de>; Fri, 22 Nov 2019 14:41:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7C8072077F;
	Fri, 22 Nov 2019 14:41:27 +0100 (CET)
Received: from llsa735-a17.servidoresdns.net (llsa735-a17.servidoresdns.net
 [82.223.190.26])
 by mail.librecores.org (Postfix) with ESMTPS id E0B292077F
 for <openrisc@lists.librecores.org>; Fri, 22 Nov 2019 14:41:25 +0100 (CET)
Received: from EW10PR1SI054 (unknown [185.70.174.4])
 by llsa735-a17.servidoresdns.net (Postfix) with ESMTPA id 47KHdc6rDyz2tCq
 for <openrisc@lists.librecores.org>; Fri, 22 Nov 2019 14:41:24 +0100 (CET)
From: <ecalvo@2se.es>
To: "'Openrisc'" <openrisc@lists.librecores.org>
Date: Fri, 22 Nov 2019 14:41:25 +0100
Message-ID: <00a201d5a13a$89b42f80$9d1c8e80$@2se.es>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdWhOoia52Limp8uSOmp+dZFEqzr+Q==
Content-Language: es
Subject: [OpenRISC] tick timer doubt
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
Content-Type: multipart/mixed; boundary="===============7620663041349691257=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This is a multipart message in MIME format.

--===============7620663041349691257==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00A3_01D5A142.EB7D7980"
Content-Language: es

This is a multipart message in MIME format.

------=_NextPart_000_00A3_01D5A142.EB7D7980
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi!!

 

I have some doubts about the tick timer. Could someone help me? I explain
them below

 

*	I don't understand really well the example of or1k timer control
that is in that file: For example, how is ticks variable updated? 
*	If it was updated, I understand that if frequency is 100Hz, a new
tick takes place each 0.01 seg and with 100 ticks, a second has elapsed.
However, If I compile and run this code and, and I open with gtkwave the
generated vcd, I don't understand why the value of TTMR register is 1000000.
Is The value of TTMR register fixed by software using or1k_timer_set_period
function? Is it measured in Hz?

 

Thanks in advance


------=_NextPart_000_00A3_01D5A142.EB7D7980
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EstiloCorreo17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
	{mso-list-id:505021750;
	mso-list-type:hybrid;
	mso-list-template-ids:956083296 -1448449528 201981955 201981957 =
201981953 201981955 201981957 201981953 201981955 201981957;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DES =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hi!!<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>I have some doubts about the tick timer. Could someone help =
me? I explain them below<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><ul style=3D'margin-top:0cm' =
type=3Ddisc><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo1'><span lang=3DEN-GB>I =
don&#8217;t understand really well the example of or1k timer control =
that is in that file: For example, how is ticks variable updated? =
<o:p></o:p></span></li><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo1'><span lang=3DEN-GB>If =
it was updated, I understand that if frequency is 100Hz, a new tick =
takes place each 0.01 seg and with 100 ticks, a second has elapsed. =
However, If I compile and run this code and, and I open with gtkwave the =
generated vcd, I don&#8217;t understand why the value of TTMR register =
is 1000000. Is The value of TTMR register fixed by software using =
or1k_timer_set_period function? Is it measured in =
Hz?<o:p></o:p></span></li></ul><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Thanks in advance<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_00A3_01D5A142.EB7D7980--


--===============7620663041349691257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============7620663041349691257==--

