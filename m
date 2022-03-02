Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 27A0F4C9D17
	for <lists+openrisc@lfdr.de>; Wed,  2 Mar 2022 06:23:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BE4F624847;
	Wed,  2 Mar 2022 06:23:14 +0100 (CET)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by mail.librecores.org (Postfix) with ESMTPS id A99DE2483E
 for <openrisc@lists.librecores.org>; Wed,  2 Mar 2022 06:23:13 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7jF46rSmz4xRC;
 Wed,  2 Mar 2022 16:23:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646198587;
 bh=EW7h6GpdaDNbwZGHiZAaI3MdXFwBu2xEgtf+Ok1PZlA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lWhC32dAUg9E3iB13asSEl3IGZdK/c28/Ypzl2ddkzEYQ3djbYgWlSP3RyJhpm5Na
 6qopH8SJWhUAcDxKZHVagvJoSIHYAL4wLxhu95pHGQSKM9mi+uqCLIDS48jN2SCDr8
 3hW1xyBgxsMtocUFA6uizbi9419Ant/1MjMx8tlYLZfUCZ6xeurWURO+6ZM4F85NEb
 XIbzne9+sy6yQbCkbNp0yFSeKJEoh6kBSZkPqvm9y4RngtUzavUWU8gPBqd3K3fTkW
 Seaz2Wd9JXTkWB5MzPd1wTj1GT7JiQk11vWz+fU7pXT7m04tdpff9zfHDEBHGpyTac
 +s8dkQbww3zeg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
In-Reply-To: <1646045273-9343-5-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-5-git-send-email-anshuman.khandual@arm.com>
Date: Wed, 02 Mar 2022 16:23:02 +1100
Message-ID: <87k0ddnd1l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Subject: Re: [OpenRISC] [PATCH V3 04/30] powerpc/mm: Enable
 ARCH_HAS_VM_GET_PAGE_PROT
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+IHdyaXRlczoKPiBU
aGlzIGRlZmluZXMgYW5kIGV4cG9ydHMgYSBwbGF0Zm9ybSBzcGVjaWZpYyBjdXN0b20gdm1fZ2V0
X3BhZ2VfcHJvdCgpIHZpYQo+IHN1YnNjcmliaW5nIEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1Qu
IFN1YnNlcXVlbnRseSBhbGwgX19TWFhYIGFuZCBfX1BYWFgKPiBtYWNyb3MgY2FuIGJlIGRyb3Bw
ZWQgd2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuIFdoaWxlIGhlcmUsIHRoaXMgYWxzbwo+IGxv
Y2FsaXplcyBhcmNoX3ZtX2dldF9wYWdlX3Byb3QoKSBhcyBwb3dlcnBjX3ZtX2dldF9wYWdlX3By
b3QoKSBhbmQgbW92ZXMKPiBpdCBuZWFyIHZtX2dldF9wYWdlX3Byb3QoKS4KPgo+IENjOiBNaWNo
YWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IFBhdWwgTWFja2VycmFzIDxw
YXVsdXNAc2FtYmEub3JnPgo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IENj
OiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4g
S2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJw
Yy9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9tbWFuLmggICAgfCAxMiAtLS0tLS0KPiAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFi
bGUuaCB8IDE5IC0tLS0tLS0tLS0KPiAgYXJjaC9wb3dlcnBjL21tL21tYXAuYyAgICAgICAgICAg
ICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQs
IDYwIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IE1pY2hhZWwgRWxs
ZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gKHBvd2VycGMpCgpjaGVlcnMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
