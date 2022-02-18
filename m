Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7754BB4F4
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 10:05:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 178FD24878;
	Fri, 18 Feb 2022 10:05:14 +0100 (CET)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mail.librecores.org (Postfix) with ESMTPS id B6FF824848
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 10:05:11 +0100 (CET)
Received: by mail-qk1-f182.google.com with SMTP id bs32so7333390qkb.1
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 01:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PuyWdNt7E53vPgI1lZLvKTUut2bNACfNkxpc83Dke5E=;
 b=Gn0V+PvYGudfxg39qOiwLTH15xaRvJNYgNyBBFkSYcFFV0oUdCgwcRlFdH6BpgjDrG
 XZUG7U984tdvArH8Xfl1O1K58LkxMtB6K4MPzD2UEzXqGZ3nj8i0hxTWgRWO359sW2dE
 nBUNt6bnsYjnGLsqgCnnx91vrI8J0Uk6SBMREfefAASL2QXAcAxArNFRNxmxJj6bL+No
 zuljymGXjLBR/ng9as/fD+hcvs63EkXol8x/sqXLG8ZqwUq3UIxrG6u3a9CHbVWPTBpA
 YW7fp5ZXEkeM7LuDpMd9pIZxpnysGsd6Hav8B187Ag1FFJy+G5xGg0gOQvEoSSMbNaeF
 Qb2Q==
X-Gm-Message-State: AOAM5337FIWrheJZEZ3CfqJPc+G6nHCkVcmsfefu46hEyIQZpiIpBaj+
 k6Ka10/1VuA6Ve+3IAwlf0gs5OwI2Pd4cw==
X-Google-Smtp-Source: ABdhPJwbFSVDpAyIxaddiRHGNopWu5aukU15Zt/XRf/42WnMLj5KOFQfLOXNMxvzQ1eioZBi8pL8zg==
X-Received: by 2002:a37:2703:0:b0:47b:a20f:d641 with SMTP id
 n3-20020a372703000000b0047ba20fd641mr3872054qkn.710.1645175110437; 
 Fri, 18 Feb 2022 01:05:10 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com.
 [209.85.219.41])
 by smtp.gmail.com with ESMTPSA id 16sm25471471qty.86.2022.02.18.01.05.10
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:05:10 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id d7so13510030qvk.2
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 01:05:10 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr3285076vse.57.1645175099822; Fri, 18
 Feb 2022 01:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 10:04:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfiuYEMQhtscwt4xCm1Dfw0M_qEmQ4pof59eB4jZFOPg@mail.gmail.com>
Message-ID: <CAMuHMdVfiuYEMQhtscwt4xCm1Dfw0M_qEmQ4pof59eB4jZFOPg@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMjoxNyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBU
aGVyZSBhcmUgbWFueSBkaWZmZXJlbnQgd2F5cyB0aGF0IGFjY2Vzc19vaygpIGlzIGRlZmluZWQg
YWNyb3NzCj4gYXJjaGl0ZWN0dXJlcywgYnV0IGluIHRoZSBlbmQsIHRoZXkgYWxsIGp1c3QgY29t
cGFyZSBhZ2FpbnN0IHRoZQo+IHVzZXJfYWRkcl9tYXgoKSB2YWx1ZSBvciB0aGV5IGFjY2VwdCBh
bnl0aGluZy4KPgo+IFByb3ZpZGUgb25lIGRlZmluaXRpb24gdGhhdCB3b3JrcyBmb3IgbW9zdCBh
cmNoaXRlY3R1cmVzLCBjaGVja2luZwo+IGFnYWluc3QgVEFTS19TSVpFX01BWCBmb3IgdXNlciBw
cm9jZXNzZXMgb3Igc2tpcHBpbmcgdGhlIGNoZWNrIGluc2lkZQo+IG9mIHVhY2Nlc3Nfa2VybmVs
KCkgc2VjdGlvbnMuCj4KPiBGb3IgYXJjaGl0ZWN0dXJlcyB3aXRob3V0IENPTkZJR19TRVRfRlMo
KSwgdGhpcyBzaG91bGQgYmUgdGhlIGZhc3Rlc3QKPiBjaGVjaywgYXMgaXQgY29tZXMgZG93biB0
byBhIHNpbmdsZSBjb21wYXJpc29uIG9mIGEgcG9pbnRlciBhZ2FpbnN0IGEKPiBjb21waWxlLXRp
bWUgY29uc3RhbnQsIHdoaWxlIHRoZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgdmVyc2lvbnMgdGVu
ZCB0bwo+IGRvIHNvbWV0aGluZyBtb3JlIGNvbXBsZXggZm9yIGhpc3RvcmljIHJlYXNvbnMgb3Ig
Z2V0IHNvbWV0aGluZyB3cm9uZy4KPgo+IFR5cGUgY2hlY2tpbmcgZm9yIF9fdXNlciBhbm5vdGF0
aW9ucyBpcyBoYW5kbGVkIGluY29uc2lzdGVudGx5IGFjcm9zcwo+IGFyY2hpdGVjdHVyZXMsIGJ1
dCB0aGlzIGlzIGVhc2lseSBzaW1wbGlmaWVkIGFzIHdlbGwgYnkgdXNpbmcgYW4gaW5saW5lCj4g
ZnVuY3Rpb24gdGhhdCB0YWtlcyBhICdjb25zdCB2b2lkIF9fdXNlciAqJyBhcmd1bWVudC4gQSBo
YW5kZnVsIG9mCj4gY2FsbGVycyBuZWVkIGFuIGV4dHJhIF9fdXNlciBhbm5vdGF0aW9uIGZvciB0
aGlzLgo+Cj4gU29tZSBhcmNoaXRlY3R1cmVzIGhhZCB0cmljayB0byB1c2UgMzMtYml0IG9yIDY1
LWJpdCBhcml0aG1ldGljIG9uIHRoZQo+IGFkZHJlc3NlcyB0byBjYWxjdWxhdGUgdGhlIG92ZXJm
bG93LCBob3dldmVyIHRoaXMgc2ltcGxlciB2ZXJzaW9uIHVzZXMKPiBmZXdlciByZWdpc3RlcnMs
IHdoaWNoIG1lYW5zIGl0IGNhbiBwcm9kdWNlIGJldHRlciBvYmplY3QgY29kZSBpbiB0aGUKPiBl
bmQgZGVzcGl0ZSBuZWVkaW5nIGEgc2Vjb25kIChzdGF0aWNhbGx5IHByZWRpY3RlZCkgYnJhbmNo
Lgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IEFja2Vk
LWJ5OiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiBbYXJtNjQsIGFzbS1nZW5l
cmljXQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cgo+ICBh
cmNoL202OGsvS2NvbmZpZy5jcHUgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL202OGsv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICAgIHwgMTkgKy0tLS0tLS0tCgpBY2tlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
