Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9B90D101F1D
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 09D79207BC;
	Tue, 19 Nov 2019 10:04:19 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 671F320203
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 03:17:53 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id z4so12151132pfn.12
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 18:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IS2Rt6ZY2kbQpUl893KQNxQCDA75x7+my/1Tf7NswKk=;
 b=Vjlm6KDBvoD6YwvO++lGZ6lHjSc6cCAm9fWSs4JjxabSDi/CqNgEayfiCYPC9t2GLz
 /Uty/IrZcv04aOS3qRrPGUG7rvgiF7YDnI2Kh9DQ5F3zuIcYwKRvol7P+LJHVR2Ntpue
 BmenkoLlXCW6FGqP0oYogfaCGkjco6cjgwMGb8PovVw8l1XJbVJPK3lxsi28NPqBWING
 uoTRw1Bt7GD9J0aMH2Xm/nWO4Q+ipdt8rIvGvN7pJpIBErQgGrRImSVcDd2J/2wookMd
 9Mf3+OZR0ijbdxrDUHHqzfcSZeytQjNDcnXBd9Ph8Qnd5c5vZ2BNhRMMpdwPBrRfh+x9
 Q4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IS2Rt6ZY2kbQpUl893KQNxQCDA75x7+my/1Tf7NswKk=;
 b=QHiv/duttyrzJzFcDv61a4w46YL1XiRlcwu1g5E5SKptTpd52H163Zz7vxucLa1WYB
 gS9gDOQBhOwXomf6xHqIdy6uDmOrPVfBOHtJL82Zv6zsvZpLVJzAYYJO3IMaDovpUoaP
 /fYR79oxarljkk//rSGcLE9piuE7o2lnP8ro+Fv09Fa9haBjR9TTzytgD/iIH/uDR8DH
 mszEbRH4aHNSXSD+AaTubpETn2YB7t5KGv9FjNDfN/E2pc9TE1oPsMj0vDmbc7T2Zo3N
 9EyKazZ7F55F/HpkQCP6WulgsSLnzBGSx4jzS/Flkhgjm7naZr2P7JbyhGf4RF4m+ISy
 jGUQ==
X-Gm-Message-State: APjAAAX5M1Zb0fc7Eld/eP/RJGbFqfHdSo9Sv16XAE+S1EtjGoeEj20/
 bF+061xEwFyeQlJ7cEiMu6Y=
X-Google-Smtp-Source: APXvYqzpzPbBNdkztHOhg5atVqEV6ayQFi/1XFUzsE81gTsFNG+Jay6WO4tdKRJ91MFuBRoP65cRJw==
X-Received: by 2002:a65:6119:: with SMTP id z25mr32726962pgu.332.1573525071244; 
 Mon, 11 Nov 2019 18:17:51 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id k103sm739924pje.16.2019.11.11.18.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 18:17:50 -0800 (PST)
Date: Tue, 12 Nov 2019 11:17:47 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191112021747.GA68506@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-pm@vger.kernel.org,
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
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
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

T24gKDE5LzExLzExIDE5OjQ3KSwgRG1pdHJ5IFNhZm9ub3Ygd3JvdGU6ClsuLl0KPiBJIGRvbid0
IHNlZSBob3cgYml0cyBvbiB0YXNrX3N0cnVjdCBvciBpbiBwZXItY3B1IGFyZSBlYXNpZXIgdGhh
bgo+IHN1cHBseWluZyBhIGxvZyBsZXZlbCBwYXJhbWV0ZXIgZG93biB0aGUgc3RhY2suCj4gSG93
IHdvdWxkIGl0IHdvcmsgaWYgc3lzcnFfaGFuZGxlX2NyYXNoKCkgY2FsbGVkIGJ5IGtleS1wcmVz
cz8KPiBIb3cgd291bGQgdGhhdCBpbnRlcmFjdCB3aXRoIGRlZmVycmVkIHByaW50aW5nPwo+IEhv
dyB3b3VsZCBpdCBtYWtlIHZpc2libGUgcHJpbnRzIGZyb20gY3VycmVudCBjb250ZXh0LCBidXQg
bm90IGZyb20KPiBzb21ldGhpbmcgdGhhdCBwcmVlbXB0ZWQgaXQ/CgpbLi5dCgpwZXItY29udGV4
dCBsb2dfbGV2ZWwgd29ya3MgcHJldHR5IG11Y2ggdGhlIHNhbWUgd2F5IGFzIHBlci1tZXNzYWdl
CmxvZ19sZXZlbC4KCi8vIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC0gLSAtIC0gLy8Kc3RhdGljIERFRklORV9QRVJfQ1BVKGludCwgY3B1X2xv
Z2xldmVsc1s0XSk7IC8vIEBJTklUTUUuLiBMT0dMRVZFTF9ERUJVRyArIDE/CgpzdGF0aWMgaW50
IF9fcHJpbnRpbmdfY29udGV4dCh2b2lkKQp7Cgl1bnNpZ25lZCBpbnQgcHJlZW1wdCA9IHByZWVt
cHRfY291bnQoKTsKCglpZiAoIShwcmVlbXB0ICYgKE5NSV9NQVNLIHwgSEFSRElSUV9NQVNLIHwg
U09GSVRSUV9PRkZTRVQpKSkKCQlyZXR1cm4gMDsKCWlmIChwcmVlbXB0ICYgU09GSVRSUV9PRkZT
RVQpCgkJcmV0dXJuIDE7CglpZiAocHJlZW1wdCAmIEhBUkRJUlFfTUFTSykKCQlyZXR1cm4gMjsK
CXJldHVybiAzOwp9CgpzdGF0aWMgaW50IGFkal9jb250ZXh0X2xvZ2xldmVsKGludCBsZXZlbCkK
ewoJaW50IGN0eCA9IF9fcHJpbnRpbmdfY29udGV4dCgpOwoJaW50IGNwdV9sZXZlbCA9IHRoaXNf
Y3B1X3JlYWQoY3B1X2xvZ2xldmVsc1tjdHhdKTsKCgkvLyB0aGlzIG9uZSBpcyBpbXBvcnRhbnQK
CWlmIChsZXZlbCA9PSBMT0dMRVZFTF9TQ0hFRCkKCQlyZXR1cm4gbGV2ZWw7CgkvLyB3ZSBhcmUg
bm90IGluIGVtZXJnZW5jeSBjb250ZXh0CglpZiAoY3B1X2xldmVsID09IExPR0xFVkVMX0RFQlVH
ICsgMSkKCQlyZXR1cm4gbGV2ZWw7CgkvLyB3ZSBiZXR0ZXIgbm90IG92ZXJyaWRlIHRoZXNlCglp
ZiAoTE9HTEVWRUxfRU1FUkcgPD0gbGV2ZWwgJiYgbGV2ZWwgPD0gTE9HTEVWRUxfRVJSKQoJCXJl
dHVybiBsZXZlbDsKCXJldHVybiBjcHVfbGV2ZWw7Cn0KCnZvaWQgcHJpbnRrX2VtZXJnZW5jeV9l
bnRlcihpbnQgbG9nX2xldmVsKQp7CglpbnQgY3R4OwoKCXByZWVtcHRfZGlzYWJsZSgpOwoJY3R4
ID0gX19wcmludGluZ19jb250ZXh0KCk7Cgl0aGlzX2NwdV93cml0ZShjcHVfbG9nbGV2ZWxzW2N0
eF0sIGxvZ19sZXZlbCk7Cn0KCnZvaWQgcHJpbnRrX2VtZXJnZW5jeV9leGl0KHZvaWQpCnsKCWlu
dCBjdHggPSBfX3ByaW50aW5nX2NvbnRleHQoKTsKCgl0aGlzX2NwdV93cml0ZShjcHVfbG9nbGV2
ZWxzW2N0eF0sIExPR0xFVkVMX0RFQlVHICsgMSk7CglwcmVlbXB0X2VuYWJsZSgpOwp9Cgp2b2lk
IHZwcmludGtfZW1pdCguLi4pCnsKCWxldmVsID0gYWRqX2NvbnRleHRfbG9nbGV2ZWwobGV2ZWwp
Owp9Ci8vCi8vIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC0gLy8KLy8Kc3RhdGljIHZvaWQgX19zaG93X3N0YWNrKHN0cnVjdCB0YXNr
X3N0cnVjdCAqdGFzaywgdW5zaWduZWQgbG9uZyAqc3ApCnsKCXByaW50aygpOwoJLi4uCglwcmlu
dGsoKTsKfQoKdm9pZCBzaG93X3N0YWNrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgdW5zaWdu
ZWQgbG9uZyAqc3AsIGludCBsb2dfbGV2ZWwpCnsKCXByaW50a19lbWVyZ2VuY3lfZW50ZXIobG9n
X2xldmVsKTsKCV9fc2hvd19zdGFjayh0YXNrLCBzcCk7CglwcmludGtfZW1lcmdlbmN5X2V4aXQo
KTsKfQovLyAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC8vCgpzaG93X3N0YWNrKCkgbmV2ZXIgc2NoZWR1bGVzLCBkaXNhYmxpbmcg
cHJlZW1wdGlvbiBhcm91bmQgaXQgc2hvdWxkCm5vdCBjaGFuZ2UgYW55dGhpbmcuIFNob3VsZCBp
dCBiZSBpbnRlcnJ1cHRlZCwgd2Ugd2lsbCBoYW5kbGUgaXQgdmlhCnByZWVtcHQgY291bnQuCgpw
cmludGtfZW1lcmdlbmN5X2VudGVyKGxvZ19sZXZlbCkgaGFuZGxlcyBldmVyeSBwcmludGsoKSB0
aGF0Cl9fc2hvd19zdGFjaygpIGFuZCBmcmllbmRzIGRvLiBOb3Qgd29yc2UgdGhhbiBwcmludGso
IiVzIFN0YWNrIiwgbHZsKTsKYWxsIG92ZXIgdGhlIHBsYWNlLgoKPiBXaGF0IEknbSBnb2luZyB0
byBkbyAtIGlzIHRvIGZpeCBhbGwgYnVpbGQgYW5kIHJlcG9ydGVkIGlzc3VlcywgSSdsbAo+IHNl
bmQgdjIgdGhpcyB3ZWVrIGFuZCBmZWVsIGZyZWUgdG8gTkFLIGl0LCBJIHdpbGwgZm9yZ2V0IGFi
b3V0IHRob3NlCj4gcGF0Y2hlcyBhbmQgd29uJ3QgYmUgb2ZmZW5kZWQuCgpMb3ZlbHkuCkFuZCAt
IG5vLCBJJ20gbm90IGdvaW5nIHRvIE5BSyBwbGF0Zm9ybSBzcGVjaWZpYyBjaGFuZ2VzLiBKdXN0
IHNvIHlvdSBrbm93LgoKKkFsbCogSSdtIHRhbGtpbmcgYWJvdXQgaXMgYW4gYWx0ZXJuYXRpdmUs
IGxlc3MgImdvIGFuZCB0b3VjaCBhIHRvbiBvZgpwbGF0Zm9ybSBjb2RlIiBhcHByb2FjaC4gVGhl
IGFyZ3VtZW50ICJJIHBhdGNoZWQgc28gbWFueSBmaWxlcyB0aGF0IEknbQpub3QgZXZlbiBnb2lu
ZyB0byBkaXNjdXNzIGFueXRoaW5nIG5vdyIgaXMgbm90IHByb2R1Y3RpdmUsIHRvIHNheSB0aGUK
bGVhc3QuIEhvcGUgdGhpcyBjbGFyaWZpZXMuCgoJLXNzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
