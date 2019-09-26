Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8F108C471A
	for <lists+openrisc@lfdr.de>; Wed,  2 Oct 2019 07:44:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EC8FB20347;
	Wed,  2 Oct 2019 07:44:07 +0200 (CEST)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by mail.librecores.org (Postfix) with ESMTPS id 20F9B20132
 for <openrisc@lists.librecores.org>; Thu, 26 Sep 2019 21:36:07 +0200 (CEST)
Received: by mail-io1-f65.google.com with SMTP id r26so9618387ioh.8
 for <openrisc@lists.librecores.org>; Thu, 26 Sep 2019 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=lFVH4DJZInfXaRXpqmiMEK9WpeSM/1iq4W9bn5uziJHuNnpDS5uJfwrrSMkKUYaoWu
 tjIzRew236DgZA4ISwubGuuzdkMEJIbQ8yLo4Gw4blLNNqTUJXJQc2T8EmFOMMaE/MZN
 TWI21uIOpWZV0B6kiTUPUzXP+86XUqzfSXBes1IbztoB6sCaCe2+0vHVrK7I1YSyHTRf
 vUusvWxQUo6svZWbb5qWyg1vE5i/0/5lEgToMxkxJ7QF/bNuxlBlDbD6OXf3ku60x8mI
 qYDnylEQgvdyDcRtg2M6u1XUP8jT9lELn92+Mho67HMmT8OkOdOtqWogr7E2TIwC5RUe
 rt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=kiKKNS+bq/EjHKNmu0oqjGtXMASuHolIN1tF1VZ8UXTE9seZQaJW+/JLSpLGs7a5kT
 tgrEHNzgOALBK3qjPYP9xunQPbQawC32R5pSSHCQo0RQhClPziLTGCr12LIQjtUhvL8S
 d4B3WixTETcNK6ouCKj9n9YBwS31Erca40TLDyhAB5lRgw9d9S8Zftz6e01i9XnqzWKG
 hjOY8tWU1zCh91KlnRZXPL3NM0Z/o2Qf233xAhp7k8N0jUc6/bmco+Z6CVXSLJr+pVPL
 XPZ7EU1B2QxAVOU9xo8yhUTrtVf1p1IFH0QBaiPB8PdFbe7hGxWZLfy7eqeFKdm9wr1q
 jQOw==
X-Gm-Message-State: APjAAAVp6K+w5YSZeq3erdOknoSvIQE8pSAl4QbdFe2XjH7LbFFcW/Ua
 uOTUkC0Hu8f0X9KirCdqSCyMs1FFf3i51Ary8LQ=
X-Google-Smtp-Source: APXvYqz6Gzzz4fph8SDTgwR3nXuuRIG8y0wd6XvcO9/S+doLjWzArUyv9IHucQgjs6f3GvWFnHs+ZCUo69B6L3/gML4=
X-Received: by 2002:a92:9912:: with SMTP id p18mr378753ili.78.1569526565531;
 Thu, 26 Sep 2019 12:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
In-Reply-To: <20190926160433.GD32311@linux.ibm.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 14:35:53 -0500
Message-ID: <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
To: Mike Rapoport <rppt@linux.ibm.com>
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTE6MDQgQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDg6
MDk6NTJBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkg
YXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3Jk
MTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSSB0cmllZCBjbWE9MjU2TSBhbmQg
bm90aWNlZCB0aGUgY21hIGR1bXAgYXQgdGhlIGJlZ2lubmluZyBkaWRuJ3QKPiA+ID4gPiBjaGFu
Z2UuICBEbyB3ZSBuZWVkIHRvIHNldHVwIGEgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgbGlrZQo+ID4g
PiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPiA+ID4KPiA+ID4gSSBkb24ndCB0aGlu
ayBzby4KPiA+ID4KPiA+ID4gV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0aGUg
ZXhhY3QgY29tbWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KPiA+Cj4gPiBJIHdhcyBh
YmxlIHRvIG5hcnJvdyBpdCBkb3duIHRoZSA5MmQxMmY5NTQ0YjcgKCJtZW1ibG9jazogcmVmYWN0
b3IKPiA+IGludGVybmFsIGFsbG9jYXRpb24gZnVuY3Rpb25zIikgdGhhdCBjYXVzZWQgdGhlIHJl
Z3Jlc3Npb24gd2l0aAo+ID4gRXRuYXZpdi4KPgo+Cj4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB3aXRo
IHRoaXMgY2hhbmdlOgo+CgpUaGF0IGFwcGVhcnMgdG8gaGF2ZSBmaXhlZCBteSBpc3N1ZS4gIEkg
YW0gbm90IHN1cmUgd2hhdCB0aGUgaW1wYWN0CmlzLCBidXQgaXMgdGhpcyBhIHNhZmUgb3B0aW9u
PwoKCmFkYW0KCj4gZGlmZiAtLWdpdCBhL21tL21lbWJsb2NrLmMgYi9tbS9tZW1ibG9jay5jCj4g
aW5kZXggN2Q0ZjYxYS4uMWY1YTBlYiAxMDA2NDQKPiAtLS0gYS9tbS9tZW1ibG9jay5jCj4gKysr
IGIvbW0vbWVtYmxvY2suYwo+IEBAIC0xMzU2LDkgKzEzNTYsNiBAQCBzdGF0aWMgcGh5c19hZGRy
X3QgX19pbml0IG1lbWJsb2NrX2FsbG9jX3JhbmdlX25pZChwaHlzX2FkZHJfdCBzaXplLAo+ICAg
ICAgICAgICAgICAgICBhbGlnbiA9IFNNUF9DQUNIRV9CWVRFUzsKPiAgICAgICAgIH0KPgo+IC0g
ICAgICAgaWYgKGVuZCA+IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQpCj4gLSAgICAgICAgICAgICAg
IGVuZCA9IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQ7Cj4gLQo+ICBhZ2FpbjoKPiAgICAgICAgIGZv
dW5kID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZV9ub2RlKHNpemUsIGFsaWduLCBzdGFydCwgZW5k
LCBuaWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFn
cyk7Cj4KPiA+IEkgYWxzbyBub3RpY2VkIHRoYXQgaWYgSSBjcmVhdGUgYSByZXNlcnZlZCBtZW1v
cnkgbm9kZSBhcyB3YXMgZG9uZSBvbmUKPiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIHRoZSAz
RCBzZWVtcyB0byB3b3JrIGFnYWluLCBidXQgd2l0aG91dCBpdCwgSQo+ID4gd2FzIGdldHRpbmcg
ZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhlICdjbWE9MjU2TScgb3Igbm90Lgo+ID4gSSBkb24ndCBo
YXZlIGEgcHJvYmxlbSB1c2luZyB0aGUgcmVzZXJ2ZWQgbWVtb3J5LCBidXQgSSBndWVzcyBJIGFt
IG5vdAo+ID4gc3VyZSB3aGF0IHRoZSBhbW91bnQgc2hvdWxkIGJlLiAgSSBrbm93IGZvciB0aGUg
dmlkZW8gZGVjb2RpbmcgMTA4MHAsCj4gPiBJIGhhdmUgaGlzdG9yaWNhbGx5IHVzZWQgY21hPTEy
OE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29tZQo+ID4gbWVtb3J5IGFsbG9jYXRp
b24sIGlzIHRoYXQgZW5vdWdoIG9yIHNob3VsZCBJIHVzZSAyNTZNPwo+ID4KPiA+IGFkYW0KPgo+
IC0tCj4gU2luY2VyZWx5IHlvdXJzLAo+IE1pa2UuCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
