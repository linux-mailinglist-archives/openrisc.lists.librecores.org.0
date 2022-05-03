Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD81518031
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 10:54:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DAABA23E0C;
	Tue,  3 May 2022 10:54:50 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 00F81247E5
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 10:54:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3F756128D;
 Tue,  3 May 2022 08:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF748C385A4;
 Tue,  3 May 2022 08:54:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=zx2c4.com header.i=@zx2c4.com header.b="b4ipqw2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651568084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UadzwdyTPAXDsdMBLEUAPEXbwWfoUKoOfbRoM8Rb0RI=;
 b=b4ipqw2JKXpiCxJlvRmvUQa7M2XfgLsFpXcJ5TLiNXXhyZQOR34nOqPh7KEnYGO74kOLI4
 WNikGPxD/srFw/o+A/PIbtuS9hCzX+WrQYusYQzRS9iQC0gPdzWt2NZXotrJFHlyn4fzcM
 KYAfDcS2i46sHYFsnNv4QMarCjO7u7k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4be660f1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 May 2022 08:54:44 +0000 (UTC)
Date: Tue, 3 May 2022 10:54:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <YnDt0YZK3aG3y8Tl@zx2c4.com>
References: <20220502225230.237369-1-Jason@zx2c4.com>
 <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
Subject: Re: [OpenRISC] [PATCH] target/openrisc: implement shutdown and
 reset helpers
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
Cc: openrisc@lists.librecores.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXkgMDIsIDIwMjIgYXQgMDQ6NTc6NDNQTSAtMDcwMCwgUmljaGFyZCBIZW5kZXJz
b24gd3JvdGU6Cj4gT24gNS8yLzIyIDE1OjUyLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4g
PiBPcGVuUklTQyBkZWZpbmVzIHZhcmlvdXMgbm9wIGluc3RydWN0aW9ucyBpbiBvcjFrIGFzIG1l
YW5pbmcgc2h1dGRvd24gb3IKPiA+IHJlc2V0LiBJbXBsZW1lbnQgdGhlc2UgaW4gVENHLiBUaGlz
IGhhcyBiZWVuIHRlc3RlZCB3aXRoIExpbnV4IGFuZAo+ID4gY29uZmlybWVkIHRvIHdvcmsuCj4g
Cj4gTm8sIE9wZW5SSVNDIGRvZXMgbm90IGRlZmluZSB2YXJpb3VzIG5vcCBpbnN0cnVjdGlvbnMs
IGV0Yy4KPiAKPiBPcGVuUklTQyBkZWZpbmVzIGEgUG93ZXIgTWFuYWdlbWVudCBSZWdpc3RlciB0
byBoYW5kbGUgZG96ZSBhbmQgc3VzcGVuZDsgdGhlcmUgaXMgbm8gCj4gc3BlY2lmaWNhdGlvbiBm
b3Igc2h1dGRvd24gb3IgcmVzZXQuCj4gCj4gU2VlIGh0dHBzOi8vb3BlbnJpc2MuaW8vYXJjaGl0
ZWN0dXJlCgoKU3RhZmZvcmQgaXMgaW4gdGhlIHByb2Nlc3Mgb2YgZG9jdW1lbnRpbmcvc3BlYydp
bmcgdGhlIG5vcCBzdHVmZi4KCj4gCj4gCj4gcn4KPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
