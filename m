Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4F08A108AB3
	for <lists+openrisc@lfdr.de>; Mon, 25 Nov 2019 10:22:26 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1290120383;
	Mon, 25 Nov 2019 10:22:26 +0100 (CET)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mail.librecores.org (Postfix) with ESMTPS id 80A6A20225
 for <openrisc@lists.librecores.org>; Mon, 25 Nov 2019 10:22:24 +0100 (CET)
Received: by mail-ua1-f52.google.com with SMTP id w10so4152780uar.12
 for <openrisc@lists.librecores.org>; Mon, 25 Nov 2019 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVsmNJN6Nn7zeKoloZEKEzGzPE9Qkx7bxqlS/EAmylk=;
 b=jXikmd4GnhJyczdQdCdszu4AUbdUjtepEwY8VMgX9TxRf49nTNWicKJJtMKilHtwGU
 yNtKmvj60vuYdUwHHsYL+l6okzMM144cfbfa2I0ISQ/rUZEejrn9e3WxGC3tHzjFjyvI
 KTiPEwxW0VJcQp/0W6f9G8rI0Nfezp6iqykQ+RIwBktPGL25OzEe28J/JwvRZUP3gXvi
 B3msaCbRprJkVg3aWPtxYn0RL1tKs/dUQ9PeG3vfHVuDG2xiUz7CUCdLFCwmYT/OrBIy
 9aa8ovHAQHqiAmmqKVovNOzt9bLKtQaORBOiWvzU4XXUyPuRne7hvcjQAOuebFYFVULR
 6/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVsmNJN6Nn7zeKoloZEKEzGzPE9Qkx7bxqlS/EAmylk=;
 b=AcrLgVhduVmjLoBDCfwj2npyQTwKp0gMjKTneXKo8fkniroBBJoBi+LQF+3rcMbUKi
 Vbro2/sLEi2ES8alFkED+/di0/1BN6czirfnfW8AnVsZXEq/+5u98L0hkPZhzbYEks64
 9OAk65wNxyzq+oQFrRQBoDsqNeogR/8v2j/JwKXZHYhdl055JGe5SdSOL1DpKQy33RwL
 t7TW8r9yu+7OgpqfwZ4g5vb4AkBC/lxwLt50iHy4dOehrMYon3CepB13Sz7LAPUXq2yR
 Cvo53ZsBHtsmooV7nDRk8ayofpdkbOYL/l7wbsaOrTL/FgYBBlT+jtHKM1AhARoKkhcW
 Splw==
X-Gm-Message-State: APjAAAXgdAVT0FxHgRGkcBCkMdNopNM2daY7V/ehaXcMnHdJTHYxM6cK
 mAmUnZf0tDnPpK1mH+SWHT9ZV4NU3Wqq+8Xb/pjjKg==
X-Google-Smtp-Source: APXvYqzeRracbaog0Jj4DvQS2Dg7AEVkaT+x2mm4vid4esiyfHj0nzE2sPZQQSetOMbS8FyFzdAu8nkRDoYZLk7o2oI=
X-Received: by 2002:ab0:3395:: with SMTP id y21mr17100012uap.25.1574673742810; 
 Mon, 25 Nov 2019 01:22:22 -0800 (PST)
MIME-Version: 1.0
References: <00a201d5a13a$89b42f80$9d1c8e80$@2se.es>
 <CAAfxs75A61B8H8iBS1ibXo2SGg=fY9jBjsNAucSFASBVP=rp+g@mail.gmail.com>
 <00b501d5a369$2b89ea90$829dbfb0$@2se.es>
In-Reply-To: <00b501d5a369$2b89ea90$829dbfb0$@2se.es>
From: Stafford Horne <shorne@gmail.com>
Date: Mon, 25 Nov 2019 18:22:08 +0900
Message-ID: <CAAfxs75RqOV_0BVB_-5uyFjJrK2fFqU-_-rtQq65yy4EN0KgTQ@mail.gmail.com>
To: ecalvo@2se.es
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============5794602319574014565=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============5794602319574014565==
Content-Type: multipart/alternative; boundary="00000000000013d3af0598284d3e"

--00000000000013d3af0598284d3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point,

I think it's missing a line to update the ticks variable.

I terms of ttmr I am not sure if there is anything won't there.  I'll try
to run it and fix it when I get a chance.

On Mon, Nov 25, 2019, 5:20 PM <ecalvo@2se.es> wrote:

> Hello,
>
>
>
>
>
> Yeah, I think that I have understood what you have sent me in the
> screenshot.
>
>
>
> The example that I am referring is this one:
>
>
>
> Example for using the default mode:
>
> int main() {
>
> uint32_t ticks =3D 0;
>
> uint32_t timerstate;
>
> or1k_timer_init
> <https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga432f3=
4016f4f559c29b0be4fbc87e623>
> (100);
>
> or1k_timer_enable
> <https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga36913=
8d63850f2a4dfe216315c31f3d4>
> ();
>
> while (1) {
>
> while (ticks =3D=3D or1k_timer_get_ticks
> <https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga2baa1=
8c5153c793b7d2a85c6e224cea0>())
> { }
>
> timerstate =3D or1k_timer_disable
> <https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#gab4047=
3a360aa82273575cdbc4381ac93>
> ();
>
> // do something atomar
>
> or1k_timer_restore
> <https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga0e392=
edcf73b9cf1c0279471ae59d241>
> (timerstate);
>
> if (ticks =3D=3D 100) {
>
> printf("A second elapsed\n");
>
> or1k_timer_reset_ticks
> <https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga456bc=
40cdfbbbdfd62c936c065457cc2>
> ();
>
> ticks =3D 0;
>
> }
>
> }
>
> }
>
> It is in the file and also here:
> https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#gaf76086=
7d2f9d04f0c101c4c4975b0616
>
>
>
> Elisa
>
>
>
> *De:* Stafford Horne <shorne@gmail.com>
> *Enviado el:* domingo, 24 de noviembre de 2019 1:05
> *Para:* ecalvo@2se.es
> *CC:* Openrisc <openrisc@lists.librecores.org>
> *Asunto:* Re: [OpenRISC] tick timer doubt
>
>
>
> Hello,
>
>
>
> Which example are you referring to?  Have you been able to read the
> architecture specification and understand section 15 on tick timer
> facility?  There ttmr is explained, the value 10000000 I think indicates =
a
> pending timer interrupt.
>
>
>
> See the attached screenshot.
>
>
>
> -stafford
>
>
>
> On Fri, Nov 22, 2019, 10:41 PM <ecalvo@2se.es> wrote:
>
> Hi!!
>
>
>
> I have some doubts about the tick timer. Could someone help me? I explain
> them below
>
>
>
>    - I don=E2=80=99t understand really well the example of or1k timer con=
trol
>    that is in that file: For example, how is ticks variable updated?
>    - If it was updated, I understand that if frequency is 100Hz, a new
>    tick takes place each 0.01 seg and with 100 ticks, a second has elapse=
d.
>    However, If I compile and run this code and, and I open with gtkwave t=
he
>    generated vcd, I don=E2=80=99t understand why the value of TTMR regist=
er is
>    1000000. Is The value of TTMR register fixed by software using
>    or1k_timer_set_period function? Is it measured in Hz?
>
>
>
> Thanks in advance
>
> _______________________________________________
> OpenRISC mailing list
> OpenRISC@lists.librecores.org
> https://lists.librecores.org/listinfo/openrisc
>
>

--00000000000013d3af0598284d3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Good point,</div><div dir=3D"auto"><br>=
</div>I think it&#39;s missing a line to update the ticks variable.<div dir=
=3D"auto"><br></div><div dir=3D"auto">I terms of ttmr I am not sure if ther=
e is anything won&#39;t there.=C2=A0 I&#39;ll try to run it and fix it when=
 I get a chance.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Nov 25, 2019, 5:20 PM  &lt;<a href=3D"mailto:=
ecalvo@2se.es">ecalvo@2se.es</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div lang=3D"ES" link=3D"blue" vlink=3D"purple"><div class=3D"m_-8=
809720454035437317WordSection1"><p class=3D"MsoNormal"><span>Hello, <u></u>=
<u></u></span></p><p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span><=
/p><p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p><p class=3D"=
MsoNormal"><span lang=3D"EN-GB">Yeah, I think that I have understood what y=
ou have sent me in the screenshot. <u></u><u></u></span></p><p class=3D"Mso=
Normal"><span lang=3D"EN-GB"><u></u>=C2=A0<u></u></span></p><p class=3D"Mso=
Normal"><span lang=3D"EN-GB">The example that I am referring is this one: <=
u></u><u></u></span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB"><u></u>=
=C2=A0<u></u></span></p><p class=3D"MsoNormal" style=3D"line-height:16.5pt"=
><span lang=3D"EN-GB" style=3D"font-size:10.5pt;font-family:Roboto;color:bl=
ack">Example for using the default mode:<u></u><u></u></span></p><p class=
=3D"MsoNormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.=
5pt;margin-bottom:.0001pt;background:#fbfcfd"><span lang=3D"EN-GB" style=3D=
"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:#604020">int</s=
pan><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Courie=
r New&quot;;color:black"> main() {<u></u><u></u></span></p><p class=3D"MsoN=
ormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;marg=
in-bottom:.0001pt;background:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-si=
ze:10.0pt;font-family:&quot;Courier New&quot;;color:black">uint32_t ticks =
=3D 0;<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D"margin-right=
:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001pt;background=
:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;=
Courier New&quot;;color:black">uint32_t timerstate;<u></u><u></u></span></p=
><p class=3D"MsoNormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;margi=
n-left:1.5pt;margin-bottom:.0001pt;background:#fbfcfd"><span style=3D"font-=
size:10.0pt;font-family:&quot;Courier New&quot;;color:black"><a href=3D"htt=
ps://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga432f34016f4=
f559c29b0be4fbc87e623" target=3D"_blank" rel=3D"noreferrer"><span lang=3D"E=
N-GB" style=3D"color:#4665a2">or1k_timer_init</span></a></span><span lang=
=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;co=
lor:black">(100);<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D"m=
argin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001pt=
;background:#fbfcfd"><span style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><a href=3D"https://www.openrisc.io/newlib/docs/h=
tml/group__or1k__timer.html#ga369138d63850f2a4dfe216315c31f3d4" target=3D"_=
blank" rel=3D"noreferrer"><span lang=3D"EN-GB" style=3D"color:#4665a2">or1k=
_timer_enable</span></a></span><span lang=3D"EN-GB" style=3D"font-size:10.0=
pt;font-family:&quot;Courier New&quot;;color:black">();<u></u><u></u></span=
></p><p class=3D"MsoNormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;m=
argin-left:1.5pt;margin-bottom:.0001pt;background:#fbfcfd"><span lang=3D"EN=
-GB" style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:#e=
08000">while</span><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-fami=
ly:&quot;Courier New&quot;;color:black"> (1) {<u></u><u></u></span></p><p c=
lass=3D"MsoNormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;margin-lef=
t:1.5pt;margin-bottom:.0001pt;background:#fbfcfd"><span lang=3D"EN-GB" styl=
e=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:#e08000">wh=
ile</span><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;=
Courier New&quot;;color:black"> (ticks =3D=3D </span><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Courier New&quot;;color:black"><a href=3D"https=
://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga2baa18c5153c7=
93b7d2a85c6e224cea0" target=3D"_blank" rel=3D"noreferrer"><span lang=3D"EN-=
GB" style=3D"color:#4665a2">or1k_timer_get_ticks</span></a></span><span lan=
g=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;c=
olor:black">()) { }<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D=
"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001=
pt;background:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-=
family:&quot;Courier New&quot;;color:black">timerstate =3D </span><span sty=
le=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:black"><a =
href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga=
b40473a360aa82273575cdbc4381ac93" target=3D"_blank" rel=3D"noreferrer"><spa=
n lang=3D"EN-GB" style=3D"color:#4665a2">or1k_timer_disable</span></a></spa=
n><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Courier =
New&quot;;color:black">();<u></u><u></u></span></p><p class=3D"MsoNormal" s=
tyle=3D"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-botto=
m:.0001pt;background:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;;color:maroon">// do something atomar<=
/span><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Cour=
ier New&quot;;color:black"><u></u><u></u></span></p><p class=3D"MsoNormal" =
style=3D"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bott=
om:.0001pt;background:#fbfcfd"><span style=3D"font-size:10.0pt;font-family:=
&quot;Courier New&quot;;color:black"><a href=3D"https://www.openrisc.io/new=
lib/docs/html/group__or1k__timer.html#ga0e392edcf73b9cf1c0279471ae59d241" t=
arget=3D"_blank" rel=3D"noreferrer"><span lang=3D"EN-GB" style=3D"color:#46=
65a2">or1k_timer_restore</span></a></span><span lang=3D"EN-GB" style=3D"fon=
t-size:10.0pt;font-family:&quot;Courier New&quot;;color:black">(timerstate)=
;<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D"margin-right:6.0p=
t;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001pt;background:#fbf=
cfd"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Couri=
er New&quot;;color:#e08000">if</span><span lang=3D"EN-GB" style=3D"font-siz=
e:10.0pt;font-family:&quot;Courier New&quot;;color:black"> (ticks =3D=3D 10=
0) {<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D"margin-right:6=
.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001pt;background:#=
fbfcfd"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">printf(</span><span lang=3D"EN-GB" style=3D"fo=
nt-size:10.0pt;font-family:&quot;Courier New&quot;;color:#002080">&quot;A s=
econd elapsed\n&quot;</span><span lang=3D"EN-GB" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:black">);<u></u><u></u></span></p=
><p class=3D"MsoNormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;margi=
n-left:1.5pt;margin-bottom:.0001pt;background:#fbfcfd"><span style=3D"font-=
size:10.0pt;font-family:&quot;Courier New&quot;;color:black"><a href=3D"htt=
ps://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#ga456bc40cdfb=
bbdfd62c936c065457cc2" target=3D"_blank" rel=3D"noreferrer"><span lang=3D"E=
N-GB" style=3D"color:#4665a2">or1k_timer_reset_ticks</span></a></span><span=
 lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot;Courier New&quo=
t;;color:black">();<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D=
"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001=
pt;background:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-=
family:&quot;Courier New&quot;;color:black">ticks =3D 0;<u></u><u></u></spa=
n></p><p class=3D"MsoNormal" style=3D"margin-right:6.0pt;margin-bottom:0cm;=
margin-left:1.5pt;margin-bottom:.0001pt;background:#fbfcfd"><span lang=3D"E=
N-GB" style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:b=
lack">}<u></u><u></u></span></p><p class=3D"MsoNormal" style=3D"margin-righ=
t:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margin-bottom:.0001pt;backgroun=
d:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-size:10.0pt;font-family:&quot=
;Courier New&quot;;color:black">}<u></u><u></u></span></p><p class=3D"MsoNo=
rmal" style=3D"margin-right:6.0pt;margin-bottom:0cm;margin-left:1.5pt;margi=
n-bottom:.0001pt;background:#fbfcfd"><span lang=3D"EN-GB" style=3D"font-siz=
e:10.0pt;font-family:&quot;Courier New&quot;;color:black">}<u></u><u></u></=
span></p><p class=3D"MsoNormal"><span lang=3D"EN-GB">It is in the file and =
also here: <a href=3D"https://www.openrisc.io/newlib/docs/html/group__or1k_=
_timer.html#gaf760867d2f9d04f0c101c4c4975b0616" target=3D"_blank" rel=3D"no=
referrer">https://www.openrisc.io/newlib/docs/html/group__or1k__timer.html#=
gaf760867d2f9d04f0c101c4c4975b0616</a><u></u><u></u></span></p><p class=3D"=
MsoNormal"><span lang=3D"EN-GB"><u></u>=C2=A0<u></u></span></p><p class=3D"=
MsoNormal"><span lang=3D"EN-GB">Elisa<u></u><u></u></span></p><p class=3D"M=
soNormal"><span lang=3D"EN-GB"><u></u>=C2=A0<u></u></span></p><p class=3D"M=
soNormal"><b>De:</b> Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; <br><b>Envia=
do el:</b> domingo, 24 de noviembre de 2019 1:05<br><b>Para:</b> <a href=3D=
"mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2se.es</=
a><br><b>CC:</b> Openrisc &lt;<a href=3D"mailto:openrisc@lists.librecores.o=
rg" target=3D"_blank" rel=3D"noreferrer">openrisc@lists.librecores.org</a>&=
gt;<br><b>Asunto:</b> Re: [OpenRISC] tick timer doubt<u></u><u></u></p><p c=
lass=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div><p class=3D"MsoNormal">Hell=
o,<u></u><u></u></p><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></d=
iv><div><p class=3D"MsoNormal">Which example are you referring to?=C2=A0 Ha=
ve you been able to read the architecture specification and understand sect=
ion 15 on tick timer facility?=C2=A0 There ttmr is explained, the value 100=
00000 I think indicates a pending timer interrupt.<u></u><u></u></p></div><=
div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"M=
soNormal">See the attached screenshot.<u></u><u></u></p></div><div><p class=
=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">-s=
tafford<u></u><u></u></p></div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u><=
/p><div><div><p class=3D"MsoNormal">On Fri, Nov 22, 2019, 10:41 PM &lt;<a h=
ref=3D"mailto:ecalvo@2se.es" target=3D"_blank" rel=3D"noreferrer">ecalvo@2s=
e.es</a>&gt; wrote:<u></u><u></u></p></div><blockquote style=3D"border:none=
;border-left:solid #cccccc 1.0pt;padding:0cm 0cm 0cm 6.0pt;margin-left:4.8p=
t;margin-right:0cm"><div><div><p class=3D"MsoNormal">Hi!!<u></u><u></u></p>=
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p><p class=3D"MsoNormal"><span=
 lang=3D"EN-GB">I have some doubts about the tick timer. Could someone help=
 me? I explain them below</span><u></u><u></u></p><p class=3D"MsoNormal"><s=
pan lang=3D"EN-GB">=C2=A0</span><u></u><u></u></p><ul type=3D"disc"><li cla=
ss=3D"m_-8809720454035437317m-5271582089663214313msolistparagraph"><span la=
ng=3D"EN-GB">I don=E2=80=99t understand really well the example of or1k tim=
er control that is in that file: For example, how is ticks variable updated=
? </span><u></u><u></u></li><li class=3D"m_-8809720454035437317m-5271582089=
663214313msolistparagraph"><span lang=3D"EN-GB">If it was updated, I unders=
tand that if frequency is 100Hz, a new tick takes place each 0.01 seg and w=
ith 100 ticks, a second has elapsed. However, If I compile and run this cod=
e and, and I open with gtkwave the generated vcd, I don=E2=80=99t understan=
d why the value of TTMR register is 1000000. Is The value of TTMR register =
fixed by software using or1k_timer_set_period function? Is it measured in H=
z?</span><u></u><u></u></li></ul><p class=3D"MsoNormal"><span lang=3D"EN-GB=
">=C2=A0</span><u></u><u></u></p><p class=3D"MsoNormal"><span lang=3D"EN-GB=
">Thanks in advance</span><u></u><u></u></p></div></div><p class=3D"MsoNorm=
al">_______________________________________________<br>OpenRISC mailing lis=
t<br><a href=3D"mailto:OpenRISC@lists.librecores.org" target=3D"_blank" rel=
=3D"noreferrer">OpenRISC@lists.librecores.org</a><br><a href=3D"https://lis=
ts.librecores.org/listinfo/openrisc" target=3D"_blank" rel=3D"noreferrer">h=
ttps://lists.librecores.org/listinfo/openrisc</a><u></u><u></u></p></blockq=
uote></div></div></div></div></blockquote></div>

--00000000000013d3af0598284d3e--

--===============5794602319574014565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============5794602319574014565==--
