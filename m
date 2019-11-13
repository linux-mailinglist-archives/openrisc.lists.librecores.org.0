Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AB90B101F27
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C947D20014;
	Tue, 19 Nov 2019 10:04:21 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id DFC3C2072F
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 03:42:20 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id z24so366915pgu.4
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 18:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9ewNkq+k7WzF7N7FeKsJZWJsQUcIf4AaWPjf05A0Fco=;
 b=httZFalB2VvN+DAYr6xQfb8CS2lpW4CgtAeEsAWgjkvbyyGvCmjTLAPAEMfF/JCr7/
 c8P9raTPSqNexy65EPzsFOdG6kVk1K592cMDIy0cHhBebJPWF8fQ9egPpzwWXfBWSrCz
 Jk1zAXvG+gTTHY9iuktiuKZH9vWWl//5vaZrlx7ppzhO4sTAZlX2C/T/kVZYDrElUqcN
 VIOq5oDXrk5HHYGKLT0+ff2WZ+LnUZTUWEqoGOOJeX0XdIUXtb1PCt6iQWGnVWpEOeHv
 9p5PFEhwRvitpIH0ba4n5ClWOCwYigDV+TgMORDfM82fnMfxgxqmD7OSd4a8lnQJEp7K
 YgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ewNkq+k7WzF7N7FeKsJZWJsQUcIf4AaWPjf05A0Fco=;
 b=Ag+VHvfo3FZasBpH01Ze9aoh4CkEmREFpUEPKuzGI8t9TjJT43qrzGJskAqThzRzKp
 eZAqXockf/CI/HNU/Lk88NBS79H54dMYpMEnvLz4TMPbMmnQF99m1M4ZsTPskcYPGSrn
 qOMotwd4YWqZHuTOzyosFnx66InUNIo3LgHWOimYCXgFMxMCdKOzI6dM3eWFXT5ZMYet
 r9cAu1fBoqLngie8YilHO5Sto8ZtLWQWD257VUFKVDCkY1Ejsz0eMDIegvaXgOOEAQUg
 AiJQbuY4nEWcmjIGLOJDA6oXU7Z1sxD+BvZ2tqakXu+VbAVkPw4ZTpgzxb08jo3HV79c
 9Y8A==
X-Gm-Message-State: APjAAAVr977rx1zDnkACHkDgb1Sa5f8GfCmSD+OaYXDfb/Jzx6NYo7m1
 jnDDx+7nY9p+sweAAA5Gsbx3HA==
X-Google-Smtp-Source: APXvYqyg0YKjFTNIvTLCv1J1tDb1jq98QSviRK57/SbcLNfCJ0c+TDqSL8X9WHbEQTrvYD3q+/dxRw==
X-Received: by 2002:a63:cb0f:: with SMTP id p15mr887811pgg.81.1573612938430;
 Tue, 12 Nov 2019 18:42:18 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id r22sm395559pfg.54.2019.11.12.18.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 18:42:17 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
 <20191112042546.GA119579@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <d828cb62-aeea-4d67-33ba-b3a93ea10a3d@arista.com>
Date: Wed, 13 Nov 2019 02:41:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191112042546.GA119579@google.com>
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
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
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

T24gMTEvMTIvMTkgNDoyNSBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IE9uICgxOS8x
MS8xMiAwMjo0MCksIERtaXRyeSBTYWZvbm92IHdyb3RlOgo+IFsuLl0KPj4gSW4gbXkgcG9pbnQg
b2YgdmlldyB0aGUgY29zdCBvZiBvbmUtdGltZSBbbW9zdGx5IGJ1aWxkXSB0ZXN0aW5nIGV2ZXJ5
Cj4+IGFyY2hpdGVjdHVyZSBpcyBjaGVhcGVyIHRoYW4gaW50cm9kdWNpbmcgc29tZSBuZXcgc21h
cnQgY29kZSB0aGF0IHdpbGwKPj4gbGl2ZSBmb3JldmVyLgo+IAo+IFdlbGwsIHRoZXJlIG1heSBi
ZSB0aGUgbmVlZCB0byBwYXNzIGxvZ2xldmVsIGRlZXBlciBkdWUgdG8gImhleSBfX3Nob3dfc3Rh
Y2soKQo+IG9uIHRoYXQgYXJjaCBpbnZva2VzIGJhcigpLCB3aGljaCBpbnZva2VzIGZvbygpIGFu
ZCBub3cgZm9vKCkgZG9lcyBwcmludGsoKSwKPiBidXQgd2UgZG9uJ3Qgc2VlIGl0Ii4gVGhlIGNv
bnRleHQgd2hpY2ggZGVjaWRlZCB0byBiYWNrdGFyYWNlcyBkZWNpZGVkCj4gdG8gZG8gc28gZm9y
IGEgcmVhc29uLCBwcm9iYWJseSwgc28gSSBndWVzcyB3ZSBjYW4gbG9vayBhdCBpdCBhcyAiYSBz
cGVjaWFsCj4gZXJyb3IgcmVwb3J0aW5nIGNvZGUgYmxvY2siLgo+IAo+IFRoZSBwcm9wb3NlZCBw
YXRjaCBzZXQgcGFzc2VzIGxvZ2xldmVsIHZpYSBzbGlnaHRseSB1bnVzdWFsIGNoYW5uZWwgLQo+
IHZpYSBzcHJpbnRmKCkuIFdlIHByb2JhYmx5IGNhbiBkbyBpdCwgYnV0IEkgd291bGQgcHJlZmVy
IHRvIG1pbmltaXplCj4gdGhlIG51bWJlciBvZiBzdWNoIHByaW50ay1zIGluIHRoZSBrZXJuZWwu
IFRoZSBjb2RlIHNuaXBwZXQgd2hpY2ggSQo+IHBvc3RlZCBhbHNvIGRvZXMgcHJldHR5IHVudXN1
YWwgdGhpbmcgdy5yLnQgbG9nbGV2ZWwuIEJvdGggYXBwcm9hY2hlcwo+IGFyZSAibm9uLXN0YW5k
YXJkIiBmcm9tIHRoYXQgUE9WLgoKSSBkb24ndCBzdHJvbmdseSBkaXNhZ3JlZSwgYnV0IGlmIHlv
dSBsb29rIGF0IHRob3NlIHJlc3VsdHM6CmdpdCBncmVwICdwcmludGsoIiVzLioiLCBcKGx2bFx8
bGV2ZWxcKScKCml0IHNlZW1zIHRvIGJlIHVzZWQgaW4gcXVpdGUgYSBmZXcgcGxhY2VzLgoKVGhh
bmtzLAogICAgICAgICAgRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
