Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 22A26511CB2
	for <lists+openrisc@lfdr.de>; Wed, 27 Apr 2022 19:44:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C03D3248E7;
	Wed, 27 Apr 2022 19:44:11 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 4AE75247CB
 for <openrisc@lists.librecores.org>; Wed, 27 Apr 2022 19:44:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A55361E39;
 Wed, 27 Apr 2022 17:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED54C385A7;
 Wed, 27 Apr 2022 17:44:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GjW1JWis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651081445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3sCbwkCD6bnTFvErMggyKNiQtI/gtgftKGOV3ZZRiRQ=;
 b=GjW1JWisn3cjOlHYFvb9zLr2YUurC8J69Z3IkxIkNYPBFv7LAtJziaGXAl/m3ecXTXBtrE
 l+YX9byPsXEHQ4RUtC/JrV05xtwQMqQH+u3nimhWuzGWx1GlR/EXz4P+bMgx6QuxZXf+7M
 tuXQV9v/dlOlsDO4QC4u/uylCxXmqy4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 40aafe74
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 27 Apr 2022 17:44:05 +0000 (UTC)
Date: Wed, 27 Apr 2022 19:44:02 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YmmA4li384azQ2i9@zx2c4.com>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
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
Cc: openrisc@lists.librecores.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGV5IFN0YWZmb3JkLAoKT24gTW9uLCBBcHIgMTcsIDIwMTcgYXQgMDg6MjM6NTFBTSArMDkwMCwg
U3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gSW4gb3BlbnJpc2Mgc2ltdWxhdG9ycyB3ZSB1c2UgaG9v
a3MgbGlrZSAnbC5ub3AgMScgdG8gY2F1c2UgdGhlCj4gc2ltdWxhdG9yIHRvIGV4aXQuICBJbXBs
ZW1lbnQgdGhhdCBmb3IgcWVtdSB0b28uCj4gCj4gUmVwb3J0ZWQtYnk6IFdhbGRlbWFyIEJyb2Rr
b3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+CgpJJ20gY3VyaW91cyBhcyB0byB3aHkgdGhpcyBuZXZlciBnb3QgbWVy
Z2VkLiBJIG5vdGljZWQgSSdtIGVudGlyZWx5IGFibGUKdG8gc2h1dGRvd24gb3IgdG8gcmVib290
ICh3aGljaCBpcyBtb3N0bHkgd2hhdCBJIGNhcmUgYWJvdXQpIExpbnV4IGZyb20KT3BlblJJU0Mu
IEl0IGp1c3QgaGFuZ3MuCgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
