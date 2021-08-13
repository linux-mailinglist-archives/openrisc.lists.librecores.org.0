Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB62F3EAE91
	for <lists+openrisc@lfdr.de>; Fri, 13 Aug 2021 04:28:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 60B8A23E88;
	Fri, 13 Aug 2021 04:28:21 +0200 (CEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by mail.librecores.org (Postfix) with ESMTPS id 677BD213F3
 for <openrisc@lists.librecores.org>; Fri, 13 Aug 2021 04:28:19 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gm6st5f1Mz9t23;
 Fri, 13 Aug 2021 12:28:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628821695;
 bh=jlHWtsgYmZ30B2WJN0Jw5XD8BZs0Z7qm5rWOQviWRxQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iQqdFqNsp0RRZI3qzmEc8DvXwIl+xP6sqn6MkAu1yNyVEEqSByPkt7fyHM+X9Mkc1
 H5RsYWUWRX8EIeuJJ4pqVwfnttonPEDoUI6iLblU3xQm7I/dYs830ptXGtqFnm8msw
 bQaEGG6Y/DzH1CN1Mvvb00KGwJKu//Dz61HaxwsLpsn/iRop+KxRmApjk7hRSxfG8F
 cG79DxTOVkrHCCl0Z+JjvfFI1Us2ePvxaJcd/q1n8XQPkD29Snt/5eadLOKqEw4s5I
 wyuWWaQ6HM0csDFNLWQbGqs6kWuET5VesHnFV3cwA2hGTS/6dU1L+U6SqYdZgv1Mhm
 jRnaImnD2vgxw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-hexagon@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
In-Reply-To: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
References: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
Date: Fri, 13 Aug 2021 12:27:58 +1000
Message-ID: <87czqim635.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <palmerdabbelt@google.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Vineet Gupta <vgupta@kernel.org>, Jeff Dike <jdike@addtoit.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

S2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cml0ZXM6Cj4gVGhlcmUg
YXJlIHNvbWUgZW1wdHkgdHJhcF9pbml0KCkgaW4gZGlmZmVyZW50IEFSQ0hzLCBpbnRyb2R1Y2UK
PiBhIG5ldyB3ZWFrIHRyYXBfaW5pdCgpIGZ1bmN0aW9uIHRvIGNsZWFudXAgdGhlbS4KPgo+IENj
OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBrZXJuZWwub3JnPgo+IENjOiBSdXNzZWxsIEtpbmcgPGxp
bnV4QGFybWxpbnV4Lm9yZy51az4KPiBDYzogWW9zaGlub3JpIFNhdG8gPHlzYXRvQHVzZXJzLnNv
dXJjZWZvcmdlLmpwPgo+IENjOiBMZXkgRm9vbiBUYW4gPGxleS5mb29uLnRhbkBpbnRlbC5jb20+
Cj4gQ2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KPiBDYzogU3RlZmFuIEtyaXN0
aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZpPgo+IENjOiBTdGFmZm9y
ZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiBDYzogSmFtZXMgRS5KLiBCb3R0b21sZXkgPEph
bWVzLkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVyc2hpcC5jb20+Cj4gQ2M6IEhlbGdlIERlbGxlciA8
ZGVsbGVyQGdteC5kZT4KPiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1
Pgo+IENjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+
Cj4gQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVsdXNAc2FtYmEub3JnPgo+IENjOiBQYXVsIFdhbG1z
bGV5IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gQ2M6IEplZmYgRGlrZSA8amRpa2VAYWRk
dG9pdC5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6
IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPiBDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBL
ZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJj
L2tlcm5lbC90cmFwcy5jICAgICAgfCA1IC0tLS0tCj4gIGFyY2gvYXJtL2tlcm5lbC90cmFwcy5j
ICAgICAgfCA1IC0tLS0tCj4gIGFyY2gvaDgzMDAva2VybmVsL3RyYXBzLmMgICAgfCA0IC0tLS0K
PiAgYXJjaC9oZXhhZ29uL2tlcm5lbC90cmFwcy5jICB8IDQgLS0tLQo+ICBhcmNoL25kczMyL2tl
cm5lbC90cmFwcy5jICAgIHwgNSAtLS0tLQo+ICBhcmNoL25pb3MyL2tlcm5lbC90cmFwcy5jICAg
IHwgNSAtLS0tLQo+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC90cmFwcy5jIHwgNSAtLS0tLQo+ICBh
cmNoL3BhcmlzYy9rZXJuZWwvdHJhcHMuYyAgIHwgNCAtLS0tCj4gIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvdHJhcHMuYyAgfCA1IC0tLS0tCgpBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVs
bGVybWFuLmlkLmF1PiAocG93ZXJwYykKCmNoZWVycwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=
