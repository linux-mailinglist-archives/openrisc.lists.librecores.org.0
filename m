Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E1B4D4BBEF9
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 19:07:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9609B24882;
	Fri, 18 Feb 2022 19:07:21 +0100 (CET)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mail.librecores.org (Postfix) with ESMTPS id 4798D2486B
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 19:07:19 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id i11so15178260eda.9
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=5c/qRto3YK3Y6/Rhnnpp4RzKmf8QhiKseObhkqXIpnLfhpnv2ua8Z7YCExbmjSYUCG
 SbBSycxSpm4FRe5zOaxst92xyRDLRie0B4d4p8x0W6snNr+dG6MghxLfcakTWMQA17Pf
 gOp7JS9gIpdJumtDaMv9IluyX8dB5LI5eLR/YC2U+D7T5N3aQr9NOYHAOP982E02xanw
 SC1uTLhbyKEp3+LiMa1bFSquyveVGLxTCPf/eSvmTiEZzxEI+wIe4AMdv5VgRD2GYf6G
 kO3gnVVxKK1wWuKxjcQ5nhLyDgmj/c1nxTJoqfRQTmuVCBNlEZ4IpVOo74LURbiOVsEg
 CBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=RrKoHFx6BPaMfqsNiJTo40YMrj3Mx3NQ1dr6yylAuXz4w1mtu/KQD5Wh6ciY7kL/0B
 l7ee8Vo44tsR8ULRtYD2iboovMVnCo4ZDqsqi/uTHlWLw7SisAGQ2T47sTzgoTd9R+4x
 9IQw46nE6hlhqUaY4dKbmZLn5DGFOBcVsMrnrHwKdcoM96EL1LNFnj6Ij4Nr4SBHu+r5
 ajGRgpojcvYIzSd8clho54m0A0wszU8BsgIoh+TG+a7A+sYM+xWSAMLv5ciYq3WTkzzb
 t73ys04YSx3FLvCe3cSDPaLyxKxEqBqLWSmn9p/os4nGXIMuSsjZQ1lvBRSYlhr275/1
 qzpQ==
X-Gm-Message-State: AOAM533odCpcavwF7IkTIzu61iowMTr+xTPA2QzYjs9Yhh6maKXrT+gS
 HBW/a/DmKUYrtYUAcFkUDnMFmp1Z+DHo2Nhb38XN4g==
X-Google-Smtp-Source: ABdhPJzKi9/dAquBFvy+ZlpESpcVBT1I3X4XtLJClo2SaEqFpqb8kdqwnL9Fphl8e/qcsjqeDfp/tX4JIrAspWajnck=
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr9386454edc.438.1645207638871; Fri, 18
 Feb 2022 10:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
 <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
In-Reply-To: <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 18 Feb 2022 10:07:07 -0800
Message-ID: <CALCETrWTB65vJXsQTPd_o7BRoSU=uqD0pFzKS+r4YgDuiCCqaQ@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [OpenRISC] [PATCH v2 13/18] uaccess: generalize access_ok()
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "ardb@kernel.org" <ardb@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "richard@nod.at" <richard@nod.at>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "green.hu@gmail.com" <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTozMCBBTSBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdo
dEBhY3VsYWIuY29tPiB3cm90ZToKPgo+IEZyb206IEFuZHkgTHV0b21pcnNraQo+ID4gU2VudDog
MTcgRmVicnVhcnkgMjAyMiAxOToxNQo+IC4uLgo+ID4gVGhpcyBpc24ndCBhY3R1YWxseSBvcHRp
bWFsLiAgT24geDg2LCBUQVNLX1NJWkVfTUFYIGlzIGEgYml6YXJyZQo+ID4gY29uc3RhbnQgdGhh
dCBoYXMgYSB2ZXJ5IHNwZWNpZmljIHZhbHVlIHRvIHdvcmsgYXJvdW5kIGEgYnVnXldkZXNpZ24K
PiA+IGVycm9yXldmZWF0dXJlIG9mIEludGVsIENQVXMuICBUQVNLX1NJWkVfTUFYIGlzIHRoZSBt
YXhpbXVtIGFkZHJlc3MgYXQKPiA+IHdoaWNoIHVzZXJzcGFjZSBpcyBwZXJtaXR0ZWQgdG8gYWxs
b2NhdGUgbWVtb3J5LCBidXQgdGhlcmUgaXMgYSBodWdlCj4gPiBnYXAgYmV0d2VlbiB1c2VyIGFu
ZCBrZXJuZWwgYWRkcmVzc2VzLCBhbmQgYW55IHZhbHVlIGluIHRoZSBnYXAgd291bGQKPiA+IGJl
IGFkZXF1YXRlIGZvciB0aGUgY29tcGFyaXNvbi4gIElmIHdlIHdhbnRlZCB0byBvcHRpbWl6ZSB0
aGlzLCBzaW1wbHkKPiA+IGNoZWNraW5nIHRoZSBoaWdoIGJpdCAod2hpY2ggeDg2IGNhbiBkbyB3
aXRob3V0IGFueSBpbW1lZGlhdGUKPiA+IGNvbnN0YW50cyBhdCBhbGwpIHdvdWxkIGJlIHN1ZmZp
Y2llbnQgYW5kLCBmb3IgYW4gYWNjZXNzIGtub3duIHRvIGZpdAo+ID4gaW4gMzIgYml0cywgb25l
IGNvdWxkIGdldCBldmVuIGZhbmNpZXIgYW5kIGNvbXBsZXRlbHkgaWdub3JlIHRoZSBzaXplCj4g
PiBvZiB0aGUgYWNjZXNzLiAgKEZvciBhY2Nlc3NlcyBub3Qga25vd24gdG8gZml0IGluIDMyIGJp
dHMsIEkgc3VzcGVjdAo+ID4gc29tZSBjcmVhdGl2aXR5IGNvdWxkIHN0aWxsIGNvbWUgdXAgd2l0
aCBhIGNvbnN0cnVjdGlvbiB0aGF0J3MKPiA+IHN1YnN0YW50aWFsbHkgZmFzdGVyIHRoYW4gdGhl
IG9uZSBpbiB5b3VyIHBhdGNoLikKPiA+Cj4gPiBTbyB0aGVyZSdzIHBsZW50eSBvZiByb29tIGZv
ciBvcHRpbWl6YXRpb24gaGVyZS4KPiA+Cj4gPiAoVGhpcyBpcyBub3QgaW4gYW55IHJlc3BlY3Qg
YSBOQUsgLS0gaXQncyBqdXN0IGFuIG9ic2VydmF0aW9uIHRoYXQKPiA+IHRoaXMgY291bGQgYmUg
ZXZlbiBiZXR0ZXIuKQo+Cj4gRm9yIDY0Yml0IGFyY2ggdGhhdCB1c2UgdGhlIHRvcCBiaXQgdG8g
c2VwYXJhdGUgdXNlci9rZXJuZWwKPiB5b3UgY2FuIHRlc3QgJyhhZGRyIHwgc2l6ZSkgPj4gNjIp
Jy4KPiBUaGUgY29tcGlsZXIgb3B0aW1pc2VzIG91dCBjb25zdGFudCBzaXplcy4KPgo+IFRoaXMg
aGFzIGFsbCBiZWVuIG1lbnRpb25lZCBhIGxvdCBvZiB0aW1lcy4KPiBZb3UgZG8gZ2V0IGRpZmZl
cmVudCBmYXVsdCB0eXBlcy4KPgo+IE9UT0ggYW4gZXhwbGljaXQgY2hlY2sgZm9yIGNvbnN0YW50
IHNpemUgKGxlc3MgdGhhbiBzb21ldGhpbmcgYmlnKQo+IGNhbiB1c2UgdGhlIGNoZWFwZXIgdGVz
dCBvZiB0aGUgc2lnbiBiaXQuCj4gQmlnIGNvbnN0YW50IHNpemVzIGNvdWxkIGJlIGNvbXBpbGUg
dGltZSBlcnJvcnMuCgpUaGUgZGlmZmVyZW50IGZhdWx0IHR5cGUgaXNzdWUgbWF5IHdlbGwgYmUg
YSByZWFsIHByb2JsZW0uICBSaWdodCBub3cKdGhlIGNvcmUgeDg2IGZhdWx0IGNvZGUgcmVzZXJ2
ZXMgdGhlIHJpZ2h0IHRvIGdyb3VjaCBpZiB3ZSBnZXQgI0dQCmluc3RlYWQgb2YgI1BGLiAgV2Ug
Y291bGQgY2hhbmdlIHRoYXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
