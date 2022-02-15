Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 517224B6558
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 09:10:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BD3DB24816;
	Tue, 15 Feb 2022 09:10:37 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 3E4A52431F
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:10:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1446C61653
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 08:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87978C36AE9
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644912634;
 bh=SSSBFam0X7wa1ZiCw7Mbgc9666G5ScJGR2eDM1GsaRo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s6dcbGoVHRQE6iFiA8bl6pr/uolIpd8JKbClO9mYXPpGl+g406WJ/ssY4MuAfr9da
 b8eZ2A1rnpBbIe8ueeaDyNkEuyAnozUdOlz/5Al2tQ5E0EneRwNwwdVwlL5iCrhOZH
 6AGf6QJMHofiNVZdu49AwJ6YmmwSAk+BP+B6mJSrXXw/Dercuj0azj+em5WAPvLqXF
 Y+S8EMFNq9P0p/1bBnwcoRvMYM40TutCKMV0XjshmEYrBFeaE9TNc3JiNV/CZpQkvu
 ujfOZesmBo2lQIlmsxiuHfXdChkKhGxWQM4YSmz9jcbdLPf/3tZTTRLhk9LmBhTztA
 RTbG+qePm4HRw==
Received: by mail-lf1-f44.google.com with SMTP id z19so35240133lfq.13
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 00:10:34 -0800 (PST)
X-Gm-Message-State: AOAM5318vTS7G0TrOQqeuKuXbtyeBW4iL7SsumZvokCVFjELh99WbIYu
 Sc/g8PNj5YdcOufP+I381MkDd3kIeMNvz2IbeWc=
X-Google-Smtp-Source: ABdhPJykY+dvL+1GXmktnHDS2zXI387Vsr5YXEveY1d8rit1tT/hQTTS9CD1dDWxxX5ce3jmiS7RoOoUcfODSGZmbh0=
X-Received: by 2002:a5d:58d1:: with SMTP id o17mr2237862wrf.407.1644912621613; 
 Tue, 15 Feb 2022 00:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-15-arnd@kernel.org>
 <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
 <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
In-Reply-To: <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 09:10:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DPxgti+aRVUABQFZz-yT0KNU9QZpB9iGNCPkBHnv_xg@mail.gmail.com>
Message-ID: <CAK8P3a1DPxgti+aRVUABQFZz-yT0KNU9QZpB9iGNCPkBHnv_xg@mail.gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [OpenRISC] [PATCH 14/14] uaccess: drop set_fs leftovers
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgODo0NiBBTSBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXgu
ZGU+IHdyb3RlOgo+Cj4gT24gMi8xNS8yMiAwNDowMywgQWwgVmlybyB3cm90ZToKPiA+IE9uIE1v
biwgRmViIDE0LCAyMDIyIGF0IDA1OjM0OjUyUE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6
Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2Z1dGV4LmggYi9hcmNo
L3BhcmlzYy9pbmNsdWRlL2FzbS9mdXRleC5oCj4gPj4gaW5kZXggYjU4MzUzMjVkNDRiLi4yZjRh
MWIxZWYzODcgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vZnV0ZXgu
aAo+ID4+ICsrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2Z1dGV4LmgKPiA+PiBAQCAtOTks
NyArOTksNyBAQCBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYyh1MzIgKnV2YWwsIHUzMiBf
X3VzZXIgKnVhZGRyLAo+ID4+ICAgICAgLyogZnV0ZXguYyB3YW50cyB0byBkbyBhIGNtcHhjaGdf
aW5hdG9taWMgb24ga2VybmVsIE5VTEwsIHdoaWNoIGlzCj4gPj4gICAgICAgKiBvdXIgZ2F0ZXdh
eSBwYWdlLCBhbmQgY2F1c2VzIG5vIGVuZCBvZiB0cm91YmxlLi4uCj4gPj4gICAgICAgKi8KPiA+
PiAtICAgIGlmICh1YWNjZXNzX2tlcm5lbCgpICYmICF1YWRkcikKPiA+PiArICAgIGlmICghdWFk
ZHIpCj4gPj4gICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ID4KPiA+ICAgICAgIEh1aD8g
IHVhY2Nlc3Nfa2VybmVsKCkgaXMgcmVtb3ZlZCBzaW5jZSBpdCBiZWNvbWVzIGFsd2F5cyBmYWxz
ZSBub3csCj4gPiBzbyB0aGlzIGxvb2tzIG9kZC4KPiA+Cj4gPiAgICAgICBBRkFJQ1MsIHRoZSBj
b21tZW50IGFib3ZlIHRoYXQgY2hlY2sgcmVmZXJzIHRvIGZ1dGV4X2RldGVjdF9jbXB4Y2hnKCkK
PiA+IC0+IGNtcHhjaGdfZnV0ZXhfdmFsdWVfbG9ja2VkKCkgLT4gZnV0ZXhfYXRvbWljX2NtcHhj
aGdfaW5hdG9taWMoKSBjYWxsIGNoYWluLgo+ID4gV2hpY2ggaGFkIGJlZW4gZ29uZSBzaW5jZSBj
b21taXQgMzI5NzQ4MWQ2ODhhIChmdXRleDogUmVtb3ZlIGZ1dGV4X2NtcHhjaGcKPiA+IGRldGVj
dGlvbikuICBUaGUgY29tbWVudCAqYW5kKiB0aGUgY2hlY2sgc2hvdWxkJ3ZlIGJlZW4ga2lsbGVk
IG9mZiBiYWNrCj4gPiB0aGVuLgo+ID4gICAgICAgTGV0J3MgbWFrZSBzdXJlIHRvIGdldCBib3Ro
IG5vdy4uLgo+Cj4gUmlnaHQuIEFybmQsIGNhbiB5b3UgZHJvcCB0aGlzIGlmKCkgYW5kIHRoZSBj
b21tZW50IGFib3ZlIGl0PwoKRG9uZS4KCiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
