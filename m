Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D7B18477DF0
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 21:54:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 898AF20CF1;
	Thu, 16 Dec 2021 21:54:58 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 1106724257
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 18:30:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7EDE5B82551
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 17:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED171C36AEB
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639675804;
 bh=sZED9o+V6DY8SMm+Vs6+SPM0L4+1UTJmGboG9qTGk/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=stRLUHqwLyT07u5d2VSxOhxZBV3bsBtZalCpfSphVcISqhzj6n+2QZ2jO7F9RKpzz
 K52ThKpirPpVakER15ZLZWx9H8cAT8Fvb6GDbFkkE5CYqIreQaW/o/otUT4+ECptvp
 oOJbZhWqcBCU51ySqa+peum2d0uxf21jEJ4f8tKM/XQri/FGW4TEhJrUxBbeK606Ba
 9x6OFMr74IiB5DpjwbVUTW5X0EpVi3zXX577GVnP3PFPqzGc+ozn/OgN8HxY3ikkG+
 0B149Sr/kicek4p+oC1uGGtGxYtz3JnV9khCPHfeF8ezURRS2sSoBaVxom+8LX8PBr
 DzbRBQxhfKAFw==
Received: by mail-wm1-f54.google.com with SMTP id z206so5160433wmc.1
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 09:30:03 -0800 (PST)
X-Gm-Message-State: AOAM531WrhHlWLKpIRCLuPYtPLGXfwXVhEDpzYutyIE6JxCZG3HNYAGo
 dqS0VEuzBd9XTSU8cHDDLFIO/KUnfrsi1cNSJW0=
X-Google-Smtp-Source: ABdhPJzp0SU8actyldrvzX1x50riwocCH+uUo3Sc9tTPSiAj2RkG6W8raN6crfSV4FfRoxzwjsmq9fCJPMFefPzOiEI=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr5945559wmq.32.1639675791707; 
 Thu, 16 Dec 2021 09:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
In-Reply-To: <20210514100106.3404011-1-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 16 Dec 2021 18:29:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
Message-ID: <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 johannes@sipsolutions.net, 
 Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Approved-At: Thu, 16 Dec 2021 21:54:57 +0100
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
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
 Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-block@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-security-module@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCihyZXBseWluZyB0byBhbiBvbGQgdGhyZWFkIGFzIHRoaXMgY2FtZSB1cCBpbiB0
aGUgZGlzY3Vzc2lvbiByZWdhcmRpbmcKbWlzYWxpZ25lZCBsb2FkcyBhbmQgc3RvcmVkIGluIHNp
cGhhc2goKSB3aGVuIGNvbXBpbGVkIGZvciBBUk0KW2Y3ZTViOWJmYTZjODgyMDQwN2I2NGVhYmMx
ZjI5YzlhODdlODk5M2RdKQoKT24gRnJpLCAxNCBNYXkgMjAyMSBhdCAxMjowMiwgQXJuZCBCZXJn
bWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cj4KPiBUaGUgZ2V0X3VuYWxpZ25lZCgpL3B1dF91bmFsaWduZWQoKSBoZWxw
ZXJzIGFyZSB0cmFkaXRpb25hbGx5IGFyY2hpdGVjdHVyZQo+IHNwZWNpZmljLCB3aXRoIHRoZSB0
d28gbWFpbiB2YXJpYW50cyBiZWluZyB0aGUgImFjY2Vzcy1vay5oIiB2ZXJzaW9uCj4gdGhhdCBh
c3N1bWVzIHVuYWxpZ25lZCBwb2ludGVyIGFjY2Vzc2VzIGFsd2F5cyB3b3JrIG9uIGEgcGFydGlj
dWxhcgo+IGFyY2hpdGVjdHVyZSwgYW5kIHRoZSAibGUtc3RydWN0LmgiIHZlcnNpb24gdGhhdCBj
YXN0cyB0aGUgZGF0YSB0byBhCj4gYnl0ZSBhbGlnbmVkIHR5cGUgYmVmb3JlIGRlcmVmZXJlbmNp
bmcsIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgY2Fubm90Cj4gYWx3YXlzIGRvIHVuYWxpZ25lZCBh
Y2Nlc3NlcyBpbiBoYXJkd2FyZS4KPgo+IEJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIGxpbmtlZCBi
ZWxvdywgaXQgYXBwZWFycyB0aGF0IHRoZSBhY2Nlc3Mtb2sKPiB2ZXJzaW9uIGlzIG5vdCByZWFs
aWFibGUgb24gYW55IGFyY2hpdGVjdHVyZSwgYnV0IHRoZSBzdHJ1Y3QgdmVyc2lvbgo+IHByb2Jh
Ymx5IGhhcyBubyBkb3duc2lkZXMuIFRoaXMgc2VyaWVzIGNoYW5nZXMgdGhlIGNvZGUgdG8gdXNl
IHRoZQo+IHNhbWUgaW1wbGVtZW50YXRpb24gb24gYWxsIGFyY2hpdGVjdHVyZXMsIGFkZHJlc3Np
bmcgdGhlIGZldyBleGNlcHRpb25zCj4gc2VwYXJhdGVseS4KPgo+IEkndmUgaW5jbHVkZWQgdGhp
cyB2ZXJzaW9uIGluIHRoZSBhc20tZ2VuZXJpYyB0cmVlIGZvciA1LjE0IGFscmVhZHksCj4gYWRk
cmVzc2luZyB0aGUgZmV3IGlzc3VlcyB0aGF0IHdlcmUgcG9pbnRlZCBvdXQgaW4gdGhlIFJGQy4g
SWYgdGhlcmUKPiBhcmUgYW55IHJlbWFpbmluZyBwcm9ibGVtcywgSSBob3BlIHRob3NlIGNhbiBi
ZSBhZGRyZXNzZWQgYXMgZm9sbG93LXVwCj4gcGF0Y2hlcy4KPgoKSSB0aGluayB0aGlzIHNlcmll
cyBpcyBhIGh1Z2UgaW1wcm92ZW1lbnQsIGJ1dCBpdCBkb2VzIG5vdCBzb2x2ZSB0aGUKVUIgcHJv
YmxlbSBjb21wbGV0ZWx5LiBBcyB3ZSBmb3VuZCwgdGhlcmUgYXJlIG9wZW4gaXNzdWVzIGluIHRo
ZSBHQ0MKYnVnemlsbGEgcmVnYXJkaW5nIGFzc3VtcHRpb25zIGluIHRoZSBjb21waWxlciB0aGF0
IGFsaWduZWQgcXVhbnRpdGllcwplaXRoZXIgb3ZlcmxhcCBlbnRpcmVseSBvciBub3QgYXQgYWxs
LiAoZS5nLiwKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTAw
MzYzKQoKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgaXMgdXNlZCBpbiBt
YW55IHBsYWNlcyB0bwpjb25kaXRpb25hbGx5IGVtaXQgY29kZSB0aGF0IHZpb2xhdGVzIEMgYWxp
Z25tZW50IHJ1bGVzLiBFLmcuLCB0aGVyZQppcyB0aGlzIGV4YW1wbGUgaW4gRG9jdW1lbnRhdGlv
bi9jb3JlLWFwaS91bmFsaWduZWQtbWVtb3J5LWFjY2Vzcy5yc3Q6Cgpib29sIGV0aGVyX2FkZHJf
ZXF1YWwoY29uc3QgdTggKmFkZHIxLCBjb25zdCB1OCAqYWRkcjIpCnsKI2lmZGVmIENPTkZJR19I
QVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCiAgdTMyIGZvbGQgPSAoKCooY29uc3QgdTMy
ICopYWRkcjEpIF4gKCooY29uc3QgdTMyICopYWRkcjIpKSB8CiAgICAgICAgICAgICAoKCooY29u
c3QgdTE2ICopKGFkZHIxICsgNCkpIF4gKCooY29uc3QgdTE2ICopKGFkZHIyICsgNCkpKTsKICBy
ZXR1cm4gZm9sZCA9PSAwOwojZWxzZQouLi4KCih3aGljaCBub3cgZGV2aWF0ZXMgZnJvbSBpdHMg
YWN0dWFsIGltcGxlbWVudGF0aW9uLCBidXQgdGhlIHBvaW50IGlzCnRoZSBzYW1lKSB3aGVyZSBD
T05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBpcyB1c2VkIGluIHRoZQp3cm9u
ZyB3YXkgKElNSE8pLgoKVGhlIHBhdHRlcm4gc2VlbXMgdG8gYmUKCiNpZmRlZiBDT05GSUdfSEFW
RV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwogIC8vIGlnbm9yZSBhbGlnbm1lbnQgcnVsZXMs
IGp1c3QgY2FzdCB0byBhIG1vcmUgYWxpZ25lZCBwb2ludGVyIHR5cGUKI2Vsc2UKICAvLyB1c2Ug
dW5hbGlnbmVkIGFjY2Vzc29ycywgd2hpY2ggY291bGQgYmUgZWl0aGVyIGNoZWFwIG9yIGV4cGVu
c2l2ZSwKICAvLyBkZXBlbmRpbmcgb24gdGhlIGFyY2hpdGVjdHVyZQojZW5kaWYKCndoZXJlYXMg
dGhlIGZvbGxvd2luZyBwYXR0ZXJuIG1ha2VzIG1vcmUgc2Vuc2UsIEkgdGhpbmssIGFuZCBkb2Vz
IG5vdAp2aW9sYXRlIGFueSBDIHJ1bGVzIGluIHRoZSBjb21tb24gY2FzZToKCiNpZmRlZiBDT05G
SUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwogIC8vIHVzZSB1bmFsaWduZWQgYWNj
ZXNzb3JzLCB3aGljaCBhcmUgY2hlYXAgb3IgZXZlbiBlbnRpcmVseSBmcmVlCiNlbHNlCiAgLy8g
YXZvaWQgdW5hbGlnbmVkIGFjY2Vzc29ycywgYXMgdGhleSBhcmUgZXhwZW5zaXZlOyBpbnN0ZWFk
LCByZW9yZ2FuaXplCiAgLy8gdGhlIGRhdGEgc28gd2UgZG9uJ3QgbmVlZCB0aGVtIChzaW1pbGFy
IHRvIHNldHRpbmcgTkVUX0lQX0FMSUdOIHRvIDIpCiNlbmRpZgoKVGhlIG9ubHkgcmVtYWluaW5n
IHByb2JsZW0gaGVyZSBpcyByZWludGVycHJldGluZyBhIGNoYXIqIHBvaW50ZXIgdG8gYQp1MzIq
LCBlLmcuLCBmb3IgYWNjZXNzaW5nIHRoZSBJUCBhZGRyZXNzIGluIGFuIEV0aGVybmV0IGZyYW1l
IHdoZW4KTkVUX0lQX0FMSUdOID09IDIsIHdoaWNoIGNvdWxkIHN1ZmZlciBmcm9tIHRoZSBzYW1l
IFVCIHByb2JsZW0gYWdhaW4sCmFzIEkgdW5kZXJzdGFuZCBpdC4KCkluIHRoZSAzMi1iaXQgQVJN
IGNhc2UgKHY2KykgW3doaWNoIGlzIGFkbWl0dGVkbHkgYW4gb3V0bGllcl0gdGhpcwptYWtlcyBh
IHN1YnN0YW50aWFsIGRpZmZlcmVuY2UsIGFzIEFSTXY2IGRvZXMgaGF2ZSBlZmZpY2llbnQgdW5h
bGlnbmVkCmFjY2Vzc29ycyAobG9hZC9zdG9yZSB3b3JkIG9yIGhhbGZ3b3JkIG1heSBiZSB1c2Vk
IG9uIG1pc2FsaWduZWQKYWRkcmVzc2VzKSBidXQgcmVxdWlyZXMgdGhhdCBsb2FkL3N0b3JlIGRv
dWJsZS13b3JkIGFuZCBsb2FkL3N0b3JlCm11bHRpcGxlIGFyZSBvbmx5IHVzZWQgb24gMzItYml0
IGFsaWduZWQgYWRkcmVzc2VzLiBHQ0MgZG9lcyB0aGUgcmlnaHQKdGhpbmcgd2l0aCB0aGUgdW5h
bGlnbmVkIGFjY2Vzc29ycywgYnV0IGJsaW5kbHkgY2FzdGluZyBhd2F5Cm1pc2FsaWdubWVudCBt
YXkgcmVzdWx0IGluIGFsaWdubWVudCB0cmFwcyBpZiB0aGUgY29tcGlsZXIgaGFwcGVuZWQgdG8K
ZW1pdCBsb2FkLWRvdWJsZSBvciBsb2FkLW11bHRpcGxlIGluc3RydWN0aW9ucyBmb3IgdGhlIG1l
bW9yeSBhY2Nlc3MKaW4gcXVlc3Rpb24uCgpKYXNvbiBhbHJlYWR5IHZlcmlmZWQgdGhhdCBpbiB0
aGUgc2lwaGFzaCgpIGNhc2UsIHRoZSBhbGlnbmVkIGFuZAp1bmFsaWduZWQgdmVyc2lvbnMgb2Yg
dGhlIGNvZGUgYWN0dWFsbHkgY29tcGlsZSB0byB0aGUgc2FtZSBtYWNoaW5lCmNvZGUgb24geDg2
LCBhcyB0aGUgdW5hbGlnbmVkIGFjY2Vzc29ycyBqdXN0IGRpc2FwcGVhci4gSSBzdXNwZWN0IHRo
aXMKdG8gYmUgdGhlIGNhc2UgZm9yIG1hbnkgaW5zdGFuY2VzIHdoZXJlCkNPTkZJR19IQVZFX0VG
RklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlzIGJlaW5nIHVzZWQsIG1vc3RseSBpbiB0aGUKbmV0
d29ya2luZyBzdGFjay4KClNvIEkgaW50ZW5kIHRvIGRpZyBhIGJpdCBkZWVwZXIgaW50byB0aGlz
LCBhbmQgcGVyaGFwcyBwcm9wb3NlIHNvbWUKY2hhbmdlcyB3aGVyZSB0aGUgaW50ZXJwcmV0YXRp
b24gb2YKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgaXMgZG9jdW1lbnRl
ZCBtb3JlIGNsZWFybHksIGFuZAp0d2Vha2VkIGFjY29yZGluZyB0byBteSBzdWdnZXN0aW9uIGFi
b3ZlICh3aGlsZSBlbnN1cmluZyB0aGF0IGNvZGVnZW4KZG9lcyBub3Qgc3VmZmVyLCBvZiBjb3Vy
c2UpCgpUaG91Z2h0cywgY29uY2VybnMsIG9iamVjdGlvbnM/CgoKLS0KQXJkLgoKCgoKPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzc1ZDA3NjkxLTFlNGYtNzQxZi05ODUyLTM4
YzBiNGY1MjBiY0BzeW5vcHN5cy5jb20vCj4gTGluazogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6
aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTAwMzYzCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDIxMDUwNzIyMDgxMy4zNjUzODItMTQtYXJuZEBrZXJuZWwub3JnLwo+IExpbms6
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hcm5kL2FzbS1n
ZW5lcmljLmdpdCB1bmFsaWduZWQtcmV3b3JrLXYyCj4KPgo+IEFybmQgQmVyZ21hbm4gKDEzKToK
PiAgIGFzbS1nZW5lcmljOiB1c2UgYXNtLWdlbmVyaWMvdW5hbGlnbmVkLmggZm9yIG1vc3QgYXJj
aGl0ZWN0dXJlcwo+ICAgb3BlbnJpc2M6IGFsd2F5cyB1c2UgdW5hbGlnbmVkLXN0cnVjdCBoZWFk
ZXIKPiAgIHNoOiByZW1vdmUgdW5hbGlnbmVkIGFjY2VzcyBmb3Igc2g0YQo+ICAgbTY4azogc2Vs
ZWN0IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gICBwb3dlcnBjOiB1
c2UgbGludXgvdW5hbGlnbmVkL2xlX3N0cnVjdC5oIG9uIExFIHBvd2VyNwo+ICAgYXNtLWdlbmVy
aWM6IHVuYWxpZ25lZDogcmVtb3ZlIGJ5dGVzaGlmdCBoZWxwZXJzCj4gICBhc20tZ2VuZXJpYzog
dW5hbGlnbmVkIGFsd2F5cyB1c2Ugc3RydWN0IGhlbHBlcnMKPiAgIHBhcnRpdGlvbnM6IG1zZG9z
OiBmaXggb25lLWJ5dGUgZ2V0X3VuYWxpZ25lZCgpCj4gICBhcHBhcm1vcjogdXNlIGdldF91bmFs
aWduZWQoKSBvbmx5IGZvciBtdWx0aS1ieXRlIHdvcmRzCj4gICBtd2lmaWV4OiByZS1maXggZm9y
IHVuYWxpZ25lZCBhY2Nlc3Nlcwo+ICAgbmV0cG9sbDogYXZvaWQgcHV0X3VuYWxpZ25lZCgpIG9u
IHNpbmdsZSBjaGFyYWN0ZXIKPiAgIGFzbS1nZW5lcmljOiB1YWNjZXNzOiAxLWJ5dGUgYWNjZXNz
IGlzIGFsd2F5cyBhbGlnbmVkCj4gICBhc20tZ2VuZXJpYzogc2ltcGxpZnkgYXNtL3VuYWxpZ25l
ZC5oCj4KPiAgYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS91bmFsaWduZWQuaCAgICAgICAgICB8ICAx
MiAtLQo+ICBhcmNoL2FybS9pbmNsdWRlL2FzbS91bmFsaWduZWQuaCAgICAgICAgICAgIHwgIDI3
IC0tLQo+ICBhcmNoL2lhNjQvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAgICAgICAgIHwgIDEy
IC0tCj4gIGFyY2gvbTY4ay9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEg
Kwo+ICBhcmNoL202OGsvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAgICAgICAgIHwgIDI2IC0t
LQo+ICBhcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAgIHwgIDI3IC0t
LQo+ICBhcmNoL21pcHMvY3J5cHRvL2NyYzMyLW1pcHMuYyAgICAgICAgICAgICAgIHwgICAyICst
Cj4gIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAgICAgfCAgNDcgLS0t
LS0KPiAgYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAgICAgICB8ICAgNiAr
LQo+ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAgICAgIHwgIDIyIC0t
LQo+ICBhcmNoL3NoL2luY2x1ZGUvYXNtL3VuYWxpZ25lZC1zaDRhLmggICAgICAgIHwgMTk5IC0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvc2gvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmggICAg
ICAgICAgICAgfCAgMTMgLS0KPiAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS91bmFsaWduZWQuaCAg
ICAgICAgICB8ICAxMSAtLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS91bmFsaWduZWQuaCAgICAg
ICAgICAgIHwgIDE1IC0tCj4gIGFyY2gveHRlbnNhL2luY2x1ZGUvYXNtL3VuYWxpZ25lZC5oICAg
ICAgICAgfCAgMjkgLS0tCj4gIGJsb2NrL3BhcnRpdGlvbnMvbGRtLmggICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KPiAgYmxvY2svcGFydGl0aW9ucy9tc2Rvcy5jICAgICAgICAgICAgICAg
ICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9tYXJ2ZWxsL213aWZpZXgvcGNp
ZS5jIHwgIDEwICstCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvdWFjY2Vzcy5oICAgICAgICAgICAg
ICAgfCAgIDQgKy0KPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy91bmFsaWduZWQuaCAgICAgICAgICAg
ICB8IDE0MSArKysrKysrKysrKy0tLQo+ICBpbmNsdWRlL2xpbnV4L3VuYWxpZ25lZC9hY2Nlc3Nf
b2suaCAgICAgICAgIHwgIDY4IC0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC91bmFsaWduZWQvYmVf
Ynl0ZXNoaWZ0LmggICAgICB8ICA3MSAtLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvdW5hbGlnbmVk
L2JlX21lbW1vdmUuaCAgICAgICAgfCAgMzcgLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3VuYWxpZ25l
ZC9iZV9zdHJ1Y3QuaCAgICAgICAgIHwgIDM3IC0tLS0KPiAgaW5jbHVkZS9saW51eC91bmFsaWdu
ZWQvZ2VuZXJpYy5oICAgICAgICAgICB8IDExNSAtLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4
L3VuYWxpZ25lZC9sZV9ieXRlc2hpZnQuaCAgICAgIHwgIDcxIC0tLS0tLS0KPiAgaW5jbHVkZS9s
aW51eC91bmFsaWduZWQvbGVfbWVtbW92ZS5oICAgICAgICB8ICAzNyAtLS0tCj4gIGluY2x1ZGUv
bGludXgvdW5hbGlnbmVkL2xlX3N0cnVjdC5oICAgICAgICAgfCAgMzcgLS0tLQo+ICBpbmNsdWRl
L2xpbnV4L3VuYWxpZ25lZC9tZW1tb3ZlLmggICAgICAgICAgIHwgIDQ2IC0tLS0tCj4gIG5ldC9j
b3JlL25ldHBvbGwuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgc2VjdXJp
dHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jICAgICAgICAgICB8ICAgMiArLQo+ICAzMSBmaWxl
cyBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgMTAwMiBkZWxldGlvbnMoLSkKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYWxwaGEvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmgKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2luY2x1ZGUvYXNtL3VuYWxpZ25lZC5oCj4gIGRlbGV0ZSBt
b2RlIDEwMDY0NCBhcmNoL2lhNjQvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmgKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvbTY4ay9pbmNsdWRlL2FzbS91bmFsaWduZWQuaAo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgYXJjaC9taWNyb2JsYXplL2luY2x1ZGUvYXNtL3VuYWxpZ25lZC5oCj4gIGRlbGV0
ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VuYWxpZ25lZC5oCj4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmgKPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvc2gvaW5jbHVkZS9hc20vdW5hbGlnbmVkLXNoNGEuaAo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9zaC9pbmNsdWRlL2FzbS91bmFsaWduZWQuaAo+ICBk
ZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS91bmFsaWduZWQuaAo+ICBk
ZWxldGUgbW9kZSAxMDA2NDQgYXJjaC94ODYvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmgKPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IGFyY2gveHRlbnNhL2luY2x1ZGUvYXNtL3VuYWxpZ25lZC5oCj4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3VuYWxpZ25lZC9hY2Nlc3Nfb2suaAo+ICBk
ZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQvYmVfYnl0ZXNoaWZ0LmgK
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdW5hbGlnbmVkL2JlX21lbW1vdmUu
aAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQvYmVfc3RydWN0
LmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdW5hbGlnbmVkL2dlbmVyaWMu
aAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQvbGVfYnl0ZXNo
aWZ0LmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdW5hbGlnbmVkL2xlX21l
bW1vdmUuaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQvbGVf
c3RydWN0LmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdW5hbGlnbmVkL21l
bW1vdmUuaAo+Cj4gLS0KPiAyLjI5LjIKPgo+IENjOiBBbWl0a3VtYXIgS2Fyd2FyIDxhbWl0a2Fy
d2FyQGdtYWlsLmNvbT4KPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiBDYzog
QmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgo+IENjOiBC
b3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiBDYzogRXJpYyBEdW1hemV0IDxlZHVtYXpl
dEBnb29nbGUuY29tPgo+IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNv
bT4KPiBDYzogR2FuYXBhdGhpIEJoYXQgPGdhbmFwYXRoaTAxN0BnbWFpbC5jb20+Cj4gQ2M6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gQ2M6ICJILiBQZXRlciBB
bnZpbiIgPGhwYUB6eXRvci5jb20+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29t
Pgo+IENjOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgo+IENjOiBKYW1lcyBNb3Jy
aXMgPGptb3JyaXNAbmFtZWkub3JnPgo+IENjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+
Cj4gQ2M6IEpvaG4gSm9oYW5zZW4gPGpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbT4KPiBDYzog
Sm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+IENjOiBLYWxsZSBWYWxvIDxrdmFsb0Bj
b2RlYXVyb3JhLm9yZz4KPiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1
Pgo+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiBDYzogUmljaCBGZWxr
ZXIgPGRhbGlhc0BsaWJjLm9yZz4KPiBDYzogIlJpY2hhcmQgUnVzc29uIChGbGF0Q2FwKSIgPGxk
bUBmbGF0Y2FwLm9yZz4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+
Cj4gQ2M6ICJTZXJnZSBFLiBIYWxseW4iIDxzZXJnZUBoYWxseW4uY29tPgo+IENjOiBTaGFydmFy
aSBIYXJpc2FuZ2FtIDxzaGFydmFyaS5oYXJpc2FuZ2FtQG54cC5jb20+Cj4gQ2M6IFN0YWZmb3Jk
IEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IENjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxzdGVm
YW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgo+IENjOiBWbGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBu
eHAuY29tPgo+IENjOiBYaW5taW5nIEh1IDxodXhpbm1pbmc4MjBAZ21haWwuY29tPgo+IENjOiBZ
b3NoaW5vcmkgU2F0byA8eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+Cj4gQ2M6IHg4NkBrZXJu
ZWwub3JnCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgt
bTY4ay5vcmcKPiBDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwo+IENjOiBvcGVucmlz
Y0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9y
Zwo+IENjOiBsaW51eC1zaEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogc3BhcmNsaW51eEB2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogbGludXgtbnRmcy1kZXZAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gQ2M6
IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC13aXJlbGVzc0B2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1hcmNoQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1zZWN1cml0eS1tb2R1bGVAdmdlci5rZXJuZWwub3Jn
Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
