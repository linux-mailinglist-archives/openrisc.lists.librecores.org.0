Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA2025ED03
	for <lists+openrisc@lfdr.de>; Sun,  6 Sep 2020 08:15:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C84E720844;
	Sun,  6 Sep 2020 08:15:49 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 4A40C20844
 for <openrisc@lists.librecores.org>; Sun,  6 Sep 2020 08:15:47 +0200 (CEST)
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65E122075A;
 Sun,  6 Sep 2020 06:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599372944;
 bh=3LOzpkhgg7KndiUMcaG1D3PMxKGP2Vve0vOfAnOeF+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K7efverp7pmqiAfzOuuPfYV/lyxn0zRTAEi7F3ORrVZGDSe+Lqv4FEP9x8LEjuyNA
 EgWjpDORzBb5XuR79NYIC3K/fSSa9VElLmWEXzCMedaqpkCmY9szpekWioUB0e+IFf
 sh39eedkR97+lUds13+pQwxoFCYMOtPHIbZKR9C0=
Date: Sun, 6 Sep 2020 09:15:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200906061538.GB1213823@kernel.org>
References: <20200905131935.972386-1-shorne@gmail.com>
 <20200905131935.972386-2-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905131935.972386-2-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v2 1/3] openrisc: Reserve memblock for initrd
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMTA6MTk6MzNQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gUmVjZW50bHkgT3BlblJJU0MgYWRkZWQgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgaW5p
dHJkIGltYWdlcywgYnV0IEkgZm91bmQKPiBzb21lIGluc3RhYmlsaXR5IHdoZW4gdXNpbmcgbGFy
Z2VyIGJ1aWxkcm9vdCBpbml0cmQgaW1hZ2VzLiBJdCB0dXJuZWQKPiBvdXQgdGhhdCBJIGZvcmdv
dCB0byByZXNlcnZlIHRoZSBtZW1ibG9jayBzcGFjZSBmb3IgdGhlIGluaXRyZCBpbWFnZS4KPiAK
PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpbnN0YWJpbGl0eSBpc3N1ZSBieSByZXNlcnZpbmcgbWVt
YmxvY2sgc3BhY2UuCj4gCj4gRml4ZXM6IGZmNmM5MjNkYmVjMyAoIm9wZW5yaXNjOiBBZGQgc3Vw
cG9ydCBmb3IgZXh0ZXJuYWwgaW5pdHJkIGltYWdlcyIpCj4gU2lnbmVkLW9mZi1ieTogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogTWlrZSBSYXBvcG9ydCA8
cnBwdEBsaW51eC5pYm0uY29tPgoKPiAtLS0KPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAu
YyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmMKPiBpbmRleCBiMThlNzc1ZjhiZTMuLjEzYzg3ZjFmODcyYiAxMDA2
NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvc2V0dXAuYwo+IEBAIC04MCw2ICs4MCwxNiBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgc2V0dXBfbWVtb3J5KHZvaWQpCj4gIAkgKi8KPiAgCW1lbWJsb2NrX3Jlc2VydmUoX19wYShf
c3RleHQpLCBfZW5kIC0gX3N0ZXh0KTsKPiAgCj4gKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklU
UkQKPiArCS8qIFRoZW4gcmVzZXJ2ZSB0aGUgaW5pdHJkLCBpZiBhbnkgKi8KPiArCWlmIChpbml0
cmRfc3RhcnQgJiYgKGluaXRyZF9lbmQgPiBpbml0cmRfc3RhcnQpKSB7Cj4gKwkJdW5zaWduZWQg
bG9uZyBhbGlnbmVkX3N0YXJ0ID0gQUxJR05fRE9XTihpbml0cmRfc3RhcnQsIFBBR0VfU0laRSk7
Cj4gKwkJdW5zaWduZWQgbG9uZyBhbGlnbmVkX2VuZCA9IEFMSUdOKGluaXRyZF9lbmQsIFBBR0Vf
U0laRSk7Cj4gKwo+ICsJCW1lbWJsb2NrX3Jlc2VydmUoX19wYShhbGlnbmVkX3N0YXJ0KSwgYWxp
Z25lZF9lbmQgLSBhbGlnbmVkX3N0YXJ0KTsKPiArCX0KPiArI2VuZGlmIC8qIENPTkZJR19CTEtf
REVWX0lOSVRSRCAqLwo+ICsKPiAgCWVhcmx5X2luaXRfZmR0X3Jlc2VydmVfc2VsZigpOwo+ICAJ
ZWFybHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsKPiAgCj4gLS0gCj4gMi4yNi4yCj4g
CgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
