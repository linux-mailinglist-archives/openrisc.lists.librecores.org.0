Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD5AC4716
	for <lists+openrisc@lfdr.de>; Wed,  2 Oct 2019 07:44:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 65FAE20629;
	Wed,  2 Oct 2019 07:44:05 +0200 (CEST)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by mail.librecores.org (Postfix) with ESMTPS id 8B8B32012D
 for <openrisc@lists.librecores.org>; Wed, 25 Sep 2019 14:17:14 +0200 (CEST)
Received: by mail-io1-f67.google.com with SMTP id h144so13167660iof.7
 for <openrisc@lists.librecores.org>; Wed, 25 Sep 2019 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4RvotBfrNK4XtLNNLx8Pazo7kMyOm8WMNbLFH6FEEU=;
 b=iUVK92GEmBGCZJyRo/Zd1KGKYtVYyBQQZ/qadZsMHtgdBqOIEJTGes/jFXUJbsxPYf
 arbgI67CVRtjqzv9KbtoPjbnRd+NNaoZROuAK65Afp+qrjeu4taq1FiOikitUOgqwDx8
 fioo5IrGYuhVH0YvNqEwrFk0OelIti4ramwaMIdGU4NyJep+562IHM+KmC8sSycW/lGl
 6hw22I7QH199NqTHihVI1jILF/7aomQpGPobiyR3J6OdLD8RebyLMuWN2U0+NXMFCX56
 jcF4Oyc8LIMBAV7TynSwH8rI44zROllFOPxhK0YNDBYQo27LHn7/o72CQFX3jXNFDaC5
 kGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4RvotBfrNK4XtLNNLx8Pazo7kMyOm8WMNbLFH6FEEU=;
 b=fXXLXPOkxErupe/rPO8qjaM9MJJjpU3Vv279m8gZyVR8pVOZez7FdRIIZLI4xMoLMq
 X7gI50JYN1YdsYEQnxpVKsJSCw41ha32xsB+xer6ptAl3g/5VRNmU21qtxUe3wlRCjTA
 3oyYKqrtCR2FnODN/iFZvdSk1yEIV7di5Npgg0piqMrmbuzdqFEvDjC1//306gyqCPRj
 hHDMCHuqIeGuj8ikm+5kRifHRcnQoxuH3a3raTwxzYKntijdGqTxVqO3fK9sedxkxUwe
 lJYcVz2JqN5JwcSZd9AJfJhaWJOM0p0J1AZMOG/hXUN1nU2iv1FINT6KHtruEassdMxs
 al2g==
X-Gm-Message-State: APjAAAVF3dZpR8rfZU1YZ+OQDf+hSPjF/1I/JzTwIb5r3weAOUTE9o/s
 aGTS6QkTFY7Kdx7K8C/anpPybq43k+6uJrMZDD4=
X-Google-Smtp-Source: APXvYqxS45l3zihhw3tYCzgwBmyCEU+INEqloepYzMma/aNO63dr/UcHcVyi8UcvHnJD8dRs3xdWT6wqG8jXwm/qXD0=
X-Received: by 2002:a02:65cd:: with SMTP id u196mr4900191jab.3.1569413832794; 
 Wed, 25 Sep 2019 05:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
In-Reply-To: <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 25 Sep 2019 07:17:02 -0500
Message-ID: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:44:03 +0200
Subject: Re: [OpenRISC] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Guan Xuetao <gxt@pku.edu.cn>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNzoxMiBBTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWRhbSwKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0
IDY6MzggQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJIGtu
b3cgaXQncyByYXRoZXIgbGF0ZSwgYnV0IHRoaXMgcGF0Y2ggYnJva2UgdGhlIEV0bmF2aXYgM0Qg
Z3JhcGhpY3MKPiA+IGluIG15IGkuTVg2US4KPiA+Cj4gPiBXaGVuIEkgdHJ5IHRvIHVzZSB0aGUg
M0QsIGl0IHJldHVybnMgc29tZSBlcnJvcnMgYW5kIHRoZSBkbWVzZyBsb2cKPiA+IHNob3dzIHNv
bWUgbWVtb3J5IGFsbG9jYXRpb24gZXJyb3JzIHRvbzoKPiA+IFsgICAgMy42ODIzNDddIGV0bmF2
aXYgZXRuYXZpdjogYm91bmQgMTMwMDAwLmdwdSAob3BzIGdwdV9vcHMpCj4gPiBbICAgIDMuNjg4
NjY5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+ID4g
WyAgICAzLjY5NTA5OV0gZXRuYXZpdiBldG5hdml2OiBib3VuZCAyMjA0MDAwLmdwdSAob3BzIGdw
dV9vcHMpCj4gPiBbICAgIDMuNzAwODAwXSBldG5hdml2LWdwdSAxMzAwMDAuZ3B1OiBtb2RlbDog
R0MyMDAwLCByZXZpc2lvbjogNTEwOAo+ID4gWyAgICAzLjcyMzAxM10gZXRuYXZpdi1ncHUgMTMw
MDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+ID4gbWVtb3J5IHdpbmRvdwo+
ID4gWyAgICAzLjczMTMwOF0gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogbW9kZWw6IEdDMzIwLCBy
ZXZpc2lvbjogNTAwNwo+ID4gWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTog
Y29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+ID4gbWVtb3J5IHdpbmRvdwo+Cj4gVGhpcyBs
b29rcyBzaW1pbGFyIHRvIHdoYXQgd2FzIHJlcG9ydGVkIGF0Ogo+IGh0dHBzOi8vYnVncy5mcmVl
ZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTc4OQo+Cj4gRG9lcyBpdCBoZWxwIGlmIHlv
dSB1c2UgdGhlIHNhbWUgc3VnZ2VzdGlvbiBhbmQgcGFzcyBjbWE9MjU2TSBpbiB5b3VyCj4ga2Vy
bmVsIGNvbW1hbmQgbGluZT8KCkkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBk
dW1wIGF0IHRoZSBiZWdpbm5pbmcgZGlkbid0CmNoYW5nZS4gIERvIHdlIG5lZWQgdG8gc2V0dXAg
YSByZXNlcnZlZC1tZW1vcnkgbm9kZSBsaWtlCmlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8K
CmFkYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
