Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3D23810EF
	for <lists+openrisc@lfdr.de>; Fri, 14 May 2021 21:33:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E72C821335;
	Fri, 14 May 2021 21:33:17 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 0025E21335
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 21:33:14 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 409A76145A
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621020793;
 bh=sx6RnRTXG/HkUYbZ66bme4Ihr6YCIRDKjve7uvyFxHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YWd0pM7Qd2nlsjaPkIRTJ5udrslEU7xXsi06oSIcsLnD1V5WI8/TfAXneH0KcFY8T
 nBogmfBN+h/aFpslo+cnHvQ8Rwy08zH6Al87wLwvEeafd8WdEh0bV2oU8Cs9HWFjrK
 +IFBO7yhwQcamBDl971iDFD98TuuMvZkClT3fAc1DSUUu1vK944smhZ5eh7CfPcWBO
 Rp0VR0a5L/yQ7yiyoruUe+GAynieMsFb0kVsGIexodXAUvw1AZ088wq671w1OAOunx
 B58Vfuz8+MbbnSDHy1vpfgrsnEOb+y4bbkL2rk3FazqvsV6EVs434a0RQz0uHRaA/x
 mhTO/Nwft9bdw==
Received: by mail-wr1-f51.google.com with SMTP id h4so275696wrt.12
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 12:33:13 -0700 (PDT)
X-Gm-Message-State: AOAM531iTcIX5szNfwRAlMSTovwy5m1Tflfv3o4k3ZjCAyDk33ZqI9ao
 9LFZLcS38XrMR9f5wEpG0Ic3/A1m2oUo5QMdTO4=
X-Google-Smtp-Source: ABdhPJwCQ1F0CBUPxIsNYOfoW01L5a5C+nTIh8ZsdXu8MlaXBtReQ+mP8NigDxBA9czvxj+u/ONPbc8umn+Z9hfl/zY=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr62128225wrz.105.1621020781452; 
 Fri, 14 May 2021 12:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
In-Reply-To: <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 14 May 2021 21:31:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2q8zEy+eQ1RJHT7UbD9E+KofKNjKxMHJ6hreHN0J_mEQ@mail.gmail.com>
Message-ID: <CAK8P3a2q8zEy+eQ1RJHT7UbD9E+KofKNjKxMHJ6hreHN0J_mEQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 Jonas Bonn <jonas@southpole.se>, Ganapathi Bhat <ganapathi017@gmail.com>,
 linux-block <linux-block@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Kalle Valo <kvalo@codeaurora.org>, Jens Axboe <axboe@kernel.dk>,
 John Johansen <john.johansen@canonical.com>,
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

T24gRnJpLCBNYXkgMTQsIDIwMjEgYXQgNzozMiBQTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMTQsIDIwMjEgYXQg
MzowMiBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEkn
dmUgaW5jbHVkZWQgdGhpcyB2ZXJzaW9uIGluIHRoZSBhc20tZ2VuZXJpYyB0cmVlIGZvciA1LjE0
IGFscmVhZHksCj4gPiBhZGRyZXNzaW5nIHRoZSBmZXcgaXNzdWVzIHRoYXQgd2VyZSBwb2ludGVk
IG91dCBpbiB0aGUgUkZDLiBJZiB0aGVyZQo+ID4gYXJlIGFueSByZW1haW5pbmcgcHJvYmxlbXMs
IEkgaG9wZSB0aG9zZSBjYW4gYmUgYWRkcmVzc2VkIGFzIGZvbGxvdy11cAo+ID4gcGF0Y2hlcy4K
Pgo+IFRoaXMgY29udGludWVzIHRvIGxvb2sgZ3JlYXQgdG8gbWUsIGFuZCBub3cgaGFzIHRoZSBl
dmVuIHNpbXBsZXIKPiByZW1haW5pbmcgaW1wbGVtZW50YXRpb24uCj4KPiBJJ2QgYmUgdGVtcHRl
ZCB0byBqdXN0IHB1bGwgaXQgaW4gZm9yIDUuMTMsIGJ1dCBJIGd1ZXNzIHdlIGRvbid0Cj4gYWN0
dWFsbHkgaGF2ZSBhbnkgX291dHN0YW5kaW5nXyBidWcgaW4gdGhpcyBhcmVhICh0aGUgYnVnIHdh
cyBpbiBvdXIKPiB6bGliIGNvZGUsIHJlcXVpcmVkIC1PMyB0byB0cmlnZ2VyLCBoYXMgYmVlbiBm
aXhlZCBub3csIGFuZCB0aGUgYmlnZ3kKPiBjYXNlIGRpZG4ndCBldmVuIHVzZSAiZ2V0X3VuYWxp
Z25lZCgpIikuCj4KPiBTbyBJIGd1ZXNzIHlvdXIgNS4xNCB0aW1pbmcgaXMgdGhlIHJpZ2h0IHRo
aW5nIHRvIGRvLgoKWWVzLCBJIHRoaW5rIHRoYXQncyBiZXN0LCBqdXN0IGluIGNhc2Ugc29tZXRo
aW5nIGRvZXMgY29tZSB1cC4gV2hpbGUgYWxsIHRoZQpvYmplY3QgY29kZSBJIGxvb2tlZCBhdCBk
b2VzIGFwcGVhciBiZXR0ZXIsIHRoaXMgaXMgb25lIG9mIHRob3NlIGFyZWFzIHRoYXQKY2FuIGJl
IGhhcmQgdG8gcGlucG9pbnQgaWYgd2UgaGl0IGEgcmVncmVzc2lvbiBpbiBhIHBhcnRpY3VsYXIg
Y29tYmluYXRpb24gb2YKYXJjaGl0ZWN0dXJlK2NvbXBpbGVyK3NvdXJjZSBmaWxlLgoKSSBoYXZl
IHB1c2hlZCBhIHNpZ25lZCB0YWcgdG8KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvYXJuZC9hc20tZ2VuZXJpYy5naXQKYXNtLWdlbmVyaWMtdW5hbGlnbmVk
LTUuMTQKCmFuZCBwbGFuIHRvIHNlbmQgdGhhdCBpbiB0aGUgNS4xNCBtZXJnZSB3aW5kb3cgdW5s
ZXNzIHlvdSBkZWNpZGUgdG8KdGFrZSBpdCBub3cgYWZ0ZXIgYWxsLgoKICAgICAgICBBcm5kCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
