Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26939CEAA
	for <lists+openrisc@lfdr.de>; Sun,  6 Jun 2021 13:11:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0A00D23E0C;
	Sun,  6 Jun 2021 13:11:36 +0200 (CEST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mail.librecores.org (Postfix) with ESMTPS id 9EC2020CDA
 for <openrisc@lists.librecores.org>; Sun,  6 Jun 2021 13:11:33 +0200 (CEST)
Received: by mail-ed1-f46.google.com with SMTP id f5so11606295eds.0
 for <openrisc@lists.librecores.org>; Sun, 06 Jun 2021 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15XuBCmvy3SuSORLi2irOnDGtBzgVmB71dPXQ/pTaAU=;
 b=ZZY5wYWG78sQAIjyNGV4eXVvTLzJ0UohISdL5uInA/ioKBhP2njG7+KCTE7vs3EaxL
 ikucP8SM7xMVDXy8YtDi1mksYB87Q+yUdrEhRDNfHeuwl6xuDbYglw94yFKnzP5P8kNA
 8lvMIQuQSDVAwwfCuWDLCI5T86Q2xAP0RYbFC59Jns5Ce2dHey6lbbuOiYdgsEI0NR/B
 LGKQb5QTNkTUbRIgL03EuUqipybntSwH/kg/uieaaPlqkjoTSC+F2uM1tTfGYWGPkhiu
 2fL2bTaqXFDNMFVmR3BGPKkzXdibRiPYdluvJdKJnP93eewgbmq7gYw91eccslXGw77v
 y9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15XuBCmvy3SuSORLi2irOnDGtBzgVmB71dPXQ/pTaAU=;
 b=CmF8aMucUxu8WnsiiTs0Qy26X0Wa86QPIQJBTy6yvre5fnZCikpVEbxOf1AVZpeheM
 a2x9p1Z4D/JSlaCRd4O9SWHxTQEQWsGiiwZs5+bors62Z33hnl68q0eyA7zrJ/Mf0vGf
 /V8DKmbij6F77Rhr0bsz1A7qGgfYPrsENcbLOb6XViWcQ0GEeN8g833h0WixuW1jxm4Y
 PlvBUczrL+pq6eEeqFPU+MojLYpv6LuA/2XitLuIC0blu6YTY4gkTMVw3I6oV0L9DugM
 w8DxtCl7lg39Ytk+kxGgzhlRH04u0TNU9DAFVVv4AjxaRhCFOscB4YT8NMEMYtXG1E5x
 A1tg==
X-Gm-Message-State: AOAM531VPUHRjuDGy81/au9ZG6OE9Mur53z/qdVr7rpvnRQb6VN3qR3/
 deWF7rZiYJzw1GeyfXjezmdTdKYPLa2emmR07mA=
X-Google-Smtp-Source: ABdhPJzA51ig/wxaCEI7UgzYWwQvuO+Rjsh6ALfieTP42aA7RakmdYuxbjAS8I3XShx8svqo3leMonu3wboIn8cuSYE=
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr14997046edr.4.1622977892859; 
 Sun, 06 Jun 2021 04:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <CALo8C4vWB2dgF9Q3SV4gPczTe89L41O3SMoyvy9ENyDyCgCSgQ@mail.gmail.com>
 <CAAfxs77VQAGGrH1f9A6P9thnCamyZz_JhBW=4GDTautHPYCWTA@mail.gmail.com>
 <CALo8C4vNaR37O2YJk2QM3BKNvK-qZAS0AZ8mz-kxqZ0_oeNyoA@mail.gmail.com>
 <CAAfxs77MeZQVotRtzyAH-D5jXg6xdDbbefdduPYTt3uBw-Ft6Q@mail.gmail.com>
 <CADGJwMzLEPAMNzouZ9xS9zNy0HBsZ6ZXeYUeaPzqu43W2tKupA@mail.gmail.com>
In-Reply-To: <CADGJwMzLEPAMNzouZ9xS9zNy0HBsZ6ZXeYUeaPzqu43W2tKupA@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Sun, 6 Jun 2021 20:11:21 +0900
Message-ID: <CAAfxs76H42EpZ3gdiRt3o1COgerPwP3sXctxHB2X=HornY-0BA@mail.gmail.com>
To: Harshitha S <harshithasridhar172000@gmail.com>
Subject: Re: [OpenRISC] Comments on your student's post
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
Cc: Zip CPU <zipcpu@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Stefan Wallentowitz <stefan@fossi-foundation.org>
Content-Type: multipart/mixed; boundary="===============5853626932747281954=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============5853626932747281954==
Content-Type: multipart/alternative; boundary="000000000000c844c005c416fc70"

--000000000000c844c005c416fc70
Content-Type: text/plain; charset="UTF-8"

+cc the list.

This is a great resource for us getting started with OpenRISC formal
verification.

-Stafford

On Sun, Jun 6, 2021, 7:02 PM Harshitha S <harshithasridhar172000@gmail.com>
wrote:

> Hello,
>
> Yeah, it's okay with keeping the OpenRISC list in CC for further
> discussion.
>
> Dan,
> Thanks for the constructive feedback, the points which you have shared
> with me will help me improve the code. Thanks for letting me know that you
> are available on the platforms which you've mentioned for asking questions.
>
> I agree with you about not including memory within a larger design's
> proof. Yes, spending time perfecting the interface can cost a lot of time
> finding the bugs, and formally verifying large aggregated designs can be
> challenging. I had a look at the blog where you have explained to formally
> verify memory-like components by assuming just one arbitrary address and
> using it to verify the transactions. Yes, I feel the same that the proof
> will run a lot faster by not verifying the entire memory, but just a single
> address. Sure, I'll also have a look into your interface property files in
> your GitHub repository. I've noted down the point you have stressed upon
> "initial assumptions". Also, the key thing which you've said is important
> to avoid assuming anything internal to a module and the keyword (restrict)
> which you've recommended to avoid as it can be replaced with a good assume
> statement. I'll try to avoid the Yosys' chparam statement as much as
> possible and use the hierarchy command itself for the parameter adjustments.
>
> Thanks again for all the links provided, I'll definitely go through it. We
> can have a discussion sometime in the future.
>
> On Sun, Jun 6, 2021 at 5:53 AM Stafford Horne <shorne@gmail.com> wrote:
>
>> Hello,
>>
>> This is a reply from Dan regarding your latest post.  Do you mind I cc
>> you and the OpenRISC mail list for further discussion?
>>
>> ---------- Forwarded message ---------
>> From: Zip CPU <zipcpu@gmail.com>
>> Date: Sun, Jun 6, 2021, 9:12 AM
>> Subject: Re: Comments on your student's post
>> To: Stafford Horne <shorne@gmail.com>
>>
>>
>> Stafford,
>> Feel free to CC the list with Harshita's permission. I have nothing to
>> hide in my response.
>>
>> Regarding your comments:
>>
>> 1, When verifying a larger design, do you need to have the memory within
>> the larger design's proof?  I personally don't include the memory in the
>> proof of the ZipCPU's core processor, nor in the proof of the various
>> memory controllers, etc.  The only time all the parts and pieces come
>> together is in the simulation in the end.  Formally verifying aggregated
>> designs can be a real challenge.  Remember, the cost of any formal proof
>> goes up exponentially with its complexity.  A good engineer learns quickly
>> how to manage such.
>>
>> 2. Yes, a well written interface description is as good as gold in this
>> environment.
>>
>> Beware, there was a customer we once dealt with that put a *lot* of
>> energy into building the "perfect" interface for a particular bus.  (I
>> think it was Avalon.)  The "perfect" interface then cost them a lot of time
>> and dollars finding bugs in "working" items, bugs that would never be
>> encountered in real life.  This effort then soured their further interest
>> in formal methods.  Bottom line: don't lose your perspective on things.  ;)
>>
>> 3-7: no comment necessary.
>>
>> I am also on Gitter under the name ZipCPU.  You can find me on the
>> #librecores/ fusesoc, librecores, or Lobby channels.  Since I can't tell
>> which user name is Harshita's, feel free to have her introduce herself to
>> me.
>>
>> Dan
>>
>> On Sat, Jun 5, 2021 at 4:58 PM Stafford Horne <shorne@gmail.com> wrote:
>>
>>> Thanks Dan,
>>>
>>> This might be good to have in public as its great info, do you mind if
>>> I CC the openrisc list and Harshita?
>>>
>>> I have to admit, I am not *yet* an expert in formal verification and I
>>> am taking on this mentor role as being more of a guide to the open
>>> source community and learning in general.
>>>
>>> On Sat, Jun 5, 2021 at 10:56 PM Zip CPU <zipcpu@gmail.com> wrote:
>>> >
>>> > Stafford,
>>> >
>>> > I don't really have an e-mail for your student (mentee?), nor do I
>>> necessarily wish to have a longer twitter discussion in a public forum
>>> which might discourage your student, but I thought she (?) might appreciate
>>> some feedback.
>>> >
>>> > 1. When verifying memory or caches, it helps to "sample" the memory.
>>> That is, don't verify the entire memory, just verify a single address (or
>>> sometimes two).  This will make the proof run a lot faster, and as long as
>>> you let the solver pick the address arbitrarily it will be equivalent to
>>> the whole thing.  You definitely want to avoid the "for" loop over all
>>> memory, asserting some feature of it.  Feel free to check out my blog
>>> article on formally verifying memory for more on this and verifying cache
>>> implementations.
>>> >
>>> > https://zipcpu.com/zipcpu/2018/07/13/memories.html
>>>
>>> Thanks, yes, I have looked at that, and I think Harshita has too.  I
>>> wondered how to deal with the assume for the single memory address
>>> when verifying in a larger design.  Should we change that assume to an
>>> assert?  Or should we disable the single address verification when
>>> doing larger designs?
>>>
>>> >
>>> > 2. You really need to put some work into "interface definitions", or
>>> perhaps I should call them custom interface files.  These are files
>>> describing an interface formally.  That way, you can list out the
>>> assumptions used by one module, and then verify (i.e. assert) that those
>>> assumptions are valid in the other.  For a good CPU->memory interface,
>>> whether instruction or data, it shouldn't matter to the CPU how that
>>> interface is implemented--whether cache or other.  The CPU should have the
>>> same interface both ways, but the memory interface itself will bridge that
>>> interface to the bus.  A custom interface file between the two would work
>>> wonders to making sure both components work.
>>> >
>>> > I recently rebuilt the interface property files controlling the
>>> ZipCPU's interface with instruction and data memory.  You can find those
>>> new/updated files here for reference if you would like:
>>> >
>>> > https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/ffetch.v
>>> (I-Mem)
>>> > https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/fmem.v
>>> (D-Mem)
>>>
>>> That said, I wondered what these extra files were and I can see great
>>> benefit now.  Especially also things like fwb_master / fwb_slave which
>>> we could probably used.
>>> There might be good candidates for separate fusesoc cores actually.
>>> Those I found here:
>>>
>>>   https://github.com/ZipCPU/zipcpu/blob/master/rtl/ex/fwb_master.v
>>>   https://github.com/ZipCPU/zipcpu/blob/master/rtl/ex/fwb_slave.v
>>>
>>> Then used like here:
>>>
>>>
>>> https://github.com/ZipCPU/zipcpu/blob/master/rtl/peripherals/zipcounter.v#L141-L146
>>>
>>> >
>>> > 3.  Your student mentioned "Initial assumptions" ... ahm, be _very_
>>> careful about assuming anything.  All it takes is one bad assumption and
>>> you can convince yourself that a broken design actually works.  I like to
>>> say it will "void your proof", but that's what I mean by it.  Ideally, all
>>> assumptions will be captured in interface property files (of some sort)
>>> that then get asserted by whatever is holding the other half of the
>>> interface.  When I teach formal methods, one of the things I foot stomp is
>>> that all assumptions should be audited.  As for the _initial_ in the blog
>>> mention of "initial assumptions", ... you really shouldn't need to
>>> initially assume anything more than an initial reset.
>>>
>>> That's a good point to drill in.
>>>
>>> > 4. A key rule to formal, one I foot stomp a lot and come back to over
>>> and again in the course is that you should assume properties of inputs, and
>>> assert properties of outputs and any internal variables.  *NEVER* assume
>>> anything internal to a module.  That *will* void any proof.
>>>
>>> That makes sense, in other words we could assume inputs will be
>>> presented in a certain way i.e. assume a reset, or assume write_enable
>>> and read_enable will not go high at the same time.  But those
>>> assumptions must change to assertions when verifying the larger
>>> design.  Or those should be left to an interface definition.
>>>
>>> > 5. A key component to any proof of a CPU, interconnect, and any
>>> associated bus components, is a common bus interface property file.  Why?
>>> Because the bus is a common interface--it's not a special or specific one.
>>> That means the effort required to develop a single interface file can go a
>>> long way into making sure every component follows the same rules of the
>>> road.
>>> >
>>> > I built such an interface file for Wishbone 3 sometime ago.
>>> >
>>> >
>>> https://github.com/ZipCPU/wb2axip/blob/master/bench/formal/fwbc_slave.v
>>> and
>>> >
>>> https://github.com/ZipCPU/wb2axip/blob/master/bench/formal/fwbc_master.v
>>> > (Run a diff on these two files to see why I call them one file ...)
>>>
>>> Ah, just what I mentioned before.  This makes sense.
>>>
>>> > I tried at one point to verify OpenRISC's caches with this interface
>>> file and ... I was unsuccessful.  OpenRISC doesn't quite have the same
>>> definition of Wishbone as I have from reading the spec.  At the time, I
>>> didn't dig any further to know which of the two was right and which was
>>> wrong.  I'd personally recommend either updating that property file to
>>> match what OpenRISC is expecting of the bus, or fixing OpenRISC if you
>>> decide instead that it isn't specification compliant.  (Both are possible,
>>> I don't know which is actually the case.)
>>>
>>> Got it.
>>>
>>> > 6. At one time I used the restrict() keyword a couple times.  I've
>>> since had to remove it from any of my designs that had used it.  While the
>>> restrict keyword is supported by the open source tool chain, its support
>>> doesn't follow the SV standard.  I'd therefore recommend not using it.
>>> It's ... just not worth the hassle, and a good assume statement will do
>>> just about as much.
>>> >
>>> > 7. You should also avoid yosys' "chparam" command.  Use the
>>> "hierarchy" command instead once instead for all parameter adjustments.
>>> You may need to do some Python work to get that to work properly.  Here's
>>> an example you might find valuable:
>>> >
>>> >
>>> https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/zipcore.sby#L42-L54
>>>
>>> Thanks.
>>>
>>> > Finally, let your student know that I am available on Freenode's IRC
>>> for questions.  (Yes, I use Libera.Chat and Gitter as well ...)  She can
>>> look me up on either the #openarty or #zipcpu channels, and I'd be happy to
>>> answer questions she might have.  (I'm also available on ##fpga, ##verilog,
>>> and others if she'd rather have a more open discussion.)
>>>
>>> She is also on Gitter that might be easiest.
>>>
>>> -Stafford
>>>
>>

--000000000000c844c005c416fc70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">+cc the list.<div dir=3D"auto"><br></div><div dir=3D"auto=
">This is a great resource for us getting started with OpenRISC formal veri=
fication.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Stafford</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Jun 6, 2021, 7:02 PM Harshitha S &lt;<a href=3D"mailto:harshithasr=
idhar172000@gmail.com">harshithasridhar172000@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello,<div><br></div><=
div>Yeah, it&#39;s okay with keeping the OpenRISC list in CC for further di=
scussion.</div><div><br></div><div>Dan,</div><div><div><div>Thanks for the =
constructive=C2=A0feedback, the points which you have shared with me will h=
elp me improve the code. Thanks for letting me know that you are available =
on the platforms which you&#39;ve mentioned for asking questions.</div><div=
><br></div><div>I agree with you about not including memory within a larger=
 design&#39;s proof. Yes, spending time perfecting the interface can cost a=
 lot of time finding the bugs, and formally verifying large aggregated desi=
gns can be challenging. I had a look at the blog where you have explained t=
o formally verify=C2=A0memory-like components by assuming just one arbitrar=
y=C2=A0address and using it to verify the transactions. Yes, I feel the sam=
e that the proof will run a lot faster by not verifying=C2=A0the entire mem=
ory, but just a single address. Sure, I&#39;ll also have a look into your i=
nterface property files in your GitHub repository. I&#39;ve noted down the =
point you have stressed upon &quot;initial assumptions&quot;. Also, the key=
 thing which you&#39;ve said is important to avoid assuming anything intern=
al=C2=A0to a module and the keyword (restrict) which you&#39;ve recommended=
 to avoid as it can be replaced with a good assume statement. I&#39;ll try =
to avoid the Yosys&#39; chparam statement as much as possible and use the h=
ierarchy command itself=C2=A0for the parameter adjustments.</div><div><br><=
/div><div>Thanks again for all the links provided, I&#39;ll definitely go t=
hrough it. We can have a discussion sometime in the future.</div></div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Jun 6, 2021 at 5:53 AM Stafford Horne &lt;<a href=3D"mailto:shorn=
e@gmail.com" target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">This is a rep=
ly from Dan regarding your latest post.=C2=A0 Do you mind I cc you and the =
OpenRISC mail list for further discussion?</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded messag=
e ---------<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Zip CP=
U</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:zipcpu@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">zipcpu@gmail.com</a>&gt;</span><br>Date: Su=
n, Jun 6, 2021, 9:12 AM<br>Subject: Re: Comments on your student&#39;s post=
<br>To: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">shorne@gmail.com</a>&gt;<br></div><br><br><div dir=
=3D"ltr"><div>Stafford,</div><div>Feel free to CC the list with Harshita&#3=
9;s permission. I have nothing to hide in my response.</div><div><br></div>=
<div>Regarding your comments:</div><div><br></div><div>1, When verifying a =
larger design, do you need to have the memory within the larger design&#39;=
s proof?=C2=A0 I personally don&#39;t include the memory in the proof of th=
e ZipCPU&#39;s core processor, nor in the proof of the various memory contr=
ollers, etc.=C2=A0 The only time all the parts and pieces come together is =
in the simulation in the end.=C2=A0 Formally verifying aggregated designs c=
an be a real challenge.=C2=A0 Remember, the cost of any formal proof goes u=
p exponentially with its complexity.=C2=A0 A good engineer learns quickly h=
ow to manage such.<br></div><div><br></div><div>2. Yes, a well written inte=
rface description is as good as gold in this environment.</div><div><br></d=
iv><div>Beware, there was a customer we once dealt with that put a *lot* of=
 energy into building the &quot;perfect&quot; interface for a particular bu=
s.=C2=A0 (I think it was Avalon.)=C2=A0 The &quot;perfect&quot; interface t=
hen cost them a lot of time and dollars finding bugs in &quot;working&quot;=
 items, bugs that would never be encountered in real life.=C2=A0 This effor=
t then soured their further interest in formal methods.=C2=A0 Bottom line: =
don&#39;t lose your perspective on things.=C2=A0 ;)</div><div><br></div><di=
v>3-7: no comment necessary.<br></div><div><br></div><div>I am also on Gitt=
er under the name ZipCPU.=C2=A0 You can find me on the #librecores/ fusesoc=
, librecores, or Lobby channels.=C2=A0 Since I can&#39;t tell which user na=
me is Harshita&#39;s, feel free to have her introduce herself to me.<br></d=
iv><div><br></div><div>Dan<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 5, 2021 at 4:58 PM Stafford=
 Horne &lt;<a href=3D"mailto:shorne@gmail.com" rel=3D"noreferrer noreferrer=
" target=3D"_blank">shorne@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Thanks Dan,<br>
<br>
This might be good to have in public as its great info, do you mind if<br>
I CC the openrisc list and Harshita?<br>
<br>
I have to admit, I am not *yet* an expert in formal verification and I<br>
am taking on this mentor role as being more of a guide to the open<br>
source community and learning in general.<br>
<br>
On Sat, Jun 5, 2021 at 10:56 PM Zip CPU &lt;<a href=3D"mailto:zipcpu@gmail.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">zipcpu@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; Stafford,<br>
&gt;<br>
&gt; I don&#39;t really have an e-mail for your student (mentee?), nor do I=
 necessarily wish to have a longer twitter discussion in a public forum whi=
ch might discourage your student, but I thought she (?) might appreciate so=
me feedback.<br>
&gt;<br>
&gt; 1. When verifying memory or caches, it helps to &quot;sample&quot; the=
 memory.=C2=A0 That is, don&#39;t verify the entire memory, just verify a s=
ingle address (or sometimes two).=C2=A0 This will make the proof run a lot =
faster, and as long as you let the solver pick the address arbitrarily it w=
ill be equivalent to the whole thing.=C2=A0 You definitely want to avoid th=
e &quot;for&quot; loop over all memory, asserting some feature of it.=C2=A0=
 Feel free to check out my blog article on formally verifying memory for mo=
re on this and verifying cache implementations.<br>
&gt;<br>
&gt; <a href=3D"https://zipcpu.com/zipcpu/2018/07/13/memories.html" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://zipcpu.com/zipc=
pu/2018/07/13/memories.html</a><br>
<br>
Thanks, yes, I have looked at that, and I think Harshita has too.=C2=A0 I<b=
r>
wondered how to deal with the assume for the single memory address<br>
when verifying in a larger design.=C2=A0 Should we change that assume to an=
<br>
assert?=C2=A0 Or should we disable the single address verification when<br>
doing larger designs?<br>
<br>
&gt;<br>
&gt; 2. You really need to put some work into &quot;interface definitions&q=
uot;, or perhaps I should call them custom interface files.=C2=A0 These are=
 files describing an interface formally.=C2=A0 That way, you can list out t=
he assumptions used by one module, and then verify (i.e. assert) that those=
 assumptions are valid in the other.=C2=A0 For a good CPU-&gt;memory interf=
ace, whether instruction or data, it shouldn&#39;t matter to the CPU how th=
at interface is implemented--whether cache or other.=C2=A0 The CPU should h=
ave the same interface both ways, but the memory interface itself will brid=
ge that interface to the bus.=C2=A0 A custom interface file between the two=
 would work wonders to making sure both components work.<br>
&gt;<br>
&gt; I recently rebuilt the interface property files controlling the ZipCPU=
&#39;s interface with instruction and data memory.=C2=A0 You can find those=
 new/updated files here for reference if you would like:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/=
ffetch.v" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/ffetch.v</a> (I-Mem)<b=
r>
&gt; <a href=3D"https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/=
fmem.v" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/fmem.v</a> (D-Mem)<br>
<br>
That said, I wondered what these extra files were and I can see great<br>
benefit now.=C2=A0 Especially also things like fwb_master / fwb_slave which=
<br>
we could probably used.<br>
There might be good candidates for separate fusesoc cores actually.<br>
Those I found here:<br>
<br>
=C2=A0 <a href=3D"https://github.com/ZipCPU/zipcpu/blob/master/rtl/ex/fwb_m=
aster.v" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/ZipCPU/zipcpu/blob/master/rtl/ex/fwb_master.v</a><br>
=C2=A0 <a href=3D"https://github.com/ZipCPU/zipcpu/blob/master/rtl/ex/fwb_s=
lave.v" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
github.com/ZipCPU/zipcpu/blob/master/rtl/ex/fwb_slave.v</a><br>
<br>
Then used like here:<br>
<br>
=C2=A0<a href=3D"https://github.com/ZipCPU/zipcpu/blob/master/rtl/periphera=
ls/zipcounter.v#L141-L146" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://github.com/ZipCPU/zipcpu/blob/master/rtl/peripherals/zi=
pcounter.v#L141-L146</a><br>
<br>
&gt;<br>
&gt; 3.=C2=A0 Your student mentioned &quot;Initial assumptions&quot; ... ah=
m, be _very_ careful about assuming anything.=C2=A0 All it takes is one bad=
 assumption and you can convince yourself that a broken design actually wor=
ks.=C2=A0 I like to say it will &quot;void your proof&quot;, but that&#39;s=
 what I mean by it.=C2=A0 Ideally, all assumptions will be captured in inte=
rface property files (of some sort) that then get asserted by whatever is h=
olding the other half of the interface.=C2=A0 When I teach formal methods, =
one of the things I foot stomp is that all assumptions should be audited.=
=C2=A0 As for the _initial_ in the blog mention of &quot;initial assumption=
s&quot;, ... you really shouldn&#39;t need to initially assume anything mor=
e than an initial reset.<br>
<br>
That&#39;s a good point to drill in.<br>
<br>
&gt; 4. A key rule to formal, one I foot stomp a lot and come back to over =
and again in the course is that you should assume properties of inputs, and=
 assert properties of outputs and any internal variables.=C2=A0 *NEVER* ass=
ume anything internal to a module.=C2=A0 That *will* void any proof.<br>
<br>
That makes sense, in other words we could assume inputs will be<br>
presented in a certain way i.e. assume a reset, or assume write_enable<br>
and read_enable will not go high at the same time.=C2=A0 But those<br>
assumptions must change to assertions when verifying the larger<br>
design.=C2=A0 Or those should be left to an interface definition.<br>
<br>
&gt; 5. A key component to any proof of a CPU, interconnect, and any associ=
ated bus components, is a common bus interface property file.=C2=A0 Why?=C2=
=A0 Because the bus is a common interface--it&#39;s not a special or specif=
ic one.=C2=A0 That means the effort required to develop a single interface =
file can go a long way into making sure every component follows the same ru=
les of the road.<br>
&gt;<br>
&gt; I built such an interface file for Wishbone 3 sometime ago.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/ZipCPU/wb2axip/blob/master/bench/formal/=
fwbc_slave.v" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/ZipCPU/wb2axip/blob/master/bench/formal/fwbc_slave.v</a> a=
nd<br>
&gt; <a href=3D"https://github.com/ZipCPU/wb2axip/blob/master/bench/formal/=
fwbc_master.v" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ZipCPU/wb2axip/blob/master/bench/formal/fwbc_master.v</a>=
<br>
&gt; (Run a diff on these two files to see why I call them one file ...)<br=
>
<br>
Ah, just what I mentioned before.=C2=A0 This makes sense.<br>
<br>
&gt; I tried at one point to verify OpenRISC&#39;s caches with this interfa=
ce file and ... I was unsuccessful.=C2=A0 OpenRISC doesn&#39;t quite have t=
he same definition of Wishbone as I have from reading the spec.=C2=A0 At th=
e time, I didn&#39;t dig any further to know which of the two was right and=
 which was wrong.=C2=A0 I&#39;d personally recommend either updating that p=
roperty file to match what OpenRISC is expecting of the bus, or fixing Open=
RISC if you decide instead that it isn&#39;t specification compliant.=C2=A0=
 (Both are possible, I don&#39;t know which is actually the case.)<br>
<br>
Got it.<br>
<br>
&gt; 6. At one time I used the restrict() keyword a couple times.=C2=A0 I&#=
39;ve since had to remove it from any of my designs that had used it.=C2=A0=
 While the restrict keyword is supported by the open source tool chain, its=
 support doesn&#39;t follow the SV standard.=C2=A0 I&#39;d therefore recomm=
end not using it.=C2=A0 It&#39;s ... just not worth the hassle, and a good =
assume statement will do just about as much.<br>
&gt;<br>
&gt; 7. You should also avoid yosys&#39; &quot;chparam&quot; command.=C2=A0=
 Use the=C2=A0 &quot;hierarchy&quot; command instead once instead for all p=
arameter adjustments.=C2=A0 You may need to do some Python work to get that=
 to work properly.=C2=A0 Here&#39;s an example you might find valuable:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/=
zipcore.sby#L42-L54" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/ZipCPU/zipcpu/blob/zipcore/bench/formal/zipcore.sby=
#L42-L54</a><br>
<br>
Thanks.<br>
<br>
&gt; Finally, let your student know that I am available on Freenode&#39;s I=
RC for questions.=C2=A0 (Yes, I use Libera.Chat and Gitter as well ...)=C2=
=A0 She can look me up on either the #openarty or #zipcpu channels, and I&#=
39;d be happy to answer questions she might have.=C2=A0 (I&#39;m also avail=
able on ##fpga, ##verilog, and others if she&#39;d rather have a more open =
discussion.)<br>
<br>
She is also on Gitter that might be easiest.<br>
<br>
-Stafford<br>
</blockquote></div>
</div>
</blockquote></div>
</blockquote></div>

--000000000000c844c005c416fc70--

--===============5853626932747281954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============5853626932747281954==--
