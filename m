Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 61243101F25
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0AEFC205AF;
	Tue, 19 Nov 2019 10:04:21 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 45D4620617
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 03:25:44 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id c184so542688pfb.0
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 18:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nujO1oAvQuda3HPNop9afPS+ilUfrJs0rYOKUqnCb18=;
 b=BPU+KO8V4PYZ+J0n2pqqh99W6ac4KcA7jk9+Zx5Bh9OaO6sBVt5ASZ3fj2xsr7WB7h
 SNaYNXc6sIWn6YEyADZbJe7z3JF26ysja52rZqHxSCop1eb2A4pFagSs05W3SzOME71F
 +e50abCI5ARQEy5f8R51YRtyP0PuwpGB72ACdE6tA0mEZfJovs8eMOHA1jiWlzka5K15
 JLUMn+pilZuA3qO/j2ZIJDHqtcvueUv2mdQwVvg7dKtohxfHj+VMahIPeM31ICvNc43E
 iqCMdi8V2KCrPhkZpw3wVaVj1lX/NA93rZJYM+rZ23pl0rachlvFFlb2IN6Z3ISJazGJ
 D/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nujO1oAvQuda3HPNop9afPS+ilUfrJs0rYOKUqnCb18=;
 b=NTo6JSH69od7wwOra+6FIUL8VSCdjGNhLzxJxgKr1ozkBrjyAT4/EmLnlTXDJD8BJ0
 xWRdH3xdbIRckpx+gb5FYFSwJNJTcTT3MinV0fLpMToMjgZWTEQhPTB6IyUhagZJ03d/
 +nPF+Rs5vT8PJ/0KADRPmaXlHaDdvpAHDEpBxueX0dfaaf44QRwtOsnl5lfQBZ/vpLYT
 bU/09VdpiI4zgMqJ5u/RoOGnYb3BSwzpW3ljXHw09dLpKDOdW+rquI+Z8HGQ7Q5+u041
 1Wj2EK9AekT5cuJuAPLO6lQPA1BUKyq8LTIDOxcbRhiviNwbx2Sg3jsvVwq8ko62B325
 bZ+Q==
X-Gm-Message-State: APjAAAXKPyrEUUmUu3TQcsocb9pZsvaXpnXuc/1RQl2n2QZbeFxEXwrt
 wMEu/EvidWlT9njBWYOTZ/NlNQ==
X-Google-Smtp-Source: APXvYqxs45XVCS3zCAgepAPxJo7NC1+kdqXWgGiouecxkPxJpR21JojV3y5afr/yBsyQaJO5O2g3Xw==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr830789pge.65.1573611942121;
 Tue, 12 Nov 2019 18:25:42 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id y24sm319473pfr.116.2019.11.12.18.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 18:25:41 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com> <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com> <20191113012337.GA70781@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
Date: Wed, 13 Nov 2019 02:25:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191113012337.GA70781@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 10:04:17 +0100
Subject: Re: [OpenRISC] [PATCH 00/50] Add log level to show_stack()
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, "David S. Miller" <davem@davemloft.net>,
 Rich Felker <dalias@libc.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMTEvMTMvMTkgMToyMyBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IE9uICgxOS8x
MS8xMiAxOToxMiksIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPj4gT24gKDE5LzExLzEyIDA5
OjM1KSwgUGV0ciBNbGFkZWsgd3JvdGU6Cj4+IFsuLl0KPj4+IFRoaXMgaXMgZ2V0dGluZyB0b28g
Y29tcGxpY2F0ZWQuIEl0IHdvdWxkIGludHJvZHVjZSB0b28gbWFueQo+Pj4gaGlkZGVuIHJ1bGVz
LiBXaGlsZSB0aGUgZXhwbGljaXRseSBwYXNzZWQgbG9nbGV2ZWwgcGFyYW1ldGVyCj4+PiBpcyBz
dHJhaWdodGZvcndhcmQgYW5kIGNsZWFyLgo+Pgo+PiBJZiBsb2dsZXZlbCBpcyBERUZBVUxUIG9y
IE5PVElDRSBvciBJTkZPIHRoZW4gd2UgY2FuIG92ZXJ3cml0ZSBpdAo+PiAoZWl0aGVyIGRvd25n
cmFkZSBvciB1cGdyYWRlKS4gVGhhdCdzIG9uZSBydWxlLCBiYXNpY2FsbHkuIE5vdCB0b28KPj4g
Y29tcGxpY2F0ZWQsIEkgZ3Vlc3MuCj4gCj4gQ2FuIGJlIHRha2VuIGV2ZW4gYSBiaXQgZnVydGhl
ciB0aGFuCj4gCj4gCXNob3dfc3RhY2soTlVMTCwgTlVMTCwgTE9HTEVWRUxfREVCVUcpOwo+IG9y
Cj4gCXNob3dfc3RhY2soTlVMTCwgTlVMTCwgTE9HTEVWRUxfRVJSKTsKPiAKPiBGb3IgaW5zdGFu
Y2UsCj4gCj4gCXNwaW5fbG9ja19pcnFzYXZlKCZycS0+bG9jaywgZmxhZ3MpOwo+IAlwcmludGtf
ZW1lcmdlbmN5X2VudGVyKExPR0xFVkVMX1NDSEVEKTsKPiAJCS4uLgo+IAkJc2hvd19zdGFjaygu
Li4pOwo+IAkJcHJpbnRrKCk7Cj4gCQlwcmludGsoKTsKPiAJCS4uLgo+IAlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZycS0+bG9jaywgZmxhZ3MpOwo+IAo+IG9yCj4gCj4gCXNwaW5fbG9ja19pcnFz
YXZlKCZ1YXJ0X3BvcnQtPmxvY2ssIGZsYWdzKTsKPiAJcHJpbnRrX2VtZXJnZW5jeV9lbnRlcihM
T0dMRVZFTF9TQ0hFRCk7Cj4gCQkuLi4KPiAJCXByaW50aygpOwo+IAkJcHJpbnRrKCk7Cj4gCQku
Li4KClllYWgsIHRoYXQgbWFrZXMgc2Vuc2UuCgpJIGJlbGlldmUgaXQncyB1cCB0byB5b3UsIFBl
dHIgYW5kIFN0ZXZlbiB0byBkZWNpZGUgd2hhdCdzIGJldHRlciBmb3IKcHJpbnRrKCkuIEkgbWVh
biwgYWZ0ZXIgYWxsIHlvdSBjYXJlIGZvciBhbGwgdGhpcyBjb2RlLgoKSSBndWVzcyBJJ3ZlIHBv
aW50ZWQgdGhhdCBpbiBteSBwb2ludCBvZiB2aWV3IHByaWNlIGZvciBvbmUtdGltZSB0ZXN0aW5n
CmNvZGUgaXMgY2hlYXBlciB0aGFuIGFkZGluZyBhIG5ldyBwcmludGsgZmVhdHVyZSB0byBzd2Fw
IGxvZyBsZXZlbHMgb24KdGhlIGZseS4gQnV0IGFnYWluLCBpdCdzIGp1c3QgaG93IEkgc2VlIGl0
IC0gaWYgd2UgZml4IHRob3NlIHByaW50aW5nCnByb2JsZW1zLCB0aGFuIGluIGhhbGYgeWVhciB3
ZSB3aWxsIGZvcmdldCB0aGV5IGV2ZXIgZXhpc3RlZCwgYnV0IGluCnlvdXIgcHJvcG9zYWwsIHRo
ZXJlIHdpbGwgc3RpbGwgYmUgc29tZSBjbGV2ZXIgcHJpbnRrIGNvZGUuCgpPbiB0aGUgb3RoZXIg
c2lkZSwgYWxzbyB3b3J0aCB0byBub3RlIHRoYXQgY3VycmVudCBwYXRjaGVzIHNldCBmaXgKcHJv
YmxlbXMgZm9yIGtkYiAoYW5kIGZvciBteSBodW5nIHRhc2sgcHJpbnRpbmcgcGF0Y2gpLCBidXQg
aXQncwppbmNvbXBsZXRlIGZvciBzeXNycSBkcml2ZXIuIEkndmUgZ29uZSB0aHJvdWdoIGZ1bmN0
aW9ucyB1c2VkIGJ5IHN5c3JxCmRyaXZlciBhbmQgdGhlIHNhbWUgY2hhbmdlcyBpbnRyb2R1Y2lu
ZyBsb2cgbGV2ZWwgcGFyYW1ldGVyIHdvdWxkIGJlCm5lZWRlZCBmb3I6IHNjaGVkX3Nob3dfdGFz
aygpLCBkZWJ1Z19zaG93X2FsbF9sb2NrcygpLCBzaG93X3JlZ3MoKSwKc2hvd19zdGF0ZSgpLCBz
aG93X21lbSgpLiBTb21lIG9mIHRoZW0gZG9uJ3QgbmVlZCBhbnkgcGxhdGZvcm0gY2hhbmdlcywK
YnV0IGF0IGxlYXN0IHNob3dfcmVncygpIG5lZWRzLgpTbywgeW91IGFsc28gbmVlZCB0byBoYXZl
IHRoYXQgaW4gbWluZCBtYWtpbmcgdGhlIGRlY2lzaW9uLgoKVGhhbmtzLAogICAgICAgICAgRG1p
dHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
