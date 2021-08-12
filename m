Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4266F3EADBE
	for <lists+openrisc@lfdr.de>; Fri, 13 Aug 2021 01:42:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E1491211D5;
	Fri, 13 Aug 2021 01:42:55 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9789B2406D
 for <openrisc@lists.librecores.org>; Thu, 12 Aug 2021 20:57:53 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 362056103A;
 Thu, 12 Aug 2021 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628794671;
 bh=9lyFwGGuyLf5GdDUz/aKvERlOFF1uWuGiPBbUIAEKfE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VwLU2IBE7pm2CpqhWrWcs09zHfDgGQQ+XwYJ0x4NJ+OYptETg8cUHpeJuXviSEb8m
 hZwv3aN1LfVIwHZVS+UQ7mB1srMgVxwRZcSfRTFv67A2WL07AvZbrPj/Jz8MICDjiz
 tSsLyZBkRPIi4PEfw72QWFlCzfTyNhyHc6hoJdLtBX/ALr48Ij7oskYZxfFb8gVUAz
 MdoO56PMOMA1qSMNTQQWl/YJOfRCSFiinLi5nd/tFripDrfTPOSzz5IN+8rkyBTJL5
 ClZ1UH9RZQQUjhvz/MyHpPFG2IOOryYDriDcsJsaN4YgRfyjgsTyLvyz3NzaOYphUa
 cYgcKsD4gQWUw==
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org
References: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <b49eed44-0837-906c-8779-4fffb5609653@kernel.org>
Date: Thu, 12 Aug 2021 11:57:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Aug 2021 01:42:54 +0200
Subject: Re: [OpenRISC] [PATCH -next] trap: Cleanup trap_init()
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Paul Walmsley <palmerdabbelt@google.com>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Vineet Gupta <vgupta@kernel.org>, Jeff Dike <jdike@addtoit.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gOC8xMi8yMSA1OjM2IEFNLCBLZWZlbmcgV2FuZyB3cm90ZToKPiBUaGVyZSBhcmUgc29tZSBl
bXB0eSB0cmFwX2luaXQoKSBpbiBkaWZmZXJlbnQgQVJDSHMsIGludHJvZHVjZQo+IGEgbmV3IHdl
YWsgdHJhcF9pbml0KCkgZnVuY3Rpb24gdG8gY2xlYW51cCB0aGVtLgo+Cj4gQ2M6IFZpbmVldCBH
dXB0YTx2Z3VwdGFAa2VybmVsLm9yZz4KPiBDYzogUnVzc2VsbCBLaW5nPGxpbnV4QGFybWxpbnV4
Lm9yZy51az4KPiBDYzogWW9zaGlub3JpIFNhdG88eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+
Cj4gQ2M6IExleSBGb29uIFRhbjxsZXkuZm9vbi50YW5AaW50ZWwuY29tPgo+IENjOiBKb25hcyBC
b25uPGpvbmFzQHNvdXRocG9sZS5zZT4KPiBDYzogU3RlZmFuIEtyaXN0aWFuc3NvbjxzdGVmYW4u
a3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ2M6IFN0YWZmb3JkIEhvcm5lPHNob3JuZUBn
bWFpbC5jb20+Cj4gQ2M6IEphbWVzIEUuSi4gQm90dG9tbGV5PEphbWVzLkJvdHRvbWxleUBIYW5z
ZW5QYXJ0bmVyc2hpcC5jb20+Cj4gQ2M6IEhlbGdlIERlbGxlcjxkZWxsZXJAZ214LmRlPgo+IENj
OiBNaWNoYWVsIEVsbGVybWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzogQmVuamFtaW4gSGVy
cmVuc2NobWlkdDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4gQ2M6IFBhdWwgTWFja2VycmFz
PHBhdWx1c0BzYW1iYS5vcmc+Cj4gQ2M6IFBhdWwgV2FsbXNsZXk8cGFsbWVyZGFiYmVsdEBnb29n
bGUuY29tPgo+IENjOiBKZWZmIERpa2U8amRpa2VAYWRkdG9pdC5jb20+Cj4gQ2M6IFJpY2hhcmQg
V2VpbmJlcmdlcjxyaWNoYXJkQG5vZC5hdD4KPiBDYzogQW50b24gSXZhbm92PGFudG9uLml2YW5v
dkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b248YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZzx3YW5na2VmZW5nLndhbmdA
aHVhd2VpLmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJjL2tlcm5lbC90cmFwcy5jICAgICAgfCA1IC0t
LS0tCgpBY2tlZC1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdEBrZXJuZWwub3JnPsKgICNhcmNoL2Fy
YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
