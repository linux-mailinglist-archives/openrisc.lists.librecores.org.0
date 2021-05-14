Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A781E3810BB
	for <lists+openrisc@lfdr.de>; Fri, 14 May 2021 21:28:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4A1CD213D8;
	Fri, 14 May 2021 21:28:13 +0200 (CEST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mail.librecores.org (Postfix) with ESMTPS id 5ED6921160
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 21:28:11 +0200 (CEST)
Received: by mail-lf1-f48.google.com with SMTP id h4so12048lfv.0
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l72hh61/tsn5KiliU7+ZN3a6OPF8Vv4B7h1Pke4bt3c=;
 b=aWXI51EnV/k9pge5GKaDOkkJQD5K/MYP7A5XMnLlSW2Sy2l/sTiI3B9cP8d8ZTB5m2
 R3v2CKeD8i8Tb7rfnKNvLFWu6ekM3Dp1YyH8ufyfZgWCClPGJSZE/oeAn63KZeLaEQ45
 fGizC1SmBVw+3SgkMIXS5j/6qsc7gTws56N4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l72hh61/tsn5KiliU7+ZN3a6OPF8Vv4B7h1Pke4bt3c=;
 b=aidFrQKrJo9+6ApXLwLyNvr9zy9L2wsPC49o5XqII6hZO6pIiagjjjAF5N1QMu6WL1
 S/B3rNGhpR9mykgyCivdLe8WPYAL0HEKXYVbRw/IcJ/XwoAIeZT2Id9IF6R5zIq3c+kb
 Ghd/ILb+2PjDdzMYZyC/i9IUTtVSng7Twxjr1gIgdtPLT8OwUf6w7ngwh/rM7YOb+lSe
 0C1vYlvE4xuXtpK54iecCFp+wayvZ4NeBIsR07EpwctGWqf0P5dm7yJr/0gj3WOE1/nZ
 5vpvU868LqPhTpM3BFgeJYFlyolP261+4lguFvXZDBIy4Zmmw9r4Fh0ESLC0kd3BHGi8
 nDTA==
X-Gm-Message-State: AOAM530Kr+vWd6bSrj3Zk1NEEmSGeSOueeQtSHhlvfM4pokJVHKcLYlB
 IiDPauPGYIlAiflUGJ/tRd6+sHKZVP7SopRiqHo=
X-Google-Smtp-Source: ABdhPJwsd/wpNDz8bnNNIZJkFm3EnjPh7Q4JWD0JCpD7/xav6NSp2RG9Y11tpH2iW3MgKTx8hMc1BQ==
X-Received: by 2002:a05:6512:3251:: with SMTP id
 c17mr34197565lfr.431.1621020490530; 
 Fri, 14 May 2021 12:28:10 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id u22sm1370027lja.5.2021.05.14.12.28.10
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 12:28:10 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id p20so15135808ljj.8
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 12:28:10 -0700 (PDT)
X-Received: by 2002:a05:651c:33a:: with SMTP id
 b26mr40099556ljp.220.1621020178319; 
 Fri, 14 May 2021 12:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
 <2408c893-4ae7-4f53-f58c-497c91f5b034@synopsys.com>
In-Reply-To: <2408c893-4ae7-4f53-f58c-497c91f5b034@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 12:22:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wih8UHDwJ8x6m-p0PQ7o4S4gOBwGNs=w=q10GNY7A-70w@mail.gmail.com>
Message-ID: <CAHk-=wih8UHDwJ8x6m-p0PQ7o4S4gOBwGNs=w=q10GNY7A-70w@mail.gmail.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
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
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXkgMTQsIDIwMjEgYXQgMTE6NTIgQU0gVmluZWV0IEd1cHRhCjxWaW5lZXQuR3Vw
dGExQHN5bm9wc3lzLmNvbT4gd3JvdGU6Cj4KPiBXYXNuJ3QgdGhlIG5ldyB6bGliIGNvZGUgc2xh
dGVkIGZvciA1LjE0LiBJIGRvbid0IHNlZSBpdCBpbiB5b3VyIG1hc3RlciB5ZXQKCllvdSdyZSBy
aWdodCwgSSBuZXZlciBhY3R1YWxseSBjb21taXR0ZWQgaXQsIHNpbmNlIGl0IHdhcyBzcGVjaWZp
YyB0bwpBUkMgYW5kIC1PMyBhbmQgSSB3YXNuJ3QgZW50aXJlbHkgaGFwcHkgd2l0aCB0aGUgYW1v
dW50IG9mIHRlc3RpbmcgaXQKZ290ICh3aXRoIEhlaWtvIHBvaW50aW5nIG91dCB0aGF0IHRoZSBz
MzkwIHN0dWZmIG5lZWRlZCBtb3JlIGZpeGVzIGZvcgp0aGUgY2hhbmdlKS4KClNvIGluIGZhY3Qg
aXQncyBub3QgZXZlbiBxdWV1ZWQgdXAgZm9yIDUuMTQgZHVlIHRvIHRoaXMgYWxsLCBJIGp1c3Qg
ZHJvcHBlZCBpdC4KCj4gPiAgIGFuZCB0aGUgYmlnZ3kKPiA+IGNhc2UgZGlkbid0IGV2ZW4gdXNl
ICJnZXRfdW5hbGlnbmVkKCkiKS4KPgo+IEluZGVlZCB0aGlzIHNlcmllcyBpcyBzb3J0IG9mIG9y
dGhvZ29uYWwgdG8gdGhhdCBidWcsIGJ1dCBJTU8gdGhhdCBidWcKPiBzdGlsbCBleGlzdHMgaW4g
NS4xMyBmb3IgLU8zIGJ1aWxkLCBncmFudGVkIHRoYXQgaXMgbm90IGVuYWJsZWQgZm9yICFBUkMu
CgpSaWdodCwgdGhlIHpsaWIgYnVnIGlzIHN0aWxsIHRoZXJlLgoKQnV0IEFybmQncyBzZXJpZXMg
d291bGRuJ3QgZXZlbiBmaXggaXQ6IHJpZ2h0IG5vdyBpbmZmYXN0IGhhcyBpdHMgb3duCi0gdWds
eSBhbmQgc2xvdyAtIHNwZWNpYWwgMi1ieXRlLW9ubHkgdmVyc2lvbiBvZiAiZ2V0X3VuYWxpZ25l
ZCgpIiwKY2FsbGVkICJnZXRfdW5hbGlnbmVkMTYoKSIuCgpBbmQgYmVjYXVzZSBpdCdzIHVnbHkg
YW5kIHNsb3csIGl0J3Mgbm90IGFjdHVhbGx5IHVzZWQgZm9yCkNPTkZJR19IQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTLgoKVmluZWV0IC0gbWF5YmUgdGhlIGZpeCBpcyB0byBub3QgdGFr
ZSBteSBwYXRjaCB0byB1cGRhdGUgdG8gYSBuZXdlcgp6bGliLCBidXQgdG8ganVzdCBmaXggaW5m
ZmFzdCB0byB1c2UgdGhlIHByb3BlciBnZXRfdW5hbGlnbmVkKCkuIFRoZW4KQXJuZCdzIHNlcmll
cyBfd291bGRfIGFjdHVhbGx5IGZpeCBhbGwgdGhpcy4uCgogICAgICAgICAgICAgIExpbnVzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
