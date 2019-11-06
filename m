Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 144A1F7404
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AB7DC207D9;
	Mon, 11 Nov 2019 13:37:33 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id ECAC620710
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 17:27:57 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id h27so536057pgn.0
 for <openrisc@lists.librecores.org>; Wed, 06 Nov 2019 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ILRv70ifsS4R/1VQKE/+LZSUA7puynZg3ILLVfy9hZk=;
 b=CdDAyQ43Jv36qsn9EkuUTZw8nt/+mOBKFoXfvdiENDFswTz54lmUElxhgNjniKxvLI
 izkIqTz62/+BsaxfKUgZ8S2RMG637jnDm+u0E1aGEUIzsEbWwsDV18EKNobslN2UlmYW
 WhC8g2REeIsonwoMKiOWl5u0CwVw1KGMvWwvlr5qjl4PZWOYWYsDg5p9F3UN6uGx7U/X
 y0XyKjPvcy9QpHnBDaHHpgbyRB/umgRbu9qBjoNr1nlR2d6FHD+lGiNEfvnrob7yl41T
 Rb+d5GPnNkrUNEfbqJzu6sSRExc4iKzcT+7U+xgq+doooMPjYjmc+eE6U7r6YPGlvf7O
 nVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ILRv70ifsS4R/1VQKE/+LZSUA7puynZg3ILLVfy9hZk=;
 b=S3c2H71V9xSFg/bf+8aLfEvTw7urgb8WUaR3TEW7Msdgkk72tusOFUWtOeHLrSqBbM
 5F29I8zShAB1LVXJkl0DgD33/jwuO0TWxQ0YSiIG0j6zSXkBrAdpefREcuvtmoHgcrxR
 XNuWChfNpfNRWQI7gnhLYpDnRgjndHYoLFUL1ckGRfbt3+45ZZnId4Scgx3Eb6hcX44b
 dEIiNaVcZ8F6aA8mAzu7MAY8x0v8gGdDhlBuN/1pvq+HKMJ0Hg8K30/u5Ma7KahF/bnu
 UBx13OoRCSOzsGomg6JyHK+Pk34EX9kSf29BJxdjKWM2qs4UIlK28UHVFyQfWKMiVWYl
 8PZQ==
X-Gm-Message-State: APjAAAU5tl7qah0UuhIIVRNOtj7JN1dwvajkgu3aebweCFQD/DFP194h
 Eji6QjJ+Wp+30XVrobPEmJ9lAA==
X-Google-Smtp-Source: APXvYqwbfJs+Rexz1GsgVLAw54LaKdVOAeh16aFzChJ5nDbwhrH1h0946xekzcVYBN4WN+Q23T6sbg==
X-Received: by 2002:a63:66c1:: with SMTP id a184mr3898212pgc.164.1573057676186; 
 Wed, 06 Nov 2019 08:27:56 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id m15sm21253387pgv.58.2019.11.06.08.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 08:27:55 -0800 (PST)
To: Peter Zijlstra <peterz@infradead.org>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
Date: Wed, 6 Nov 2019 16:27:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106092039.GT4131@hirez.programming.kicks-ass.net>
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
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
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

SGkgUGV0ZXIsCgpPbiAxMS82LzE5IDk6MjAgQU0sIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9u
IFdlZCwgTm92IDA2LCAyMDE5IGF0IDAzOjA0OjUxQU0gKzAwMDAsIERtaXRyeSBTYWZvbm92IHdy
b3RlOgo+PiBBZGQgbG9nIGxldmVsIGFyZ3VtZW50IHRvIHNob3dfc3RhY2soKS4KPj4gRG9uZSBp
biB0aHJlZSBzdGFnZXM6Cj4+IDEuIEludHJvZHVjaW5nIHNob3dfc3RhY2tfbG9nbHZsKCkgZm9y
IGV2ZXJ5IGFyY2hpdGVjdHVyZQo+PiAyLiBNaWdyYXRpbmcgb2xkIHVzZXJzIHdpdGggYW4gZXhw
bGljaXQgbG9nIGxldmVsCj4+IDMuIFJlbmFtaW5nIHNob3dfc3RhY2tfbG9nbHZsKCkgaW50byBz
aG93X3N0YWNrKCkKPj4KPj4gSnVzdGlmaWNhdGlvbjoKPj4gbyBJdCdzIGEgZGVzaWduIG1pc3Rh
a2UgdG8gbW92ZSBhIGJ1c2luZXNzLWxvZ2ljIGRlY2lzaW9uCj4+ICAgaW50byBwbGF0Zm9ybSBy
ZWFsaXphdGlvbiBkZXRhaWwuCj4+IG8gSSBoYXZlIGN1cnJlbnRseSB0d28gcGF0Y2hlcyBzZXRz
IHRoYXQgd291bGQgYmVuZWZpdCBmcm9tIHRoaXMgd29yazoKPj4gICBSZW1vdmluZyBjb25zb2xl
X2xvZ2xldmVsIGp1bXBzIGluIHN5c3JxIGRyaXZlciBbMV0KPj4gICBIdW5nIHRhc2sgd2Fybmlu
ZyBiZWZvcmUgcGFuaWMgWzJdIC0gc3VnZ2VzdGVkIGJ5IFRldHN1byAoYnV0IGhlCj4+ICAgcHJv
YmFibHkgZGlkbid0IHJlYWxpc2Ugd2hhdCBpdCB3b3VsZCBpbnZvbHZlKS4KPj4gbyBXaGlsZSBk
b2luZyAoMSksICgyKSB0aGUgYmFja3RyYWNlcyB3ZXJlIGFkanVzdGVkIHRvIGhlYWRlcnMKPj4g
ICBhbmQgb3RoZXIgbWVzc2FnZXMgZm9yIGVhY2ggc2l0dWF0aW9uIC0gc28gdGhlcmUgd29uJ3Qg
YmUgYSBzaXR1YXRpb24KPj4gICB3aGVuIHRoZSBiYWNrdHJhY2UgaXMgcHJpbnRlZCwgYnV0IHRo
ZSBoZWFkZXJzIGFyZSBtaXNzaW5nIGJlY2F1c2UKPj4gICB0aGV5IGhhdmUgbGVzc2VyIGxvZyBs
ZXZlbCAob3IgdGhlIHJldmVyc2UpLgo+PiBvIEFzIHRoZSByZXN1bHQgaW4gKDIpIHBsYXlzIHdp
dGggY29uc29sZV9sb2dsZXZlbCBmb3Iga2RiIGFyZSByZW1vdmVkLgo+IAo+IEkgcmVhbGx5IGRv
bid0IHVuZGVyc3RhbmQgdGhhdCB3b3JkIHNhbGFkLiBXaHkgYXJlIHlvdSBkb2luZyB0aGlzPwo+
IAoKU29ycnksIEkgc2hvdWxkIGhhdmUgdHJpZWQgdG8gZGVzY3JpYmUgYmV0dGVyLgoKSSdtIHRy
eWluZyB0byByZW1vdmUgZXh0ZXJuYWwgdXNlcnMgb2YgY29uc29sZV9sb2dsZXZlbCBieSBmb2xs
b3dpbmcKcmVhc29uczoKLSBjaGFuZ2luZyBjb25zb2xlX2xvZ2xldmVsIG9uIFNNUCBtZWFucyB0
aGF0IHVud2FudGVkIG1lc3NhZ2VzIGZyb20Kb3RoZXIgQ1BVcyB3aWxsIGFwcGVhciAodGhhdCBo
YXZlIGxvd2VyIGxvZyBsZXZlbCkKLSBvbiBVTVAgdW53YW50ZWQgbWVzc2FnZXMgbWF5IGFwcGVh
ciBpZiB0aGUgY29kZSBpcyBwcmVlbXB0ZWQgd2hpbGUgaXQKaGFzbid0IHNldCB0aGUgY29uc29s
ZV9sb2dsZXZlbCBiYWNrIHRvIG9sZAotIHJpc2luZyBjb25zb2xlX2xvZ2xldmVsIHRvIHByaW50
IHdhbnRlZCBtZXNzYWdlKHMpIG1heSBub3Qgd29yayBhdCBhbGwKaWYgcHJpbnRrKCkgaGFzIGJl
aW5nIGRlbGF5ZWQgYW5kIHRoZSBjb25zb2xlX2xvZ2xldmVsIGlzIGFscmVhZHkgc2V0CmJhY2sg
dG8gb2xkIHZhbHVlCgpTeXNycSBkcml2ZXIgY2hhbmdlcyBjb25zb2xlX2xvZ2xldmVsIGJlY2F1
c2UgaXQgbmVlZHMgdG8gcHJpbnQgbWVzc2FnZQp3aXRoIGEgc3BlY2lmaWMgbG9nIGxldmVsICh0
aGUgY29kZSBzYWlkIHVzZXJzcGFjZSByZWxpZXMgb24gdGhpcykuCktkYiBjaGFuZ2VzIGNvbnNv
bGVfbG9nbGV2ZWwgdG8gcHJpbnQgYmFja3RyYWNlIGFzIHRoZSBsb2cgbGV2ZWwgZGVwZW5kcwpv
biBhcmNoaXRlY3R1cmUgcmVhbGlzYXRpb24uCgpJIGFsc28gaGF2ZSBwYXRjaGVzIGluIHdpcCB0
aG9zZSBuZWVkcyB0byBwcmludCBiYWNrdHJhY2Ugd2l0aCBzcGVjaWZpYwpsb2dsZXZlbCAoaGln
aGVyIHdoZW4gaXQncyBjcml0aWNhbCwgbG93ZXIgd2hlbiBpdCdzIG5vdGljZSBhbmQKc2hvdWxk
bid0IGdvIHRvIHNlcmlhbCBjb25zb2xlKS4KCkJlc2lkZXMgb24gbG9jYWwgdGVzdHMgSSBzZWUg
aGl0cyB0aG9zZSBoYXZlIGhlYWRlcnMgKG1lc3NhZ2VzIGxpa2UKIkJhY2t0cmFjZTogIikgd2l0
aG91dCBhbiBhY3R1YWwgYmFja3RyYWNlIGFuZCB0aGUgcmV2ZXJzZSAtIGEgYmFja3RyYWNlCndp
dGhvdXQgYSByZWFzb24gZm9yIGl0LiBJdCdzIHF1aXRlIGFubm95aW5nIGFuZCB3b3J0aCBhZGRy
ZXNzaW5nIGJ5CnN5bmNpbmcgaGVhZGVycyBsb2cgbGV2ZWxzIHRvIGJhY2t0cmFjZXMuCgpUaGFu
a3MsCiAgICAgICAgICBEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
