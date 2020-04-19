Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C8FA21B20CD
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A48CD20B10;
	Tue, 21 Apr 2020 10:02:07 +0200 (CEST)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id C368320AAC
 for <openrisc@lists.librecores.org>; Sun, 19 Apr 2020 22:57:32 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id np9so3635198pjb.4
 for <openrisc@lists.librecores.org>; Sun, 19 Apr 2020 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=10wHTDV3Jlt1o/4dM6dKNqfxFvNQyp03MchNiw6CNvI=;
 b=TTprQ7oF/qr5O2gY14ssBc2+YX0kYmNBCkX9t9k5Uq4nsNokKXIS5fzrJe4g6NsyQz
 YhSafGLhKFFbMSh8I2ktuQUDCQkK3I3OHZ/xxc4M+aXrAhGVpN4vIHZgAVXDeE8gLsCw
 p3gjJSNN4nS0O7kA6uiDNiTWRv8LX20XqeqhB08GTal/OjZtuPJaP6xhhUa3+J9FHo2s
 l20AYfXAnRWzxfhdbCDaWlrhW5MfQrC97rV+o06IkU8NdDv9+zfPzi8DOD92SixLOnh1
 VliQwl98W3bQpSzR6lPJKIqznYz9irARgmH33uGvHy0/S7fdRCMQYTYIMaZ5DjkiwlAW
 i7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=10wHTDV3Jlt1o/4dM6dKNqfxFvNQyp03MchNiw6CNvI=;
 b=spT8fnEf+O0oyKjHIxnK1fyV+cZ4lz15GdsjASEQfDHXFsSHgTuISyky9NsJGoM56n
 H3boifauVMfnsYRN4sFV+zU4FpZm/y9DFmsuIVca2xM6a9RE6RaBMn5R3dXg254PnyHq
 8Hk3iU3vlw+H4Y5ZEjHnhJwtIhvEix6PVqskH0Yh6Ch15y9oiyL+plY0jf8Qpd5S2HLL
 hZPzNXA9BgcBWABX8LiRMJUlg4c30uuy3shgIkJz5YgmuZRYpa3TIHr5RPUKk4IALbMJ
 OwWBUGsSEeHQi5gWKAgXEKJXHW6PYinwzIJk0faFPMTdJZmRN8L/6mtb2JwmX56uyYvJ
 BmJg==
X-Gm-Message-State: AGi0PubyxzQhXrer1M9df2nBlH4ldJNWNeVwRhwGta+lK8MbMaGcdeyn
 cruFFYXDS2fnUalEPfqW8G4=
X-Google-Smtp-Source: APiQypJgkj5uU6XdvfpScoUbQerW8YThuQLYzrYHEdzNUz6J+baBEOVak35iML5kobr1tIWTj4SMsQ==
X-Received: by 2002:a17:90a:266c:: with SMTP id
 l99mr16058863pje.186.1587329851021; 
 Sun, 19 Apr 2020 13:57:31 -0700 (PDT)
Received: from localhost (g19.222-224-154.ppp.wakwak.ne.jp. [222.224.154.19])
 by smtp.gmail.com with ESMTPSA id
 p8sm12089663pjd.10.2020.04.19.13.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 13:57:30 -0700 (PDT)
Date: Mon, 20 Apr 2020 05:57:28 +0900
From: Stafford Horne <shorne@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20200419205728.GT7926@lianli.shorne-pla.net>
References: <20200418201944.482088-1-dima@arista.com>
 <20200418201944.482088-25-dima@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200418201944.482088-25-dima@arista.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: Re: [OpenRISC] [PATCHv3 24/50] openrisc: Add show_stack_loglvl()
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 openrisc@lists.librecores.org, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBBcHIgMTgsIDIwMjAgYXQgMDk6MTk6MThQTSArMDEwMCwgRG1pdHJ5IFNhZm9ub3Yg
d3JvdGU6Cj4gQ3VycmVudGx5LCB0aGUgbG9nLWxldmVsIG9mIHNob3dfc3RhY2soKSBkZXBlbmRz
IG9uIGEgcGxhdGZvcm0KPiByZWFsaXphdGlvbi4gSXQgY3JlYXRlcyBzaXR1YXRpb25zIHdoZXJl
IHRoZSBoZWFkZXJzIGFyZSBwcmludGVkIHdpdGgKCkluc3RlYWQgb2YgcmVhbGl6YXRpb24gSSB3
b3VsZCBzYXkgIkltcGxlbWVudGF0aW9uIi4KCj4gbG93ZXIgbG9nIGxldmVsIG9yIGhpZ2hlciB0
aGFuIHRoZSBzdGFja3RyYWNlIChkZXBlbmRpbmcgb24KPiBhIHBsYXRmb3JtIG9yIHVzZXIpLgo+
IAo+IEZ1cnRoZXJtb3JlLCBpdCBmb3JjZXMgdGhlIGxvZ2ljIGRlY2lzaW9uIGZyb20gdXNlciB0
byBhbiBhcmNoaXRlY3R1cmUKPiBzaWRlLiBJbiByZXN1bHQsIHNvbWUgdXNlcnMgYXMgc3lzcnEv
a2RiL2V0YyBhcmUgZG9pbmcgdHJpY2tzIHdpdGgKPiB0ZW1wb3JhcnkgcmlzaW5nIGNvbnNvbGVf
bG9nbGV2ZWwgd2hpbGUgcHJpbnRpbmcgdGhlaXIgbWVzc2FnZXMuCj4gQW5kIGluIHJlc3VsdCBp
dCBub3Qgb25seSBtYXkgcHJpbnQgdW53YW50ZWQgbWVzc2FnZXMgZnJvbSBvdGhlciBDUFVzLAo+
IGJ1dCBhbHNvIG9taXQgcHJpbnRpbmcgYXQgYWxsIGluIHRoZSB1bmx1Y2t5IGNhc2Ugd2hlcmUg
dGhlIHByaW50aygpCj4gd2FzIGRlZmVycmVkLgo+IAo+IEludHJvZHVjaW5nIGxvZy1sZXZlbCBw
YXJhbWV0ZXIgYW5kIEtFUk5fVU5TVVBQUkVTU0VEIFsxXSBzZWVtcwo+IGFuIGVhc2llciBhcHBy
b2FjaCB0aGFuIGludHJvZHVjaW5nIG1vcmUgcHJpbnRrIGJ1ZmZlcnMuCj4gQWxzbywgaXQgd2ls
bCBjb25zb2xpZGF0ZSBwcmludGluZ3Mgd2l0aCBoZWFkZXJzLgo+IAo+IEludHJvZHVjZSBzaG93
X3N0YWNrX2xvZ2x2bCgpLCB0aGF0IGV2ZW50dWFsbHkgd2lsbCBzdWJzdGl0dXRlCj4gc2hvd19z
dGFjaygpLgoKV2lsbCB5b3UgZG8gdGhlIHdvcmsgdG8gcmVwbGFjZSBzaG93X3N0YWNrKCksIHdo
ZW4gaXMgdGhhdCBwbGFubmVkPwoKT3RoZXIgdGhhbiB0aGF0IHNtYWxsIGNvbW1lbnQgdGhpcyBs
b29rcyBmaW5lLgoKQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoK
Cj4gQ2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KPiBDYzogU3RhZmZvcmQgSG9y
bmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gQ2M6IFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5r
cmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiBDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA1MjgwMDI0MTIu
MTYyNS0xLWRpbWFAYXJpc3RhLmNvbS9ULyN1Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFNhZm9u
b3YgPGRpbWFAYXJpc3RhLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
