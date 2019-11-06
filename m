Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 92B64F7403
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 71A24207D8;
	Mon, 11 Nov 2019 13:37:33 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id 6DF592012D
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 17:12:20 +0100 (CET)
Received: by mail-pg1-f193.google.com with SMTP id w11so7109966pga.12
 for <openrisc@lists.librecores.org>; Wed, 06 Nov 2019 08:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6YKC1kJOcWpyD+8pjGdr6zJNIwDWfqyBu/N6KBSP97U=;
 b=MpZHturjPCBg33iU1ozhAjvA8LCtPPFI3DR58OYlFEaUZGZqfEzhUtttDDrlEOGegQ
 4vDex9qExlxkA9WH33d8HwoxTLWivc69W/6aer4DXfteqgbtXwv3cNxCcRds4ZAMweGX
 5ZXj+X+FYkL8t+hZqh4LwhZRZNRrqod+Up3sqXtFrQSRV7C3Y69W33Z8X4jj1Fl7gbuY
 R6u824u7CLy//WZ/duinZirY1ifbAiK575WJqRiWdVx2qkiQPu6t7SWS7JDhyX5hOHLe
 oe8RLdwEfd46kke7TKQhcEtTSIZl2oUQhbinVc7bj3yYIQzIfU4ltgAEvZlXwG6aLosM
 UhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6YKC1kJOcWpyD+8pjGdr6zJNIwDWfqyBu/N6KBSP97U=;
 b=i5UB4Zt7gdJxFwKsiLrALPkH+Cx8sHqjZhxmVYe42s9WCU+alJ1fMaVFZJcYuus6bE
 CVJcqmL6Bgqez0K9LDOzv61OGlupfRAXHvx2YJ6IUZ/LowXnD8CIrtnpyCz06r1eq9wN
 e7hU9NBV7o7PxDTt8UoWKFSF8NkPjJ2k751zIGhRhEVQSaODxm5dcYp1IMJzGGz9Kqce
 +HbehIoI8BURRC1id1qHLbZ6BzgA8WGFKLAYJLXo5y3igB+A7uBLi0MMHdrW7I3jpIGm
 2OWmmukbKtQEG5k5/6Y+cw0SgTFaZocZzTH143o52/Yxqp2Mn2ePyKcOz+Sl7nLFu7eT
 /JLw==
X-Gm-Message-State: APjAAAXRgfSvvb45giNHqj89IHAxp/xo9twCk9UBj6jRGK0pitoIYpAi
 LyHhoaUJbINRdNI0+WMvxjXVxA==
X-Google-Smtp-Source: APXvYqwR0pSNn59pPusYKfkpnLRmR/vqqpv4L3qv+M0Onv9D6hRgWRQkxTVXtCrUTdykmM2sB1/Rnw==
X-Received: by 2002:aa7:908b:: with SMTP id i11mr4396653pfa.140.1573056738752; 
 Wed, 06 Nov 2019 08:12:18 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j4sm5535967pjf.25.2019.11.06.08.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 08:12:17 -0800 (PST)
To: Petr Mladek <pmladek@suse.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <de8a397d-8660-4ace-9626-127debcf43a7@arista.com>
Date: Wed, 6 Nov 2019 16:12:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
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
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
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

T24gMTEvNi8xOSA4OjM1IEFNLCBQZXRyIE1sYWRlayB3cm90ZToKPiBPbiBXZWQgMjAxOS0xMS0w
NiAwMzowNDo1MSwgRG1pdHJ5IFNhZm9ub3Ygd3JvdGU6Cj4+IEFkZCBsb2cgbGV2ZWwgYXJndW1l
bnQgdG8gc2hvd19zdGFjaygpLgo+PiBEb25lIGluIHRocmVlIHN0YWdlczoKPj4gMS4gSW50cm9k
dWNpbmcgc2hvd19zdGFja19sb2dsdmwoKSBmb3IgZXZlcnkgYXJjaGl0ZWN0dXJlCj4+IDIuIE1p
Z3JhdGluZyBvbGQgdXNlcnMgd2l0aCBhbiBleHBsaWNpdCBsb2cgbGV2ZWwKPj4gMy4gUmVuYW1p
bmcgc2hvd19zdGFja19sb2dsdmwoKSBpbnRvIHNob3dfc3RhY2soKQo+Pgo+PiBKdXN0aWZpY2F0
aW9uOgo+PiBvIEl0J3MgYSBkZXNpZ24gbWlzdGFrZSB0byBtb3ZlIGEgYnVzaW5lc3MtbG9naWMg
ZGVjaXNpb24KPj4gICBpbnRvIHBsYXRmb3JtIHJlYWxpemF0aW9uIGRldGFpbC4KPj4gbyBJIGhh
dmUgY3VycmVudGx5IHR3byBwYXRjaGVzIHNldHMgdGhhdCB3b3VsZCBiZW5lZml0IGZyb20gdGhp
cyB3b3JrOgo+PiAgIFJlbW92aW5nIGNvbnNvbGVfbG9nbGV2ZWwganVtcHMgaW4gc3lzcnEgZHJp
dmVyIFsxXQo+IAo+IEp1c3QgdG8gY2xhcmlmeS4gVGhlIHByb2JsZW0gaW4gc3lzcnEgZHJpdmVy
IGlzIGEgYml0IGRpZmZlcmVudC4KPiBJdCBtb2RpZmllcyBjb25zb2xlX2xvZ2xldmVsIHRvIHNo
b3cgZXZlbiBsZXNzIGltcG9ydGFudCBtZXNzYWdlCj4gb24gdGhlIGNvbnNvbGUuCj4gCj4gSU1I
TywgaXQgc2hvdWxkIGJlIHNvbHZlZCBieSBwcmludGluZyB0aGUgaGVhZGVyIGxpbmUgd2l0aCBw
cl9lcnJvcigpLgo+IEl0IGlzIG5vdCBpZGVhbC4gQSBjbGVhbmVyIHNvbHV0aW9uIG1pZ2h0IGJl
IHRvIGludHJvZHVjZSBhbm90aGVyCj4gbG9nbGV2ZWwgdGhhdCB3aWxsIGFsd2F5cyBnZXQgcHVz
aGVkIHRvIHRoZSBjb25zb2xlLiBCdXQgSSBhbQo+IG5vdCBzdXJlIGlmIGl0IGlzIHdvcnRoIHRo
aXMgc2luZ2xlIGxpbmUuCgpJIGJlbGlldmUgd2h5IGl0J3Mgbm90IGRvbmUgLSB0aGVyZSBpcyBh
IGNvbW1lbnQgaW4gc3lzcnEgY29kZSB0aGF0IHNhaWQKdGhlIHVzZXJzcGFjZSByZWxpZXMgb24g
dGhlIGxvZ2xldmVsIG9mIHN5c3JxIG1lc3NhZ2VzIChhbmQgbWF5IHRyaWdnZXIKYWxlcnRzIGZy
b20gZW1lcmcvZXJyIGxvZyBsZXZlbCk6CiAgKiBSYWlzZSB0aGUgYXBwYXJlbnQgbG9nbGV2ZWwg
dG8gbWF4aW11bSBzbyB0aGF0IHRoZSBzeXNycSBoZWFkZXIKICAqIGlzIHNob3duIHRvIHByb3Zp
ZGUgdGhlIHVzZXIgd2l0aCBwb3NpdGl2ZSBmZWVkYmFjay4gIFdlIGRvIG5vdAogICogc2ltcGx5
IGVtaXQgdGhpcyBhdCBLRVJOX0VNRVJHIGFzIHRoYXQgd291bGQgY2hhbmdlIG1lc3NhZ2UKICAq
IHJvdXRpbmcgaW4gdGhlIGNvbnN1bWVycyBvZiAvcHJvYy9rbXNnLgoKQnV0IEkgZG9uJ3QgbWlu
ZCBhbnkgc29sdXRpb24uCgo+PiAgIEh1bmcgdGFzayB3YXJuaW5nIGJlZm9yZSBwYW5pYyBbMl0g
LSBzdWdnZXN0ZWQgYnkgVGV0c3VvIChidXQgaGUKPj4gICBwcm9iYWJseSBkaWRuJ3QgcmVhbGlz
ZSB3aGF0IGl0IHdvdWxkIGludm9sdmUpLgo+PiBvIFdoaWxlIGRvaW5nICgxKSwgKDIpIHRoZSBi
YWNrdHJhY2VzIHdlcmUgYWRqdXN0ZWQgdG8gaGVhZGVycwo+PiAgIGFuZCBvdGhlciBtZXNzYWdl
cyBmb3IgZWFjaCBzaXR1YXRpb24gLSBzbyB0aGVyZSB3b24ndCBiZSBhIHNpdHVhdGlvbgo+PiAg
IHdoZW4gdGhlIGJhY2t0cmFjZSBpcyBwcmludGVkLCBidXQgdGhlIGhlYWRlcnMgYXJlIG1pc3Np
bmcgYmVjYXVzZQo+PiAgIHRoZXkgaGF2ZSBsZXNzZXIgbG9nIGxldmVsIChvciB0aGUgcmV2ZXJz
ZSkuCj4+IG8gQXMgdGhlIHJlc3VsdCBpbiAoMikgcGxheXMgd2l0aCBjb25zb2xlX2xvZ2xldmVs
IGZvciBrZGIgYXJlIHJlbW92ZWQuCj4gCj4+IFRoZSBsZWFzdCBpbXBvcnRhbnQgZm9yIHVwc3Ry
ZWFtLCBidXQgbWF5YmUgc3RpbGwgd29ydGggdG8gbm90ZSB0aGF0Cj4+IGV2ZXJ5IGNvbXBhbnkg
SSd2ZSB3b3JrZWQgaW4gc28gZmFyIGhhZCBhbiBvZmYtbGlzdCBwYXRjaCB0byBwcmludAo+PiBi
YWNrdHJhY2Ugd2l0aCB0aGUgbmVlZGVkIGxvZyBsZXZlbCAoYnV0IG9ubHkgZm9yIHRoZSBhcmNo
aXRlY3R1cmUgdGhleQo+PiBjYXJlZCBhYm91dCkuCj4+IElmIHlvdSBoYXZlIG90aGVyIGlkZWFz
IGhvdyB5b3Ugd2lsbCBiZW5lZml0IGZyb20gc2hvd19zdGFjaygpIHdpdGgKPj4gYSBsb2cgbGV2
ZWwgLSBwbGVhc2UsIHJlcGx5IHRvIHRoaXMgY292ZXIgbGV0dGVyLgo+IAo+IEkgYWdyZWUgd2l0
aCBhbGwgdGhlIG90aGVyIGp1c3RpZmljYXRpb24uCj4gCj4gSSB3b3VsZCBhZGQuIFRoZSBiYWNr
dHJhY2UgaXMgcmVhbGx5IHVzZWZ1bCBmb3IgZGVidWdnaW5nLiBJdCBzaG91bGQKPiBiZSBwb3Nz
aWJsZSB0byBwcmludCBpdCBldmVuIGluIGxlc3MgY3JpdGljYWwgc2l0dWF0aW9ucy4KPiAKPiBJ
IGFtIGFmcmFpZCB0aGF0IG1hbnkgcGVvcGxlIHVzZSBXQVJOKCkgZm9yIHRoaXMgcHVycG9zZS4g
QnV0IFdBUk4oKQo+IGlzIG5vdCBhbHdheXMgYXBwcm9wcmlhdGUuIFdBUk4oKSBtaXN1c2UgaHV0
cyB3aGVuIHBhbmljX29uX3dhcm4KPiBvcHRpb24gaXMgdXNlZC4KClRoYW5rcywgUGV0ci4KCi0t
IAogICAgICAgICAgRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
