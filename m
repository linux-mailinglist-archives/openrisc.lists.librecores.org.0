Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A3F60C4715
	for <lists+openrisc@lfdr.de>; Wed,  2 Oct 2019 07:44:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3843020622;
	Wed,  2 Oct 2019 07:44:05 +0200 (CEST)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by mail.librecores.org (Postfix) with ESMTPS id 46A52204DC
 for <openrisc@lists.librecores.org>; Wed, 25 Sep 2019 14:12:10 +0200 (CEST)
Received: by mail-lj1-f194.google.com with SMTP id y3so5369387ljj.6
 for <openrisc@lists.librecores.org>; Wed, 25 Sep 2019 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUmVUwvSY/aeCErtOWtkiU7kxhgjU/DkZwXUVKfeXYI=;
 b=e0naPQpnh4JE/4pzdBeJlRoIgqUi6C/PmOHgsKHfsCSmwrfN9C/j9k46bbLakdQgtK
 NzyyALh2M4uqHkB4On8gEHIrvbwKUNNiu3zZ2lOeoXUiFudrKwoaCTbU97PgilT1l5iG
 BNvpNxJ3L2WwmKsrub8I/gHS221tUzLfviv94tbG+vMGMDoFLa5u8CB7VOGTEKPYce1l
 Cf3u6sYzxHRkaIjp/6i4jUz79T0kliSiD1RIQYnsEdRcWu0lLuAcfKmvxGsweCWvJ0nX
 0eOjvMQ1r+HHshdYbA3cDvsghoueNpOxeniug7pMPTULgl1lMmy+tRc55+GZxrbOt31A
 IWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUmVUwvSY/aeCErtOWtkiU7kxhgjU/DkZwXUVKfeXYI=;
 b=PvZuXyGR9vq1PrIILVAWdDDPYSKgduvjLH5W688WHO5bvZIytr/7lisHQ7SlSHLTEv
 CU4eqnsIh7Pg+KPxNih8UtjFnfFQE/uL7TJbAM4ooQDjwTy7952lvkjbpTZHHoLY0SD6
 TR5tlzAdb4fRmumkHtVad0EXh2013ujT80G0XmC8e9JwcSuYDn6Xf8FSjUNbAKGGvZeu
 UdBPm5G29ndKiLtqNzKDnRtCs9OMWwF36iL+/n1qTyKKjcqxN/9XutMh+n3CGKEkEYq0
 VVw6CdKlIhysBKkqN9mbWRy98HWLBgsd9nm6KIZg9CCxy6NrMsMquxO51W3jeIha3gst
 nCcg==
X-Gm-Message-State: APjAAAWnS8+B16FFPjIfCSAWEmz2bf3V8AW6G0Jf1QhytpMWoHjxo56T
 CbFV00oHchsAJfjI81bfUAzZWxRo+8rGAW9PRV4=
X-Google-Smtp-Source: APXvYqyQ9DDK1T7Dnq+bpI71Ik4P0Io7FbZdAq9brFueaElkRY2A7GJR4saQwrvMTiDWN1ujjgcBluE//8NebHfr57o=
X-Received: by 2002:a2e:a316:: with SMTP id l22mr6207823lje.211.1569413529490; 
 Wed, 25 Sep 2019 05:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
In-Reply-To: <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 09:12:18 -0300
Message-ID: <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
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

SGkgQWRhbSwKCk9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDY6MzggQU0gQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+IHdyb3RlOgoKPiBJIGtub3cgaXQncyByYXRoZXIgbGF0ZSwgYnV0IHRo
aXMgcGF0Y2ggYnJva2UgdGhlIEV0bmF2aXYgM0QgZ3JhcGhpY3MKPiBpbiBteSBpLk1YNlEuCj4K
PiBXaGVuIEkgdHJ5IHRvIHVzZSB0aGUgM0QsIGl0IHJldHVybnMgc29tZSBlcnJvcnMgYW5kIHRo
ZSBkbWVzZyBsb2cKPiBzaG93cyBzb21lIG1lbW9yeSBhbGxvY2F0aW9uIGVycm9ycyB0b286Cj4g
WyAgICAzLjY4MjM0N10gZXRuYXZpdiBldG5hdml2OiBib3VuZCAxMzAwMDAuZ3B1IChvcHMgZ3B1
X29wcykKPiBbICAgIDMuNjg4NjY5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5ncHUg
KG9wcyBncHVfb3BzKQo+IFsgICAgMy42OTUwOTldIGV0bmF2aXYgZXRuYXZpdjogYm91bmQgMjIw
NDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+IFsgICAgMy43MDA4MDBdIGV0bmF2aXYtZ3B1IDEzMDAw
MC5ncHU6IG1vZGVsOiBHQzIwMDAsIHJldmlzaW9uOiA1MTA4Cj4gWyAgICAzLjcyMzAxM10gZXRu
YXZpdi1ncHUgMTMwMDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1lbW9y
eSB3aW5kb3cKPiBbICAgIDMuNzMxMzA4XSBldG5hdml2LWdwdSAxMzQwMDAuZ3B1OiBtb2RlbDog
R0MzMjAsIHJldmlzaW9uOiA1MDA3Cj4gWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAw
LmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1lbW9yeSB3aW5kb3cKClRoaXMg
bG9va3Mgc2ltaWxhciB0byB3aGF0IHdhcyByZXBvcnRlZCBhdDoKaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNzg5CgpEb2VzIGl0IGhlbHAgaWYgeW91IHVz
ZSB0aGUgc2FtZSBzdWdnZXN0aW9uIGFuZCBwYXNzIGNtYT0yNTZNIGluIHlvdXIKa2VybmVsIGNv
bW1hbmQgbGluZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
