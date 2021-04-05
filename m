Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF24354797
	for <lists+openrisc@lfdr.de>; Mon,  5 Apr 2021 22:33:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D5D6220417;
	Mon,  5 Apr 2021 22:33:05 +0200 (CEST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mail.librecores.org (Postfix) with ESMTPS id 7547620417
 for <openrisc@lists.librecores.org>; Mon,  5 Apr 2021 19:16:39 +0200 (CEST)
Received: by mail-pf1-f181.google.com with SMTP id c204so4815806pfc.4
 for <openrisc@lists.librecores.org>; Mon, 05 Apr 2021 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ai3CdCbkrXPSlQhahzdlfMoVkl12Ktt9EKKlkNpbqIk=;
 b=T5OZIJi1a+S0UmB8ju9dRtp9RWLpyoSfUudALSFJBsooFu63xRQSZft0M3qzy93k0r
 z7x2JAHldp19Jlo5384VoYUVNQ2yeLvjJ5z5R7QVmttinVeV9VjzoAdj8fejaeiR8lyF
 62143nJ12x8hml5vfS8LwEeOZj9TXLo/W5cC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ai3CdCbkrXPSlQhahzdlfMoVkl12Ktt9EKKlkNpbqIk=;
 b=RmrimIVL79utm/kyt7pYUYqrWxWO8KXKg+cp7tJkdytowby1UG3Q9u1aAFhA9cOdPA
 m4meK2nLe9xzstnE8XPRKFsVpYP0kB19g1ptpQ0NbeU6zzTKhmw0/z91thSqHZ4hDgvi
 YRpk1+uJNv0yUemhzsL8qYMmr1mdcRom5lnp9bFPsHMzZDb28mphe2onlQTUHKm4TUuU
 72NT/2CEgV8hW9Z/tg9x3VuG99GsZqFKPX+sJeQTItwEBT2c23IYbPdfIkwItBZzjiWV
 LLK4RbtKLUM76GJmZETlP4RKPYnQtI9x0oF1evB94G9Ok4R//ecLu6SfdsNakBQbcl7I
 K++A==
X-Gm-Message-State: AOAM532itqlkvpmSywDaIEjbuko4JFD31VpEzR0LMgha+CMLuP7ReX4H
 kpSdHZaRJ8t2JaiqpAPz/tVVRA==
X-Google-Smtp-Source: ABdhPJzeC0ByHI7nQCydlnTXLn+PCcFS3ix/VPjfDTJClWjlj4ukWG1IoY9lD9yJRxSqNyL/TIxgvw==
X-Received: by 2002:a65:5282:: with SMTP id y2mr18489152pgp.293.1617642997590; 
 Mon, 05 Apr 2021 10:16:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h29sm4545893pgb.3.2021.04.05.10.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:16:36 -0700 (PDT)
Date: Mon, 5 Apr 2021 10:16:35 -0700
From: Kees Cook <keescook@chromium.org>
To: David Hildenbrand <david@redhat.com>
Message-ID: <202104051013.F432CAC4@keescook>
References: <20210319143452.25948-1-david@redhat.com>
 <20210319143452.25948-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319143452.25948-2-david@redhat.com>
X-Mailman-Approved-At: Mon, 05 Apr 2021 22:33:03 +0200
Subject: Re: [OpenRISC] [PATCH RFC 1/3] drivers/char: remove /dev/kmem for
 good
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
Cc: Andrew Lunn <andrew@lunn.ch>, Hillf Danton <hdanton@sina.com>,
 Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Pavel Machek \(CIP\)" <pavel@denx.de>, linux-mm@kvack.org,
 Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 Xiaoming Ni <nixiaoming@huawei.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Corentin Labbe <clabbe@baylibre.com>, Rich Felker <dalias@libc.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Robert Richter <rric@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 huang ying <huang.ying.caritas@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Kairui Song <kasong@redhat.com>,
 William Cohen <wcohen@redhat.com>, Chris Zankel <chris@zankel.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Theodore Dubois <tblodt@icloud.com>, Minchan Kim <minchan@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXIgMTksIDIwMjEgYXQgMDM6MzQ6NTBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gRXhwbG9yaW5nIC9kZXYva21lbSBhbmQgL2Rldi9tZW0gaW4gdGhlIGNvbnRl
eHQgb2YgbWVtb3J5IGhvdCh1bilwbHVnIGFuZAo+IG1lbW9yeSBiYWxsb29uaW5nLCBJIHN0YXJ0
ZWQgcXVlc3Rpb25pbmcgdGhlIGV4aXN0YW5jZSBvZiAvZGV2L2ttZW0uCj4gCj4gQ29tcGFyaW5n
IGl0IHdpdGggdGhlIC9wcm9jL2tjb3JlIGltcGxlbWVudGF0aW9uLCBpdCBkb2VzIG5vdCBzZWVt
IHRvIGJlCj4gYWJsZSB0byBkZWFsIHdpdGggdGhpbmdzIGxpa2UKPiBhKSBQYWdlcyB1bm1hcHBl
ZCBmcm9tIHRoZSBkaXJlY3QgbWFwcGluZyAoZS5nLiwgdG8gYmUgdXNlZCBieSBzZWNyZXRtZW0p
Cj4gICAtPiBrZXJuX2FkZHJfdmFsaWQoKS4gdmlydF9hZGRyX3ZhbGlkKCkgaXMgbm90IHN1ZmZp
Y2llbnQuCj4gYikgU3BlY2lhbCBjYXNlcyBsaWtlIGdhcnQgYXBlcnR1cmUgbWVtb3J5IHRoYXQg
aXMgbm90IHRvIGJlIHRvdWNoZWQKPiAgIC0+IG1lbV9wZm5faXNfcmFtKCkKPiBVbmxlc3MgSSBh
bSBtaXNzaW5nIHNvbWV0aGluZywgaXQncyBhdCBsZWFzdCBicm9rZW4gaW4gc29tZSBjYXNlcyBh
bmQgbWlnaHQKPiBmYXVsdC9jcmFzaCB0aGUgbWFjaGluZS4KPiAKPiBMb29rcyBsaWtlIGl0cyBl
eGlzdGFuY2UgaGFzIGJlZW4gcXVlc3Rpb25lZCBiZWZvcmUgaW4gMjAwNSBhbmQgMjAxMAo+IFsx
XSwgYWZ0ZXIgfjExIGFkZGl0aW9uYWwgeWVhcnMsIGl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gcmV2
aXZlIHRoZQo+IGRpc2N1c3Npb24uCj4gCj4gQ09ORklHX0RFVktNRU0gaXMgb25seSBlbmFibGVk
IGluIGEgc2luZ2xlIGRlZmNvbmZpZyAob24gcHVycG9zZSBvciBieQo+IG1pc3Rha2U/KS4gQWxs
IGRpc3RyaWJ1dGlvbnMgSSBsb29rZWQgYXQgZGlzYWJsZSBpdC4KPiAKPiAxKSAvZGV2L2ttZW0g
d2FzIHBvcHVsYXIgZm9yIHJvb3RraXRzIFsyXSBiZWZvcmUgaXQgZ290IGRpc2FibGVkCj4gICAg
YmFzaWNhbGx5IGV2ZXJ5d2hlcmUuIFVidW50dSBkb2N1bWVudHMgWzNdICJUaGVyZSBpcyBubyBt
b2Rlcm4gdXNlciBvZgo+ICAgIC9kZXYva21lbSBhbnkgbW9yZSBiZXlvbmQgYXR0YWNrZXJzIHVz
aW5nIGl0IHRvIGxvYWQga2VybmVsIHJvb3RraXRzLiIuCj4gICAgUkhFTCBkb2N1bWVudHMgaW4g
YSBCWiBbNV0gIml0IHNlcnZlZCBubyBwcmFjdGljYWwgcHVycG9zZSBvdGhlciB0aGFuIHRvCj4g
ICAgc2VydmUgYXMgYSBwb3RlbnRpYWwgc2VjdXJpdHkgcHJvYmxlbSBvciB0byBlbmFibGUgYmlu
YXJ5IG1vZHVsZSBkcml2ZXJzCj4gICAgdG8gYWNjZXNzIHN0cnVjdHVyZXMvZnVuY3Rpb25zIHRo
ZXkgc2hvdWxkbid0IGJlIHRvdWNoaW5nIgo+IAo+IDIpIC9wcm9jL2tjb3JlIGlzIGEgZGVjZW50
IGludGVyZmFjZSB0byBoYXZlIGEgY29udHJvbGxlZCB3YXkgdG8gcmVhZAo+ICAgIGtlcm5lbCBt
ZW1vcnkgZm9yIGRlYnVnZ2luZyBwdXBvc2VzLiAod2lsbCBuZWVkIHNvbWUgZXh0ZW5zaW9ucyB0
bwo+ICAgIGRlYWwgd2l0aCBtZW1vcnkgb2ZmbGluaW5nL3VucGx1ZywgbWVtb3J5IGJhbGxvb25p
bmcsIGFuZCBwb2lzb25lZAo+ICAgIHBhZ2VzLCB0aG91Z2gpCj4gCj4gMykgSXQgbWlnaHQgYmUg
dXNlZnVsIGZvciBjb3JuZXIgY2FzZSBkZWJ1Z2dpbmcgWzFdLiBLREIvS0dEQiBtaWdodCBiZSBh
Cj4gICAgYmV0dGVyIGZpdCwgZXNwZWNpYWxseSwgdG8gd3JpdGUgcmFuZG9tIG1lbW9yeTsgaGFy
ZGVyIHRvIHNob290Cj4gICAgeW91cnNlbGYgaW50byB0aGUgZm9vdC4KPiAKPiA0KSAiS2VybmVs
IE1lbW9yeSBFZGl0b3IiIGhhc24ndCBzZWVuIGFueSB1cGRhdGVzIHNpbmNlIDIwMDAgYW5kIHNl
ZW1zCj4gICAgdG8gYmUgaW5jb21wYXRpYmxlIHdpdGggNjRiaXQgWzFdLiBGb3IgZWR1Y2F0aW9u
YWwgcHVycG9zZXMsCj4gICAgL3Byb2Mva2NvcmUgbWlnaHQgYmUgdXNlZCB0byBtb25pdG9yIHZh
bHVlIHVwZGF0ZXMgLS0gb3Igb2xkZXIKPiAgICBrZXJuZWxzIGNhbiBiZSB1c2VkLgo+IAo+IDUp
IEl0J3MgYnJva2VuIG9uIGFybTY0LCBhbmQgdGhlcmVmb3JlLCBjb21wbGV0ZWx5IGRpc2FibGVk
IHRoZXJlLgo+IAo+IExvb2tzIGxpa2UgaXQncyBlc3NlbnRpYWxseSB1bnVzZWQgYW5kIGhhcyBi
ZWVuIHJlcGxhY2VkIGJ5IGJldHRlcgo+IHN1aXRlZCBpbnRlcmZhY2VzIGZvciBpbmRpdmlkdWFs
IHRhc2tzICgvcHJvYy9rY29yZSwgS0RCL0tHREIpLiBMZXQncwo+IGp1c3QgcmVtb3ZlIGl0Lgo+
IAo+IFsxXSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvMTQ3OTAxLwo+IFsyXSBodHRwczovL3d3
dy5saW51eGpvdXJuYWwuY29tL2FydGljbGUvMTA1MDUKPiBbM10gaHR0cHM6Ly93aWtpLnVidW50
dS5jb20vU2VjdXJpdHkvRmVhdHVyZXMjQS4yRmRldi4yRmttZW1fZGlzYWJsZWQKPiBbNF0gaHR0
cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMva21lLwo+IFs1XSBodHRwczovL2J1Z3ppbGxh
LnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE1NDc5Ngo+IAo+IFsuLi5dCj4gQ2M6IExpbnV4
IEFQSSA8bGludXgtYXBpQHZnZXIua2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KClllcyBwbGVhc2UhIEFzIEphbWVzIFRyb3Vw
IHBvaW50ZWQgb3V0IGFscmVhZHksIHRoaXMgd2FzIHR1cm5lZCBvZmYgaW4KVWJ1bnR1IGluIDIw
MDguIEkgZG9uJ3QgcmVtZW1iZXIgYSBzaW5nbGUgY29tcGxhaW50IGZyb20gYW55b25lIHdobwp3
YXNuJ3QgYSByb290a2l0IGF1dGhvci4gOykKCkFja2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29r
QGNocm9taXVtLm9yZz4KCi0tIApLZWVzIENvb2sKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
