Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 399725181DD
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 12:00:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D3138248E7;
	Tue,  3 May 2022 12:00:05 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 4E07323E0C
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 12:00:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3999061047;
 Tue,  3 May 2022 10:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202F0C385A4;
 Tue,  3 May 2022 10:00:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NlAHw9iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651572000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N6GpZA6+9xFIYJgpxB8LKvrNC6uerwpxIw13pm9Qp8w=;
 b=NlAHw9iwVZccF6u8VYgzqpfFackaNr368UfxJoMEnDkQ7ImBhQvuJaRxLLiIgnQYkYXvGk
 SZK2OeFxpUhLcaaNwhX8fxEVYFjY4CKpwLwLU/tdQyoamPcZgQPrCsjUYkfN7c6ng+lkHZ
 jNWAKKDDOy6pCc6+Kk+Cmq5jr1c50Eo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dd9b6c02
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 May 2022 09:59:59 +0000 (UTC)
Date: Tue, 3 May 2022 11:59:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YnD9HZNm0Sph1hLr@zx2c4.com>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
 <YnDzoWHqpYcCWTVs@antec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnDzoWHqpYcCWTVs@antec>
Subject: Re: [OpenRISC] [PATCH] hw/openrisc: use right OMPIC size variable
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
Cc: openrisc@lists.librecores.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMDMsIDIwMjIgYXQgMDY6MTk6MjlQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gTW9uLCBNYXkgMDIsIDIwMjIgYXQgMDQ6NTk6NDdQTSAtMDcwMCwgUmljaGFy
ZCBIZW5kZXJzb24gd3JvdGU6Cj4gPiBPbiA1LzIvMjIgMTY6MjgsIEphc29uIEEuIERvbmVuZmVs
ZCB3cm90ZToKPiA+ID4gVGhpcyBhcHBlYXJzIHRvIGJlIGEgY29weSBhbmQgcGFzdGUgZXJyb3Iu
IFRoZSBVQVJUIHNpemUgd2FzIHVzZWQKPiA+ID4gaW5zdGVhZCBvZiB0aGUgbXVjaCBzbWFsbGVy
IE9NUElDIHNpemUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBLiBEb25lbmZl
bGQ8SmFzb25AengyYzQuY29tPgo+ID4gPiAtLS0KPiA+ID4gICBody9vcGVucmlzYy9vcGVucmlz
Y19zaW0uYyB8IDIgKy0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgo+IAo+IFRoYW5rcywKPiAKPiBJIHdpbGwgcXVldWUg
dGhpcyBvbmUuCj4gClBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUgdjIgSSBwb3N0ZWQgaW5zdGVh
ZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
