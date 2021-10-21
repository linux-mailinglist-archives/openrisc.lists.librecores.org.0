Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BD371435CB0
	for <lists+openrisc@lfdr.de>; Thu, 21 Oct 2021 10:10:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 50673240FF;
	Thu, 21 Oct 2021 10:10:03 +0200 (CEST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mail.librecores.org (Postfix) with ESMTPS id A2FD3240F4
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 10:10:01 +0200 (CEST)
Received: by mail-ua1-f43.google.com with SMTP id a17so11527198uax.12
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 01:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hd/+QnCCQ1ttXjZzIuOwM5Awcbe5eGoYYrYqsyq6bCA=;
 b=78VRILA+tX6mz87NYl/ZWGU2WrwPuc4AadAvkLUk2Qzhf5+ESHpuunHkc0ESYT5SPA
 TXSAnTgXbWuhyYlwQ1+miMk2gWCtp8MYXX4BSOSiDNYR/qT4qn7xEcjQbe0DO9mL84Bc
 lMHMpOlnqNFrrvOuKytv66khyryg7l4vggEktTwrUwVMeTDWM/3nx+kvLnDBRHGJ+r6u
 RBT8b6dytdp5ZgFPTmfNhMqLe+ryiNJM9OgQmCS8LsTTAYrNhvOdklGT9oDLePQyWgyO
 pZcx7EeQJWblpXMkXmNo3xzrRKLxHjPCqVp9ERZb/0LCVa/xNEIAVc2pJ9D2PahtvH/X
 dzYA==
X-Gm-Message-State: AOAM5321zcSZm/P9CksWtQV8xvV8O+Z541uhJ1IdxADE6wWD40+0I6aS
 hFXqVD4pFapyHX0NSj1m8k/3YAvXepEWLA==
X-Google-Smtp-Source: ABdhPJxJ6G0ULYzGtSDsp/RytiHHhMMlYjIUc3s8z5JcdWPkV7+kIhIRtU5L5QTFe7rYq9RQYZR4sA==
X-Received: by 2002:a67:e117:: with SMTP id d23mr4083137vsl.13.1634803800387; 
 Thu, 21 Oct 2021 01:10:00 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id x7sm2556333vsk.19.2021.10.21.01.09.57
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 01:09:58 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id h4so11664890uaw.1
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 01:09:57 -0700 (PDT)
X-Received: by 2002:ab0:3d9a:: with SMTP id l26mr4816956uac.114.1634803797383; 
 Thu, 21 Oct 2021 01:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <87y26nmwkb.fsf@disp2133> <877de7jrev.fsf@disp2133>
In-Reply-To: <877de7jrev.fsf@disp2133>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Oct 2021 10:09:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURxrdjsXq7+q-AWTwxVUdmddOj2vvNHv6M=WtsU5nRvg@mail.gmail.com>
Message-ID: <CAMuHMdURxrdjsXq7+q-AWTwxVUdmddOj2vvNHv6M=WtsU5nRvg@mail.gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [OpenRISC] [PATCH 21/20] signal: Replace force_sigsegv(SIGSEGV)
 with force_fatal_sig(SIGSEGV)
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Greentime Hu <green.hu@gmail.com>, H Peter Anvin <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Openrisc <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Zankel <chris@zankel.net>,
 Jonas Bonn <jonas@southpole.se>, Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Maciej Rozycki <macro@orcam.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgRXJpYywKClBhdGNoIDIxLzIwPwoKT24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMTE6NTIgUE0g
RXJpYyBXLiBCaWVkZXJtYW4KPGViaWVkZXJtQHhtaXNzaW9uLmNvbT4gd3JvdGU6Cj4gTm93IHRo
YXQgZm9yY2VfZmF0YWxfc2lnIGV4aXN0cyBpdCBpcyB1bm5lY2Vzc2FyeSBhbmQgYSBiaXQgY29u
ZnVzaW5nCj4gdG8gdXNlIGZvcmNlX3NpZ3NlZ3YgaW4gY2FzZXMgd2hlcmUgdGhlIHNpbXBsZXIg
Zm9yY2VfZmF0YWxfc2lnIGlzCj4gd2FudGVkLiAgU28gY2hhbmdlIGV2ZXJ5IGluc3RhbmNlIHdl
IGNhbiB0byBtYWtlIHRoZSBjb2RlIGNsZWFyZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiAiRXJpYyBX
LiBCaWVkZXJtYW4iIDxlYmllZGVybUB4bWlzc2lvbi5jb20+Cgo+ICBhcmNoL202OGsva2VybmVs
L3RyYXBzLmMgICAgICAgIHwgMiArLQoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
