Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CA1684B57B0
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 18:01:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7D28324789;
	Mon, 14 Feb 2022 18:01:31 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 9077A211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 18:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MrxZM+dtR1LjIHLm64CmzES4OEtfVkeNuYlvax0H88s=; b=1xI1/Fvb99aqHheC6mtY388ud6
 9MT/bHCftGydYIWxm+hS4zGwhvbFt8OzX+edrM5UnO4tP1NBqSh70Lw78bL6Q3BsXOm/Di6JZoJYH
 wtHggpB7JYRvrXSaY0/s1eEkO2PXvhxpwgVhrfp/eQEItM485WwqPYb5B+6tJYfNWM5IfOyU+3GNz
 wgU3yHvVJYtieNqr2ZSULdjEvye7TyhUfxnlCnsscD5y8hniE9PulQxdXM5zxaKuNaLViAmRHCutR
 73lx+6HTraO/VU29BXdY1lFIki5yroT8XZ/YKJV8c3pSdMpd1Wlg6zLRh5SejJ7jky/eNWrhj93gC
 ys6P1MSw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJeis-00GF7n-M5; Mon, 14 Feb 2022 17:01:10 +0000
Date: Mon, 14 Feb 2022 09:01:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YgqK1ihlJvRFHJ9h@infradead.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-4-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [OpenRISC] [PATCH 03/14] nds32: fix access_ok() checks in
 get/put_user
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 jcmvbkbc@gmail.com, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, bcain@codeaurora.org,
 linux-hexagon@vger.kernel.org, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, richard@nod.at, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDFQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRoZSBnZXRf
dXNlcigpL3B1dF91c2VyKCkgZnVuY3Rpb25zIGFyZSBtZWFudCB0byBjaGVjayBmb3IKPiBhY2Nl
c3Nfb2soKSwgd2hpbGUgdGhlIF9fZ2V0X3VzZXIoKS9fX3B1dF91c2VyKCkgZnVuY3Rpb25zCj4g
ZG9uJ3QuCj4gCj4gVGhpcyBicm9rZSBpbiA0LjE5IGZvciBuZHMzMiwgd2hlbiBpdCBnYWluZWQg
YW4gZXh0cmFuZW91cwo+IGNoZWNrIGluIF9fZ2V0X3VzZXIoKSwgYnV0IGxvc3QgdGhlIGNoZWNr
IGl0IG5lZWRzIGluCj4gX19wdXRfdXNlcigpLgoKQ2FuIHdlIGZvbGxvdyB0aGUgbGVhZCBvZiBN
SVBTICh3aGljaCB0aGlzIHdhcyBvcmlnaW5hbGx5IGNvcGllZApmcm9tIEkgdGhpbmspIGFuZCBr
aWxsIHRoZSBwb2ludGxlc3MgX19nZXQvcHV0X3VzZXJfY2hlY2sgd3JhcHBlcgp0aGF0IGp1c3Qg
b2JzZnVjYXRlIHRoZSBjb2RlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
