Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D9F35477B0B
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 18:51:03 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B9284242E5;
	Thu, 16 Dec 2021 18:51:03 +0100 (CET)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mail.librecores.org (Postfix) with ESMTPS id B75CA242DB
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 18:51:02 +0100 (CET)
Received: by mail-lf1-f54.google.com with SMTP id t3so4772997lfe.12
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 09:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ms/wuM8WAzRPY4WykXwi0/YehvvfoHEwDko5JETWgyY=;
 b=Yt6iQrPRR02VnMfhyQFLe4lPoyYi1LLJZh1EAgoFFL5odLJNrpYEgdV1gCmEQ/8Ebm
 vqyvFiXql5+DLQ9/AE42zzsnV8GD+7jyfxwfcG0fq/qlAeVI5VhSB0SiPNjhiYS6tgxi
 kvXLQUaOrvL+UE8xSz2YpOdT/AUCe9TuJhNKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ms/wuM8WAzRPY4WykXwi0/YehvvfoHEwDko5JETWgyY=;
 b=1xfWyooyN8yb16pGhKv2TqqnErUfrmJv4TCJSGAykgH7tW/9sgV81rcUtHipQ+x6EN
 CYIIg4KtNszBR0pM1WYUQrAr5Y4gOw8x/G0f9MUpTiYxdP9PJIENX/uC8K3ftpJhxvQ7
 Gr4tVag+I/Ci0ik0R9ReyBXQks61wxlm9zBcI+v9y/b9mqVgwGIgJ6uLfMAM5J7qJ/2q
 LJ6zs6o2b/RWcbTmkHwP+JpbWkwEJII3qpxWmweeepqVEmIPK3aOXeuOWcEtMuMudeek
 dsIH3yNhT6DAHIfoOiNGPirYTMPFmeqammvrwdyc78iArKrXucagaztGOFNbKyxL9316
 l5qg==
X-Gm-Message-State: AOAM531B4hE5dfGi1/Fe6kGXwE8t2/UX0O2tzBdas+hhA+Ol0ULYQAc+
 mHl6Y0azk8XXA3vQlEtguoDA5Jma68QIaJHk7vo=
X-Google-Smtp-Source: ABdhPJyaDK7ZIkPwxdhVu9eH4ZMH++WePTgfuWJJ+aS0BDcYYv2aGLswyorznUnkTkbwIkq2ZNmHpg==
X-Received: by 2002:ac2:52b5:: with SMTP id r21mr15610038lfm.127.1639677061772; 
 Thu, 16 Dec 2021 09:51:01 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id w38sm403832lfu.265.2021.12.16.09.51.01
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 09:51:01 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id z8so39680690ljz.9
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 09:51:01 -0800 (PST)
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr9660488wra.281.1639676577218; 
 Thu, 16 Dec 2021 09:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
In-Reply-To: <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Dec 2021 09:42:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiKkdYLY0bv+nXrcJz3NH9mAqPAafX7PpW5EwVtxsEu7Q@mail.gmail.com>
Message-ID: <CAHk-=wiKkdYLY0bv+nXrcJz3NH9mAqPAafX7PpW5EwVtxsEu7Q@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 00/13] Unify asm/unaligned.h around struct
 helper
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 Jakub Kicinski <kuba@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonas Bonn <jonas@southpole.se>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Ganapathi Bhat <ganapathi017@gmail.com>,
 linux-block <linux-block@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-ntfs-dev@lists.sourceforge.net,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgOToyOSBBTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNT
IGlzIHVzZWQgaW4gbWFueSBwbGFjZXMgdG8KPiBjb25kaXRpb25hbGx5IGVtaXQgY29kZSB0aGF0
IHZpb2xhdGVzIEMgYWxpZ25tZW50IHJ1bGVzLiBFLmcuLCB0aGVyZQo+IGlzIHRoaXMgZXhhbXBs
ZSBpbiBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3VuYWxpZ25lZC1tZW1vcnktYWNjZXNzLnJzdDoK
Pgo+IGJvb2wgZXRoZXJfYWRkcl9lcXVhbChjb25zdCB1OCAqYWRkcjEsIGNvbnN0IHU4ICphZGRy
MikKPiB7Cj4gI2lmZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4g
ICB1MzIgZm9sZCA9ICgoKihjb25zdCB1MzIgKilhZGRyMSkgXiAoKihjb25zdCB1MzIgKilhZGRy
MikpIHwKPiAgICAgICAgICAgICAgKCgqKGNvbnN0IHUxNiAqKShhZGRyMSArIDQpKSBeICgqKGNv
bnN0IHUxNiAqKShhZGRyMiArIDQpKSk7Cj4gICByZXR1cm4gZm9sZCA9PSAwOwo+ICNlbHNlCgpJ
dCBwcm9iYWJseSB3b3JrcyBmaW5lIGluIHByYWN0aWNlIC0gdGhlIG9uZSBjYXNlIHdlIGhhZCB3
YXMgcmVhbGx5CnByZXR0eSBzcGVjaWFsLCBhbmQgYWJvdXQgdGhlIHZlY3Rvcml6ZXIgZG9pbmcg
b2RkIHRoaW5ncy4KCkJ1dCBJIHRoaW5rIHdlIHNob3VsZCBzdHJpdmUgdG8gY29udmVydCB0aGVz
ZSB0byB1c2UKImdldF91bmFsaWduZWQoKSIsIHNpbmNlIGNvZGUgZ2VuZXJhdGlvbiBpcyBmaW5l
LiBJdCBzdGlsbCBvZnRlbiBtYWtlcwpzZW5zZSB0byBoYXZlIHRoYXQgdGVzdCBmb3IgdGhlIGNv
bmZpZyB2YXJpYWJsZSwgc2ltcGx5IGJlY2F1c2UgdGhlCmFwcHJvYWNoIG1pZ2h0IGJlIGRpZmZl
cmVudCBpZiB3ZSBrbm93IHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdy4KClNvIEknbGwgaGFw
cGlseSB0YWtlIHBhdGNoZXMgdGhhdCBkbyBvYnZpb3VzIGNvbnZlcnNpb25zIHRvCmdldF91bmFs
aWduZWQoKSB3aGVyZSB0aGV5IG1ha2Ugc2Vuc2UsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIHNob3Vs
ZApjb25zaWRlciB0aGlzIHNvbWUgaHVnZSBoYXJkIHJlcXVpcmVtZW50LgoKICAgICAgICAgICAg
ICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
