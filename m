Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 49DD03CCE6C
	for <lists+openrisc@lfdr.de>; Mon, 19 Jul 2021 09:22:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 008B4211CC;
	Mon, 19 Jul 2021 09:22:11 +0200 (CEST)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mail.librecores.org (Postfix) with ESMTPS id 4F893211CC
 for <openrisc@lists.librecores.org>; Mon, 19 Jul 2021 09:22:09 +0200 (CEST)
Received: by mail-pg1-f173.google.com with SMTP id 37so18155619pgq.0
 for <openrisc@lists.librecores.org>; Mon, 19 Jul 2021 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m013tVjjd3FsutSGPHw/Qu0fBmOj83kUfzuI09JP+FE=;
 b=ei63j6Cl4O3K7AjxUG8IoPNs5p6VRFYRuL6xijrihthX3xb09ujKW6ABMk+Yp7w/E9
 HH47PpOnO9Cfrt+VU8UaqdXh3zU0zVp6h+8zgLftXdbRwy3WAk1eYxS8hiGI+M6Yr5dI
 PmfEIa9k2b8L/2VP1ZQPL4VzdbygQSgtx1tKfUll3eJZqYwWB6iTsar53u5QmWuMITK5
 CRQKuIvZ+H8UcVoQk9P18/tPlipXuxE2oi4zo5Z27lz1qzwg7FlokDOVLufr7O9mr5cD
 Tnywfacq59Nt5Z4Ec+7tiuJqL09VWLFWflhnTUgX1n3rqmf1iCnXS9ohXXGzB+iQ48Me
 U+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m013tVjjd3FsutSGPHw/Qu0fBmOj83kUfzuI09JP+FE=;
 b=BY3hQGvoCrN0KNt5SRguJqBqzlhXTLbtZFByc/4gAj/lKkZNTiYK6e1YAClE1OXXKi
 Sh2I0ieblHquVvGUrIXqUvTUK/eCnlmQ64zopvl4zxUiduNdkiIARIylKKoD6WTA9nGg
 LjYaTzNkwnDA/wSmsEyXcX/0STRCF78mPkHm4XsxOqAUO23jIKX40cm8eBT3yQlxWQnD
 WGgLYoh2ZuT/CHD8PP0y9rfLA2IjPIPh09yO2jtDMw2iNbfQY7ORjXnANdLM6sU6/A9a
 xycsW7eLlBpwIMD8R6K1EaRnK/AMQ00lFhfj0SdWrXlwGtj6//6p8AIBquCazyVWdQQW
 3ntw==
X-Gm-Message-State: AOAM533V/w+Y1TtdyFDwSL+giHT4gaHtDHgZp+U4lgsncJmIGnwPqZJc
 nvMNBoXeY6tGJTl8EDo8IPE=
X-Google-Smtp-Source: ABdhPJyCSzVs/JgE9YiOABMeV+47aiIlcnpmGWTcjX6ogapVi1cYpeL/hPjjCIOSKiqrEt4Q8htVwA==
X-Received: by 2002:a63:794:: with SMTP id 142mr23897510pgh.344.1626679327808; 
 Mon, 19 Jul 2021 00:22:07 -0700 (PDT)
Received: from localhost (g142.61-125-55.ppp.wakwak.ne.jp. [61.125.55.142])
 by smtp.gmail.com with ESMTPSA id x30sm18533897pfh.126.2021.07.19.00.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 00:22:07 -0700 (PDT)
Date: Mon, 19 Jul 2021 16:22:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YPUoHZ57b00bT0Hz@antec>
References: <20210716022338.19342-1-rdunlap@infradead.org>
 <YPUCB7dSCHWrYHBl@antec>
 <96469a3e-82b5-f2b1-c0ea-5975e85332ce@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96469a3e-82b5-f2b1-c0ea-5975e85332ce@infradead.org>
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

T24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMTA6MDA6NDJQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+IE9uIDcvMTgvMjEgOTozOSBQTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBPbiBU
aHUsIEp1bCAxNSwgMjAyMSBhdCAwNzoyMzozOFBNIC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6
Cj4gPj4gRnJvbSBEb2N1bWVudGF0aW9uL29wZW5yaXNjL3RvZG8ucnN0LCByZW5hbWUgIm9yMzIi
IGluIHRoZQo+ID4+IHNvdXJjZSBjb2RlIHRvICJvcjFrIiBzaW5jZSB0aGlzIGlzIHRoZSBuYW1l
IHRoYXQgaGFzIGJlZW4KPiA+PiBzZXR0bGVkIG9uLgo+ID4gCj4gPiBIZWxsbywgdGhlIGtlcm5l
bCB0ZXN0IHJvYm90IGZvdW5kIGEgYnVpbGQgZmFpbHVyZSB3aXRoIHRoaXMuCj4gPiAKPiA+IFdp
bGwgeW91IHNlbmQgdGhlIHVwZGF0ZSBmb3IgdGhhdD8KPiA+IAo+IAo+IEhpLAo+IAo+IFRoZSBy
b2JvdCBwcm9ibGVtcyBhcmUgbm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCAodGhleSB3ZXJlCj4g
dGhlcmUgYmVmb3JlIHRoaXMgcGF0Y2gpLCBidXQgSSB3aWxsIHNlbmQgYW4gdXBkYXRlIGlmIHlv
dSBpbnNpc3QuCgpObyBwcm9ibGVtLCAgSSBkaWRuJ3QgaW52ZXN0aWdhdGUgYnV0IGp1c3QgdGhv
dWdodCB5b3UgaGFkIG1pc3NlZCByZW5hbWluZwpzb21ldGhpbmcuICBJbiB0aGF0IGNhc2UgSSB3
aWxsIHF1ZXVlIHRoaXMgYW5kIGFsc28gbG9vayBpbnRvIGZpeGluZyB0aGUgcm9ib3QKd2Fybmlu
Zy4KClRoYW5rIHlvdQoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
