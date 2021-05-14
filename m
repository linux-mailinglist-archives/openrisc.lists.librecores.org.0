Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BD207380F03
	for <lists+openrisc@lfdr.de>; Fri, 14 May 2021 19:33:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5C138213D5;
	Fri, 14 May 2021 19:33:09 +0200 (CEST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mail.librecores.org (Postfix) with ESMTPS id CFD3B20DB6
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 19:33:06 +0200 (CEST)
Received: by mail-lf1-f50.google.com with SMTP id h10so3562379lfm.7
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 10:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3bmbAftPboaY7hu+DnMgt2b6hH50EmPqKJHrC7bAGn8=;
 b=OCUpNcjguSpqlmqGqLclnsNCOhgzU3pBtJ+0aWvCc2SR59QNIHWTyn2iHNnFIXoHb/
 IlrJnYgxa3QKa7TD5DPjuhh0hv9dsnnG2SJC44eepw5A/YU6NsZQR/5smJrlWciM7Uz7
 oY/UTgSqeb9/fYqELWpyA+6END7cpdJzA1bkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3bmbAftPboaY7hu+DnMgt2b6hH50EmPqKJHrC7bAGn8=;
 b=gkjlcDvDqxbALwdgj8t9W19zXIyZNrim3Rr8KwViiYzMSYBNeRLy9FR6BtXIcAXObk
 tF6TrFXuVWQCcRVwJJQOoVUGhIkKA9r/nwgfk44H49KON8rVFLU2aGGJfY7lbsvxYhsD
 p7HfM48AyDe8NE6P8y9eC6cwfSx8z2Er6JEpc+jMfnyyM4138biHFk2eXbAKnc0U/UL8
 r5JezE/xPQ7vQnduP0W6I39e2EXZu6VWJbovHxIBrj35yomoGtlIBtwfRPduILwT98Tu
 lw6fo7mFfe8HxTryA5tsogxqQ2mXSsRh2Z0EaI75ue8ygGIsH1dpYnKGvjuvQbOD1bVT
 6rTQ==
X-Gm-Message-State: AOAM532t5POYFuUSnUW8g9OJAHo22xWfK75Lt6rG1e40NzVV7goI6oW7
 E/P0aP2rc1wGtn9TaNe8VJQftRYFfmRmdtNU+OY=
X-Google-Smtp-Source: ABdhPJy8YO07a9crF+fbDAV5MDfjf41ACoGOsHqnLG1AZAtn4yMcCpK1mQquLEQ4x5UWVYa2WK8MOQ==
X-Received: by 2002:a05:6512:3d20:: with SMTP id
 d32mr32374204lfv.648.1621013585699; 
 Fri, 14 May 2021 10:33:05 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id n13sm721372lfi.14.2021.05.14.10.33.04
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:33:04 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id i9so37559786lfe.13
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 10:33:04 -0700 (PDT)
X-Received: by 2002:a2e:9251:: with SMTP id v17mr38807472ljg.507.1621013573543; 
 Fri, 14 May 2021 10:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
In-Reply-To: <20210514100106.3404011-1-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 10:32:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
Message-ID: <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-sparc <sparclinux@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, James Morris <jmorris@namei.org>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jakub Kicinski <kuba@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 linux-block <linux-block@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-ntfs-dev@lists.sourceforge.net,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXkgMTQsIDIwMjEgYXQgMzowMiBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gSSd2ZSBpbmNsdWRlZCB0aGlzIHZlcnNpb24gaW4gdGhlIGFzbS1n
ZW5lcmljIHRyZWUgZm9yIDUuMTQgYWxyZWFkeSwKPiBhZGRyZXNzaW5nIHRoZSBmZXcgaXNzdWVz
IHRoYXQgd2VyZSBwb2ludGVkIG91dCBpbiB0aGUgUkZDLiBJZiB0aGVyZQo+IGFyZSBhbnkgcmVt
YWluaW5nIHByb2JsZW1zLCBJIGhvcGUgdGhvc2UgY2FuIGJlIGFkZHJlc3NlZCBhcyBmb2xsb3ct
dXAKPiBwYXRjaGVzLgoKVGhpcyBjb250aW51ZXMgdG8gbG9vayBncmVhdCB0byBtZSwgYW5kIG5v
dyBoYXMgdGhlIGV2ZW4gc2ltcGxlcgpyZW1haW5pbmcgaW1wbGVtZW50YXRpb24uCgpJJ2QgYmUg
dGVtcHRlZCB0byBqdXN0IHB1bGwgaXQgaW4gZm9yIDUuMTMsIGJ1dCBJIGd1ZXNzIHdlIGRvbid0
CmFjdHVhbGx5IGhhdmUgYW55IF9vdXRzdGFuZGluZ18gYnVnIGluIHRoaXMgYXJlYSAodGhlIGJ1
ZyB3YXMgaW4gb3VyCnpsaWIgY29kZSwgcmVxdWlyZWQgLU8zIHRvIHRyaWdnZXIsIGhhcyBiZWVu
IGZpeGVkIG5vdywgYW5kIHRoZSBiaWdneQpjYXNlIGRpZG4ndCBldmVuIHVzZSAiZ2V0X3VuYWxp
Z25lZCgpIikuCgpTbyBJIGd1ZXNzIHlvdXIgNS4xNCB0aW1pbmcgaXMgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvLgoKICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
