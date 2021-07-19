Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EE7FF3CCD37
	for <lists+openrisc@lfdr.de>; Mon, 19 Jul 2021 07:00:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A2FDE211CC;
	Mon, 19 Jul 2021 07:00:49 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 6F233211CC
 for <openrisc@lists.librecores.org>; Mon, 19 Jul 2021 07:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=fyy2cFtSOR6myZsJirx2R7GzmFZg7CatlnKUm7dPWT8=; b=Bm5SLGi5yCD9JyONTZfe4jxWfz
 oBKeEQKd5fVfZ9Z6G12IfrZ19uR1lCbc8ilgBXBa/ZX8Bo+WBw2R2LtP8vZrRcgH7FgXUekBkXu6C
 LcIUjRepZnwOkqggq12BPK6CqrWibTKHb7Z3DI7WJWf/aANlE6wjbWoIQ55Ux6xDE0iH4UxMeGXNo
 FvEqZN9RjnvHjI8gCtH7SSQ5xP6hP1qiU1UuT4cFbE1dSznweLy0Nfe8/eOtYbEbmqPIoNjHeKvRg
 coS7uLX0c+SMUP4nSbb4azOvj0adr8OIr8ehRBFC6BmRhowB2jvJxYos1zCt+mrN8zSgP9dQVbmZ0
 1lbajkfw==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5LOW-008Pne-L0; Mon, 19 Jul 2021 05:00:44 +0000
To: Stafford Horne <shorne@gmail.com>
References: <20210716022338.19342-1-rdunlap@infradead.org>
 <YPUCB7dSCHWrYHBl@antec>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <96469a3e-82b5-f2b1-c0ea-5975e85332ce@infradead.org>
Date: Sun, 18 Jul 2021 22:00:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPUCB7dSCHWrYHBl@antec>
Content-Language: en-US
Subject: Re: [OpenRISC] [PATCH] openrisc: rename or32 code & comments to or1k
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNy8xOC8yMSA5OjM5IFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBPbiBUaHUsIEp1bCAx
NSwgMjAyMSBhdCAwNzoyMzozOFBNIC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IEZyb20g
RG9jdW1lbnRhdGlvbi9vcGVucmlzYy90b2RvLnJzdCwgcmVuYW1lICJvcjMyIiBpbiB0aGUKPj4g
c291cmNlIGNvZGUgdG8gIm9yMWsiIHNpbmNlIHRoaXMgaXMgdGhlIG5hbWUgdGhhdCBoYXMgYmVl
bgo+PiBzZXR0bGVkIG9uLgo+IAo+IEhlbGxvLCB0aGUga2VybmVsIHRlc3Qgcm9ib3QgZm91bmQg
YSBidWlsZCBmYWlsdXJlIHdpdGggdGhpcy4KPiAKPiBXaWxsIHlvdSBzZW5kIHRoZSB1cGRhdGUg
Zm9yIHRoYXQ/Cj4gCgpIaSwKClRoZSByb2JvdCBwcm9ibGVtcyBhcmUgbm90IHJlbGF0ZWQgdG8g
dGhpcyBwYXRjaCAodGhleSB3ZXJlCnRoZXJlIGJlZm9yZSB0aGlzIHBhdGNoKSwgYnV0IEkgd2ls
bCBzZW5kIGFuIHVwZGF0ZSBpZiB5b3UgaW5zaXN0LgoKLS0gCn5SYW5keQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
