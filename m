Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 714C951323F
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 13:16:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4BB9C248C7;
	Thu, 28 Apr 2022 13:16:59 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 0EAB424165
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 13:16:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B17BBB82C97;
 Thu, 28 Apr 2022 11:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5483C385A0;
 Thu, 28 Apr 2022 11:16:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AFISBV20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651144613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wZt/PgkKwXTXAqwOl4KKM7MUuS9UOAFNQeMWZUUJCdQ=;
 b=AFISBV20YzQvFEl0QeYDno5OEzzztEe2UkmQeVyeWgL5Psdxmr0+MAFU7wNZqwRw2KpDRf
 LEbfw5D4imYpzT6uC2kjhUM1CU2cyn+sofNRnLXfRT0HV2rZcVSkGcMEZSoVRGHyKEVsvw
 NoQa2A0aDJfsYtRQfIgEE2ssrkWnJ9I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d9a994e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 11:16:52 +0000 (UTC)
Date: Thu, 28 Apr 2022 13:16:51 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <Ymp3owBiSQIimgSy@zx2c4.com>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec> <YmnaDUpVI5ihgvg6@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmnaDUpVI5ihgvg6@zx2c4.com>
Subject: Re: [OpenRISC] [Qemu-devel] [PATCH 2/7] target/openrisc: add
 shutdown logic
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGV5IGFnYWluLAoKT24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDI6MDQ6MjlBTSArMDIwMCwgSmFz
b24gQS4gRG9uZW5mZWxkIHdyb3RlOgo+IEJ5IHRoZSB3YXksIHdvdWxkIHRoaXMgYWxzbyBoZWxw
IHRoZSByZWJvb3QgY2FzZT8gVGhhdCdzCj4gYHJlYm9vdChSQl9BVVRPQk9PVCk7YCwgd2hpY2gg
ZG9lczoKPiAKPiBtYWNoaW5lX3Jlc3RhcnQoKSAtPgo+ICAgZG9fa2VybmVsX3Jlc3RhcnQoKSAt
Pgo+ICAgICBhdG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoJnJlc3RhcnRfaGFuZGxlcl9s
aXN0LCBuYikgLT4KPiAgICAgICA/Pz8KPiAKPiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgbm90aGlu
ZyBpcyB3aXJlZCBpbnRvIHRoZSByZWJvb3QgY2FzZSBmb3IKPiBPcGVuUklTQy4gSXMgdGhpcyBz
b21ldGhpbmcgdGhhdCBjb3VsZCBiZSBmaXhlZCBpbiB0aGUga2VybmVsIHdpdGhvdXQKPiBoYXZp
bmcgdG8gcGF0Y2ggUUVNVT8gSWYgc28sIHRoZW4gSSBjb3VsZCBlZmZlY3RpdmVseSBnZXQgc2h1
dGRvd24gZm9yCj4gbXkgQ0kgd2l0aCB0aGUgLW5vLXJlYm9vdCBvcHRpb24sIHdoaWNoIGlzIHdo
YXQgSSdtIGFscmVhZHkgZG9pbmcgZm9yIGEKPiBmZXcgcGxhdGZvcm1zLgoKSSBhZGRlZCAxMyBm
b3IgdGhpczogaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9waXBlcm1haWwvb3BlbnJpc2Mv
MjAyMi1BcHJpbC8wMDM4ODQuaHRtbAoKV2hlbiB5b3UgZ28gYWRkIHRoZXNlIG5vcHMgdG8gdGhl
IHNwZWNpZmljYXRpb24sIHBsZWFzZSByZW1lbWJlciB0byBhZGQKb25lIGZvciByZWJvb3QgdG9v
LiBUaGVuLCBvbmNlIHRoYXQga2VybmVsIGNvZGUgaXMgbWVyZ2VkIGFuZCB0aGUKc3BlY2lmaWNh
dGlvbiBwdWJsaXNoZWQsIGl0J2xsIGJlIHNlbnNpYmxlIHRvIGFkZCBzaHV0ZG93biBhbmQgcmVi
b290CnN1cHBvcnQgdG8gUUVNVSwgcGVyIFBldGVyJ3MgZGVzY3JpcHRpb24uCgpKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
