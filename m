Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76FF9C471D
	for <lists+openrisc@lfdr.de>; Wed,  2 Oct 2019 07:44:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 39AC320600;
	Wed,  2 Oct 2019 07:44:09 +0200 (CEST)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by mail.librecores.org (Postfix) with ESMTPS id 87663204A2
 for <openrisc@lists.librecores.org>; Wed,  2 Oct 2019 02:14:26 +0200 (CEST)
Received: by mail-io1-f68.google.com with SMTP id u8so52766803iom.5
 for <openrisc@lists.librecores.org>; Tue, 01 Oct 2019 17:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qp6mpPjoJw8IpL230TwztYNGcdXtc2wRumjJPrYIsQE=;
 b=nJtPZChLaez2QyIvdw5xpQM+gY+4nNfutZP/DX1GosRihN1p8Y/jzvzU5+zZVVXLDq
 DNW5rNxAEWMfY4DML2WBa4k8L6N9BKjZt+S1WhSwJylMRWekm8bQGBEDcBvcSstJLeH7
 osBNQPoC6vhf9EY6DvGZUS8bjPCLVbggq0vpLSG6o0qgZ68mHanhcK7N3A/k0zMXrBbT
 Myz3NcGtILKbjxYen8N4nInaRBIm801lXbpfCzyfiuoGv9mi3cSKUjp9iAirGweypF7I
 T5mChO7ltGRoxOnD6pn9vRPircx8cSspNsbQ9S+cDzRYkEkb4WMfK2l7wEZANDZnvpgU
 4hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qp6mpPjoJw8IpL230TwztYNGcdXtc2wRumjJPrYIsQE=;
 b=l357K0re2gGRG2dBMH2WPOLTwIwbezW/DW2jXsMxWsIxrngrPjY28Ci14nazK1ytPU
 4c4lKv9wcK2vzn2goxmqBGIbCkQcXPAl1IN6ENAi17j18OvmgNy7UqEm/QPYPziv26IY
 PEUz8OEnBuZDj+YlwXdUlHBTE0Mis8yuPsj9Ad2huehyU82apWwXa5cup1/edcOkjY5C
 ZyksbT4H0J9IoXQUPJBFgCXhkOuN9iTOcIY1N1d7d1z/319nrBPJVHfcTlJBpwVj1pPQ
 9AnWgpeKHShyfCX1adlBGkFgBd1/TIzwdQpVba0WXMhvmB8GiKEmzmiMdUx52G8lQwzp
 2IyA==
X-Gm-Message-State: APjAAAU1rK2tLzG/19guXMUvy/WNIDhvtXrD/OFdN+V91kcaimi9bIsh
 kAj8f0v/HeDIvlMerg0Z91kYRBR9fJnQM8QvYdY=
X-Google-Smtp-Source: APXvYqw1icrX5CgHqYJTBX6lKVXwK6z5wdputtkAh6YFSqMaOhm8xmij6KJaNr2N6b3kx+nme5PxuCv6WXWh+UvZaMU=
X-Received: by 2002:a92:3314:: with SMTP id a20mr890351ilf.276.1569975265009; 
 Tue, 01 Oct 2019 17:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
In-Reply-To: <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 1 Oct 2019 19:14:13 -0500
Message-ID: <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
To: Mike Rapoport <rppt@linux.ibm.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:44:04 +0200
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
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
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

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgODozMyBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBJIGFtIGF0dGFjaGluZyB0d28gbG9ncy4gIEkgbm93IHRoZSBtYWls
aW5nIGxpc3RzIHdpbGwgYmUgdW5oYXBweSwgYnV0Cj4gIGRvbid0IHdhbnQgdG8gdHJ5IGFuZCBz
cGFtIGEgYnVuY2ggb2YgbG9nIHRocm91Z2ggdGhlIG1haWxpbmcgbGlhc3QuCj4gVGhlIHR3byBs
b2dzIHNob3cgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHdvcmtpbmcgYW5kIG5vbi13b3Jr
aW5nCj4gaW14NnEgM0QgYWNjZWxlcmF0b3Igd2hlbiB0cnlpbmcgdG8gcnVuIGEgc2ltcGxlIGds
bWFyazItZXMyLWRybSBkZW1vLgo+Cj4gVGhlIG9ubHkgY2hhbmdlIGJldHdlZW4gdGhlbSBpcyB0
aGUgMiBsaW5lIGNvZGUgY2hhbmdlIHlvdSBzdWdnZXN0ZWQuCj4KPiBJbiBib3RoIGNhc2VzLCBJ
IGhhdmUgY21hPTEyOE0gc2V0IGluIG15IGJvb3RhcmdzLiAgSGlzdG9yaWNhbGx5IHRoaXMKPiBo
YXMgYmVlbiBzdWZmaWNpZW50LCBidXQgY21hPTI1Nk0gaGFzIG5vdCBtYWRlIGEgZGlmZmVyZW5j
ZS4KPgoKTWlrZSBhbnkgc3VnZ2VzdGlvbnMgb24gaG93IHRvIG1vdmUgZm9yd2FyZD8KSSB3YXMg
aG9waW5nIHRvIGdldCB0aGUgZml4ZXMgdGVzdGVkIGFuZCBwdXNoZWQgYmVmb3JlIDUuNCBpcyBy
ZWxlYXNlZAppZiBhdCBhbGwgcG9zc2libGUKCj4gYWRhbQo+Cj4gT24gU2F0LCBTZXAgMjgsIDIw
MTkgYXQgMjozMyBBTSBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+
ID4KPiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDAyOjM1OjUzUE0gLTA1MDAsIEFkYW0gRm9y
ZCB3cm90ZToKPiA+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTE6MDQgQU0gTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpLAo+ID4g
PiA+Cj4gPiA+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDg6MDk6NTJBTSAtMDUwMCwgQWRh
bSBGb3JkIHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTcgQU0g
RmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3Jk
MTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSB0cmllZCBj
bWE9MjU2TSBhbmQgbm90aWNlZCB0aGUgY21hIGR1bXAgYXQgdGhlIGJlZ2lubmluZyBkaWRuJ3QK
PiA+ID4gPiA+ID4gPiBjaGFuZ2UuICBEbyB3ZSBuZWVkIHRvIHNldHVwIGEgcmVzZXJ2ZWQtbWVt
b3J5IG5vZGUgbGlrZQo+ID4gPiA+ID4gPiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBkb24ndCB0aGluayBzby4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0aGUgZXhhY3QgY29t
bWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHdh
cyBhYmxlIHRvIG5hcnJvdyBpdCBkb3duIHRoZSA5MmQxMmY5NTQ0YjcgKCJtZW1ibG9jazogcmVm
YWN0b3IKPiA+ID4gPiA+IGludGVybmFsIGFsbG9jYXRpb24gZnVuY3Rpb25zIikgdGhhdCBjYXVz
ZWQgdGhlIHJlZ3Jlc3Npb24gd2l0aAo+ID4gPiA+ID4gRXRuYXZpdi4KPiA+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB3aXRoIHRoaXMgY2hhbmdlOgo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IFRoYXQgYXBwZWFycyB0byBoYXZlIGZpeGVkIG15IGlzc3VlLiAgSSBhbSBub3Qg
c3VyZSB3aGF0IHRoZSBpbXBhY3QKPiA+ID4gaXMsIGJ1dCBpcyB0aGlzIGEgc2FmZSBvcHRpb24/
Cj4gPgo+ID4gSXQncyBub3QgcmVhbGx5IGEgZml4LCBJIGp1c3Qgd2FudGVkIHRvIHNlZSBob3cg
ZXhhY3RseSA5MmQxMmY5NTQ0YjcgKCJtZW1ibG9jazoKPiA+IHJlZmFjdG9yIGludGVybmFsIGFs
bG9jYXRpb24gZnVuY3Rpb25zIikgYnJva2UgeW91ciBzZXR1cC4KPiA+Cj4gPiBDYW4geW91IHNo
YXJlIHRoZSBkdHMgeW91IGFyZSB1c2luZyBhbmQgdGhlIGZ1bGwga2VybmVsIGxvZz8KPiA+Cj4g
PiA+IGFkYW0KPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21l
bWJsb2NrLmMKPiA+ID4gPiBpbmRleCA3ZDRmNjFhLi4xZjVhMGViIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL21tL21lbWJsb2NrLmMKPiA+ID4gPiArKysgYi9tbS9tZW1ibG9jay5jCj4gPiA+ID4gQEAg
LTEzNTYsOSArMTM1Niw2IEBAIHN0YXRpYyBwaHlzX2FkZHJfdCBfX2luaXQgbWVtYmxvY2tfYWxs
b2NfcmFuZ2VfbmlkKHBoeXNfYWRkcl90IHNpemUsCj4gPiA+ID4gICAgICAgICAgICAgICAgIGFs
aWduID0gU01QX0NBQ0hFX0JZVEVTOwo+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4g
LSAgICAgICBpZiAoZW5kID4gbWVtYmxvY2suY3VycmVudF9saW1pdCkKPiA+ID4gPiAtICAgICAg
ICAgICAgICAgZW5kID0gbWVtYmxvY2suY3VycmVudF9saW1pdDsKPiA+ID4gPiAtCj4gPiA+ID4g
IGFnYWluOgo+ID4gPiA+ICAgICAgICAgZm91bmQgPSBtZW1ibG9ja19maW5kX2luX3JhbmdlX25v
ZGUoc2l6ZSwgYWxpZ24sIHN0YXJ0LCBlbmQsIG5pZCwKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYWdzKTsKPiA+ID4gPgo+ID4gPiA+ID4gSSBh
bHNvIG5vdGljZWQgdGhhdCBpZiBJIGNyZWF0ZSBhIHJlc2VydmVkIG1lbW9yeSBub2RlIGFzIHdh
cyBkb25lIG9uZQo+ID4gPiA+ID4gaW14NnVsLWNjaW14NnVsc29tLmR0c2kgdGhlIDNEIHNlZW1z
IHRvIHdvcmsgYWdhaW4sIGJ1dCB3aXRob3V0IGl0LCBJCj4gPiA+ID4gPiB3YXMgZ2V0dGluZyBl
cnJvcnMgcmVnYXJkbGVzcyBvZiB0aGUgJ2NtYT0yNTZNJyBvciBub3QuCj4gPiA+ID4gPiBJIGRv
bid0IGhhdmUgYSBwcm9ibGVtIHVzaW5nIHRoZSByZXNlcnZlZCBtZW1vcnksIGJ1dCBJIGd1ZXNz
IEkgYW0gbm90Cj4gPiA+ID4gPiBzdXJlIHdoYXQgdGhlIGFtb3VudCBzaG91bGQgYmUuICBJIGtu
b3cgZm9yIHRoZSB2aWRlbyBkZWNvZGluZyAxMDgwcCwKPiA+ID4gPiA+IEkgaGF2ZSBoaXN0b3Jp
Y2FsbHkgdXNlZCBjbWE9MTI4TSwgYnV0IHdpdGggdGhlIDNEIGFsc28gbmVlZGluZyBzb21lCj4g
PiA+ID4gPiBtZW1vcnkgYWxsb2NhdGlvbiwgaXMgdGhhdCBlbm91Z2ggb3Igc2hvdWxkIEkgdXNl
IDI1Nk0/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gYWRhbQo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4g
PiBTaW5jZXJlbHkgeW91cnMsCj4gPiA+ID4gTWlrZS4KPiA+ID4gPgo+ID4KPiA+IC0tCj4gPiBT
aW5jZXJlbHkgeW91cnMsCj4gPiBNaWtlLgo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
