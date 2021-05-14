Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA42D3811CB
	for <lists+openrisc@lfdr.de>; Fri, 14 May 2021 22:26:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 516DA213A5;
	Fri, 14 May 2021 22:26:02 +0200 (CEST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mail.librecores.org (Postfix) with ESMTPS id 37D4021335
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 22:26:01 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id t3so3558066edc.7
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zj/dlxgrTFi/afXdqvpoKnC0fO1FIFdLyxVrDXldBSs=;
 b=YFKY9Xahh+37BAr6aWqyWYu1Mb7APXH6ODm/OL23XmTx5cHPfE5nvsgH3V9cI44nS0
 EW6HUNU9PMYQx+djBq7ws8ietkyGay3lY9V3u/1Wuw/v3Pr2ScmDgx0fOcF6ZkLkBuPr
 cN3FjgtrPRUQDfA1h2PJ+U+sspjArlX7AElF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zj/dlxgrTFi/afXdqvpoKnC0fO1FIFdLyxVrDXldBSs=;
 b=C1zaGHOAyC+5eQk1BJOxNBrBKzHsLYxiWmppJOSmUwTX8bjyYLAWXr3eoPWojk6USq
 BjEqWoG3Wn7LatRasbO24sAJ6EYPL6gD+5HObcLmB/TJWKXBkY6wU3e25ufDKqGDxnFU
 mr5jXwx2LCob4neZhCdR8i1vUVAi8s0H/AJWvpQeriw3m5fbl1PMeQb2tFxmPJ/kThh5
 hEgkQTbmadglevyzokygv3CKz8ZJbgMvNX72N3ecAD1frX++Sqip5FJvj/qGZlHhZQ9b
 q0Ix3eFyc68+07PdBwxRRjTYIBcjMuQ+N1Vj1w9bTIDnwqmPvN4AeLC/Vt21XpMKQUK5
 Cogg==
X-Gm-Message-State: AOAM530B4qBJtVw+uSB7GZirGL+CiBP3urmpEQ94s6aiyYw7rtK6USj3
 tJ6oaYrLU4AtZBE1rZBTXO7qb4uz18YBxnhg8IQ=
X-Google-Smtp-Source: ABdhPJxdW0cBdYI2JcV/wMr1xJrJ8xc8/80GPDZ7MLg8QDjIcrHzEiXy2Y+YvTi7818yFL+Td7djEA==
X-Received: by 2002:aa7:d54c:: with SMTP id u12mr6127927edr.242.1621023960488; 
 Fri, 14 May 2021 13:26:00 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51])
 by smtp.gmail.com with ESMTPSA id ju17sm4231695ejc.72.2021.05.14.13.26.00
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 13:26:00 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id u21so408390ejo.13
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 13:26:00 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr32730248lfs.377.1621023609037; 
 Fri, 14 May 2021 13:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
 <2408c893-4ae7-4f53-f58c-497c91f5b034@synopsys.com>
 <CAHk-=wih8UHDwJ8x6m-p0PQ7o4S4gOBwGNs=w=q10GNY7A-70w@mail.gmail.com>
 <14016937-b9c3-c131-db18-f97081806c7f@synopsys.com>
In-Reply-To: <14016937-b9c3-c131-db18-f97081806c7f@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 13:19:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whdR4OLJjwaU_nJhmS4n6ruGK4XFuLxA7zEOoCV7U=QLA@mail.gmail.com>
Message-ID: <CAHk-=whdR4OLJjwaU_nJhmS4n6ruGK4XFuLxA7zEOoCV7U=QLA@mail.gmail.com>
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

T24gRnJpLCBNYXkgMTQsIDIwMjEgYXQgMTI6NDUgUE0gVmluZWV0IEd1cHRhCjxWaW5lZXQuR3Vw
dGExQHN5bm9wc3lzLmNvbT4gd3JvdGU6Cj4KPiBXZWxsLCBub3QgcmVhbGx5LCB0aGUgaXNzdWUg
bWFuaWZlc3RlZCBpbiBBUkMgTzMgdGVzdGluZywgYnV0IEkgc2hvd2VkCj4gdGhlIHByb2JsZW0g
ZXhpc3RlZCBmb3IgYXJtNjQgZ2NjIHRvby4KCi4uIGJ1dCBub3Qgd2l0aCBhIHN1cHBvcnRlZCBr
ZXJuZWwgY29uZmlndXJhdGlvbi4KCj4gPiBTbyBpbiBmYWN0IGl0J3Mgbm90IGV2ZW4gcXVldWVk
IHVwIGZvciA1LjE0IGR1ZSB0byB0aGlzIGFsbCwgSSBqdXN0IGRyb3BwZWQgaXQuCj4KPiBCdXQg
V2h5LgoKSSBqdXN0IGRpZG4ndCBoYXZlIHRpbWUgdG8gZGVhbCB3aXRoIGl0IGR1cmluZyB0aGUg
bWVyZ2Ugd2luZG93LiBJZgp5b3Uga2VlcCBpdCBhbGl2ZSwgdGhhdCdzIGFsbCBmaW5lIGFuZCBn
b29kLgoKICAgICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
